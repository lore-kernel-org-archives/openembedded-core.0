Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F447C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 00:44:11 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.91532.1670978650299686474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 16:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gu5wVICR;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id a16so20347580edb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 16:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i2v+pTTp/Kb9x4QJzYuWrvKraZySgFeVMwnhn2LNJlc=;
        b=gu5wVICRy17Y76vWTHNgbNfX2TTBexmXAooZ1xCzOtq7JzFdnsFzHLGgmVENobO767
         YU+RM3rlHealY0J8NaWzGIRJDAoUvTfOW0b7lmwhvLVhFryqYoTAaGWD50VmV8ysfUqH
         rCvLQmN3uqRI7S7g5qlOPl7zZJavviFQtIF+DiHZwDwl4h9Au88Ey9z617bCNf0mLoWy
         VB0zjVf+CQ0kExVhnkTjTaPqEgHrGq0BT4xfdmQF2x7WdX4v4LNaSBOBvisNesSufqoN
         d/Nb8HVejHq3oMhyYwv6OZrwYdignMlzXFmeCDPPs0B0CIXayZ/2BLWb34jXAFx0djp9
         TzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2v+pTTp/Kb9x4QJzYuWrvKraZySgFeVMwnhn2LNJlc=;
        b=JpwE29kso4onqNkuvxXDERKFYenb4m2AJN+GQT4Bc7QXHHkYjkAStvaU2zicVfNYIG
         vG4BU7O3lNoW6wZDI8snnofrK3llxcFFKKF9L/sMh9SPDgdvxF87cQc+7sS5a3M20z5T
         5AlHmbjZ+Ft3Rzw37B/1rdku28S/CDX/9hJZam9wLo6i/sHDetNAXPrJS4dXW6Jkxppf
         oijlvz8cF6uLTLYFg03H4SeFc0UwTVwfSyfhLTyvUz5Be6C5sYiefTKx60+SbiWsaxBa
         iF4h+8YID3LCQGcy2djh9ubPfi5tgQxsnS1STsmWpuN4gfR/guC+PnwlkibIxreKRtoH
         rv7Q==
X-Gm-Message-State: ANoB5plP7GS9Qj/GJlgbIAC/CCFSJ7euDPrlCwwxdXh/9tSmfQ93Z5CP
	3lgRkx5ovN4vsvdN7e2h01Xp4Xr0uZEjeFImksE=
X-Google-Smtp-Source: AA0mqf6VimOFkwxIV/tnd14D4WvAmGkhoPYfREPneCAsqOUkYiofiZOElzVaqTXQWzXHlUPnoqkKbHPWlwg0Ds4Nkws=
X-Received: by 2002:a05:6402:59:b0:46f:dac1:82e7 with SMTP id
 f25-20020a056402005900b0046fdac182e7mr1027828edu.105.1670978648397; Tue, 13
 Dec 2022 16:44:08 -0800 (PST)
MIME-Version: 1.0
References: <20221213111118.149697-1-alex@linutronix.de> <20221213111118.149697-6-alex@linutronix.de>
In-Reply-To: <20221213111118.149697-6-alex@linutronix.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 13 Dec 2022 16:43:57 -0800
Message-ID: <CANx9H-DpJD=DVadew-BeAfhcTC9dqrEWbtx2WxFFCMBUPoXU0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/24] python3-poetry-core: update 1.3.2 -> 1.4.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3dd6005efbf08c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 00:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174547

--000000000000c3dd6005efbf08c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 3:11 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Upstream has changed the tarball and the dir inside it to poetry_core
> (with underscore).
>
> License-Update: formatting, copyright years.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...-poetry-core_1.3.2.bb =3D> python3-poetry-core_1.4.0.bb} | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-poetry-core_1.3.2.bb =3D>
> python3-poetry-core_1.4.0.bb} (84%)
>
> diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb
> b/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
> similarity index 84%
> rename from meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb
> rename to meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
> index 1b6c76323b..22a6a2a477 100644
> --- a/meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb
> +++ b/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
> @@ -10,19 +10,21 @@ LIC_FILES_CHKSUM =3D "\
>
>  file://src/poetry/core/_vendor/attr/_version_info.py;beginline=3D1;endli=
ne=3D1;md5=3Db2dccaa94b3629a08bfb4f983cad6f89
> \
>
>  file://src/poetry/core/_vendor/attrs/LICENSE;md5=3D5e55731824cf9205cfabe=
ab9a0600887
> \
>
>  file://src/poetry/core/_vendor/jsonschema/COPYING;md5=3D7a60a81c146ec255=
99a3e1dabb8610a8
> \
> -
> file://src/poetry/core/_vendor/lark/LICENSE;md5=3Db37b83a9cf129d92ee65aaa=
71c01ce72
> \
> +
> file://src/poetry/core/_vendor/lark/LICENSE;md5=3Dfcfbf1e2ecc0f37acbb5871=
aa0267500
> \
>
>  file://src/poetry/core/_vendor/packaging/LICENSE;md5=3Dfaadaedca9251a90b=
205c9167578ce91
> \
>
>  file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=3D2ee41112a4=
4fe7014dce33e26468ba93
> \
>
>  file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=3D7bef9bf4a8e42=
63634d0597e7ba100b8
> \
>
>  file://src/poetry/core/_vendor/pyparsing/LICENSE;md5=3D657a566233888513e=
1f07ba13e2f47f1
> \
>
>  file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=3Db695eb9c6e7a=
6fb1b1bc2d193c42776e
> \
>
>  file://src/poetry/core/_vendor/tomlkit/LICENSE;md5=3D31aac0dbc1babd278d5=
386dadb7f8e82
> \
> -
> file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=3D64fc2b30b6=
7d0a8423c250e0386ed72f
> \
> +
> file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=3Df16b323917=
992e0f8a6f0071bc9913e2
> \
>  "
>
> -SRC_URI[sha256sum] =3D
> "0ab006a40cb38d6a38b97264f6835da2f08a96912f2728ce668e9ac6a34f686f"
> +SRC_URI[sha256sum] =3D
> "514bd33c30e0bf56b0ed44ee15e120d7e47b61ad908b2b1011da68c48a84ada9"
>
>  inherit python_poetry_core pypi
> +PYPI_ARCHIVE_NAME =3D "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
> +S =3D "${WORKDIR}/poetry_core-${PV}"
>

Thank you. I had this staged but my local tests showed =E2=80=98devtool
check-upgrade-status=E2=80=99 went wonky.

I appreciate you keeping us up to date.


>  RDEPENDS:${PN}:append:class-target =3D "\
>      python3-compression \
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174516):
> https://lists.openembedded.org/g/openembedded-core/message/174516
> Mute This Topic: https://lists.openembedded.org/mt/95642216/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c3dd6005efbf08c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 13, 2022 at 3:11 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">Upstream has changed the tarball and the dir insi=
de it to poetry_core<br>
(with underscore).<br>
<br>
License-Update: formatting, copyright years.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0...-<a href=3D"http://poetry-core_1.3.2.bb" rel=3D"noreferrer" target=
=3D"_blank">poetry-core_1.3.2.bb</a> =3D&gt; <a href=3D"http://python3-poet=
ry-core_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_=
1.4.0.bb</a>} | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-poetry=
-core_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.=
3.2.bb</a> =3D&gt; <a href=3D"http://python3-poetry-core_1.4.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-poetry-core_1.4.0.bb</a>} (84%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-=
core_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.3=
.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-c=
ore_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.4.=
0.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-poetry-c=
ore_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.3.=
2.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-poetry-cor=
e_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.4.0.=
bb</a><br>
index 1b6c76323b..22a6a2a477 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-core_1.=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.3.2.bb</=
a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-core_1.=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.4.0.bb</=
a><br>
@@ -10,19 +10,21 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/attr/_version_info.py;be=
ginline=3D1;endline=3D1;md5=3Db2dccaa94b3629a08bfb4f983cad6f89 \<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/attrs/LICENSE;md5=3D5e55=
731824cf9205cfabeab9a0600887 \<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/jsonschema/COPYING;md5=
=3D7a60a81c146ec25599a3e1dabb8610a8 \<br>
-=C2=A0 =C2=A0 file://src/poetry/core/_vendor/lark/LICENSE;md5=3Db37b83a9cf=
129d92ee65aaa71c01ce72 \<br>
+=C2=A0 =C2=A0 file://src/poetry/core/_vendor/lark/LICENSE;md5=3Dfcfbf1e2ec=
c0f37acbb5871aa0267500 \<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/packaging/LICENSE;md5=3D=
faadaedca9251a90b205c9167578ce91 \<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/packaging/LICENSE.APACHE=
;md5=3D2ee41112a44fe7014dce33e26468ba93 \<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md=
5=3D7bef9bf4a8e4263634d0597e7ba100b8 \<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/pyparsing/LICENSE;md5=3D=
657a566233888513e1f07ba13e2f47f1 \<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;m=
d5=3Db695eb9c6e7a6fb1b1bc2d193c42776e \<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/tomlkit/LICENSE;md5=3D31=
aac0dbc1babd278d5386dadb7f8e82 \<br>
-=C2=A0 =C2=A0 file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=
=3D64fc2b30b67d0a8423c250e0386ed72f \<br>
+=C2=A0 =C2=A0 file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=
=3Df16b323917992e0f8a6f0071bc9913e2 \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;0ab006a40cb38d6a38b97264f6835da2f08a96912f272=
8ce668e9ac6a34f686f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;514bd33c30e0bf56b0ed44ee15e120d7e47b61ad908b2=
b1011da68c48a84ada9&quot;<br>
<br>
=C2=A0inherit python_poetry_core pypi<br>
+PYPI_ARCHIVE_NAME =3D &quot;poetry_core-${PV}.${PYPI_PACKAGE_EXT}&quot;<br=
>
+S =3D &quot;${WORKDIR}/poetry_core-${PV}&quot;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you. I had=
 this staged but my local tests showed =E2=80=98devtool check-upgrade-statu=
s=E2=80=99 went wonky.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 appreciate you keeping us up to date.</div><div dir=3D"auto"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)"><br>
=C2=A0RDEPENDS:${PN}:append:class-target =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-compression \<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174516): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174516" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174516</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95642216/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
95642216/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c3dd6005efbf08c6--

