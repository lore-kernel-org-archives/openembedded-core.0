Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SK62v-0007TR-VH for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 12:54:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3HAieD9011935
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 11:44:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11508-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 11:44:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3HAiVrt011929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 11:44:32 +0100
Message-ID: <1334659475.616.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Apr 2012 11:44:35 +0100
In-Reply-To: <F744A0A9-A640-4453-8119-18D2DF60364E@dominion.thruhere.net>
References: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
	<F744A0A9-A640-4453-8119-18D2DF60364E@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] busybox: move watch to /usr/bin for compatibility with procps
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
X-List-Received-Date: Tue, 17 Apr 2012 10:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-17 at 11:40 +0200, Koen Kooi wrote:
> Ping

It merged three weeks ago:

http://git.openembedded.org/openembedded-core/commit/?id=fa8b2d2bed63fa4fc2af45f094998b0f9e69d272

?

Cheers,

Richard


> Op 24 mrt. 2012, om 20:46 heeft Andreas Oberritter het volgende geschreven:
> 
> > Commit 68dc2a3fa30c03a196d650de34d0c657a7b85454 broke opkg upgrade:
> > 
> > | update-alternatives: Error: cannot register alternative watch to
> > | /usr/bin/watch since it is already registered to /bin/watch
> > 
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> > * Martin, can you please verify whether this really helps? I've built a
> >  rootfs with both busybox watch and procps installed. I didn't actually
> >  do an opkg upgrade.
> > 
> > .../busybox/busybox-1.19.4/watch.in.usr-bin.patch  |   29 ++++++++++++++++++++
> > meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
> > 2 files changed, 31 insertions(+), 1 deletions(-)
> > create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> > 
> > diff --git a/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> > new file mode 100644
> > index 0000000..e8e1edf
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> > @@ -0,0 +1,29 @@
> > +Upstream-Status: Inappropriate [configuration]
> > +
> > +From f2372ab626a395d067704f4c318180fb6039de15 Mon Sep 17 00:00:00 2001
> > +From: Andreas Oberritter <obi@opendreambox.org>
> > +Date: Sat, 24 Mar 2012 17:36:48 +0100
> > +Subject: [PATCH] watch: move from /bin to /usr/bin for compatibility with
> > + procps
> > +
> > +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > +---
> > + include/applets.src.h |    2 +-
> > + 1 files changed, 1 insertions(+), 1 deletions(-)
> > +
> > +diff --git a/include/applets.src.h b/include/applets.src.h
> > +index 87d9cbb..c148a8c 100644
> > +--- a/include/applets.src.h
> > ++++ b/include/applets.src.h
> > +@@ -404,7 +404,7 @@ IF_VLOCK(APPLET(vlock, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
> > + IF_VOLNAME(APPLET(volname, BB_DIR_USR_BIN, BB_SUID_DROP))
> > + /* Needs to be run by root or be suid root - needs to write to /dev/TTY: */
> > + IF_WALL(APPLET(wall, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
> > +-IF_WATCH(APPLET(watch, BB_DIR_BIN, BB_SUID_DROP))
> > ++IF_WATCH(APPLET(watch, BB_DIR_USR_BIN, BB_SUID_DROP))
> > + IF_WATCHDOG(APPLET(watchdog, BB_DIR_SBIN, BB_SUID_DROP))
> > + IF_WC(APPLET(wc, BB_DIR_USR_BIN, BB_SUID_DROP))
> > + IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
> > +-- 
> > +1.7.5.4
> > +
> > diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
> > index dff616d..3f22669 100644
> > --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
> > @@ -1,5 +1,5 @@
> > require busybox.inc
> > -PR = "r0"
> > +PR = "r1"
> > 
> > SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> >            file://udhcpscript.patch \
> > @@ -8,6 +8,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> >            file://get_header_tar.patch \
> >            file://busybox-appletlib-dependency.patch \
> >            file://run-parts.in.usr-bin.patch \
> > +           file://watch.in.usr-bin.patch \
> >            file://busybox-udhcpc-no_deconfig.patch \
> >            file://find-touchscreen.sh \
> >            file://busybox-cron \
> > -- 
> > 1.7.5.4
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 




