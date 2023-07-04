Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1463FEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 09:03:38 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.54579.1688461411750495015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 02:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qytF4LLZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4435c233fa4so1057430137.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688461411; x=1691053411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V8AjFITyI1fbQrQzmcFGxb8Ds2T5BfIi2nHwJx/OQsE=;
        b=qytF4LLZBNHpnmJgwBzkdN/XXplK20djhaEGh1/RewSf4zFxpb4ZAt81UXJC5cwQly
         wceAxBDFh+OPVbr/0Bh1Qx3h9Lib8uyOXt8cb0etWMPU3yG4MIJbVsUr9xK/hdXRuALo
         1BVLyrC7JJgVNafvBbc5Y1Be6uM8uFw6tH08KuVbZTsIoKhPZYOUX/6XIrclNGakpF3d
         CYkr06C4zuir61C8GlPBQDvPe3oaZy9VWLVRgHZ+0ieCoBBX6O3Xl7b6Pn993lxxquCM
         NqxQPocxwrvY6rsMEZWx3bVEWPQg65i+7v7e1LhT2M69X30pVQmoeFx/ksBavd/+Uf7x
         Od/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688461411; x=1691053411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8AjFITyI1fbQrQzmcFGxb8Ds2T5BfIi2nHwJx/OQsE=;
        b=e4l9Bc2ofbWRyVdlpbKEJz3mHneNBl56W3U6p04no7kcGj/MMjX9QjqZKqJ/vW1rUo
         ojmOqsF+R2rdzXiZDHGJpJ8jLPu1WeEZZxJhgDfEfdP+J2FHgEGNDRsC6Uoyb6rBIBz3
         4eUbYU+SRxH14jsFiba+NepXl4t3/rMnDm0KxQoQYwRwrGus1vNdZoZeN79VU6owz+FR
         tVsaw4Efb/KPcO1bR3U3pPVonLpXSM/ABqYpxixf0gsHx8F38afU6xF+V6FjKasG16ph
         w5UL8qv8zUXsUdTlu/bVYB6eNYKr/Rd8bIT2jOYgcwDB4Byiu/GpffZOLNDDbFs5vHei
         kUDA==
X-Gm-Message-State: ABy/qLa64ECUuwDLSDFYnJG7hi/ZoQnc3A6Vod077S0SGJQVAK3mWKuA
	b+RO9BGsUSL6V9gKgWnBOJ1BzhFQQAc+RPpaSio=
X-Google-Smtp-Source: APBJJlFLqe4roXym/HeNSLQnFsp2N4ZhXQLN94Y2nvKHKHj/GA5pba8r4zh7gUqdNLgN38um98yyOs7ATskLP7Ya/GI=
X-Received: by 2002:a05:6102:386:b0:443:5b1f:12e4 with SMTP id
 m6-20020a056102038600b004435b1f12e4mr3731299vsq.9.1688461410666; Tue, 04 Jul
 2023 02:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <176D7A91B0AC29AF.23465@lists.openembedded.org>
In-Reply-To: <176D7A91B0AC29AF.23465@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 4 Jul 2023 10:03:19 +0100
Message-ID: <CANPvuRnKUisRu9CgkQgv2d1WAr1+hmC_1yr8orLToPw3tcMqmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split add systemd modulesloaddir
 and modprobedir config
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000998ba105ffa58ed5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 09:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183818

--000000000000998ba105ffa58ed5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

gentle ping

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia sexta, 30/06/2023 =C3=A0(=
s)
16:50:

> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes-recipe/kernel-module-split.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 0e4f9a6ec3..c1208d55e0 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -30,8 +30,8 @@ fi
>
>  PACKAGE_WRITE_DEPS +=3D "kmod-native depmodwrapper-cross"
>
> -modulesloaddir ??=3D "${sysconfdir}/modules-load.d"
> -modprobedir ??=3D "${sysconfdir}/modprobe.d"
> +modulesloaddir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${nonarch_libdir}', '${sysconfdir}', d)}/modules-load.d"
> +modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${nonarch_base_libdir}', '${sysconfdir}', d)}/modprobe.d"
>
>  KERNEL_SPLIT_MODULES ?=3D "1"
>  PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183704):
> https://lists.openembedded.org/g/openembedded-core/message/183704
> Mute This Topic: https://lists.openembedded.org/mt/99875687/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000998ba105ffa58ed5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"color:rgb(0,0,0)"><span cl=
ass=3D"gmail-il">gentle</span>=C2=A0<span class=3D"gmail-il">ping</span></p=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>Jose Quaresma via <a href=3D"http://lists.openembedded.org" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.=
com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.=
org</a>&gt; escreveu no dia sexta, 30/06/2023 =C3=A0(s) 16:50:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Jose Quaresma=
 &lt;<a href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">jose.q=
uaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-module-split.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes=
-recipe/kernel-module-split.bbclass<br>
index 0e4f9a6ec3..c1208d55e0 100644<br>
--- a/meta/classes-recipe/kernel-module-split.bbclass<br>
+++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
@@ -30,8 +30,8 @@ fi<br>
<br>
=C2=A0PACKAGE_WRITE_DEPS +=3D &quot;kmod-native depmodwrapper-cross&quot;<b=
r>
<br>
-modulesloaddir ??=3D &quot;${sysconfdir}/modules-load.d&quot;<br>
-modprobedir ??=3D &quot;${sysconfdir}/modprobe.d&quot;<br>
+modulesloaddir ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;systemd&#39;, &#39;${nonarch_libdir}&#39;, &#39;${sysconfdir}&#39;, d=
)}/modules-load.d&quot;<br>
+modprobedir ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;systemd&#39;, &#39;${nonarch_base_libdir}&#39;, &#39;${sysconfdir}&#39;,=
 d)}/modprobe.d&quot;<br>
<br>
=C2=A0KERNEL_SPLIT_MODULES ?=3D &quot;1&quot;<br>
=C2=A0PACKAGESPLITFUNCS =3D+ &quot;split_kernel_module_packages&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183704): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183704" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183704</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99875687/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99875687/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--000000000000998ba105ffa58ed5--

