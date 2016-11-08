Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 551806010B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 11:53:24 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x186so7562947vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 03:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=XpY18QdBhK8mqcwkxnVV8WvaGtMkpjVy3ebZazO01fQ=;
	b=LPJ74CV1SdZ7qaZj/JVnuC8Z1vNcFxCxgj2RiKByDFzlZexcf5fwwSRQfGrE0jWOw2
	dPz5rqVfP/OfyTmXIsaMh0wzSUG2CxCLcYvKCTnzfFxV15VNxv4u7vI86Ub4gjkAvGKH
	ny5xoU6FFL3Qop8BgnV8tU2i/Vy24pZza6Tzd2qAYambgm7qqky1ydGDGxGdy7mllmrF
	Ry3vfzSfY3/jfzH5P+9OHfbq9RSDACMtYckCuIEChU6KGTxf3TftfZgo8Ak+e+XM8Kw5
	gueM9WM180PiKtXiYSlWeUQnJt8vqprHPV7cu1Pj7Fp19odeNKgeSh9XPi9ZOk5Wtg7R
	4b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=XpY18QdBhK8mqcwkxnVV8WvaGtMkpjVy3ebZazO01fQ=;
	b=AGIHUTV43hx2sgRW+j+IkcggBUHKnODT4VrtlUc+qIZ6EZZn7R6OlVTvnl6RjOTCWd
	A1j7HCzr2ZXULoSNfPOEsdYQFcwYO4KGEeQM5PWV/uqVaTpgfhLnFK9ABd9e/l8wm/NY
	5OqWAZExIQ0q3ZyDKwUIucpkgAuOHxDm7b8cRAo1W+lXL+HHSTBeMCYmvLrvmnjSG8Qv
	m5qOLF0gJ+fPxQbdM8bsZ5PuYDh/B2dw6XyxCbTjPxnpc+2/0TB41h/50aNTFxRiONxS
	tUsqBwB0vP0IJEXJfy7FLFM4tGKJh/8oBI5gnAqR/9xHpJBHWne+w97+LY7ZTGzZBcQ0
	HyZA==
X-Gm-Message-State: ABUngvdebuBp3XUk43MQefuEds4VHdBG3xxogJA7Zhl2turtzhaIu7Wga9okcKsWjN88Rw==
X-Received: by 10.31.61.20 with SMTP id k20mr7822841vka.172.1478606005361;
	Tue, 08 Nov 2016 03:53:25 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id 103sm1146210uaj.0.2016.11.08.03.53.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Nov 2016 03:53:23 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 09:52:48 -0200
Message-Id: <1478605968-18575-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v2] libpcap: Update to version 1.8.1
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
X-List-Received-Date: Tue, 08 Nov 2016 11:53:27 -0000

  - Option --enable-canusb was removed on commit:
    https://github.com/the-tcpdump-group/libpcap/commit/93ca5ff7030aaf1219e1de05ec89a68384bfc50b
  - Autotools class was improved and we can now stop aclocal from running at all.
  - File configure.in was renamed to configure.ac, rework libpcap-pkgconfig-support
    patch and do_configure_prepend task to use configure.ac file.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-connectivity/libpcap/libpcap.inc      |   5 +-
 .../libpcap/libpcap/aclocal.patch                  | 167 ---------------------
 .../libpcap/libpcap-pkgconfig-support.patch        |  32 ++--
 .../libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} |  13 +-
 4 files changed, 25 insertions(+), 192 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} (67%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 7b29a52..4453a9e 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -19,6 +19,7 @@ BINCONFIG = "${bindir}/pcap-config"
 inherit autotools binconfig-disabled pkgconfig bluetooth
 
 EXTRA_OECONF = "--with-pcap=linux"
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
@@ -26,7 +27,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ
 PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 # Add a dummy PACKAGECONFIG for bluez5 since it is not supported by libpcap.
 PACKAGECONFIG[bluez5] = ",,"
-PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
@@ -36,8 +36,5 @@ CFLAGS_prepend = "-I${S} "
 CXXFLAGS_prepend = "-I${S} "
 
 do_configure_prepend () {
-    if [ ! -e ${S}/acinclude.m4 ]; then
-        cat ${S}/aclocal.m4 > ${S}/acinclude.m4
-    fi
     sed -i -e's,^V_RPATH_OPT=.*$,V_RPATH_OPT=,' ${S}/pcap-config.in
 }
diff --git a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch b/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
deleted file mode 100644
index 2151982..0000000
--- a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
---- libpcap-1.1.1-orig/aclocal.m4	2010-06-29 10:46:32.815117569 +0800
-+++ libpcap-1.1.1/aclocal.m4	2010-06-29 10:49:17.150149949 +0800
-@@ -37,7 +37,7 @@
- dnl AC_LBL_C_INIT.  Now, we run AC_LBL_C_INIT_BEFORE_CC, AC_PROG_CC,
- dnl and AC_LBL_C_INIT at the top level.
- dnl
--AC_DEFUN(AC_LBL_C_INIT_BEFORE_CC,
-+AC_DEFUN([AC_LBL_C_INIT_BEFORE_CC],
- [
-     AC_BEFORE([$0], [AC_LBL_C_INIT])
-     AC_BEFORE([$0], [AC_PROG_CC])
-@@ -90,7 +90,7 @@
- dnl     LDFLAGS
- dnl     LBL_CFLAGS
- dnl
--AC_DEFUN(AC_LBL_C_INIT,
-+AC_DEFUN([AC_LBL_C_INIT],
- [
-     AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])
-     AC_BEFORE([$0], [AC_LBL_DEVEL])
-@@ -217,7 +217,7 @@
- dnl	V_SONAME_OPT
- dnl	V_RPATH_OPT
- dnl
--AC_DEFUN(AC_LBL_SHLIBS_INIT,
-+AC_DEFUN([AC_LBL_SHLIBS_INIT],
-     [AC_PREREQ(2.50)
-     if test "$GCC" = yes ; then
- 	    #
-@@ -361,7 +361,7 @@
- # Make sure we use the V_CCOPT flags, because some of those might
- # disable inlining.
- #
--AC_DEFUN(AC_LBL_C_INLINE,
-+AC_DEFUN([AC_LBL_C_INLINE],
-     [AC_MSG_CHECKING(for inline)
-     save_CFLAGS="$CFLAGS"
-     CFLAGS="$V_CCOPT"
-@@ -407,7 +407,7 @@
- dnl
- dnl	AC_LBL_FIXINCLUDES
- dnl
--AC_DEFUN(AC_LBL_FIXINCLUDES,
-+AC_DEFUN([AC_LBL_FIXINCLUDES],
-     [if test "$GCC" = yes ; then
- 	    AC_MSG_CHECKING(for ANSI ioctl definitions)
- 	    AC_CACHE_VAL(ac_cv_lbl_gcc_fixincludes,
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
- dnl
- dnl	DECLWAITSTATUS (defined)
- dnl
--AC_DEFUN(AC_LBL_UNION_WAIT,
-+AC_DEFUN([AC_LBL_UNION_WAIT],
-     [AC_MSG_CHECKING(if union wait is used)
-     AC_CACHE_VAL(ac_cv_lbl_union_wait,
- 	AC_TRY_COMPILE([
-@@ -535,7 +535,7 @@
- dnl
- dnl	HAVE_SOCKADDR_SA_LEN (defined)
- dnl
--AC_DEFUN(AC_LBL_SOCKADDR_SA_LEN,
-+AC_DEFUN([AC_LBL_SOCKADDR_SA_LEN],
-     [AC_MSG_CHECKING(if sockaddr struct has the sa_len member)
-     AC_CACHE_VAL(ac_cv_lbl_sockaddr_has_sa_len,
- 	AC_TRY_COMPILE([
-@@ -560,7 +560,7 @@
- dnl
- dnl	HAVE_SOCKADDR_STORAGE (defined)
- dnl
--AC_DEFUN(AC_LBL_SOCKADDR_STORAGE,
-+AC_DEFUN([AC_LBL_SOCKADDR_STORAGE],
-     [AC_MSG_CHECKING(if sockaddr_storage struct exists)
-     AC_CACHE_VAL(ac_cv_lbl_has_sockaddr_storage,
- 	AC_TRY_COMPILE([
-@@ -593,7 +593,7 @@
- dnl won't be using code that would use that member, or we wouldn't
- dnl compile in any case).
- dnl
--AC_DEFUN(AC_LBL_HP_PPA_INFO_T_DL_MODULE_ID_1,
-+AC_DEFUN([AC_LBL_HP_PPA_INFO_T_DL_MODULE_ID_1],
-     [AC_MSG_CHECKING(if dl_hp_ppa_info_t struct has dl_module_id_1 member)
-     AC_CACHE_VAL(ac_cv_lbl_dl_hp_ppa_info_t_has_dl_module_id_1,
- 	AC_TRY_COMPILE([
-@@ -619,7 +619,7 @@
- dnl
- dnl	ac_cv_lbl_have_run_path (yes or no)
- dnl
--AC_DEFUN(AC_LBL_HAVE_RUN_PATH,
-+AC_DEFUN([AC_LBL_HAVE_RUN_PATH],
-     [AC_MSG_CHECKING(for ${CC-cc} -R)
-     AC_CACHE_VAL(ac_cv_lbl_have_run_path,
- 	[echo 'main(){}' > conftest.c
-@@ -644,7 +644,7 @@
- dnl
- dnl	LBL_ALIGN (DEFINED)
- dnl
--AC_DEFUN(AC_LBL_UNALIGNED_ACCESS,
-+AC_DEFUN([AC_LBL_UNALIGNED_ACCESS],
-     [AC_MSG_CHECKING(if unaligned accesses fail)
-     AC_CACHE_VAL(ac_cv_lbl_unaligned_fail,
- 	[case "$host_cpu" in
-@@ -749,7 +749,7 @@
- dnl	HAVE_OS_PROTO_H (defined)
- dnl	os-proto.h (symlinked)
- dnl
--AC_DEFUN(AC_LBL_DEVEL,
-+AC_DEFUN([AC_LBL_DEVEL],
-     [rm -f os-proto.h
-     if test "${LBL_CFLAGS+set}" = set; then
- 	    $1="$$1 ${LBL_CFLAGS}"
-@@ -886,7 +886,7 @@
- dnl statically and happen to have a libresolv.a lying around (and no
- dnl libnsl.a).
- dnl
--AC_DEFUN(AC_LBL_LIBRARY_NET, [
-+AC_DEFUN([AC_LBL_LIBRARY_NET], [
-     # Most operating systems have gethostbyname() in the default searched
-     # libraries (i.e. libc):
-     # Some OSes (eg. Solaris) place it in libnsl
-@@ -909,7 +909,7 @@
- dnl Test for __attribute__
- dnl
- 
--AC_DEFUN(AC_C___ATTRIBUTE__, [
-+AC_DEFUN([AC_C___ATTRIBUTE__], [
- AC_MSG_CHECKING(for __attribute__)
- AC_CACHE_VAL(ac_cv___attribute__, [
- AC_COMPILE_IFELSE(
-@@ -947,7 +947,7 @@
- dnl
- dnl -Scott Barron
- dnl
--AC_DEFUN(AC_LBL_TPACKET_STATS,
-+AC_DEFUN([AC_LBL_TPACKET_STATS],
-    [AC_MSG_CHECKING(if if_packet.h has tpacket_stats defined)
-    AC_CACHE_VAL(ac_cv_lbl_tpacket_stats,
-    AC_TRY_COMPILE([
-@@ -976,7 +976,7 @@
- dnl doesn't have that member (which is OK, as either we won't be using
- dnl code that would use that member, or we wouldn't compile in any case).
- dnl
--AC_DEFUN(AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI,
-+AC_DEFUN([AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI],
-     [AC_MSG_CHECKING(if tpacket_auxdata struct has tp_vlan_tci member)
-     AC_CACHE_VAL(ac_cv_lbl_dl_hp_ppa_info_t_has_dl_module_id_1,
- 	AC_TRY_COMPILE([
-@@ -1003,7 +1003,7 @@
- dnl 
- dnl 	HAVE_DLPI_PASSIVE (defined)
- dnl
--AC_DEFUN(AC_LBL_DL_PASSIVE_REQ_T,
-+AC_DEFUN([AC_LBL_DL_PASSIVE_REQ_T],
-         [AC_MSG_CHECKING(if dl_passive_req_t struct exists)
-        AC_CACHE_VAL(ac_cv_lbl_has_dl_passive_req_t,
-                 AC_TRY_COMPILE([
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
similarity index 67%
rename from meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
index 8d12b25..9072fe0 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
@@ -1,10 +1,11 @@
 require libpcap.inc
 
-SRC_URI += "file://aclocal.patch \
-            file://libpcap-pkgconfig-support.patch \
-           "
-SRC_URI[md5sum] = "b2e13142bbaba857ab1c6894aedaf547"
-SRC_URI[sha256sum] = "7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7f448b0"
+SRC_URI += " \
+    file://libpcap-pkgconfig-support.patch \
+"
+
+SRC_URI[md5sum] = "3d48f9cd171ff12b0efd9134b52f1447"
+SRC_URI[sha256sum] = "673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e48dcd9c6f0c83541e"
 
 #
 # make install doesn't cover the shared lib
@@ -13,7 +14,7 @@ SRC_URI[sha256sum] = "7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7
 
 do_configure_prepend () {
     #remove hardcoded references to /usr/include
-    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/configure.in
+    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/configure.ac
 }
 
 do_install_prepend () {
-- 
2.1.4


