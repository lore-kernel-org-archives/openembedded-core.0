Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 768D160767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 19:48:00 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so14487662wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 11:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R2dPb4cU9lf8WcF4RUZaVjr4SzJo7pXCLnJpl2QuYYo=;
	b=gxmXw6GMOxCsl3IJrf7WVHRkA/ercs5LvZILFDP11P5+8364LfvLh7GgrXF2T99MQz
	wWdJom1cBtwgwePARX5CmdAAh5Nc+llWO1ye5Ig0Ao8ybT0h1KqcrUbPBbaa+Tb/+Kaj
	DY6M0N5CRIZzbkMQx3n6xERLsD4bz4ohPKk6afwvEkfz+b95zxm9OHjoVUfM66N/Cxf3
	pW5vha5eulMh73KX3Y1J5KSVAXLigacGNXWqwbBftG1qpt79P3JIiRgAR7rqhclRTFLm
	g+o71dt8ACaby4MAtBvuGFefnWvCR+ullE1/LYdpQgQOzkuMf+nFstkCfF1qK48Hge39
	kfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R2dPb4cU9lf8WcF4RUZaVjr4SzJo7pXCLnJpl2QuYYo=;
	b=O2Q+7TvYg4rTkoKVeBdZgSHKTiLgBRNbrZ8x7IuRCl403yfOdLEBZh9RuHDNZt/clm
	eU8XHW6Ba+BEEidnp+v1kZVtxVC1tECldrDpledVOlK9qKk3Dq4IvPVDljT6b37+pnLo
	DWZBXHd4vrOykOVUueFAdQpPLcwY5Hfjg81c6fDHE7CFtPt001Atjva3TMnAVj+q/Kzl
	yxKjnV65QfDsFep70Jz2r7ScHh3nOS8eTPMHM/5b9IOnZyM67fn9N1JQCB7X3+fvBbyS
	w4kIha1TBPw2ldHQGYX9nIJ++uVv/bLsyvjs/Z8PhYBqn5EPFa+jyKgaI1pwim//Zr6x
	X4QQ==
X-Gm-Message-State: ABUngvdw6TJ9UPnHH5J5hVXJD3uen1jPe51smDFJ6aEmDjYd3ZcKDuniIpLstjWknTHDY3nBsbVmQvE48wQ+/w==
X-Received: by 10.25.17.27 with SMTP id g27mr1723667lfi.46.1479325681353; Wed,
	16 Nov 2016 11:48:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.40.6 with HTTP; Wed, 16 Nov 2016 11:47:30 -0800 (PST)
X-Originating-IP: [187.23.155.148]
In-Reply-To: <20161116194141.GC16451@jama>
References: <1478605968-18575-1-git-send-email-fabio.berton@ossystems.com.br>
	<20161116194141.GC16451@jama>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 16 Nov 2016 17:47:30 -0200
Message-ID: <CAAPZna2sip4qYv7PNYNzoVdGhbRUeVkDY3FkNCx8ncPONrOE2g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libpcap: Update to version 1.8.1
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
X-List-Received-Date: Wed, 16 Nov 2016 19:48:03 -0000
Content-Type: multipart/alternative; boundary=001a1140673cbeb4bb05417059f8

--001a1140673cbeb4bb05417059f8
Content-Type: text/plain; charset=UTF-8

Hi Martin,

I'll look into this.

Thanks.

On Wed, Nov 16, 2016 at 5:41 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Nov 08, 2016 at 09:52:48AM -0200, Fabio Berton wrote:
> >   - Option --enable-canusb was removed on commit:
> >     https://github.com/the-tcpdump-group/libpcap/commit/
> 93ca5ff7030aaf1219e1de05ec89a68384bfc50b
> >   - Autotools class was improved and we can now stop aclocal from
> running at all.
> >   - File configure.in was renamed to configure.ac, rework
> libpcap-pkgconfig-support
> >     patch and do_configure_prepend task to use configure.ac file.
> >
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  meta/recipes-connectivity/libpcap/libpcap.inc      |   5 +-
> >  .../libpcap/libpcap/aclocal.patch                  | 167
> ---------------------
> >  .../libpcap/libpcap-pkgconfig-support.patch        |  32 ++--
> >  .../libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} |  13 +-
> >  4 files changed, 25 insertions(+), 192 deletions(-)
> >  delete mode 100644 meta/recipes-connectivity/
> libpcap/libpcap/aclocal.patch
> >  rename meta/recipes-connectivity/libpcap/{libpcap_1.7.4.bb =>
> libpcap_1.8.1.bb} (67%)
> >
> > diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc
> b/meta/recipes-connectivity/libpcap/libpcap.inc
> > index 7b29a52..4453a9e 100644
> > --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> > +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> > @@ -19,6 +19,7 @@ BINCONFIG = "${bindir}/pcap-config"
> >  inherit autotools binconfig-disabled pkgconfig bluetooth
> >
> >  EXTRA_OECONF = "--with-pcap=linux"
> > +EXTRA_AUTORECONF += "--exclude=aclocal"
> >
> >  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES',
> 'bluetooth', '${BLUEZ}', '', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',
> 'ipv6', '', d)} \
> > @@ -26,7 +27,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES',
> 'bluetooth', '${BLUEZ
> >  PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
> >  # Add a dummy PACKAGECONFIG for bluez5 since it is not supported by
> libpcap.
> >  PACKAGECONFIG[bluez5] = ",,"
> > -PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
> >  PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
> >  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>
> This version fails to build without ipv6 in PACKAGECONFIG with this
> error:
>
> | i586-oe-linux-gcc  -m32 -march=i586 --sysroot=/OE/build/oe-core/tmp-glibc/sysroots/qemux86
> -I../libpcap-1.8.1 -fvisibility=hidden -fpic -I/OE/build/oe-core/tmp-glibc/
> work/i586-oe-linux/libpcap/1.8.1-r0/libpcap-1.8.1 -O2 -pipe -g
> -feliminate-unused-debug-types -fdebug-prefix-map=/OE/build/
> oe-core/tmp-glibc/work/i586-oe-linux/libpcap/1.8.1-r0=/usr/src/debug/libpcap/1.8.1-r0
> -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux=
> -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/sysroots/qemux86= -I.
> -DBUILDING_PCAP -DHAVE_CONFIG_H  -D_U_="__attribute__((unused))"
> -I/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/libpcap/1.8.1-r0/libpcap-1.8.1
> -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/OE/build/
> oe-core/tmp-glibc/work/i586-oe-linux/libpcap/1.8.1-r0=/usr/src/debug/libpcap/1.8.1-r0
> -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux=
> -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/sysroots/qemux86=    -c
> scanner.c
> | ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
> | ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t {aka struct
> _compiler_state}' has no member named 'ai'
> |   cstate.ai = NULL;
> |         ^
> | ../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
> | ../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared (first
> use in this function)
> |    bpf_error(cstate, "direction applied to 'gateway'");
> |              ^~~~~~
> | ../libpcap-1.8.1/gencode.c:4914:13: note: each undeclared identifier is
> reported only once for each function it appears in
> | config.status: creating pcap-config.tmp
> | make: *** [Makefile:478: gencode.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | mv pcap-config.tmp pcap-config
> | chmod a+x pcap-config
>
> Version 1.7.4 was building fine without it.
>
> >  PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
> > @@ -36,8 +36,5 @@ CFLAGS_prepend = "-I${S} "
> >  CXXFLAGS_prepend = "-I${S} "
> >
> >  do_configure_prepend () {
> > -    if [ ! -e ${S}/acinclude.m4 ]; then
> > -        cat ${S}/aclocal.m4 > ${S}/acinclude.m4
> > -    fi
> >      sed -i -e's,^V_RPATH_OPT=.*$,V_RPATH_OPT=,' ${S}/pcap-config.in
> >  }
> > diff --git a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
> b/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
> > deleted file mode 100644
> > index 2151982..0000000
> > --- a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
> > +++ /dev/null
> > @@ -1,167 +0,0 @@
> > -Upstream-Status: Inappropriate [configuration]
> > -
> > -diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
> > ---- libpcap-1.1.1-orig/aclocal.m4    2010-06-29 10:46:32.815117569 +0800
> > -+++ libpcap-1.1.1/aclocal.m4 2010-06-29 10:49:17.150149949 +0800
> > -@@ -37,7 +37,7 @@
> > - dnl AC_LBL_C_INIT.  Now, we run AC_LBL_C_INIT_BEFORE_CC, AC_PROG_CC,
> > - dnl and AC_LBL_C_INIT at the top level.
> > - dnl
> > --AC_DEFUN(AC_LBL_C_INIT_BEFORE_CC,
> > -+AC_DEFUN([AC_LBL_C_INIT_BEFORE_CC],
> > - [
> > -     AC_BEFORE([$0], [AC_LBL_C_INIT])
> > -     AC_BEFORE([$0], [AC_PROG_CC])
> > -@@ -90,7 +90,7 @@
> > - dnl     LDFLAGS
> > - dnl     LBL_CFLAGS
> > - dnl
> > --AC_DEFUN(AC_LBL_C_INIT,
> > -+AC_DEFUN([AC_LBL_C_INIT],
> > - [
> > -     AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])
> > -     AC_BEFORE([$0], [AC_LBL_DEVEL])
> > -@@ -217,7 +217,7 @@
> > - dnl V_SONAME_OPT
> > - dnl V_RPATH_OPT
> > - dnl
> > --AC_DEFUN(AC_LBL_SHLIBS_INIT,
> > -+AC_DEFUN([AC_LBL_SHLIBS_INIT],
> > -     [AC_PREREQ(2.50)
> > -     if test "$GCC" = yes ; then
> > -         #
> > -@@ -361,7 +361,7 @@
> > - # Make sure we use the V_CCOPT flags, because some of those might
> > - # disable inlining.
> > - #
> > --AC_DEFUN(AC_LBL_C_INLINE,
> > -+AC_DEFUN([AC_LBL_C_INLINE],
> > -     [AC_MSG_CHECKING(for inline)
> > -     save_CFLAGS="$CFLAGS"
> > -     CFLAGS="$V_CCOPT"
> > -@@ -407,7 +407,7 @@
> > - dnl
> > - dnl AC_LBL_FIXINCLUDES
> > - dnl
> > --AC_DEFUN(AC_LBL_FIXINCLUDES,
> > -+AC_DEFUN([AC_LBL_FIXINCLUDES],
> > -     [if test "$GCC" = yes ; then
> > -         AC_MSG_CHECKING(for ANSI ioctl definitions)
> > -         AC_CACHE_VAL(ac_cv_lbl_gcc_fixincludes,
> > -@@ -453,7 +453,7 @@
> > - dnl $2 (yacc appended)
> > - dnl $3 (optional flex and bison -P prefix)
> > - dnl
> > --AC_DEFUN(AC_LBL_LEX_AND_YACC,
> > -+AC_DEFUN([AC_LBL_LEX_AND_YACC],
> > -     [AC_ARG_WITH(flex, [  --without-flex          don't use flex])
> > -     AC_ARG_WITH(bison, [  --without-bison         don't use bison])
> > -     if test "$with_flex" = no ; then
> > -@@ -506,7 +506,7 @@
> > - dnl
> > - dnl DECLWAITSTATUS (defined)
> > - dnl
> > --AC_DEFUN(AC_LBL_UNION_WAIT,
> > -+AC_DEFUN([AC_LBL_UNION_WAIT],
> > -     [AC_MSG_CHECKING(if union wait is used)
> > -     AC_CACHE_VAL(ac_cv_lbl_union_wait,
> > -     AC_TRY_COMPILE([
> > -@@ -535,7 +535,7 @@
> > - dnl
> > - dnl HAVE_SOCKADDR_SA_LEN (defined)
> > - dnl
> > --AC_DEFUN(AC_LBL_SOCKADDR_SA_LEN,
> > -+AC_DEFUN([AC_LBL_SOCKADDR_SA_LEN],
> > -     [AC_MSG_CHECKING(if sockaddr struct has the sa_len member)
> > -     AC_CACHE_VAL(ac_cv_lbl_sockaddr_has_sa_len,
> > -     AC_TRY_COMPILE([
> > -@@ -560,7 +560,7 @@
> > - dnl
> > - dnl HAVE_SOCKADDR_STORAGE (defined)
> > - dnl
> > --AC_DEFUN(AC_LBL_SOCKADDR_STORAGE,
> > -+AC_DEFUN([AC_LBL_SOCKADDR_STORAGE],
> > -     [AC_MSG_CHECKING(if sockaddr_storage struct exists)
> > -     AC_CACHE_VAL(ac_cv_lbl_has_sockaddr_storage,
> > -     AC_TRY_COMPILE([
> > -@@ -593,7 +593,7 @@
> > - dnl won't be using code that would use that member, or we wouldn't
> > - dnl compile in any case).
> > - dnl
> > --AC_DEFUN(AC_LBL_HP_PPA_INFO_T_DL_MODULE_ID_1,
> > -+AC_DEFUN([AC_LBL_HP_PPA_INFO_T_DL_MODULE_ID_1],
> > -     [AC_MSG_CHECKING(if dl_hp_ppa_info_t struct has dl_module_id_1
> member)
> > -     AC_CACHE_VAL(ac_cv_lbl_dl_hp_ppa_info_t_has_dl_module_id_1,
> > -     AC_TRY_COMPILE([
> > -@@ -619,7 +619,7 @@
> > - dnl
> > - dnl ac_cv_lbl_have_run_path (yes or no)
> > - dnl
> > --AC_DEFUN(AC_LBL_HAVE_RUN_PATH,
> > -+AC_DEFUN([AC_LBL_HAVE_RUN_PATH],
> > -     [AC_MSG_CHECKING(for ${CC-cc} -R)
> > -     AC_CACHE_VAL(ac_cv_lbl_have_run_path,
> > -     [echo 'main(){}' > conftest.c
> > -@@ -644,7 +644,7 @@
> > - dnl
> > - dnl LBL_ALIGN (DEFINED)
> > - dnl
> > --AC_DEFUN(AC_LBL_UNALIGNED_ACCESS,
> > -+AC_DEFUN([AC_LBL_UNALIGNED_ACCESS],
> > -     [AC_MSG_CHECKING(if unaligned accesses fail)
> > -     AC_CACHE_VAL(ac_cv_lbl_unaligned_fail,
> > -     [case "$host_cpu" in
> > -@@ -749,7 +749,7 @@
> > - dnl HAVE_OS_PROTO_H (defined)
> > - dnl os-proto.h (symlinked)
> > - dnl
> > --AC_DEFUN(AC_LBL_DEVEL,
> > -+AC_DEFUN([AC_LBL_DEVEL],
> > -     [rm -f os-proto.h
> > -     if test "${LBL_CFLAGS+set}" = set; then
> > -         $1="$$1 ${LBL_CFLAGS}"
> > -@@ -886,7 +886,7 @@
> > - dnl statically and happen to have a libresolv.a lying around (and no
> > - dnl libnsl.a).
> > - dnl
> > --AC_DEFUN(AC_LBL_LIBRARY_NET, [
> > -+AC_DEFUN([AC_LBL_LIBRARY_NET], [
> > -     # Most operating systems have gethostbyname() in the default
> searched
> > -     # libraries (i.e. libc):
> > -     # Some OSes (eg. Solaris) place it in libnsl
> > -@@ -909,7 +909,7 @@
> > - dnl Test for __attribute__
> > - dnl
> > -
> > --AC_DEFUN(AC_C___ATTRIBUTE__, [
> > -+AC_DEFUN([AC_C___ATTRIBUTE__], [
> > - AC_MSG_CHECKING(for __attribute__)
> > - AC_CACHE_VAL(ac_cv___attribute__, [
> > - AC_COMPILE_IFELSE(
> > -@@ -947,7 +947,7 @@
> > - dnl
> > - dnl -Scott Barron
> > - dnl
> > --AC_DEFUN(AC_LBL_TPACKET_STATS,
> > -+AC_DEFUN([AC_LBL_TPACKET_STATS],
> > -    [AC_MSG_CHECKING(if if_packet.h has tpacket_stats defined)
> > -    AC_CACHE_VAL(ac_cv_lbl_tpacket_stats,
> > -    AC_TRY_COMPILE([
> > -@@ -976,7 +976,7 @@
> > - dnl doesn't have that member (which is OK, as either we won't be using
> > - dnl code that would use that member, or we wouldn't compile in any
> case).
> > - dnl
> > --AC_DEFUN(AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI,
> > -+AC_DEFUN([AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI],
> > -     [AC_MSG_CHECKING(if tpacket_auxdata struct has tp_vlan_tci member)
> > -     AC_CACHE_VAL(ac_cv_lbl_dl_hp_ppa_info_t_has_dl_module_id_1,
> > -     AC_TRY_COMPILE([
> > -@@ -1003,7 +1003,7 @@
> > - dnl
> > - dnl         HAVE_DLPI_PASSIVE (defined)
> > - dnl
> > --AC_DEFUN(AC_LBL_DL_PASSIVE_REQ_T,
> > -+AC_DEFUN([AC_LBL_DL_PASSIVE_REQ_T],
> > -         [AC_MSG_CHECKING(if dl_passive_req_t struct exists)
> > -        AC_CACHE_VAL(ac_cv_lbl_has_dl_passive_req_t,
> > -                 AC_TRY_COMPILE([
> > diff --git a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
> b/meta/recipes-connectivity/libpcap/libpcap/libpcap-
> pkgconfig-support.patch
> > index b861513..afaa3be 100644
> > --- a/meta/recipes-connectivity/libpcap/libpcap/libpcap-
> pkgconfig-support.patch
> > +++ b/meta/recipes-connectivity/libpcap/libpcap/libpcap-
> pkgconfig-support.patch
> > @@ -1,25 +1,27 @@
> > -From 8887132e85892a72a84ca3878e60f254ad2ce939 Mon Sep 17 00:00:00 2001
> > -From: Joe MacDonald <joe_macdonald@mentor.com>
> > -Date: Tue, 24 Feb 2015 15:56:06 -0500
> > +From 2796129af52901dd68595e5e88a639308541def9 Mon Sep 17 00:00:00 2001
> > +From: Fabio Berton <fabio.berton@ossystems.com.br>
> > +Date: Thu, 3 Nov 2016 17:56:29 -0200
> >  Subject: [PATCH] libpcap: pkgconfig support
> > +Organization: O.S. Systems Software LTDA.
> >
> >  Adding basic structure to support pkg-config.
> >
> >  Upstream-Status: Inappropriate [embedded specific]
> >
> >  Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >  ---
> >   Makefile.in   |  5 +++++
> > - configure.in  |  1 +
> > + configure.ac  |  1 +
> >   libpcap.pc.in | 10 ++++++++++
> >   3 files changed, 16 insertions(+)
> >   create mode 100644 libpcap.pc.in
> >
> >  diff --git a/Makefile.in b/Makefile.in
> > -index 1c2d745..1f25faf 100644
> > +index e71d973..d7004ed 100644
> >  --- a/Makefile.in
> >  +++ b/Makefile.in
> > -@@ -60,6 +60,10 @@ V_RPATH_OPT = @V_RPATH_OPT@
> > +@@ -61,6 +61,10 @@ V_RPATH_OPT = @V_RPATH_OPT@
> >   DEPENDENCY_CFLAG = @DEPENDENCY_CFLAG@
> >   PROG=libpcap
> >
> > @@ -30,19 +32,19 @@ index 1c2d745..1f25faf 100644
> >   # Standard CFLAGS
> >   FULL_CFLAGS = $(CCOPT) $(INCLS) $(DEFS) $(CFLAGS)
> >
> > -@@ -275,6 +279,7 @@ EXTRA_DIST = \
> > +@@ -286,6 +290,7 @@ EXTRA_DIST = \
> >       lbl/os-solaris2.h \
> >       lbl/os-sunos4.h \
> >       lbl/os-ultrix4.h \
> >  +    libpcap.pc \
> > +     missing/getopt.c \
> > +     missing/getopt.h \
> >       missing/snprintf.c \
> > -     mkdep \
> > -     msdos/bin2c.c \
> > -diff --git a/configure.in b/configure.in
> > -index 8f5c86b..fb51b35 100644
> > ---- a/configure.in
> > -+++ b/configure.in
> > -@@ -1700,6 +1700,7 @@ esac
> > +diff --git a/configure.ac b/configure.ac
> > +index da2f940..4fc67bf 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -1805,6 +1805,7 @@ fi
> >   AC_PROG_INSTALL
> >
> >   AC_CONFIG_HEADER(config.h)
> > @@ -67,5 +69,5 @@ index 0000000..4f78ad8
> >  +Libs: -L${libdir} -lpcap
> >  +Cflags: -I${includedir}
> >  --
> > -1.9.1
> > +2.1.4
> >
> > diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
> b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
> > similarity index 67%
> > rename from meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
> > rename to meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
> > index 8d12b25..9072fe0 100644
> > --- a/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
> > +++ b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
> > @@ -1,10 +1,11 @@
> >  require libpcap.inc
> >
> > -SRC_URI += "file://aclocal.patch \
> > -            file://libpcap-pkgconfig-support.patch \
> > -           "
> > -SRC_URI[md5sum] = "b2e13142bbaba857ab1c6894aedaf547"
> > -SRC_URI[sha256sum] = "7ad3112187e88328b85e46dce7a9b9
> 49632af18ee74d97ffc3f2b41fe7f448b0"
> > +SRC_URI += " \
> > +    file://libpcap-pkgconfig-support.patch \
> > +"
> > +
> > +SRC_URI[md5sum] = "3d48f9cd171ff12b0efd9134b52f1447"
> > +SRC_URI[sha256sum] = "673dbc69fdc3f5a86fb5759ab19899
> 039a8e5e6c631749e48dcd9c6f0c83541e"
> >
> >  #
> >  # make install doesn't cover the shared lib
> > @@ -13,7 +14,7 @@ SRC_URI[sha256sum] = "7ad3112187e88328b85e46dce7a9b9
> 49632af18ee74d97ffc3f2b41fe7
> >
> >  do_configure_prepend () {
> >      #remove hardcoded references to /usr/include
> > -    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i
> ${S}/configure.in
> > +    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i
> ${S}/configure.ac
> >  }
> >
> >  do_install_prepend () {
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a1140673cbeb4bb05417059f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Martin,<br><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:monospace,monospace;font-size:small">I&#39;ll l=
ook into this.<br><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace;font-size:small">Thanks.<br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Nov 16, 2016 at 5:4=
1 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gma=
il.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Tu=
e, Nov 08, 2016 at 09:52:48AM -0200, Fabio Berton wrote:<br>
&gt;=C2=A0 =C2=A0- Option --enable-canusb was removed on commit:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/the-tcpdump-group/lib=
pcap/commit/93ca5ff7030aaf1219e1de05ec89a68384bfc50b" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/the-<wbr>tcpdump-group/libpcap/commit/<w=
br>93ca5ff7030aaf1219e1de05ec89a6<wbr>8384bfc50b</a><br>
&gt;=C2=A0 =C2=A0- Autotools class was improved and we can now stop aclocal=
 from running at all.<br>
&gt;=C2=A0 =C2=A0- File <a href=3D"http://configure.in" rel=3D"noreferrer" =
target=3D"_blank">configure.in</a> was renamed to <a href=3D"http://configu=
re.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>, rework libpca=
p-pkgconfig-support<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch and do_configure_prepend task to use <a href=
=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac<=
/a> file.<br>
&gt;<br>
&gt; Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyste=
ms.com.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/<wbr>libpcap/libpcap.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 .../libpcap/libpcap/aclocal.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 167 ---------------------<br>
&gt;=C2=A0 .../libpcap/libpcap-pkgconfig-<wbr>support.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 32 ++--<br>
&gt;=C2=A0 .../libpcap/{<a href=3D"http://libpcap_1.7.4.bb" rel=3D"noreferr=
er" target=3D"_blank">libpcap_1.7.4.bb</a> =3D&gt; <a href=3D"http://libpca=
p_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.8.1.bb</a>} |=C2=
=A0 13 +-<br>
&gt;=C2=A0 4 files changed, 25 insertions(+), 192 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/<wbr>libpcap/libpca=
p/aclocal.patch<br>
&gt;=C2=A0 rename meta/recipes-connectivity/<wbr>libpcap/{<a href=3D"http:/=
/libpcap_1.7.4.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.7.4.bb</a=
> =3D&gt; <a href=3D"http://libpcap_1.8.1.bb" rel=3D"noreferrer" target=3D"=
_blank">libpcap_1.8.1.bb</a>} (67%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/<wbr>libpcap/libpcap.inc b/meta=
/recipes-connectivity/<wbr>libpcap/libpcap.inc<br>
&gt; index 7b29a52..4453a9e 100644<br>
&gt; --- a/meta/recipes-connectivity/<wbr>libpcap/libpcap.inc<br>
&gt; +++ b/meta/recipes-connectivity/<wbr>libpcap/libpcap.inc<br>
&gt; @@ -19,6 +19,7 @@ BINCONFIG =3D &quot;${bindir}/pcap-config&quot;<br>
&gt;=C2=A0 inherit autotools binconfig-disabled pkgconfig bluetooth<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--with-pcap=3Dlinux&quot;<br>
&gt; +EXTRA_AUTORECONF +=3D &quot;--exclude=3Daclocal&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>=
FEATURES&#39;, &#39;bluetooth&#39;, &#39;${BLUEZ}&#39;, &#39;&#39;, d)} \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;ipv6&#39;, =
&#39;ipv6&#39;, &#39;&#39;, d)} \<br>
&gt; @@ -26,7 +27,6 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;=
DISTRO_<wbr>FEATURES&#39;, &#39;bluetooth&#39;, &#39;${BLUEZ<br>
&gt;=C2=A0 PACKAGECONFIG[bluez4] =3D &quot;--enable-bluetooth,--disable-<wb=
r>bluetooth,bluez4&quot;<br>
&gt;=C2=A0 # Add a dummy PACKAGECONFIG for bluez5 since it is not supported=
 by libpcap.<br>
&gt;=C2=A0 PACKAGECONFIG[bluez5] =3D &quot;,,&quot;<br>
&gt; -PACKAGECONFIG[canusb] =3D &quot;--enable-canusb,--enable-<wbr>canusb=
=3Dno,libusb&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[dbus] =3D &quot;--enable-dbus,--disable-dbus,<wbr>=
dbus&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6,<wbr>=
&quot;<br>
<br>
</div></div>This version fails to build without ipv6 in PACKAGECONFIG with =
this<br>
error:<br>
<br>
| i586-oe-linux-gcc=C2=A0 -m32 -march=3Di586 --sysroot=3D/OE/build/oe-core/=
<wbr>tmp-glibc/sysroots/qemux86 -I../libpcap-1.8.1 -fvisibility=3Dhidden -f=
pic -I/OE/build/oe-core/tmp-glibc/<wbr>work/i586-oe-linux/libpcap/1.<wbr>8.=
1-r0/libpcap-1.8.1 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-pref=
ix-map=3D/OE/build/<wbr>oe-core/tmp-glibc/work/i586-<wbr>oe-linux/libpcap/1=
.8.1-r0=3D/<wbr>usr/src/debug/libpcap/1.8.1-r0 -fdebug-prefix-map=3D/OE/bui=
ld/<wbr>oe-core/tmp-glibc/sysroots/<wbr>x86_64-linux=3D -fdebug-prefix-map=
=3D/OE/build/<wbr>oe-core/tmp-glibc/sysroots/<wbr>qemux86=3D -I.=C2=A0 -DBU=
ILDING_PCAP -DHAVE_CONFIG_H=C2=A0 -D_U_=3D&quot;__attribute__((unused))<wbr=
>&quot; -I/OE/build/oe-core/tmp-glibc/<wbr>work/i586-oe-linux/libpcap/1.<wb=
r>8.1-r0/libpcap-1.8.1 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-=
prefix-map=3D/OE/build/<wbr>oe-core/tmp-glibc/work/i586-<wbr>oe-linux/libpc=
ap/1.8.1-r0=3D/<wbr>usr/src/debug/libpcap/1.8.1-r0 -fdebug-prefix-map=3D/OE=
/build/<wbr>oe-core/tmp-glibc/sysroots/<wbr>x86_64-linux=3D -fdebug-prefix-=
map=3D/OE/build/<wbr>oe-core/tmp-glibc/sysroots/<wbr>qemux86=3D=C2=A0 =C2=
=A0 -c scanner.c<br>
| ../libpcap-1.8.1/gencode.c: In function &#39;pcap_compile&#39;:<br>
| ../libpcap-1.8.1/gencode.c:<wbr>693:8: error: &#39;compiler_state_t {aka =
struct _compiler_state}&#39; has no member named &#39;ai&#39;<br>
|=C2=A0 =C2=A0<a href=3D"http://cstate.ai" rel=3D"noreferrer" target=3D"_bl=
ank">cstate.ai</a> =3D NULL;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
| ../libpcap-1.8.1/gencode.c: In function &#39;gen_gateway&#39;:<br>
| ../libpcap-1.8.1/gencode.c:<wbr>4914:13: error: &#39;cstate&#39; undeclar=
ed (first use in this function)<br>
|=C2=A0 =C2=A0 bpf_error(cstate, &quot;direction applied to &#39;gateway&#3=
9;&quot;);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
| ../libpcap-1.8.1/gencode.c:<wbr>4914:13: note: each undeclared identifier=
 is reported only once for each function it appears in<br>
| config.status: creating pcap-config.tmp<br>
| make: *** [Makefile:478: gencode.o] Error 1<br>
| make: *** Waiting for unfinished jobs....<br>
| mv pcap-config.tmp pcap-config<br>
| chmod a+x pcap-config<br>
<br>
Version 1.7.4 was building fine without it.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 PACKAGECONFIG[libnl] =3D &quot;--with-libnl,--without-libnl,<wbr=
>libnl&quot;<br>
&gt; @@ -36,8 +36,5 @@ CFLAGS_prepend =3D &quot;-I${S} &quot;<br>
&gt;=C2=A0 CXXFLAGS_prepend =3D &quot;-I${S} &quot;<br>
&gt;<br>
&gt;=C2=A0 do_configure_prepend () {<br>
&gt; -=C2=A0 =C2=A0 if [ ! -e ${S}/acinclude.m4 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat ${S}/aclocal.m4 &gt; ${S}/acinclude.m=
4<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i -e&#39;s,^V_RPATH_OPT=3D.*$,V_RPATH_<wbr>OP=
T=3D,&#39; ${S}/<a href=3D"http://pcap-config.in" rel=3D"noreferrer" target=
=3D"_blank">pcap-config.in</a><br>
&gt;=C2=A0 }<br>
&gt; diff --git a/meta/recipes-connectivity/<wbr>libpcap/libpcap/aclocal.pa=
tch b/meta/recipes-connectivity/<wbr>libpcap/libpcap/aclocal.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 2151982..0000000<br>
&gt; --- a/meta/recipes-connectivity/<wbr>libpcap/libpcap/aclocal.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,167 +0,0 @@<br>
&gt; -Upstream-Status: Inappropriate [configuration]<br>
&gt; -<br>
&gt; -diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4<br>
&gt; ---- libpcap-1.1.1-orig/aclocal.m4=C2=A0 =C2=A0 2010-06-29 10:46:32.81=
5117569 +0800<br>
&gt; -+++ libpcap-1.1.1/aclocal.m4 2010-06-29 10:49:17.150149949 +0800<br>
&gt; -@@ -37,7 +37,7 @@<br>
&gt; - dnl AC_LBL_C_INIT.=C2=A0 Now, we run AC_LBL_C_INIT_BEFORE_CC, AC_PRO=
G_CC,<br>
&gt; - dnl and AC_LBL_C_INIT at the top level.<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_C_INIT_<wbr>BEFORE_CC,<br>
&gt; -+AC_DEFUN([AC_LBL_C_INIT_<wbr>BEFORE_CC],<br>
&gt; - [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_BEFORE([$0], [AC_LBL_C_INIT])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_BEFORE([$0], [AC_PROG_CC])<br>
&gt; -@@ -90,7 +90,7 @@<br>
&gt; - dnl=C2=A0 =C2=A0 =C2=A0LDFLAGS<br>
&gt; - dnl=C2=A0 =C2=A0 =C2=A0LBL_CFLAGS<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_C_INIT,<br>
&gt; -+AC_DEFUN([AC_LBL_C_INIT],<br>
&gt; - [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_BEFORE([$0], [AC_LBL_DEVEL])<br>
&gt; -@@ -217,7 +217,7 @@<br>
&gt; - dnl V_SONAME_OPT<br>
&gt; - dnl V_RPATH_OPT<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_SHLIBS_INIT,<br>
&gt; -+AC_DEFUN([AC_LBL_SHLIBS_<wbr>INIT],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_PREREQ(2.50)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if test &quot;$GCC&quot; =3D yes ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt; -@@ -361,7 +361,7 @@<br>
&gt; - # Make sure we use the V_CCOPT flags, because some of those might<br=
>
&gt; - # disable inlining.<br>
&gt; - #<br>
&gt; --AC_DEFUN(AC_LBL_C_INLINE,<br>
&gt; -+AC_DEFUN([AC_LBL_C_INLINE],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(for inline)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0save_CFLAGS=3D&quot;$CFLAGS&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$V_CCOPT&quot;<br>
&gt; -@@ -407,7 +407,7 @@<br>
&gt; - dnl<br>
&gt; - dnl AC_LBL_FIXINCLUDES<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_FIXINCLUDES,<br>
&gt; -+AC_DEFUN([AC_LBL_<wbr>FIXINCLUDES],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[if test &quot;$GCC&quot; =3D yes ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_CHECKING(for ANSI ioctl defi=
nitions)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CACHE_VAL(ac_cv_lbl_gcc_<wbr>fix=
includes,<br>
&gt; -@@ -453,7 +453,7 @@<br>
&gt; - dnl $2 (yacc appended)<br>
&gt; - dnl $3 (optional flex and bison -P prefix)<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_LEX_AND_<wbr>YACC,<br>
&gt; -+AC_DEFUN([AC_LBL_LEX_AND_<wbr>YACC],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_ARG_WITH(flex, [=C2=A0 --without-flex=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 don&#39;t use flex])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_ARG_WITH(bison, [=C2=A0 --without-bison=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t use bison])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if test &quot;$with_flex&quot; =3D no ; then<br>
&gt; -@@ -506,7 +506,7 @@<br>
&gt; - dnl<br>
&gt; - dnl DECLWAITSTATUS (defined)<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_UNION_WAIT,<br>
&gt; -+AC_DEFUN([AC_LBL_UNION_WAIT]<wbr>,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(if union wait is used)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_CACHE_VAL(ac_cv_lbl_union_<wbr>wait,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_TRY_COMPILE([<br>
&gt; -@@ -535,7 +535,7 @@<br>
&gt; - dnl<br>
&gt; - dnl HAVE_SOCKADDR_SA_LEN (defined)<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_SOCKADDR_SA_<wbr>LEN,<br>
&gt; -+AC_DEFUN([AC_LBL_SOCKADDR_<wbr>SA_LEN],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(if sockaddr struct has the sa_le=
n member)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_CACHE_VAL(ac_cv_lbl_<wbr>sockaddr_has_sa_len,<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_TRY_COMPILE([<br>
&gt; -@@ -560,7 +560,7 @@<br>
&gt; - dnl<br>
&gt; - dnl HAVE_SOCKADDR_STORAGE (defined)<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_SOCKADDR_<wbr>STORAGE,<br>
&gt; -+AC_DEFUN([AC_LBL_SOCKADDR_<wbr>STORAGE],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(if sockaddr_storage struct exist=
s)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_CACHE_VAL(ac_cv_lbl_has_<wbr>sockaddr_storage,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_TRY_COMPILE([<br>
&gt; -@@ -593,7 +593,7 @@<br>
&gt; - dnl won&#39;t be using code that would use that member, or we wouldn=
&#39;t<br>
&gt; - dnl compile in any case).<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_HP_PPA_INFO_<wbr>T_DL_MODULE_ID_1,<br>
&gt; -+AC_DEFUN([AC_LBL_HP_PPA_<wbr>INFO_T_DL_MODULE_ID_1],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(if dl_hp_ppa_info_t struct has d=
l_module_id_1 member)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_CACHE_VAL(ac_cv_lbl_dl_hp_<wbr>ppa_info_t_has_=
dl_module_id_1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_TRY_COMPILE([<br>
&gt; -@@ -619,7 +619,7 @@<br>
&gt; - dnl<br>
&gt; - dnl ac_cv_lbl_have_run_path (yes or no)<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_HAVE_RUN_<wbr>PATH,<br>
&gt; -+AC_DEFUN([AC_LBL_HAVE_RUN_<wbr>PATH],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(for ${CC-cc} -R)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_CACHE_VAL(ac_cv_lbl_have_<wbr>run_path,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[echo &#39;main(){}&#39; &gt; conftest.c<br>
&gt; -@@ -644,7 +644,7 @@<br>
&gt; - dnl<br>
&gt; - dnl LBL_ALIGN (DEFINED)<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_UNALIGNED_<wbr>ACCESS,<br>
&gt; -+AC_DEFUN([AC_LBL_UNALIGNED_<wbr>ACCESS],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(if unaligned accesses fail)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_CACHE_VAL(ac_cv_lbl_<wbr>unaligned_fail,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[case &quot;$host_cpu&quot; in<br>
&gt; -@@ -749,7 +749,7 @@<br>
&gt; - dnl HAVE_OS_PROTO_H (defined)<br>
&gt; - dnl os-proto.h (symlinked)<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_DEVEL,<br>
&gt; -+AC_DEFUN([AC_LBL_DEVEL],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[rm -f os-proto.h<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if test &quot;${LBL_CFLAGS+set}&quot; =3D set; th=
en<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$1=3D&quot;$$1 ${LBL_CFLAGS}&quot;<=
br>
&gt; -@@ -886,7 +886,7 @@<br>
&gt; - dnl statically and happen to have a libresolv.a lying around (and no=
<br>
&gt; - dnl libnsl.a).<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_LIBRARY_NET, [<br>
&gt; -+AC_DEFUN([AC_LBL_LIBRARY_<wbr>NET], [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Most operating systems have gethostbyname() in =
the default searched<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# libraries (i.e. libc):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Some OSes (eg. Solaris) place it in libnsl<br>
&gt; -@@ -909,7 +909,7 @@<br>
&gt; - dnl Test for __attribute__<br>
&gt; - dnl<br>
&gt; -<br>
&gt; --AC_DEFUN(AC_C___ATTRIBUTE__, [<br>
&gt; -+AC_DEFUN([AC_C___ATTRIBUTE__<wbr>], [<br>
&gt; - AC_MSG_CHECKING(for __attribute__)<br>
&gt; - AC_CACHE_VAL(ac_cv___<wbr>attribute__, [<br>
&gt; - AC_COMPILE_IFELSE(<br>
&gt; -@@ -947,7 +947,7 @@<br>
&gt; - dnl<br>
&gt; - dnl -Scott Barron<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_TPACKET_<wbr>STATS,<br>
&gt; -+AC_DEFUN([AC_LBL_TPACKET_<wbr>STATS],<br>
&gt; -=C2=A0 =C2=A0 [AC_MSG_CHECKING(if if_packet.h has tpacket_stats defin=
ed)<br>
&gt; -=C2=A0 =C2=A0 AC_CACHE_VAL(ac_cv_lbl_<wbr>tpacket_stats,<br>
&gt; -=C2=A0 =C2=A0 AC_TRY_COMPILE([<br>
&gt; -@@ -976,7 +976,7 @@<br>
&gt; - dnl doesn&#39;t have that member (which is OK, as either we won&#39;=
t be using<br>
&gt; - dnl code that would use that member, or we wouldn&#39;t compile in a=
ny case).<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_LINUX_<wbr>TPACKET_AUXDATA_TP_VLAN_TCI,<br>
&gt; -+AC_DEFUN([AC_LBL_LINUX_<wbr>TPACKET_AUXDATA_TP_VLAN_TCI],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(if tpacket_auxdata struct has tp=
_vlan_tci member)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_CACHE_VAL(ac_cv_lbl_dl_hp_<wbr>ppa_info_t_has_=
dl_module_id_1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_TRY_COMPILE([<br>
&gt; -@@ -1003,7 +1003,7 @@<br>
&gt; - dnl<br>
&gt; - dnl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_DLPI_PASSIVE (defined)<br>
&gt; - dnl<br>
&gt; --AC_DEFUN(AC_LBL_DL_PASSIVE_<wbr>REQ_T,<br>
&gt; -+AC_DEFUN([AC_LBL_DL_PASSIVE_<wbr>REQ_T],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_MSG_CHECKING(if dl_passive_req_=
t struct exists)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CACHE_VAL(ac_cv_lbl_has_dl_<wbr>passiv=
e_req_t,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_TRY_=
COMPILE([<br>
&gt; diff --git a/meta/recipes-connectivity/<wbr>libpcap/libpcap/libpcap-<w=
br>pkgconfig-support.patch b/meta/recipes-connectivity/<wbr>libpcap/libpcap=
/libpcap-<wbr>pkgconfig-support.patch<br>
&gt; index b861513..afaa3be 100644<br>
&gt; --- a/meta/recipes-connectivity/<wbr>libpcap/libpcap/libpcap-<wbr>pkgc=
onfig-support.patch<br>
&gt; +++ b/meta/recipes-connectivity/<wbr>libpcap/libpcap/libpcap-<wbr>pkgc=
onfig-support.patch<br>
&gt; @@ -1,25 +1,27 @@<br>
&gt; -From 8887132e85892a72a84ca3878e60f2<wbr>54ad2ce939 Mon Sep 17 00:00:0=
0 2001<br>
&gt; -From: Joe MacDonald &lt;<a href=3D"mailto:joe_macdonald@mentor.com">j=
oe_macdonald@mentor.com</a>&gt;<br>
&gt; -Date: Tue, 24 Feb 2015 15:56:06 -0500<br>
&gt; +From 2796129af52901dd68595e5e88a639<wbr>308541def9 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.b=
r">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
&gt; +Date: Thu, 3 Nov 2016 17:56:29 -0200<br>
&gt;=C2=A0 Subject: [PATCH] libpcap: pkgconfig support<br>
&gt; +Organization: O.S. Systems Software LTDA.<br>
&gt;<br>
&gt;=C2=A0 Adding basic structure to support pkg-config.<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [embedded specific]<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Joe MacDonald &lt;<a href=3D"mailto:joe_macdonald=
@mentor.com">joe_macdonald@mentor.com</a>&gt;<br>
&gt; +Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyst=
ems.com.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0Makefile.in=C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt; - <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a>=C2=A0 |=C2=A0 1 +<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://libpcap.pc.in" rel=3D"noreferrer" target=
=3D"_blank">libpcap.pc.in</a> | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 16 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 <a href=3D"http://libpcap.pc.in" rel=3D=
"noreferrer" target=3D"_blank">libpcap.pc.in</a><br>
&gt;<br>
&gt;=C2=A0 diff --git a/Makefile.in b/Makefile.in<br>
&gt; -index 1c2d745..1f25faf 100644<br>
&gt; +index e71d973..d7004ed 100644<br>
&gt;=C2=A0 --- a/Makefile.in<br>
&gt;=C2=A0 +++ b/Makefile.in<br>
&gt; -@@ -60,6 +60,10 @@ V_RPATH_OPT =3D @V_RPATH_OPT@<br>
&gt; +@@ -61,6 +61,10 @@ V_RPATH_OPT =3D @V_RPATH_OPT@<br>
&gt;=C2=A0 =C2=A0DEPENDENCY_CFLAG =3D @DEPENDENCY_CFLAG@<br>
&gt;=C2=A0 =C2=A0PROG=3Dlibpcap<br>
&gt;<br>
&gt; @@ -30,19 +32,19 @@ index 1c2d745..1f25faf 100644<br>
&gt;=C2=A0 =C2=A0# Standard CFLAGS<br>
&gt;=C2=A0 =C2=A0FULL_CFLAGS =3D $(CCOPT) $(INCLS) $(DEFS) $(CFLAGS)<br>
&gt;<br>
&gt; -@@ -275,6 +279,7 @@ EXTRA_DIST =3D \<br>
&gt; +@@ -286,6 +290,7 @@ EXTRA_DIST =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lbl/os-solaris2.h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lbl/os-sunos4.h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lbl/os-ultrix4.h \<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 libpcap.pc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0missing/getopt.c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0missing/getopt.h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0missing/snprintf.c \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkdep \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0msdos/bin2c.c \<br>
&gt; -diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
&gt; -index 8f5c86b..fb51b35 100644<br>
&gt; ---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
&gt; -+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
&gt; -@@ -1700,6 +1700,7 @@ esac<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index da2f940..4fc67bf 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -1805,6 +1805,7 @@ fi<br>
&gt;=C2=A0 =C2=A0AC_PROG_INSTALL<br>
&gt;<br>
&gt;=C2=A0 =C2=A0AC_CONFIG_HEADER(config.h)<br>
&gt; @@ -67,5 +69,5 @@ index 0000000..4f78ad8<br>
&gt;=C2=A0 +Libs: -L${libdir} -lpcap<br>
&gt;=C2=A0 +Cflags: -I${includedir}<br>
&gt;=C2=A0 --<br>
&gt; -1.9.1<br>
&gt; +2.1.4<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/<wbr>libpcap/<a href=3D"http://=
libpcap_1.7.4.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.7.4.bb</a>=
 b/meta/recipes-connectivity/<wbr>libpcap/<a href=3D"http://libpcap_1.8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libpcap_1.8.1.bb</a><br>
&gt; similarity index 67%<br>
&gt; rename from meta/recipes-connectivity/<wbr>libpcap/<a href=3D"http://l=
ibpcap_1.7.4.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.7.4.bb</a><=
br>
&gt; rename to meta/recipes-connectivity/<wbr>libpcap/<a href=3D"http://lib=
pcap_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.8.1.bb</a><br=
>
&gt; index 8d12b25..9072fe0 100644<br>
&gt; --- a/meta/recipes-connectivity/<wbr>libpcap/<a href=3D"http://libpcap=
_1.7.4.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.7.4.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/<wbr>libpcap/<a href=3D"http://libpcap=
_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.8.1.bb</a><br>
&gt; @@ -1,10 +1,11 @@<br>
&gt;=C2=A0 require libpcap.inc<br>
&gt;<br>
&gt; -SRC_URI +=3D &quot;file://aclocal.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libpcap-pkgconfig-<w=
br>support.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>b2e13142bbaba857ab1c6894aedaf5<wbr>47&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>7ad3112187e88328b85e46dce7a9b9<wbr>=
49632af18ee74d97ffc3f2b41fe7f4<wbr>48b0&quot;<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 file://libpcap-pkgconfig-<wbr>support.patch \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>3d48f9cd171ff12b0efd9134b52f14<wbr>47&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>673dbc69fdc3f5a86fb5759ab19899<wbr>=
039a8e5e6c631749e48dcd9c6f0c83<wbr>541e&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # make install doesn&#39;t cover the shared lib<br>
&gt; @@ -13,7 +14,7 @@ SRC_URI[sha256sum] =3D &quot;<wbr>7ad3112187e88328b8=
5e46dce7a9b9<wbr>49632af18ee74d97ffc3f2b41fe7<br>
&gt;<br>
&gt;=C2=A0 do_configure_prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #remove hardcoded references to /usr/include<br>
&gt; -=C2=A0 =C2=A0 sed &#39;s|\([ &quot;^&#39;\&#39;&#39;I]\+\)/usr/includ=
e/|\1${<wbr>STAGING_INCDIR}/|g&#39; -i ${S}/<a href=3D"http://configure.in"=
 rel=3D"noreferrer" target=3D"_blank">configure.in</a><br>
&gt; +=C2=A0 =C2=A0 sed &#39;s|\([ &quot;^&#39;\&#39;&#39;I]\+\)/usr/includ=
e/|\1${<wbr>STAGING_INCDIR}/|g&#39; -i ${S}/<a href=3D"http://configure.ac"=
 rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install_prepend () {<br>
&gt; --<br>
&gt; 2.1.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div>

--001a1140673cbeb4bb05417059f8--
