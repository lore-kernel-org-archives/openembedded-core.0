Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACA065C90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 19:41:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so14422698wma.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 11:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eJp+muVFeiYIYQNH61Ef8X/sZaZrHTd+kmK2IdQwtyQ=;
	b=W+A6DqIQ81uU5S+r/gFmuq1joZSkjOWxsiy9MeI5xyCNnMK7oAt4EUUI/LuoHo3Die
	2zXC7wKKZQKkKxlpQmqx2JZVUrPTEbkQrb4UjHj5i/Y1orsyOtrTHk69LLJ+DIBabN2K
	HyoexEG5oeGQICXaIn9nHzJTyEUtDx3isK0H8xKyyxzOikTcEZNSJcKjsEgRDtuGBfgx
	4yMp08I8WlQmsm4tmxC9CFE+od/wiKVsFzAYE6VDK7W01LPUDNNkL1QAwYbydxbFrlXY
	EbEOdV2YMHS1HhRk2UAhydJg/r8WIs6tkyuTRioSDF2wEyiUzM1kYywIs0nXnUJfUEuq
	5xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eJp+muVFeiYIYQNH61Ef8X/sZaZrHTd+kmK2IdQwtyQ=;
	b=LPEE4yY3wJxVBX/MJk8CC/h1iYDxI3sIQSW9mh9Frooq/q9gYVEdyDQ0qJY7fCW66C
	eUQ5BqKLBfst6+xxmuYYXwHIzFRNiK2joyMnB6RVytAH0HlI8RiR9w1VT9wIf0R5x6jI
	hu9/hMIJ8jaRMt6uzS5OH79cIyhjiZXwKqgGWrxg2dLMFYcnNzF3MxtLx33NzAq+kenC
	MPqOlZM6IYxJZDyAixpauIEVJYfrwvYS+0eR/+Nut8WJCjCcpdxpfGKYYjYvIB5uNnUy
	S/roQ1EXFkEFI+pQqLBbZOI01iyIhbKHyBzRkFLxjj13M5xVjrpoj/L2+ngfM4zJ6wZk
	ioSA==
X-Gm-Message-State: ABUngvdLjtj0MfTAyAx09Wk9ONMICkmTifYmEdysuVC4aScw27ajzs7YLcndZefzcoijcw==
X-Received: by 10.194.175.163 with SMTP id cb3mr3184448wjc.174.1479325302334; 
	Wed, 16 Nov 2016 11:41:42 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	135sm2108107wmh.14.2016.11.16.11.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Nov 2016 11:41:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Nov 2016 20:41:41 +0100
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20161116194141.GC16451@jama>
References: <1478605968-18575-1-git-send-email-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1478605968-18575-1-git-send-email-fabio.berton@ossystems.com.br>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 16 Nov 2016 19:41:42 -0000
X-Groupsio-MsgNum: 89486
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 09:52:48AM -0200, Fabio Berton wrote:
>   - Option --enable-canusb was removed on commit:
>     https://github.com/the-tcpdump-group/libpcap/commit/93ca5ff7030aaf121=
9e1de05ec89a68384bfc50b
>   - Autotools class was improved and we can now stop aclocal from running=
 at all.
>   - File configure.in was renamed to configure.ac, rework libpcap-pkgconf=
ig-support
>     patch and do_configure_prepend task to use configure.ac file.
>=20
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta/recipes-connectivity/libpcap/libpcap.inc      |   5 +-
>  .../libpcap/libpcap/aclocal.patch                  | 167 ---------------=
------
>  .../libpcap/libpcap-pkgconfig-support.patch        |  32 ++--
>  .../libpcap/{libpcap_1.7.4.bb =3D> libpcap_1.8.1.bb} |  13 +-
>  4 files changed, 25 insertions(+), 192 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/aclocal.pat=
ch
>  rename meta/recipes-connectivity/libpcap/{libpcap_1.7.4.bb =3D> libpcap_=
1.8.1.bb} (67%)
>=20
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes=
-connectivity/libpcap/libpcap.inc
> index 7b29a52..4453a9e 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> @@ -19,6 +19,7 @@ BINCONFIG =3D "${bindir}/pcap-config"
>  inherit autotools binconfig-disabled pkgconfig bluetooth
> =20
>  EXTRA_OECONF =3D "--with-pcap=3Dlinux"
> +EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, '${BLUEZ}', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6=
', '', d)} \
> @@ -26,7 +27,6 @@ PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'bluetooth', '${BLUEZ
>  PACKAGECONFIG[bluez4] =3D "--enable-bluetooth,--disable-bluetooth,bluez4"
>  # Add a dummy PACKAGECONFIG for bluez5 since it is not supported by libp=
cap.
>  PACKAGECONFIG[bluez5] =3D ",,"
> -PACKAGECONFIG[canusb] =3D "--enable-canusb,--enable-canusb=3Dno,libusb"
>  PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"

This version fails to build without ipv6 in PACKAGECONFIG with this
error:

| i586-oe-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/oe-core/tmp-g=
libc/sysroots/qemux86 -I../libpcap-1.8.1 -fvisibility=3Dhidden -fpic -I/OE/=
build/oe-core/tmp-glibc/work/i586-oe-linux/libpcap/1.8.1-r0/libpcap-1.8.1 -=
O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/OE/build/o=
e-core/tmp-glibc/work/i586-oe-linux/libpcap/1.8.1-r0=3D/usr/src/debug/libpc=
ap/1.8.1-r0 -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/sysroots/x86_6=
4-linux=3D -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/sysroots/qemux8=
6=3D -I.  -DBUILDING_PCAP -DHAVE_CONFIG_H  -D_U_=3D"__attribute__((unused))=
" -I/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/libpcap/1.8.1-r0/libpcap=
-1.8.1 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/OE=
/build/oe-core/tmp-glibc/work/i586-oe-linux/libpcap/1.8.1-r0=3D/usr/src/deb=
ug/libpcap/1.8.1-r0 -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/sysroo=
ts/x86_64-linux=3D -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/sysroot=
s/qemux86=3D    -c scanner.c
| ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
| ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t {aka struct _c=
ompiler_state}' has no member named 'ai'
|   cstate.ai =3D NULL;
|         ^
| ../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
| ../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared (first use=
 in this function)
|    bpf_error(cstate, "direction applied to 'gateway'");
|              ^~~~~~
| ../libpcap-1.8.1/gencode.c:4914:13: note: each undeclared identifier is r=
eported only once for each function it appears in
| config.status: creating pcap-config.tmp
| make: *** [Makefile:478: gencode.o] Error 1
| make: *** Waiting for unfinished jobs....
| mv pcap-config.tmp pcap-config
| chmod a+x pcap-config

Version 1.7.4 was building fine without it.

>  PACKAGECONFIG[libnl] =3D "--with-libnl,--without-libnl,libnl"
> @@ -36,8 +36,5 @@ CFLAGS_prepend =3D "-I${S} "
>  CXXFLAGS_prepend =3D "-I${S} "
> =20
>  do_configure_prepend () {
> -    if [ ! -e ${S}/acinclude.m4 ]; then
> -        cat ${S}/aclocal.m4 > ${S}/acinclude.m4
> -    fi
>      sed -i -e's,^V_RPATH_OPT=3D.*$,V_RPATH_OPT=3D,' ${S}/pcap-config.in
>  }
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch b/me=
ta/recipes-connectivity/libpcap/libpcap/aclocal.patch
> deleted file mode 100644
> index 2151982..0000000
> --- a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
> +++ /dev/null
> @@ -1,167 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
> ---- libpcap-1.1.1-orig/aclocal.m4	2010-06-29 10:46:32.815117569 +0800
> -+++ libpcap-1.1.1/aclocal.m4	2010-06-29 10:49:17.150149949 +0800
> -@@ -37,7 +37,7 @@
> - dnl AC_LBL_C_INIT.  Now, we run AC_LBL_C_INIT_BEFORE_CC, AC_PROG_CC,
> - dnl and AC_LBL_C_INIT at the top level.
> - dnl
> --AC_DEFUN(AC_LBL_C_INIT_BEFORE_CC,
> -+AC_DEFUN([AC_LBL_C_INIT_BEFORE_CC],
> - [
> -     AC_BEFORE([$0], [AC_LBL_C_INIT])
> -     AC_BEFORE([$0], [AC_PROG_CC])
> -@@ -90,7 +90,7 @@
> - dnl     LDFLAGS
> - dnl     LBL_CFLAGS
> - dnl
> --AC_DEFUN(AC_LBL_C_INIT,
> -+AC_DEFUN([AC_LBL_C_INIT],
> - [
> -     AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])
> -     AC_BEFORE([$0], [AC_LBL_DEVEL])
> -@@ -217,7 +217,7 @@
> - dnl	V_SONAME_OPT
> - dnl	V_RPATH_OPT
> - dnl
> --AC_DEFUN(AC_LBL_SHLIBS_INIT,
> -+AC_DEFUN([AC_LBL_SHLIBS_INIT],
> -     [AC_PREREQ(2.50)
> -     if test "$GCC" =3D yes ; then
> - 	    #
> -@@ -361,7 +361,7 @@
> - # Make sure we use the V_CCOPT flags, because some of those might
> - # disable inlining.
> - #
> --AC_DEFUN(AC_LBL_C_INLINE,
> -+AC_DEFUN([AC_LBL_C_INLINE],
> -     [AC_MSG_CHECKING(for inline)
> -     save_CFLAGS=3D"$CFLAGS"
> -     CFLAGS=3D"$V_CCOPT"
> -@@ -407,7 +407,7 @@
> - dnl
> - dnl	AC_LBL_FIXINCLUDES
> - dnl
> --AC_DEFUN(AC_LBL_FIXINCLUDES,
> -+AC_DEFUN([AC_LBL_FIXINCLUDES],
> -     [if test "$GCC" =3D yes ; then
> - 	    AC_MSG_CHECKING(for ANSI ioctl definitions)
> - 	    AC_CACHE_VAL(ac_cv_lbl_gcc_fixincludes,
> -@@ -453,7 +453,7 @@
> - dnl	$2 (yacc appended)
> - dnl	$3 (optional flex and bison -P prefix)
> - dnl
> --AC_DEFUN(AC_LBL_LEX_AND_YACC,
> -+AC_DEFUN([AC_LBL_LEX_AND_YACC],
> -     [AC_ARG_WITH(flex, [  --without-flex          don't use flex])
> -     AC_ARG_WITH(bison, [  --without-bison         don't use bison])
> -     if test "$with_flex" =3D no ; then
> -@@ -506,7 +506,7 @@
> - dnl
> - dnl	DECLWAITSTATUS (defined)
> - dnl
> --AC_DEFUN(AC_LBL_UNION_WAIT,
> -+AC_DEFUN([AC_LBL_UNION_WAIT],
> -     [AC_MSG_CHECKING(if union wait is used)
> -     AC_CACHE_VAL(ac_cv_lbl_union_wait,
> - 	AC_TRY_COMPILE([
> -@@ -535,7 +535,7 @@
> - dnl
> - dnl	HAVE_SOCKADDR_SA_LEN (defined)
> - dnl
> --AC_DEFUN(AC_LBL_SOCKADDR_SA_LEN,
> -+AC_DEFUN([AC_LBL_SOCKADDR_SA_LEN],
> -     [AC_MSG_CHECKING(if sockaddr struct has the sa_len member)
> -     AC_CACHE_VAL(ac_cv_lbl_sockaddr_has_sa_len,
> - 	AC_TRY_COMPILE([
> -@@ -560,7 +560,7 @@
> - dnl
> - dnl	HAVE_SOCKADDR_STORAGE (defined)
> - dnl
> --AC_DEFUN(AC_LBL_SOCKADDR_STORAGE,
> -+AC_DEFUN([AC_LBL_SOCKADDR_STORAGE],
> -     [AC_MSG_CHECKING(if sockaddr_storage struct exists)
> -     AC_CACHE_VAL(ac_cv_lbl_has_sockaddr_storage,
> - 	AC_TRY_COMPILE([
> -@@ -593,7 +593,7 @@
> - dnl won't be using code that would use that member, or we wouldn't
> - dnl compile in any case).
> - dnl
> --AC_DEFUN(AC_LBL_HP_PPA_INFO_T_DL_MODULE_ID_1,
> -+AC_DEFUN([AC_LBL_HP_PPA_INFO_T_DL_MODULE_ID_1],
> -     [AC_MSG_CHECKING(if dl_hp_ppa_info_t struct has dl_module_id_1 memb=
er)
> -     AC_CACHE_VAL(ac_cv_lbl_dl_hp_ppa_info_t_has_dl_module_id_1,
> - 	AC_TRY_COMPILE([
> -@@ -619,7 +619,7 @@
> - dnl
> - dnl	ac_cv_lbl_have_run_path (yes or no)
> - dnl
> --AC_DEFUN(AC_LBL_HAVE_RUN_PATH,
> -+AC_DEFUN([AC_LBL_HAVE_RUN_PATH],
> -     [AC_MSG_CHECKING(for ${CC-cc} -R)
> -     AC_CACHE_VAL(ac_cv_lbl_have_run_path,
> - 	[echo 'main(){}' > conftest.c
> -@@ -644,7 +644,7 @@
> - dnl
> - dnl	LBL_ALIGN (DEFINED)
> - dnl
> --AC_DEFUN(AC_LBL_UNALIGNED_ACCESS,
> -+AC_DEFUN([AC_LBL_UNALIGNED_ACCESS],
> -     [AC_MSG_CHECKING(if unaligned accesses fail)
> -     AC_CACHE_VAL(ac_cv_lbl_unaligned_fail,
> - 	[case "$host_cpu" in
> -@@ -749,7 +749,7 @@
> - dnl	HAVE_OS_PROTO_H (defined)
> - dnl	os-proto.h (symlinked)
> - dnl
> --AC_DEFUN(AC_LBL_DEVEL,
> -+AC_DEFUN([AC_LBL_DEVEL],
> -     [rm -f os-proto.h
> -     if test "${LBL_CFLAGS+set}" =3D set; then
> - 	    $1=3D"$$1 ${LBL_CFLAGS}"
> -@@ -886,7 +886,7 @@
> - dnl statically and happen to have a libresolv.a lying around (and no
> - dnl libnsl.a).
> - dnl
> --AC_DEFUN(AC_LBL_LIBRARY_NET, [
> -+AC_DEFUN([AC_LBL_LIBRARY_NET], [
> -     # Most operating systems have gethostbyname() in the default search=
ed
> -     # libraries (i.e. libc):
> -     # Some OSes (eg. Solaris) place it in libnsl
> -@@ -909,7 +909,7 @@
> - dnl Test for __attribute__
> - dnl
> -=20
> --AC_DEFUN(AC_C___ATTRIBUTE__, [
> -+AC_DEFUN([AC_C___ATTRIBUTE__], [
> - AC_MSG_CHECKING(for __attribute__)
> - AC_CACHE_VAL(ac_cv___attribute__, [
> - AC_COMPILE_IFELSE(
> -@@ -947,7 +947,7 @@
> - dnl
> - dnl -Scott Barron
> - dnl
> --AC_DEFUN(AC_LBL_TPACKET_STATS,
> -+AC_DEFUN([AC_LBL_TPACKET_STATS],
> -    [AC_MSG_CHECKING(if if_packet.h has tpacket_stats defined)
> -    AC_CACHE_VAL(ac_cv_lbl_tpacket_stats,
> -    AC_TRY_COMPILE([
> -@@ -976,7 +976,7 @@
> - dnl doesn't have that member (which is OK, as either we won't be using
> - dnl code that would use that member, or we wouldn't compile in any case=
).
> - dnl
> --AC_DEFUN(AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI,
> -+AC_DEFUN([AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI],
> -     [AC_MSG_CHECKING(if tpacket_auxdata struct has tp_vlan_tci member)
> -     AC_CACHE_VAL(ac_cv_lbl_dl_hp_ppa_info_t_has_dl_module_id_1,
> - 	AC_TRY_COMPILE([
> -@@ -1003,7 +1003,7 @@
> - dnl=20
> - dnl 	HAVE_DLPI_PASSIVE (defined)
> - dnl
> --AC_DEFUN(AC_LBL_DL_PASSIVE_REQ_T,
> -+AC_DEFUN([AC_LBL_DL_PASSIVE_REQ_T],
> -         [AC_MSG_CHECKING(if dl_passive_req_t struct exists)
> -        AC_CACHE_VAL(ac_cv_lbl_has_dl_passive_req_t,
> -                 AC_TRY_COMPILE([
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-=
support.patch b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig=
-support.patch
> index b861513..afaa3be 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support=
=2Epatch
> +++ b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support=
=2Epatch
> @@ -1,25 +1,27 @@
> -From 8887132e85892a72a84ca3878e60f254ad2ce939 Mon Sep 17 00:00:00 2001
> -From: Joe MacDonald <joe_macdonald@mentor.com>
> -Date: Tue, 24 Feb 2015 15:56:06 -0500
> +From 2796129af52901dd68595e5e88a639308541def9 Mon Sep 17 00:00:00 2001
> +From: Fabio Berton <fabio.berton@ossystems.com.br>
> +Date: Thu, 3 Nov 2016 17:56:29 -0200
>  Subject: [PATCH] libpcap: pkgconfig support
> +Organization: O.S. Systems Software LTDA.
> =20
>  Adding basic structure to support pkg-config.
> =20
>  Upstream-Status: Inappropriate [embedded specific]
> =20
>  Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>  ---
>   Makefile.in   |  5 +++++
> - configure.in  |  1 +
> + configure.ac  |  1 +
>   libpcap.pc.in | 10 ++++++++++
>   3 files changed, 16 insertions(+)
>   create mode 100644 libpcap.pc.in
> =20
>  diff --git a/Makefile.in b/Makefile.in
> -index 1c2d745..1f25faf 100644
> +index e71d973..d7004ed 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -60,6 +60,10 @@ V_RPATH_OPT =3D @V_RPATH_OPT@
> +@@ -61,6 +61,10 @@ V_RPATH_OPT =3D @V_RPATH_OPT@
>   DEPENDENCY_CFLAG =3D @DEPENDENCY_CFLAG@
>   PROG=3Dlibpcap
>  =20
> @@ -30,19 +32,19 @@ index 1c2d745..1f25faf 100644
>   # Standard CFLAGS
>   FULL_CFLAGS =3D $(CCOPT) $(INCLS) $(DEFS) $(CFLAGS)
>  =20
> -@@ -275,6 +279,7 @@ EXTRA_DIST =3D \
> +@@ -286,6 +290,7 @@ EXTRA_DIST =3D \
>   	lbl/os-solaris2.h \
>   	lbl/os-sunos4.h \
>   	lbl/os-ultrix4.h \
>  +	libpcap.pc \
> + 	missing/getopt.c \
> + 	missing/getopt.h \
>   	missing/snprintf.c \
> - 	mkdep \
> - 	msdos/bin2c.c \
> -diff --git a/configure.in b/configure.in
> -index 8f5c86b..fb51b35 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1700,6 +1700,7 @@ esac
> +diff --git a/configure.ac b/configure.ac
> +index da2f940..4fc67bf 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1805,6 +1805,7 @@ fi
>   AC_PROG_INSTALL
>  =20
>   AC_CONFIG_HEADER(config.h)
> @@ -67,5 +69,5 @@ index 0000000..4f78ad8
>  +Libs: -L${libdir} -lpcap
>  +Cflags: -I${includedir}
>  --=20
> -1.9.1
> +2.1.4
> =20
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb b/meta/re=
cipes-connectivity/libpcap/libpcap_1.8.1.bb
> similarity index 67%
> rename from meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
> rename to meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
> index 8d12b25..9072fe0 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.7.4.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
> @@ -1,10 +1,11 @@
>  require libpcap.inc
> =20
> -SRC_URI +=3D "file://aclocal.patch \
> -            file://libpcap-pkgconfig-support.patch \
> -           "
> -SRC_URI[md5sum] =3D "b2e13142bbaba857ab1c6894aedaf547"
> -SRC_URI[sha256sum] =3D "7ad3112187e88328b85e46dce7a9b949632af18ee74d97ff=
c3f2b41fe7f448b0"
> +SRC_URI +=3D " \
> +    file://libpcap-pkgconfig-support.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "3d48f9cd171ff12b0efd9134b52f1447"
> +SRC_URI[sha256sum] =3D "673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e4=
8dcd9c6f0c83541e"
> =20
>  #
>  # make install doesn't cover the shared lib
> @@ -13,7 +14,7 @@ SRC_URI[sha256sum] =3D "7ad3112187e88328b85e46dce7a9b94=
9632af18ee74d97ffc3f2b41fe7
> =20
>  do_configure_prepend () {
>      #remove hardcoded references to /usr/include
> -    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}=
/configure.in
> +    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}=
/configure.ac
>  }
> =20
>  do_install_prepend () {
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgstnQACgkQN1Ujt2V2gBw8uQCdFQ+jPB1AIIQmnA86RZjXYdcr
DdwAni4gSEHBHCQGhWW+CjP0mFI7EJ6D
=cdOC
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
