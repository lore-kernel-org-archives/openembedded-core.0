Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T22eD-0005Gr-K5 for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 18:10:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7GFwDRl032384;
	Thu, 16 Aug 2012 16:58:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32336-01; Thu, 16 Aug 2012 16:58:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7GFw4i9032375
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 16 Aug 2012 16:58:06 +0100
Message-ID: <1345132684.14667.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 16 Aug 2012 16:58:04 +0100
In-Reply-To: <502D12E2.4000808@windriver.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
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
X-List-Received-Date: Thu, 16 Aug 2012 16:10:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 11:33 -0400, Bruce Ashfield wrote:
> On 12-08-13 10:17 PM, Liang Li wrote:
> > Hi Richard,
> >
> > Ping ...
> >
> > Hopefully you could recall sufficient context from this thread about
> > the 'include path for slang.h' cause compile error issue that we are
> > trying to fix here.
> 
> Bump.
> 
> I'm holding off on merging a kernel patch for this while this is still
> outstanding.
> 
> Can I distill this into the following (in the hope of resolving it).
> 
>    - do we want to fix this problem for all kernels, or just the linux-yocto
>      ones ? And by 'fix', I mean without the requirement of porting
>      a kernel patch to older recipes.

I propose we add a sed expression to the general kernel do_install which
changes the -I/usr/include/slang -> -I=/usr/include/slang. That should
be generic, acceptable to upstream and fixes all kernel versions.

Comments?

Cheers,

Richard



