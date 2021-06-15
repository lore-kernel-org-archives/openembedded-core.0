Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.6322.1623744771224161575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cTFXPx6H;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id g18so47916639edq.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HbV+in4E700ukPK8omxtVCAvNvQh5napqbvHV1An0U0=;
        b=cTFXPx6HhBt1VufTQHffEYZ1vdhORWIUy/NlAiDUhQSlqZxr4GkoieRM01oLho8Iqr
         im3CuQQEy/HQveYYLdAEgXc5SEV8wB5twWAKJojwJI+zcJ1AR6w++qHROO2+3nLbSyQK
         kBajJOibbMo6mmB4CTevgk3ABY7b2i4UEBPlZzrrtYR2IKOi1CltMH191GCUShqKPjlk
         WlhQi4w8LQfW5CwnZEC5I1+4FQAGgO1QdY5aVeBHfN2RbPpcFUSuldmZ00+OgcCuuVvE
         ZV1zmfbv6Y2+PiGKM+szViU8H+a1K6GkXnidCTWToj6god6gSCtyepX/Kl2aEgXJUctp
         nN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbV+in4E700ukPK8omxtVCAvNvQh5napqbvHV1An0U0=;
        b=uAMGb8L3qovfldKrkbo6sf9bQMlsqYNG2+Rqv3MaGv2Ul4UWjfTld5dNYUkScm9pUg
         8a3t4rCWE9Ayfwn4P5x31wBR/TULVj8dSFpf5UeBmWg4q5LyTXghlINdrHb61wvW78WY
         HZE3AYIRwqiDrMkwWjj0WzbOvUl/AxtEkJV+UuF18+qLLPqPevu5HVRcvGhGhnB2oQZS
         8x7Wq5PD2MSMBtKr+RFFti0tOWauUW1YsLaOssybuCCqpIEImVylxcDf2uI3WEI4Pvsb
         YDIL7sPsAbNTFLAg2FbiNGaosPrEw7/38qvHAoH23kv8acoqakxU6Zga8kpcU/I6dFJo
         A5qw==
X-Gm-Message-State: AOAM530qLi5cf373YblQvFisI/H2g2Unf0c6FvT3oij5ZRWueJ+Ydy58
	lrBbvi6pJPWU74140RYljGrXV25nyJOV5w==
X-Google-Smtp-Source: ABdhPJyQ3LCdcHiHgogKpNcVn3M3vkZ7wW8QcupM+ClEQPOPa4qlKLA19fVTLRT8enO3DYIK74Gzjw==
X-Received: by 2002:aa7:c40f:: with SMTP id j15mr21419059edq.169.1623744769822;
        Tue, 15 Jun 2021 01:12:49 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:49 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/31] util-linux: update 2.36.2 -> 2.37
Date: Tue, 15 Jun 2021 10:12:16 +0200
Message-Id: <20210615081240.1734087-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop manpages support, as it requires asciidoctor
(written in ruby, isn't in oe-core).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...d_2.36.2.bb => util-linux-libuuid_2.37.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  3 +-
 ...RA_LTLIBRARIES-instead-of-noinst_LTL.patch | 49 -------------------
 .../util-linux/avoid_parallel_tests.patch     | 27 ++++++----
 .../util-linux/util-linux/ptest.patch         | 15 +++---
 ...til-linux_2.36.2.bb => util-linux_2.37.bb} | 32 +-----------
 6 files changed, 28 insertions(+), 98 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.36.2.bb => util-linux-libuuid_2.37.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
 rename meta/recipes-core/util-linux/{util-linux_2.36.2.bb => util-linux_2.37.bb} (88%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6b47f417aa..6a7a6a968f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch \
            "
-SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
+SRC_URI[sha256sum] = "bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3dd1652d32d15cce5"
diff --git a/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch b/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
deleted file mode 100644
index 272518914e..0000000000
--- a/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Author: Luca Boccassi <luca.boccassi@microsoft.com>
-Description: Automake: use EXTRA_LTLIBRARIES instead of noinst_LTLIBRARIES
- noinst_LTLIBRARIES causes the libraries to be always built
- unconditionally. EXTRA_LTLIBRARIES causes them to be built
- only if other build target needs them.
- In other words, avoid building libcommon.a and libtcolors.a
- unless they are needed by another library/executable and
- save some build time.
-Upstream-Status: backport, commit:c65953d72bbc7412f32e566d9fa6e780d84f0696
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -39,7 +39,7 @@ bashcompletiondir = @bashcompletiondir@
- 
- dist_noinst_HEADERS =
- noinst_PROGRAMS =
--noinst_LTLIBRARIES =
-+EXTRA_LTLIBRARIES =
- usrbin_exec_PROGRAMS =
- usrsbin_exec_PROGRAMS =
- dist_man_MANS =
-@@ -169,7 +169,7 @@ else
- edit_cmd += -e 's|@vendordir[@]||g'
- endif
- 
--CLEANFILES += $(PATHFILES)
-+CLEANFILES += $(PATHFILES) $(EXTRA_LTLIBRARIES)
- EXTRA_DIST += $(PATHFILES:=.in)
- 
- $(PATHFILES): Makefile
---- a/lib/Makemodule.am
-+++ b/lib/Makemodule.am
-@@ -9,7 +9,7 @@
- # Note that you need "make install-strip" (or proper rpm / Debian build)
- # to generate binaries with only relevant stuff.
- #
--noinst_LTLIBRARIES += libcommon.la
-+EXTRA_LTLIBRARIES += libcommon.la
- libcommon_la_CFLAGS = $(AM_CFLAGS)
- libcommon_la_SOURCES = \
- 	lib/blkdev.c \
-@@ -59,7 +59,7 @@ libcommon_la_SOURCES += lib/sysfs.c
- endif
- endif
- 
--noinst_LTLIBRARIES += libtcolors.la
-+EXTRA_LTLIBRARIES += libtcolors.la
- libtcolors_la_CFLAGS = $(AM_CFLAGS)
- libtcolors_la_SOURCES = lib/colors.c lib/color-names.c include/colors.h include/color-names.h
- libtcolors_la_LIBADD =
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 748b6ef096..f1cbdb3beb 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,20 +1,29 @@
+From ee3c7812e1efa6719af68b994804f0e6caceabd8 Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Mon, 14 Jun 2021 14:00:31 +0200
+Subject: [PATCH] util-linux: Add ptest
+
 Ptest needs buildtest-TESTS and runtest-TESTS targets.
 serial-tests is required to generate those targets.
-Revert run.sh script accordingly to serialize running tests 
+Revert run.sh script accordingly to serialize running tests
 
 Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
-Upstream-Status: Inappropriate 
+Upstream-Status: Inappropriate
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: util-linux-2.32/configure.ac
-===================================================================
---- util-linux-2.32.orig/configure.ac
-+++ util-linux-2.32/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 5664f9f..075ef27 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
  dnl AC_USE_SYSTEM_EXTENSIONS must be called before any macros that run
- dnl the compiler (like AC_PROG_LIBTOOL) to avoid autoconf errors.
+ dnl the compiler (like LT_INIT) to avoid autoconf errors.
  AC_USE_SYSTEM_EXTENSIONS
--AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects])
-+AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects serial-tests])
+-AM_INIT_AUTOMAKE([-Wall -Wno-portability foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects])
++AM_INIT_AUTOMAKE([-Wall -Wno-portability foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects serial-tests])
  
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])],
  			    [AC_SUBST([AM_DEFAULT_VERBOSITY], [1])])
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 0537f7d856..ba2bd3f6ac 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,23 +1,24 @@
-Define TESTS variable
+From af073c13ef184ca75811df688e0a0a25827b36c3 Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Thu, 3 Dec 2015 04:08:00 +0100
+Subject: [PATCH] Define TESTS variable
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
+
 ---
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index bbaccb1..7d5a6bb 100644
+index 886598d..1cf4346 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -48,6 +48,7 @@ systemdsystemunit_DATA =
+@@ -57,6 +57,7 @@ systemdsystemunit_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
 +TESTS = $(check_PROGRAMS)
  
  PATHFILES =
- 
--- 
-2.8.3
-
+ ADOCFILES_COMMON =
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.37.bb
similarity index 88%
rename from meta/recipes-core/util-linux/util-linux_2.36.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.bb
index c79cf782d1..9a50c75e77 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.bb
@@ -1,7 +1,7 @@
 require util-linux.inc
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
+inherit autotools gettext pkgconfig systemd update-alternatives python3-dir bash-completion ptest
 DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
 
 PACKAGES =+ "${PN}-swaponoff"
@@ -92,9 +92,6 @@ EXTRA_OECONF_append = " --disable-hwclock-gplv3"
 #
 PACKAGECONFIG ?= "pcre2"
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-# inherit manpages requires this to be present, however util-linux does not have
-# configuration options, and installs manpages always
-PACKAGECONFIG[manpages] = ""
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 # Respect the systemd feature for uuidd
 PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
@@ -263,33 +260,6 @@ ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
 ALTERNATIVE_LINK_NAME[uuidgen] = "${bindir}/uuidgen"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
 
-ALTERNATIVE_${PN}-doc = "\
-blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
-mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1\
-"
-ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
-
-ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
-ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
-ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
-ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
-ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
-ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
-ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
-ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
-ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
-ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
-ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
-ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
-ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
-ALTERNATIVE_LINK_NAME[setpriv.1] = "${mandir}/man1/setpriv.1"
-ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
-ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
-ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
-ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
-ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
-
-
 BBCLASSEXTEND = "native nativesdk"
 
 PTEST_BINDIR = "1"
-- 
2.31.1

