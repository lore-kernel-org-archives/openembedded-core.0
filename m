Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THLx0-0002H1-RH for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 23:48:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RLa04d004201;
	Thu, 27 Sep 2012 22:36:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03933-01; Thu, 27 Sep 2012 22:35:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RLZqn1004195
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 27 Sep 2012 22:35:53 +0100
Message-ID: <1348781754.15753.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Thu, 27 Sep 2012 22:35:54 +0100
In-Reply-To: <1348780727.4422.12.camel@x121e.pbcl.net>
References: <1348467993.4444.252.camel@x121e.pbcl.net>
	<1348476693.10108.221.camel@ted>
	<1348479655.31293.19.camel@phil-desktop>
	<1348480442.4486.3.camel@ted> <1348780727.4422.12.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Avoid staging the same binaries again and again
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
X-List-Received-Date: Thu, 27 Sep 2012 21:48:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-27 at 22:18 +0100, Phil Blundell wrote:
> On Mon, 2012-09-24 at 10:54 +0100, Richard Purdie wrote:
> > sysroot_stage_* are symmetrical so I can't imagine this happening.
> > 
> > The main worry would be something happening before sysroot_stage_all.
> > SYSROOT_PREPROCESS_FUNCS happen afterwards so there is at least a hook
> > used in most cases that would avoid the issue.
> > 
> > I'm torn whether its better to be simple or less fragile in this case.
> > Or simply do some tests (if ${bindir} != ${sbindir}) and so on.
> 
> I'm not quite sure what the conclusion was from this previous
> discussion.  Did you want me to redo the patch to work in some other
> way?

The release is now at -rc2 and this patch hasn't reached the threshold
of things I'm willing to take. I've tried to at least get some of the
patches you're posted in but I wish we'd had them a couple of weeks
ago :/.

I also wish we could find some neater/simpler way of doing this since
I'm not a fan of "obscuring" the code more than we have to. I'm not
coming up with any great ways of doing it though.

Cheers,

Richard



