Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053D5C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 15:41:45 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.16709.1709134901044526942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 07:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DeCcXEaK;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-608a21f1cbcso37005847b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709134900; x=1709739700; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zdZeqwec3SwCL46xsYSOAY9yDWL5H22rQygs5OeNy1s=;
        b=DeCcXEaKRgfxuF68Dvoz+620ZcdF8YTLMrZr2pFucDG/CibM/p+L27xyCLkVl7r0ab
         MZBnpMUzY2VhcLSf3qTMkpItK7Tznw9Nlm/T0aNQdxr49ska+P4Pv5SDHYLo3d/bPh/s
         zd0XQm1d5XxNTkpmWrkXWz/5HpBpnC7PPaSEsBG4RAxjnDNn9VT5EWMz20xwrejv8kuD
         1SNmwUy2FGl/GXXW59zRsMEhDkS2lH4Gnmf2BxpZuw7byIPMDbP7lRDvcDfZyCbKr7w2
         1tNxMmxrDjyoWaxQ8OsgodacWjZeWsnMknY/fvSd3YwLYeYWPRBFljrRAZK+Xb/g+44Z
         Bfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709134900; x=1709739700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdZeqwec3SwCL46xsYSOAY9yDWL5H22rQygs5OeNy1s=;
        b=rx1pcQEO+TmTs+Y1knJwWEEP3/vr3XRq7aTuLXlID/XyjdE3FqR3F+Wo3Pkdqyyd3B
         EOaIoGAILqBplHWkHyfHcw41n49R4W13/sW39QGro2irzvvFg4+6QXheHuU/PcIpMiRx
         BCLZWtyjqVTVMJMpZFzRXFzBeHPmTX19EDmV0Xr9WYG+4jT8QqYJIBKmiibRFTR9pmuv
         BON2qJQpF0aMdr9v26+0uO/fSgcIOdngxfu+763jNFUjwAPuU9chWxRs2Coie2uCsqTX
         3yfW3wkDJyfBtWwTP30dXnFBa6/yytvhQGy4rojpTW+aWyHqCraPSLnSg9UJQ1VLkQCq
         MoyA==
X-Gm-Message-State: AOJu0Yx9YshikDaFvT6oO3yBEW1QZtKhIJ7+pPTbc6437RU2wh+10X5W
	/ZD1lLflmBgWlhbsubm1t6xlFKXgDtj3Y70ibLHLyVS94G0g6Kf8cV+AnI5RE2ntxsjDGm5JSsI
	2ST4PRnH7+TTpIGSAl4hHSE7qtYTuld4q
X-Google-Smtp-Source: AGHT+IH2YDzUjM9x00J+RF4y9Gc3etlxwbVUN311wtYBnJZqz/X9YxX3rwAGpW52SA++zuoBhtMZxoqAYAJNSqmFAtU=
X-Received: by 2002:a81:bd53:0:b0:609:273d:bedb with SMTP id
 n19-20020a81bd53000000b00609273dbedbmr5193869ywk.51.1709134899965; Wed, 28
 Feb 2024 07:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20240228073818.2520528-1-soumya.sambu@windriver.com>
In-Reply-To: <20240228073818.2520528-1-soumya.sambu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 28 Feb 2024 07:41:28 -0800
Message-ID: <CANx9H-AdP6FPWAfTBiYjRy1PgQ=kuvpmE=QQE=0pFELQo2BTFQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1] python3-cryptography{-vectors}: 42.0.2 -> 42.0.4
To: soumya.sambu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000095f1ba061272fa89"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 15:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196393

--00000000000095f1ba061272fa89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We need the change in 42.0.5 for ppc64 support.

I will submit the full bump from 42.0.2 to 42.0.5 later today.

On Tue, Feb 27, 2024 at 11:38=E2=80=AFPM Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 42.0.4 - 2024-02-20
> * Fixed a null-pointer-dereference and segfault that could occur
> when creating a PKCS#12 bundle. Credit to Alexander-Programming for
> reporting the issue. CVE-2024-26130
> * Fixed ASN.1 encoding for PKCS7/SMIME signed messages. The fields
> SMIMECapabilities and SignatureAlgorithmIdentifier should now be
> correctly encoded according to the definitions in RFC 2633 RFC 3370.
>
> 42.0.3 - 2024-02-15
> * Fixed an initialization issue that caused key loading failures for
> some users.
>
> https://cryptography.io/en/latest/changelog/#v42-0-4
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  ...vectors_42.0.2.bb =3D> python3-cryptography-vectors_42.0.4.bb} | 2 +-
>  ...n3-cryptography_42.0.2.bb =3D> python3-cryptography_42.0.4.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_42.0.2.bb =3D>
> python3-cryptography-vectors_42.0.4.bb} (91%)
>  rename meta/recipes-devtools/python/{python3-cryptography_42.0.2.bb =3D>
> python3-cryptography_42.0.4.bb} (95%)
>
> diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.2.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.4.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.2.bb
> rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.4.bb
> index 94fbc94c55..9500e890f3 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.4.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
>  #       Upgrade both recipes at the same time
>
> -SRC_URI[sha256sum] =3D
> "adcdccf5d9ee661a9602ad21d2525f678ba07a6e768ce79835994e208bab0e16"
> +SRC_URI[sha256sum] =3D
> "d6b707d238a5e2390c3dae7761b997b68c2b8c0723ed24fc13f832bcc8739945"
>
>  PYPI_PACKAGE =3D "cryptography_vectors"
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> b/meta/recipes-devtools/python/python3-cryptography_42.0.4.bb
> similarity index 95%
> rename from meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> rename to meta/recipes-devtools/python/python3-cryptography_42.0.4.bb
> index c21c4d1a03..e864d6ce4f 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_42.0.4.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
>                     "
>  LDSHARED +=3D "-pthread"
>
> -SRC_URI[sha256sum] =3D
> "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888"
> +SRC_URI[sha256sum] =3D
> "831a4b37accef30cccd34fcb916a5d7b5be3cbbe27268a02832c3e450aea39cb"
>
>  SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
>              file://check-memfree.py \
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196374):
> https://lists.openembedded.org/g/openembedded-core/message/196374
> Mute This Topic: https://lists.openembedded.org/mt/104619680/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000095f1ba061272fa89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We need the change in 42.0.5 for ppc64 support.</div>=
<div><br></div><div>I will submit the full bump from 42.0.2 to 42.0.5 later=
 today.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Feb 27, 2024 at 11:38=E2=80=AFPM Soumya via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;soumya.sambu=3D<a =
href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">From: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriv=
er.com" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
42.0.4 - 2024-02-20<br>
* Fixed a null-pointer-dereference and segfault that could occur<br>
when creating a PKCS#12 bundle. Credit to Alexander-Programming for<br>
reporting the issue. CVE-2024-26130<br>
* Fixed ASN.1 encoding for PKCS7/SMIME signed messages. The fields<br>
SMIMECapabilities and SignatureAlgorithmIdentifier should now be<br>
correctly encoded according to the definitions in RFC 2633 RFC 3370.<br>
<br>
42.0.3 - 2024-02-15<br>
* Fixed an initialization issue that caused key loading failures for<br>
some users.<br>
<br>
<a href=3D"https://cryptography.io/en/latest/changelog/#v42-0-4" rel=3D"nor=
eferrer" target=3D"_blank">https://cryptography.io/en/latest/changelog/#v42=
-0-4</a><br>
<br>
Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriver.co=
m" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://vectors_42.0.2.bb" rel=3D"noreferrer" target=3D"=
_blank">vectors_42.0.2.bb</a> =3D&gt; <a href=3D"http://python3-cryptograph=
y-vectors_42.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogra=
phy-vectors_42.0.4.bb</a>} | 2 +-<br>
=C2=A0...<a href=3D"http://n3-cryptography_42.0.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">n3-cryptography_42.0.2.bb</a> =3D&gt; <a href=3D"http://pyt=
hon3-cryptography_42.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-c=
ryptography_42.0.4.bb</a>} | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-crypto=
graphy-vectors_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryp=
tography-vectors_42.0.2.bb</a> =3D&gt; <a href=3D"http://python3-cryptograp=
hy-vectors_42.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_42.0.4.bb</a>} (91%)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-crypto=
graphy_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
_42.0.2.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_42.0.4.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.4.bb</a>} (95%=
)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy-vectors_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypt=
ography-vectors_42.0.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"htt=
p://python3-cryptography-vectors_42.0.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-cryptography-vectors_42.0.4.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cryptogr=
aphy-vectors_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypto=
graphy-vectors_42.0.2.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cryptograp=
hy-vectors_42.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_42.0.4.bb</a><br>
index 94fbc94c55..9500e890f3 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_42.0.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_42.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_42.0.4.bb</a><br>
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4fb=
6fae01f1d253ab91511e4 \<br>
=C2=A0# NOTE: Make sure to keep this recipe at the same version as python3-=
cryptography<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same time<br>
<br>
-SRC_URI[sha256sum] =3D &quot;adcdccf5d9ee661a9602ad21d2525f678ba07a6e768ce=
79835994e208bab0e16&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d6b707d238a5e2390c3dae7761b997b68c2b8c0723ed2=
4fc13f832bcc8739945&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_=
42.0.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-cryp=
tography_42.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograp=
hy_42.0.4.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cryptogr=
aphy_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_4=
2.0.2.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cryptograp=
hy_42.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42.=
0.4.bb</a><br>
index c21c4d1a03..e864d6ce4f 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_4=
2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.2.=
bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_4=
2.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.4.=
bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4fb=
6fae01f1d253ab91511e4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;<br>
=C2=A0LDSHARED +=3D &quot;-pthread&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc=
8c93827c57eab6cf888&quot;<br>
+SRC_URI[sha256sum] =3D &quot;831a4b37accef30cccd34fcb916a5d7b5be3cbbe27268=
a02832c3e450aea39cb&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchmark-disabl=
e-option.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://check-memfree.py \<b=
r>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196374): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196374" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196374</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104619680/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104619680/924729</a><br>
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

--00000000000095f1ba061272fa89--

