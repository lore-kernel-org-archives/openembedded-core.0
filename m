Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7bXa-0005nq-7W for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 00:54:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DNjLhf001204
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:45:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31871-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:45:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DNjCCT001197
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:45:14 GMT
Message-ID: <1331682312.18586.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 23:45:12 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] xorg-cf-files: Fix unpackaged files warning
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
X-List-Received-Date: Tue, 13 Mar 2012 23:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This fixes the warnings:

WARNING: For recipe xorg-cf-files, the following files/directories were installed but not shipped in any package:
WARNING:   /usr
WARNING:   /usr/lib
WARNING:   /usr/lib/X11
WARNING:   /usr/lib/X11/config
WARNING:   /usr/lib/X11/config/mingw.rules
WARNING:   /usr/lib/X11/config/Oki.cf
WARNING:   /usr/lib/X11/config/cray.cf
WARNING:   /usr/lib/X11/config/OpenBSD.cf
WARNING:   /usr/lib/X11/config/lnxdoc.tmpl
WARNING:   /usr/lib/X11/config/Motif.rules
WARNING:   /usr/lib/X11/config/nec.cf
WARNING:   /usr/lib/X11/config/sv3Lib.rules
WARNING:   /usr/lib/X11/config/sco5.cf
WARNING:   /usr/lib/X11/config/xorgsite.def
WARNING:   /usr/lib/X11/config/minix.cf
WARNING:   /usr/lib/X11/config/cross.rules
WARNING:   /usr/lib/X11/config/bsdi.cf
WARNING:   /usr/lib/X11/config/ServerLib.tmpl
WARNING:   /usr/lib/X11/config/sequentLib.rules
WARNING:   /usr/lib/X11/config/darwin.cf
WARNING:   /usr/lib/X11/config/version.def
WARNING:   /usr/lib/X11/config/scoLib.rules
WARNING:   /usr/lib/X11/config/OpenBSDLib.tmpl
WARNING:   /usr/lib/X11/config/hpLib.tmpl
WARNING:   /usr/lib/X11/config/xf86.tmpl
WARNING:   /usr/lib/X11/config/moto.cf
WARNING:   /usr/lib/X11/config/sv4Lib.tmpl
WARNING:   /usr/lib/X11/config/Library.tmpl
WARNING:   /usr/lib/X11/config/sunLib.tmpl
WARNING:   /usr/lib/X11/config/necLib.tmpl
WARNING:   /usr/lib/X11/config/Imake.tmpl
WARNING:   /usr/lib/X11/config/sv3Lib.tmpl
WARNING:   /usr/lib/X11/config/apollo.cf
WARNING:   /usr/lib/X11/config/sco.cf
WARNING:   /usr/lib/X11/config/linux.cf
WARNING:   /usr/lib/X11/config/osfLib.rules
WARNING:   /usr/lib/X11/config/usl.cf
WARNING:   /usr/lib/X11/config/cygwin.rules
WARNING:   /usr/lib/X11/config/Motif.tmpl
WARNING:   /usr/lib/X11/config/lynx.cf
WARNING:   /usr/lib/X11/config/FreeBSD.cf
WARNING:   /usr/lib/X11/config/cygwin.cf
WARNING:   /usr/lib/X11/config/lnxdoc.rules
WARNING:   /usr/lib/X11/config/sgiLib.rules
WARNING:   /usr/lib/X11/config/Mips.cf
WARNING:   /usr/lib/X11/config/QNX4.rules
WARNING:   /usr/lib/X11/config/lnxLib.tmpl
WARNING:   /usr/lib/X11/config/QNX4.cf
WARNING:   /usr/lib/X11/config/osf1.cf
WARNING:   /usr/lib/X11/config/gnuLib.rules
WARNING:   /usr/lib/X11/config/dmx.cf
WARNING:   /usr/lib/X11/config/cde.tmpl
WARNING:   /usr/lib/X11/config/Imake.rules
WARNING:   /usr/lib/X11/config/xfree86.cf
WARNING:   /usr/lib/X11/config/mingw.cf
WARNING:   /usr/lib/X11/config/pegasus.cf
WARNING:   /usr/lib/X11/config/gnuLib.tmpl
WARNING:   /usr/lib/X11/config/Threads.tmpl
WARNING:   /usr/lib/X11/config/nto.rules
WARNING:   /usr/lib/X11/config/macII.cf
WARNING:   /usr/lib/X11/config/convex.cf
WARNING:   /usr/lib/X11/config/bsdLib.rules
WARNING:   /usr/lib/X11/config/xorgversion.def
WARNING:   /usr/lib/X11/config/bsdiLib.tmpl
WARNING:   /usr/lib/X11/config/date.def
WARNING:   /usr/lib/X11/config/mach.cf
WARNING:   /usr/lib/X11/config/os2Lib.tmpl
WARNING:   /usr/lib/X11/config/lnxLib.rules
WARNING:   /usr/lib/X11/config/os2.rules
WARNING:   /usr/lib/X11/config/mingw.tmpl
WARNING:   /usr/lib/X11/config/svr3.cf
WARNING:   /usr/lib/X11/config/os2Lib.rules
WARNING:   /usr/lib/X11/config/nto.cf
WARNING:   /usr/lib/X11/config/noop.rules
WARNING:   /usr/lib/X11/config/xf86.rules
WARNING:   /usr/lib/X11/config/cross.def
WARNING:   /usr/lib/X11/config/osfLib.tmpl
WARNING:   /usr/lib/X11/config/darwinLib.rules
WARNING:   /usr/lib/X11/config/Server.tmpl
WARNING:   /usr/lib/X11/config/Amoeba.cf
WARNING:   /usr/lib/X11/config/sequent.cf
WARNING:   /usr/lib/X11/config/gnu.cf
WARNING:   /usr/lib/X11/config/DGUX.cf
WARNING:   /usr/lib/X11/config/host.def
WARNING:   /usr/lib/X11/config/WinLib.tmpl
WARNING:   /usr/lib/X11/config/sunLib.rules
WARNING:   /usr/lib/X11/config/OpenBSDLib.rules
WARNING:   /usr/lib/X11/config/X11.tmpl
WARNING:   /usr/lib/X11/config/sony.cf
WARNING:   /usr/lib/X11/config/darwinLib.tmpl
WARNING:   /usr/lib/X11/config/cde.rules
WARNING:   /usr/lib/X11/config/hp.cf
WARNING:   /usr/lib/X11/config/xorg.cf
WARNING:   /usr/lib/X11/config/Imake.cf
WARNING:   /usr/lib/X11/config/sgi.cf
WARNING:   /usr/lib/X11/config/necLib.rules
WARNING:   /usr/lib/X11/config/ultrix.cf
WARNING:   /usr/lib/X11/config/Win32.cf
WARNING:   /usr/lib/X11/config/bsd.cf
WARNING:   /usr/lib/X11/config/isc.cf
WARNING:   /usr/lib/X11/config/oldlib.rules
WARNING:   /usr/lib/X11/config/sv4Lib.rules
WARNING:   /usr/lib/X11/config/svr4.cf
WARNING:   /usr/lib/X11/config/generic.cf
WARNING:   /usr/lib/X11/config/os2.cf
WARNING:   /usr/lib/X11/config/luna.cf
WARNING:   /usr/lib/X11/config/xorg.tmpl
WARNING:   /usr/lib/X11/config/sun.cf
WARNING:   /usr/lib/X11/config/bsdLib.tmpl
WARNING:   /usr/lib/X11/config/DragonFly.cf
WARNING:   /usr/lib/X11/config/x386.cf
WARNING:   /usr/lib/X11/config/X11.rules
WARNING:   /usr/lib/X11/config/bsdiLib.rules
WARNING:   /usr/lib/X11/config/ibmLib.tmpl
WARNING:   /usr/lib/X11/config/Win32.rules
WARNING:   /usr/lib/X11/config/hpLib.rules
WARNING:   /usr/lib/X11/config/ibm.cf
WARNING:   /usr/lib/X11/config/ibmLib.rules
WARNING:   /usr/lib/X11/config/sgiLib.tmpl
WARNING:   /usr/lib/X11/config/cygwin.tmpl
WARNING:   /usr/lib/X11/config/ncr.cf
WARNING:   /usr/lib/X11/config/site.def
WARNING:   /usr/lib/X11/config/xf86site.def
WARNING:   /usr/lib/X11/config/NetBSD.cf
WARNING:   /usr/lib/X11/config/fujitsu.cf

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-util/xorg-cf-files_1.0.4.bb b/meta/recipes-graphics/xorg-util/xorg-cf-files_1.0.4.bb
index a5de00a..797d917 100644
--- a/meta/recipes-graphics/xorg-util/xorg-cf-files_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-util/xorg-cf-files_1.0.4.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0f334a06f2de517e37e86d6757167d88"
 
 DEPENDS = "font-util"
 
-PR = "r0"
+PR = "r1"
+
+FILES_${PN} += "${libdir}/X11/config/*"
 
 SRC_URI[md5sum] = "ff4502b6e31aac90e24ce134090d0e46"
 SRC_URI[sha256sum] = "8fc8a1224d2a716b1f3f1ca85dfda02387ab215251b8eddd03551eac998c9cb8"




