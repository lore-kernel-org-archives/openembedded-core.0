Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4A5719EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 14:20:41 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n204so176773792qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 06:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lFfmGNrbRnYpRHWXKiJ1g0n1OZOXfxAYMya7BceOSpk=;
	b=LvU6mdM0XVbyZVbELf6FNt3MsSZRw7SYLv6j8/9BLtMu0UPG0X2oL8R8rKr3crGb/T
	I75WqflR9n9HLMLHUYhV8xLKRErIdcQ220mnyQe9Uf4Ogo5TVWuAlVZjouI9jLWrIlCO
	Nd7bA1e3vL047W5ETErbK/Fn1CPq9vCWYX/1MaEuOIC+/bAfa+Qz1IvoihTMt/uSvNrV
	b8UjmFABv5z38fkPHH1G+Izs1a0wflYw9bVcKQAt+YUiRuBzXEZwY0IyUNIHn4veYprY
	8Y5dnopE/1g+XGnO7naP1Za356I3cgWlv8hjXJY+DSwU09D+BxLKfjbaH71giiiRm1UM
	Lrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lFfmGNrbRnYpRHWXKiJ1g0n1OZOXfxAYMya7BceOSpk=;
	b=bg/kVw0th4I4MZI4cGK5mrmkuu4We7Bpq65/Tw9CsD6vw9eA0PhgbmhvTGr+CMUZsu
	glyLW3r5dF1gqywZGhJDSFZB5cFCv64L9mVEqkUoGJwo9uxtWAZjlzjxGQasVTK0H7Lw
	i++PF2mBfEHveAAwAjhkSVhcleuxXkhxEXhcYUa1/bTv84LGcOeHXwpX4c+ZIOL2xhMP
	491AremW3V+mqSlp7F9mLaokdwyctdifGhFyekwjF+vhLb24liK0F6uVOjJQVnBIPIVg
	ZB1zazlpBRITNHGTeKZy+i9qgR3ZoUtPKgeKxYj6DIu32RqiPy5r+eXuNQj1eUXTU0dY
	FiHw==
X-Gm-Message-State: AKaTC03GJ7WTHpnKgaCa4OQC4jMH2f72dlBQ1tNc6H8Xtf2hIH0mkT8Wpgp8rO5mE2NlsugKlfhnI+tmBWJxmpmW
X-Received: by 10.55.177.195 with SMTP id a186mr3952419qkf.89.1479306042541;
	Wed, 16 Nov 2016 06:20:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Wed, 16 Nov 2016 06:20:12 -0800 (PST)
In-Reply-To: <CALbNGRQ3D_tsjo7-ZpcPHtyRzzB2WZxVkjDqh3V6JGUxfVCtRQ@mail.gmail.com>
References: <cover.1479301275.git.jussi.kukkonen@intel.com>
	<21d8313a85d99df758d09cacc1926c109b1e1adc.1479301275.git.jussi.kukkonen@intel.com>
	<2492cb242375d6dbc1efd5c530c555a1cd0dfb72.1479301275.git.jussi.kukkonen@intel.com>
	<CALbNGRQ3D_tsjo7-ZpcPHtyRzzB2WZxVkjDqh3V6JGUxfVCtRQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 16 Nov 2016 16:20:12 +0200
Message-ID: <CAHiDW_EitfkB+CwofoDxgZeiWgaiBgdfkCxqeUbFT06_YiWQTA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] mesa: Upgrade 12.0.3 -> 13.0.1
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
X-List-Received-Date: Wed, 16 Nov 2016 14:20:43 -0000
Content-Type: multipart/alternative; boundary=94eb2c06137a2e4a5b05416bc772

--94eb2c06137a2e4a5b05416bc772
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16 November 2016 at 15:39, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> On Wed, Nov 16, 2016 at 2:15 PM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
> > New major release with OpenGL 4.4 support. Dependency on libudev has
> > been removed.
> >
> > Rebase replace_glibc_check_with_linux.patch.
> > Add patch to find native wayland-scanner.
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ---
> >  .../0001-Use-wayland-scanner-in-the-path.patch     | 37
> ++++++++++++++++++++++
> >  .../files/replace_glibc_check_with_linux.patch     | 25 ++++++++++----=
-
> >  .../mesa/{mesa-gl_12.0.3.bb =3D> mesa-gl_13.0.1.bb}  |  0
> >  meta/recipes-graphics/mesa/mesa.inc                |  2 +-
> >  .../mesa/{mesa_12.0.3.bb =3D> mesa_13.0.1.bb}        |  5 +--
> >  5 files changed, 58 insertions(+), 11 deletions(-)
> >  create mode 100644 meta/recipes-graphics/mesa/files/0001-Use-wayland-
> scanner-in-the-path.patch
> >  rename meta/recipes-graphics/mesa/{mesa-gl_12.0.3.bb =3D>
> mesa-gl_13.0.1.bb} (100%)
> >  rename meta/recipes-graphics/mesa/{mesa_12.0.3.bb =3D> mesa_13.0.1.bb}
> (75%)
> >
> > diff --git a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-=
in-the-path.patch
> b/meta/recipes-graphics/mesa/files/0001-Use-wayland-
> scanner-in-the-path.patch
> > new file mode 100644
> > index 0000000..e49695b
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/files/0001-Use-wayland-
> scanner-in-the-path.patch
> > @@ -0,0 +1,37 @@
> > +From 2f68fcaaf4964e7feeb383f5c26851965cda037c Mon Sep 17 00:00:00 2001
> > +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > +Date: Tue, 15 Nov 2016 15:20:49 +0200
> > +Subject: [PATCH] Simplify wayland-scanner lookup
> > +
> > +Don't use pkg-config to lookup the path of a binary that's in the path=
.
> > +
> > +Alternatively we'd have to prefix the path returned by pkg-config with
> > +PKG_CONFIG_SYSROOT_DIR.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > +---
> > + configure.ac | 7 +------
> > + 1 file changed, 1 insertion(+), 6 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index e56e35a..a92005a 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -2020,12 +2020,7 @@ if test "x$with_egl_platforms" !=3D "x" -a
> "x$enable_egl" !=3D xyes; then
> > +     AC_MSG_ERROR([cannot build egl state tracker without EGL library]=
)
> > + fi
> > +
> > +-PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
> > +-        WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dwayland_scanner
> wayland-scanner`,
> > +-        WAYLAND_SCANNER=3D'')
> > +-if test "x$WAYLAND_SCANNER" =3D x; then
> > +-    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> > +-fi
> > ++AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> > +
> > + # Do per-EGL platform setups and checks
> > + egl_platforms=3D`IFS=3D', '; echo $with_egl_platforms`
> > +--
> > +2.1.4
> > +
> > diff --git a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_=
linux.patch
> b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
> > index e4461ef..0280ee8 100644
> > --- a/meta/recipes-graphics/mesa/files/replace_glibc_check_
> with_linux.patch
> > +++ b/meta/recipes-graphics/mesa/files/replace_glibc_check_
> with_linux.patch
> > @@ -2,16 +2,25 @@ endianness check is OS wide and not specific to libc
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  Upstream-Status: Pending
> > -Index: mesa-11.1.1/src/gallium/include/pipe/p_config.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- mesa-11.1.1.orig/src/gallium/include/pipe/p_config.h
> > -+++ mesa-11.1.1/src/gallium/include/pipe/p_config.h
> > -@@ -130,7 +130,7 @@
> > -  * Endian detection.
> > -  */
> > +
> > +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > +---
> > + src/util/u_endian.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/util/u_endian.h b/src/util/u_endian.h
> > +index b9d563d..2d5eab9 100644
> > +--- a/src/util/u_endian.h
> > ++++ b/src/util/u_endian.h
> > +@@ -27,7 +27,7 @@
> > + #ifndef U_ENDIAN_H
> > + #define U_ENDIAN_H
> >
> > --#ifdef __GLIBC__
> > +-#if defined(__GLIBC__) || defined(ANDROID)
> >  +#if defined(__linux__)
> >   #include <endian.h>
> >
> >   #if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN
> > +--
> > +2.1.4
> > +
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_12.0.3.bb
> b/meta/recipes-graphics/mesa/mesa-gl_13.0.1.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_12.0.3.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_13.0.1.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index e4880ff..2f5511e 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D
> 899fbe7e42d494c7c8c159c7001693d
> >
> >  PE =3D "2"
> >
> > -DEPENDS =3D "expat makedepend-native flex-native bison-native
> libxml2-native udev"
> > +DEPENDS =3D "expat makedepend-native flex-native bison-native
> libxml2-native"
> >
> >  PROVIDES =3D "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/=
egl
> virtual/mesa"
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_12.0.3.bb
> b/meta/recipes-graphics/mesa/mesa_13.0.1.bb
> > similarity index 75%
> > rename from meta/recipes-graphics/mesa/mesa_12.0.3.bb
> > rename to meta/recipes-graphics/mesa/mesa_13.0.1.bb
> > index acc8353..37ac15f 100644
> > --- a/meta/recipes-graphics/mesa/mesa_12.0.3.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_13.0.1.bb
> > @@ -3,10 +3,11 @@ require ${BPN}.inc
> >  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.x=
z \
> >             file://replace_glibc_check_with_linux.patch \
> >             file://disable-asm-on-non-gcc.patch \
> > +           file://0001-Use-wayland-scanner-in-the-path.patch \
> >  "
> >
> > -SRC_URI[md5sum] =3D "1113699c714042d8c4df4766be8c57d8"
> > -SRC_URI[sha256sum] =3D "1dc86dd9b51272eee1fad3df65e18c
> da2e556ef1bc0b6e07cd750b9757f493b1"
> > +SRC_URI[md5sum] =3D "72b7f4d0c2407f367484abd201cb8276"
> > +SRC_URI[sha256sum] =3D "71962fb2bf77d33b0ad4a565b490db
> beaf4619099c6d9722f04a73187957a731"
> >
> >  #because we cannot rely on the fact that all apps will use pkgconfig,
> >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > --
> > 2.1.4
> >
> I had already tested mesa 13.0.0 and ran into similar problems as
> reported in [1]. So I waited for libdrm which was updated yesterday.
> Can you prepare an update for libdrm 2.4.73 too - or shall I take
> care?
>
> [1] https://bugs.freedesktop.org/show_bug.cgi?id=3D98563
>

Thanks for heads-up, I can send that tomorrow.

Jussi

--94eb2c06137a2e4a5b05416bc772
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
6 November 2016 at 15:39, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=
=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@go=
oglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div c=
lass=3D"HOEnZb"><div class=3D"h5">On Wed, Nov 16, 2016 at 2:15 PM, Jussi Ku=
kkonen<br>
&lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a=
>&gt; wrote:<br>
&gt; New major release with OpenGL 4.4 support. Dependency on libudev has<b=
r>
&gt; been removed.<br>
&gt;<br>
&gt; Rebase replace_glibc_check_with_<wbr>linux.patch.<br>
&gt; Add patch to find native wayland-scanner.<br>
&gt;<br>
&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@int=
el.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-Use-wayland-scanner-<wbr>in-the-path.patch=C2=A0 =C2=A0=
 =C2=A0| 37 ++++++++++++++++++++++<br>
&gt;=C2=A0 .../files/replace_glibc_check_<wbr>with_linux.patch=C2=A0 =C2=A0=
 =C2=A0| 25 ++++++++++-----<br>
&gt;=C2=A0 .../mesa/{<a href=3D"http://mesa-gl_12.0.3.bb" rel=3D"noreferrer=
" target=3D"_blank">mesa-gl_12.0.3.bb</a> =3D&gt; <a href=3D"http://mesa-gl=
_13.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_13.0.1.bb</a>}=C2=
=A0 |=C2=A0 0<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/<wbr>mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 .../mesa/{<a href=3D"http://mesa_12.0.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">mesa_12.0.3.bb</a> =3D&gt; <a href=3D"http://mesa_13.0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa_13.0.1.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 5 +--<br>
&gt;=C2=A0 5 files changed, 58 insertions(+), 11 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/mesa/<wbr>files/0001-Us=
e-wayland-<wbr>scanner-in-the-path.patch<br>
&gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_12.=
0.3.bb" rel=3D"noreferrer" target=3D"_blank">me<wbr>sa-gl_12.0.3.bb</a> =3D=
&gt; <a href=3D"http://mesa-gl_13.0.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">mesa-gl_13.0.1.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_12.0.3=
.bb" rel=3D"noreferrer" target=3D"_blank">me<wbr>sa_12.0.3.bb</a> =3D&gt; <=
a href=3D"http://mesa_13.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_=
13.0.1.bb</a>} (75%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<wbr>files/0001-Use-wayland-<w=
br>scanner-in-the-path.patch b/meta/recipes-graphics/mesa/<wbr>files/0001-U=
se-wayland-<wbr>scanner-in-the-path.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e49695b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/mesa/<wbr>files/0001-Use-wayland-<wbr>scan=
ner-in-the-path.patch<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +From 2f68fcaaf4964e7feeb383f5c26851<wbr>965cda037c Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">=
jussi.kukkonen@intel.com</a>&gt;<br>
&gt; +Date: Tue, 15 Nov 2016 15:20:49 +0200<br>
&gt; +Subject: [PATCH] Simplify wayland-scanner lookup<br>
&gt; +<br>
&gt; +Don&#39;t use pkg-config to lookup the path of a binary that&#39;s in=
 the path.<br>
&gt; +<br>
&gt; +Alternatively we&#39;d have to prefix the path returned by pkg-config=
 with<br>
&gt; +PKG_CONFIG_SYSROOT_DIR.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@in=
tel.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 7 +------<br>
&gt; + 1 file changed, 1 insertion(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index e56e35a..a92005a 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -2020,12 +2020,7 @@ if test &quot;x$with_egl_platforms&quot; !=3D =
&quot;x&quot; -a &quot;x$enable_egl&quot; !=3D xyes; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([cannot build egl state tracker with=
out EGL library])<br>
&gt; + fi<br>
&gt; +<br>
&gt; +-PKG_CHECK_MODULES([WAYLAND_<wbr>SCANNER], [wayland-scanner],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_SCANNER=3D`$PKG_CONFIG --variabl=
e=3Dwayland_scanner wayland-scanner`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_SCANNER=3D&#39;&#39;)<br>
&gt; +-if test &quot;x$WAYLAND_SCANNER&quot; =3D x; then<br>
&gt; +-=C2=A0 =C2=A0 AC_PATH_PROG([WAYLAND_SCANNER]<wbr>, [wayland-scanner]=
)<br>
&gt; +-fi<br>
&gt; ++AC_PATH_PROG([WAYLAND_<wbr>SCANNER], [wayland-scanner])<br>
&gt; +<br>
&gt; + # Do per-EGL platform setups and checks<br>
&gt; + egl_platforms=3D`IFS=3D&#39;, &#39;; echo $with_egl_platforms`<br>
&gt; +--<br>
&gt; +2.1.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<wbr>files/replace_glibc_check=
_<wbr>with_linux.patch b/meta/recipes-graphics/mesa/<wbr>files/replace_glib=
c_check_<wbr>with_linux.patch<br>
&gt; index e4461ef..0280ee8 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/<wbr>files/replace_glibc_check_<wbr>w=
ith_linux.patch<br>
&gt; +++ b/meta/recipes-graphics/mesa/<wbr>files/replace_glibc_check_<wbr>w=
ith_linux.patch<br>
&gt; @@ -2,16 +2,25 @@ endianness check is OS wide and not specific to libc=
<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt; -Index: mesa-11.1.1/src/gallium/<wbr>include/pipe/p_config.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- mesa-11.1.1.orig/src/gallium/<wbr>include/pipe/p_config.h<br>
&gt; -+++ mesa-11.1.1/src/gallium/<wbr>include/pipe/p_config.h<br>
&gt; -@@ -130,7 +130,7 @@<br>
&gt; -=C2=A0 * Endian detection.<br>
&gt; -=C2=A0 */<br>
&gt; +<br>
&gt; +Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@in=
tel.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/util/u_endian.h | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/util/u_endian.h b/src/util/u_endian.h<br>
&gt; +index b9d563d..2d5eab9 100644<br>
&gt; +--- a/src/util/u_endian.h<br>
&gt; ++++ b/src/util/u_endian.h<br>
&gt; +@@ -27,7 +27,7 @@<br>
&gt; + #ifndef U_ENDIAN_H<br>
&gt; + #define U_ENDIAN_H<br>
&gt;<br>
&gt; --#ifdef __GLIBC__<br>
&gt; +-#if defined(__GLIBC__) || defined(ANDROID)<br>
&gt;=C2=A0 +#if defined(__linux__)<br>
&gt;=C2=A0 =C2=A0#include &lt;endian.h&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN<br>
&gt; +--<br>
&gt; +2.1.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_12.0=
.3.bb" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa-gl_12.0.3.bb</a> b/me=
ta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_13.0.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">m<wbr>esa-gl_13.0.1.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_12.0.=
3.bb" rel=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_12.0.3.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_13.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_13.0.1.bb</a><br>
&gt; diff --git a/meta/recipes-graphics/mesa/<wbr>mesa.inc b/meta/recipes-g=
raphics/mesa/<wbr>mesa.inc<br>
&gt; index e4880ff..2f5511e 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
&gt; @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D &quot;file://docs/license.html;=
md5=3D<wbr>899fbe7e42d494c7c8c159c7001693<wbr>d<br>
&gt;<br>
&gt;=C2=A0 PE =3D &quot;2&quot;<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;expat makedepend-native flex-native bison-native li=
bxml2-native udev&quot;<br>
&gt; +DEPENDS =3D &quot;expat makedepend-native flex-native bison-native li=
bxml2-native&quot;<br>
&gt;<br>
&gt;=C2=A0 PROVIDES =3D &quot;virtual/libgl virtual/libgles1 virtual/libgle=
s2 virtual/egl virtual/mesa&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_12.0.3.=
bb" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa_12.0.3.bb</a> b/meta/rec=
ipes-graphics/mesa/<a href=3D"http://mesa_13.0.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">m<wbr>esa_13.0.1.bb</a><br>
&gt; similarity index 75%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_12.0.3.b=
b" rel=3D"noreferrer" target=3D"_blank">mes<wbr>a_12.0.3.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_13.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">mes<wbr>a_13.0.1.bb</a><br>
&gt; index acc8353..37ac15f 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_12.0.3.bb" rel=
=3D"noreferrer" target=3D"_blank">m<wbr>esa_12.0.3.bb</a><br>
&gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_13.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">m<wbr>esa_13.0.1.bb</a><br>
&gt; @@ -3,10 +3,11 @@ require ${BPN}.inc<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pub/mesa/=
${PV}/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.fre=
edesktop.org/<wbr>pub/mesa/${PV}/mesa-${PV}.tar.<wbr>xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://replace_glibc_ch=
eck_<wbr>with_linux.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-asm-on-n=
on-gcc.<wbr>patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-wayland-<wbr=
>scanner-in-the-path.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>1113699c714042d8c4df4766be8c57<wbr>d8&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>1dc86dd9b51272eee1fad3df65e18c<wbr>=
da2e556ef1bc0b6e07cd750b9757f4<wbr>93b1&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>72b7f4d0c2407f367484abd201cb82<wbr>76&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>71962fb2bf77d33b0ad4a565b490db<wbr>=
beaf4619099c6d9722f04a73187957<wbr>a731&quot;<br>
&gt;<br>
&gt;=C2=A0 #because we cannot rely on the fact that all apps will use pkgco=
nfig,<br>
&gt;=C2=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
&gt; --<br>
&gt; 2.1.4<br>
&gt;<br>
</div></div>I had already tested mesa 13.0.0 and ran into similar problems =
as<br>
reported in [1]. So I waited for libdrm which was updated yesterday.<br>
Can you prepare an update for libdrm 2.4.73 too - or shall I take<br>
care?<br>
<br>
[1] <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98563" rel=3D=
"noreferrer" target=3D"_blank">https://bugs.freedesktop.org/<wbr>show_bug.c=
gi?id=3D98563</a><span class=3D"HOEnZb"><font color=3D"#888888"><br></font>=
</span></blockquote><div><br></div><div>Thanks for heads-up, I can send tha=
t tomorrow.</div><div><br></div><div>Jussi</div><div><br></div></div></div>=
</div>

--94eb2c06137a2e4a5b05416bc772--
