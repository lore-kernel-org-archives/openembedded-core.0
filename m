Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FECC77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 15:21:16 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.48532.1682781668470575261
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 08:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=B3rHMOgz;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4ecb137af7eso1199875e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 08:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682781667; x=1685373667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BY+qqEhJAgkBYGp+Scb34n6iok1vzoL9mmq6qn3+vI4=;
        b=B3rHMOgzU913AqnT5uwge42Cv+CXZfDN9KQFy5yu0o+hm80D53EGlOVhAEslaHs/If
         Hk6sFn8Q1Yz5UtBVH0tb4vxxnaLfoZXki6+K1+SoFO1x8gHX9whxjyxYOkyZlSultfbS
         kS4mNUjWWwLvn26X4H82meGRhuTklnEhuu52zBmoAYMHMQgzfaYkiFH1PV/x5LUAMQYO
         YK86R872Hq2p0peGRxHsbEa5XAzLNGtnA87gENP9pPNMofpuwQiKUXeZF+mJxbYx+Q6J
         B6SlOOslywz9LF1vZmewOJuogoGSkPaPP4A85dCaf6XdXHv5SSJzKX205Dv3eVJAS/Jn
         1Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682781667; x=1685373667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BY+qqEhJAgkBYGp+Scb34n6iok1vzoL9mmq6qn3+vI4=;
        b=lyQp9gCBJfdZ4AbDnqhlWc4BgAxXg/wX0gXB35Eu69BAa0EFBLZDAfkjGXNmJF//Gx
         2du6r1CAyIo2uAi8lE6DdDz3Dmklk+RKyOa8CJkvqXsTaS1laLiGrQseHqc6BPU0BoEp
         QmioDv1Om8/MQgL2o5vD0DqotkEErXLLUjAXDvI9sb13DDa2YdKUsL5TRx2qt/SGeXrM
         yKNPePHur7ZPpD0LeRBLs4S3Ja1lANbHnX5C8NpFnx2+R/q7lEOZJAAHx9Bh4wjOdq/V
         UcjknalNwWwnGuqOHdQPr2RWu4lCHkTJoi6d8/TbhSkxIElO3NUr6GwWI9tll+yTFygb
         frZw==
X-Gm-Message-State: AC+VfDzyey1hy9QVobOVrnkaGEcX6GZh48WiNkL0f7UfjTo8hjK4T+vU
	z21qbgxxTbqS/XzP/bvsjTKy9V2q1fahrjvkH8A=
X-Google-Smtp-Source: ACHHUZ7FHHiCioo4MNYcRn+V+l/4h06VD+aFxmpAv82PcCvp2HaS5K4WP0c3GvvBqLGpmR5g4MkPdsYQgUx+ywQaqHY=
X-Received: by 2002:ac2:4579:0:b0:4ec:a0e8:9efc with SMTP id
 k25-20020ac24579000000b004eca0e89efcmr2381258lfm.29.1682781666336; Sat, 29
 Apr 2023 08:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230429150611.1521134-1-raj.khem@gmail.com>
In-Reply-To: <20230429150611.1521134-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Apr 2023 17:20:55 +0200
Message-ID: <CANNYZj-xUm84mDJch71_MS4GeAMd3EjMCh-whN9K3yOHvVnHmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apt: Use a valid download location for 2.4.5
 release tarball
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000074e5ac05fa7b2372"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 15:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180542

--00000000000074e5ac05fa7b2372
Content-Type: text/plain; charset="UTF-8"

Does the upstream version check still work?

Alex

On Sat 29. Apr 2023 at 17.06, Khem Raj <raj.khem@gmail.com> wrote:

> Fixes
> WARNING: apt-2.4.5-r0 do_fetch: Failed to fetch URL
> http://ftp.debian.org/debian/pool/main/a/apt/apt_2.4.5.tar.xz, attempting
> MIRRORS if available
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/apt/apt_2.4.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb
> b/meta/recipes-devtools/apt/apt_2.4.5.bb
> index 429cf6e659..b2b41ab661 100644
> --- a/meta/recipes-devtools/apt/apt_2.4.5.bb
> +++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
> @@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
>  SECTION = "base"
>
>  # Triehash script taken from https://github.com/julian-klode/triehash
> -SRC_URI <https://github.com/julian-klode/triehash-SRC_URI> =
> "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
> +SRC_URI = "
> https://launchpad.net/debian/+archive/primary/+sourcefiles/${BPN}/${PV}/${BPN}_${PV}.tar.xz
> <https://launchpad.net/debian/+archive/primary/+sourcefiles/$%7BBPN%7D/$%7BPV%7D/$%7BBPN%7D_$%7BPV%7D.tar.xz>
> \
>             file://triehash \
>             file://0001-Disable-documentation-directory-altogether.patch \
>             file://0001-Fix-musl-build.patch \
> --
> 2.40.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180541):
> https://lists.openembedded.org/g/openembedded-core/message/180541
> Mute This Topic: https://lists.openembedded.org/mt/98578451/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000074e5ac05fa7b2372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Does the upstream version check still work?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 29. Apr 2023 at 17.06=
, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">Fixes<br>
WARNING: apt-2.4.5-r0 do_fetch: Failed to fetch URL <a href=3D"http://ftp.d=
ebian.org/debian/pool/main/a/apt/apt_2.4.5.tar.xz" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.debian.org/debian/pool/main/a/apt/apt_2.4.5.tar.xz<=
/a>, attempting MIRRORS if available<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/apt/<a href=3D"http://apt_2.4.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">apt_2.4.5.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/apt/<a href=3D"http://apt_2.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">apt_2.4.5.bb</a> b/meta/recipes-devtools/=
apt/<a href=3D"http://apt_2.4.5.bb" rel=3D"noreferrer" target=3D"_blank">ap=
t_2.4.5.bb</a><br>
index 429cf6e659..b2b41ab661 100644<br>
--- a/meta/recipes-devtools/apt/<a href=3D"http://apt_2.4.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">apt_2.4.5.bb</a><br>
+++ b/meta/recipes-devtools/apt/<a href=3D"http://apt_2.4.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">apt_2.4.5.bb</a><br>
@@ -5,7 +5,7 @@ LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0SECTION =3D &quot;base&quot;<br>
<br>
=C2=A0# Triehash script taken from <a href=3D"https://github.com/julian-klo=
de/triehash-SRC_URI" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/julian-klode/triehash<br>
-SRC_URI</a> =3D &quot;${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \<br=
>
+SRC_URI =3D &quot;<a href=3D"https://launchpad.net/debian/+archive/primary=
/+sourcefiles/$%7BBPN%7D/$%7BPV%7D/$%7BBPN%7D_$%7BPV%7D.tar.xz" rel=3D"nore=
ferrer" target=3D"_blank">https://launchpad.net/debian/+archive/primary/+so=
urcefiles/${BPN}/${PV}/${BPN}_${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://triehash \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-documentation=
-directory-altogether.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-musl-build.patch =
\<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180541): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180541" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180541</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98578451/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98578451/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000074e5ac05fa7b2372--

