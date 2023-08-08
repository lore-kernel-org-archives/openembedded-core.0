Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C45C001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 23:02:23 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.76433.1691535740364246033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 16:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AzXwcA0t;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4476a50c64bso2152110137.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691535739; x=1692140539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gcAeBOFgLCReevhMkoqdtZI78vO9JWzgHa+u8dvEbI0=;
        b=AzXwcA0tVXB0sOFC9miwDWn0QS+L7SnW+xgXH6ymDBWL29cMjeKlT0DhYbkKZZetAi
         Ul6Tv8JVlOtSEtwa+23iQJOYXGQPLx8ZwibWevgUoat6SByWLRvGsImfduobZqJrrWnu
         GZf0HPaYpmJINRh6XBx5JFhcIminV0PU7yAVNHoYx7z2YzRkJ7rHm0KcTAStKkiZGGB5
         /obdPkyrC37UgRt+1wDVofjKT7a3WnZcnEOLY58NVPimrNQynp538BoGJ6pvKz/jOENV
         Tye0nbCNfIN8BdnoPj9QN4vlXB5GggiL/nbayS/p4jn8WNrar3fK+OQ5UVnqF8XHBa+j
         +yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691535739; x=1692140539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcAeBOFgLCReevhMkoqdtZI78vO9JWzgHa+u8dvEbI0=;
        b=JGhq6HEu0si6OtCO6Lh1s2zY8HPKc91mk/IctO1Ic9TmMfOtmByadI0DsuyjO/ydih
         V19fdYb+kAyt2Ay63hcwNwE8ZVCCSBROhGh7ZwUI9cD35CF9nrYXcNIHBG+yTSdOnZmf
         UDgZ/q1lPTWVVsrXa7eeJDa/fHGz3EDbWRzrvFpwDU86mOv4l5vQximb20hnkBxuhCQM
         SMEHwPdp3c6EaXyx1rprhlXOnYnoNqSyTGjQ6lcDKUZJzZSUF2CqulhimnQX7jN8NMOZ
         3g0ZbsFQurWkXJvaBM5IsaOxzOXTYCfK67NqMosYOtYu3Z+2sygFDD1oBfzHXRi2UihQ
         rolQ==
X-Gm-Message-State: AOJu0Yz4rgMq1784apk3ARZe/fbcXjXI5VVczY/SXN/JqUmEWezGlrbi
	oK150VbqGuoP3Lcr6ZnV8Ug//ifdg3IwRrjOWyM=
X-Google-Smtp-Source: AGHT+IHA2XTPoj7YZ/P546y92pqoSPLxwOW7vZxVm+zv0kaH/mohMla3NidddfDthVjx9mUM+c5wSjHDlHUaz+eLpoY=
X-Received: by 2002:a67:e3c4:0:b0:446:a477:804b with SMTP id
 k4-20020a67e3c4000000b00446a477804bmr1307772vsm.11.1691535739276; Tue, 08 Aug
 2023 16:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <1779200FA9E646B9.10230@lists.openembedded.org>
In-Reply-To: <1779200FA9E646B9.10230@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 9 Aug 2023 00:02:08 +0100
Message-ID: <CANPvuR=Z0GVLXWLLm2LciS2FumJFRRCyAdovQHeTPjod3VS==g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: fix efi dependency
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000dd541d0602715a90"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 23:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185679

--000000000000dd541d0602715a90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping!

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia segunda, 7/08/2023 =C3=A0=
(s)
15:26:

> Last version of systemd dpends now on pyelftools to build the efi support
> but the required tool is the native ones and not the target.
> The systemd-boot has the corrected dependencie so fix this in the main
> recipe.
>
> | Program python3 (jinja2) found: YES
> (/build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/recipe-sysroot-=
native/usr/bin/python3-native/python3)
> modules: jinja2
> | Checking if "32bit build possible" : links: NO
> | Program python3 (elftools) found: NO
> |
> | ../git/meson.build:2147:8: ERROR: Problem encountered: EFI bootloader
> support requires pyelftools.
> |
> | A full log can be found at
> /build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/build/meson-logs=
/meson-log.txt
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-core/systemd/systemd_254.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_254.bb
> b/meta/recipes-core/systemd/systemd_254.bb
> index ea1a4f02f0..cd2a021da2 100644
> --- a/meta/recipes-core/systemd/systemd_254.bb
> +++ b/meta/recipes-core/systemd/systemd_254.bb
> @@ -142,7 +142,7 @@ PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=3Dt=
rue
> -Ddefault-compression=3Dlz4,,
>  PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue
> -Ddefault-compression=3Dxz,,xz"
>  PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue
> -Ddefault-compression=3Dzstd,,zstd"
>  PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
> -PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfalse
> -Dbootloader=3Dfalse,python3-pyelftools"
> +PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfalse
> -Dbootloader=3Dfalse,python3-pyelftools-native"
>  PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfuti=
ls"
>  PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
>  PACKAGECONFIG[repart] =3D "-Drepart=3Dtrue,-Drepart=3Dfalse"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185603):
> https://lists.openembedded.org/g/openembedded-core/message/185603
> Mute This Topic: https://lists.openembedded.org/mt/100600508/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000dd541d0602715a90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ping!</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailt=
o:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt=
; escreveu no dia segunda, 7/08/2023 =C3=A0(s) 15:26:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Last version of systemd dpends now on=
 pyelftools to build the efi support<br>
but the required tool is the native ones and not the target.<br>
The systemd-boot has the corrected dependencie so fix this in the main reci=
pe.<br>
<br>
| Program python3 (jinja2) found: YES (/build/tmp-lmp/work/corei7-64-lmp-li=
nux/systemd/1_254-r0/recipe-sysroot-native/usr/bin/python3-native/python3) =
modules: jinja2<br>
| Checking if &quot;32bit build possible&quot; : links: NO<br>
| Program python3 (elftools) found: NO<br>
|<br>
| ../git/meson.build:2147:8: ERROR: Problem encountered: EFI bootloader sup=
port requires pyelftools.<br>
|<br>
| A full log can be found at /build/tmp-lmp/work/corei7-64-lmp-linux/system=
d/1_254-r0/build/meson-logs/meson-log.txt<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_254.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_254.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_254.bb</a> b/meta/recipes-core/s=
ystemd/<a href=3D"http://systemd_254.bb" rel=3D"noreferrer" target=3D"_blan=
k">systemd_254.bb</a><br>
index ea1a4f02f0..cd2a021da2 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_254.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_254.bb</a><br>
@@ -142,7 +142,7 @@ PACKAGECONFIG[default-compression-lz4] =3D &quot;-Dlz4=
=3Dtrue -Ddefault-compression=3Dlz4,,<br>
=C2=A0PACKAGECONFIG[default-compression-xz] =3D &quot;-Dxz=3Dtrue -Ddefault=
-compression=3Dxz,,xz&quot;<br>
=C2=A0PACKAGECONFIG[default-compression-zstd] =3D &quot;-Dzstd=3Dtrue -Ddef=
ault-compression=3Dzstd,,zstd&quot;<br>
=C2=A0PACKAGECONFIG[dbus] =3D &quot;-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus&quot;=
<br>
-PACKAGECONFIG[efi] =3D &quot;-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfals=
e -Dbootloader=3Dfalse,python3-pyelftools&quot;<br>
+PACKAGECONFIG[efi] =3D &quot;-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfals=
e -Dbootloader=3Dfalse,python3-pyelftools-native&quot;<br>
=C2=A0PACKAGECONFIG[elfutils] =3D &quot;-Delfutils=3Dtrue,-Delfutils=3Dfals=
e,elfutils&quot;<br>
=C2=A0PACKAGECONFIG[firstboot] =3D &quot;-Dfirstboot=3Dtrue,-Dfirstboot=3Df=
alse&quot;<br>
=C2=A0PACKAGECONFIG[repart] =3D &quot;-Drepart=3Dtrue,-Drepart=3Dfalse&quot=
;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185603): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185603" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185603</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100600508/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100600508/5052612</a><br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000dd541d0602715a90--

