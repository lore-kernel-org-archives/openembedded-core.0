Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F6BC3A59E
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.23077.1649632146480060465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 16:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eUt4cwQt;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id bn33so18063021ljb.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 16:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ZfaugmgaW3E8gphqZuNU4vjQAFQ00bCkfDgvo8moSc=;
        b=eUt4cwQtLwStgJfeUd3Np9TaH9RZ4CetgtJfQWlxnPC/j8CLUMnENl6r9FP8YSfzrs
         huHLino1/pyRnjjKEv8dyg5iiCODkBVNkDm7TAt/QN4NnhqXGpA/Z0dJtmEJgq22U1iO
         IFXouTmHuk6ePK1tocrJMKtK6eaNCilwizSlv8fAOkp0t/cSkOtVXvrYi4rYbXDcNPPQ
         oAOt5WnscsiL+lN37fIcoyOQY9jRujkHV/NxSfFa6GxPZVGwt3MIpboO7C1CZL8tp7oh
         vc901b3AfiUn0x2sT+FW899nYl3N+b+B8ENSxPYDijubO0zadTdc7Yl6NmIISbsrrUDj
         yuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ZfaugmgaW3E8gphqZuNU4vjQAFQ00bCkfDgvo8moSc=;
        b=KOMPvCULxB5YwulkmMr82YVqwa/byy+AZhUPIKpR2awQewiDbEXhwVNjvDDYF47pFw
         fYBAAAB7HQ6trKPDRr7Wt/coHmE9yByRIrDpKAKEuFWNz+Gg9+rPaNC+2QsIniAuw7ye
         Ark6ba01F5OTdfO//hnnjC+JYJFy1Al7L/Q9RMbm+ERcMsD1OKWKFSjdDAVysnV3hYpR
         My8hfvDafopLHkmQwH5EjYpGkRytbOeBRO1XrkEh8/YM8KWAyinIwOCsLkaO9KUbY+Ps
         zfmKey2kVdnWuLgTHRFGT8XzH8DicXRjKs0X0QPEiXQqEtrzFzmIssissMNUk8sDyhXf
         K9RQ==
X-Gm-Message-State: AOAM5336D1UB24F8oDwA6rr/qBHkd1pZKSvS2X7BfXQ6OASDuRqQi4rl
	ywa0WeYYqKCE7AWgVNveAxsleRJOtt5BnQ5TBts=
X-Google-Smtp-Source: 
 ABdhPJxUfuctHt8wCtsH/kdDQFAjFfmH/mYWy2+KN5BfV1b1ysbPHrYZVsHfNi+IUUKn9lfId2z7lwT2vYETNEbqrlQ=
X-Received: by 2002:a2e:b008:0:b0:24b:4ff2:5e09 with SMTP id
 y8-20020a2eb008000000b0024b4ff25e09mr8860745ljk.28.1649632144597; Sun, 10 Apr
 2022 16:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220410172852.4136-1-f_l_k@t-online.de>
In-Reply-To: <20220410172852.4136-1-f_l_k@t-online.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 11 Apr 2022 00:08:53 +0100
Message-ID: 
 <CANPvuRns76gg7HjdUshmtMAe-D68bhxYJ1-kein3_zuAK9QJnw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] glib-networking: build with gnutls support
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fd257505dc54e9fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164209

--000000000000fd257505dc54e9fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Please use one commit per component as it is easy to describe.

Jose

Markus Volk <f_l_k@t-online.de> escreveu no dia domingo, 10/04/2022 =C3=A0(=
s)
18:29:

> this fixes authentication issues with geary and tls connection
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-core/glib-networking/glib-networking_2.72.0.bb | 2 +-
>  meta/recipes-support/gnutls/gnutls_3.7.4.bb                 | 2 +-
>  meta/recipes-support/p11-kit/p11-kit_0.24.1.bb              | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> index d578f17aa5..73827b0a85 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> @@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0"
>
>  SRC_URI[archive.sha256sum] =3D
> "100aaebb369285041de52da422b6b716789d5e4d7549a3a71ba587b932e0823b"
>
> -PACKAGECONFIG ??=3D "openssl ${@bb.utils.contains('PTEST_ENABLED', '1',
> 'tests', '', d)}"
> +PACKAGECONFIG ??=3D "openssl gnutls ${@bb.utils.contains('PTEST_ENABLED'=
,
> '1', 'tests', '', d)}"
>
>  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Denabled,-Dgnutls=3Ddisabled,gnutls=
"
>  PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> index b34eb7f5f0..c2bb1da8be 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> @@ -27,7 +27,7 @@ SRC_URI[sha256sum] =3D
> "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f62
>
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
>
> -PACKAGECONFIG ??=3D "libidn  ${@bb.utils.filter('DISTRO_FEATURES',
> 'seccomp', d)}"
> +PACKAGECONFIG ??=3D "libidn p11-kit ${@bb.utils.filter('DISTRO_FEATURES'=
,
> 'seccomp', d)}"
>
>  # You must also have CONFIG_SECCOMP enabled in the kernel for
>  # seccomp to work.
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> index 59cbb67961..32c382489e 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "git://
> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps"
>  SRCREV =3D "dd0590d4e583f107e3e9fafe9ed754149da335d0"
>  S =3D "${WORKDIR}/git"
>
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ??=3D "trust-paths"
>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native"
>  PACKAGECONFIG[trust-paths] =3D
> "-Dtrust_paths=3D/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
>
> @@ -29,4 +29,4 @@ FILES:${PN} +=3D " \
>  # PN contains p11-kit-proxy.so, a symlink to a loadable module
>  INSANE_SKIP:${PN} =3D "dev-so"
>
> -BBCLASSEXTEND =3D "nativesdk"
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164204):
> https://lists.openembedded.org/g/openembedded-core/message/164204
> Mute This Topic: https://lists.openembedded.org/mt/90378285/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fd257505dc54e9fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Markus,<div><br></div><div>Please use one commit p=
er component as it is easy=C2=A0to describe.</div><div><br></div><div>Jose<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de=
</a>&gt; escreveu no dia domingo, 10/04/2022 =C3=A0(s) 18:29:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">this fixes authentication iss=
ues with geary and tls connection<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.72.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.72.0.bb</a=
> | 2 +-<br>
=C2=A0meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.4.bb" rel=3D=
"noreferrer" target=3D"_blank">gnutls_3.7.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p11-kit_0.24.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A03 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glib-networking/<a href=3D"http://glib-netwo=
rking_2.72.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.72.=
0.bb</a> b/meta/recipes-core/glib-networking/<a href=3D"http://glib-network=
ing_2.72.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.72.0.=
bb</a><br>
index d578f17aa5..73827b0a85 100644<br>
--- a/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.72.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.72.0.bb</a=
><br>
+++ b/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.72.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.72.0.bb</a=
><br>
@@ -11,7 +11,7 @@ DEPENDS =3D &quot;glib-2.0&quot;<br>
<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;100aaebb369285041de52da422b6b716=
789d5e4d7549a3a71ba587b932e0823b&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;openssl ${@bb.utils.contains(&#39;PTEST_ENABLED&=
#39;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG ??=3D &quot;openssl gnutls ${@bb.utils.contains(&#39;PTEST_E=
NABLED&#39;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[gnutls] =3D &quot;-Dgnutls=3Denabled,-Dgnutls=3Ddisable=
d,gnutls&quot;<br>
=C2=A0PACKAGECONFIG[openssl] =3D &quot;-Dopenssl=3Denabled,-Dopenssl=3Ddisa=
bled,openssl&quot;<br>
diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnutls_3.7.4.bb</a> b/meta/recipes-su=
pport/gnutls/<a href=3D"http://gnutls_3.7.4.bb" rel=3D"noreferrer" target=
=3D"_blank">gnutls_3.7.4.bb</a><br>
index b34eb7f5f0..c2bb1da8be 100644<br>
--- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.4.bb" rel=3D=
"noreferrer" target=3D"_blank">gnutls_3.7.4.bb</a><br>
+++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.4.bb" rel=3D=
"noreferrer" target=3D"_blank">gnutls_3.7.4.bb</a><br>
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] =3D &quot;e6adbebcfbc95867de01060d93c7=
89938cf89cc1d1f6ef9ef661890f62<br>
<br>
=C2=A0inherit autotools texinfo pkgconfig gettext lib_package gtk-doc<br>
<br>
-PACKAGECONFIG ??=3D &quot;libidn=C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEAT=
URES&#39;, &#39;seccomp&#39;, d)}&quot;<br>
+PACKAGECONFIG ??=3D &quot;libidn p11-kit ${@bb.utils.filter(&#39;DISTRO_FE=
ATURES&#39;, &#39;seccomp&#39;, d)}&quot;<br>
<br>
=C2=A0# You must also have CONFIG_SECCOMP enabled in the kernel for<br>
=C2=A0# seccomp to work.<br>
diff --git a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.24.1.=
bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.24.1.bb</a> b/meta/recip=
es-support/p11-kit/<a href=3D"http://p11-kit_0.24.1.bb" rel=3D"noreferrer" =
target=3D"_blank">p11-kit_0.24.1.bb</a><br>
index 59cbb67961..32c382489e 100644<br>
--- a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p11-kit_0.24.1.bb</a><br>
+++ b/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p11-kit_0.24.1.bb</a><br>
@@ -14,7 +14,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/p11-=
glue/p11-kit;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps</a>&q=
uot;<br>
=C2=A0SRCREV =3D &quot;dd0590d4e583f107e3e9fafe9ed754149da335d0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG ??=3D &quot;trust-paths&quot;<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse,libxslt-=
native&quot;<br>
=C2=A0PACKAGECONFIG[trust-paths] =3D &quot;-Dtrust_paths=3D/etc/ssl/certs/c=
a-certificates.crt,,,ca-certificates&quot;<br>
<br>
@@ -29,4 +29,4 @@ FILES:${PN} +=3D &quot; \<br>
=C2=A0# PN contains p11-kit-proxy.so, a symlink to a loadable module<br>
=C2=A0INSANE_SKIP:${PN} =3D &quot;dev-so&quot;<br>
<br>
-BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164204): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164204" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164204</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90378285/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90378285/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000fd257505dc54e9fe--

