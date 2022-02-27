X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
Subject: [PATCH 5/6] meta, meta-selftest: Replace more non-SPDX license identifiers
Date: Sun, 27 Feb 2022 19:21:36 +0100
Message-ID: <20220227182138.5364-5-peter.kjellerstedt@axis.com>
In-Reply-To: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
References: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

In commit ceda3238 (meta/meta-selftest/meta-skeleton: Update LICENSE
variable to use SPDX license identifiers) all LICENSE variables were
updated to only use SPDX license identifiers.

This does the same for comments and other variables where it is
appropriate to use the official SPDX license identifiers. There are
still references to, e.g., "GPLv3", but they are then typically in
descriptive text where they refer to the license in a generic sense.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-test/license/incompatible-licenses.bb  |  2 +-
 .../recipes-test/selftest-ed/selftest-ed_0.5.bb    |  2 +-
 meta/classes/devicetree.bbclass                    |  4 ++--
 meta/classes/license.bbclass                       |  7 ++++---
 meta/conf/documentation.conf                       |  2 +-
 meta/recipes-bsp/usbutils/usbutils_014.bb          |  3 ++-
 meta/recipes-connectivity/avahi/avahi_0.8.bb       |  4 ++--
 meta/recipes-core/kbd/kbd_2.4.0.bb                 |  2 +-
 meta/recipes-core/readline/readline.inc            |  2 +-
 meta/recipes-devtools/elfutils/elfutils_0.186.bb   |  4 ++--
 meta/recipes-devtools/gcc/gcc-runtime.inc          |  2 +-
 .../icecc-create-env/icecc-create-env_0.1.bb       |  2 +-
 meta/recipes-devtools/rsync/rsync_3.2.3.bb         |  2 +-
 meta/recipes-extended/bash/bash_5.1.16.bb          |  2 +-
 meta/recipes-extended/findutils/findutils_4.9.0.bb |  2 +-
 meta/recipes-extended/gawk/gawk_5.1.1.bb           |  4 ++--
 meta/recipes-extended/gzip/gzip.inc                |  1 -
 meta/recipes-extended/gzip/gzip_1.11.bb            |  2 ++
 meta/recipes-extended/less/less_600.bb             |  2 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb           |  2 +-
 meta/recipes-extended/pam/libpam_1.5.2.bb          |  2 +-
 meta/recipes-extended/xz/xz_5.2.5.bb               |  9 +++++----
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb | 14 +++++++-------
 meta/recipes-multimedia/alsa/alsa-utils.inc        |  3 ++-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  | 14 ++++++++------
 meta/recipes-sato/l3afpad/l3afpad_git.bb           |  4 ++--
 26 files changed, 53 insertions(+), 46 deletions(-)

diff --git a/meta-selftest/recipes-test/license/incompatible-licenses.bb b/meta-selftest/recipes-test/license/incompatible-licenses.bb
index ab3b58d2c9..9709892644 100644
--- a/meta-selftest/recipes-test/license/incompatible-licenses.bb
+++ b/meta-selftest/recipes-test/license/incompatible-licenses.bb
@@ -1,3 +1,3 @@
 SUMMARY = "Recipe with multiple SPDX licenses"
 DESCRIPTION = "Is licensed with multiple SPDX licenses to be used for testing"
-LICENSE = "GPL-2.0-only & GPL-3.0 & LGPL-3.0-only"
+LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-3.0-only"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
index 4a9b94eceb..c5037a4912 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Line-oriented text editor -- selftest GPLv2 version"
+SUMMARY = "Line-oriented text editor -- selftest GPL-2.0-or-later version"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index 7f3b808572..2a62ae7bc8 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -15,8 +15,8 @@
 SECTION ?= "bsp"
 
 # The default inclusion of kernel device tree includes and headers means that
-# device trees built with them are at least GPLv2 (and in some cases dual
-# licensed). Default to GPLv2 if the recipe does not specify a license.
+# device trees built with them are at least GPL-2.0-only (and in some cases dual
+# licensed). Default to GPL-2.0-only if the recipe does not specify a license.
 LICENSE ?= "GPL-2.0-only"
 LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dec9867209..68c022248c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -193,7 +193,7 @@ def find_license_files(d):
                                     os.path.join(srcdir, non_generic_lic), None, None))
             non_generic_lics[non_generic_lic] = license_type
         else:
-            # Add explicity avoid of CLOSED license because this isn't generic
+            # Explicitly avoid the CLOSED license because this isn't generic
             if license_type != 'CLOSED':
                 # And here is where we warn people that their licenses are lousy
                 oe.qa.handle_error("license-exists",
@@ -252,7 +252,7 @@ def return_spdx(d, license):
 def canonical_license(d, license):
     """
     Return the canonical (SPDX) form of the license if available (so GPLv3
-    becomes GPL-3.0) or the passed license if there is no canonical form.
+    becomes GPL-3.0-only) or the passed license if there is no canonical form.
     """
     return d.getVarFlag('SPDXLICENSEMAP', license) or license
 
@@ -287,7 +287,8 @@ def expand_wildcard_licenses(d, wildcard_licenses):
     for wld_lic in wildcard_licenses:
         spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
         licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
-        # Assume if we're passed "GPLv3" or "*GPLv3" it means -or-later as well
+        # Assume that if we are passed "GPL-3.0" or "*GPL-3.0", then it means
+        # "-or-later" as well.
         if not wld_lic.endswith(("-or-later", "-only", "*", "+")):
             spdxflags = fnmatch.filter(spdxmapkeys, wld_lic + "+")
             licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 1789da0bb8..feb23a666b 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -226,7 +226,7 @@ IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in t
 IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
 IMAGE_TYPES[doc] = "Specifies the complete list of supported image types by default."
 INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
-INCOMPATIBLE_LICENSE[doc] = "Specifies a space-separated list of license names (as they would appear in LICENSE) that should be excluded from the build. Wildcard is supported, such as '*GPLv3'"
+INCOMPATIBLE_LICENSE[doc] = "Specifies a space-separated list of license names (as they would appear in LICENSE) that should be excluded from the build. Wildcard is supported, such as '*GPL-3.0*'"
 INHIBIT_DEFAULT_DEPS[doc] = "Prevents the default dependencies, namely the C compiler and standard C library (libc), from being added to DEPENDS."
 INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
diff --git a/meta/recipes-bsp/usbutils/usbutils_014.bb b/meta/recipes-bsp/usbutils/usbutils_014.bb
index 828eb4d36f..e728f1a190 100644
--- a/meta/recipes-bsp/usbutils/usbutils_014.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_014.bb
@@ -20,7 +20,8 @@ inherit autotools pkgconfig update-alternatives
 ALTERNATIVE:${PN} = "lsusb"
 ALTERNATIVE_PRIORITY = "100"
 
-# The binaries are mostly GPLv2+ apart from lsusb.py which is GPLv2 or v3.
+# The binaries are mostly GPL-2.0-or-later apart from lsusb.py which is
+# GPL-2.0-only or GPL-3.0-only.
 LICENSE:${PN} = "GPL-2.0-or-later"
 LICENSE:${PN}-python = "GPL-2.0-only | GPL-3.0-only"
 
diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 3e020e6780..9bb5e5861e 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -10,8 +10,8 @@ HOMEPAGE = "http://avahi.org"
 BUGTRACKER = "https://github.com/lathiat/avahi/issues"
 SECTION = "network"
 
-# major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts and
-# python scripts are under GPLv2+
+# major part is under LGPL-2.1-or-later, but several .dtd, .xsl, initscripts and
+# python scripts are under GPL-2.0-or-later
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
diff --git a/meta/recipes-core/kbd/kbd_2.4.0.bb b/meta/recipes-core/kbd/kbd_2.4.0.bb
index 5328e5ec3c..8a68d647e2 100644
--- a/meta/recipes-core/kbd/kbd_2.4.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.4.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Keytable files and keyboard utilities"
 HOMEPAGE = "http://www.kbd-project.org/"
 DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux console, virtual terminals, keyboard, etc.) – mainly, what they do is loading console fonts and keyboard maps."
-# everything minus console-fonts is GPLv2+
+# everything minus console-fonts is GPL-2.0-or-later
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 24a3301285..7f2f1a092b 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -6,7 +6,7 @@ lines, and perform csh-like history expansion on previous commands."
 SECTION = "libs"
 HOMEPAGE = "https://tiswww.case.edu/php/chet/readline/rltop.html"
 
-# GPLv2+ (< 6.0), GPLv3+ (>= 6.0)
+# GPL-2.0-or-later (< 6.0), GPL-3.0-or-later (>= 6.0)
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index f2f098eccb..46ee40cce6 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -102,8 +102,8 @@ BBCLASSEXTEND = "native nativesdk"
 # Package utilities separately
 PACKAGES =+ "${PN}-binutils libelf libasm libdw libdebuginfod"
 
-# shared libraries are licensed GPLv2 or GPLv3+, binaries GPLv3+
-# according to NEWS file:
+# Shared libraries are licensed GPL-2.0-only or GPL-3.0-or-later, binaries
+# GPL-3.0-or-later. According to NEWS file:
 # "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
 # programs. There is now also a formal CONTRIBUTING document describing how to
 # submit patches."
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c39a0caf8a..e9f2cf16e8 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -2,7 +2,7 @@ require gcc-configure-common.inc
 
 SUMMARY = "Runtime libraries from GCC"
 
-# Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
+# Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPL-3.0-only"
 # All gcc-runtime packages are now covered by the runtime exception.
 LICENSE = "GPL-3.0-with-GCC-exception"
 
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index ea95588c8c..b716b0245b 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "icecc environment setup script"
 DESCRIPTION = "This is a version of the icecc-create-env script that has \
 been modified in order to make it work with OE."
 SECTION = "base"
-# source file has just a "GPL" word, but upstream is GPLv2+.
+# source file has just a "GPL" word, but upstream is GPL-2.0-or-later.
 # most probably just GPL would be a mistake
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index b950e30b46..6168ee85fc 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://rsync.samba.org/"
 DESCRIPTION = "rsync is an open source utility that provides fast incremental file transfer."
 BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
 SECTION = "console/network"
-# GPLv2+ (<< 3.0.0), GPLv3+ (>= 3.0.0)
+# GPL-2.0-or-later (<< 3.0.0), GPL-3.0-or-later (>= 3.0.0)
 # Includes opennsh and xxhash dynamic link exception
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9e5a4f9b3a253d51520617aa54f8eb26"
diff --git a/meta/recipes-extended/bash/bash_5.1.16.bb b/meta/recipes-extended/bash/bash_5.1.16.bb
index 45c7c2b09c..d046faa4e5 100644
--- a/meta/recipes-extended/bash/bash_5.1.16.bb
+++ b/meta/recipes-extended/bash/bash_5.1.16.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+# GPL-2.0-or-later (< 4.0), GPL-3.0-or-later (>= 4.0)
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta/recipes-extended/findutils/findutils_4.9.0.bb b/meta/recipes-extended/findutils/findutils_4.9.0.bb
index 63560a4299..e4ce8ee4eb 100644
--- a/meta/recipes-extended/findutils/findutils_4.9.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.9.0.bb
@@ -1,6 +1,6 @@
 require findutils.inc
 
-# GPLv2+ (<< 4.2.32), GPLv3+ (>= 4.2.32)
+# GPL-2.0-or-later (<< 4.2.32), GPL-3.0-or-later (>= 4.2.32)
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
diff --git a/meta/recipes-extended/gawk/gawk_5.1.1.bb b/meta/recipes-extended/gawk/gawk_5.1.1.bb
index 40f994ff94..fe339805d0 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.1.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://www.gnu.org/software/gawk/"
 BUGTRACKER  = "bug-gawk@gnu.org"
 SECTION = "console/utils"
 
-# gawk <= 3.1.5: GPLv2
-# gawk >= 3.1.6: GPLv3
+# gawk <= 3.1.5: GPL-2.0-only
+# gawk >= 3.1.6: GPL-3.0-only
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 15fd665ac8..b32584033b 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -3,7 +3,6 @@ DESCRIPTION = "GNU Gzip is a popular data compression program originally written
 project. Mark Adler wrote the decompression part"
 HOMEPAGE = "http://www.gnu.org/software/gzip/"
 SECTION = "console/utils"
-# change to GPLv3+ in 2007/07. Previous GPLv2 version is 1.3.12
 
 inherit autotools texinfo
 export DEFS="NO_ASM"
diff --git a/meta/recipes-extended/gzip/gzip_1.11.bb b/meta/recipes-extended/gzip/gzip_1.11.bb
index cff4ed1717..321c9c31a4 100644
--- a/meta/recipes-extended/gzip/gzip_1.11.bb
+++ b/meta/recipes-extended/gzip/gzip_1.11.bb
@@ -1,5 +1,7 @@
 require gzip.inc
 
+# change to GPL-3.0-or-later in 2007/07. Previous GPL-2.0-or-later version is
+# 1.3.12
 LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_600.bb
index 8b715fac6b..9ebe39daab 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -5,7 +5,7 @@ programs. Less offers many features beyond those that more does."
 HOMEPAGE = "http://www.greenwoodsoftware.com/"
 SECTION = "console/utils"
 
-# (GPLv2+ (<< 418), GPLv3+ (>= 418)) | less
+# (GPL-2.0-or-later (<< 418), GPL-3.0-or-later (>= 418)) | less
 # Including email author giving permissing to use BSD
 #
 # From: Mark Nudelman <markn@greenwoodsoftware.com>
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 6f6e0c98ad..1c2fc8c37a 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tool for managing software RAID under Linux"
 HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
 DESCRIPTION = "mdadm is a Linux utility used to manage and monitor software RAID devices."
 
-# Some files are GPLv2+ while others are GPLv2.
+# Some files are GPL-2.0-only while others are GPL-2.0-or-later.
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 7277727745..081986ef43 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://fedorahosted.org/linux-pam/newticket"
 SECTION = "base"
 # PAM is dual licensed under GPL and BSD.
 # /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
-# libpam-runtime-1.0.1 is GPLv2+), by openembedded
+# libpam-runtime-1.0.1 is GPL-2.0-or-later), by openembedded
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
                     file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
diff --git a/meta/recipes-extended/xz/xz_5.2.5.bb b/meta/recipes-extended/xz/xz_5.2.5.bb
index c41987d87c..78aa6b20ca 100644
--- a/meta/recipes-extended/xz/xz_5.2.5.bb
+++ b/meta/recipes-extended/xz/xz_5.2.5.bb
@@ -3,10 +3,11 @@ HOMEPAGE = "https://tukaani.org/xz/"
 DESCRIPTION = "XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils."
 SECTION = "base"
 
-# The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only file
-# which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
-# and the LGPL bits are under lib/, which appears to be used for libgnu, which
-# appears to be used for DOS builds. So we're left with GPLv2+ and PD.
+# The source includes bits of PD, GPL-2.0, GPL-3.0, LGPL-2.1-or-later, but the
+# only file which is GPL-3.0 is an m4 macro which isn't shipped in any of our
+# packages, and the LGPL bits are under lib/, which appears to be used for
+# libgnu, which appears to be used for DOS builds. So we're left with
+# GPL-2.0-or-later and PD.
 LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
 LICENSE:${PN} = "GPL-2.0-or-later"
 LICENSE:${PN}-dev = "GPL-2.0-or-later"
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
index 76f37bfd59..c435f61d4c 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
@@ -6,15 +6,15 @@ HOMEPAGE = "http://alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "multimedia"
 
-# The primary license of alsa-plugins is LGPLv2.1.
+# The primary license of alsa-plugins is LGPL-2.1-only.
 #
-# m4/attributes.m4 is licensed under GPLv2+. m4/attributes.m4 is part of the
-# build system, and doesn't affect the licensing of the build result.
+# m4/attributes.m4 is licensed under GPL-2.0-or-later. m4/attributes.m4 is part
+# of the build system, and doesn't affect the licensing of the build result.
 #
-# The samplerate plugin source code is licensed under GPLv2+ to be consistent
-# with the libsamplerate license. However, if the licensee has a commercial
-# license for libsamplerate, the samplerate plugin may be used under the terms
-# of LGPLv2.1 like the rest of the plugins.
+# The samplerate plugin source code is licensed under GPL-2.0-or-later to be
+# consistent with the libsamplerate license. However, if the licensee has a
+# commercial license for libsamplerate, the samplerate plugin may be used under
+# the terms of LGPL-2.1-only like the rest of the plugins.
 LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://COPYING.GPL;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index b627ced1aa..bca7cdd3bd 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -4,7 +4,8 @@ designed to allow users to control the various parts of the ALSA system."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
-# Some parts are GPLv2+, some are only GPLv2 (e.g. axfer, alsactl) so result is GPLv2
+# Some parts are GPL-2.0-or-later, some are GPL-2.0-only (e.g. axfer, alsactl)
+# so result is GPL-2.0-only
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index bbab3ae038..a69dd32bd7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -5,7 +5,8 @@ HOMEPAGE = "http://www.pulseaudio.org"
 AUTHOR = "Lennart Poettering"
 SECTION = "libs/multimedia"
 
-# Most of PulseAudio code is under LGPLv2.1+. There are a few exceptions:
+# Most of PulseAudio code is under LGPL-2.1-or-later. There are a few
+# exceptions:
 #
 # The "adrian" echo canceller variant has code under a non-standard permissive
 # license. See src/modules/echo-cancel/adrian-license.txt for details. This
@@ -39,11 +40,12 @@ SECTION = "libs/multimedia"
 # The dependency with the most complicated licensing considerations is libdbus.
 # When PACKAGECONFIG[dbus] is enabled (like it is by default), libdbus will be
 # used by both the server and the client library (libpulse). Does this affect
-# applications that use libpulse? It should be also noted that libdbus is
-# dual-licensed: either GPLv2+ or AFL-2 terms apply. Whose decision is it which
-# of the licenses apply? What a mess. Some people hold the view that libdbus is
-# a system library that is covered by the "special exception" in GPLv2's
-# section 3, and therefore libdbus's GPL license doesn't affect PulseAudio.
+# applications that use libpulse? It should also be noted that libdbus is
+# dual-licensed: either GPL-2.0-or-later or AFL-2.0 terms apply. Whose decision
+# is it which of the licenses apply? What a mess. Some people hold the view that
+# libdbus is a system library that is covered by the "special exception" in
+# GPLv2's section 3, and therefore libdbus's GPL license doesn't affect
+# PulseAudio.
 LICENSE = "LGPL-2.1-or-later & MIT & BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index b06b0958a0..56cbe6bc8d 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -5,8 +5,8 @@ are implemented in the editor. L3afpad is simple to use, is easily compiled, \
 requires few libraries, and starts up quickly."
 HOMEPAGE = "https://github.com/stevenhoneyman/l3afpad"
 
-# Note that COPYING seems to mistakenly contain LGPLv2.1.
-# The source code is marked GPLv2+ and COPYING used to contain
+# Note that COPYING seems to mistakenly contain LGPL-2.1.
+# The source code is marked GPL-2.0-or-later and COPYING used to contain
 # that as well.
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
