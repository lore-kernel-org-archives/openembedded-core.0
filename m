Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuSsu-0002km-0H for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 19:29:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JHOphe030696
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 18:24:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28745-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 18:24:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JHOeWu030690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 18:24:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4MaaydRfb0YCgXOF1NGZbVcGV3Z+iEAo_qqtxSz57rdyw@mail.gmail.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
	<e7036174cf607031e13323564f402c7b805e4572.1313730559.git.bruce.ashfield@windriver.com>
	<1313746981.6733.268.camel@phil-desktop>
	<CADkTA4MaaydRfb0YCgXOF1NGZbVcGV3Z+iEAo_qqtxSz57rdyw@mail.gmail.com>
Date: Fri, 19 Aug 2011 10:24:38 -0700
Message-ID: <1313774678.13995.123.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] linux-yocto: restoring LINUX_VERSION ?= "3.0"
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
X-List-Received-Date: Fri, 19 Aug 2011 17:29:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-19 at 08:53 -0400, Bruce Ashfield wrote:
> On Fri, Aug 19, 2011 at 5:43 AM, Phil Blundell <philb@gnu.org> wrote:
> > On Fri, 2011-08-19 at 01:20 -0400, Bruce Ashfield wrote:
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> >> index 44f1ebe..5d9871f 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> >> @@ -11,7 +11,7 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
> >>  KBRANCH = ${KMACHINE}
> >>  KMETA = meta
> >>
> >> -LINUX_VERSION ?= "3.0.1"
> >> +LINUX_VERSION ?= "3.0"
> >>  LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
> >>
> >>  SRCREV_machine_qemuarm = "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"
> >
> > That's going to cause PV to go backwards, right?  If you're going to do
> > that then you probably ought to consider bumping PE to retain
> > monotonicity.
> 
> Indeed. I always just think of LINUX_VERSION as yet another package internal
> variable (from non-bitbake experience), so tweaking it has no impact
> on this sort
> of thing.
> 
> I can look into changing the epoch .. but not until Monday or later in
> the weekend.

I'm not 100% convinced that this is a good idea. I'd really prefer the
kernel accurately reflected the version it was. Can we not do:

PREFERRRED_VERSION_xxx = "3.0%"

to get around the preferred version issues?

Cheers,

Richard



