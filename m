Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 76E796D092
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:17:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9TBGDng004059 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:16:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k_mEqxdS2xdi
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:16:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9TBGunN004091
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:16:57 GMT
Message-ID: <1383045411.17867.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2013 11:16:51 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] recipes: Remove PR = r0 from all recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2013 11:17:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Remove all PR = "r0" from all .bb files in oe-core. This was done
with the command sed -e '/^PR.*=.*r0\"/d' recipes*/*/*.bb -i
    
We've switching to the PR server, PR bumps are no longer needed and
this saves people either accidentally bumping them or forgetting to
remove the lines (r0 is the default anyway).
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-bsp/acpid/acpid_1.0.10.bb b/meta/recipes-bsp/acpid/acpid_1.0.10.bb
index 2dd4fbd..df55bad 100644
--- a/meta/recipes-bsp/acpid/acpid_1.0.10.bb
+++ b/meta/recipes-bsp/acpid/acpid_1.0.10.bb
@@ -3,7 +3,6 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-PR = "r0"
 
 SRC_URI[md5sum] = "61156ef32015c56dc0f2e3317f4ae09e"
 SRC_URI[sha256sum] = "22703ce0dd7305aca01bc9ac741659c32b1593f1d6fde492df7f01067a534760"
diff --git a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
index ef48884..5f613f6 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
+++ b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=77ef83ab5f4af938a93edb61f7b74f2c
 
 SRCREV = "9d4cdedca25b396405f8587f9c4fbf8229e041c2"
 PV = "1.1.12+git${SRCPV}"
-PR = "r0"
 
 RDEPENDS_${PN} = "pm-utils"
 
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
index c190e1b..6ff4680 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
@@ -9,7 +9,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib kmod"
 RDEPENDS_${PN} = "${PN}-ids"
-PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://configure.patch \
diff --git a/meta/recipes-bsp/x-load/x-load_git.bb b/meta/recipes-bsp/x-load/x-load_git.bb
index 910c078..65dc85c 100644
--- a/meta/recipes-bsp/x-load/x-load_git.bb
+++ b/meta/recipes-bsp/x-load/x-load_git.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=25;md5=ef08d08cb99057bbb5b
 
 SRCREV = "9f94c6577e3a018b6b75cbe39f32bb331871f915"
 PV = "1.5.0+git${SRCPV}"
-PR="r0"
 
 #SRC_URI = "git://www.sakoman.net/git/x-load-omap3.git;branch=master"
 #SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master"
diff --git a/meta/recipes-bsp/zaurusd/zaurusd_git.bb b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
index 37aaee8..7460337 100644
--- a/meta/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -7,7 +7,6 @@ RDEPENDS_${PN} = "xrandr"
 
 SRCREV = "85d941d87f0c41b196766a173feaafffa6de2dc2"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index 575b0b1..7f216ac 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://irdadump/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
                     file://smcinit/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://man/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://irdadump/irdadump.c;beginline=1;endline=24;md5=d78b9dce3cd78c2220250c9c7a2be178"
-PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
           file://init"
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 96d1e51..43d99b5 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 SRCREV = "4ed19e11c2975105b71b956440acdb25d46a347d"
 PV = "20120614+gitr${SRCPV}"
 PE = "1"
-PR = "r0"
 
 SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-connectivity/neard/neard_0.10.bb b/meta/recipes-connectivity/neard/neard_0.10.bb
index 1ba7bce..3a1c368 100644
--- a/meta/recipes-connectivity/neard/neard_0.10.bb
+++ b/meta/recipes-connectivity/neard/neard_0.10.bb
@@ -8,4 +8,3 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git \
 S = "${WORKDIR}/git"
 SRCREV = "eb486bf35e24d7d1db61350f5ab393a0c880523d"
 PV = "0.10+git${SRCPV}"
-PR = "r0"
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
index 77c4a00..f840d8b 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
@@ -5,7 +5,6 @@ SECTION = "libs"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d9c6a2a0ca6017fda7cd905ed2739b37"
-PR = "r0"
 
 SRC_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/${BPN}-${PV}.tar.gz \
            file://fix-ac-prereq.patch \
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.21.1.bb
index 5c05273..85d3208 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.1.bb
@@ -1,5 +1,4 @@
 require busybox.inc
-PR = "r0"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://get_header_tar.patch \
diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb b/meta/recipes-core/coreutils/coreutils_8.21.bb
index da14303..dae5cfc 100644
--- a/meta/recipes-core/coreutils/coreutils_8.21.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
@@ -7,7 +7,6 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;beginline=5;endline=16;md5=38b79785ca88537b75871782a2a3c6b8"
-PR = "r0"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
diff --git a/meta/recipes-core/dbus/dbus-glib_0.100.2.bb b/meta/recipes-core/dbus/dbus-glib_0.100.2.bb
index e08e356..c1bb06a 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.100.2.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.100.2.bb
@@ -1,6 +1,5 @@
 require dbus-glib.inc
 
-PR = "r0"
 
 SRC_URI[md5sum] = "ad0920c7e3aad669163bb59171cf138e"
 SRC_URI[sha256sum] = "a5bb42da921f51c28161e0e54a5a8241d94a1c0499a14007150e9ce743da6ac5"
diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/expat/expat_2.1.0.bb
index 1ce1844..b958742 100644
--- a/meta/recipes-core/expat/expat_2.1.0.bb
+++ b/meta/recipes-core/expat/expat_2.1.0.bb
@@ -1,6 +1,5 @@
 require expat.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
-PR = "r0"
 
 SRC_URI[md5sum] = "dd7dab7a5fea97d2a6a43f511449b7cd"
 SRC_URI[sha256sum] = "823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86"
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb
index febad7a..e46b19e 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb
@@ -17,7 +17,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0854da868a929923087141d9d7aba7d5"
 
 inherit native
 
-PR = "r0"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 164da36..74ed247 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -5,7 +5,6 @@
 
 SUMMARY = "Essential build dependencies"
 LICENSE = "MIT"
-PR = "r0"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 064edfb..e3b1c18 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Host SDK package for cross canadian toolchain"
 PN = "packagegroup-cross-canadian-${MACHINE}"
-PR = "r0"
 LICENSE = "MIT"
 
 # Save TRANSLATED_TARGET_ARCH before allarch tramples it
diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index 8dd29b9..5cdf685 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -6,7 +6,6 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=fde612df1e5933c428b73844a0c494fd"
 
-PR = "r0"
 
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.14.bb b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
index b6d8262..27b75b4 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.14.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "http://alioth.debian.org/projects/chrpath/"
 BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-PR = "r0"
 
 SRC_URI = "http://alioth.debian.org/frs/download.php/file/3648/chrpath-${PV}.tar.gz \
            file://standarddoc.patch"
diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index 3571732..5c889fa 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -4,7 +4,6 @@ compilation of C/C++/ObjC code across machines on a network."
 SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r0"
 
 DEPENDS = "avahi"
 
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
index fb2c62a..ee6aa6a 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "DMI (Desktop Management Interface) table related utilities"
 HOMEPAGE = "http://www.nongnu.org/dmidecode/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
-PR = "r0"
 
 SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index 97c66b3..44e1b5d 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -8,7 +8,6 @@ DEPENDS_class-native = "perl-native-runtime"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PR = "r0"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV}.tar.bz2 \
 	   file://config-guess-uclibc.patch \
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index b12ab7d..00fa759 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -10,7 +10,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 SRCREV = "a47f842264fc19837f8a00eb1d2d254a4c527334"
 PV = "1.0+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.sv.gnu.org/config.git \
 	   file://config-guess-uclibc.patch \
diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
index 0dd61ff..4c3fe28 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -27,7 +27,6 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
 SRC_URI[md5sum] = "a69b575d4a633bdd9118f3a4a1e97766"
 SRC_URI[sha256sum] = "f70a38c8d9751f442679bfe61852bba8545af4d4355d037630997c2f37f2895b"
 
-PR = "r0"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/intltool/intltool_0.50.2.bb b/meta/recipes-devtools/intltool/intltool_0.50.2.bb
index c25e21a..05c96c7 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.2.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.50.2.bb
@@ -1,7 +1,6 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r0"
 
 SRC_URI += "file://intltool-nowarn.patch \
            ${NATIVEPATCHES} \
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
index b744ccd..ba9c72e 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=077ef64ec3ac257fb0d786531cf26931"
 
 DEPENDS = "groff-native openjade-native"
 
-PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.gz \
            file://disable_sgml2rtf.patch \
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index 8d232bb..07bff64 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
 
 SRCREV = "686a48a339b3200184c27e7f98d4c03180b2be6c"
 PV = "4.0+git${SRCPV}"
-PR = "r0"
 
 DEPENDS += "zlib"
 
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 0f99685..dcd6066 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -5,7 +5,6 @@ SECTION = "optional"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r0"
 
 RDEPENDS_${PN} = "glibc-gconv-ibm850"
 RRECOMMENDS_${PN} = "\
diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb b/meta/recipes-devtools/patch/patch_2.7.1.bb
index 4fc137e..7d009fe 100644
--- a/meta/recipes-devtools/patch/patch_2.7.1.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.1.bb
@@ -1,7 +1,6 @@
 require patch.inc
 LICENSE = "GPLv3"
 
-PR = "r0"
 
 SRC_URI[md5sum] = "95dd8d7e41dcbcecdd5cd88ef915378d"
 SRC_URI[sha256sum] = "c05f28668c3474bc63adcd48abae921d15e71c254fbebdbaeda40456d64039d5"
diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
index 63cf0ea..30fb0e6 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "8ae7743ad11500f7604f2e817221d877"
 SRC_URI[sha256sum] = "1ac4cee9a9ca97a723505eb29a25e50adeccffba3f0f0ef4f035cf082caf3b84"
-PR = "r0"
 
 do_install() {
     oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
diff --git a/meta/recipes-devtools/perl/liburi-perl_1.60.bb b/meta/recipes-devtools/perl/liburi-perl_1.60.bb
index cd42e09..21e838e 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.60.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.60.bb
@@ -4,7 +4,6 @@ and manipulate the various components that make up these strings."
 
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=6c33ae5c87fd1c4897714e122dd9c23d"
 
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
index 31294ea..1fcb322 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
@@ -9,7 +9,6 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7dbb3e2241fac8457967053fc1a1ddb"
 DEPENDS += "libxml-parser-perl"
-PR = "r0"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.3.bb b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
index c9ec2d2..659baaa 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Perl is a popular scripting language."
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 226ff96..66fc85f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,7 +2,6 @@ require pseudo.inc
 
 SRCREV = "b9eb2b5633b5a23efe72c950494728d93c2b5823"
 PV = "1.5.1+git${SRCPV}"
-PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index 5f5f0dd..a30932a 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 PV = "1.3.0+git${SRCPV}"
-PR = "r0"
 
 SRC_URI_prepend = "git://git.qemu.org/qemu.git"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 18f1892..501d803 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Qemu wrapper script"
 LICENSE = "MIT"
-PR = "r0"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit qemu
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.60.bb b/meta/recipes-devtools/quilt/quilt-native_0.60.bb
index b99b9b6..b875dbc 100644
--- a/meta/recipes-devtools/quilt/quilt-native_0.60.bb
+++ b/meta/recipes-devtools/quilt/quilt-native_0.60.bb
@@ -1,4 +1,3 @@
 require quilt-${PV}.inc
 require quilt-native.inc
 
-PR = "r0"
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
index 79a4ad7..ef82a38 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
-PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://git-version-gen \
diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 41713b3..3f16225 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "http://download.berlios.de/cwautomacros/cwautomacros-${PV}.tar.bz2"
 
-PR = "r0"
 
 SRC_URI[md5sum] = "074afcb50d0a8bff10786a2954b2b02d"
 SRC_URI[sha256sum] = "3115603b891f3a163c0bbb5fea2f3742113a183fa6745ee5e89e5f6d0e9f6121"
diff --git a/meta/recipes-extended/gawk/gawk_4.0.2.bb b/meta/recipes-extended/gawk/gawk_4.0.2.bb
index d5cc52d..63dace4 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.2.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.2.bb
@@ -13,7 +13,6 @@ DEPENDS += "readline"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/gperf/gperf_3.0.4.bb b/meta/recipes-extended/gperf/gperf_3.0.4.bb
index c2942cd..64003fc 100644
--- a/meta/recipes-extended/gperf/gperf_3.0.4.bb
+++ b/meta/recipes-extended/gperf/gperf_3.0.4.bb
@@ -1,6 +1,5 @@
 require gperf.inc
 
-PR = "r0"
 
 SRC_URI[md5sum] = "c1f1db32fb6598d6a93e6e88796a8632"
 SRC_URI[sha256sum] = "767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e"
diff --git a/meta/recipes-extended/hdparm/hdparm_9.43.bb b/meta/recipes-extended/hdparm/hdparm_9.43.bb
index 0371477..592b8cb 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.43.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.43.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
                     file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
                     file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
 
-PR = "r0"
 
 PACKAGES += "wiper"
 
diff --git a/meta/recipes-extended/iputils/iputils_s20121221.bb b/meta/recipes-extended/iputils/iputils_s20121221.bb
index 45108a4..46f8903 100644
--- a/meta/recipes-extended/iputils/iputils_s20121221.bb
+++ b/meta/recipes-extended/iputils/iputils_s20121221.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
 
 DEPENDS = "gnutls docbook-utils-native sgmlspl-native libcap"
 
-PR = "r0"
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/use_gethostbyname2.diff \
diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
index 3bcb7fb..11c2f7d 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://code.google.com/p/libarchive/"
 SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4255e2e6f0349a4ac8fbd68459296e46"
-PR = "r0"
 
 PACKAGECONFIG ?= "libxml2 zlib bz2"
 
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
index ed838b7..407e38e 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
@@ -6,7 +6,6 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
                     file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
-PR = "r0"
 
 DEPENDS += "xz-native"
 PROVIDES = "virtual/librpc"
diff --git a/meta/recipes-extended/libuser/libuser_0.59.bb b/meta/recipes-extended/libuser/libuser_0.59.bb
index f951156..a39e9b3 100644
--- a/meta/recipes-extended/libuser/libuser_0.59.bb
+++ b/meta/recipes-extended/libuser/libuser_0.59.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
 
 SRC_URI[md5sum] = "22835cbfec894b1e9491845ed5023244"
 SRC_URI[sha256sum] = "27a93ed1f6424cfbf539c56cf0ca54d3b9b2c4daba6c408464e3c77ddf9c7a2f"
-PR = "r0"
 
 DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native python"
 
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
index c243494..a1f0589 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
@@ -16,7 +16,6 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r0"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html.lighttpd \
diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.1.bb b/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
index 2b6dc93..e5b30d8 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
 HOMEPAGE = "https://fedorahosted.org/releases/l/o/logrotate"
 LICENSE = "GPLv2"
-PR = "r0"
 
 DEPENDS="coreutils popt"
 
diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
index 2f425aa..5676cd9 100644
--- a/meta/recipes-extended/lsof/lsof_4.87.bb
+++ b/meta/recipes-extended/lsof/lsof_4.87.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
-PR = "r0"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
diff --git a/meta/recipes-extended/minicom/minicom_2.6.2.bb b/meta/recipes-extended/minicom/minicom_2.6.2.bb
index bef386a..5694cc2 100644
--- a/meta/recipes-extended/minicom/minicom_2.6.2.bb
+++ b/meta/recipes-extended/minicom/minicom_2.6.2.bb
@@ -6,7 +6,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-PR = "r0"
 
 SRC_URI = "http://alioth.debian.org/frs/download.php/3869/minicom-${PV}.tar.gz \
            file://allow.to.disable.lockdev.patch \
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
index cd3141a..95682ee 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Convert::ASN1 - ASN.1 Encode/Decode library"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
-PR = "r0"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 80595af..fb396f1 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -3,7 +3,6 @@ SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=21;md5=576b7cb41e5e821501a01ed66f0f9d9e"
-PR = "r0"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
index 3242f7b..14a3370 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
@@ -8,7 +8,6 @@ implement the characters() callback."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 RDEPENDS_${PN} += "perl-module-extutils-makemaker"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://dist.ini;endline=5;md5=8f9c9a55340aefaee6e9704c88466446"
 
diff --git a/meta/recipes-extended/psmisc/psmisc_22.20.bb b/meta/recipes-extended/psmisc/psmisc_22.20.bb
index f0ee79c..3dbd999 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.20.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.20.bb
@@ -1,7 +1,6 @@
 require psmisc.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-PR = "r0"
 
 SRC_URI[md5sum] = "a25fc99a6dc7fa7ae6e4549be80b401f"
 SRC_URI[sha256sum] = "b17224e2385f6a799ffebba27eb7870771d42555e86814ef56b6d7e955765514"
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index 8f4e041..c3eca27 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -4,7 +4,6 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://sed/sed.h;beginline=1;endline=17;md5=767ab3a06d7584f6fd0469abaec4412f"
 SECTION = "console/utils"
-PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index 1131bdf..2a9bdd1 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631 \
 
 BBCLASSEXTEND = "native"
 
-PR = "r0"
 
 SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz \
            file://fix-error-return.patch"
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 9b22d95..50285aa 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native gobject-introspection-stub"
 DEPENDS_class-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-stub-native"
 
-PR = "r0"
 
 inherit gnomebase gtk-doc gettext
 
diff --git a/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb b/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
index af5d340..70b1e29 100644
--- a/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
@@ -6,7 +6,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SECTION = "x11/gnome"
-PR = "r0"
 inherit gnomebase allarch
 
 GNOME_COMPRESS_TYPE = "xz"
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
index bde7b89..321eb7f 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
@@ -1,7 +1,6 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r0"
 
 GNOME_COMPRESS_TYPE = "xz"
 
diff --git a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
index 0e2f428..9ceeeff 100644
--- a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
+++ b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
@@ -8,7 +8,6 @@ PROVIDES = "gtk-doc gobject-introspection-stub"
 
 SRCREV = "3dfd0a09de696ec8c544762747f8a0f77153622e"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.gnome.org/${BPN}"
 
diff --git a/meta/recipes-gnome/json-glib/json-glib_0.16.0.bb b/meta/recipes-gnome/json-glib/json-glib_0.16.0.bb
index 071d663..ffff75e 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.16.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.16.0.bb
@@ -8,7 +8,6 @@ HOMEPAGE = "http://live.gnome.org/JsonGlib"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-PR = "r0"
 
 DEPENDS = "glib-2.0"
 
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
index 53914f3..4651283 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -8,7 +8,6 @@ tools, it is useful for testing and collecting the native tools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
 
 inherit native packagegroup
 
diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
index b19cd89..e303022 100644
--- a/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "The DirectFB-examples package contains a set of simple DirectFB \
 DEPENDS = "directfb"
 SECTION = "libs"
 LICENSE = "MIT"
-PR = "r0"
 
 SRC_URI = " \
            http://www.directfb.org/downloads/Extras/DirectFB-examples-${PV}.tar.gz \
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.12.bb b/meta/recipes-graphics/freetype/freetype_2.4.12.bb
index 8cf79d3..701c629 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.12.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.12.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 
 SECTION = "libs"
 
-PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 "
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index 4b31900..3d271ad 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -6,7 +6,6 @@ DEPENDS = "pango libxext libxft virtual/libx11 gtk+"
 
 SRCREV = "218b99d82b56011e3f1b909e6baf22ce25af6334"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
 
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
diff --git a/meta/recipes-graphics/images/core-image-directfb.bb b/meta/recipes-graphics/images/core-image-directfb.bb
index b6187eb..0c6c882 100644
--- a/meta/recipes-graphics/images/core-image-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-directfb.bb
@@ -1,6 +1,5 @@
 SUMMARY = "An image that uses DirectFB instead of X11."
 LICENSE = "MIT"
-PR="r0"
 
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 934719a..a4656dd 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -12,7 +12,6 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 
 SRCREV = "29544f0e61cc281fc60061443a537271e1081b78"
 PV = "1.2+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
            file://kbdconfig"
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
index 2aabd4a..6ba46f0 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
@@ -18,6 +18,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.gz \
 SRC_URI[md5sum] = "20fed982f5d8e6ec8a56a5b48894ecf0"
 SRC_URI[sha256sum] = "4fa9408e353fedba5b7314cbf6b6cd06d873a1424e281aa050d88bb9c0a0191e"
 
-PR = "r0"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index aca3a67..334a17e 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -1,5 +1,4 @@
 SUMMARY = "DirectFB without X11"
-PR = "r0"
 LICENSE = "MIT"
 
 inherit packagegroup
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.2.bb b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
index 6918f3e..87edb45 100644
--- a/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
@@ -18,4 +18,3 @@ SRC_URI = "http://bitmath.org/code/mtdev/mtdev-1.1.2.tar.bz2 \
 SRC_URI[md5sum] = "d9c7700918fc392e29da7477ae20c5c2"
 SRC_URI[sha256sum] = "698dd11ca08b3a73ad33d8a5076f6d9e018d97afad3eba36f540b8ea7b775a30"
 
-PR = "r0"
diff --git a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
index c121bb9..ad046d1 100644
--- a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
+++ b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
@@ -6,7 +6,6 @@ BUGTRACKER = "http://bugs.freedesktop.org/buglist.cgi?product=XCB"
 SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
-PR = "r0"
 
 PARALLEL_MAKE = ""
 #DEPENDS = "xcb-proto xproto libxau libxslt-native"
diff --git a/meta/recipes-graphics/xcb/xcb-proto_1.8.bb b/meta/recipes-graphics/xcb/xcb-proto_1.8.bb
index 785156a..0425ef4 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_1.8.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_1.8.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-PR = "r0"
 
 SRC_URI[md5sum] = "a5de3432cc6e43cc6a27f241dbb991b1"
 SRC_URI[sha256sum] = "233d16c7a019235b3092111e7c11429119357eb13754a607b75eea04453121b0"
diff --git a/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb b/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
index 89d79ab..1d36893 100644
--- a/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
@@ -5,7 +5,6 @@ DEPENDS += "xcb-util"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://image/xcb_image.c;endline=24;md5=eafdf965cfb89955fdedf75054223fb4 \
                     file://image/xcb_image.h;beginline=4;endline=27;md5=48cd25ae55e7de525fe1e1a3a7672e1c"
-PR = "r0"
 
 SRC_URI[md5sum] = "fabb80b36490b00fc91289e2c7f66770"
 SRC_URI[sha256sum] = "d35a3c0eaae171f5081ec127fb9cec174b716ce5d78196a87f2785376da021df"
diff --git a/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb b/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb
index 43f5e65..39ead34 100644
--- a/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb
@@ -3,7 +3,6 @@ require xcb-util.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://keysyms/keysyms.c;endline=30;md5=2f8de023ed823bb92f0b47900574ea9e \
 					"
-PR = "r0"
 
 SRC_URI[md5sum] = "64e4aad2d48cd4a92e2da13b9f35bfd2"
 SRC_URI[sha256sum] = "7be1acf053bd68a1910fc861b2cbcbad7637b5618590dd5484d43a96f7995c6e"
diff --git a/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb
index c729db8..93b34e8 100644
--- a/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://renderutil/glyph.c;endline=24;md5=c517c483b8d726234ec
 					file://renderutil/util.c;endline=20;md5=6e0bfc44fb13298c0f4694eb70dc80d4 \
 					file://renderutil/xcb_renderutil.h;md5=c8732d30d204d3b55e956489f635cefb \
 					"
-PR = "r0"
 
 SRC_URI[md5sum] = "b346ff598ee093c141f836fbc0f8f721"
 SRC_URI[sha256sum] = "9789a5c55728fa7bae374d9fdf1c61095869bdc68561911760879095644c7452"
diff --git a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
index 465ccd4..944e0d8 100644
--- a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://ewmh/ewmh.c;endline=27;md5=63fd80552d7dc886f4eb267610
 					file://icccm/icccm.c;endline=28;md5=e2b3240a0c197e8977adde2a5cf18d50 \
 					file://icccm/xcb_icccm.h;beginline=4;endline=31;md5=393772b7b07b9868d479d538238c1d8a \
 					"
-PR = "r0"
 
 SRC_URI[md5sum] = "c612aae7ffe2e70fe743efab9c5548e9"
 SRC_URI[sha256sum] = "038f9bdb917b1f6d98a164f57dfb32212a102d771ab6f03de49fef3786746030"
diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.9.bb b/meta/recipes-graphics/xcb/xcb-util_0.3.9.bb
index 6f2cd43..c5d8858 100644
--- a/meta/recipes-graphics/xcb/xcb-util_0.3.9.bb
+++ b/meta/recipes-graphics/xcb/xcb-util_0.3.9.bb
@@ -3,7 +3,6 @@ require xcb-util.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/xcb_aux.c;endline=30;md5=ae305b9c2a38f9ba27060191046a6460 \
                     file://src/xcb_event.h;endline=27;md5=627be355aee59e1b8ade80d5bd90fad9"
-PR = "r0"
 
 SRC_URI[md5sum] = "01dcc7a16d5020530552712710646ea2"
 SRC_URI[sha256sum] = "c611259c0ab20fd76f79f48f4684843c18ea9c967eba78a45e8b3636315c18c4"
diff --git a/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
index 5aef188..e623cee 100644
--- a/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a3c3499231a8035efd0e004cfbd3b72a \
 
 DEPENDS += "libxext dmxproto"
 
-PR = "r0"
 PE = "1"
 
 SRC_URI[md5sum] = "ba983eba5a9f05d152a0725b8e863151"
diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.8.bb
index 43c8336..ce6a194 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.8.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d162b1b3c6fa812da9d804dcf8584a93"
 DEPENDS += "xproto xtrans"
 PROVIDES = "ice"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libICE"
diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
index 81f5709..455e869 100644
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
@@ -13,7 +13,6 @@ DEPENDS = "virtual/libx11 calibrateproto libxext"
 
 SRCREV = "209d83af61ed38a002c8096377deac292b3e396c"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate \
            file://fix-xcb.patch"
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
index 8ee35b0..0afe127 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
@@ -19,7 +19,6 @@ PROVIDES = "xcomposite"
 BBCLASSEXTEND = "native"
 
 PE = "1"
-PR = "r0"
 
 XORG_PN = "libXcomposite"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
index deea451..c3d7004 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
@@ -20,7 +20,6 @@ DEPENDS += "virtual/libx11 damageproto libxfixes"
 PROVIDES = "xdamage"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXdamage"
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
index 99e608b..3529ead 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d559fb26e129626022e052a5e6e0e123"
 DEPENDS += "xproto"
 PROVIDES = "xdmcp"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXdmcp"
diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
index 32f8900..cf8dd20 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
 
 DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXfixes"
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
index f4dd322..627a6d3 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
@@ -18,7 +18,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90b90b60eb30f65fc9c2673d7cf59e24"
 DEPENDS += "virtual/libx11 libxrender freetype fontconfig"
 PROVIDES = "xft"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXft"
diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
index 46333ff..027c804 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6f4f634d1643a2e638bba3fcd19c2536 \
 
 DEPENDS += "libxext xineramaproto"
 PROVIDES = "xinerama"
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXinerama"
diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
index f659c3c..812d2af 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8be7367f7e5d605a426f76bb37d4d61f"
 
 DEPENDS += "virtual/libx11 kbproto"
 
-PR = "r0"
 PE = "1"
 
 EXTRA_OECONF += "--without-xcb"
diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb b/meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb
index ec83da7..8c04c44 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8c89441a8df261bdc56587465e13c7fa"
 
 DEPENDS += "libxext resourceproto"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXres"
diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
index 0c15557..354e5de 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=21fd154ee757813632ada871a34113fb"
 DEPENDS += "libxext scrnsaverproto"
 PROVIDES = "libxss"
 RREPLACES_${PN} = "libxss"
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXScrnSaver"
diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
index d87bd6e..1b0bcf3 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bb4f89972c3869f617f61c1a79ad1952 \
 
 DEPENDS += "libxext recordproto inputproto libxi"
 PROVIDES = "xtst"
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXtst"
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb b/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb
index bda6da2..af6f1f7 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27c91ecc435bd3d2bfad868914c94b45"
 DEPENDS += "libxext xf86miscproto"
 PROVIDES = "xxf86misc"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXxf86misc"
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb
index 221b47f..e276a76 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa0b9c462d8f2f13eba26492d42ea63d"
 
 DEPENDS += "libxext xf86vidmodeproto"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXxf86vm"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb
index 5aaf501..3c3f4dd 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb
@@ -13,7 +13,6 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=49347921d4d5268021a999f250edc9ca"
 
 PE = "1"
-PR = "r0"
 
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb b/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
index 8c41d16..f798a43 100644
--- a/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
@@ -1,6 +1,5 @@
 require xorg-proto-common.inc
 
-PR = "r0"
 PE = "1"
 
 SUMMARY = "BigReqs: X Big Requests extension headers"
diff --git a/meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb b/meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb
index c521071..d960e5d 100644
--- a/meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb
+++ b/meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb
@@ -12,7 +12,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a3c3499231a8035efd0e004cfbd3b72a \
                     file://dmxproto.h;endline=32;md5=ab8509955c3dd4c65fac728e1b367bc4"
 
-PR = "r0"
 PE = "1"
 
 SRC_URI[md5sum] = "4ee175bbd44d05c34d43bb129be5098a"
diff --git a/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb b/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
index fd27ed5..f4c40c5 100644
--- a/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
+++ b/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
@@ -10,7 +10,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e396fa91834f8786032cad2da5638f3 \
                     file://dri2proto.h;endline=31;md5=22f28bf68d01b533f26195e94b3ed8ca"
 
-PR = "r0"
 
 SRC_URI[md5sum] = "b2721d5d24c04d9980a0c6540cb5396a"
 SRC_URI[sha256sum] = "f9b55476def44fc7c459b2537d17dbc731e36ed5d416af7ca0b1e2e676f8aa04"
diff --git a/meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb b/meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb
index d87786e..4b9101a 100644
--- a/meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb
+++ b/meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb
@@ -10,7 +10,6 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c3e48aa9ce868c8e90f0401db41c11a2 \
                     file://FSproto.h;endline=44;md5=d2e58e27095e5ea7d4ad456ccb91986c"
 
-PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb
index e8ad93b..7cb4233 100644
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb
+++ b/meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb
@@ -10,7 +10,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d44ed0146997856304dfbb512a59a8de \
                     file://glxproto.h;beginline=4;endline=32;md5=6b79c570f644363b356456e7d44471d9"
 
-PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.3.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.3.bb
index f983ef5..a39ce49 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.3.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_2.3.bb
@@ -10,7 +10,6 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e562cc0f6587b961f032211d8160f31e \
                     file://XI2proto.h;endline=48;md5=1ac1581e61188da2885cc14ff49b20be"
 
-PR = "r0"
 PE = "1"
 
 inherit gettext
diff --git a/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb b/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
index 9177903..07c8e42 100644
--- a/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
@@ -10,7 +10,6 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7dd6ea99e2a83a552c02c80963623c38 \
                     file://XKBproto.h;beginline=1;endline=25;md5=5744eeff407aeb6e7a1346eebab486a2"
 
-PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb b/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
index 4129030..638e396 100644
--- a/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=00426d41bd3d9267cf9bbb2df9323a5e \
                     file://randrproto.h;endline=30;md5=3885957c6048fdf3310ac8ba54ca2c3f"
 
 RCONFLICTS_${PN} = "randrext"
-PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb b/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
index 3045ccf..ab07f51 100644
--- a/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
@@ -11,7 +11,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eed49b78b15b436c933b6b8b054e3901 \
                     file://saverproto.h;endline=26;md5=a84c0637305159f3c0ab173aaeede48d"
 
-PR = "r0"
 PE = "1"
 
 EXTRA_OECONF_append = " --enable-specs=no"
diff --git a/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb b/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
index b5c085c..0751b94 100644
--- a/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
@@ -9,7 +9,6 @@ server."
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=09d83047c15994e05db29b423ed6662e"
 
-PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb b/meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb
index 69e4d0d..cbb8c4a 100644
--- a/meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb
@@ -12,7 +12,6 @@ available."
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=86f273291759d0ba2a22585cd1c06c53"
 
-PR = "r0"
 PE = "1"
 
 inherit gettext
diff --git a/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb b/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb
index 5b38117..b3f9210 100644
--- a/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb
@@ -11,7 +11,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ef103b9d951e39ff7e23d386e2011fa3 \
                     file://xf86driproto.h;endline=35;md5=42be3d8e6d429ab79172572bb0cff544"
 
-PR = "r0"
 PE = "1"
 
 SRC_URI[md5sum] = "1d716d0dac3b664e5ee20c69d34bc10e"
diff --git a/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
index a68e4f5..d00774e 100644
--- a/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
@@ -11,7 +11,6 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e397a5326c83d5d0ebf5b3f87163ac6 \
                     file://panoramiXproto.h;endline=24;md5=098e0bc089368a988092b3cbda617a57"
 
-PR = "r0"
 PE = "1"
 
 SRC_URI[md5sum] = "9959fe0bfb22a0e7260433b8d199590a"
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
index 8c6d107..bb136a6 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
@@ -6,7 +6,6 @@ DEPENDS = "libxv"
 
 SRCREV = "f8f320d0254c09ce483fc1d8ee99ecf5bc940965"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/test-xvideo"
 
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 3051078..7d3aca2 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Depmod wrapper script"
 LICENSE = "MIT"
-PR = "r0"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index ccca2df..e7b8d8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -35,7 +35,6 @@ python () {
 
 LINUX_VERSION ?= "3.10+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
-PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
index cfefd41..95d5fb1 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
@@ -6,7 +6,6 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
                     file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
 DEPENDS = "zlib"
-PR = "r0"
 
 PN = "libpng12"
 S = "${WORKDIR}/libpng-${PV}"
diff --git a/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb b/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
index 0a9c5cc..f93841d 100644
--- a/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
+++ b/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
@@ -16,7 +16,6 @@ This library, Class::ISA, provides functions that return that list -- the list\
 HOMEPAGE = "http://search.cpan.org/dist/Class-ISA/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=107;endline=111;md5=6a5c6842a63cfe4dab1f66e2350e4d25"
 
diff --git a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
index 148950f..c18bc11 100644
--- a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
+++ b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "Perl module for provides screen dump of Perl data."
 HOMEPAGE = "http://search.cpan.org/~flora/Dumpvalue/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f736bec5ada1fc5e39b2a8e7e06bbcbb"
 
diff --git a/meta/recipes-lsb4/perl/libenv-perl_1.04.bb b/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
index 1795e24..7d256fb 100644
--- a/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
+++ b/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
@@ -6,7 +6,6 @@ variables to be treated as scalar or array variables."
 HOMEPAGE = "http://search.cpan.org/~flora/Env/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
 
diff --git a/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb b/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
index f11db5e..ce37c72 100644
--- a/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
+++ b/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
@@ -17,7 +17,6 @@ The routine returns the number of warnings issued."
 HOMEPAGE = "http://search.cpan.org/~flora/File-CheckTree/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6fcacc5df80e037060300a7f4b93bf9"
 
diff --git a/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb b/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
index 2722ec0..f1839e0 100644
--- a/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
+++ b/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
@@ -6,7 +6,6 @@ on your system."
 HOMEPAGE = "http://search.cpan.org/~flora/I18N-Collate/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ff6d629144a6ec1ea8c300f75760184f"
 
diff --git a/meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb b/meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb
index 809c740..a8d8a7c 100644
--- a/meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb
+++ b/meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb
@@ -8,7 +8,6 @@ This can be used to pre-process Pod before using tools which do not recognise th
 HOMEPAGE = "http://search.cpan.org/dist/Pod-Plainer/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=27;md5=80b4a99d477135bfcd1d0a44a041c63c"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
index a485994..196a317 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
@@ -6,7 +6,6 @@ LICENSE_FLAGS = "commercial"
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-PR = "r0"
 
 DESCRIPTION = "Fluendo closed-format mp3 GStreamer plug-in"
 
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 8c3166f..bca8836 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -5,7 +5,6 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
 
-PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
            file://configure-fix.patch \
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index 256e75e..c90b4b2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -3,7 +3,6 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg xz"
-PR = "r0"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
diff --git a/meta/recipes-sato/gaku/gaku_git.bb b/meta/recipes-sato/gaku/gaku_git.bb
index e17ebc7..dea250a 100644
--- a/meta/recipes-sato/gaku/gaku_git.bb
+++ b/meta/recipes-sato/gaku/gaku_git.bb
@@ -17,7 +17,6 @@ RRECOMMENDS_${PN} = "gst-plugins-good-id3demux \
 
 SRCREV = "a0be2fe4b5f12b8b07f4e3bd624b3729657f0ac5"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
index 5526a648..8d43785 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 SRCREV = "4740ad8d53aba4368ce3e03b06cfdc69eb86dcdc"
 PV = "0.3.3+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
diff --git a/meta/recipes-sato/libowl/libowl_git.bb b/meta/recipes-sato/libowl/libowl_git.bb
index 54ca62b..0c3f9a3 100644
--- a/meta/recipes-sato/libowl/libowl_git.bb
+++ b/meta/recipes-sato/libowl/libowl_git.bb
@@ -12,7 +12,6 @@ SECTION = "libs"
 DEPENDS = "gtk+"
 SRCREV = "6ebc8ac8f8575278dd40a535cadefa26374e44b1"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
index fb35f98..079d779 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
@@ -11,7 +11,6 @@ RDEPENDS_${PN} = "settings-daemon"
 
 SRCREV = "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index b17a766..d894e84 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -12,7 +12,6 @@ DEPENDS = "gtk+ startup-notification dbus"
 SECTION = "x11/wm"
 SRCREV = "71e3e6e04271e9d5a14f1c231ef100c7f320134d"
 PV = "2.0+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}-2"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index eff20f0..34542b2 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -13,7 +13,6 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "26a3a67b41c50e0ae163d8fe86ccf7a0f0a671ae"
 PV = "2.0+git${SRCPV}"
-PR = "r0"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
index 0cebd02..23dc043 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
@@ -2,7 +2,6 @@ require matchbox-theme-sato.inc
 
 SRCREV = "f72cf4ed7d71ad9e47b0f2d3dbc593bc2f3e76f8"
 PV = "0.2+git${SRCPV}"
-PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
index 2be4a56..4bd4a6a 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
@@ -11,7 +11,6 @@ SECTION = "x11"
 DEPENDS = "gtk+ startup-notification libfm"
 DEPENDS_append_poky = " libowl"
 
-PR = "r0"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
 
diff --git a/meta/recipes-sato/puzzles/puzzles_r9765.bb b/meta/recipes-sato/puzzles/puzzles_r9765.bb
index d13a87e..242c94a 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9765.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9765.bb
@@ -2,7 +2,6 @@ DESCRIPTION="Simon Tatham's Portable Puzzle Collection"
 HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 
 DEPENDS = "gtk+ libxt"
-PR = "r0"
 MOD_PV = "${@d.getVar('PV',1)[1:]}"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
index e417957..c3770ae 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
 
-PR = "r0"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
index 238348a..c0bb2b0 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
@@ -9,7 +9,6 @@ SECTION = "x11"
 SRCREV = "9a99528b02255450db81176abd9bbcc1dab9a4c1"
 PV = "0.0+git${SRCPV}"
 
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/xsettings-daemon \
            file://addsoundkeys.patch;apply=yes \
diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.21.bb
index 23d6c4e..2265a9c 100644
--- a/meta/recipes-support/db/db_5.3.21.bb
+++ b/meta/recipes-support/db/db_5.3.21.bb
@@ -14,7 +14,6 @@ HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
 LICENSE = "Sleepycat"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
-PR = "r0"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.."
diff --git a/meta/recipes-support/icu/icu_51.2.bb b/meta/recipes-support/icu/icu_51.2.bb
index 1278d22..aca3ea5 100644
--- a/meta/recipes-support/icu/icu_51.2.bb
+++ b/meta/recipes-support/icu/icu_51.2.bb
@@ -2,7 +2,6 @@ require icu.inc
 
 LIC_FILES_CHKSUM = "file://../license.html;md5=443a74288a72fad9069a74e7637192c1"
 
-PR = "r0"
 
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-51_2-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index e93a357..bcba1d5 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://libdaemon/daemon.h;beginline=9;endline=21;md5=bd9fbe57cd96d1a5848a8ba12d9a6bf4"
-PR = "r0"
 
 SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz"
 
diff --git a/meta/recipes-support/libical/libical_0.48.bb b/meta/recipes-support/libical/libical_0.48.bb
index 80f629c..459c5c5 100644
--- a/meta/recipes-support/libical/libical_0.48.bb
+++ b/meta/recipes-support/libical/libical_0.48.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
 
-PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
            file://pthread-fix.patch"
diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
index 055e20d..dfcff0b 100644
--- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "http://www.gnu.org/software/libiconv"
 SECTION = "libs"
 NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
 PROVIDES = "virtual/libiconv"
-PR = "r0"
 LICENSE = "LGPL"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
                     file://libcharset/COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index ae2e6b1..a100693 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
 DEPENDS = "libxml2"
-PR = "r0"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch"
diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
index 8b5756a..abfc81c 100644
--- a/meta/recipes-support/lzop/lzop_1.03.bb
+++ b/meta/recipes-support/lzop/lzop_1.03.bb
@@ -6,7 +6,6 @@ compression ratio. The lzop compression utility was designed with the goals \n\
 of reliability, speed, portability and with reasonable drop-in compatibility \n\
 to gzip."
 DEPENDS += "lzo"
-PR = "r0"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dfeaf3dc4beef4f5a7bdbc35b197f39e \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb
index 301cf27..ecf6fba 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb
@@ -1,5 +1,4 @@
 require shared-mime-info.inc
-PR = "r0"
 
 SRC_URI[md5sum] = "12ba00bf1cb2e69bfba73127e708e833"
 SRC_URI[sha256sum] = "184d094b157a9ec2607ad26a1a1837e6e07f3fcbeb38d8b6d412906156f9e06c"


