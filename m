Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TA2Ft-00084Y-SC for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 19:22:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87H9gAN031473;
	Fri, 7 Sep 2012 18:09:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30887-05; Fri,  7 Sep 2012 18:09:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87H9Vdp031467
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 7 Sep 2012 18:09:32 +0100
Message-ID: <1347037772.8619.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 07 Sep 2012 18:09:32 +0100
In-Reply-To: <CAJTo0LYnG1BdZ=UkKPWju7UwBZWjEJhQ_svmO4bVwaSL1ZGGkA@mail.gmail.com>
References: <1347033943.8619.0.camel@ted> <504A21A5.7000309@windriver.com>
	<CAJTo0LYnG1BdZ=UkKPWju7UwBZWjEJhQ_svmO4bVwaSL1ZGGkA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 17:22:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 17:42 +0100, Burton, Ross wrote:
> On 7 September 2012 17:32, Mark Hatle <mark.hatle@windriver.com> wrote:
> > I'm curious, is there any [easy] way we can force a rerun of configure as a
> > test pass over the system?
> >
> > I'd like a way to verify that both this patch works as expected, and future
> > recipes work as expected.  (It would also be nice to test the things that
> > don't use the autotools.bbclass..)
> 
> Yeah, I expect we'll discover some cases when upstream just don't
> expect a distclean.  By generally taking from git and re-running the
> entire autotools we *should* be okay, but...

Further testing suggests we either going to need a whitelist or a
blacklist for this :/

The key places people get bitten are eglibc and gcc so those should be
straight forward to test, the question is how widely to deploy this
initially. I think the mechanism is good, its now just a question of the
implementation detail.

FWIW, libgpg-error fails with checksum issues (checksumming a generated
file?!) and libtool has issues about cleaning directories that have
makefiles that were never generated...

Cheers,

Richard





