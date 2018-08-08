Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 426C778875
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:34 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id p12-v6so1451690pfh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9gmmjuijuiOxymRmMbz3lxPcDBbtydkethbTGXG4IB8=;
	b=lblZ5JaUcsqBZvS6QnfVglwNYMtv87DIPRKnLO6XKE3IN/zEppTB7vjTcQFualbReV
	H35wiMu0ID/9dLeIucQUzycIHtpfB+1yaoITfuuGLbXM0pwJV8a/YmNSgNhDP16Bp8Lx
	YTrVATcr4bbKE1GbOgly1SeJpJMDzpgb0iX/Ev6WfgSNp/i4q3MktP0D7cf89YjZKSCZ
	WmAwdd161/JGIhKoy5V3IrXWp0aaepA47b1UOuj9/tserjSSAlpFHFWrkBa2ZDa7waip
	GYWk61+jF7yQfQ10/3rghhfsOQT7hCw1vxGb7ylHJQyA3kRIXd8Udb4Xm+AqODyD/ove
	7fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9gmmjuijuiOxymRmMbz3lxPcDBbtydkethbTGXG4IB8=;
	b=a1mMKkmw+XYK9pRjLiPfn3A4MD8feH1byH9CRK+N/Olv0xkNiuSZGhL0RCuuuaTd3f
	IHonARwMmqNDlwOE6zo8QnOR98U0HlMgNn7xNeMUZHvs0SpJ7G3eLgc9JA+Z9oTBaVXp
	Sf/Nz4DACImY+WyuS8zIhQ4MmWJW3p+80lD0ZG1+4uMOYLxIM6QQK1BjFKk8i5ILe/nf
	Mm68dk72SYzVb3dWsTOnlsRlrXDbhK3erDje8dDj2A8PQWinnrxGIhvl6y4WKylJjxo3
	EkO+dx3n7DRKW57/8DkNZWfjzWXC5EekabtA6L3VNSHh9gcsvCsbXUun6cmizSHR2hjR
	j95w==
X-Gm-Message-State: AOUpUlEWKGBx5+zRYG7wDlsf2v0sGyOKWvbuHMTtJkbO8l0ZVXjOWSL0
	jd5S7WeiVmw09QgURlgoFpIkR6H3
X-Google-Smtp-Source: AA+uWPyGpYDMar6EjyGCNv7YI/H1tT+uo481l6qeLRAkV/vt6nYrorFafN3uXpZbO8eiqg6MlgeQvQ==
X-Received: by 2002:a63:338e:: with SMTP id
	z136-v6mr3247268pgz.171.1533747873319; 
	Wed, 08 Aug 2018 10:04:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	h9-v6sm3673108pfe.187.2018.08.08.10.04.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:18 -0700
Message-Id: <3e08a58a8ee3144c2f1f6b7a1b3dff9dec1d5ae9.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] glibc: Upgrade to 2.28
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
X-List-Received-Date: Wed, 08 Aug 2018 17:04:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License-Update: libidn is dropped from glibc and a testcase that was a particular contributor copyrighted

see

https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=LICENSES;h=0e3a9fe39b26e97038d92f904508a4c3aa1bb43b;hp=b29efe01084af28cc40953d7317f22927c0ee3b7;hb=5a357506659f9a00fcf5bc9c5d8fc676175c89a7;hpb=7279af007c420a9d5f88a6909d11e7cb712c16a4
https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=LICENSES;h=b29efe01084af28cc40953d7317f22927c0ee3b7;hp=80f7f1487947f57815b9fe076fadc8c7f94eeb8e;hb=7f9f1ecb710eac4d65bb02785ddf288cac098323;hpb=5f7b841d3aebdccc2baed27cb4b22ddb08cd7c0c

Drop upstreamed and backported patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...2.27.bb => cross-localedef-native_2.28.bb} |  18 +-
 ...-initial_2.27.bb => glibc-initial_2.28.bb} |   0
 ...bc-locale_2.27.bb => glibc-locale_2.28.bb} |   0
 ...bc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} |   0
 ...-scripts_2.27.bb => glibc-scripts_2.28.bb} |   0
 ...Look-for-host-system-ld.so.cache-as-.patch |  12 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |  10 +-
 ...Raise-the-size-of-arrays-containing-.patch |  18 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   6 +-
 ...ake-relocatable-install-for-locales.patch} |  45 +-
 ...500-e6500-603e-fsqrt-implementation.patch} |  44 +-
 ...E_KNOWN_INTERPRETER_NAMES-to-known-.patch} |   6 +-
 ...ndefined-reference-to-__sqrt_finite.patch} |   6 +-
 ...are-now-inline-functions-and-call-o.patch} |   6 +-
 ...43-which-explains-what-the-patch-do.patch} |   8 +-
 ...-err-tab.pl-with-specific-dirs-in-S.patch} |   6 +-
 ...are-now-inline-functions-and-call-o.patch} |   6 +-
 ...gure.ac-handle-correctly-libc_cv_ro.patch} |   6 +-
 ....patch => 0014-Add-unused-attribute.patch} |   6 +-
 ...he-path-sets-wrong-config-variables.patch} |   6 +-
 ...one-re-written-tzselect-as-posix-sh.patch} |   6 +-
 ...ash-dependency-for-nscd-init-script.patch} |   6 +-
 ...s-building-and-testing-instructions.patch} |  10 +-
 ...libc-Help-bootstrap-cross-toolchain.patch} |  12 +-
 ...-eglibc-Clear-cache-lines-on-ppc8xx.patch} |   6 +-
 ...glibc-Resolve-__fpscr_values-on-SH4.patch} |   6 +-
 ...port-cross-locale-generation-support.patch |  28 +-
 ...Define-DUMMY_LOCALE_T-if-not-defined.patch |   6 +-
 ...ke-_dl_build_local_scope-breadth-fir.patch |  10 +-
 ...le-fix-hard-coded-reference-to-gcc-E.patch |   6 +-
 ...set-dl_load_write_lock-after-forking.patch |  14 +-
 ...ck-before-switching-to-malloc_atfork.patch |  30 +-
 ...sts.h-enum-definition-for-TRAP_HWBKP.patch |  14 +-
 ...with-memccpy-to-fix-Wstringop-trunca.patch |  40 --
 ...archive-uses-a-hard-coded-locale-pa.patch} |  23 +-
 ...t-no-lines-in-bison-generated-files.patch} |  17 +-
 .../0031-nativesdk-deprecate-libcrypt.patch   | 419 ------------------
 .../glibc/glibc/CVE-2017-18269.patch          | 178 --------
 .../glibc/glibc/CVE-2018-11236.patch          | 164 -------
 .../glibc/glibc/CVE-2018-11237.patch          |  82 ----
 .../glibc/{glibc_2.27.bb => glibc_2.28.bb}    |  46 +-
 42 files changed, 244 insertions(+), 1090 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.27.bb => cross-localedef-native_2.28.bb} (70%)
 rename meta/recipes-core/glibc/{glibc-initial_2.27.bb => glibc-initial_2.28.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.27.bb => glibc-locale_2.28.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.27.bb => glibc-scripts_2.28.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{relocate-locales.patch => 0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch => 0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch} (97%)
 rename meta/recipes-core/glibc/glibc/{0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch => 0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch} (85%)
 rename meta/recipes-core/glibc/glibc/{0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch => 0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch => 0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch => 0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (88%)
 rename meta/recipes-core/glibc/glibc/{0013-Add-unused-attribute.patch => 0014-Add-unused-attribute.patch} (86%)
 rename meta/recipes-core/glibc/glibc/{0014-yes-within-the-path-sets-wrong-config-variables.patch => 0015-yes-within-the-path-sets-wrong-config-variables.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0015-timezone-re-written-tzselect-as-posix-sh.patch => 0016-timezone-re-written-tzselect-as-posix-sh.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{0016-Remove-bash-dependency-for-nscd-init-script.patch => 0017-Remove-bash-dependency-for-nscd-init-script.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0017-eglibc-Cross-building-and-testing-instructions.patch => 0018-eglibc-Cross-building-and-testing-instructions.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0018-eglibc-Help-bootstrap-cross-toolchain.patch => 0019-eglibc-Help-bootstrap-cross-toolchain.patch} (91%)
 rename meta/recipes-core/glibc/glibc/{0019-eglibc-Clear-cache-lines-on-ppc8xx.patch => 0020-eglibc-Clear-cache-lines-on-ppc8xx.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0020-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0021-eglibc-Resolve-__fpscr_values-on-SH4.patch} (92%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
 rename meta/recipes-core/glibc/glibc/{archive-path.patch => 0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (69%)
 rename meta/recipes-core/glibc/glibc/{0030-plural_c_no_preprocessor_lines.patch => 0030-intl-Emit-no-lines-in-bison-generated-files.patch} (59%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11237.patch
 rename meta/recipes-core/glibc/{glibc_2.27.bb => glibc_2.28.bb} (72%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 24a21b5837..bed1594b7a 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.31%"
 GDBVERSION ?= "8.1%"
-GLIBCVERSION ?= "2.27%"
+GLIBCVERSION ?= "2.28%"
 LINUXLIBCVERSION ?= "4.15%"
 QEMUVERSION ?= "2.12%"
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
similarity index 70%
rename from meta/recipes-core/glibc/cross-localedef-native_2.27.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.28.bb
index 6a26376ac2..0992e0285d 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
 LICENSE = "LGPL-2.1"
 
-LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
+LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
@@ -21,20 +21,20 @@ SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
-SRCREV_glibc ?= "df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98"
+SRCREV_glibc ?= "3c03baca37fdcb52c3881e653ca392bba7a99c2b"
 SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
-           file://0015-timezone-re-written-tzselect-as-posix-sh.patch \
-           file://0016-Remove-bash-dependency-for-nscd-init-script.patch \
-           file://0017-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0018-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0019-eglibc-Clear-cache-lines-on-ppc8xx.patch \
-           file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
+           file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
+           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0019-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0020-eglibc-Clear-cache-lines-on-ppc8xx.patch \
+           file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://archive-path.patch \
+           file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-initial_2.27.bb b/meta/recipes-core/glibc/glibc-initial_2.28.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-initial_2.27.bb
rename to meta/recipes-core/glibc/glibc-initial_2.28.bb
diff --git a/meta/recipes-core/glibc/glibc-locale_2.27.bb b/meta/recipes-core/glibc/glibc-locale_2.28.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.27.bb
rename to meta/recipes-core/glibc/glibc-locale_2.28.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.27.bb b/meta/recipes-core/glibc/glibc-mtrace_2.28.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.27.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.28.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.27.bb b/meta/recipes-core/glibc/glibc-scripts_2.28.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.27.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.28.bb
diff --git a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 86234c9d2e..14089350d9 100644
--- a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,7 +1,7 @@
-From bd91b60ce6ff01f49b173b6b45e23ce94911b2a6 Mon Sep 17 00:00:00 2001
+From 70fd60e2a8f40a160736cb9b268dfa6508aa55a7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
-Subject: [PATCH 01/27] nativesdk-glibc: Look for host system ld.so.cache as
+Subject: [PATCH 01/30] nativesdk-glibc: Look for host system ld.so.cache as
  well
 
 Upstream-Status: Inappropriate [embedded specific]
@@ -31,10 +31,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 7554a99b5a..a73d11a62f 100644
+index c51e4b3718..44bbb69dc4 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2007,6 +2007,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2085,6 +2085,14 @@ _dl_map_object (struct link_map *loader, const char *name,
              }
          }
  
@@ -49,7 +49,7 @@ index 7554a99b5a..a73d11a62f 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2065,14 +2073,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2143,14 +2151,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
@@ -65,5 +65,5 @@ index 7554a99b5a..a73d11a62f 100644
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 899481f057..382915e840 100644
--- a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,7 +1,7 @@
-From 50736f7fc1fdc9e1f7c05f1fec75c977d9be9228 Mon Sep 17 00:00:00 2001
+From f0dd22dfdbf822afc674724c35cc462cfafbc186 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
-Subject: [PATCH 02/27] nativesdk-glibc: Fix buffer overrun with a relocated
+Subject: [PATCH 02/30] nativesdk-glibc: Fix buffer overrun with a relocated
  SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
@@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index a73d11a62f..62e3eee478 100644
+index 44bbb69dc4..74e2e5e962 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1707,7 +1707,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1785,7 +1785,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
@@ -46,5 +46,5 @@ index a73d11a62f..62e3eee478 100644
      {
        struct r_search_path_elem *this_dir = *dirs;
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 03f99916fa..f83e8192e2 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,7 +1,7 @@
-From 695e1cbff6ee6db3435c33e55311c67adf44476d Mon Sep 17 00:00:00 2001
+From 5962ca897efe965745e193c12041693c9e07dd24 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
-Subject: [PATCH 03/27] nativesdk-glibc: Raise the size of arrays containing dl
+Subject: [PATCH 03/30] nativesdk-glibc: Raise the size of arrays containing dl
  paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
@@ -41,10 +41,10 @@ index 6ee5153ff9..37a5f701fa 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 62e3eee478..6ddba73650 100644
+index 74e2e5e962..8f19186e1c 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -109,8 +109,8 @@ static size_t max_capstrlen attribute_relro;
+@@ -110,8 +110,8 @@ static size_t max_capstrlen attribute_relro;
     gen-trusted-dirs.awk.  */
  #include "trusted-dirs.h"
  
@@ -81,10 +81,10 @@ index fbdd814edf..9f4d8d69b1 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 453f56eb15..08e0c4c94b 100644
+index 1b0c74739f..a70a62d31e 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -128,6 +128,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -130,6 +130,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
@@ -92,7 +92,7 @@ index 453f56eb15..08e0c4c94b 100644
  
  /* LD_AUDIT variable contents.  Must be processed before the
     audit_list below.  */
-@@ -1000,12 +1001,12 @@ of this helper program; chances are you did not intend to run this program.\n\
+@@ -1001,12 +1002,12 @@ of this helper program; chances are you did not intend to run this program.\n\
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
  			object we can handle\n\
@@ -108,7 +108,7 @@ index 453f56eb15..08e0c4c94b 100644
        ++_dl_skip_args;
        --_dl_argc;
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index d6cf9d2a3e..9fcf970144 100644
+index f173cde71b..5c3205026f 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -36,7 +36,7 @@
@@ -136,5 +136,5 @@ index cf43f1cf3b..7f07adde53 100644
  # define add_system_dir(dir) add_dir (dir)
  #endif
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index f9d70c2a09..a0957e6a7b 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,7 +1,7 @@
-From 2bafdbd7067794c6a24e5e85608c0ec4638c5667 Mon Sep 17 00:00:00 2001
+From ee17ca0a6b122466c484301ea9fe029dc7e5498f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH 04/27] nativesdk-glibc: Allow 64 bit atomics for x86
+Subject: [PATCH 04/30] nativesdk-glibc: Allow 64 bit atomics for x86
 
 The fix consist of allowing 64bit atomic ops for x86.
 This should be safe for i586 and newer CPUs.
@@ -30,5 +30,5 @@ index 272da5dd8f..409c759f14 100644
  #define ATOMIC_EXCHANGE_USES_CAS 0
  
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/relocate-locales.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
similarity index 80%
rename from meta/recipes-core/glibc/glibc/relocate-locales.patch
rename to meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 2aea37f5ca..56ff398753 100644
--- a/meta/recipes-core/glibc/glibc/relocate-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,12 +1,24 @@
+From 7195d203c6986ccdb39053933b703391ccc6854a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Aug 2018 09:55:12 -0700
+Subject: [PATCH 05/30] nativesdk-glibc: Make relocatable install for locales
+
 The glibc locale path is hard-coded to the install prefix, but in SDKs we need
 to be able to relocate the binaries.  Expand the strings to 4K and put them in a
 magic segment that we can relocate at install time.
 
 Upstream-Status: Inappropriate (OE-specific)
+
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ locale/findlocale.c  | 4 ++--
+ locale/loadarchive.c | 2 +-
+ locale/localeinfo.h  | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index 872cadb5..da14fa39 100644
+index 872cadb5b9..dd651e07f5 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
 @@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
@@ -27,8 +39,21 @@ index 872cadb5..da14fa39 100644
      }
    else
      /* We really have to load some data.  First see whether the name is
+diff --git a/locale/loadarchive.c b/locale/loadarchive.c
+index 516d30d8d1..9bfbe1a5dd 100644
+--- a/locale/loadarchive.c
++++ b/locale/loadarchive.c
+@@ -42,7 +42,7 @@
+ 
+ 
+ /* Name of the locale archive file.  */
+-static const char archfname[] = COMPLOCALEDIR "/locale-archive";
++static const char archfname[4096] __attribute__ ((section (".gccrelocprefix"))) = COMPLOCALEDIR "/locale-archive";
+ 
+ /* Size of initial mapping window, optimal if large enough to
+    cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 68822a63..537bc351 100644
+index 68822a6319..537bc35149 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -325,7 +325,7 @@ _nl_lookup_word (locale_t l, int category, int item)
@@ -40,16 +65,6 @@ index 68822a63..537bc351 100644
  
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
-diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index 516d30d8..792b37fb 100644
---- a/locale/loadarchive.c
-+++ b/locale/loadarchive.c
-@@ -42,7 +43,7 @@
- 
- 
- /* Name of the locale archive file.  */
--static const char archfname[] = COMPLOCALEDIR "/locale-archive";
-+static const char archfname[4096] __attribute__ ((section (".gccrelocprefix"))) = COMPLOCALEDIR "/locale-archive";
- 
- /* Size of initial mapping window, optimal if large enough to
-    cover the header plus the initial locale.  */
+-- 
+2.18.0
+
diff --git a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
similarity index 97%
rename from meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
rename to meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index ad9106eefa..1e712d5eba 100644
--- a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,31 +1,31 @@
-From 661adfe9c220d10617bf6bb283827471c3956b01 Mon Sep 17 00:00:00 2001
+From b28e06d87a43e6aacff5624aaec75106599edec8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
-Subject: [PATCH 05/27] fsl e500/e5500/e6500/603e fsqrt implementation
+Subject: [PATCH 06/30] fsl e500/e5500/e6500/603e fsqrt implementation
 
 Upstream-Status: Pending
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c        | 134 +++++++++++++++++++++
- sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c       | 101 ++++++++++++++++
- sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c      | 134 +++++++++++++++++++++
- sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c     | 101 ++++++++++++++++
- sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c       | 134 +++++++++++++++++++++
- sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c      | 101 ++++++++++++++++
- sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c       | 134 +++++++++++++++++++++
- sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c      | 101 ++++++++++++++++
- sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c       | 134 +++++++++++++++++++++
- sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c      | 101 ++++++++++++++++
- sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c       | 134 +++++++++++++++++++++
- sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c      | 101 ++++++++++++++++
- .../sysv/linux/powerpc/powerpc32/603e/fpu/Implies  |   1 +
- .../linux/powerpc/powerpc32/e300c3/fpu/Implies     |   2 +
- .../linux/powerpc/powerpc32/e500mc/fpu/Implies     |   1 +
- .../sysv/linux/powerpc/powerpc32/e5500/fpu/Implies |   1 +
- .../sysv/linux/powerpc/powerpc32/e6500/fpu/Implies |   1 +
- .../sysv/linux/powerpc/powerpc64/e5500/fpu/Implies |   1 +
- .../sysv/linux/powerpc/powerpc64/e6500/fpu/Implies |   1 +
+ sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c   | 134 ++++++++++++++++++
+ sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c  | 101 +++++++++++++
+ sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c | 134 ++++++++++++++++++
+ .../powerpc/powerpc32/e500mc/fpu/e_sqrtf.c    | 101 +++++++++++++
+ sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c  | 134 ++++++++++++++++++
+ sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c | 101 +++++++++++++
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c  | 134 ++++++++++++++++++
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c | 101 +++++++++++++
+ sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c  | 134 ++++++++++++++++++
+ sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c | 101 +++++++++++++
+ sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c  | 134 ++++++++++++++++++
+ sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c | 101 +++++++++++++
+ .../linux/powerpc/powerpc32/603e/fpu/Implies  |   1 +
+ .../powerpc/powerpc32/e300c3/fpu/Implies      |   2 +
+ .../powerpc/powerpc32/e500mc/fpu/Implies      |   1 +
+ .../linux/powerpc/powerpc32/e5500/fpu/Implies |   1 +
+ .../linux/powerpc/powerpc32/e6500/fpu/Implies |   1 +
+ .../linux/powerpc/powerpc64/e5500/fpu/Implies |   1 +
+ .../linux/powerpc/powerpc64/e6500/fpu/Implies |   1 +
  19 files changed, 1418 insertions(+)
  create mode 100644 sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
  create mode 100644 sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
@@ -1580,5 +1580,5 @@ index 0000000000..04ff8cc181
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
similarity index 85%
rename from meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
rename to meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index a3d50fd054..251e9dd4b1 100644
--- a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,7 +1,7 @@
-From 615598fcca64461a71d84f756d75374f02d914ad Mon Sep 17 00:00:00 2001
+From fd2bd3037ef49f67f12659b6aaba02f76e131a24 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH 06/27] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
+Subject: [PATCH 07/30] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
  names
 
 This bolts in a hook for OE to pass its own version of interpreter
@@ -29,5 +29,5 @@ index 573c01476c..d8c7412287 100644
  
  static struct known_names known_libs[] =
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
similarity index 98%
rename from meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
rename to meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index 1234df0a09..67439c4b87 100644
--- a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,7 +1,7 @@
-From 804b73ae295bdfda29341e89f2d0c1b99492dc9a Mon Sep 17 00:00:00 2001
+From b696fe0c6147afc375ae573063a92a53857248eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
-Subject: [PATCH 07/27] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+Subject: [PATCH 08/30] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
 
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
@@ -204,5 +204,5 @@ index 26fa067abf..9d175122a8 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
similarity index 98%
rename from meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
rename to meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 1b43647514..1d27a56c79 100644
--- a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,7 +1,7 @@
-From 1a53084249d9dae1ef4281246efc899c8f9d63ed Mon Sep 17 00:00:00 2001
+From 324aa1ffbf85ebd06b54f228604d6651895c1eea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
-Subject: [PATCH 08/27] __ieee754_sqrt{,f} are now inline functions and call
+Subject: [PATCH 09/30] __ieee754_sqrt{,f} are now inline functions and call
  out __slow versions
 
 Upstream-Status: Pending
@@ -383,5 +383,5 @@ index 9d175122a8..10de1f0cc3 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
rename to meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index ea498569b3..6b2bf65cac 100644
--- a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,7 +1,7 @@
-From 48262b6dda935278a40374ddf0080ab6cc999582 Mon Sep 17 00:00:00 2001
+From f6581da98bef982c888061fa06092c03f3c6c708 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH 09/27] Quote from bug 1443 which explains what the patch does
+Subject: [PATCH 10/30] Quote from bug 1443 which explains what the patch does
  :
 
   We build some random program and link it with -lust.  When we run it,
@@ -45,7 +45,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/arm/dl-machine.h b/sysdeps/arm/dl-machine.h
-index 8a00eab5e3..623edcb1bd 100644
+index 1a4fd3f17b..a02c47571a 100644
 --- a/sysdeps/arm/dl-machine.h
 +++ b/sysdeps/arm/dl-machine.h
 @@ -510,7 +510,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
@@ -58,5 +58,5 @@ index 8a00eab5e3..623edcb1bd 100644
  
  	case R_ARM_TLS_TPOFF32:
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
similarity index 89%
rename from meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
rename to meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index 17513185da..dfe2fe4b83 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From 72ea5410909aef6b6aee70e7f9a88d534583aa00 Mon Sep 17 00:00:00 2001
+From 635d4a48c331b5ccc9165a6f622091845a5245b0 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH 10/27] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH 11/30] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -32,5 +32,5 @@ index c2756640a7..1b5bb16a96 100644
  	touch $@
  
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
rename to meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 1e70b2a30e..3fcaedd8ef 100644
--- a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,7 +1,7 @@
-From 8ae998a10b24545e0c12f1f3d8be97b191178204 Mon Sep 17 00:00:00 2001
+From 11991e14957063b0e5fa366d836f42dd6d3e10cd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
-Subject: [PATCH 11/27] __ieee754_sqrt{,f} are now inline functions and call
+Subject: [PATCH 12/30] __ieee754_sqrt{,f} are now inline functions and call
  out __slow versions
 
 Upstream-Status: Pending
@@ -57,5 +57,5 @@ index 812653558f..10de1f0cc3 100644
  #endif
  {
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
similarity index 88%
rename from meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
rename to meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index c35b759a28..32796354a0 100644
--- a/meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From 4f9f39761909e67bd6d29b970b7165863e33e565 Mon Sep 17 00:00:00 2001
+From 36b0c04436f6ec7dc270d387cb036b5361544618 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH 12/27] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH 13/30] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -38,5 +38,5 @@ index 634fe4de2a..3db1697f4f 100644
    ;;
  esac
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
similarity index 86%
rename from meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch
rename to meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
index 62c65253dd..cfc044506b 100644
--- a/meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
@@ -1,7 +1,7 @@
-From bba7a647b636618d5fd083e904f995f7736b9168 Mon Sep 17 00:00:00 2001
+From f1969e4c95e810280edf5e11c8a6f32b3a56e2fb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH 13/27] Add unused attribute
+Subject: [PATCH 14/30] Add unused attribute
 
 Helps in avoiding gcc warning when header is is included in
 a source file which does not use both functions
@@ -30,5 +30,5 @@ index 123e2a62ce..63cc83ec84 100644
  {
    int slash_count = 0;
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
similarity index 98%
rename from meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch
rename to meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
index 66911285a9..217a3f6088 100644
--- a/meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From 62f44ce3dd01a257cf67116e355492cb1659a917 Mon Sep 17 00:00:00 2001
+From be9965d0e53db1d7fe9419710a84c75526a18cc0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH 14/27] 'yes' within the path sets wrong config variables
+Subject: [PATCH 15/30] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -259,5 +259,5 @@ index f9cba6e15d..b21f72f1e4 100644
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
similarity index 90%
rename from meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch
rename to meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
index 66bf4fdabd..719193cbf9 100644
--- a/meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From ac240fb01f6470ac207968adfbe20ccc93b16f8b Mon Sep 17 00:00:00 2001
+From 60694f7ed69c8b711ffe37ce157032e85f60347b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH 15/27] timezone: re-written tzselect as posix sh
+Subject: [PATCH 16/30] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -41,5 +41,5 @@ index d2c3a6d1dd..089679f306 100755
  # Output one argument as-is to standard output.
  # Safer than 'echo', which can mishandle '\' or leading '-'.
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
similarity index 92%
rename from meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch
rename to meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index 0b1ee96871..e1a0d4918a 100644
--- a/meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,7 +1,7 @@
-From 790b133ff2bc5b77ed8533b8999abc65ed0da02b Mon Sep 17 00:00:00 2001
+From 0d6e36d38569ec716331c48a2187b391f5680363 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH 16/27] Remove bash dependency for nscd init script
+Subject: [PATCH 17/30] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
@@ -71,5 +71,5 @@ index a882da7d8b..b02986ec15 100644
  	;;
  esac
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
similarity index 99%
rename from meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch
rename to meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index fd821323d7..fa8d127f7a 100644
--- a/meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,15 +1,15 @@
-From 897430bbb65a0f22284d7957206b5fd4efd6607f Mon Sep 17 00:00:00 2001
+From 448222134c9a0b147c4598f288ccc9d045b873c4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH 17/27] eglibc: Cross building and testing instructions
+Subject: [PATCH 18/30] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- GLIBC.cross-building | 383 +++++++++++++++++++++++++++++++++++++++++++++++++++
- GLIBC.cross-testing  | 205 +++++++++++++++++++++++++++
+ GLIBC.cross-building | 383 +++++++++++++++++++++++++++++++++++++++++++
+ GLIBC.cross-testing  | 205 +++++++++++++++++++++++
  2 files changed, 588 insertions(+)
  create mode 100644 GLIBC.cross-building
  create mode 100644 GLIBC.cross-testing
@@ -615,5 +615,5 @@ index 0000000000..b67b468466
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
similarity index 91%
rename from meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch
rename to meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
index 80d547c80d..c7e8bd2ee9 100644
--- a/meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From fcfa19b69e8749477022161a808a201807ef72ec Mon Sep 17 00:00:00 2001
+From 6b8ee1ae86f8b9a49f751ab211002c83744356a6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH 18/27] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH 19/30] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index bea4e27f8d..8c83cfadc6 100644
+index d3f25a525a..ab383867e2 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -70,9 +70,18 @@ subdir-dirs = include
@@ -52,7 +52,7 @@ index bea4e27f8d..8c83cfadc6 100644
  ifeq (yes,$(build-shared))
  headers += gnu/lib-names.h
  endif
-@@ -152,6 +161,16 @@ others: $(common-objpfx)testrun.sh
+@@ -195,6 +204,16 @@ others: $(common-objpfx)testrun.sh
  
  subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
  
@@ -69,7 +69,7 @@ index bea4e27f8d..8c83cfadc6 100644
  ifndef abi-variants
  installed-stubs = $(inst_includedir)/gnu/stubs.h
  else
-@@ -178,6 +197,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
+@@ -221,6 +240,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
  
  install-others-nosubdir: $(installed-stubs)
  endif
@@ -96,5 +96,5 @@ index 0000000000..1d2b669aff
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
rename to meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
index 17bfe4fe84..d3f4b6a319 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
@@ -1,7 +1,7 @@
-From c6f2db0d7c5c65bfa19766a0e1ce8210111f9c7d Mon Sep 17 00:00:00 2001
+From 617ca176291df82c29d8c78e92ba8edcb38a2fe2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:15:09 -0800
-Subject: [PATCH 19/27] eglibc: Clear cache lines on ppc8xx
+Subject: [PATCH 20/30] eglibc: Clear cache lines on ppc8xx
 
 2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
             Mark Shinwell  <shinwell@codesourcery.com>
@@ -79,5 +79,5 @@ index f2ad0c355d..3e6773795e 100644
  	break;
  #ifndef SHARED
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
similarity index 92%
rename from meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
rename to meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 09f7670758..881bd911fc 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From 577085016bb926a687abec145557fe8cb8f5af0e Mon Sep 17 00:00:00 2001
+From 78e379d65f4fc810fb095a97c4f36f0b79bb5e01 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH 20/27] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH 21/30] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -52,5 +52,5 @@ index c4e28ffb98..648bae03d5 100644
 +weak_alias (___fpscr_values, __fpscr_values)
 +
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
index a629ce141a..04a5be7fcb 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,24 +1,24 @@
-From e019fe6a2b410db6043e21803f497b5cbdd90a83 Mon Sep 17 00:00:00 2001
+From 3e24f9d63aef5561b80fc7c345ce61943910e69b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH 22/27] eglibc: Forward port cross locale generation support
+Subject: [PATCH 22/30] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- locale/Makefile               |  3 ++-
- locale/catnames.c             | 48 +++++++++++++++++++++++++++++++++++
+ locale/Makefile               |  3 +-
+ locale/catnames.c             | 48 ++++++++++++++++++++++++++++
  locale/localeinfo.h           |  2 +-
- locale/programs/charmap-dir.c |  6 +++++
- locale/programs/ld-collate.c  | 17 ++++++-------
- locale/programs/ld-ctype.c    | 27 ++++++++++----------
- locale/programs/ld-time.c     | 31 +++++++++++++++--------
+ locale/programs/charmap-dir.c |  6 ++++
+ locale/programs/ld-collate.c  | 17 +++++-----
+ locale/programs/ld-ctype.c    | 27 ++++++++--------
+ locale/programs/ld-time.c     | 31 ++++++++++++------
  locale/programs/linereader.c  |  2 +-
- locale/programs/localedef.c   |  8 ++++++
- locale/programs/locfile.c     |  5 +++-
- locale/programs/locfile.h     | 59 +++++++++++++++++++++++++++++++++++++++++--
- locale/setlocale.c            | 30 ----------------------
+ locale/programs/localedef.c   |  8 +++++
+ locale/programs/locfile.c     |  5 ++-
+ locale/programs/locfile.h     | 59 +++++++++++++++++++++++++++++++++--
+ locale/setlocale.c            | 30 ------------------
  12 files changed, 169 insertions(+), 69 deletions(-)
  create mode 100644 locale/catnames.c
 
@@ -91,7 +91,7 @@ index 0000000000..9fad357db1
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 68822a6319..fa36123776 100644
+index 537bc35149..73ba20d695 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -224,7 +224,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
@@ -562,5 +562,5 @@ index e4de907e1f..b5d8f5c17d 100644
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
index ae708ef83e..092e90e5e3 100644
--- a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 9d71526be21abe68dd8ca3a5a219445851bbc2f4 Mon Sep 17 00:00:00 2001
+From 24f3fbd925b6af96c4369184528028b144b51310 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH 23/27] Define DUMMY_LOCALE_T if not defined
+Subject: [PATCH 23/30] Define DUMMY_LOCALE_T if not defined
 
 This is a hack to fix building the locale bits on an older
 CentOs 5.X machine
@@ -28,5 +28,5 @@ index 9956cd8446..04342f3644 100644
  #define PACKAGE _libc_intl_domainname
  #ifndef VERSION
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index 42ff667811..c78b4a3325 100644
--- a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,7 +1,7 @@
-From 03873af286f1dab1062f598d6deb774ce513421d Mon Sep 17 00:00:00 2001
+From 9f02a73c41782688f43e01bc2adbba09fc83b51e Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH 24/27] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+Subject: [PATCH 24/30] elf/dl-deps.c: Make _dl_build_local_scope breadth first
 
 According to the ELF specification:
 
@@ -24,10 +24,10 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/elf/dl-deps.c b/elf/dl-deps.c
-index c975fcffd7..6ee58c74e0 100644
+index 9d9b1ba7f2..8414028c58 100644
 --- a/elf/dl-deps.c
 +++ b/elf/dl-deps.c
-@@ -72,13 +72,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
+@@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
  {
    struct link_map **p = list;
    struct link_map **q;
@@ -52,5 +52,5 @@ index c975fcffd7..6ee58c74e0 100644
  }
  
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
index 7f5d1421d3..5eb1a019a4 100644
--- a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
+++ b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
@@ -1,7 +1,7 @@
-From 56dab024751941c07eb479f47ef6682e2168c86a Mon Sep 17 00:00:00 2001
+From 985b3d9e9b3f99f5a23c0c68e8657e311ca6f42d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
 Date: Mon, 22 Aug 2016 16:09:25 +0200
-Subject: [PATCH 25/27] locale: fix hard-coded reference to gcc -E
+Subject: [PATCH 25/30] locale: fix hard-coded reference to gcc -E
 
 When new version of compilers are published, they may not be compatible with
 older versions of software. This is particularly common when software is built
@@ -34,5 +34,5 @@ index 30d3f2f195..e97653017c 100644
  
  sub cstrlen {
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
index eca1193dd3..ad10b3c715 100644
--- a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
+++ b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
@@ -1,7 +1,7 @@
-From 847d37d5a34e4bf294de4ba98de3668950e28bc7 Mon Sep 17 00:00:00 2001
+From c26abfc71ef461ef4980f57a35870b68826bd619 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jan 2018 10:05:07 -0800
-Subject: [PATCH 26/27] reset dl_load_write_lock after forking
+Subject: [PATCH 26/30] reset dl_load_write_lock after forking
 
 The patch in this Bugzilla entry was requested by a customer:
 
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index 846fa49ef2..f87506f398 100644
+index ec56a827eb..0f48933ff1 100644
 --- a/sysdeps/nptl/fork.c
 +++ b/sysdeps/nptl/fork.c
-@@ -194,9 +194,9 @@ __libc_fork (void)
+@@ -130,9 +130,9 @@ __libc_fork (void)
  	  _IO_list_resetlock ();
  	}
  
@@ -33,8 +33,8 @@ index 846fa49ef2..f87506f398 100644
 -
 +      __rtld_lock_initialize (GL(dl_load_write_lock));
        /* Run the handlers registered for the child.  */
-       while (allp != NULL)
- 	{
+       __run_fork_handlers (atfork_run_child);
+     }
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
index 9ec234bd51..1ad14b7fc3 100644
--- a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
+++ b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
@@ -1,7 +1,7 @@
-From 94225ab4bcc1613531558a632270b5edce779bc9 Mon Sep 17 00:00:00 2001
+From c3e04a90dd762cad4ee9bd7564d74e052781be5c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jan 2018 10:08:04 -0800
-Subject: [PATCH 27/27] Acquire ld.so lock before switching to malloc_atfork
+Subject: [PATCH 27/30] Acquire ld.so lock before switching to malloc_atfork
 
 The patch is from
   https://sourceware.org/bugzilla/show_bug.cgi?id=4578
@@ -28,11 +28,11 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/nptl/fork.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
+ sysdeps/nptl/fork.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index f87506f398..225e7b51f8 100644
+index 0f48933ff1..eef3f9669b 100644
 --- a/sysdeps/nptl/fork.c
 +++ b/sysdeps/nptl/fork.c
 @@ -25,6 +25,7 @@
@@ -43,22 +43,20 @@ index f87506f398..225e7b51f8 100644
  #include <stdio-lock.h>
  #include <atomic.h>
  #include <nptl/pthreadP.h>
-@@ -60,6 +61,10 @@ __libc_fork (void)
-      but our current fork implementation is not.  */
+@@ -56,6 +57,9 @@ __libc_fork (void)
    bool multiple_threads = THREAD_GETMEM (THREAD_SELF, header.multiple_threads);
  
+   __run_fork_handlers (atfork_run_prepare);
 +  /* grab ld.so lock BEFORE switching to malloc_atfork */
 +  __rtld_lock_lock_recursive (GL(dl_load_lock));
 +  __rtld_lock_lock_recursive (GL(dl_load_write_lock));
-+
-   /* Run all the registered preparation handlers.  In reverse order.
-      While doing this we build up a list of all the entries.  */
-   struct fork_handler *runp;
-@@ -246,6 +251,10 @@ __libc_fork (void)
  
- 	  allp = allp->next;
- 	}
-+
+   /* If we are not running multiple threads, we do not have to
+      preserve lock state.  If fork runs from a signal handler, only
+@@ -150,6 +154,9 @@ __libc_fork (void)
+ 
+       /* Run the handlers registered for the parent.  */
+       __run_fork_handlers (atfork_run_parent);
 +      /* unlock ld.so last, because we locked it first */
 +      __rtld_lock_unlock_recursive (GL(dl_load_write_lock));
 +      __rtld_lock_unlock_recursive (GL(dl_load_lock));
@@ -66,5 +64,5 @@ index f87506f398..225e7b51f8 100644
  
    return pid;
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch b/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
index 436c84778e..8f0b05694f 100644
--- a/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
+++ b/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
@@ -1,8 +1,8 @@
-From af3054b3856379d353a779801678f330e1b58c9a Mon Sep 17 00:00:00 2001
-Message-Id: <af3054b3856379d353a779801678f330e1b58c9a.1490183611.git.panand@redhat.com>
+From 55cc59b7da97b80cd26027656a252082b09aa2bb Mon Sep 17 00:00:00 2001
 From: Pratyush Anand <panand@redhat.com>
 Date: Wed, 22 Mar 2017 17:02:38 +0530
-Subject: [PATCH] bits/siginfo-consts.h: enum definition for TRAP_HWBKPT is missing
+Subject: [PATCH 28/30] bits/siginfo-consts.h: enum definition for TRAP_HWBKPT
+ is missing
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -29,7 +29,7 @@ Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=2128
  2 files changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/bits/siginfo-consts.h b/bits/siginfo-consts.h
-index a58ac4b..8448fac 100644
+index 7464c1882b..298314527a 100644
 --- a/bits/siginfo-consts.h
 +++ b/bits/siginfo-consts.h
 @@ -106,8 +106,12 @@ enum
@@ -47,10 +47,10 @@ index a58ac4b..8448fac 100644
  # endif
  
 diff --git a/sysdeps/unix/sysv/linux/bits/siginfo-consts.h b/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
-index 525840c..57a9edb 100644
+index 193bd9c471..3fe852bc5f 100644
 --- a/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
 +++ b/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
-@@ -137,8 +137,12 @@ enum
+@@ -141,8 +141,12 @@ enum
  {
    TRAP_BRKPT = 1,		/* Process breakpoint.  */
  #  define TRAP_BRKPT	TRAP_BRKPT
@@ -65,5 +65,5 @@ index 525840c..57a9edb 100644
  # endif
  
 -- 
-2.7.4
+2.18.0
 
diff --git a/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch b/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
deleted file mode 100644
index fa29f4165b..0000000000
--- a/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 113e0516fbd3ce18253f0423762416d4c4b38fb0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 22 Mar 2018 17:57:37 -0700
-Subject: [PATCH 29/29] Replace strncpy with memccpy to fix
- -Wstringop-truncation.
-
-	* nis/nss_nisplus/nisplus-parser.c: Replace strncpy with memcpy to
-	avoid -Wstringop-truncation.
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted [https://sourceware.org/ml/libc-alpha/2018-03/msg00531.html]
-
- nis/nss_nisplus/nisplus-parser.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/nis/nss_nisplus/nisplus-parser.c b/nis/nss_nisplus/nisplus-parser.c
-index 8dc021e73d..b53284f889 100644
---- a/nis/nss_nisplus/nisplus-parser.c
-+++ b/nis/nss_nisplus/nisplus-parser.c
-@@ -87,7 +87,7 @@ _nss_nisplus_parse_pwent (nis_result *result, struct passwd *pw,
-       if (len >= room_left)
- 	goto no_more_room;
- 
--      strncpy (first_unused, numstr, len);
-+      memcpy (first_unused, numstr, len);
-       first_unused[len] = '\0';
-       numstr = first_unused;
-     }
-@@ -103,7 +103,7 @@ _nss_nisplus_parse_pwent (nis_result *result, struct passwd *pw,
-       if (len >= room_left)
- 	goto no_more_room;
- 
--      strncpy (first_unused, numstr, len);
-+      memcpy (first_unused, numstr, len);
-       first_unused[len] = '\0';
-       numstr = first_unused;
-     }
--- 
-2.16.2
-
diff --git a/meta/recipes-core/glibc/glibc/archive-path.patch b/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
similarity index 69%
rename from meta/recipes-core/glibc/glibc/archive-path.patch
rename to meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index b0d3158cfe..aa3a9e2654 100644
--- a/meta/recipes-core/glibc/glibc/archive-path.patch
+++ b/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,13 +1,25 @@
-localedef --add-to-archive uses a hard-coded locale path which doesn't exist in
-normal use, and there's no way to pass an alternative filename.
+From 5a6f019ded549faaf42478f6f96428dc7c20606e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Aug 2018 09:42:06 -0700
+Subject: [PATCH 29/30] localedef --add-to-archive uses a hard-coded locale
+ path
 
-Add a fallback of $LOCALEARCHIVE from the environment, and allow creation of new locale archives that are not the system archive.
+it doesn't exist in normal use, and there's no way to pass an
+alternative filename.
+
+Add a fallback of $LOCALEARCHIVE from the environment, and allow
+creation of new locale archives that are not the system archive.
 
 Upstream-Status: Inappropriate (OE-specific)
+
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ locale/programs/locarchive.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index ca332a34..6b7ba9b2 100644
+index ca332a345f..6b7ba9b2e3 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -569,10 +569,13 @@ open_archive (struct locarhandle *ah, bool readonly)
@@ -37,3 +49,6 @@ index ca332a34..6b7ba9b2 100644
  	    {
  	      if (readonly)
  		{
+-- 
+2.18.0
+
diff --git a/meta/recipes-core/glibc/glibc/0030-plural_c_no_preprocessor_lines.patch b/meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch
similarity index 59%
rename from meta/recipes-core/glibc/glibc/0030-plural_c_no_preprocessor_lines.patch
rename to meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch
index 6f03e1c62d..f0a950aca9 100644
--- a/meta/recipes-core/glibc/glibc/0030-plural_c_no_preprocessor_lines.patch
+++ b/meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch
@@ -1,16 +1,26 @@
+From 959f3fc8743cbb3b13c3be11ee359f139f5be8c7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Aug 2018 09:44:00 -0700
+Subject: [PATCH 30/30] intl: Emit no lines in bison generated files
+
 Improve reproducibility:
 Do not put any #line preprocessor commands in bison generated files.
 These lines contain absolute paths containing file locations on
 the host build machine.
 
 Upstream-Status: Pending
+
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ intl/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/intl/Makefile b/intl/Makefile
-index 2219717..a203780 100644
+index 672edf1b38..d31888d013 100644
 --- a/intl/Makefile
 +++ b/intl/Makefile
-@@ -151,7 +151,7 @@ $(objpfx)tst-gettext6.out: $(objpfx)tst-gettext.out
+@@ -155,7 +155,7 @@ $(objpfx)tst-gettext6.out: $(objpfx)tst-gettext.out
  
  CPPFLAGS += -D'LOCALEDIR="$(localedir)"' \
  	    -D'LOCALE_ALIAS_PATH="$(localedir)"'
@@ -19,3 +29,6 @@ index 2219717..a203780 100644
  
  $(inst_localedir)/locale.alias: locale.alias $(+force)
  	$(do-install)
+-- 
+2.18.0
+
diff --git a/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch b/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
deleted file mode 100644
index a9132ed3d2..0000000000
--- a/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
+++ /dev/null
@@ -1,419 +0,0 @@
-Background information:
-
-https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html
-https://fedoraproject.org/wiki/Changes/Replace_glibc_libcrypt_with_libxcrypt
-
-Upstream-Status: Submitted [libc-alpha@sourceware.org]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-From: Zack Weinberg <zackw@panix.com>
-Subject: [PATCH] Deprecate libcrypt and don't build it by default
-
-Back in June, Björn Esser proposed to add OpenBSD-compatible bcrypt
-support to our implementation of crypt(3), and Zack Weinberg replied
-that it might actually make more sense to _remove_ libcrypt from
-glibc, freeing up libcrypt.so.1 and crypt.h to be provided by a
-separate project that could move faster.  (For instance, libxcrypt:
-https://github.com/besser82/libxcrypt)
-
-This patch disables build and installation of libcrypt by default.  It
-can be re-enabled with --enable-obsolete-crypt to configure.  Unlike
-libnsl, we do *not* install a runtime shared library; that's left to
-the replacement.  (Unlike the SunRPC situation, I think we can
-probably drop this code altogether in a release or two.)
-
-The function prototypes for crypt and encrypt are removed from
-unistd.h, and the function prototype for setkey is removed from
-stdlib.h; they do *not* come back with --enable-obsolete-crypt.  This
-means glibc no longer provides the POSIX CRYPT option, and the macro
-_XOPEN_CRYPT is also removed from unistd.h to indicate that.
-(_SC_XOPEN_CRYPT is still defined, but sysconf(_SC_XOPEN_CRYPT) will
-return -1 at runtime.)  These functions are also unconditionally
-removed from conform/data/{stdlib,unistd}.h-data.
-
-	* posix/unistd.h (_XOPEN_CRYPT, crypt, encrypt): Don't declare.
-	* stdlib/stdlib.h (setkey): Don't declare.
-
-	* configure.ac (--enable-obsolete-crypt): New configure option.
-	* configure: Regenerate.
-	* config.make.in (build-obsolete-crypt): New makefile variable.
-	* crypt/Banner: Delete file.
-	* crypt/Makefile: Don't build anything unless
-	$(build-obsolete-crypt) is 'yes'.
-	* sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile: Only add things
-	to libcrypt-sysdep_routines when $(build-obsolete-crypt) is 'yes'.
-	* sysdeps/sparc/sparc64/multiarch/Makefile: Likewise.
-	* sysdeps/unix/sysv/linux/arm/Makefile: Likewise.
-
-	* conform/Makefile: Only include libcrypt.a in linknamespace tests
-	when $(build-obsolete-crypt) is 'yes'.
-	* conform/data/stdlib.h-data (setkey): Don't expect.
-	* conform/data/unistd.h-data (crypt, encrypt): Don't expect.
-	* elf/Makefile: Only perform various tests of libcrypt.so/libcrypt.a
-	when $(build-obsolete-crypt) is 'yes'.
-	* elf/tst-linkall-static.c: Don't include crypt.h when USE_CRYPT
-	is false.
----
- NEWS                                             | 18 ++++++++++++++++++
- config.make.in                                   |  1 +
- configure                                        | 13 +++++++++++++
- configure.ac                                     |  8 ++++++++
- conform/Makefile                                 | 14 ++++++++++----
- conform/data/stdlib.h-data                       |  3 ---
- conform/data/unistd.h-data                       |  6 ------
- crypt/Makefile                                   |  5 +++++
- elf/Makefile                                     | 16 ++++++++++++----
- elf/tst-linkall-static.c                         |  2 ++
- posix/unistd.h                                   | 16 ----------------
- stdlib/stdlib.h                                  |  6 ------
- sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile |  2 ++
- sysdeps/sparc/sparc64/multiarch/Makefile         |  2 ++
- sysdeps/unix/sysv/linux/arm/Makefile             |  2 ++
- 15 files changed, 75 insertions(+), 39 deletions(-)
-
-diff --git a/config.make.in b/config.make.in
-index 9e5e24b2c6..8fe610d04d 100644
---- a/config.make.in
-+++ b/config.make.in
-@@ -82,6 +82,7 @@ mach-interface-list = @mach_interface_list@
- 
- experimental-malloc = @experimental_malloc@
- 
-+build-obsolete-crypt = @build_obsolete_crypt@
- nss-crypt = @libc_cv_nss_crypt@
- static-nss-crypt = @libc_cv_static_nss_crypt@
- 
-diff --git a/configure b/configure
-index 7a8bd3f817..46f6bd7f86 100755
---- a/configure
-+++ b/configure
-@@ -672,6 +672,7 @@ base_machine
- have_tunables
- build_pt_chown
- build_nscd
-+build_obsolete_crypt
- build_obsolete_nsl
- link_obsolete_rpc
- libc_cv_static_nss_crypt
-@@ -782,6 +783,7 @@ enable_experimental_malloc
- enable_nss_crypt
- enable_obsolete_rpc
- enable_obsolete_nsl
-+enable_obsolete_crypt
- enable_systemtap
- enable_build_nscd
- enable_nscd
-@@ -1453,6 +1455,7 @@ Optional Features:
-                           link-time usage
-   --enable-obsolete-nsl   build and install the obsolete libnsl library and
-                           depending NSS modules
-+  --enable-obsolete-crypt build and install the obsolete libcrypt library
-   --enable-systemtap      enable systemtap static probe points [default=no]
-   --disable-build-nscd    disable building and installing the nscd daemon
-   --disable-nscd          library functions will not contact the nscd daemon
-@@ -3632,6 +3635,16 @@ if test "$build_obsolete_nsl" = yes; then
- 
- fi
- 
-+# Check whether --enable-obsolete-crypt was given.
-+if test "${enable_obsolete_crypt+set}" = set; then :
-+  enableval=$enable_obsolete_crypt; build_obsolete_crypt=$enableval
-+else
-+  build_obsolete_crypt=no
-+fi
-+
-+
-+
-+
- # Check whether --enable-systemtap was given.
- if test "${enable_systemtap+set}" = set; then :
-   enableval=$enable_systemtap; systemtap=$enableval
-diff --git a/configure.ac b/configure.ac
-index ca1282a6b3..0142353740 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -378,6 +378,14 @@ if test "$build_obsolete_nsl" = yes; then
-   AC_DEFINE(LINK_OBSOLETE_NSL)
- fi
- 
-+AC_ARG_ENABLE([obsolete-crypt],
-+              AC_HELP_STRING([--enable-obsolete-crypt],
-+                             [build and install the obsolete libcrypt library]),
-+              [build_obsolete_crypt=$enableval],
-+              [build_obsolete_crypt=no])
-+AC_SUBST(build_obsolete_crypt)
-+
-+
- AC_ARG_ENABLE([systemtap],
-               [AS_HELP_STRING([--enable-systemtap],
- 	       [enable systemtap static probe points @<:@default=no@:>@])],
-diff --git a/conform/Makefile b/conform/Makefile
-index 864fdeca21..5ef474fb24 100644
---- a/conform/Makefile
-+++ b/conform/Makefile
-@@ -193,22 +193,28 @@ linknamespace-libs-thr = $(linknamespace-libs-isoc) \
- 			 $(common-objpfx)rt/librt.a $(static-thread-library)
- linknamespace-libs-posix = $(linknamespace-libs-thr) \
- 			   $(common-objpfx)dlfcn/libdl.a
--linknamespace-libs-xsi = $(linknamespace-libs-posix) \
--			 $(common-objpfx)crypt/libcrypt.a
-+linknamespace-libs-xsi = $(linknamespace-libs-posix)
- linknamespace-libs-ISO = $(linknamespace-libs-isoc)
- linknamespace-libs-ISO99 = $(linknamespace-libs-isoc)
- linknamespace-libs-ISO11 = $(linknamespace-libs-isoc)
--linknamespace-libs-XPG4 = $(linknamespace-libs-isoc) \
--			  $(common-objpfx)crypt/libcrypt.a
-+linknamespace-libs-XPG4 = $(linknamespace-libs-isoc)
- linknamespace-libs-XPG42 = $(linknamespace-libs-XPG4)
- linknamespace-libs-POSIX = $(linknamespace-libs-thr)
- linknamespace-libs-UNIX98 = $(linknamespace-libs-xsi)
- linknamespace-libs-XOPEN2K = $(linknamespace-libs-xsi)
- linknamespace-libs-POSIX2008 = $(linknamespace-libs-posix)
- linknamespace-libs-XOPEN2K8 = $(linknamespace-libs-xsi)
-+
-+ifeq ($(build-obsolete-crypt),yes)
-+linknamespace-libs-xsi += $(common-objpfx)crypt/libcrypt.a
-+linknamespace-libs-XPG4 += $(common-objpfx)crypt/libcrypt.a
-+endif
-+
- linknamespace-libs = $(foreach std,$(conformtest-standards),\
- 				   $(linknamespace-libs-$(std)))
- 
-+
-+
- $(linknamespace-symlist-stdlibs-tests): $(objpfx)symlist-stdlibs-%: \
- 					$(linknamespace-libs)
- 	LC_ALL=C $(READELF) -W -s $(linknamespace-libs-$*) > $@; \
-diff --git a/conform/data/stdlib.h-data b/conform/data/stdlib.h-data
-index d8fcccc2fb..6913828196 100644
---- a/conform/data/stdlib.h-data
-+++ b/conform/data/stdlib.h-data
-@@ -149,9 +149,6 @@ function {unsigned short int*} seed48 (unsigned short int[3])
- #if !defined ISO && !defined ISO99 && !defined ISO11 && !defined POSIX && !defined XPG4 && !defined XPG42 && !defined UNIX98
- function int setenv (const char*, const char*, int)
- #endif
--#if !defined ISO && !defined ISO99 && !defined ISO11 && !defined POSIX && !defined POSIX2008
--function void setkey (const char*)
--#endif
- #if !defined ISO && !defined ISO99 && !defined ISO11 && !defined XPG4 && !defined POSIX && !defined POSIX2008
- function {char*} setstate (char*)
- #endif
-diff --git a/conform/data/unistd.h-data b/conform/data/unistd.h-data
-index ddf4f25132..aa070528e8 100644
---- a/conform/data/unistd.h-data
-+++ b/conform/data/unistd.h-data
-@@ -437,9 +437,6 @@ function int chroot (const char*)
- function int chown (const char*, uid_t, gid_t)
- function int close (int)
- function size_t confstr (int, char*, size_t)
--#if !defined POSIX && !defined POSIX2008
--function {char*} crypt (const char*, const char*)
--#endif
- #if defined XPG4 || defined XPG42 || defined UNIX98
- function {char*} ctermid (char*)
- function {char*} cuserid (char*)
-@@ -449,9 +446,6 @@ allow cuserid
- #endif
- function int dup (int)
- function int dup2 (int, int)
--#if !defined POSIX && !defined POSIX2008
--function void encrypt (char[64], int)
--#endif
- function int execl (const char*, const char*, ...)
- function int execle (const char*, const char*, ...)
- function int execlp (const char*, const char*, ...)
-diff --git a/crypt/Makefile b/crypt/Makefile
-index 303800df73..024ec2c6ab 100644
---- a/crypt/Makefile
-+++ b/crypt/Makefile
-@@ -22,6 +22,8 @@ subdir	:= crypt
- 
- include ../Makeconfig
- 
-+ifeq ($(build-obsolete-crypt),yes)
-+
- headers := crypt.h
- 
- extra-libs := libcrypt
-@@ -52,9 +54,11 @@ tests += md5test sha256test sha512test
- # machine over a minute.
- xtests = md5test-giant
- endif
-+endif
- 
- include ../Rules
- 
-+ifeq ($(build-obsolete-crypt),yes)
- ifneq ($(nss-crypt),yes)
- md5-routines := md5 $(filter md5%,$(libcrypt-sysdep_routines))
- sha256-routines := sha256 $(filter sha256%,$(libcrypt-sysdep_routines))
-@@ -71,3 +75,4 @@ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.so
- else
- $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.a
- endif
-+endif
-diff --git a/elf/Makefile b/elf/Makefile
-index 2a432d8bee..366f7b80ec 100644
---- a/elf/Makefile
-+++ b/elf/Makefile
-@@ -385,15 +385,19 @@ $(objpfx)tst-_dl_addr_inside_object: $(objpfx)dl-addr-obj.os
- CFLAGS-tst-_dl_addr_inside_object.c += $(PIE-ccflag)
- endif
- 
--# By default tst-linkall-static should try to use crypt routines to test
--# static libcrypt use.
--CFLAGS-tst-linkall-static.c += -DUSE_CRYPT=1
-+ifeq ($(build-obsolete-crypt),yes)
-+# If the libcrypt library is being built, tst-linkall-static should
-+# try to use crypt routines to test static libcrypt use.
-+CFLAGS-tst-linkall-static.c = -DUSE_CRYPT=1
- # However, if we are using NSS crypto and we don't have a static
- # library, then we exclude the use of crypt functions in the test.
- # We similarly exclude libcrypt.a from the static link (see below).
- ifeq (yesno,$(nss-crypt)$(static-nss-crypt))
- CFLAGS-tst-linkall-static.c += -UUSE_CRYPT -DUSE_CRYPT=0
- endif
-+else
-+CFLAGS-tst-linkall-static.c = -DUSE_CRYPT=0
-+endif
- 
- include ../Rules
- 
-@@ -1113,8 +1117,10 @@ localplt-built-dso := $(addprefix $(common-objpfx),\
- 				  rt/librt.so \
- 				  dlfcn/libdl.so \
- 				  resolv/libresolv.so \
--				  crypt/libcrypt.so \
- 		       )
-+ifeq ($(build-obsolete-crypt),yes)
-+localplt-built-dso += $(addprefix $(common-objpfx), crypt/libcrypt.so)
-+endif
- ifeq ($(build-mathvec),yes)
- localplt-built-dso += $(addprefix $(common-objpfx), mathvec/libmvec.so)
- endif
-@@ -1395,6 +1401,7 @@ $(objpfx)tst-linkall-static: \
-   $(common-objpfx)resolv/libanl.a \
-   $(static-thread-library)
- 
-+ifeq ($(build-obsolete-crypt),yes)
- # If we are using NSS crypto and we have the ability to link statically
- # then we include libcrypt.a, otherwise we leave out libcrypt.a and
- # link as much as we can into the tst-linkall-static test.  This assumes
-@@ -1410,6 +1417,7 @@ ifeq (no,$(nss-crypt))
- $(objpfx)tst-linkall-static: \
-   $(common-objpfx)crypt/libcrypt.a
- endif
-+endif
- 
- # The application depends on the DSO, and the DSO loads the plugin.
- # The plugin also depends on the DSO. This creates the circular
-diff --git a/elf/tst-linkall-static.c b/elf/tst-linkall-static.c
-index e8df38f74e..0ffae7c723 100644
---- a/elf/tst-linkall-static.c
-+++ b/elf/tst-linkall-static.c
-@@ -18,7 +18,9 @@
- 
- #include <math.h>
- #include <pthread.h>
-+#if USE_CRYPT
- #include <crypt.h>
-+#endif
- #include <resolv.h>
- #include <dlfcn.h>
- #include <utmp.h>
-diff --git a/posix/unistd.h b/posix/unistd.h
-index 4d149f9945..e75ce4d4ec 100644
---- a/posix/unistd.h
-+++ b/posix/unistd.h
-@@ -107,9 +107,6 @@ __BEGIN_DECLS
- /* The X/Open Unix extensions are available.  */
- #define _XOPEN_UNIX	1
- 
--/* Encryption is present.  */
--#define	_XOPEN_CRYPT	1
--
- /* The enhanced internationalization capabilities according to XPG4.2
-    are present.  */
- #define	_XOPEN_ENH_I18N	1
-@@ -1118,20 +1115,7 @@ ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
- extern int fdatasync (int __fildes);
- #endif /* Use POSIX199309 */
- 
--
--/* XPG4.2 specifies that prototypes for the encryption functions must
--   be defined here.  */
- #ifdef	__USE_XOPEN
--/* Encrypt at most 8 characters from KEY using salt to perturb DES.  */
--extern char *crypt (const char *__key, const char *__salt)
--     __THROW __nonnull ((1, 2));
--
--/* Encrypt data in BLOCK in place if EDFLAG is zero; otherwise decrypt
--   block in place.  */
--extern void encrypt (char *__glibc_block, int __edflag)
--     __THROW __nonnull ((1));
--
--
- /* Swab pairs bytes in the first N bytes of the area pointed to by
-    FROM and copy the result to TO.  The value of TO must not be in the
-    range [FROM - N + 1, FROM - 1].  If N is odd the first byte in FROM
-diff --git a/stdlib/stdlib.h b/stdlib/stdlib.h
-index 6b1ead31e0..8e23e93557 100644
---- a/stdlib/stdlib.h
-+++ b/stdlib/stdlib.h
-@@ -958,12 +958,6 @@ extern int getsubopt (char **__restrict __optionp,
- #endif
- 
- 
--#ifdef __USE_XOPEN
--/* Setup DES tables according KEY.  */
--extern void setkey (const char *__key) __THROW __nonnull ((1));
--#endif
--
--
- /* X/Open pseudo terminal handling.  */
- 
- #ifdef __USE_XOPEN2KXSI
-diff --git a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
-index a6d08f3a00..d8b8297fb0 100644
---- a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
-+++ b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
-@@ -1,6 +1,8 @@
- ifeq ($(subdir),crypt)
-+ifeq ($(build-obsolete-crypt),yes)
- libcrypt-sysdep_routines += md5-crop sha256-crop sha512-crop
- endif
-+endif
- 
- ifeq ($(subdir),locale)
- localedef-aux += md5-crop
-diff --git a/sysdeps/sparc/sparc64/multiarch/Makefile b/sysdeps/sparc/sparc64/multiarch/Makefile
-index eaf758e7aa..0198f9886f 100644
---- a/sysdeps/sparc/sparc64/multiarch/Makefile
-+++ b/sysdeps/sparc/sparc64/multiarch/Makefile
-@@ -1,6 +1,8 @@
- ifeq ($(subdir),crypt)
-+ifeq ($(build-obsolete-crypt),yes)
- libcrypt-sysdep_routines += md5-crop sha256-crop sha512-crop
- endif
-+endif
- 
- ifeq ($(subdir),locale)
- localedef-aux += md5-crop
-diff --git a/sysdeps/unix/sysv/linux/arm/Makefile b/sysdeps/unix/sysv/linux/arm/Makefile
-index 4adc35de04..6cab4f3a31 100644
---- a/sysdeps/unix/sysv/linux/arm/Makefile
-+++ b/sysdeps/unix/sysv/linux/arm/Makefile
-@@ -19,8 +19,10 @@ endif
- # Add a syscall function to each library that needs one.
- 
- ifeq ($(subdir),crypt)
-+ifeq ($(build-obsolete-crypt),yes)
- libcrypt-sysdep_routines += libc-do-syscall
- endif
-+endif
- 
- ifeq ($(subdir),rt)
- librt-sysdep_routines += libc-do-syscall
--- 
-2.16.0
-
diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-18269.patch b/meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
deleted file mode 100644
index d873c51e60..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From cd66c0e584c6d692bc8347b5e72723d02b8a8ada Mon Sep 17 00:00:00 2001
-From: Andrew Senkevich <andrew.n.senkevich@gmail.com>
-Date: Fri, 23 Mar 2018 16:19:45 +0100
-Subject: [PATCH] Fix i386 memmove issue (bug 22644).
-
-	[BZ #22644]
-	* sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S: Fixed
-	branch conditions.
-	* string/test-memmove.c (do_test2): New testcase.
-
-Upstream-Status: Backport
-CVE: CVE-2017-18269
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- ChangeLog                                          |  8 +++
- string/test-memmove.c                              | 58 ++++++++++++++++++++++
- .../i386/i686/multiarch/memcpy-sse2-unaligned.S    | 12 ++---
- 3 files changed, 72 insertions(+), 6 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 18ed09e..afdb766 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,11 @@
-+2018-03-23  Andrew Senkevich  <andrew.senkevich@intel.com>
-+	    Max Horn  <max@quendi.de>
-+
-+	[BZ #22644]
-+	* sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S: Fixed
-+	branch conditions.
-+	* string/test-memmove.c (do_test2): New testcase.
-+
- 2018-02-22  Andrew Waterman <andrew@sifive.com>
- 
- 	[BZ # 22884]
-diff --git a/string/test-memmove.c b/string/test-memmove.c
-index edc7a4c..64e3651 100644
---- a/string/test-memmove.c
-+++ b/string/test-memmove.c
-@@ -24,6 +24,7 @@
- # define TEST_NAME "memmove"
- #endif
- #include "test-string.h"
-+#include <support/test-driver.h>
- 
- char *simple_memmove (char *, const char *, size_t);
- 
-@@ -245,6 +246,60 @@ do_random_tests (void)
-     }
- }
- 
-+static void
-+do_test2 (void)
-+{
-+  size_t size = 0x20000000;
-+  uint32_t * large_buf;
-+
-+  large_buf = mmap ((void*) 0x70000000, size, PROT_READ | PROT_WRITE,
-+		    MAP_PRIVATE | MAP_ANON, -1, 0);
-+
-+  if (large_buf == MAP_FAILED)
-+    error (EXIT_UNSUPPORTED, errno, "Large mmap failed");
-+
-+  if ((uintptr_t) large_buf > 0x80000000 - 128
-+      || 0x80000000 - (uintptr_t) large_buf > 0x20000000)
-+    {
-+      error (0, 0, "Large mmap allocated improperly");
-+      ret = EXIT_UNSUPPORTED;
-+      munmap ((void *) large_buf, size);
-+      return;
-+    }
-+
-+  size_t bytes_move = 0x80000000 - (uintptr_t) large_buf;
-+  size_t arr_size = bytes_move / sizeof (uint32_t);
-+  size_t i;
-+
-+  FOR_EACH_IMPL (impl, 0)
-+    {
-+      for (i = 0; i < arr_size; i++)
-+        large_buf[i] = (uint32_t) i;
-+
-+      uint32_t * dst = &large_buf[33];
-+
-+#ifdef TEST_BCOPY
-+      CALL (impl, (char *) large_buf, (char *) dst, bytes_move);
-+#else
-+      CALL (impl, (char *) dst, (char *) large_buf, bytes_move);
-+#endif
-+
-+      for (i = 0; i < arr_size; i++)
-+	{
-+	  if (dst[i] != (uint32_t) i)
-+	    {
-+	      error (0, 0,
-+		     "Wrong result in function %s dst \"%p\" src \"%p\" offset \"%zd\"",
-+		     impl->name, dst, large_buf, i);
-+	      ret = 1;
-+	      break;
-+	    }
-+	}
-+    }
-+
-+  munmap ((void *) large_buf, size);
-+}
-+
- int
- test_main (void)
- {
-@@ -284,6 +339,9 @@ test_main (void)
-     }
- 
-   do_random_tests ();
-+
-+  do_test2 ();
-+
-   return ret;
- }
- 
-diff --git a/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S b/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
-index 9c3bbe7..9aa17de 100644
---- a/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
-+++ b/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
-@@ -72,7 +72,7 @@ ENTRY (MEMCPY)
- 	cmp	%edx, %eax
- 
- # ifdef USE_AS_MEMMOVE
--	jg	L(check_forward)
-+	ja	L(check_forward)
- 
- L(mm_len_0_or_more_backward):
- /* Now do checks for lengths. We do [0..16], [16..32], [32..64], [64..128]
-@@ -81,7 +81,7 @@ L(mm_len_0_or_more_backward):
- 	jbe	L(mm_len_0_16_bytes_backward)
- 
- 	cmpl	$32, %ecx
--	jg	L(mm_len_32_or_more_backward)
-+	ja	L(mm_len_32_or_more_backward)
- 
- /* Copy [0..32] and return.  */
- 	movdqu	(%eax), %xmm0
-@@ -92,7 +92,7 @@ L(mm_len_0_or_more_backward):
- 
- L(mm_len_32_or_more_backward):
- 	cmpl	$64, %ecx
--	jg	L(mm_len_64_or_more_backward)
-+	ja	L(mm_len_64_or_more_backward)
- 
- /* Copy [0..64] and return.  */
- 	movdqu	(%eax), %xmm0
-@@ -107,7 +107,7 @@ L(mm_len_32_or_more_backward):
- 
- L(mm_len_64_or_more_backward):
- 	cmpl	$128, %ecx
--	jg	L(mm_len_128_or_more_backward)
-+	ja	L(mm_len_128_or_more_backward)
- 
- /* Copy [0..128] and return.  */
- 	movdqu	(%eax), %xmm0
-@@ -132,7 +132,7 @@ L(mm_len_128_or_more_backward):
- 	add	%ecx, %eax
- 	cmp	%edx, %eax
- 	movl	SRC(%esp), %eax
--	jle	L(forward)
-+	jbe	L(forward)
- 	PUSH (%esi)
- 	PUSH (%edi)
- 	PUSH (%ebx)
-@@ -269,7 +269,7 @@ L(check_forward):
- 	add	%edx, %ecx
- 	cmp	%eax, %ecx
- 	movl	LEN(%esp), %ecx
--	jle	L(forward)
-+	jbe	L(forward)
- 
- /* Now do checks for lengths. We do [0..16], [0..32], [0..64], [0..128]
- 	separately.  */
--- 
-2.9.3
diff --git a/meta/recipes-core/glibc/glibc/CVE-2018-11236.patch b/meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
deleted file mode 100644
index e2bb40b0de..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 5460617d1567657621107d895ee2dd83bc1f88f2 Mon Sep 17 00:00:00 2001
-From: Paul Pluzhnikov <ppluzhnikov@google.com>
-Date: Tue, 8 May 2018 18:12:41 -0700
-Subject: [PATCH] Fix BZ 22786: integer addition overflow may cause stack
- buffer overflow when realpath() input length is close to SSIZE_MAX.
-
-2018-05-09  Paul Pluzhnikov  <ppluzhnikov@google.com>
-
-	[BZ #22786]
-	* stdlib/canonicalize.c (__realpath): Fix overflow in path length
-	computation.
-	* stdlib/Makefile (test-bz22786): New test.
-	* stdlib/test-bz22786.c: New test.
-
-CVE: CVE-2018-11236
-Upstream-Status: Backport
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- ChangeLog             |  8 +++++
- stdlib/Makefile       |  2 +-
- stdlib/canonicalize.c |  2 +-
- stdlib/test-bz22786.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 100 insertions(+), 2 deletions(-)
- create mode 100644 stdlib/test-bz22786.c
-
-diff --git a/ChangeLog b/ChangeLog
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,11 @@
-+2018-05-09  Paul Pluzhnikov  <ppluzhnikov@google.com>
-+
-+	[BZ #22786]
-+	* stdlib/canonicalize.c (__realpath): Fix overflow in path length
-+	computation.
-+	* stdlib/Makefile (test-bz22786): New test.
-+	* stdlib/test-bz22786.c: New test.
-+
- 2018-03-23  Andrew Senkevich  <andrew.senkevich@intel.com>
- 	    Max Horn  <max@quendi.de>
- 
-diff --git a/stdlib/Makefile b/stdlib/Makefile
-index af1643c..1ddb1f9 100644
---- a/stdlib/Makefile
-+++ b/stdlib/Makefile
-@@ -84,7 +84,7 @@ tests		:= tst-strtol tst-strtod testmb testrand testsort testdiv   \
- 		   tst-cxa_atexit tst-on_exit test-atexit-race 		    \
- 		   test-at_quick_exit-race test-cxa_atexit-race             \
- 		   test-on_exit-race test-dlclose-exit-race 		    \
--		   tst-makecontext-align
-+		   tst-makecontext-align test-bz22786
- 
- tests-internal	:= tst-strtod1i tst-strtod3 tst-strtod4 tst-strtod5i \
- 		   tst-tls-atexit tst-tls-atexit-nodelete
-diff --git a/stdlib/canonicalize.c b/stdlib/canonicalize.c
-index 4135f3f..390fb43 100644
---- a/stdlib/canonicalize.c
-+++ b/stdlib/canonicalize.c
-@@ -181,7 +181,7 @@ __realpath (const char *name, char *resolved)
- 		extra_buf = __alloca (path_max);
- 
- 	      len = strlen (end);
--	      if ((long int) (n + len) >= path_max)
-+	      if (path_max - n <= len)
- 		{
- 		  __set_errno (ENAMETOOLONG);
- 		  goto error;
-diff --git a/stdlib/test-bz22786.c b/stdlib/test-bz22786.c
-new file mode 100644
-index 0000000..e7837f9
---- /dev/null
-+++ b/stdlib/test-bz22786.c
-@@ -0,0 +1,90 @@
-+/* Bug 22786: test for buffer overflow in realpath.
-+   Copyright (C) 2018 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+/* This file must be run from within a directory called "stdlib".  */
-+
-+#include <errno.h>
-+#include <limits.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <unistd.h>
-+#include <sys/stat.h>
-+#include <sys/types.h>
-+#include <support/test-driver.h>
-+#include <libc-diag.h>
-+
-+static int
-+do_test (void)
-+{
-+  const char dir[] = "bz22786";
-+  const char lnk[] = "bz22786/symlink";
-+
-+  rmdir (dir);
-+  if (mkdir (dir, 0755) != 0 && errno != EEXIST)
-+    {
-+      printf ("mkdir %s: %m\n", dir);
-+      return EXIT_FAILURE;
-+    }
-+  if (symlink (".", lnk) != 0 && errno != EEXIST)
-+    {
-+      printf ("symlink (%s, %s): %m\n", dir, lnk);
-+      return EXIT_FAILURE;
-+    }
-+
-+  const size_t path_len = (size_t) INT_MAX + 1;
-+
-+  DIAG_PUSH_NEEDS_COMMENT;
-+#if __GNUC_PREREQ (7, 0)
-+  /* GCC 7 warns about too-large allocations; here we need such
-+     allocation to succeed for the test to work.  */
-+  DIAG_IGNORE_NEEDS_COMMENT (7, "-Walloc-size-larger-than=");
-+#endif
-+  char *path = malloc (path_len);
-+  DIAG_POP_NEEDS_COMMENT;
-+
-+  if (path == NULL)
-+    {
-+      printf ("malloc (%zu): %m\n", path_len);
-+      return EXIT_UNSUPPORTED;
-+    }
-+
-+  /* Construct very long path = "bz22786/symlink/aaaa....."  */
-+  char *p = mempcpy (path, lnk, sizeof (lnk) - 1);
-+  *(p++) = '/';
-+  memset (p, 'a', path_len - (path - p) - 2);
-+  p[path_len - (path - p) - 1] = '\0';
-+
-+  /* This call crashes before the fix for bz22786 on 32-bit platforms.  */
-+  p = realpath (path, NULL);
-+
-+  if (p != NULL || errno != ENAMETOOLONG)
-+    {
-+      printf ("realpath: %s (%m)", p);
-+      return EXIT_FAILURE;
-+    }
-+
-+  /* Cleanup.  */
-+  unlink (lnk);
-+  rmdir (dir);
-+
-+  return 0;
-+}
-+
-+#define TEST_FUNCTION do_test
-+#include <support/test-driver.c>
--- 
-2.9.3
diff --git a/meta/recipes-core/glibc/glibc/CVE-2018-11237.patch b/meta/recipes-core/glibc/glibc/CVE-2018-11237.patch
deleted file mode 100644
index 632aa565e4..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2018-11237.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 9aaaab7c6e4176e61c59b0a63c6ba906d875dc0e Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@suse.de>
-Date: Tue, 22 May 2018 10:37:59 +0200
-Subject: [PATCH] Don't write beyond destination in
- __mempcpy_avx512_no_vzeroupper (bug 23196)
-
-When compiled as mempcpy, the return value is the end of the destination
-buffer, thus it cannot be used to refer to the start of it.
-
-2018-05-23  Andreas Schwab  <schwab@suse.de>
-
-       [BZ #23196]
-       CVE-2018-11237
-       * sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
-       (L(preloop_large)): Save initial destination pointer in %r11 and
-       use it instead of %rax after the loop.
-       * string/test-mempcpy.c (MIN_PAGE_SIZE): Define.
-
-CVE: CVE-2018-11237
-Upstream-Status: Backport
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- ChangeLog                                               | 9 +++++++++
- string/test-mempcpy.c                                   | 1 +
- sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S | 5 +++--
- 3 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index fa0a07c..bc09dec 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,12 @@
-+2018-05-23  Andreas Schwab  <schwab@suse.de>
-+
-+	[BZ #23196]
-+	CVE-2018-11237
-+	* sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
-+	(L(preloop_large)): Save initial destination pointer in %r11 and
-+	use it instead of %rax after the loop.
-+	* string/test-mempcpy.c (MIN_PAGE_SIZE): Define.
-+
- 2018-05-09  Paul Pluzhnikov  <ppluzhnikov@google.com>
- 
- 	[BZ #22786]
-diff --git a/string/test-mempcpy.c b/string/test-mempcpy.c
-index c08fba8..d98ecdd 100644
---- a/string/test-mempcpy.c
-+++ b/string/test-mempcpy.c
-@@ -18,6 +18,7 @@
-    <http://www.gnu.org/licenses/>.  */
- 
- #define MEMCPY_RESULT(dst, len) (dst) + (len)
-+#define MIN_PAGE_SIZE 131072
- #define TEST_MAIN
- #define TEST_NAME "mempcpy"
- #include "test-string.h"
-diff --git a/sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S b/sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
-index 23c0f7a..a55cf6f 100644
---- a/sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
-+++ b/sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
-@@ -335,6 +335,7 @@ L(preloop_large):
- 	ja	L(preloop_large_bkw)
- 	vmovups	(%rsi), %zmm4
- 	vmovups	0x40(%rsi), %zmm5
-+	mov     %rdi, %r11
- 
- /* Align destination for access with non-temporal stores in the loop.  */
- 	mov	%rdi, %r8
-@@ -366,8 +367,8 @@ L(gobble_256bytes_nt_loop):
- 	cmp	$256, %rdx
- 	ja	L(gobble_256bytes_nt_loop)
- 	sfence
--	vmovups	%zmm4, (%rax)
--	vmovups	%zmm5, 0x40(%rax)
-+	vmovups %zmm4, (%r11)
-+	vmovups %zmm5, 0x40(%r11)
- 	jmp	L(check)
- 
- L(preloop_large_bkw):
--- 
-2.7.4
-
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.28.bb
similarity index 72%
rename from meta/recipes-core/glibc/glibc_2.27.bb
rename to meta/recipes-core/glibc/glibc_2.28.bb
index b14c02cf2a..086daed04c 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -1,13 +1,13 @@
 require glibc.inc
 
-LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
+LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gperf-native bison-native"
 
-SRCREV ?= "df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98"
+SRCREV ?= "3c03baca37fdcb52c3881e653ca392bba7a99c2b"
 
 SRCBRANCH ?= "release/${PV}/master"
 
@@ -19,22 +19,22 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://generate-supported.mk \
            \
            ${NATIVESDKFIXES} \
-           file://0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
-           file://0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
-           file://0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
-           file://0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
-           file://0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
-           file://0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
-           file://0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
-           file://0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
-           file://0013-Add-unused-attribute.patch \
-           file://0014-yes-within-the-path-sets-wrong-config-variables.patch \
-           file://0015-timezone-re-written-tzselect-as-posix-sh.patch \
-           file://0016-Remove-bash-dependency-for-nscd-init-script.patch \
-           file://0017-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0018-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0019-eglibc-Clear-cache-lines-on-ppc8xx.patch \
-           file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
+           file://0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
+           file://0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
+           file://0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
+           file://0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
+           file://0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
+           file://0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
+           file://0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
+           file://0014-Add-unused-attribute.patch \
+           file://0015-yes-within-the-path-sets-wrong-config-variables.patch \
+           file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
+           file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
+           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0019-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0020-eglibc-Clear-cache-lines-on-ppc8xx.patch \
+           file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
@@ -42,11 +42,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-reset-dl_load_write_lock-after-forking.patch \
            file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
-           file://0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch \
-           file://0030-plural_c_no_preprocessor_lines.patch \
-           file://CVE-2017-18269.patch \
-           file://CVE-2018-11236.patch \
-           file://CVE-2018-11237.patch \
+           file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
 "
 
 NATIVESDKFIXES ?= ""
@@ -55,8 +52,7 @@ NATIVESDKFIXES_class-nativesdk = "\
            file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
            file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
            file://0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch \
-           file://relocate-locales.patch \
-           file://0031-nativesdk-deprecate-libcrypt.patch \
+           file://0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.18.0


