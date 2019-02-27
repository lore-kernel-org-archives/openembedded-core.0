Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2A67CC81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 02:27:18 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d25so7205816pfn.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 18:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=auvWxhI87TanqPa9lXlotSnl2R4I3uoGbyXF+FjnGcY=;
	b=RSR6WEnSZPRbtxVPBBcQ72Rhh6HCpzg2HNDyveNcunLEH8WkKFzdXRVk9LpaSKF/k2
	pJ/+HJflyo9rIYoSs3ggPgAB7fMyQ6g62RPSxhFxb9QEbgy/PLBo64B3D0KjRtEE1t2T
	Mjd3eo1hlRAAET2mYzvFXxpFtwGEf/5n/eyZ1KyCQNTlOOMAXlUgMYG70V3skmQR4Duv
	mQFhcY1gOdL5FaN427H6EbMibd/9R97a/tfcPu+fkz7jV3bcQG7Svl081OuiTlRDT3Q+
	XvRo4jP2673IUIRBXrlP8444Sb3RHN8TIn9o2AkaAVZje+A9wfIRei88XK87SuP70c5L
	W6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=auvWxhI87TanqPa9lXlotSnl2R4I3uoGbyXF+FjnGcY=;
	b=hGFSHbll4Q9JIqF2dtoOrOkQtOuCvCBvPwWD67F89A2sejDFxUU+0L4U5FWznqqjYX
	lYNJRGqW4pTQEb32Su+0/3cChmDjxGdf897h7Begzj+7oJD96U99yXZjF0xrJl0ioHlu
	ma5/nzsB1Dvx391zLHgBUCkNMkmc5Wn0FFMKPgKvgok5BPbwmB2eQK5Lmb2Picjw6NUH
	IN/k5sRBV9oDpRgybkZvd7hnc8bipGO90QW002bnB2r2pSTkaHuoWODpG48umNOJzT/F
	TFD/TyzcKyXdjzaTBt/Rysccc7A1X5aW2YAGiyjju6t3l6tF/SWNSpIlZDGyeblWJFyb
	bJUA==
X-Gm-Message-State: AHQUAuayBzaDJd8P/lcWmAvGzUKv9iXwAu7Mn+JEKetLQxyuRfIL2F5O
	vW00Jd1WwC3HtQj/FQtF7Sua7QTp
X-Google-Smtp-Source: AHgI3IYH165kbZoS6+RvA1sB361ubaZ/e4Fr6LCcsuT5my7NhoHkAZxU44xt5AcxY9NrJOmp5PCpAg==
X-Received: by 2002:aa7:8b0b:: with SMTP id f11mr29768487pfd.123.1551234438573;
	Tue, 26 Feb 2019 18:27:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	h63sm36682710pfd.148.2019.02.26.18.27.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Feb 2019 18:27:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2019 18:27:04 -0800
Message-Id: <20190227022704.5376-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V5] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Wed, 27 Feb 2019 02:27:18 -0000
Content-Transfer-Encoding: 8bit

After eglibc was merged into glibc, Kconfig support was also dropped so
these libc features therefore are not effective anymore and can be
removed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Add ipv4 and ipv6 to default distro features, they are not libc
  specific anyway
- Remove DISTRO_FEATURES_DEFAULT as this is redundant now

v3:
- Remove the use of libc-* overrides in metadata

v4:
- Cleanup further to simplify variable assignments

v5:
- Keep DISTRO_FEATURES_DEFAULT, distros e.g. poky relies on it

 meta/classes/image.bbclass                    |  5 -----
 meta/classes/libc-package.bbclass             |  9 +++------
 meta/conf/bitbake.conf                        |  4 ++--
 .../distro/include/default-distrovars.inc     | 13 ++-----------
 meta/conf/distro/include/tclibc-glibc.inc     | 19 +++++--------------
 meta/conf/local.conf.sample.extended          | 16 ++--------------
 meta/recipes-core/glib-2.0/glib.inc           |  2 --
 meta/recipes-core/glibc/glibc_2.29.bb         |  3 +--
 meta/recipes-core/libxml/libxml2_2.9.8.bb     |  2 --
 meta/recipes-devtools/mtools/mtools_4.0.19.bb |  2 --
 .../findutils/findutils_4.6.0.bb              |  2 +-
 meta/recipes-extended/shadow/shadow.inc       |  2 +-
 meta/recipes-extended/shadow/shadow_4.6.bb    |  2 +-
 13 files changed, 18 insertions(+), 63 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 11927f39f5..276d0d31f4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -176,11 +176,6 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS').split()))}"
 
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locale-code libc-locales', True, False, d):
-        d.setVar('IMAGE_LINGUAS', '')
-}
-
 # Prefer image, but use the fallback files for lookups if the image ones
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 34c9151ae9..8859dad566 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -37,14 +37,11 @@ python __anonymous () {
                 d.setVar("DEPENDS", depends)
                 d.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "compile")
                 break
-
-    # try to fix disable charsets/locales/locale-code compile fail
-    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locales libc-locale-code', True, False, d):
-        d.setVar('PACKAGE_NO_GCONV', '0')
-    else:
-        d.setVar('PACKAGE_NO_GCONV', '1')
 }
 
+# try to fix disable charsets/locales/locale-code compile fail
+PACKAGE_NO_GCONV ?= "0"
+
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
 locale_base_postinst_ontarget() {
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 435646a946..1c5369ec98 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -123,7 +123,7 @@ TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
-USE_NLS ??= "${@bb.utils.contains('DISTRO_FEATURES', 'libc-locale-code', 'yes', 'no', d)}"
+USE_NLS ??= "yes"
 SDKUSE_NLS ??= "yes"
 
 TARGET_ARCH = "${TUNE_ARCH}"
@@ -820,7 +820,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
 DISTRO_FEATURES_NATIVE ?= "x11 ipv6 xattr"
-DISTRO_FEATURES_NATIVESDK ?= "x11 libc-charsets libc-locales libc-locale-code"
+DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 76edff6480..7a0baf3260 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,17 +10,8 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
-DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
-					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
-					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
-					libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
-					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
-					libc-posix-wchar-io"
-DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
-
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
+DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
 WHITELIST_GPL-3.0 ?= ""
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index abe619aaac..3246490997 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -22,17 +22,8 @@ LIBC_DEPENDENCIES = "libsegfault \
 		     glibc-dev \
 		     glibc-utils \
 		     glibc-thread-db \
-		     ${@get_libc_locales_dependencies(d)}"
-
-LIBC_LOCALE_DEPENDENCIES = "\
-	glibc-localedata-i18n \
-	glibc-gconv-ibm850 \
-	glibc-gconv-cp1252 \
-	glibc-gconv-iso8859-1 \
-	glibc-gconv-iso8859-15"
-
-def get_libc_locales_dependencies(d):
-    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locale-code libc-locales', True, False, d):
-        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
-    else:
-        return ''
+		     glibc-localedata-i18n \
+		     glibc-gconv-ibm850 \
+		     glibc-gconv-cp1252 \
+		     glibc-gconv-iso8859-1 \
+		     glibc-gconv-iso8859-15"
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 010bf6ca6f..0743fefece 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -24,22 +24,10 @@
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example.
 
-
-# glibc configurability is used to reduce minimal image's size.
-# the all supported glibc options are listed in DISTRO_FEATURES_LIBC
-# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
-# and DISTRO_FEATURES definitions to local.conf to enable the options.
-#DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
-#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
-#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-locales libc-locale-code \
-#               libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
-#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
-#               libc-posix-wchar-io"
-
-#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
 # If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
-#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
+#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
 
 # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
 # packages at build time using qemu-native. Disabling it (by setting it to 0)
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 6305f553b4..3c2440db0e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -41,8 +41,6 @@ EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'Tr
 # meson's python configuration pokes into python3 configuration, so this provides the native config to it.
 unset _PYTHON_SYSCONFIGDATA_NAME
 
-REQUIRED_DISTRO_FEATURES_libc-glibc = "${@'libc-charsets libc-locale-code libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d) else ''}"
-
 S = "${WORKDIR}/glib-${PV}"
 
 PACKAGECONFIG ??= "system-pcre libmount"
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index beddbffee2..bd8aa6d503 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -89,12 +89,11 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-stackguard-randomization \
                 --disable-crypt \
                 --with-default-link \
+                --enable-nscd \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-inet-anl', '--enable-nscd', '--disable-nscd', d)}"
-
 
 do_patch_append() {
     bb.build.exec_func('do_fix_readlib_c', d)
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index 0e2461154b..62643bc764 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -42,8 +42,6 @@ inherit autotools pkgconfig binconfig-disabled ptest distro_features_check
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
-REQUIRED_DISTRO_FEATURES_libc-glibc = "${@'libc-charsets libc-locale-code libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d) else ''}"
-
 RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell  python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
 RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.19.bb b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
index 9972762b4e..7d59d93a81 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.19.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
@@ -39,8 +39,6 @@ SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
 
 inherit autotools texinfo distro_features_check
 
-REQUIRED_DISTRO_FEATURES_libc-glibc = "libc-charsets libc-locale-code libc-locales"
-
 EXTRA_OECONF = "--without-x"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb b/meta/recipes-extended/findutils/findutils_4.6.0.bb
index 5e4ca94868..3b62ed9962 100644
--- a/meta/recipes-extended/findutils/findutils_4.6.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.6.0.bb
@@ -16,6 +16,6 @@ SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"
 SRC_URI[sha256sum] = "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d"
 
 # http://savannah.gnu.org/bugs/?27299
-CACHED_CONFIGUREVARS += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
+CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
 
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 09c37ef8a3..2b20bdcb25 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -57,7 +57,7 @@ EXTRA_OECONF += "--without-audit \
 NSCDOPT = ""
 NSCDOPT_class-native = "--without-nscd"
 NSCDOPT_class-nativesdk = "--without-nscd"
-NSCDOPT_libc-glibc = "${@bb.utils.contains('DISTRO_FEATURES', 'libc-spawn', '--with-nscd', '--without-nscd', d)}"
+NSCDOPT_libc-glibc = "--with-nscd"
           
 PAM_PLUGINS = "libpam-runtime \
                pam-plugin-faildelay \
diff --git a/meta/recipes-extended/shadow/shadow_4.6.bb b/meta/recipes-extended/shadow/shadow_4.6.bb
index 5675cb8cc9..c975395ff8 100644
--- a/meta/recipes-extended/shadow/shadow_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow_4.6.bb
@@ -2,7 +2,7 @@ require shadow.inc
 
 # Build falsely assumes that if --enable-libpam is set, we don't need to link against
 # libcrypt. This breaks chsh.
-BUILD_LDFLAGS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', bb.utils.contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt', '', d), '', d)}"
+BUILD_LDFLAGS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-lcrypt', '', d)}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.21.0


