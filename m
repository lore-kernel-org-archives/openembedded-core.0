Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web12.12227.1608399948766905705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 09:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rz0xwIIg;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id j140so3168954vsd.4
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7Tsx77MYnrousrEwZQxkgyeyW4gy0ABTqIg/pTTTYM=;
        b=Rz0xwIIgY5VrhqCq0qHB0/YjKuRboA6Dsd0KPmwVukNjwZ8PkipQG+Z07Yn5v5qQqV
         yFp5PTbj+sQR8GaifzYSHKtojUM/6HixXiw3EjYWI9VRkzPLx2il/ILzP4WuYljqU28g
         DUlH6pLZyYsSSimg5Ux5KoEKfwfSHCGQoi6pcsVojun4dCOgko/XdE6dSWD4CwqeFOeR
         /FtkoeNv4srRxA3dW+aAOCYC5KbyLMMPqOLxY/mktS95aUTgwYUOTSAyopXk9+Y7VZtv
         ggciTVyYS1PlQIlKV22N4hGBNTi6j+ik4XYoUipbaoqDxsRkw2O1VrQLN5bDyXA22LVu
         BfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7Tsx77MYnrousrEwZQxkgyeyW4gy0ABTqIg/pTTTYM=;
        b=QFzUO3qVAV7FpTM534QUwyw3HtVMoYq4EeVK03KzV9gxkPCWTCjfatrxbzg/HPgmD1
         VoB8aolvuGK5dAiB5kffkWveexiSfnDUcnRmcKpd0jqjyQ1Cqp4YG7SjoQXnLreSdRC7
         sppSdGKKlR6Zg6SdrbciyJINMXOXhGBBTck7JqmGt5b1g9nQ1gO2sliBDDO0vqkQX+YY
         4j69Z9ikDNLi+96NdyWFRBb70Yd0SKqiHznwq+SwFXp5Az4dI1kqoP27yBJ/mXc13XlL
         jwjFXuk9z63ca21OEFv7fMEN+4ZWdXivWN0EkKckjLex9F+KOvv0tgM0RkF5FO9bn492
         pD6Q==
X-Gm-Message-State: AOAM530ZKpG4NK6thKkPH7A2M4jueUjy2pHEGjcJRvgzaNoYTarEZNO5
	2vnB3SCAiuFmyJEMf2l1ZUhfIFXspzpCBv90rOc=
X-Google-Smtp-Source: ABdhPJwLzBBMCflWlAwr2bpj/51HQbslYUKeHRj2646IBEOsj3Bv+n7JUdXQaCpdeFMxv68rVDguNJdPmEbifJ+ZeXU=
X-Received: by 2002:a67:6044:: with SMTP id u65mr8684718vsb.31.1608399947865;
 Sat, 19 Dec 2020 09:45:47 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
In-Reply-To: <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 19 Dec 2020 18:45:36 +0100
Message-ID: <CANNYZj9YhbVH+r-wC71nuj4p94MBhmrE13KGtKh-rced6fqVKg@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: Shachar Menashe <shachar@vdoo.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000008ca32405b6d4cbac"

--0000000000008ca32405b6d4cbac
Content-Type: text/plain; charset="UTF-8"

What version of oe-core does this target? master already has 1.1.1i.

Also, I have doubts whether we should maintain 'deprecated crypto' lists,
as we are not qualified to judge what is deprecated, and crucially, keep
the list correctly updated. Isn't openssl upstream supposed to make those
decisions?

Alex

On Sat, 19 Dec 2020 at 18:36, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The OE-Core list needs to be included on this so I'm doing so.
>
> Cheers,
>
> Richard
>
>
>
> ---------- Forwarded message ----------
> From: Shachar Menashe <shachar@vdoo.com>
> To: "yocto-security@lists.yoctoproject.org" <
> yocto-security@lists.yoctoproject.org>
> Cc:
> Bcc:
> Date: Sat, 19 Dec 2020 16:04:30 +0000
> Subject: [yocto-security] [PATCH] openssl: drop support for deprecated
> algorithms
> 1. Drop support for many deprecated algorithms by default
> 2. Allow dropping support for TLS 1.0/1.1 via PACKAGECONFIG
>
> Signed-off-by: Shachar Menashe <shachar@vdoo.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> index 8159558..f9764bd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> @@ -33,6 +33,8 @@ PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>
>  PACKAGECONFIG[cryptodev-linux] =
> "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> +PACKAGECONFIG[no-tls1] = "no-tls1"
> +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
>
>  B = "${WORKDIR}/build"
>  do_configure[cleandirs] = "${B}"
> @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk =
> "--with-rand-seed=os,devrandom"
>  CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin
> -DENGINESDIR=/not/builtin"
>  CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin
> -DENGINESDIR=/not/builtin"
>
> +# Disable deprecated crypto algorithms
> +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
> +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5
> no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash
> no-sm2 no-sm3 no-sm4 no-whirlpool"
> +
>  do_configure () {
>         os=${HOST_OS}
>         case $os in
> @@ -122,7 +128,7 @@ do_configure () {
>         # WARNING: do not set compiler/linker flags (-I/-D etc.) in
> EXTRA_OECONF, as they will fully replace the
>         # environment variables set by bitbake. Adjust the environment
> variables instead.
>         HASHBANGPERL="/usr/bin/env perl" PERL=perl
> PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
> -       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
> --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir}
> $target
> +       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
> ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix
> --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
>         perl ${B}/configdata.pm --dump
>  }
>
> --
> 2.17.1
>
> 
>
>

--0000000000008ca32405b6d4cbac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What version of oe-core does this target? master alre=
ady has 1.1.1i.</div><div><br></div><div>Also, I have doubts whether we sho=
uld maintain &#39;deprecated crypto&#39; lists, as we are not qualified to =
judge what is deprecated, and crucially, keep the list correctly updated. I=
sn&#39;t openssl upstream supposed to make those decisions?</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, 19 Dec 2020 at 18:36, Richard Purdie &lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfou=
ndation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">The OE-Core list needs to be included on this so I&#39;m doing =
so.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br><br><br>---------- Forwarded message ----------<br>From:=C2=A0Shachar =
Menashe &lt;<a href=3D"mailto:shachar@vdoo.com" target=3D"_blank">shachar@v=
doo.com</a>&gt;<br>To:=C2=A0&quot;<a href=3D"mailto:yocto-security@lists.yo=
ctoproject.org" target=3D"_blank">yocto-security@lists.yoctoproject.org</a>=
&quot; &lt;<a href=3D"mailto:yocto-security@lists.yoctoproject.org" target=
=3D"_blank">yocto-security@lists.yoctoproject.org</a>&gt;<br>Cc:=C2=A0<br>=
Bcc:=C2=A0<br>Date:=C2=A0Sat, 19 Dec 2020 16:04:30 +0000<br>Subject:=C2=A0[=
yocto-security] [PATCH] openssl: drop support for deprecated algorithms<br>=
1. Drop support for many deprecated algorithms by default<br>
2. Allow dropping support for TLS 1.0/1.1 via PACKAGECONFIG<br>
<br>
Signed-off-by: Shachar Menashe &lt;<a href=3D"mailto:shachar@vdoo.com" tar=
get=3D"_blank">shachar@vdoo.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1g.b=
b" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1g.bb</a> | 8 +++++++-<=
br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1=
.1.1g.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1g.bb</a> b/meta=
/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1g.bb" rel=3D"n=
oreferrer" target=3D"_blank">openssl_1.1.1g.bb</a><br>
index 8159558..f9764bd 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1g.b=
b" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1g.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1g.b=
b" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1g.bb</a><br>
@@ -33,6 +33,8 @@ PACKAGECONFIG_class-native =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[cryptodev-linux] =3D &quot;enable-devcryptoeng,disable=
-devcryptoeng,cryptodev-linux,,cryptodev-module&quot;<br>
+PACKAGECONFIG[no-tls1] =3D &quot;no-tls1&quot;<br>
+PACKAGECONFIG[no-tls1_1] =3D &quot;no-tls1_1&quot;<br>
<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
=C2=A0do_configure[cleandirs] =3D &quot;${B}&quot;<br>
@@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk =3D &quot;--with-rand-seed=
=
=3Dos,devrandom&quot;<br>
=C2=A0CFLAGS_append_class-native =3D &quot; -DOPENSSLDIR=3D/not/builtin -D=
ENGINESDIR=3D/not/builtin&quot;<br>
=C2=A0CFLAGS_append_class-nativesdk =3D &quot; -DOPENSSLDIR=3D/not/builtin=
 -DENGINESDIR=3D/not/builtin&quot;<br>
<br>
+# Disable deprecated crypto algorithms<br>
+# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)<br>
+DEPRECATED_CRYPTO_FLAGS =3D &quot; no-ssl no-idea no-psk no-rc2 no-rc4 no=
-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-si=
phash no-sm2 no-sm3 no-sm4 no-whirlpool&quot;<br>
+<br>
=C2=A0do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 os=3D${HOST_OS}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $os in<br>
@@ -122,7 +128,7 @@ do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # WARNING: do not set compiler/linker flags (-=
I/-D etc.) in EXTRA_OECONF, as they will fully replace the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # environment variables set by bitbake. Adjust=
 the environment variables instead.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HASHBANGPERL=3D&quot;/usr/bin/env perl&quot; P=
ERL=3Dperl PERL5LIB=3D&quot;${S}/external/perl/Text-Template-1.46/lib/&quot=
; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGEC=
ONFIG_CONFARGS} --prefix=3D$useprefix --openssldir=3D${libdir}/ssl-1.1 --li=
bdir=3D${libdir} $target<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGEC=
ONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=3D$useprefix --openssld=
ir=3D${libdir}/ssl-1.1 --libdir=3D${libdir} $target<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 perl ${B}/<a href=3D"http://configdata.pm" rel=
=
=3D"noreferrer" target=3D"_blank">configdata.pm</a> --dump<br>
=C2=A0}<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008ca32405b6d4cbac--
