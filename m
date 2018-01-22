Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id B006E78447
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:46:34 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id q8so11057918itb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ng3fOhN1hS7olYWQJFMNzILPdcw7lBvF49uNssBtFN0=;
	b=G/mdMTpbDtWKlQJPMLokHHB9ukYeqjYMf2extbQfj0XwLR3RNFkV3VHp+moglP0L0d
	m+ONxiqkoliA7Bc8KuHBKW4k085U/qQ3C2CK8tiP9p9K3PTpxos6FYdgCpEYFjo5pH0w
	lwm3zrmqyVoI18CgZKT8v/EvCoSUqWN59ZYQfswd6G0FTkDN7NBnga5kjTS03wygPKdV
	7pp/iD66WK+zGEG50uEX4on1AD/yI+97CZ1OF6ovZ4DzNjS+cYqpsqggweRebB8zD3CU
	bKMjVNJYymG6APZ+jCRx6R2H3WcJndYUQQ7jYbZROSZVDDcC9uf97pWtTOEQlfaFrmUy
	ydlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ng3fOhN1hS7olYWQJFMNzILPdcw7lBvF49uNssBtFN0=;
	b=twuPIwJFSXu2WP8phrwk0py1ckp5nfoFUSjgWE3QT46o5M2Tpna/OqXggKky3jymTl
	pmRWZotvIqio6eagYiQPwcGSulxkAn49TPaT3qRE95mTRVmxag0aMwIpAX4BqVhjVPcu
	3zyXlDYP/50Ptk6BiOvKrFiY1hu0c5Xw3xntvjgRbL3ekJbXZqB8pGoCav2p7YVRZ9xr
	L+v0mG7X5gMabA4e5vSTxUBlGXMjPlzaic/0yIyk62GYnV0QkX33Z7QNN9MW/QKRaaCF
	6V7IbYDknmql5SN5GyE4LnswXtEZ6/47h8z+XV+MBmtnuFy1NdAavP2b9fFZ9KjH6YT5
	AScg==
X-Gm-Message-State: AKwxytcI5xxfACx1/NJe9712cCAAoL9ijRaqMv70NCNb/fqnlwbvT7WI
	pzbs2oUZo6O/HOSnkOUNQDOcZdWbwv3W4GNLLKi7QA==
X-Google-Smtp-Source: AH8x22543a4HRseuS350hKcHApDCFoL60eewF2qbKdgai0ShKINFU6H3yTQQ9rX5dFocqvUoNKERFNytIRptBJIng8Y=
X-Received: by 10.36.145.143 with SMTP id i137mr12791ite.6.1516650395758; Mon,
	22 Jan 2018 11:46:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 22 Jan 2018 11:46:15 -0800 (PST)
In-Reply-To: <20180122105205.434-1-Martin.Jansa@gmail.com>
References: <CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
	<20180122105205.434-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jan 2018 19:46:15 +0000
Message-ID: <CAJTo0LZ09e3Z6k82FLJsER26j5eVnF9uug65JGheA=e6DKuM-w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: fix PACKAGECONFIGs
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
X-List-Received-Date: Mon, 22 Jan 2018 19:46:34 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ef16e1692c0056362b065"

--94eb2c0ef16e1692c0056362b065
Content-Type: text/plain; charset="UTF-8"

This is causing QA errors:

ERROR: gettext-0.19.8.1-r0 do_package_qa: QA Issue: gettext:
/work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-split/gettext/usr/lib/gettext/hostname
contains probably-redundant RPATH /usr/lib/../lib
gettext:
/work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-split/gettext/usr/lib/gettext/urlget
contains probably-redundant RPATH /usr/lib/../lib
gettext:
/work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-split/gettext/usr/lib/gettext/cldr-plurals
contains probably-redundant RPATH /usr/lib/../lib
gettext:
/work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-split/gettext/usr/bin/recode-sr-latin
contains probably-redundant RPATH /usr/lib/../lib [useless-rpaths]

Ross

On 22 January 2018 at 10:52, Martin Jansa <martin.jansa@gmail.com> wrote:

> * add --with-*-prefix variables to prevent configure trying to search in
> host paths
> * fixes:
>   ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
>   gettext/0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning:
> include location /usr/include/glib-2.0 is unsafe for cross-compilation
> [-Wpoison-system-directories]
>
> * not sure if it's worth adding other prefixes for curses related
> PACKAGECONFIG
>   PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${
> STAGING_LIBDIR}/..,--disable-curses,ncurses,"
>
>   --with-libncurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
> DIR/lib
>   --without-libncurses-prefix     don't search for PACKLIBS in includedir
> and libdir
>   --with-libxcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
> DIR/lib
>   --without-libxcurses-prefix     don't search for PACKLIBS in includedir
> and libdir
>   --with-libcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
> DIR/lib
>   --without-libcurses-prefix     don't search for PACKLIBS in includedir
> and libdir
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> index 97083c0da2..8a8a34cca8 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -43,10 +43,10 @@ PACKAGECONFIG ??= "croco glib libxml libunistring"
>  PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>
> -PACKAGECONFIG[croco] = "--without-included-libcroco,-
> -with-included-libcroco,libcroco"
> -PACKAGECONFIG[glib] = "--without-included-glib,--
> with-included-glib,glib-2.0"
> -PACKAGECONFIG[libxml] = "--without-included-libxml,--
> with-included-libxml,libxml2"
> -PACKAGECONFIG[libunistring] = "--without-included-
> libunistring,--with-included-libunistring,libunistring"
> +PACKAGECONFIG[croco] = "--with-libcroco-0.6-prefix=${STAGING_LIBDIR}/..
> --without-included-libcroco,--with-included-libcroco,libcroco"
> +PACKAGECONFIG[glib] = "--with-libglib-2.0-prefix=${STAGING_LIBDIR}/..
> --without-included-glib,--with-included-glib,glib-2.0"
> +PACKAGECONFIG[libxml] = "--with-libxml2-prefix=${STAGING_LIBDIR}/..
> --without-included-libxml,--with-included-libxml,libxml2"
> +PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_LIBDIR}/..
> --without-included-libunistring,--with-included-libunistring,libunistring"
>  PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${
> STAGING_LIBDIR}/..,--disable-curses,ncurses,"
>
>  acpaths = '-I ${S}/gettext-runtime/m4 \
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0ef16e1692c0056362b065
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is causing QA errors:<div><br></div><div><div>ERROR: =
gettext-0.19.8.1-r0 do_package_qa: QA Issue: gettext: /work/corei7-64-poky-=
linux/gettext/0.19.8.1-r0/packages-split/gettext/usr/lib/gettext/hostname c=
ontains probably-redundant RPATH /usr/lib/../lib</div><div>gettext: /work/c=
orei7-64-poky-linux/gettext/0.19.8.1-r0/packages-split/gettext/usr/lib/gett=
ext/urlget contains probably-redundant RPATH /usr/lib/../lib</div><div>gett=
ext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-split/gettext/=
usr/lib/gettext/cldr-plurals contains probably-redundant RPATH /usr/lib/../=
lib</div><div>gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packa=
ges-split/gettext/usr/bin/recode-sr-latin contains probably-redundant RPATH=
 /usr/lib/../lib [useless-rpaths]</div></div><div><br></div><div>Ross</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 Janua=
ry 2018 at 10:52, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:mart=
in.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">* add --with-*-prefix variables t=
o prevent configure trying to search in host paths<br>
* fixes:<br>
=C2=A0 ERROR: This autoconf log indicates errors, it looked at host include=
 and/or library paths while determining system capabilities.<br>
=C2=A0 gettext/0.19.8.1-r0/build/<wbr>gettext-tools/config.log:cc1: warning=
: include location /usr/include/glib-2.0 is unsafe for cross-compilation [-=
Wpoison-system-directories]<br>
<br>
* not sure if it&#39;s worth adding other prefixes for curses related PACKA=
GECONFIG<br>
=C2=A0 PACKAGECONFIG[msgcat-curses] =3D &quot;--with-libncurses-prefix=3D${=
<wbr>STAGING_LIBDIR}/..,--disable-<wbr>curses,ncurses,&quot;<br>
<br>
=C2=A0 --with-libncurses-prefix[=3DDIR]=C2=A0 search for PACKLIBS in DIR/in=
clude and DIR/lib<br>
=C2=A0 --without-libncurses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for =
PACKLIBS in includedir and libdir<br>
=C2=A0 --with-libxcurses-prefix[=3DDIR]=C2=A0 search for PACKLIBS in DIR/in=
clude and DIR/lib<br>
=C2=A0 --without-libxcurses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for =
PACKLIBS in includedir and libdir<br>
=C2=A0 --with-libcurses-prefix[=3DDIR]=C2=A0 search for PACKLIBS in DIR/inc=
lude and DIR/lib<br>
=C2=A0 --without-libcurses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for P=
ACKLIBS in includedir and libdir<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gett<wbr>ext_0.19.8.1.bb</a> | 8 ++++----=
<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a> b/meta=
/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
index 97083c0da2..8a8a34cca8 100644<br>
--- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
+++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
@@ -43,10 +43,10 @@ PACKAGECONFIG ??=3D &quot;croco glib libxml libunistrin=
g&quot;<br>
=C2=A0PACKAGECONFIG_class-native =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
<br>
-PACKAGECONFIG[croco] =3D &quot;--without-included-libcroco,-<wbr>-with-inc=
luded-libcroco,<wbr>libcroco&quot;<br>
-PACKAGECONFIG[glib] =3D &quot;--without-included-glib,--<wbr>with-included=
-glib,glib-2.0&quot;<br>
-PACKAGECONFIG[libxml] =3D &quot;--without-included-libxml,--<wbr>with-incl=
uded-libxml,libxml2&quot;<br>
-PACKAGECONFIG[libunistring] =3D &quot;--without-included-<wbr>libunistring=
,--with-included-<wbr>libunistring,libunistring&quot;<br>
+PACKAGECONFIG[croco] =3D &quot;--with-libcroco-0.6-prefix=3D${<wbr>STAGING=
_LIBDIR}/.. --without-included-libcroco,--<wbr>with-included-libcroco,<wbr>=
libcroco&quot;<br>
+PACKAGECONFIG[glib] =3D &quot;--with-libglib-2.0-prefix=3D${<wbr>STAGING_L=
IBDIR}/.. --without-included-glib,--<wbr>with-included-glib,glib-2.0&quot;<=
br>
+PACKAGECONFIG[libxml] =3D &quot;--with-libxml2-prefix=3D${<wbr>STAGING_LIB=
DIR}/.. --without-included-libxml,--<wbr>with-included-libxml,libxml2&quot;=
<br>
+PACKAGECONFIG[libunistring] =3D &quot;--with-libunistring-prefix=3D${<wbr>=
STAGING_LIBDIR}/.. --without-included-<wbr>libunistring,--with-included-<wb=
r>libunistring,libunistring&quot;<br>
=C2=A0PACKAGECONFIG[msgcat-curses] =3D &quot;--with-libncurses-prefix=3D${<=
wbr>STAGING_LIBDIR}/..,--disable-<wbr>curses,ncurses,&quot;<br>
<br>
=C2=A0acpaths =3D &#39;-I ${S}/gettext-runtime/m4 \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
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

--94eb2c0ef16e1692c0056362b065--
