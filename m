Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1QloSU-0006A5-D6
	for openembedded-core@openembedded.org; Tue, 26 Jul 2011 22:42:30 +0200
Received: from mail52-ch1-R.bigfish.com (216.32.181.169) by
	CH1EHSOBE003.bigfish.com (10.43.70.53) with Microsoft SMTP Server id
	14.1.225.22; Tue, 26 Jul 2011 19:22:34 +0000
Received: from mail52-ch1 (localhost.localdomain [127.0.0.1])	by
	mail52-ch1-R.bigfish.com (Postfix) with ESMTP id B9EE51840291;
	Tue, 26 Jul 2011 19:22:34 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail52-ch1 (localhost.localdomain [127.0.0.1]) by mail52-ch1
	(MessageSwitch) id 1311708154354214_21299;
	Tue, 26 Jul 2011 19:22:34 +0000 (UTC)
Received: from CH1EHSMHS026.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail52-ch1.bigfish.com (Postfix) with ESMTP id
	53ACFE0052; Tue, 26 Jul 2011 19:22:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS026.bigfish.com
	(10.43.70.26) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 26 Jul 2011 19:22:33 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.289.8; Tue, 26 Jul 2011 14:22:32 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p6QJMV9S002817; Tue, 26 Jul 2011 14:22:31 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <yocto@yoctoproject.org>, <openembedded-core@openembedded.org>
Date: Tue, 26 Jul 2011 14:22:29 -0500
Message-ID: <1311708150-24226-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Wed, 27 Jul 2011 09:21:47 +0200
Cc: Matthew McClintock <msm@freescale.com>
Subject: [PATCH] Switch to using perl-native for various packages instead of host perl
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
X-List-Received-Date: Tue, 26 Jul 2011 20:42:30 -0000
Content-Type: text/plain

Several builds are using perl on the host instead of perl built by
poky. This fixes the issue for several packages.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb    |    2 +-
 meta/recipes-devtools/intltool/intltool.inc        |    2 +-
 meta/recipes-extended/polkit/polkit_0.101.bb       |    4 ++--
 meta/recipes-gnome/gnome/gconf-dbus_705.bb         |    4 ++--
 meta/recipes-gnome/gnome/gnome-desktop.inc         |    4 ++--
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    4 ++--
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    4 ++--
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 ++--
 .../xorg-lib/xkeyboard-config_2.1.bb               |    4 ++--
 .../shared-mime-info/shared-mime-info.inc          |    2 +-
 .../shared-mime-info/shared-mime-info_0.90.bb      |    2 +-
 14 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index dc7a5ae..5695403 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -21,7 +21,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://99avahi-autoipd \
           file://initscript.patch"
 
-inherit autotools pkgconfig update-rc.d gettext
+inherit autotools pkgconfig update-rc.d gettext perlnative
 
 EXTRA_OECONF = "--with-distro=debian \
              --with-avahi-priv-access-group=adm \
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
index 05716d0..da40426 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
 SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index d8917ad..7885b01 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -12,5 +12,5 @@ RRECOMMENDS_${PN} = "perl-modules"
 
 inherit autotools pkgconfig perlnative
 
-export PERL = "/usr/bin/env perl"
+export INTLTOOL_PERL_virtclass-native = "/usr/bin/env perl"
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
index 6769914..2dd8f58 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
 
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            file://introspection.patch"
-PR = "r0"
+PR = "r1"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
 FILES_${PN} += "${libdir}/${PN}-1/extensions/*.so \
                 ${datadir}/${PN}-1/actions/* \
diff --git a/meta/recipes-gnome/gnome/gconf-dbus_705.bb b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
index fdfc45f..cbfc42d 100644
--- a/meta/recipes-gnome/gnome/gconf-dbus_705.bb
+++ b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
@@ -10,7 +10,7 @@ RPROVIDES_${PN}-dev = "gconf-dev"
 
 #SRCREV = "705"
 #PV = "2.16.0+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 # This SVN repo is no longer available use a tarball mirror site until
 # we move to proper gconf recipe.
@@ -19,7 +19,7 @@ SRC_URI = "http://autobuilder.pokylinux.org/sources/trunk_developer.imendio.com_
 
 S = "${WORKDIR}/trunk"
 
-inherit pkgconfig autotools
+inherit pkgconfig autotools perlnative
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-gnome/gnome/gnome-desktop.inc b/meta/recipes-gnome/gnome/gnome-desktop.inc
index 336b87f..670d56b 100644
--- a/meta/recipes-gnome/gnome/gnome-desktop.inc
+++ b/meta/recipes-gnome/gnome/gnome-desktop.inc
@@ -11,7 +11,7 @@ do_configure_prepend () {
 
 FILES_${PN} += "${datadir}/gnome-about"
 
-PR = "r1"
+PR = "r2"
 
-inherit gnome pkgconfig
+inherit gnome pkgconfig perlnative
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index bd7c615..525c1b4 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -2,7 +2,7 @@ LICENSE = "GPL & LGPL"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native"
 DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native"
 
-inherit gnome gettext python-dir
+inherit gnome gettext python-dir perlnative
 
 EXTRA_OECONF = "--disable-scrollkeeper"
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index 1ec1076..c65cf64 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,7 +1,7 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "file://xsltproc_nonet.patch \
 	    file://use-usr-bin-env-for-python-in-xml2po.patch"
diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index 55868ab..e7f17f5 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -9,7 +9,7 @@ SECTION = "x11/gnome"
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
 RDEPENDS_${PN} = "hicolor-icon-theme"
 RRECOMMENDS_${PN} = "librsvg-gtk"
-PR = "r1"
+PR = "r2"
 
 FILES_${PN} += "${datadir}/*"
 
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a
 
 EXTRA_OECONF = "--disable-hicolor-check --with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
 
-inherit autotools
+inherit autotools perlnative
 
 # We can't do this until the output is shared into all target sysroots
 #PACKAGE_ARCH = "all"
diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 3f38401..7ae49c4 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r2"
+PR = "r3"
 
-inherit autotools gnome pkgconfig
+inherit autotools gnome pkgconfig perlnative
 
 DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf"
 RDEPENDS_${PN} = "libgnome-keyring"
diff --git a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
index 09b6d9c..77c82d3 100644
--- a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
+++ b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
                     file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
 
 SECTION = "x11/gnome/libs"
-PR = "r0"
+PR = "r1"
 
-inherit gnome
+inherit gnome perlnative
 
 DEPENDS = "dbus eggdbus"
 
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
index b077fa3..e4c7dc0 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
@@ -19,14 +19,14 @@ SRC_URI[sha256sum] = "e293aa4b0dd259dbb4f0e7f56fdd95db5047d052c7b3b80922fe566392
 SECTION = "x11/libs"
 DEPENDS = "intltool-native xkbcomp-native glib-2.0"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg"
 
 RDEPENDS_${PN} += "xkbcomp"
 FILES_${PN} += "${datadir}/X11/xkb"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
 do_install_append () {
     install -d ${D}/usr/share/X11/xkb/compiled
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 64eef9d..8b10535 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native"
 
 SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.bz2"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext perlnative
 
 EXTRA_OECONF = "--disable-update-mimedb"
 
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
index cbbd0fe..4c852fa 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
@@ -1,5 +1,5 @@
 require shared-mime-info.inc
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://fix-parallel-build.patch \
             file://fix-parallel-build-backport.patch \
-- 
1.7.5




