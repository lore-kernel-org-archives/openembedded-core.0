Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id CED3370100
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 12:12:28 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 50so3095641uae.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 05:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=OQG4MWLr+1qWgNvqNPhdh2NcGuYUK7oNKLSYJ4X1YaY=;
	b=ANvtNhk21DZwY+3cD8MJbkfjWhIogcIyZ9GZNGkYzVfa1bjI8xSTUIgPe0BNQNDyg3
	PT7qhxdmW0nYEkq3KkmGVZLFZwgYmUWBKmkFNMkTuB1IxGa7dYH+2sm6Ox8hp/hqTkHQ
	CbG5CJirZbMbUvVJA3O3yNuZpMv93p/K8DyGSakdGhtmDh0j882v1EvhRQ997TtEfJw6
	d1i07UjkbVn/g24F3yZ1Awvjbn2Q8FitefKdHVQsqlc9WJE0Jb/8HduNyJP15DB+h+qk
	HvISghc6XMBspvKkZ4gWZyJvQ6v9a86OVJdZ2I7o/CUTQdMTh9DUWdfRBRu122qfmcA7
	GYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=OQG4MWLr+1qWgNvqNPhdh2NcGuYUK7oNKLSYJ4X1YaY=;
	b=i9+UNHxjSoqxW7B1/uTJb6s/HTAEUfbNEDmjs59GOAo+e4XoK49uCJd18aGJlpMsoC
	cCX5dISFNdmRl84kixV2l8bi+v5Rec0zBkJwXuOEpjVGkyCT4TmiRq+e8Sck9lTi/kM6
	/PV1gn/1ZYDBbDrLsd8oMJqFSRo8wge/n0dPtb7b74G2Ns7TxTGJmCHjIqYAStk9PTcw
	5JLEw+jVgAdaxUlrNsdnravdU2rCrEz8JkwLoXb4LC5h5Bk0fBirV9SGNQdiLzAEB7ul
	LL+M2OaRLsZLAuwzFS3doarWOseqzYgvBWzdWuy17e7oGADdMv7wPvfXFx9t+i2fmXzb
	1uDg==
X-Gm-Message-State: ABUngvd74nMDIXmerkTLn5c1Fg870Rq5ml/5Bybu8P7LKhlJv1PciGYVNYax9BC9qVx51w==
X-Received: by 10.176.3.84 with SMTP id 78mr10898212uat.117.1478261550046;
	Fri, 04 Nov 2016 05:12:30 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id
	g191sm2839119vke.17.2016.11.04.05.12.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Nov 2016 05:12:29 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 10:12:00 -0200
Message-Id: <1478261520-4125-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH]] libpcap: Update to version 1.8.1
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
X-List-Received-Date: Fri, 04 Nov 2016 12:12:30 -0000

  - Update patches libpcap.inc and aclocal.patch to work with version 1.8.1.
  - Option --enable-canusb was removed on commit:
    https://github.com/the-tcpdump-group/libpcap/commit/93ca5ff7030aaf1219e1de05ec89a68384bfc50b

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-connectivity/libpcap/libpcap.inc      |   1 -
 .../libpcap/libpcap/aclocal.patch                  | 119 +++++++++++++++------
 .../libpcap/libpcap-pkgconfig-support.patch        |  32 +++---
 .../libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} |   6 +-
 4 files changed, 105 insertions(+), 53 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} (80%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 7b29a52..56a2a6a 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -26,7 +26,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ
 PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 # Add a dummy PACKAGECONFIG for bluez5 since it is not supported by libpcap.
 PACKAGECONFIG[bluez5] = ",,"
-PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
diff --git a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch b/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
index 2151982..a2421c4 100644
--- a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
@@ -1,9 +1,21 @@
+From 731aa41f2139d5217941685441d49a809a04de02 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 3 Nov 2016 17:41:17 -0200
+Subject: [PATCH] aclocal
+Organization: O.S. Systems Software LTDA.
+
 Upstream-Status: Inappropriate [configuration]
 
-diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
---- libpcap-1.1.1-orig/aclocal.m4	2010-06-29 10:46:32.815117569 +0800
-+++ libpcap-1.1.1/aclocal.m4	2010-06-29 10:49:17.150149949 +0800
-@@ -37,7 +37,7 @@
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ aclocal.m4 | 44 ++++++++++++++++++++++----------------------
+ 1 file changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 83f5761..3de3bf8 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -35,7 +35,7 @@ dnl calling AC_PROG_CC, and then doing the tests we now do in
  dnl AC_LBL_C_INIT.  Now, we run AC_LBL_C_INIT_BEFORE_CC, AC_PROG_CC,
  dnl and AC_LBL_C_INIT at the top level.
  dnl
@@ -12,16 +24,43 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
  [
      AC_BEFORE([$0], [AC_LBL_C_INIT])
      AC_BEFORE([$0], [AC_PROG_CC])
-@@ -90,7 +90,7 @@
- dnl     LDFLAGS
- dnl     LBL_CFLAGS
+@@ -92,7 +92,7 @@ dnl	CC
+ dnl	LDFLAGS
+ dnl	LBL_CFLAGS
  dnl
 -AC_DEFUN(AC_LBL_C_INIT,
 +AC_DEFUN([AC_LBL_C_INIT],
  [
      AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])
      AC_BEFORE([$0], [AC_LBL_DEVEL])
-@@ -217,7 +217,7 @@
+@@ -238,7 +238,7 @@ dnl Set ac_lbl_unknown_warning_option_error to the appropriate flag
+ dnl to force an error if it would otherwise just print a warning message
+ dnl and succeed.
+ dnl
+-AC_DEFUN(AC_LBL_CHECK_UNKNOWN_WARNING_OPTION_ERROR,
++AC_DEFUN([AC_LBL_CHECK_UNKNOWN_WARNING_OPTION_ERROR],
+     [
+ 	AC_MSG_CHECKING([whether the compiler fails when given an unknown warning option])
+ 	save_CFLAGS="$CFLAGS"
+@@ -266,7 +266,7 @@ dnl Check whether the compiler option specified as the second argument
+ dnl is supported by the compiler and, if so, add it to the macro
+ dnl specified as the first argument
+ dnl
+-AC_DEFUN(AC_LBL_CHECK_COMPILER_OPT,
++AC_DEFUN([AC_LBL_CHECK_COMPILER_OPT],
+     [
+ 	AC_MSG_CHECKING([whether the compiler supports the $2 option])
+ 	save_CFLAGS="$CFLAGS"
+@@ -315,7 +315,7 @@ dnl output by default.  IBM's XLC, however, supports -M but sends
+ dnl the output to {sourcefile-basename}.u, and AIX has no /dev/stdout
+ dnl to work around that, so we don't bother with XLC.
+ dnl
+-AC_DEFUN(AC_LBL_CHECK_DEPENDENCY_GENERATION_OPT,
++AC_DEFUN([AC_LBL_CHECK_DEPENDENCY_GENERATION_OPT],
+     [
+ 	AC_MSG_CHECKING([whether the compiler supports generating dependencies])
+ 	if test "$GCC" = yes ; then
+@@ -425,7 +425,7 @@ dnl	V_SHLIB_OPT
  dnl	V_SONAME_OPT
  dnl	V_RPATH_OPT
  dnl
@@ -30,7 +69,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [AC_PREREQ(2.50)
      if test "$GCC" = yes ; then
  	    #
-@@ -361,7 +361,7 @@
+@@ -586,7 +586,7 @@ AC_DEFUN(AC_LBL_SHLIBS_INIT,
  # Make sure we use the V_CCOPT flags, because some of those might
  # disable inlining.
  #
@@ -39,7 +78,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [AC_MSG_CHECKING(for inline)
      save_CFLAGS="$CFLAGS"
      CFLAGS="$V_CCOPT"
-@@ -407,7 +407,7 @@
+@@ -632,7 +632,7 @@ dnl usage:
  dnl
  dnl	AC_LBL_FIXINCLUDES
  dnl
@@ -48,16 +87,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [if test "$GCC" = yes ; then
  	    AC_MSG_CHECKING(for ANSI ioctl definitions)
  	    AC_CACHE_VAL(ac_cv_lbl_gcc_fixincludes,
-@@ -453,7 +453,7 @@
- dnl	$2 (yacc appended)
- dnl	$3 (optional flex and bison -P prefix)
- dnl
--AC_DEFUN(AC_LBL_LEX_AND_YACC,
-+AC_DEFUN([AC_LBL_LEX_AND_YACC],
-     [AC_ARG_WITH(flex, [  --without-flex          don't use flex])
-     AC_ARG_WITH(bison, [  --without-bison         don't use bison])
-     if test "$with_flex" = no ; then
-@@ -506,7 +506,7 @@
+@@ -672,7 +672,7 @@ dnl results:
  dnl
  dnl	DECLWAITSTATUS (defined)
  dnl
@@ -66,7 +96,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [AC_MSG_CHECKING(if union wait is used)
      AC_CACHE_VAL(ac_cv_lbl_union_wait,
  	AC_TRY_COMPILE([
-@@ -535,7 +535,7 @@
+@@ -701,7 +701,7 @@ dnl results:
  dnl
  dnl	HAVE_SOCKADDR_SA_LEN (defined)
  dnl
@@ -75,7 +105,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [AC_MSG_CHECKING(if sockaddr struct has the sa_len member)
      AC_CACHE_VAL(ac_cv_lbl_sockaddr_has_sa_len,
  	AC_TRY_COMPILE([
-@@ -560,7 +560,7 @@
+@@ -726,7 +726,7 @@ dnl results:
  dnl
  dnl	HAVE_SOCKADDR_STORAGE (defined)
  dnl
@@ -84,7 +114,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [AC_MSG_CHECKING(if sockaddr_storage struct exists)
      AC_CACHE_VAL(ac_cv_lbl_has_sockaddr_storage,
  	AC_TRY_COMPILE([
-@@ -593,7 +593,7 @@
+@@ -759,7 +759,7 @@ dnl we conclude it doesn't have that member (which is OK, as either we
  dnl won't be using code that would use that member, or we wouldn't
  dnl compile in any case).
  dnl
@@ -93,7 +123,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [AC_MSG_CHECKING(if dl_hp_ppa_info_t struct has dl_module_id_1 member)
      AC_CACHE_VAL(ac_cv_lbl_dl_hp_ppa_info_t_has_dl_module_id_1,
  	AC_TRY_COMPILE([
-@@ -619,7 +619,7 @@
+@@ -785,7 +785,7 @@ dnl results:
  dnl
  dnl	ac_cv_lbl_have_run_path (yes or no)
  dnl
@@ -102,7 +132,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [AC_MSG_CHECKING(for ${CC-cc} -R)
      AC_CACHE_VAL(ac_cv_lbl_have_run_path,
  	[echo 'main(){}' > conftest.c
-@@ -644,7 +644,7 @@
+@@ -810,7 +810,7 @@ dnl results:
  dnl
  dnl	LBL_ALIGN (DEFINED)
  dnl
@@ -111,7 +141,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [AC_MSG_CHECKING(if unaligned accesses fail)
      AC_CACHE_VAL(ac_cv_lbl_unaligned_fail,
  	[case "$host_cpu" in
-@@ -749,7 +749,7 @@
+@@ -914,7 +914,7 @@ dnl	$1 (copt appended)
  dnl	HAVE_OS_PROTO_H (defined)
  dnl	os-proto.h (symlinked)
  dnl
@@ -120,7 +150,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      [rm -f os-proto.h
      if test "${LBL_CFLAGS+set}" = set; then
  	    $1="$$1 ${LBL_CFLAGS}"
-@@ -886,7 +886,7 @@
+@@ -1052,7 +1052,7 @@ dnl The check for libresolv is in case you are attempting to link
  dnl statically and happen to have a libresolv.a lying around (and no
  dnl libnsl.a).
  dnl
@@ -129,7 +159,7 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
      # Most operating systems have gethostbyname() in the default searched
      # libraries (i.e. libc):
      # Some OSes (eg. Solaris) place it in libnsl
-@@ -909,7 +909,7 @@
+@@ -1075,7 +1075,7 @@ dnl
  dnl Test for __attribute__
  dnl
  
@@ -137,8 +167,26 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
 +AC_DEFUN([AC_C___ATTRIBUTE__], [
  AC_MSG_CHECKING(for __attribute__)
  AC_CACHE_VAL(ac_cv___attribute__, [
- AC_COMPILE_IFELSE(
-@@ -947,7 +947,7 @@
+ AC_COMPILE_IFELSE([
+@@ -1114,7 +1114,7 @@ dnl
+ dnl Test whether __attribute__((unused)) can be used without warnings
+ dnl
+ 
+-AC_DEFUN(AC_C___ATTRIBUTE___UNUSED, [
++AC_DEFUN([AC_C___ATTRIBUTE___UNUSED], [
+ AC_MSG_CHECKING([whether __attribute__((unused)) can be used without warnings])
+ AC_CACHE_VAL(ac_cv___attribute___unused, [
+ save_CFLAGS="$CFLAGS"
+@@ -1146,7 +1146,7 @@ dnl
+ dnl Test whether __attribute__((format)) can be used without warnings
+ dnl
+ 
+-AC_DEFUN(AC_C___ATTRIBUTE___FORMAT, [
++AC_DEFUN([AC_C___ATTRIBUTE___FORMAT], [
+ AC_MSG_CHECKING([whether __attribute__((format)) can be used without warnings])
+ AC_CACHE_VAL(ac_cv___attribute___format, [
+ save_CFLAGS="$CFLAGS"
+@@ -1180,7 +1180,7 @@ dnl If so then pcap-linux.c can use this to report proper statistics.
  dnl
  dnl -Scott Barron
  dnl
@@ -147,17 +195,17 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
     [AC_MSG_CHECKING(if if_packet.h has tpacket_stats defined)
     AC_CACHE_VAL(ac_cv_lbl_tpacket_stats,
     AC_TRY_COMPILE([
-@@ -976,7 +976,7 @@
+@@ -1209,7 +1209,7 @@ dnl that member, so if we don't have tpacket_auxdata, we conclude it
  dnl doesn't have that member (which is OK, as either we won't be using
  dnl code that would use that member, or we wouldn't compile in any case).
  dnl
 -AC_DEFUN(AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI,
 +AC_DEFUN([AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI],
      [AC_MSG_CHECKING(if tpacket_auxdata struct has tp_vlan_tci member)
-     AC_CACHE_VAL(ac_cv_lbl_dl_hp_ppa_info_t_has_dl_module_id_1,
+     AC_CACHE_VAL(ac_cv_lbl_linux_tpacket_auxdata_tp_vlan_tci,
  	AC_TRY_COMPILE([
-@@ -1003,7 +1003,7 @@
- dnl 
+@@ -1237,7 +1237,7 @@ dnl results:
+ dnl
  dnl 	HAVE_DLPI_PASSIVE (defined)
  dnl
 -AC_DEFUN(AC_LBL_DL_PASSIVE_REQ_T,
@@ -165,3 +213,6 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
          [AC_MSG_CHECKING(if dl_passive_req_t struct exists)
         AC_CACHE_VAL(ac_cv_lbl_has_dl_passive_req_t,
                  AC_TRY_COMPILE([
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
index b861513..afaa3be 100644
--- a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
@@ -1,25 +1,27 @@
-From 8887132e85892a72a84ca3878e60f254ad2ce939 Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Tue, 24 Feb 2015 15:56:06 -0500
+From 2796129af52901dd68595e5e88a639308541def9 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 3 Nov 2016 17:56:29 -0200
 Subject: [PATCH] libpcap: pkgconfig support
+Organization: O.S. Systems Software LTDA.
 
 Adding basic structure to support pkg-config.
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
  Makefile.in   |  5 +++++
- configure.in  |  1 +
+ configure.ac  |  1 +
  libpcap.pc.in | 10 ++++++++++
  3 files changed, 16 insertions(+)
  create mode 100644 libpcap.pc.in
 
 diff --git a/Makefile.in b/Makefile.in
-index 1c2d745..1f25faf 100644
+index e71d973..d7004ed 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -60,6 +60,10 @@ V_RPATH_OPT = @V_RPATH_OPT@
+@@ -61,6 +61,10 @@ V_RPATH_OPT = @V_RPATH_OPT@
  DEPENDENCY_CFLAG = @DEPENDENCY_CFLAG@
  PROG=libpcap
  
@@ -30,19 +32,19 @@ index 1c2d745..1f25faf 100644
  # Standard CFLAGS
  FULL_CFLAGS = $(CCOPT) $(INCLS) $(DEFS) $(CFLAGS)
  
-@@ -275,6 +279,7 @@ EXTRA_DIST = \
+@@ -286,6 +290,7 @@ EXTRA_DIST = \
  	lbl/os-solaris2.h \
  	lbl/os-sunos4.h \
  	lbl/os-ultrix4.h \
 +	libpcap.pc \
+ 	missing/getopt.c \
+ 	missing/getopt.h \
  	missing/snprintf.c \
- 	mkdep \
- 	msdos/bin2c.c \
-diff --git a/configure.in b/configure.in
-index 8f5c86b..fb51b35 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1700,6 +1700,7 @@ esac
+diff --git a/configure.ac b/configure.ac
+index da2f940..4fc67bf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1805,6 +1805,7 @@ fi
  AC_PROG_INSTALL
  
  AC_CONFIG_HEADER(config.h)
@@ -67,5 +69,5 @@ index 0000000..4f78ad8
 +Libs: -L${libdir} -lpcap
 +Cflags: -I${includedir}
 -- 
-1.9.1
+2.1.4
 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
similarity index 80%
rename from meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
index 8d12b25..8f92ba7 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
@@ -3,8 +3,8 @@ require libpcap.inc
 SRC_URI += "file://aclocal.patch \
             file://libpcap-pkgconfig-support.patch \
            "
-SRC_URI[md5sum] = "b2e13142bbaba857ab1c6894aedaf547"
-SRC_URI[sha256sum] = "7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7f448b0"
+SRC_URI[md5sum] = "3d48f9cd171ff12b0efd9134b52f1447"
+SRC_URI[sha256sum] = "673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e48dcd9c6f0c83541e"
 
 #
 # make install doesn't cover the shared lib
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7
 
 do_configure_prepend () {
     #remove hardcoded references to /usr/include
-    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/configure.in
+    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/configure.ac
 }
 
 do_install_prepend () {
-- 
2.1.4


