Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A705C6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 20:00:00 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a66so130193404wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZwYBwUwZ6H4X3LkdDPm1E9l5gZDHbshCJJJi3qwFbss=;
	b=S2VcCBxR/+vTUEZEKRpI76A7t8L0oG1+S0q0GrAaNO+BEqi5yR62qnPbbMKhqxqWfD
	xRlFggVTUWP2qk1vxxwB3wYpjJMe7CHOxNobmvFwaSqBPBI/NzSOeU/nGMDscIvnze7r
	MI9D0kf0ZHi16CfjVR0G94UCoh7V8+rImmUbuUmoxz1KE3/tNOrI5ExhAy75sdVOpHAs
	1cyoDhEeOX4Nws7gqNeeB657jeVoSX9Nou1cPKoHfnfajnWYzwDy/gl02QVIm+jo60+n
	qaMQM97YAPnJVOXpB+iQUK5TDIpm6pgihLZewzyeE3sYg8G8/s43CZVc6w4mn8+bxYBz
	wHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZwYBwUwZ6H4X3LkdDPm1E9l5gZDHbshCJJJi3qwFbss=;
	b=QaWQhADyFeaosh01xpKpXO5xZBwm84f5kKqGUWbN7TqJnOofxcdnMD0yp8JjIJ2hLq
	fciBmo1BntTy2LisZKwbduRV9jmtm9anQPuMDg54WB2RnTkCOXXEbkVdnlNnDX+ukB1C
	GPBGDmQCAFOpnRF70Rgci/kDXdS+nMSdQCUxv9mBmz20ET/Ngi/Vps4K2Yey4XjJykgJ
	XzHNv8m8Yc4x8CE6OQnocBVotTVx8XFTyN6CGH9JOxVtRFByPQ0Qot4PMY8v3WAhxM28
	Mk40l+EybWs0QJX8woKcCZCKurgQa+BjJ+TWw+Vd7Re6T97C37T3Nz6I/9TtSGqQNpVu
	3Rpw==
X-Gm-Message-State: ALyK8tKMWOTWwbCNzb3tztKXfOOZQOv51TAM4eXEfIbTESty2QOh0+oQb7Vkx3cjGvycdDXc
X-Received: by 10.194.235.4 with SMTP id ui4mr2612146wjc.23.1467057599289;
	Mon, 27 Jun 2016 12:59:59 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	bh4sm1406563wjc.43.2016.06.27.12.59.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Jun 2016 12:59:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 20:59:55 +0100
Message-Id: <1467057595-14559-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] meta: update patch metadata
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
X-List-Received-Date: Mon, 27 Jun 2016 20:00:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enforce the correct tag names across all of oe-core for consistency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../grub/files/grub-2.00-fix-enable_execute_stack-check.patch       | 2 +-
 meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch      | 2 +-
 .../grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch     | 2 +-
 .../0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch     | 2 +-
 meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch            | 2 +-
 .../libacpi/files/use_correct_strip_in_cross_environment.patch      | 2 +-
 .../lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch           | 2 +-
 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch           | 3 +++
 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch         | 2 +-
 .../openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch          | 2 +-
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch                  | 2 +-
 meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch | 4 ++--
 .../coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch   | 2 +-
 meta/recipes-core/coreutils/coreutils-6.9/futimens.patch            | 2 +-
 meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch           | 2 +-
 meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch           | 2 +-
 .../0001-uname-report-processor-and-hardware-correctly.patch        | 2 +-
 .../dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch           | 2 +-
 meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch  | 2 +-
 .../gettext/gettext-0.16.1/fix_gnu_source_circular.patch            | 2 +-
 meta/recipes-devtools/elfutils/elfutils-0.148/fix_for_gcc-4.7.patch | 2 +-
 .../0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch | 2 +-
 .../0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch | 2 +-
 meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch   | 2 +-
 meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch        | 2 +-
 .../guile/files/opensuse/guile-turn-off-gc-test.patch               | 2 +-
 .../make/make-3.81/make_fix_for_automake-1.12.patch                 | 2 +-
 meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch          | 2 +-
 meta/recipes-devtools/perl/perl/fix_bad_rpath.patch                 | 2 +-
 meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch     | 2 +-
 .../python/python-native/avoid_parallel_make_races_on_pgen.patch    | 4 ++--
 meta/recipes-devtools/python/python-native/multilib.patch           | 4 ++--
 meta/recipes-devtools/python/python-native/nohostlibs.patch         | 4 ++--
 .../python/python/01-use-proper-tools-for-cross-build.patch         | 2 +-
 .../python/python/06-avoid_usr_lib_termcap_path_in_linking.patch    | 2 +-
 .../python/python/avoid_parallel_make_races_on_pgen.patch           | 4 ++--
 .../python/python/fix_for_using_different_libdir.patch              | 6 +++---
 meta/recipes-devtools/python/python/multilib.patch                  | 2 +-
 .../python/python3/fix_for_using_different_libdir.patch             | 4 ++--
 meta/recipes-devtools/python/python3/use_packed_importlib.patch     | 2 +-
 .../qemu/qemu/0001-configure-support-vte-2.91.patch                 | 2 +-
 .../tcltk/tcl/fix_issue_with_old_distro_glibc.patch                 | 2 +-
 .../diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch | 2 +-
 .../findutils-4.2.31/findutils_fix_for_automake-1.12.patch          | 2 +-
 .../gawk/gawk-3.1.5/gawk-3.1.5_fix_for_automake-1.12.patch          | 2 +-
 meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch    | 2 +-
 meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch     | 2 +-
 .../grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch               | 2 +-
 meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch        | 2 +-
 .../avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch    | 2 +-
 .../libidn/libidn/libidn_fix_for_automake-1.12.patch                | 2 +-
 .../0001-modules-files.c-parse_field-fix-string-formating-in-.patch | 2 +-
 .../0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch | 2 +-
 .../0002-Add-knob-to-control-whether-numa-support-should-be-c.patch | 2 +-
 .../mdadm/files/0001-Fix-some-type-comparison-problems.patch        | 2 +-
 meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch     | 2 +-
 meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch             | 2 +-
 .../sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch             | 2 +-
 .../which/which-2.18/fix_name_conflict_group_member.patch           | 2 +-
 ...pad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch | 2 +-
 .../weston/make-weston-launch-exit-for-unrecognized-option.patch    | 2 +-
 meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch        | 2 +-
 meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch    | 2 +-
 .../lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch             | 2 +-
 meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  | 2 +-
 .../0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch | 4 ++--
 meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch     | 2 +-
 67 files changed, 78 insertions(+), 75 deletions(-)

diff --git a/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch b/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
index 09ef4db..1ff3c1c 100644
--- a/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
+++ b/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
@@ -10,7 +10,7 @@ cc1: all warnings being treated as errors
 configure:20323: $? = 1
 configure:20327: error: ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/builddisk/build/build0/tmp/sysroots/emenlow failed to produce assembly code
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/04/13
 
 Index: grub-2.00/acinclude.m4
diff --git a/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch b/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
index c557f13..dd30d94 100644
--- a/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
+++ b/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
@@ -6,7 +6,7 @@ configure:20574: i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic
 conftest.c:1:0: error: SSE instruction set disabled, using 387 arithmetics [-Werror]
 cc1: all warnings being treated as errors
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/04/13
 
 Index: grub-1.99/configure.ac
diff --git a/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch b/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
index 6259a1a..e15040d7 100644
--- a/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
+++ b/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
@@ -2,7 +2,7 @@ Upstream-Status: Inappropriate [embedded specific]
 
 remove the grub-sparc64-setup files from the x86 builds.
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 --- a/Makefile.util.am	2014-08-15 11:41:02.441011278 -0700
 +++ b/Makefile.util.am	2014-08-15 11:44:26.245021142 -0700
diff --git a/meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch b/meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
index 87ec29e..ce3238f 100644
--- a/meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
+++ b/meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
@@ -20,7 +20,7 @@ conftest.c:1:0: error: SSE instruction set disabled, using 387
 arithmetics [-Werror]
 cc1: all warnings being treated as errors
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Pending
diff --git a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
index 2fed344..86a16c2 100644
--- a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
+++ b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
@@ -7,7 +7,7 @@ Fix libacpi for x32
 
 Patch Received from:  H.J. Lu <hjl.tools@gmail.com>
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/05
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/05
 
 Index: libacpi-0.2/Makefile
 ===================================================================
diff --git a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
index bca75fb..ef376aa 100644
--- a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
+++ b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
@@ -6,7 +6,7 @@ Used the cross strip instead of host strip to avoid this build error:
 | make: *** [test-libacpi] Error 1
 | ERROR: oe_runmake failed
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
 
 Index: libacpi-0.2/Makefile
 ===================================================================
diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
index b4529f4..682f1c9 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
@@ -9,7 +9,7 @@ This patch fixes following issue with automake 1.12
 | src/Makefile.am:11: error: automatic de-ANSI-fication support has been removed
 
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/03
 
 Index: lrzsz-0.12.20/configure.in
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
index a31ea81..5f5cb0d 100644
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
@@ -5,6 +5,9 @@ Subject: [PATCH] Part 2 of: 4319.   [security]      Fix resolver assertion
  failure due to improper                         DNAME handling when parsing
  fetch reply messages.                         (CVE-2016-1286) [RT #41753]
 
+CVE: CVE-2016-1286
+Upstream-Status: Backport
+
 (cherry picked from commit 2de89ee9de8c8da9dc153a754b02dcdbb7fe2374)
 Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
 ---
diff --git a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
index 6989d6d..b02ecb1 100644
--- a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
+++ b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Pending
 
-Signed-off-by Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Index: bind-9.9.5/bin/Makefile.in
 ===================================================================
diff --git a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
index af3989f..4f81d85 100644
--- a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
+++ b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
@@ -15,7 +15,7 @@ We don't enable this globally as there are some cases where we'd get
 Reported-by: Bertrand Jacquin <bertrand@jacquin.bzh>
 URL: https://bugs.gentoo.org/542618
 
-Signed-off-By: Armin Kuster <akuster@mvista.com>
+Signed-off-by: Armin Kuster <akuster@mvista.com>
 
 Index: openssl-1.0.2a/crypto/perlasm/x86_64-xlate.pl
 ===================================================================
diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
index 06d1ea6..2a318a4 100644
--- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
+++ b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
@@ -4,7 +4,7 @@ This patch adds the fix for one of the ciphers used in openssl, namely
 the cipher des-ede3-cfb1. Complete bug log and patch is present here:
 http://rt.openssl.org/Ticket/Display.html?id=2867
 
-Signed-Off-By: Muhammad Shakeel <muhammad_shakeel@mentor.com>
+Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
 
 Index: openssl-1.0.2/crypto/evp/e_des3.c
 ===================================================================
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
index cbce32c..0f08a64 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
+++ b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
@@ -2,10 +2,10 @@ Upstream-Status: Pending
 
 Received from H J Liu @ Intel
 Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
 
 ported the patch to the 1.0.0e version
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
 Index: openssl-1.0.2/crypto/bn/bn.h
 ===================================================================
 --- openssl-1.0.2.orig/crypto/bn/bn.h
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch
index 02730db..64e5f12 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch
@@ -11,7 +11,7 @@ this patch avoids these kinds of errors:
 | configure.ac:40: the top level
 | autom4te: m4 failed with exit status: 1
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/04
 
 Index: coreutils-6.9/m4/jm-macros.m4
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/futimens.patch b/meta/recipes-core/coreutils/coreutils-6.9/futimens.patch
index 5ca590b..5088106 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/futimens.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/futimens.patch
@@ -3,7 +3,7 @@ Upstream-Status: Inappropriate [legacy version]
 # coreutils uses gnulib which conflicts with newer libc header on futimens
 # this patch simply renames coreutils futimes to avoid confliction
 #
-# Signed-off-by Kevin Tian <kevin.tian@intel.com>, 2010-08-18
+# Signed-off-by: Kevin Tian <kevin.tian@intel.com>, 2010-08-18
 # (this patch is licensed under GPLv2)
 
 diff --git a/lib/utimens.c b/lib/utimens.c
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch b/meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch
index 8f35552..8a8ffa7 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch
@@ -3,7 +3,7 @@ Upstream-Status: Inappropriate [legacy version]
 # remove the line to cause recursive inclusion error from autoreconf, sicne
 # newer autoconf has included this definition. Simply rename it here.
 #
-# Signed-off-by Kevin Tian <kevin.tian@intel.com>, 2010-08-18
+# Signed-off-by: Kevin Tian <kevin.tian@intel.com>, 2010-08-18
 # (this patch is licensed under GPLv2)
 
 diff --git a/extensions.m4 b/extensions.m4
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch b/meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch
index c42cb9c..59a4fe0 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch
@@ -6,7 +6,7 @@ Upstream-Status: Inappropriate [legacy version]
 # is with target format which can't be invoked on build system, disable building
 # 'touch' man page here.
 #
-# Signed-off-by Kevin Tian <kevin.tian@intel.com>, 2010-08-18
+# Signed-off-by: Kevin Tian <kevin.tian@intel.com>, 2010-08-18
 # (this patch is licensed under GPLv2)
 
 diff --git a/man/Makefile.am b/man/Makefile.am
diff --git a/meta/recipes-core/coreutils/coreutils-8.25/0001-uname-report-processor-and-hardware-correctly.patch b/meta/recipes-core/coreutils/coreutils-8.25/0001-uname-report-processor-and-hardware-correctly.patch
index c5f449f..3c43e1d 100644
--- a/meta/recipes-core/coreutils/coreutils-8.25/0001-uname-report-processor-and-hardware-correctly.patch
+++ b/meta/recipes-core/coreutils/coreutils-8.25/0001-uname-report-processor-and-hardware-correctly.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Rejected
+Upstream-Status: Denied
 
 Subject: uname: report processor and hardware correctly
 
diff --git a/meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch b/meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
index b450121..60b302b 100644
--- a/meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
+++ b/meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
@@ -10,7 +10,7 @@ undesired size, when compiled with the x32 abi toolchain.
 2013/05/23
 Received this fix from H J Lu.
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 # HG changeset patch
 # User H.J. Lu <hjl.tools@gmail.com>
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
index 7293f5b..49a10f5 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
@@ -5,7 +5,7 @@ when we update aclocal
 
 Upstream-Status: Inappropriate [configuration]
 
-Signed-off-by Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Index: gettext-0.16.1/autoconf-lib-link/m4/lib-link.m4
 ===================================================================
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
index 0686149..fd5feeb 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
@@ -6,7 +6,7 @@ Thanks to Mark Hatle for the timely pointers and fixes.
 
 Upstream-Status: Inappropriate [licensing]
 
-Signed-off-by Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 diff -ru gettext-0.16.1/gettext-runtime/gnulib-m4/extensions.m4 gettext.patched/gettext-runtime/gnulib-m4/extensions.m4
 --- gettext-0.16.1/gettext-runtime/gnulib-m4/extensions.m4	2006-11-27 09:14:38.000000000 -0800
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/fix_for_gcc-4.7.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/fix_for_gcc-4.7.patch
index bd634b4..c78f95d 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/fix_for_gcc-4.7.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/fix_for_gcc-4.7.patch
@@ -2,7 +2,7 @@ Upstream-Status: pending
 gcc 4.7 does not like pointer conversion, so have a void * tmp var to work 
 around following compilation issue.
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2011/07/07
 
 | md5.c: In function 'md5_finish_ctx':
diff --git a/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch b/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
index 43238a7..c7bf635 100644
--- a/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
+++ b/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Inappropriate [debian patch]
 
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 From e52bfcdbaca5dce498678d8f512381e3e39a4066 Mon Sep 17 00:00:00 2001
 From: Rob Browning <rlb@defaultvalue.org>
diff --git a/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch b/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
index 34be3b9..d3faf3e 100644
--- a/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
+++ b/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Inappropriate [debian patch]
 
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 From 848543091d55dddb54a85612155964506d712852 Mon Sep 17 00:00:00 2001
 From: Rob Browning <rlb@defaultvalue.org>
diff --git a/meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch b/meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
index e5dc226..5597bb2 100644
--- a/meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
+++ b/meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
@@ -6,7 +6,7 @@ autoreconf error avoided:
 | sed: -e expression #1, char 9: unknown option to `s'
 | configure.ac:39: error: AC_INIT should be called with package and version arguments
 
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/01
 
 Index: guile-2.0.5/build-aux/git-version-gen
diff --git a/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch b/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
index d3e312f..da69b5f 100644
--- a/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
+++ b/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Inappropriate [opensuse patch]
 
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 Index: guile-2.0.3/libguile/hash.c
 ===================================================================
diff --git a/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch b/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
index e201486..e2a353e 100644
--- a/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
+++ b/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Inappropriate [opensuse patch]
 
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=10096
 why this test is turned off.
diff --git a/meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch b/meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch
index 9b2e964..102fe79 100644
--- a/meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch
+++ b/meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch
@@ -11,7 +11,7 @@ this patch avoids these kinds of errors:
 | ERROR: autoreconf execution failed.
 
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/04
 
 Index: make-3.81/configure.in
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
index 04222cb..63b80f6 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
@@ -2,7 +2,7 @@ uuid.pc is generated at build time so should be installed from the current
 directory, and not $S.
 
 Upstream-Status: Pending [should be submitted]
-Signed-Off-By: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Index: uuid-1.6.2/Makefile.in
 ===================================================================
diff --git a/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch b/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
index 69ac434..7650128 100644
--- a/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
+++ b/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
@@ -1,5 +1,5 @@
 Upstream-Status:Inappropriate [embedded specific]
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2011/07/01
 
 Fix these Package QA warnings before they are converted into fetal errors:
diff --git a/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch b/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
index 6c61b09..8be6e4d 100644
--- a/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
+++ b/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
@@ -3,7 +3,7 @@ Upstream-Status: Inappropriate [embedded specific]
 Avoids using python from the HOSTs native sysroot for f2py,
 uses TARGET env python instead.
 
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 Index: numpy-1.11.0/numpy/f2py/setup.py
 ===================================================================
diff --git a/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch b/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
index 5279e7c..a592ea4 100644
--- a/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
+++ b/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
@@ -4,8 +4,8 @@ Avoids parallel make races linking errors when making Parser/PGEN
 
 - Implements Richard Purdie's idea
 
-Signed-Off-By: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 Index: Python-2.7.9/Makefile.pre.in
 ===================================================================
diff --git a/meta/recipes-devtools/python/python-native/multilib.patch b/meta/recipes-devtools/python/python-native/multilib.patch
index 8ca89e7..8d475e9 100644
--- a/meta/recipes-devtools/python/python-native/multilib.patch
+++ b/meta/recipes-devtools/python/python-native/multilib.patch
@@ -1,6 +1,6 @@
 Rebased for Python 2.7.9
 
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 2011/09/29
 The python recipe building was failing because python-native 
@@ -10,7 +10,7 @@ recipe.
 
 Upstream-Status: Inappropriate [oe-specific]
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 Index: Python-2.7.9/Include/pythonrun.h
 ===================================================================
diff --git a/meta/recipes-devtools/python/python-native/nohostlibs.patch b/meta/recipes-devtools/python/python-native/nohostlibs.patch
index 8a452e9..078060b 100644
--- a/meta/recipes-devtools/python/python-native/nohostlibs.patch
+++ b/meta/recipes-devtools/python/python-native/nohostlibs.patch
@@ -2,8 +2,8 @@ Upstream-Status: Inappropriate [embedded specific]
 
 2014/12/15
 Rebased for python-2.7.9
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 Index: Python-2.7.9/setup.py
 ===================================================================
diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 1257ca6..4d1395d 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -7,7 +7,7 @@ Signed-off-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 Rebased for python-2.7.9
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 Index: Python-2.7.9/Makefile.pre.in
 ===================================================================
diff --git a/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch b/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
index e452cb6..435b319 100644
--- a/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
+++ b/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
@@ -11,7 +11,7 @@ Nitin A Kamble <nitin.a.kamble@intel.com>
 
 2011/09/29
 Rebased for python 2.7.2
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
diff --git a/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch b/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch
index e9bae32..8012245 100644
--- a/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch
+++ b/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch
@@ -4,8 +4,8 @@ Avoids parallel make races linking errors when making Parser/PGEN
 
 - Implements Richard Purdie's idea
 
-Signed-Off-By: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 Index: Python-2.7.9/Makefile.pre.in
 ===================================================================
diff --git a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
index e4262d9..5f73093 100644
--- a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
+++ b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
@@ -4,15 +4,15 @@ This patch fixes issuing with different libdir like lib64.
 This patch makes the native python binary modules findable
 in the install process of the host python.
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2012/03/14
 
 Updated for python 2.7.3
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2012/05/01
 
 Rebased for python-2.7.9
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 
 Index: Python-2.7.9/Lib/sysconfig.py
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index 0bfa0d2..47c4bc1 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -1,5 +1,5 @@
 Rebased for python-2.7.9
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 Index: Python-2.7.9/configure.ac
 ===================================================================
diff --git a/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
index cd1a978..0610565 100644
--- a/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
+++ b/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
@@ -4,11 +4,11 @@ This patch fixes issuing with different libdir like lib64.
 This patch makes the native python binary modules findable
 in the install process of the host python.
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2012/03/14
 
 Updated for python 2.7.3
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2012/05/01
 
 Index: Python-3.3.0rc2/Lib/sysconfig.py
diff --git a/meta/recipes-devtools/python/python3/use_packed_importlib.patch b/meta/recipes-devtools/python/python3/use_packed_importlib.patch
index 6c4b0cd..70708a0 100644
--- a/meta/recipes-devtools/python/python3/use_packed_importlib.patch
+++ b/meta/recipes-devtools/python/python3/use_packed_importlib.patch
@@ -6,7 +6,7 @@ importlib*.h files, this is impossible to do on a cross-compile environment,
 this avoids executing the binary and forces it to use the packed importlib*.h files.
 
  
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com> 
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com> 
 
 Index: Python-3.5.0/Makefile.pre.in
 ===================================================================
diff --git a/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch b/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
index af0df3b..c286822 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
@@ -3,7 +3,7 @@ From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 17 Jun 2016 21:09:03 +0300
 Subject: [PATCH] configure: support vte-2.91
 
-Upstream-status: Backport [c6feff9e09aa99]
+Upstream-Status: Backport [c6feff9e09aa99]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 
 Original commit message below:
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
index 5b5de07..72a0fa4 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
@@ -12,7 +12,7 @@ Fixes tcl target recipe build on old distros which have glibc older than 2.14
 | Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/bin
 | make: *** [install-msgs] Error 1
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/04/26
 
 Index: unix/Makefile.in
diff --git a/meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch b/meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch
index cc05d1d..f8638bb 100644
--- a/meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch
@@ -10,7 +10,7 @@ this patch avoids these kinds of errors:
 | configure.ac:90: the top level
 | autom4te: m4 failed with exit status: 1
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/04
 
 Index: diffutils-2.8.1/m4/prereq.m4
diff --git a/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch b/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
index 2d0ddb4..1b7f8cf 100644
--- a/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
@@ -6,7 +6,7 @@ this patch avoids these kinds of errors:
 
 | configure.in:75: error: automatic de-ANSI-fication support has been removed
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/04
 
 Index: findutils-4.2.31/configure.in
diff --git a/meta/recipes-extended/gawk/gawk-3.1.5/gawk-3.1.5_fix_for_automake-1.12.patch b/meta/recipes-extended/gawk/gawk-3.1.5/gawk-3.1.5_fix_for_automake-1.12.patch
index b3e7987..c42c33c 100644
--- a/meta/recipes-extended/gawk/gawk-3.1.5/gawk-3.1.5_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/gawk/gawk-3.1.5/gawk-3.1.5_fix_for_automake-1.12.patch
@@ -11,7 +11,7 @@ this patch avoids these kinds of errors:
 ...
 | Makefile.am:27: error: automatic de-ANSI-fication support has been removed
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/04
 
 Index: gawk-3.1.5/configure.ac
diff --git a/meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch b/meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch
index 5a4149c..ce59509 100644
--- a/meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch
+++ b/meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Inappropriate [Poky Specific this is gplv2 version]
 
-Signed-off-by Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Index: grep-2.5.1a/doc/grep.texi
 ===================================================================
diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
index 721f2a0..a40a9f3 100644
--- a/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
+++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
@@ -12,7 +12,7 @@ This version of GNU Grep has been abandoned upstream and they are no longer
 accepting patches.  This is not a backport.
 CVE: CVE-2012-5667
 
-Signed-off-by Ming Liu <ming.liu@windriver.com>
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
 ---
  grep.c |    7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch
index 3ccce5f..d9b1e35 100644
--- a/meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch
@@ -13,7 +13,7 @@ this patch avoids these kinds of errors:
 | src/Makefile.am:2: error: automatic de-ANSI-fication support has been removed
 | autoreconf: automake failed with exit status: 1
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/04
 
 Index: grep-2.5.1a/configure.in
diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
index 508f5a1..dc4ba50 100644
--- a/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
+++ b/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
@@ -6,7 +6,7 @@ syscall so that it works with both x32 and x86-64.
 
 Received this patch from H.J. Lu <hjl.tools@gmail.com>
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2011/12/02
 
 --- libaio-0.3.109/src/syscall-x86_64.h.x32	2009-10-09 11:17:02.000000000 -0700
diff --git a/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
index 3476bb9..98ba4d6 100644
--- a/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
+++ b/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
@@ -7,7 +7,7 @@ These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has n
 eliminated these deprecated macros yet. So disable the treatment of warnings
 as errors until gettext is updated to remove the deprecated macros.
 
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/07/10
 
 Index: libidn-1.24/configure.ac
diff --git a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
index 20afd25..5683d3c 100644
--- a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
@@ -6,7 +6,7 @@ This patch fixes following issue with automake 1.12
 | /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libidn.la': linking libtool libraries using a non-POSIX
 | /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/03
 
 Index: libidn-1.24/configure.ac
diff --git a/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch b/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
index 074491b..7c47df2 100644
--- a/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
+++ b/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
@@ -11,7 +11,7 @@ Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 
-Upstream-status: Pending
+Upstream-Status: Pending
 ---
  modules/files.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
index 8f285d1..04532be 100644
--- a/meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
@@ -18,7 +18,7 @@ acl1.c:317:2: error: format not a string literal and no format arguments
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 
-Upstream-status: Pending
+Upstream-Status: Pending
 ---
  testcases/network/nfsv4/acl/acl1.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
index 68725dc..0684bee 100644
--- a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
+++ b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
@@ -7,7 +7,7 @@ Subject: [PATCH 02/32] Add knob to control whether numa support should be
 otherwise undeterministic dependency will be generated
 during build depending upong numa being staged or not
 
-signed-off-by: Roy.Li <rongqing.li@windriver.com>
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  m4/ltp-numa.m4 | 10 +++++++++-
diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch b/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
index ee482b5..f829467 100644
--- a/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
@@ -11,7 +11,7 @@ unsigned int too.
 
 Upstream-Status: Backport
 
-Signed-off-by : Xiao Ni <xni@redhat.com>
+Signed-off-by: : Xiao Ni <xni@redhat.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
 
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
index 40acc14..84c382d 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
@@ -6,7 +6,7 @@ set by tune settings are lost. Causing compile failure with x32 toolchain
 As the bitbake defined CC is good, there is no need to redfine CC in the 
 make file, hence making the CC definition in the Makefile conditional.
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
 
 Index: mdadm-3.3/Makefile
 ===================================================================
diff --git a/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch b/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
index 80878f3..7adbd02 100644
--- a/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
+++ b/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
@@ -9,7 +9,7 @@ Date:   Tue Dec 6 10:34:53 2011 -0800
     size of off_t to see if file offset is 64bit.  This patch adds
     AC_CHECK_SIZEOF(off_t) and checks SIZEOF_OFF_T == 8.
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/06
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/06
 
 Index: pax-3.4/configure.in
 ===================================================================
diff --git a/meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch b/meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch
index 8059406..c7c0aa0 100644
--- a/meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch
@@ -6,7 +6,7 @@ Avoid this build issue:
 | make[1]: mkdir_p@: Command not found
 | make[1]: *** [install-data-yes] Error 127
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/07/13
 
 Index: sed-4.1.2/intl/Makefile.in
diff --git a/meta/recipes-extended/which/which-2.18/fix_name_conflict_group_member.patch b/meta/recipes-extended/which/which-2.18/fix_name_conflict_group_member.patch
index fb9b1a4..0e0988b 100644
--- a/meta/recipes-extended/which/which-2.18/fix_name_conflict_group_member.patch
+++ b/meta/recipes-extended/which/which-2.18/fix_name_conflict_group_member.patch
@@ -3,7 +3,7 @@ Upstream-Status: Inappropriate [this is 2.18(GPLv2) specific]
 # glibc also implements the function group_member. To avoid name conflict,
 # here let us append a "_" to which's version.
 #
-# Signed-off-by Dexuan Cui <dexuan.cui@intel.com>, 2010-08-20
+# Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>, 2010-08-20
 # (this patch is licensed under GPLv2)
 
 --- which-2.18/bash.c
diff --git a/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch b/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
index 97c63bd..b52b496 100644
--- a/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
+++ b/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
@@ -1,7 +1,7 @@
 This is a workaround upstream suggests for use with kernel 4.1.
 
 Upstream-Status: Inappropriate [temporary work-around]
-Signed-Off-By: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 
 
 
diff --git a/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch b/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
index 25c8683..0c408a4 100644
--- a/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
+++ b/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
@@ -8,7 +8,7 @@ Exit the program if an unrecognized command line option is found.
 
 Upstream-Status: Submitted
 
-Signed-off-by; Tom Hochstein <tom.hochstein@nxp.com>
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
 
diff --git a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
index ce6c756..ffc2c15 100644
--- a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
+++ b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
@@ -3,7 +3,7 @@ Upstream-Status: Pending
 This fixes compilation with x32 toolchain.
 
 Received this patch from H.J. Lu <hjl.tools@gmail.com>
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
 
 
 --- libXt-1.1.1/include/X11/Xtos.h.x32	2011-02-08 07:56:40.000000000 -0800
diff --git a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
index 540ad27..8a5ff58 100644
--- a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
+++ b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
@@ -8,7 +8,7 @@ __LP64__ before defining LONG64 without checking __amd64__/amd64.
 This fixes compilation with x32 toolchain.
 
 Received this patch from H.J. Lu <hjl.tools@gmail.com>
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
 
 --- xproto-7.0.22/Xmd.h.x32	2009-07-11 04:19:50.000000000 -0700
 +++ xproto-7.0.22/Xmd.h	2011-11-30 17:14:19.290395893 -0800
diff --git a/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch b/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
index 571a1d0..51baef2 100644
--- a/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
+++ b/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
@@ -4,7 +4,7 @@ Fix this kind of errors with automake 1.12.x:
 | doc/man/Makefile.am:3: error: automatic de-ANSI-fication support has been removed
 | autoreconf: automake failed with exit status: 1
 
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/07/13
 
 Index: lame-3.99.5/configure.in
diff --git a/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
index 63aed05..26fd8ef 100644
--- a/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
+++ b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
@@ -5,7 +5,7 @@ this patch avoids these kinds of errors:
 | configure.in:2240: error: automatic de-ANSI-fication support has been removed
 | Makefile.am:28: error: automatic de-ANSI-fication support has been removed
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/02
 
 
diff --git a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
index a43017c..05c771a 100644
--- a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
+++ b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
@@ -1,6 +1,6 @@
-ensure the XATTR_NAME_CAPS is defined when it is used
+Ensure the XATTR_NAME_CAPS is defined when it is used
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 VFS_CAP_U32 can not ensure that XATTR_NAME_CAPS is defined, and failed to build
 libcap-native in old release, like CentOS release 6.7 (Final), with the blow
diff --git a/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch b/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
index 91bca96..7d74aad 100644
--- a/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
+++ b/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
@@ -4,7 +4,7 @@ This patch avoids this error with automake 1.12:
 
 | configure.ac:49: error: automatic de-ANSI-fication support has been removed
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/02
 
 Index: popt-1.16/configure.ac
-- 
2.8.1


