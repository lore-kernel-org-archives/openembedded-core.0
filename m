Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id F30397872C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 14:42:12 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id g73so19629234ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 06:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1wJ1Q2U+QOWdad9zQPcAcExxUEAQOORyRoCatxXmn9A=;
	b=tPR3pRo77tUPIX9CBAF/0c+ig5LUE0aEwh4qOzspKBL/mXonmJmFNaPMLpPicLtAUi
	SKUT6ycZtusgVgrY+YI6ZBtvY7OVe8Qhf4r1wbB66qaaDSadXHUnHsjVUHYremmRiVoh
	8TB0TLHjKkOFmxpC7jYT60AJ4+LODsJu78VzmVCT01ETZlpmmdh9rq1hh5WqFmnTIhmq
	gvfyVhoqy/c8PviaoPP2PTzPBTCcUnyYWM2OeqbbphG/bdEPxYRxbWGQa/kfcbtUiCPK
	cO3132E0zoiKNSdk86bAAAcN1nVQaGoYvLTBe5qmGYRoDceRsdQVNOk/u0f4ZGh4DrnF
	R+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1wJ1Q2U+QOWdad9zQPcAcExxUEAQOORyRoCatxXmn9A=;
	b=Nzi49JhGtVePBGwmTLPi+bGloG8+NOV0xK1YFo0iHXxrsAcPkjHD80sxDbCaqIUi0r
	aioQqi6gLLKVLXn8kjYcMWr+K9xf5Resl85xAAUqNw/aiSwOcmXKMtREk50BKDVSc3fe
	S9FjHl8V98tJkZV2jusk3Y/OxETNrp59af24tFxqe67IIzB2214RSb3soyd7x6bK8bMC
	iSrBZugMxTZI6sE8lCVgRk81Ws8rT3xVZVBKeQKeB1yX/cJPLO/VmD50bZt0MTQkMyEq
	/nn55k2MTNGG++jOwNl3YJWRBbKNzyeufolc1Tmm8nBxjuUA3Mnu+m2J3SP5H3ye5dqF
	gyfQ==
X-Gm-Message-State: AJaThX5leaEDaquQSPNq+6B9FFv0ilGJKSYMl+aJZi2N+UdQQHoiUmVl
	cdLkHq7wZ3I4aQfPI/KD4+7HkJ0Pv20l/a1ZXvdZaA==
X-Google-Smtp-Source: AGs4zMYlxydgFWYju71yYD7YtBBHIyBRDuXk3M9Moe8DyLG3ZFp1XAnGKaH8uWQbYsTEzPLWpdbAa5NOaEKCfRDa45o=
X-Received: by 10.107.146.195 with SMTP id u186mr18601525iod.37.1511275333780; 
	Tue, 21 Nov 2017 06:42:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Tue, 21 Nov 2017 06:41:53 -0800 (PST)
In-Reply-To: <fb0a858be004dd7f7be4be564d85ebc088fdf104.1511222485.git.akuster@mvista.com>
References: <cover.1511222485.git.akuster@mvista.com>
	<fb0a858be004dd7f7be4be564d85ebc088fdf104.1511222485.git.akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Nov 2017 14:41:53 +0000
Message-ID: <CAJTo0LZOr7EXUkH7J+_QSZzoKFOpobrExieEcAsNTQXNz0aXEA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libassuan: update to 2.4.4
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
X-List-Received-Date: Tue, 21 Nov 2017 14:42:13 -0000
Content-Type: multipart/alternative; boundary="94eb2c0553b26da334055e7f3566"

--94eb2c0553b26da334055e7f3566
Content-Type: text/plain; charset="UTF-8"

License checksum changes but no explanation.

Ross

On 21 November 2017 at 00:07, Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>
> forward ported patch
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../libassuan-add-pkgconfig-support.patch          | 77
> +++++++++++-----------
>  .../{libassuan_2.4.3.bb => libassuan_2.4.4.bb}     | 11 ++--
>  2 files changed, 45 insertions(+), 43 deletions(-)
>  rename meta/recipes-support/libassuan/{libassuan_2.4.3.bb =>
> libassuan_2.4.4.bb} (67%)
>
> diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
> b/meta/recipes-support/libassuan/libassuan/libassuan-
> add-pkgconfig-support.patch
> index b6ccdda..525b076 100644
> --- a/meta/recipes-support/libassuan/libassuan/libassuan-
> add-pkgconfig-support.patch
> +++ b/meta/recipes-support/libassuan/libassuan/libassuan-
> add-pkgconfig-support.patch
> @@ -6,32 +6,15 @@ Upstream-Status: Denied
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>
> -Index: libassuan-2.1.2/Makefile.am
> -===================================================================
> ---- libassuan-2.1.2.orig/Makefile.am
> -+++ libassuan-2.1.2/Makefile.am
> -@@ -24,10 +24,13 @@ AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gz
> - # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
> - GITLOG_TO_CHANGELOG=gitlog-to-changelog
> -
> -+pkgconfigdir = $(libdir)/pkgconfig
> -+pkgconfig_DATA = libassuan.pc
> -+
> - EXTRA_DIST = autogen.sh autogen.rc README.GIT
>      \
> -              ChangeLog-2011 doc/ChangeLog-2011 src/ChangeLog-2011     \
> -              tests/ChangeLog-2011 contrib/ChangeLog-2011              \
> --             build-aux/git-log-footer build-aux/git-log-fix
> -+             build-aux/git-log-footer build-aux/git-log-fix
> libassuan.pc.in
> -
> - SUBDIRS = m4 src doc tests
> -
> -Index: libassuan-2.1.2/libassuan.pc.in
> +forward ported to 2.4.4
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: libassuan-2.4.4/libassuan.pc.in
>  ===================================================================
>  --- /dev/null
> -+++ libassuan-2.1.2/libassuan.pc.in
> -@@ -0,0 +1,14 @@
> -+prefix=@prefix@
> -+exec_prefix=@exec_prefix@
> ++++ libassuan-2.4.4/libassuan.pc.in
> +@@ -0,0 +1,13 @@
> ++prefix=@exec_prefix@
>  +libdir=@libdir@
>  +includedir=@includedir@
>  +api_version=@LIBASSUAN_CONFIG_API_VERSION@
> @@ -44,24 +27,42 @@ Index: libassuan-2.1.2/libassuan.pc.in
>  +Libs: -L${libdir} -lassuan
>  +Libs.private: -lgpg-error
>  +Cflags: -I${includedir}
> -Index: libassuan-2.1.2/configure.ac
> +Index: libassuan-2.4.4/Makefile.am
>  ===================================================================
> ---- libassuan-2.1.2.orig/configure.ac
> -+++ libassuan-2.1.2/configure.ac
> -@@ -439,7 +439,7 @@ AC_CONFIG_FILES([doc/Makefile])
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -25,10 +25,13 @@ DISTCHECK_CONFIGURE_FLAGS = --enable-doc
> + # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
> + GITLOG_TO_CHANGELOG=gitlog-to-changelog
> +
> ++pkgconfigdir = $(libdir)/pkgconfig
> ++pkgconfig_DATA = libassuan.pc
> ++
> + EXTRA_DIST = autogen.sh autogen.rc README.GIT VERSION                   \
> +              ChangeLog-2011 doc/ChangeLog-2011 src/ChangeLog-2011     \
> +              tests/ChangeLog-2011 contrib/ChangeLog-2011              \
> +-             build-aux/git-log-footer build-aux/git-log-fix
> ++             build-aux/git-log-footer build-aux/git-log-fix
> libassuan.pc.in
> +
> + if BUILD_DOC
> + doc = doc
> +Index: 2.4.4-r0/libassuan-2.4.4/configure.ac
> +===================================================================
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -485,6 +485,7 @@ AC_CONFIG_FILES([doc/Makefile])
>   AC_CONFIG_FILES([tests/Makefile])
>   AC_CONFIG_FILES([src/libassuan-config], [chmod +x src/libassuan-config])
>   AC_CONFIG_FILES([src/versioninfo.rc])
> --
>  +AC_CONFIG_FILES([libassuan.pc])
> +
>   AC_OUTPUT
>
> - echo "
> -Index: libassuan-2.1.2/src/libassuan.m4
> +Index: libassuan-2.4.4/src/libassuan.m4
>  ===================================================================
> ---- libassuan-2.1.2.orig/src/libassuan.m4
> -+++ libassuan-2.1.2/src/libassuan.m4
> -@@ -15,18 +15,6 @@ dnl Returns ok set to yes or no.
> +--- a/src/libassuan.m4
> ++++ b/src/libassuan.m4
> +@@ -16,18 +16,6 @@ dnl Returns ok set to yes or no.
>   dnl
>   AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
>   [ AC_REQUIRE([AC_CANONICAL_HOST])
> @@ -80,7 +81,7 @@ Index: libassuan-2.1.2/src/libassuan.m4
>
>     tmp=ifelse([$1], ,1:0.9.2,$1)
>     if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
> -@@ -37,51 +25,12 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
> +@@ -38,51 +26,12 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
>       min_libassuan_version="$tmp"
>     fi
>
> @@ -105,7 +106,7 @@ Index: libassuan-2.1.2/src/libassuan.m4
>  -
>  -    if test "$major" -gt "$req_major"; then
>  -        ok=yes
> --    else
> +-    else
>  -        if test "$major" -eq "$req_major"; then
>  -            if test "$minor" -gt "$req_minor"; then
>  -               ok=yes
> @@ -134,7 +135,7 @@ Index: libassuan-2.1.2/src/libassuan.m4
>         if test "$tmp" -gt 0 ; then
>           AC_MSG_CHECKING([LIBASSUAN API version])
>           if test "$req_libassuan_api" -eq "$tmp" ; then
> -@@ -96,7 +45,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
> +@@ -97,7 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
>
>     if test $ok = yes; then
>       if test x"$host" != x ; then
> @@ -143,7 +144,7 @@ Index: libassuan-2.1.2/src/libassuan.m4
>         if test x"$libassuan_config_host" != xnone ; then
>           if test x"$libassuan_config_host" != x"$host" ; then
>     AC_MSG_WARN([[
> -@@ -137,12 +86,8 @@ dnl
> +@@ -138,12 +87,8 @@ dnl
>   AC_DEFUN([AM_PATH_LIBASSUAN],
>   [ _AM_PATH_LIBASSUAN_COMMON($1)
>     if test $ok = yes; then
> diff --git a/meta/recipes-support/libassuan/libassuan_2.4.3.bb
> b/meta/recipes-support/libassuan/libassuan_2.4.4.bb
> similarity index 67%
> rename from meta/recipes-support/libassuan/libassuan_2.4.3.bb
> rename to meta/recipes-support/libassuan/libassuan_2.4.4.bb
> index 926c279..7921c1d 100644
> --- a/meta/recipes-support/libassuan/libassuan_2.4.3.bb
> +++ b/meta/recipes-support/libassuan/libassuan_2.4.4.bb
> @@ -7,17 +7,18 @@ LICENSE_${PN} = "LGPLv2.1+"
>  LICENSE_${PN}-doc = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
>                      file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1
> \
> -                    file://src/assuan.c;endline=20;md5=
> 0f465544183405055ec179869fc5b5ba \
> -                    file://src/assuan-defs.h;endline=20;md5=
> 20cd55535260ca1779edae5c7b80b21e"
> +                    file://src/assuan.c;endline=20;md5=
> ab92143a5a2adabd06d7994d1467ea5c\
> +                    file://src/assuan-defs.h;endline=20;md5=
> 15d950c83e82978e35b35e790d7e4d39"
>
>  DEPENDS = "libgpg-error"
>
>  UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
>  SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
> -          file://libassuan-add-pkgconfig-support.patch"
> +           file://libassuan-add-pkgconfig-support.patch \
> +          "
>
> -SRC_URI[md5sum] = "8e01a7c72d3e5d154481230668e6eb5a"
> -SRC_URI[sha256sum] = "22843a3bdb256f59be49842abf24da
> 76700354293a066d82ade8134bb5aa2b71"
> +SRC_URI[md5sum] = "52385ec8d34f258bf10165d32c486002"
> +SRC_URI[sha256sum] = "9e69a102272324de0bb56025779f84
> fd44901afcc6eac51505f6a63ea5737ca1"
>
>  BINCONFIG = "${bindir}/libassuan-config"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0553b26da334055e7f3566
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">License checksum changes but no explanation.<div><br></div=
><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 21 November 2017 at 00:07, Armin Kuster <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Armin Kuster &=
lt;<a href=3D"mailto:akuster@mvista.com">akuster@mvista.com</a>&gt;<br>
<br>
forward ported patch<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akust=
er@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../libassuan-add-pkgconfig-<wbr>support.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 77 +++++++++++-----------<br>
=C2=A0.../{<a href=3D"http://libassuan_2.4.3.bb" rel=3D"noreferrer" target=
=3D"_blank">libassuan_2.4.3.bb</a> =3D&gt; <a href=3D"http://libassuan_2.4.=
4.bb" rel=3D"noreferrer" target=3D"_blank">libassuan_2.4.4.bb</a>}=C2=A0 =
=C2=A0 =C2=A0| 11 ++--<br>
=C2=A02 files changed, 45 insertions(+), 43 deletions(-)<br>
=C2=A0rename meta/recipes-support/<wbr>libassuan/{<a href=3D"http://libassu=
an_2.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libassuan_2.4.3.bb</a> =
=3D&gt; <a href=3D"http://libassuan_2.4.4.bb" rel=3D"noreferrer" target=3D"=
_blank">libassuan_2.4.4.bb</a>} (67%)<br>
<br>
diff --git a/meta/recipes-support/<wbr>libassuan/libassuan/libassuan-<wbr>a=
dd-pkgconfig-support.patch b/meta/recipes-support/<wbr>libassuan/libassuan/=
libassuan-<wbr>add-pkgconfig-support.patch<br>
index b6ccdda..525b076 100644<br>
--- a/meta/recipes-support/<wbr>libassuan/libassuan/libassuan-<wbr>add-pkgc=
onfig-support.patch<br>
+++ b/meta/recipes-support/<wbr>libassuan/libassuan/libassuan-<wbr>add-pkgc=
onfig-support.patch<br>
@@ -6,32 +6,15 @@ Upstream-Status: Denied<br>
=C2=A0Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Q=
i.Chen@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Constantin Musca &lt;<a href=3D"mailto:constantinx.mus=
ca@intel.com">constantinx.musca@intel.com</a>&gt;<br>
<br>
-Index: libassuan-2.1.2/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libassuan-2.1.2.orig/Makefile.<wbr>am<br>
-+++ libassuan-2.1.2/Makefile.am<br>
-@@ -24,10 +24,13 @@ AUTOMAKE_OPTIONS =3D dist-bzip2 no-dist-gz<br>
- # (A suitable gitlog-to-changelog script can be found in GnuPG master.)<b=
r>
- GITLOG_TO_CHANGELOG=3Dgitlog-to-<wbr>changelog<br>
-<br>
-+pkgconfigdir =3D $(libdir)/pkgconfig<br>
-+pkgconfig_DATA =3D libassuan.pc<br>
-+<br>
- EXTRA_DIST =3D autogen.sh autogen.rc README.GIT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChangeLog-2011 doc/Change=
Log-2011 src/ChangeLog-2011=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/ChangeLog-2011 cont=
rib/ChangeLog-2011=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build-aux/git-log-footer =
build-aux/git-log-fix<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build-aux/git-log-footer =
build-aux/git-log-fix <a href=3D"http://libassuan.pc.in" rel=3D"noreferrer"=
 target=3D"_blank">libassuan.pc.in</a><br>
-<br>
- SUBDIRS =3D m4 src doc tests<br>
-<br>
-Index: libassuan-2.1.2/<a href=3D"http://libassuan.pc.in" rel=3D"noreferre=
r" target=3D"_blank">libassuan.pc.<wbr>in</a><br>
+forward ported to 2.4.4<br>
+Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akus=
ter@mvista.com</a>&gt;<br>
+<br>
+Index: libassuan-2.4.4/<a href=3D"http://libassuan.pc.in" rel=3D"noreferre=
r" target=3D"_blank">libassuan.pc.<wbr>in</a><br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0--- /dev/null<br>
-+++ libassuan-2.1.2/<a href=3D"http://libassuan.pc.in" rel=3D"noreferrer" =
target=3D"_blank">libassuan.pc.<wbr>in</a><br>
-@@ -0,0 +1,14 @@<br>
-+prefix=3D@prefix@<br>
-+exec_prefix=3D@exec_prefix@<br>
++++ libassuan-2.4.4/<a href=3D"http://libassuan.pc.in" rel=3D"noreferrer" =
target=3D"_blank">libassuan.pc.<wbr>in</a><br>
+@@ -0,0 +1,13 @@<br>
++prefix=3D@exec_prefix@<br>
=C2=A0+libdir=3D@libdir@<br>
=C2=A0+includedir=3D@includedir@<br>
=C2=A0+api_version=3D@LIBASSUAN_<wbr>CONFIG_API_VERSION@<br>
@@ -44,24 +27,42 @@ Index: libassuan-2.1.2/<a href=3D"http://libassuan.pc.i=
n" rel=3D"noreferrer" target=3D"_blank">libassuan.pc.<wbr>in</a><br>
=C2=A0+Libs: -L${libdir} -lassuan<br>
=C2=A0+Libs.private: -lgpg-error<br>
=C2=A0+Cflags: -I${includedir}<br>
-Index: libassuan-2.1.2/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a><br>
+Index: libassuan-2.4.4/Makefile.am<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D<br>
---- libassuan-2.1.2.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure<wbr>.ac</a><br>
-+++ libassuan-2.1.2/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
-@@ -439,7 +439,7 @@ AC_CONFIG_FILES([doc/Makefile]<wbr>)<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -25,10 +25,13 @@ DISTCHECK_CONFIGURE_FLAGS =3D --enable-doc<br>
+ # (A suitable gitlog-to-changelog script can be found in GnuPG master.)<b=
r>
+ GITLOG_TO_CHANGELOG=3Dgitlog-to-<wbr>changelog<br>
+<br>
++pkgconfigdir =3D $(libdir)/pkgconfig<br>
++pkgconfig_DATA =3D libassuan.pc<br>
++<br>
+ EXTRA_DIST =3D autogen.sh autogen.rc README.GIT VERSION=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChangeLog-2011 doc/Change=
Log-2011 src/ChangeLog-2011=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/ChangeLog-2011 cont=
rib/ChangeLog-2011=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build-aux/git-log-footer =
build-aux/git-log-fix<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build-aux/git-log-footer =
build-aux/git-log-fix <a href=3D"http://libassuan.pc.in" rel=3D"noreferrer"=
 target=3D"_blank">libassuan.pc.in</a><br>
+<br>
+ if BUILD_DOC<br>
+ doc =3D doc<br>
+Index: 2.4.4-r0/libassuan-2.4.4/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">confi<wbr>gure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -485,6 +485,7 @@ AC_CONFIG_FILES([doc/Makefile]<wbr>)<br>
=C2=A0 AC_CONFIG_FILES([tests/<wbr>Makefile])<br>
=C2=A0 AC_CONFIG_FILES([src/<wbr>libassuan-config], [chmod +x src/libassuan=
-config])<br>
=C2=A0 AC_CONFIG_FILES([src/<wbr>versioninfo.rc])<br>
--<br>
=C2=A0+AC_CONFIG_FILES([libassuan.<wbr>pc])<br>
+<br>
=C2=A0 AC_OUTPUT<br>
<br>
- echo &quot;<br>
-Index: libassuan-2.1.2/src/libassuan.<wbr>m4<br>
+Index: libassuan-2.4.4/src/libassuan.<wbr>m4<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D<br>
---- libassuan-2.1.2.orig/src/<wbr>libassuan.m4<br>
-+++ libassuan-2.1.2/src/libassuan.<wbr>m4<br>
-@@ -15,18 +15,6 @@ dnl Returns ok set to yes or no.<br>
+--- a/src/libassuan.m4<br>
++++ b/src/libassuan.m4<br>
+@@ -16,18 +16,6 @@ dnl Returns ok set to yes or no.<br>
=C2=A0 dnl<br>
=C2=A0 AC_DEFUN([_AM_PATH_LIBASSUAN_<wbr>COMMON],<br>
=C2=A0 [ AC_REQUIRE([AC_CANONICAL_HOST]<wbr>)<br>
@@ -80,7 +81,7 @@ Index: libassuan-2.1.2/src/libassuan.<wbr>m4<br>
<br>
=C2=A0 =C2=A0 tmp=3Difelse([$1], ,1:0.9.2,$1)<br>
=C2=A0 =C2=A0 if echo &quot;$tmp&quot; | grep &#39;:&#39; &gt;/dev/null 2&g=
t;/dev/null ; then<br>
-@@ -37,51 +25,12 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_<wbr>COMMON],<br>
+@@ -38,51 +26,12 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_<wbr>COMMON],<br>
=C2=A0 =C2=A0 =C2=A0 min_libassuan_version=3D&quot;$tmp&quot;<br>
=C2=A0 =C2=A0 fi<br>
<br>
@@ -105,7 +106,7 @@ Index: libassuan-2.1.2/src/libassuan.<wbr>m4<br>
=C2=A0-<br>
=C2=A0-=C2=A0 =C2=A0 if test &quot;$major&quot; -gt &quot;$req_major&quot;;=
 then<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ok=3Dyes<br>
--=C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 else<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$major&quot; -eq &quot;$re=
q_major&quot;; then<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$minor&quot;=
 -gt &quot;$req_minor&quot;; then<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok=3Dyes<br>
@@ -134,7 +135,7 @@ Index: libassuan-2.1.2/src/libassuan.<wbr>m4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$tmp&quot; -gt 0 ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([LIBASSUAN API version])=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$req_libassuan_api&quot; -=
eq &quot;$tmp&quot; ; then<br>
-@@ -96,7 +45,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_<wbr>COMMON],<br>
+@@ -97,7 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_<wbr>COMMON],<br>
<br>
=C2=A0 =C2=A0 if test $ok =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 if test x&quot;$host&quot; !=3D x ; then<br>
@@ -143,7 +144,7 @@ Index: libassuan-2.1.2/src/libassuan.<wbr>m4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test x&quot;$libassuan_config_host&quot; !=
=3D xnone ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test x&quot;$libassuan_config_host&qu=
ot; !=3D x&quot;$host&quot; ; then<br>
=C2=A0 =C2=A0 AC_MSG_WARN([[<br>
-@@ -137,12 +86,8 @@ dnl<br>
+@@ -138,12 +87,8 @@ dnl<br>
=C2=A0 AC_DEFUN([AM_PATH_LIBASSUAN],<br>
=C2=A0 [ _AM_PATH_LIBASSUAN_COMMON($1)<br>
=C2=A0 =C2=A0 if test $ok =3D yes; then<br>
diff --git a/meta/recipes-support/<wbr>libassuan/<a href=3D"http://libassua=
n_2.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libassuan_2.4.3.bb</a> b/m=
eta/recipes-support/<wbr>libassuan/<a href=3D"http://libassuan_2.4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">libassuan_2.4.4.bb</a><br>
similarity index 67%<br>
rename from meta/recipes-support/<wbr>libassuan/<a href=3D"http://libassuan=
_2.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libassuan_2.4.3.bb</a><br>
rename to meta/recipes-support/<wbr>libassuan/<a href=3D"http://libassuan_2=
.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libassuan_2.4.4.bb</a><br>
index 926c279..7921c1d 100644<br>
--- a/meta/recipes-support/<wbr>libassuan/<a href=3D"http://libassuan_2.4.3=
.bb" rel=3D"noreferrer" target=3D"_blank">libassuan_2.4.3.bb</a><br>
+++ b/meta/recipes-support/<wbr>libassuan/<a href=3D"http://libassuan_2.4.4=
.bb" rel=3D"noreferrer" target=3D"_blank">libassuan_2.4.4.bb</a><br>
@@ -7,17 +7,18 @@ LICENSE_${PN} =3D &quot;LGPLv2.1+&quot;<br>
=C2=A0LICENSE_${PN}-doc =3D &quot;GPLv3+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>f27defe1e96c2e1e=
cd4e0c9be89679<wbr>49 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING.LIB;md5=3D<wbr>2d5025d4aa3495befef8f17206a5b0<wbr>a1 \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/assuan.c;endline=3D<wbr>20;md5=3D<wbr>0f465544183405055ec179869fc5b5=
<wbr>ba \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/assuan-defs.h;<wbr>endline=3D20;md5=3D<wbr>20cd55535260ca1779edae5c7=
b80b2<wbr>1e&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/assuan.c;endline=3D<wbr>20;md5=3D<wbr>ab92143a5a2adabd06d7994d1467ea=
<wbr>5c\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/assuan-defs.h;<wbr>endline=3D20;md5=3D<wbr>15d950c83e82978e35b35e790=
d7e4d<wbr>39&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libgpg-error&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gnupg.org/download/in=
dex.html" rel=3D"noreferrer" target=3D"_blank">https://gnupg.org/download/<=
wbr>index.html</a>&quot;<br>
=C2=A0SRC_URI =3D &quot;${GNUPG_MIRROR}/libassuan/<wbr>libassuan-${PV}.tar.=
bz2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libassuan-add-<wbr>pkgconfig-sup=
port.patch&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libassuan-add-<wbr>pkgconf=
ig-support.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>8e01a7c72d3e5d154481230668e6eb<wbr>5a&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>22843a3bdb256f59be49842abf24da<wbr>76700=
354293a066d82ade8134bb5aa<wbr>2b71&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>52385ec8d34f258bf10165d32c4860<wbr>02&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>9e69a102272324de0bb56025779f84<wbr>fd449=
01afcc6eac51505f6a63ea573<wbr>7ca1&quot;<br>
<br>
=C2=A0BINCONFIG =3D &quot;${bindir}/libassuan-config&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0553b26da334055e7f3566--
