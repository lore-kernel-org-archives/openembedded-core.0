Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.4446.1596317027725029812
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ea4Exmd0;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id i26so21367260edv.4
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRZfvqHYHZCFRRrq0pu0wxriqSN0I4f75hTH1BomeAM=;
        b=Ea4Exmd00Fosy+5fjbfzxjGKOgJzK2S6Mau8CbcVCcLbQbAPDmPtnJDM043iZzNIHO
         ZxjtZtUuG9iPO8KGhM3/MvVOa16Uh0qgEK2X5egUCMQslxmujgShZHCbYLctNqbJa4+a
         mO1qKFNZOHJbIjQw/K8UEwxs5SFqjJXG3r6nxxTZeurZpzRl73Q3dslYKJ9CZaog3f4Z
         pS+k4Tx5ue7CtN8xUr8KX+6d+gT/QcHTSJeFYwvIED7VilDf3Ai0MmN3wxgHmluVK4U6
         O924YbvKdeUbmyID8dwpKwTdzLKzjrsQjiUW/XrEeQT5TVaHvjbPQgARxzDHwIzsGqPO
         GM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRZfvqHYHZCFRRrq0pu0wxriqSN0I4f75hTH1BomeAM=;
        b=pkuKHCOiNv89RwV9Sm6pztiaEUs/yCVXCRp+uEWewEA8jyGL7x/XCm9eSvwA2oudy0
         rCAwZv2Mb57FV8gF1Umat8gK20jndEWwHRyNnz12myZeCmYrXBo2IuXkCVVPlyIUjN7u
         ihJykiKn2NOeommZ2MaCtwh6jRcwdWtDr9Z9UfSmy1KXmkiRjY+Z3UFCXj9BWM3iVAPV
         DpzyJlSfWVvAPhlBSHDMESioR3eRMliBqtVVEbd4/aTDBLe1/JVrh79XDWLDwVMeqdHg
         OMtf8zMwq2EHZ4VANGNQZu/ZrWML/BxBb+NuXSftlPF51IQ5/TD0ugSV/oc1JrvWQw9x
         2Fcg==
X-Gm-Message-State: AOAM530bZCA7KE781BL1GC7/+/JzdPm/G4X28Y+tP/wIp5TMUBhILiv2
	sNa0/wu0Y6VRCKsvGV9hnwakxf6v72I=
X-Google-Smtp-Source: ABdhPJwC94BIAxWx5b3D/td3Zy6/XxRlpRxJ1hq32S+oJYHlHnru76i+aEuU9cJbyZEcPos3sOCy1Q==
X-Received: by 2002:aa7:c442:: with SMTP id n2mr9403118edr.309.1596317025306;
        Sat, 01 Aug 2020 14:23:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/13] kbd: update 2.2.0 -> 2.3.0
Date: Sat,  1 Aug 2020 23:23:24 +0200
Message-Id: <20200801212335.14922-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop ptest support: upstream has rewritten the tests in GNU autotest,
which is another m4 monstrosity entirely incompatible with the idea of
installing tests to the target system.

All dropped patches are either merged upstream, or made for ptest.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 -
 ...append-i386-to-fix-libkbdfile-test08.patch | 45 ---------
 ...-analyze.l-add-missing-string-format.patch | 24 -----
 meta/recipes-core/kbd/kbd/fix_cflags.patch    | 25 -----
 meta/recipes-core/kbd/kbd/run-ptest           |  4 -
 .../kbd/set-proper-path-of-resources.patch    | 99 -------------------
 meta/recipes-core/kbd/kbd_2.2.0.bb            | 72 --------------
 meta/recipes-core/kbd/kbd_2.3.0.bb            | 38 +++++++
 8 files changed, 38 insertions(+), 270 deletions(-)
 delete mode 100644 meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
 delete mode 100644 meta/recipes-core/kbd/kbd/0001-analyze.l-add-missing-string-format.patch
 delete mode 100644 meta/recipes-core/kbd/kbd/fix_cflags.patch
 delete mode 100644 meta/recipes-core/kbd/kbd/run-ptest
 delete mode 100644 meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
 delete mode 100644 meta/recipes-core/kbd/kbd_2.2.0.bb
 create mode 100644 meta/recipes-core/kbd/kbd_2.3.0.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 1e99d4fa42..ce13368c2e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -21,7 +21,6 @@ PTESTS_FAST = "\
     gettext-ptest \
     gzip-ptest \
     json-glib-ptest \
-    kbd-ptest \
     libconvert-asn1-perl-ptest \
     liberror-perl-ptest \
     libmodule-build-perl-ptest \
diff --git a/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch b/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
deleted file mode 100644
index dc5236063b..0000000000
--- a/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4c12f76f4177cfd560cf708a16774ebfadbd41a5 Mon Sep 17 00:00:00 2001
-From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
-Date: Wed, 22 Jan 2020 11:02:17 -0500
-Subject: [PATCH] Use DATADIR and append i386 to fix libkbdfile-test08 ptest
- failure
-
-Replace ABS_DATADIR with DATADIR and append i386 to dirpath.
-
-Upstream-Status: Inappropriate [OE specific]
-
-This OE specific patch applies to kbd v2.2.0 for now, the upstream
-made drastic changes since v2.2.0, in fact they got rid of ABS_DATADIR
-in commit 5b6df5c along with a series of other commits which may or
-may not fix this issue. We will find out in future releases.
-
-Signed-off-by: Matthew Zeng<Matthew.Zeng@windriver.com>
----
- tests/libkbdfile-test08.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tests/libkbdfile-test08.c b/tests/libkbdfile-test08.c
-index bf41707..5e287f1 100644
---- a/tests/libkbdfile-test08.c
-+++ b/tests/libkbdfile-test08.c
-@@ -14,14 +14,14 @@ main(int __attribute__((unused)) argc, char **argv)
- 	if (!fp)
- 		kbd_error(EXIT_FAILURE, 0, "unable to create kbdfile");
-
--	const char *const dirpath[]  = { "", DATADIR "/findfile/test_0/keymaps/**", 0 };
-+	const char *const dirpath[]  = { "", DATADIR "/findfile/test_0/keymaps/i386/**", 0 };
- 	const char *const suffixes[] = { "", ".map", ".kmap", 0 };
-
--	const char *expect = ABS_DATADIR "/findfile/test_0/keymaps/i386/qwerty/test0.map";
-+	const char *expect = DATADIR "/findfile/test_0/keymaps/i386/qwerty/test0.map";
-
- 	int rc = 0;
-
--	rc = kbdfile_find((char *)(ABS_DATADIR "/findfile/test_0/keymaps/i386/qwerty/test0"), (char **) dirpath, (char **) suffixes, fp);
-+	rc = kbdfile_find((char *)"test0", (char **) dirpath, (char **) suffixes, fp);
-
- 	if (rc != 0)
- 		kbd_error(EXIT_FAILURE, 0, "unable to find file");
---
-2.24.1
-
diff --git a/meta/recipes-core/kbd/kbd/0001-analyze.l-add-missing-string-format.patch b/meta/recipes-core/kbd/kbd/0001-analyze.l-add-missing-string-format.patch
deleted file mode 100644
index 8916fd9f5e..0000000000
--- a/meta/recipes-core/kbd/kbd/0001-analyze.l-add-missing-string-format.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From dc6bf2ae0835c6569b270e8e1f26a3173f3927d9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 4 Dec 2019 13:14:01 +0100
-Subject: [PATCH] analyze.l: add missing string format
-
-Upstream-Status: Submitted [https://github.com/legionus/kbd/pull/35]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/libkeymap/analyze.l | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libkeymap/analyze.l b/src/libkeymap/analyze.l
-index e32ace6..de62f46 100644
---- a/src/libkeymap/analyze.l
-+++ b/src/libkeymap/analyze.l
-@@ -463,7 +463,7 @@ To                      to|To|TO
- 
- 					strerror_r(errno, buf, sizeof(buf));
- 
--					ERR(yyextra, buf);
-+					ERR(yyextra, "%s", buf);
- 					return(ERROR);
- 				}
- 
diff --git a/meta/recipes-core/kbd/kbd/fix_cflags.patch b/meta/recipes-core/kbd/kbd/fix_cflags.patch
deleted file mode 100644
index 37220960ab..0000000000
--- a/meta/recipes-core/kbd/kbd/fix_cflags.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-We need to ensure our CFLAGS are preserved as well as whatever tweak configure
-tries to make. Without these, the debug prefix changes get lost and we lose
-build reproducibility, likely with other side effects.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-2020/1/27
-
-Index: kbd-2.2.0/configure.ac
-===================================================================
---- kbd-2.2.0.orig/configure.ac
-+++ kbd-2.2.0/configure.ac
-@@ -72,9 +72,9 @@ if test "$enable_code_coverage" = yes; t
- fi
- 
- case "$GCC,$ac_cv_prog_cc_g" in
--	yes,yes) CFLAGS="-g $CC_O_LEVEL $FORTIFY_SOURCE" ;;
--	yes,)    CFLAGS="$CC_O_LEVEL $FORTIFY_SOURCE" ;;
--	   ,yes) CFLAGS="-g" ;;
-+	yes,yes) CFLAGS="-g $CC_O_LEVEL $FORTIFY_SOURCE $CFLAGS" ;;
-+	yes,)    CFLAGS="$CC_O_LEVEL $FORTIFY_SOURCE $CFLAGS" ;;
-+	   ,yes) CFLAGS="-g $CFLAGS" ;;
- esac
- 
- CC_CHECK_CFLAGS_APPEND([\
diff --git a/meta/recipes-core/kbd/kbd/run-ptest b/meta/recipes-core/kbd/kbd/run-ptest
deleted file mode 100644
index 7a2d205f54..0000000000
--- a/meta/recipes-core/kbd/kbd/run-ptest
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-CURDIR=$(dirname `readlink -f $0`)
-make -k -C ${CURDIR}/tests check-TESTS
diff --git a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
deleted file mode 100644
index 4b1e5b8eeb..0000000000
--- a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From cb3af8fb072f8999dbb5160bdc95a102b02fd37a Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Fri, 30 Sep 2016 16:49:55 +0800
-Subject: [PATCH] kbd: create ptest sub-package
-
-Upstream-Status: Inappropriate [embedded specific]
-
-kbd is out of source built, then the value of $(srcdir) is relative path of
-${S}/tests to ${B}/tests. Macro DATADIR is defined with $(srcdir) and replaced
-in .c files by compiler, and string @DATADIR@ is replaced with $(srdir) by rule
-"%: %.in" in Makefile.
-
-But kbd-ptest puts test cases and resource files in same directory, then some
-ptest cases fail to find resources.
-
-Replace DATADIR and @DATADIR@ with current directory(dot) to make test cases
-run as expected.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- tests/Makefile.am           | 4 ++--
- tests/alt-is-meta.in        | 2 +-
- tests/dumpkeys-bkeymap.in   | 4 ++--
- tests/dumpkeys-fulltable.in | 2 +-
- tests/dumpkeys-mktable.in   | 4 ++--
- 5 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 8d0ab69..5147c28 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -7,8 +7,8 @@ AM_CPPFLAGS = \
- 	-I$(builddir)/../src/libkeymap \
- 	-I$(srcdir)/../src/libkbdfile \
- 	-I$(builddir)/../src/libkbdfile \
--	-DDATADIR=\"$(srcdir)\" \
--	-DABS_DATADIR=\"$(realpath $(srcdir))\" \
-+	-DDATADIR=\".\" \
-+	-DABS_DATADIR=\"/usr/lib/kbd/ptest/tests\" \
- 	-DBUILDDIR=\"$(builddir)\"
- 
- AM_CFLAGS = $(CHECK_CFLAGS) $(CODE_COVERAGE_CFLAGS)
-diff --git a/tests/alt-is-meta.in b/tests/alt-is-meta.in
-index 3a1441f..d829f2e 100755
---- a/tests/alt-is-meta.in
-+++ b/tests/alt-is-meta.in
-@@ -7,7 +7,7 @@ cd "$cwd"
- rc=0
- temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
- 
--datadir="@DATADIR@/data/alt-is-meta"
-+datadir="./data/alt-is-meta"
- 
- ./libkeymap-showmaps "$datadir"/alt-is-meta.map > "$temp" || rc=$?
- cmp -s "$datadir/alt-is-meta.output" "$temp" || rc=$?
-diff --git a/tests/dumpkeys-bkeymap.in b/tests/dumpkeys-bkeymap.in
-index 03d4ca2..d1d0e26 100755
---- a/tests/dumpkeys-bkeymap.in
-+++ b/tests/dumpkeys-bkeymap.in
-@@ -9,8 +9,8 @@ temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
- 
- datadir="@DATADIR@"
- 
--./libkeymap-bkeymap "$datadir/"../data/keymaps/i386/qwerty/defkeymap.map > "$temp" || rc=$?
--cmp -s "$datadir/data/dumpkeys-bkeymap/bkeymap.bin" "$temp" || rc=$?
-+./libkeymap-bkeymap ../data/keymaps/i386/qwerty/defkeymap.map > "$temp" || rc=$?
-+cmp -s "./data/dumpkeys-bkeymap/bkeymap.bin" "$temp" || rc=$?
- 
- if [ "$rc" != 0 ]; then
- 	printf 'failed\n'
-diff --git a/tests/dumpkeys-fulltable.in b/tests/dumpkeys-fulltable.in
-index a3a5ece..67a73ef 100755
---- a/tests/dumpkeys-fulltable.in
-+++ b/tests/dumpkeys-fulltable.in
-@@ -5,7 +5,7 @@ cwd="$(readlink -ev "${0%/*}")"
- cd "$cwd"
- 
- BUILDDIR="@BUILDDIR@"
--DATADIR="@DATADIR@"
-+DATADIR="."
- 
- check_keymap() {
- 	local kmap temp rc
-diff --git a/tests/dumpkeys-mktable.in b/tests/dumpkeys-mktable.in
-index 0f17c40..7e5161d 100755
---- a/tests/dumpkeys-mktable.in
-+++ b/tests/dumpkeys-mktable.in
-@@ -7,8 +7,8 @@ cd "$cwd"
- rc=0
- temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
- 
--./libkeymap-mktable "@DATADIR@/"../data/keymaps/i386/qwerty/defkeymap.map > "$temp" || rc=$?
--cmp -s "@DATADIR@/data/dumpkeys-mktable/defkeymap.c" "$temp" || rc=$?
-+./libkeymap-mktable ../data/keymaps/i386/qwerty/defkeymap.map > "$temp" || rc=$?
-+cmp -s "./data/dumpkeys-mktable/defkeymap.c" "$temp" || rc=$?
- 
- if [ "$rc" != 0 ]; then
- 	printf 'failed\n'
diff --git a/meta/recipes-core/kbd/kbd_2.2.0.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
deleted file mode 100644
index e5700ff57f..0000000000
--- a/meta/recipes-core/kbd/kbd_2.2.0.bb
+++ /dev/null
@@ -1,72 +0,0 @@
-SUMMARY = "Keytable files and keyboard utilities"
-HOMEPAGE = "http://www.kbd-project.org/"
-# everything minus console-fonts is GPLv2+
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
-
-inherit autotools gettext ptest pkgconfig
-
-DEPENDS += "flex-native"
-
-RREPLACES_${PN} = "console-tools"
-RPROVIDES_${PN} = "console-tools"
-RCONFLICTS_${PN} = "console-tools"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
-           file://run-ptest \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://set-proper-path-of-resources.patch', '', d)} \
-           file://0001-analyze.l-add-missing-string-format.patch \
-           file://0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch \
-           file://fix_cflags.patch \
-           "
-
-SRC_URI[md5sum] = "d1d7ae0b5fb875dc082731e09cd0c8bc"
-SRC_URI[sha256sum] = "21a1bc5f6fb3b18ce9fdd717e4533368060a3182a39c7155eaf7ec0f5f83e9f7"
-
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-                  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests','', d)} \
-                  "
-
-PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
-PACKAGECONFIG[tests] = "--enable-tests, --disable-tests, libcheck"
-
-do_compile_ptest() {
-    oe_runmake -C ${B}/tests alt-is-meta dumpkeys-bkeymap dumpkeys-fulltable dumpkeys-mktable
-}
-
-do_install_ptest() {
-    install -D ${B}/tests/Makefile ${D}${PTEST_PATH}/tests/Makefile
-    sed -i -e '/Makefile:/,/^$/d' -e '/%: %.in/,/^$/d' \
-	-e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
-	-e 's:${DEBUG_PREFIX_MAP}::g' \
-	-e 's:${HOSTTOOLS_DIR}/::g' \
-	-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-	-e 's:${RECIPE_SYSROOT}::g' \
-	-e 's:${S}/config/missing::g' \
-	-e 's:${WORKDIR}::g' \
-	-e '/^lib.*_SOURCES =/d' -e '/$(EXEEXT):/,/^$/d' ${D}${PTEST_PATH}/tests/Makefile
-
-    find ${B}/tests -executable -exec install {} ${D}${PTEST_PATH}/tests \;
-    cp -rf ${S}/tests/data ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/findfile ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/data ${D}${PTEST_PATH}
-
-    install -D -m 755 ${S}/config/test-driver ${D}${PTEST_PATH}/config/test-driver
-}
-
-PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
-
-FILES_${PN}-consolefonts = "${datadir}/consolefonts"
-FILES_${PN}-consoletrans = "${datadir}/consoletrans"
-FILES_${PN}-keymaps = "${datadir}/keymaps"
-FILES_${PN}-unimaps = "${datadir}/unimaps"
-
-RDEPENDS_${PN}-ptest = "make"
-
-inherit update-alternatives
-
-ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey \
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'vlock','', d)}"
-ALTERNATIVE_PRIORITY = "100"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/kbd/kbd_2.3.0.bb b/meta/recipes-core/kbd/kbd_2.3.0.bb
new file mode 100644
index 0000000000..529f49bef4
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd_2.3.0.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Keytable files and keyboard utilities"
+HOMEPAGE = "http://www.kbd-project.org/"
+# everything minus console-fonts is GPLv2+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
+
+inherit autotools gettext pkgconfig
+
+DEPENDS += "flex-native"
+
+RREPLACES_${PN} = "console-tools"
+RPROVIDES_${PN} = "console-tools"
+RCONFLICTS_${PN} = "console-tools"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
+           "
+
+SRC_URI[sha256sum] = "685056143cb8effd0a1d44b5c391eb50d80dcfd014b1a4d6e2650a28d61cb82a"
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+                  "
+
+PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
+
+PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
+
+FILES_${PN}-consolefonts = "${datadir}/consolefonts"
+FILES_${PN}-consoletrans = "${datadir}/consoletrans"
+FILES_${PN}-keymaps = "${datadir}/keymaps"
+FILES_${PN}-unimaps = "${datadir}/unimaps"
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'vlock','', d)}"
+ALTERNATIVE_PRIORITY = "100"
+
+BBCLASSEXTEND = "native"
-- 
2.27.0

