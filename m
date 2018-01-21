Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5648F62134
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 15:30:25 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id x4so14048040wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FCHe8d8zG3+FQC2EITeEEWlnI9X6hFw0/T3WhOFv894=;
	b=aVgVLnMR2KW7wFIMsqj6Mh9F4ZXtYOCXQ8THtT63gwO/kOgmsfcCkJWU6PSwcCLgZ8
	oSkW42aFb0hWNft7M9FghG3Erhg2T7bR5qqA/1vlZtXKxI7WgLoJv9ChbOm8ZD1fsX26
	LMVJjNG/DuGabaCJoH89pCr/MHXxONlKtDhMCLHjDGgFiqA5tbQMlvjcHobeCWX45Pkd
	cwHlEIMdk8vmY1GBcCvb0oXuaXGTBmoMTRgtS86eSp7jO0n/5cw4LAIda2lzHFfKn+MF
	SsJPkfc2XWArkAv2OWNdf91/fwPPWqiYStkb7o4m7vu8oLF6SO2YBeoAyIre8GvMxJVU
	iVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FCHe8d8zG3+FQC2EITeEEWlnI9X6hFw0/T3WhOFv894=;
	b=Wjt18GhXVEh11qCHxsuLRhMal8mjhB+eJkkOrpetJdvwI8YIdue5fgKLWHXFA26q5m
	HEAsxOUdV6DT4jc08LXXmevUFAJgv8sgJ0hD41on9wDXVB0gjIv6NO4i75ZVezgWh/Gp
	jPpt6WntkkxDfxGj9g8rlSdQ3CJoeg3sUiBQ3uuub8Oo0PSL3ucfTcNurDgZjmeafBM9
	DuUAXQvzyUec3mLP5KINVYEGjIxEAjZMYHPNe8CEou8udF0XiwZClSrSnZlvGzufrb2y
	hEf5x5qUBqYkq1dYj4UThoy2mj7XrXMMD6WakP1uS+2/fWOLcLjVXo3aUB3x3QB75FCW
	KgsQ==
X-Gm-Message-State: AKwxytdQgX6WgBgnQ0vOJ9Kq1wjj8ZillvvoeYs7qT/DRoU0oTpWSVmc
	3RxxrRx8F7VxRAPZzA+KEXckeDZp5fDx5P+ZaiNskw==
X-Google-Smtp-Source: AH8x225yP3pMr9Jb3dLtgnZXlsKIkmCXXoNI5xzMJI78Ob+CPBDvMUDfU+oW+E6kf8hwz96aViLJ0Y5wAA57pvMCRks=
X-Received: by 10.28.131.210 with SMTP id f201mr3254474wmd.117.1516548626179; 
	Sun, 21 Jan 2018 07:30:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 21 Jan 2018 07:30:25 -0800 (PST)
In-Reply-To: <20180108160021.4715-9-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
	<20180108160021.4715-9-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 21 Jan 2018 16:30:25 +0100
Message-ID: <CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] gettext: rationalise optional dependencies
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
X-List-Received-Date: Sun, 21 Jan 2018 15:30:25 -0000
Content-Type: multipart/alternative; boundary="001a114437ca25e9b705634afefa"

--001a114437ca25e9b705634afefa
Content-Type: text/plain; charset="UTF-8"

--without-included-glib seems to cause configure to find glib from the host:

ERROR: This autoconf log indicates errors, it looked at host include and/or
library paths while determining system capabilities.

gettext/0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning: include
location "/usr/include/glib-2.0" is unsafe for cross-compilation
[-Wpoison-system-directories]

I'm testing it with added --with-libglib-2.0-prefix to see if it fixes the
issue. I've added the same to other added PACKAGECONFIGs:
-PACKAGECONFIG[croco] =
"--without-included-libcroco,--with-included-libcroco,libcroco"
-PACKAGECONFIG[glib] =
"--without-included-glib,--with-included-glib,glib-2.0"
-PACKAGECONFIG[libxml] =
"--without-included-libxml,--with-included-libxml,libxml2"
-PACKAGECONFIG[libunistring] =
"--without-included-libunistring,--with-included-libunistring,libunistring"
+PACKAGECONFIG[croco] = "--with-libcroco-0.6-prefix=${STAGING_LIBDIR}/..
--without-included-libcroco,--with-included-libcroco,libcroco"
+PACKAGECONFIG[glib] = "--with-libglib-2.0-prefix=${STAGING_LIBDIR}/..
--without-included-glib,--with-included-glib,glib-2.0"
+PACKAGECONFIG[libxml] = "--with-libxml2-prefix=${STAGING_LIBDIR}/..
--without-included-libxml,--with-included-libxml,libxml2"
+PACKAGECONFIG[libunistring] =
"--with-libunistring-prefix=${STAGING_LIBDIR}/..
--without-included-libunistring,--with-included-libunistring,libunistring"

Not sure if it's worth adding other prefixes for curses related
PACKAGECONFIG
PACKAGECONFIG[msgcat-curses] =
"--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"

  --with-libncurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
DIR/lib
  --without-libncurses-prefix     don't search for PACKLIBS in includedir
and libdir
  --with-libxcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
DIR/lib
  --without-libxcurses-prefix     don't search for PACKLIBS in includedir
and libdir
  --with-libcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
DIR/lib
  --without-libcurses-prefix     don't search for PACKLIBS in includedir
and libdir



On Mon, Jan 8, 2018 at 5:00 PM, Ross Burton <ross.burton@intel.com> wrote:

> gettext has optional dependencies on libxml2, glib, libcroco and
> libunistring.
> If they're not available then gettext will use internal copies, but it can
> also
> use system libraries.
>
> For gettext-native continue to use the internal copies to get this building
> sooner rather than later, but for target use the system shared libraries.
>
> Also gettext 0.19.7 onwards swapped expat for libxm2, so remove the build
> dependency on expat.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> index 46ea68ff5b5..25ff601a6be 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -8,7 +8,7 @@ SECTION = "libs"
>  LICENSE = "GPLv3+ & LGPL-2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -DEPENDS = "gettext-native virtual/libiconv expat"
> +DEPENDS = "gettext-native virtual/libiconv"
>  DEPENDS_class-native = "gettext-minimal-native"
>  PROVIDES = "virtual/libintl virtual/gettext"
>  PROVIDES_class-native = "virtual/gettext-native"
> @@ -33,18 +33,22 @@ EXTRA_OECONF += "--without-lispdir \
>                   --disable-native-java \
>                   --disable-openmp \
>                   --disable-acl \
> -                 --with-included-glib \
>                   --without-emacs \
>                   --without-cvs \
>                   --without-git \
> -                 --with-included-libxml \
> -                 --with-included-libcroco \
> -                 --with-included-libunistring \
>                  "
>  EXTRA_OECONF_append_class-target = " \
>                   --with-bisonlocaledir=${datadir}/locale \
>  "
>
> +PACKAGECONFIG ??= "croco glib libxml libunistring"
> +PACKAGECONFIG_class-native = ""
> +
> +PACKAGECONFIG[croco] = "--without-included-libcroco,-
> -with-included-libcroco,libcroco"
> +PACKAGECONFIG[glib] = "--without-included-glib,--
> with-included-glib,glib-2.0"
> +PACKAGECONFIG[libxml] = "--without-included-libxml,--
> with-included-libxml,libxml2"
> +PACKAGECONFIG[libunistring] = "--without-included-
> libunistring,--with-included-libunistring,libunistring"
> +
>  acpaths = '-I ${S}/gettext-runtime/m4 \
>             -I ${S}/gettext-tools/m4'
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114437ca25e9b705634afefa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">--without-included-glib seems to cause configure to find g=
lib from the host:<div><br></div><div>ERROR: This autoconf log indicates er=
rors, it looked at host include and/or library paths while determining syst=
em capabilities.</div><div><br><div>gettext/0.19.8.1-r0/build/gettext-tools=
/config.log:cc1: warning: include location &quot;/usr/include/glib-2.0&quot=
; is unsafe for cross-compilation [-Wpoison-system-directories]<br></div></=
div><div><br></div><div>I&#39;m testing it with added --with-libglib-2.0-pr=
efix to see if it fixes the issue. I&#39;ve added the same to other added P=
ACKAGECONFIGs:</div><div><div>-PACKAGECONFIG[croco] =3D &quot;--without-inc=
luded-libcroco,--with-included-libcroco,libcroco&quot;</div><div>-PACKAGECO=
NFIG[glib] =3D &quot;--without-included-glib,--with-included-glib,glib-2.0&=
quot;</div><div>-PACKAGECONFIG[libxml] =3D &quot;--without-included-libxml,=
--with-included-libxml,libxml2&quot;</div><div>-PACKAGECONFIG[libunistring]=
 =3D &quot;--without-included-libunistring,--with-included-libunistring,lib=
unistring&quot;</div><div>+PACKAGECONFIG[croco] =3D &quot;--with-libcroco-0=
.6-prefix=3D${STAGING_LIBDIR}/.. --without-included-libcroco,--with-include=
d-libcroco,libcroco&quot;</div><div>+PACKAGECONFIG[glib] =3D &quot;--with-l=
ibglib-2.0-prefix=3D${STAGING_LIBDIR}/.. --without-included-glib,--with-inc=
luded-glib,glib-2.0&quot;</div><div>+PACKAGECONFIG[libxml] =3D &quot;--with=
-libxml2-prefix=3D${STAGING_LIBDIR}/.. --without-included-libxml,--with-inc=
luded-libxml,libxml2&quot;</div><div>+PACKAGECONFIG[libunistring] =3D &quot=
;--with-libunistring-prefix=3D${STAGING_LIBDIR}/.. --without-included-libun=
istring,--with-included-libunistring,libunistring&quot;</div></div><div><br=
></div><div>Not sure if it&#39;s worth adding other prefixes for curses rel=
ated PACKAGECONFIG</div><div>PACKAGECONFIG[msgcat-curses] =3D &quot;--with-=
libncurses-prefix=3D${STAGING_LIBDIR}/..,--disable-curses,ncurses,&quot;<br=
></div><div><br></div><div><div>=C2=A0 --with-libncurses-prefix[=3DDIR]=C2=
=A0 search for PACKLIBS in DIR/include and DIR/lib</div><div>=C2=A0 --witho=
ut-libncurses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for PACKLIBS in in=
cludedir and libdir</div><div>=C2=A0 --with-libxcurses-prefix[=3DDIR]=C2=A0=
 search for PACKLIBS in DIR/include and DIR/lib</div><div>=C2=A0 --without-=
libxcurses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for PACKLIBS in inclu=
dedir and libdir</div><div>=C2=A0 --with-libcurses-prefix[=3DDIR]=C2=A0 sea=
rch for PACKLIBS in DIR/include and DIR/lib</div><div>=C2=A0 --without-libc=
urses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for PACKLIBS in includedir=
 and libdir</div></div><div><br></div><div><br></div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Mon, Jan 8, 2018 at 5:00 PM, R=
oss Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">gettext has optional dependencies on libxml2, glib, lib=
croco and libunistring.<br>
If they&#39;re not available then gettext will use internal copies, but it =
can also<br>
use system libraries.<br>
<br>
For gettext-native continue to use the internal copies to get this building=
<br>
sooner rather than later, but for target use the system shared libraries.<b=
r>
<br>
Also gettext 0.19.7 onwards swapped expat for libxm2, so remove the build<b=
r>
dependency on expat.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gett<wbr>ext_0.19.8.1.bb</a> | 14 +++++++=
++-----<br>
=C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a> b/meta=
/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
index 46ea68ff5b5..25ff601a6be 100644<br>
--- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
+++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
@@ -8,7 +8,7 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv3+ &amp; LGPL-2.1+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>d32239bcb673463a=
b874e80d47fae5<wbr>04&quot;<br>
<br>
-DEPENDS =3D &quot;gettext-native virtual/libiconv expat&quot;<br>
+DEPENDS =3D &quot;gettext-native virtual/libiconv&quot;<br>
=C2=A0DEPENDS_class-native =3D &quot;gettext-minimal-native&quot;<br>
=C2=A0PROVIDES =3D &quot;virtual/libintl virtual/gettext&quot;<br>
=C2=A0PROVIDES_class-native =3D &quot;virtual/gettext-native&quot;<br>
@@ -33,18 +33,22 @@ EXTRA_OECONF +=3D &quot;--without-lispdir \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-na=
tive-java \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-op=
enmp \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-ac=
l \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-inclu=
ded-glib \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-em=
acs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-cv=
s \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-gi=
t \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-inclu=
ded-libxml \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-inclu=
ded-libcroco \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-inclu=
ded-libunistring \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0EXTRA_OECONF_append_class-<wbr>target =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-bison=
localedir=3D${<wbr>datadir}/locale \<br>
=C2=A0&quot;<br>
<br>
+PACKAGECONFIG ??=3D &quot;croco glib libxml libunistring&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG[croco] =3D &quot;--without-included-libcroco,-<wbr>-with-inc=
luded-libcroco,<wbr>libcroco&quot;<br>
+PACKAGECONFIG[glib] =3D &quot;--without-included-glib,--<wbr>with-included=
-glib,glib-2.0&quot;<br>
+PACKAGECONFIG[libxml] =3D &quot;--without-included-libxml,--<wbr>with-incl=
uded-libxml,libxml2&quot;<br>
+PACKAGECONFIG[libunistring] =3D &quot;--without-included-<wbr>libunistring=
,--with-included-<wbr>libunistring,libunistring&quot;<br>
+<br>
=C2=A0acpaths =3D &#39;-I ${S}/gettext-runtime/m4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I ${S}/gettext-tools/m4&#39;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
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

--001a114437ca25e9b705634afefa--
