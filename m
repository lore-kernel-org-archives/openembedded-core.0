Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QszzC-0006KE-V6 for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 18:25:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FGLJmt018404;
	Mon, 15 Aug 2011 17:21:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17517-09; Mon, 15 Aug 2011 17:21:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FGL9aY018398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 15 Aug 2011 17:21:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke@linux.intel.com>
In-Reply-To: <4E492C11.5040800@linux.intel.com>
References: <cover.1313328487.git.ke.yu@intel.com>
	<fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
	<73BE3575-4FA5-4C20-9476-A36B9A5422D7@dominion.thruhere.net>
	<4E491589.3030000@linux.intel.com> <1313414185.14274.576.camel@rex>
	<4E492C11.5040800@linux.intel.com>
Date: Mon, 15 Aug 2011 17:21:06 +0100
Message-ID: <1313425266.14274.598.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-cross-intermediate: revise the 64bithack.patch for multilib case
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2011 16:25:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 22:24 +0800, Yu Ke wrote:
> On 2011/8/15 21:16, Richard Purdie wrote:
> > On Mon, 2011-08-15 at 20:48 +0800, Yu Ke wrote:
> >> On 2011/8/15 1:31, Koen Kooi wrote:
> >>>
> >>> Op 14 aug. 2011, om 15:32 heeft Yu Ke het volgende geschreven:
> >>>
> >>>> current gcc-cross-intermediate has build failure in qemux86-64 lib64
> >>>> multilib case. the reason is that it still use lib instead of lib64
> >>>> while do_install use the libdir i.e. lib64
> >>>>
> >>>> so this patch fix this issue by making gcc honour the libdir.
> >>>>
> >>>> CC: Kumar Gala<galak@kernel.crashing.org>
> >>>> CC: Richard Purdie<richard.purdie@linuxfoundation.org>
> >>>>
> >>>> Signed-off-by: Yu Ke<ke.yu@intel.com>
> >>>> ---
> >>>> meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
> >>>> meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   16 +++++++++-------
> >>>
> >>> wouldn't gcc 4.5 need a similar change?
> >>
> >> yes, gcc 4.5 should also has this change. I will sent out another patch
> >> for this.
> >
> > Please take a look at:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/ml4&id=4de8e0e9c286ff64f1b7fd2e695fe2d62fdadfbd
> 
> Thanks. it is more comprehensive. just a small issue, the parentheses 
> looks mismatching in
> 
> ++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir) ../$(shell 
> basename $(base_libdir)

Right, I've just noticed my test build was failing and that is likely
why :)

> > I've updated the patch header and ensured that whichever compiler
> > options are used, the compiler works as expected and also applied this
> > to mips and pcc.
> >
> > Could you also please open a bug about target gcc multilib as mentioned
> > in the patch header (targeted at post 1.1).
> 
> done. http://bugzilla.yoctoproject.org/show_bug.cgi?id=1369

Great, thanks.

Cheers,

Richard



