Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A910C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 02:15:20 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.18691.1701224110133839819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 18:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SSCFXrNw;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5cfa65de9ecso35242607b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 18:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701224109; x=1701828909; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IRSrZOAY4j0/3KRUR68MKf+pB5Lw75TV5ElPC/G7CKQ=;
        b=SSCFXrNwFHnnDtg6/pRk3C1Y0/0T3Esz22fHj11y43Yt6bzqVWIdKgzrFr4rSzqtz3
         XchtqUbQSMKEYcReE/N3uDSQ2yVH1Fdxu2fh3q2tZnmxDXMDkF2WiUrVaNZ8iWp3Lc1t
         nK1eT6fbmLGpcb93KsE+JmztSGtshCWK6KyCuJzbeVMElgHsdP+kmbtG+YpFsPwkTQep
         9eL7wZvS+YysNOsPMOMB3SElLLHG2mnnPaRZe5wbpuLDEahsxMaehbpxKCDzxw7YwpGB
         PCALQLclFpX2k6qYW5DQ33tzbOk386cJQYpB6yFbVoAV2J5KOgNfMCnUwm9qcWUvjjQr
         TJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701224109; x=1701828909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRSrZOAY4j0/3KRUR68MKf+pB5Lw75TV5ElPC/G7CKQ=;
        b=CJ97o3gE1tti0MLZhaPF2X6ipMJhW/QESqiRJ/Y9lcwMK786Zp/GrmddN+ZM5qE0Tg
         xEC7lLc5zE5k4W9Z+GVxrvnQ8V2uDSDpDUKU8BhXB69unQUZrXEWJUD8mIBay5NKHb0/
         oq5Y+PuROsMM1wSUsds+Hi3Ttonn3FEGRcxBWMz2NsMCI+eVrMuL+4oQ9usnlETUsZB4
         c5J86YVCY3APkGHySgdx7IQcRUeEZBaIu9YqVEgLjhE0Tpb/RzG4KzbU+YaBY90jq+01
         Iy5MB7lXgPcHCmmvMHba0C4LmsfdturP9/m9KzmnCnI+bVTjO2ak6NouD3Kc1mVDs8Fi
         ZuxA==
X-Gm-Message-State: AOJu0YxwbpF0MjladqT2FLwSAG55kkFQt30Q9vIyjSBL5XMf/f7HtylZ
	tN5akkqYf3Uo6QkDhJfhYd2kzPWnKhxpuK2R6QY=
X-Google-Smtp-Source: AGHT+IH+Q+UfCo+VTgVFdCXQrUb8hK0fd8X0Rnv//nHK+7cHEWg9lJPQ1GOu7BIeaYMz9dsLdgtkrpIVZt86w3r3OsE=
X-Received: by 2002:a0d:eb47:0:b0:5ca:e8bc:b8e with SMTP id
 u68-20020a0deb47000000b005cae8bc0b8emr17563752ywe.17.1701224109136; Tue, 28
 Nov 2023 18:15:09 -0800 (PST)
MIME-Version: 1.0
References: <1701214852-1755-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1701214852-1755-1-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Nov 2023 18:14:57 -0800
Message-ID: <CANx9H-DSkaQ9Qj_z1rCcWS4qA+UTTVWHqr6Pwv05zY6Q_vmZSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 41.0.5 -> 41.0.7
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b55ed5060b411a52"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 02:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191421

--000000000000b55ed5060b411a52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Once again. You CANNOT upgrade python3-cryptography-vectors without also
upgrading python3-cryptography. PLEASE STOP SENDING THESE.

On Tue, Nov 28, 2023 at 3:41=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Fixed compilation when using LibreSSL 3.8.2.
> -Fixed a null-pointer-dereference and segfault that could occur when
> loading
>  certificates from a PKCS#7 bundle. Credit to pkuzco for reporting the
> issue.
>  CVE-2023-49083
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...vectors_41.0.5.bb =3D> python3-cryptography-vectors_41.0.7.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_41.0.5.bb =3D>
> python3-cryptography-vectors_41.0.7.bb} (91%)
>
> diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.5.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.7.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.5.bb
> rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.7.bb
> index 44c67fdd76..4bfdb5f100 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
>  #       Upgrade both recipes at the same time
>
> -SRC_URI[sha256sum] =3D
> "75e82aea2982729312af735adb2983f347bb21fff88ad5dda3673ed70e1d1caf"
> +SRC_URI[sha256sum] =3D
> "7b36f976b6e58cc1801310e1c93c584c6539d371da7f8538edd8fc463dc80d5b"
>
>  PYPI_PACKAGE =3D "cryptography_vectors"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191416):
> https://lists.openembedded.org/g/openembedded-core/message/191416
> Mute This Topic: https://lists.openembedded.org/mt/102862304/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b55ed5060b411a52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Once again. You CANNOT upgrade python3-cryptography-vector=
s without also upgrading python3-cryptography. PLEASE=C2=A0STOP SENDING THE=
SE.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Nov 28, 2023 at 3:41=E2=80=AFPM wangmy &lt;<a href=3D"mailto:wan=
gmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:=
wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-Fixed compilation when using LibreSSL 3.8.2.<br>
-Fixed a null-pointer-dereference and segfault that could occur when loadin=
g<br>
=C2=A0certificates from a PKCS#7 bundle. Credit to pkuzco for reporting the=
 issue.<br>
=C2=A0CVE-2023-49083<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://vectors_41.0.5.bb" rel=3D"noreferrer" target=3D"=
_blank">vectors_41.0.5.bb</a> =3D&gt; <a href=3D"http://python3-cryptograph=
y-vectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogra=
phy-vectors_41.0.7.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-crypto=
graphy-vectors_41.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryp=
tography-vectors_41.0.5.bb</a> =3D&gt; <a href=3D"http://python3-cryptograp=
hy-vectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_41.0.7.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy-vectors_41.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypt=
ography-vectors_41.0.5.bb</a> b/meta/recipes-devtools/python/<a href=3D"htt=
p://python3-cryptography-vectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-cryptography-vectors_41.0.7.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cryptogr=
aphy-vectors_41.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypto=
graphy-vectors_41.0.5.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cryptograp=
hy-vectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_41.0.7.bb</a><br>
index 44c67fdd76..4bfdb5f100 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_41.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_41.0.5.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_41.0.7.bb</a><br>
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4fb=
6fae01f1d253ab91511e4 \<br>
=C2=A0# NOTE: Make sure to keep this recipe at the same version as python3-=
cryptography<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same time<br>
<br>
-SRC_URI[sha256sum] =3D &quot;75e82aea2982729312af735adb2983f347bb21fff88ad=
5dda3673ed70e1d1caf&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7b36f976b6e58cc1801310e1c93c584c6539d371da7f8=
538edd8fc463dc80d5b&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191416): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/191416" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/191416</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102862304/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102862304/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b55ed5060b411a52--

