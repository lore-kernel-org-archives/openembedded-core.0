Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31353C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 15:57:11 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.16828.1690905420915662919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 08:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=E/0yIirM;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d0e009433c4so6210378276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690905420; x=1691510220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OzlPLuEm+2Ytd9gozcMcLpr9KXuuGKGFWrq6e2Nz2wM=;
        b=E/0yIirMeKjX8Sv+JOukrcfcymiciyn7Z3EqhOVDVUQ+21Y10SHLQgbmQCEKHA8ZII
         gcH1Zafl4LRdA9v6zK+8fjqFsjbUlmwHWQ2nUmjZ/3XnrzidNkU8phsBsDePCFHPr9vW
         mFmVmG9/bpiQR15qb3VEGli57xmlxv2yEcYTgxhWip2XnyZWaClE5L7hygoQGNRaNlmB
         RbAb8C0X1bJfHBBbeVRpzcJtC72eMUbo20SNj7NAopE+CcgUbiQ73oBE/Sm3Kbw9phoe
         gz/CwpgMoRmEPKXoQZzxIpMCxQJ9207pUvPK8mthFsz74DzXuuJOgNiVTxVOXm2sK2Kc
         /WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690905420; x=1691510220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzlPLuEm+2Ytd9gozcMcLpr9KXuuGKGFWrq6e2Nz2wM=;
        b=RvH4NUUYwlMriqDbAPqsDuhH/FvedA7xCuzcNaRqrKlZM/kusw+yjMf68pZuihcTSJ
         GnkLTGU2aP3HYa7sb3quWMz63/qjSm1pI19uP5w/9OFrEi3d7KMLI+Y9WfF6VKPk2jOg
         ANMMa4aiahmhHeEK86rpc/plTWrarYBJCikhfBLjV99NdURch4frLnVANbjMwxVPMS3N
         y3xv0aR24xpAqpGNWWAyEvIZL7cJOHOoUU1OFy2eMvrE16U3FIPI+6JQRHeR9wvIsRuT
         ZUbsw+gPICbjYLtzD4MZlo65dHUZH4AlmDohu6/h88BczuZ7TjdhI9g0wQhsVq14wx6N
         ilhQ==
X-Gm-Message-State: ABy/qLa92AL31k9ehxPyrIJARcYjDA53mEbrJVfqI2pWTIXNxVeOElEv
	PtJw0SUt0qUMmstZ2aRB3HoHe448vMBaLKu5cF1m4SMK
X-Google-Smtp-Source: APBJJlGc6Gj1TRCfC9OZUCpksED3MjPSjBSzfaWYRb5N4PuhTI6cJzk8ViunbBkV6Iq2V05S4pI1TukCafvs16xPDuE=
X-Received: by 2002:a0d:f842:0:b0:576:777f:28bc with SMTP id
 i63-20020a0df842000000b00576777f28bcmr13556081ywf.21.1690905419619; Tue, 01
 Aug 2023 08:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com> <1690875687-21573-7-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1690875687-21573-7-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Aug 2023 08:56:48 -0700
Message-ID: <CANx9H-DnLkB6Dc9kS2OX0L4baB_WjYne7oF60ay15xYU=n5Z9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cython: upgrade 0.29.36 -> 3.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e2a3270601de98ba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 15:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185252

--000000000000e2a3270601de98ba
Content-Type: text/plain; charset="UTF-8"

This highly likely to cause collateral fallout in other recipes. Fedora
Project has a thread:

https://lists.fedoraproject.org/archives/list/python-devel@lists.fedoraproject.org/thread/JJKDDEYYNL2L7PN42ZDFBCXTEAJS42OO/

In particular, python3-numpy needs to be tested with this upgrade enabled.

On Tue, Aug 1, 2023 at 12:41 AM wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: http changed to https
>
> Changelog:
>  https://github.com/cython/cython/blob/master/CHANGES.rst
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-cython.inc                | 4 ++--
>  .../{python3-cython_0.29.36.bb => python3-cython_3.0.0.bb}    | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb =>
> python3-cython_3.0.0.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-cython.inc
> b/meta/recipes-devtools/python/python-cython.inc
> index 6aec6b012f..01829b9f33 100644
> --- a/meta/recipes-devtools/python/python-cython.inc
> +++ b/meta/recipes-devtools/python/python-cython.inc
> @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice,
> high-level, easy-to-use world
>  and the messy, low-level world of C."
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
>  PYPI_PACKAGE = "Cython"
>  BBCLASSEXTEND = "native nativesdk"
>
> -SRC_URI[sha256sum] =
> "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
> +SRC_URI[sha256sum] =
> "350b18f9673e63101dbbfcf774ee2f57c20ac4636d255741d76ca79016b1bd82"
>  UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
>
>  inherit pypi
> diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
> b/meta/recipes-devtools/python/python3-cython_3.0.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
> rename to meta/recipes-devtools/python/python3-cython_3.0.0.bb
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185200):
> https://lists.openembedded.org/g/openembedded-core/message/185200
> Mute This Topic: https://lists.openembedded.org/mt/100478737/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e2a3270601de98ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div><div dir=3D"auto">This highly likely to cause collateral fal=
lout in other recipes. Fedora Project has a thread:</div></div></div></div>=
<div><div><div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=
=3D"https://lists.fedoraproject.org/archives/list/python-devel@lists.fedora=
project.org/thread/JJKDDEYYNL2L7PN42ZDFBCXTEAJS42OO/">https://lists.fedorap=
roject.org/archives/list/python-devel@lists.fedoraproject.org/thread/JJKDDE=
YYNL2L7PN42ZDFBCXTEAJS42OO/</a></div><div dir=3D"auto"><br></div>In particu=
lar, python3-numpy needs to be tested with this upgrade enabled.</div><div =
dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Aug 1, 2023 at 12:41 AM wangmy &lt;<a href=3D"m=
ailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy=
@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
License-Update: http changed to https<br>
<br>
Changelog:<br>
=C2=A0<a href=3D"https://github.com/cython/cython/blob/master/CHANGES.rst" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/cython/cython/blob/=
master/CHANGES.rst</a><br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/python-cython.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0.../{<a href=3D"http://python3-cython_0.29.36.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-cython_0.29.36.bb</a> =3D&gt; <a href=3D"http://p=
ython3-cython_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython=
_3.0.0.bb</a>}=C2=A0 =C2=A0 | 0<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-cython=
_0.29.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_0.29.36.bb=
</a> =3D&gt; <a href=3D"http://python3-cython_3.0.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-cython_3.0.0.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-=
devtools/python/python-cython.inc<br>
index 6aec6b012f..01829b9f33 100644<br>
--- a/meta/recipes-devtools/python/python-cython.inc<br>
+++ b/meta/recipes-devtools/python/python-cython.inc<br>
@@ -5,11 +5,11 @@ It&#39;s designed to bridge the gap between the nice, hig=
h-level, easy-to-use world<br>
=C2=A0and the messy, low-level world of C.&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3De23fadd6ceef8c618fc1c6=
5191d846fa&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7=
e62bc9f69c&quot;<br>
=C2=A0PYPI_PACKAGE =3D &quot;Cython&quot;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;41c0cfd2d754e383c9eeb95effc9aa4ab847d0c974707=
7ddd7c0dcb68c3bc01f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;350b18f9673e63101dbbfcf774ee2f57c20ac4636d255=
741d76ca79016b1bd82&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;Cython-(?P&lt;pver&gt;.*)\.tar&quot;<b=
r>
<br>
=C2=A0inherit pypi<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cython_=
0.29.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_0.29.36.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cython_0=
.29.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_0.29.36.bb</=
a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.0.bb</a><br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185200): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185200" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185200</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100478737/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100478737/924729</a><br>
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
</div>
</div>
</div>

--000000000000e2a3270601de98ba--

