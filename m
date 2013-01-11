Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TtgVu-00082m-Ow for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 16:27:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0BFC539018269;
	Fri, 11 Jan 2013 15:12:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02957-10; Fri, 11 Jan 2013 15:12:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0BFBvE3018263
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 11 Jan 2013 15:11:58 GMT
Message-ID: <1357917120.4072.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jan 2013 15:12:00 +0000
In-Reply-To: <1357862392.4072.3.camel@ted>
References: <1357843361-18125-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LaWTPXh9Ph+LFMK+44t3T+TN-uZXXEwJg7yoOmcUZCL1A@mail.gmail.com>
	<1357862392.4072.3.camel@ted>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] connman: upgrade to 1.10
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
X-List-Received-Date: Fri, 11 Jan 2013 15:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-10 at 23:59 +0000, Richard Purdie wrote:
> On Thu, 2013-01-10 at 20:26 +0000, Burton, Ross wrote:
> > On 10 January 2013 18:42, Cristian Iorga <cristian.iorga@intel.com> wrote:
> > > 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
> > >     - adapted to the new version
> > >
> > > 0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
> > >     - patch removed (it is included in the new version)
> > >
> > > inet-fix-ip-cleanup-functions.patch: added
> > >     - fix for ip cleanup functions
> > >
> > > Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > 
> > Also document the point of connman-conf.
> > 
> > > diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> > > index 5d59a7f..41fe552 100644
> > > --- a/meta/conf/machine/include/qemu.inc
> > > +++ b/meta/conf/machine/include/qemu.inc
> > > @@ -10,6 +10,8 @@ XSERVER ?= "xserver-xorg \
> > >
> > >  MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
> > >
> > > +MACHINEOVERRIDES .= ":qemu"
> > > +
> > 
> > Please submit this as a separate patch, it's effectively unrelated to connman.
> 
> Please don't use "qemu", use something like qemuall or allqemu since I
> have some thoughts about how this might interact with the qemu class,
> most involving the word "badly" ;-).

Saul included this change in MUT on the autobuilders. I've just lost a
load of time wondering why we had an odd world autobuilder failure:

http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/439/steps/shell_43/logs/stdio

This override patch was why :(.

Cheers,

Richard



