Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AA7C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:22:18 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.14662.1683105734135781683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=V96aY1hJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: ernstp@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-547303fccefso3483654eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683105733; x=1685697733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k/22L7f+4y9KGTyk00MUAc53mqhtRMoekYyjfK0Qtgw=;
        b=V96aY1hJTpuXSlgX2lTJnoXf0aK2Hkndzw6TuW1PNc9Lctbt2uvDir0XPmipU619Gm
         iQHD2qqTGYjOWWrEiKXvwHyCgaIHFm7SFRaCKrK4itcBCP6uLdhjtTnt4Raqbbtzypjh
         XYUWPDMqxj1QPr9dHIhGOu47v9h5h/ElQr7Ug0XuvguL78m2xcAa3CPtk7cH2nqWIKwu
         6cfgViaUTuH4TVbyZ0jRcHOAI7yxeJc+6rsBJyLG1u/Ro9Ja4KVQ1HxjfO361jS/oku5
         AjluucwoLQMfCR7BhNzucx2BQ981Voh+PaX/ynHwbFyF8+8Xvf6g5qHXiLoFJ0tld6FR
         fTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105733; x=1685697733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/22L7f+4y9KGTyk00MUAc53mqhtRMoekYyjfK0Qtgw=;
        b=kemAf7bE3qiFrD6mnkaLUpDslva43hp+KQQcInETyr/ksYF/Nlx/jFN1kK9IXXIfli
         kQA0F+SEV3Msz05ewCLqWEimUwNIGkjWj4H89hVDuTob3P3kmyMxU+ahVbZ64/pfjAsA
         0S0UePFYS/6Y+fkP3DXunIy0D0GcQF8l/G7kw/3bLoxc0TKP1/lam2YodStXa6bbGMe2
         WFljAb9IlF9pW1ap1QcKJ2A+D1lRHA7XiDdw5tcxJ8rbwuu9Xkm0VIs4tq6vB67aqIBO
         2dLa5nFewEc5zSYAkbWh4bGSvLk3v/JL5k8c1T/Abih5ddEZnTqKcK8Q7sWYAfeCpn7i
         p9Pg==
X-Gm-Message-State: AC+VfDzPwFyL48EKUNyiwk/M6xD1+feGsU7q8cE03a8mdeygnCO3znbw
	r1wr368pvn+QuTZs0aL+YfuwtyR+6YZXafvdM6o=
X-Google-Smtp-Source: ACHHUZ6uc6iOlCzcXGI4EuVSK7Z0v2JqFlCNpisdrdP0/JDbKfs1eKZBteSdOo5W97qygPOsw05w/7svB0oHHYBquMY=
X-Received: by 2002:a05:6808:3a7:b0:389:8dad:782b with SMTP id
 n7-20020a05680803a700b003898dad782bmr9646426oie.21.1683105733261; Wed, 03 May
 2023 02:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230502173422.1439794-1-ernstp@gmail.com> <175B640FA76D30B2.7535@lists.openembedded.org>
In-Reply-To: <175B640FA76D30B2.7535@lists.openembedded.org>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Wed, 3 May 2023 11:22:02 +0200
Message-ID: <CAD=4a=UH+r2Cc4geTYRbaOsa1LccRRg=3+UN5O9VG0P0qnkj3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] python3-requests: fix rdepends
To: ernstp@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059c18a05fac697a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180794

--00000000000059c18a05fac697a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, email, json, netserver and compression are from the python standard
library,
they are probably still needed. So this patch is wrong!
I was only thinking about PyPI requires from setup.py here.
(Couldn't they have a more unique name, like python3-core-email or
similar... ?)


Den tis 2 maj 2023 kl 19:35 skrev Ernst Sj=C3=B6strand via lists.openembedd=
ed.org
<ernstp=3Dgmail.com@lists.openembedded.org>:

> Remove obsolete or unused rdepends.
> Add python3-charset-normalizer.
>
> Signed-off-by: Ernst Sj=C3=B6strand <ernstp@gmail.com>
> ---
>  .../python/python3-requests_2.28.2.bb                 | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3-requests_2.28.2.bb
> b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
> index 8ab1ec01212..e16490b2f5a 100644
> --- a/meta/recipes-devtools/python/python3-requests_2.28.2.bb
> +++ b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Python HTTP for Humans."
> -HOMEPAGE =3D "http://python-requests.org"
> +HOMEPAGE =3D "https://requests.readthedocs.io"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1=
658"
>
> @@ -8,17 +8,12 @@ SRC_URI[sha256sum] =3D
> "98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2
>  inherit pypi setuptools3
>
>  RDEPENDS:${PN} +=3D " \
> -    ${PYTHON_PN}-email \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-ndg-httpsclient \
> -    ${PYTHON_PN}-netserver \
> -    ${PYTHON_PN}-pyasn1 \
> -    ${PYTHON_PN}-pyopenssl \
> +    ${PYTHON_PN}-certifi \
> +    ${PYTHON_PN}-charset-normalizer \
>      ${PYTHON_PN}-pysocks \
>      ${PYTHON_PN}-urllib3 \
>      ${PYTHON_PN}-chardet \
>      ${PYTHON_PN}-idna \
> -    ${PYTHON_PN}-compression \
>  "
>
>  CVE_PRODUCT =3D "requests"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180760):
> https://lists.openembedded.org/g/openembedded-core/message/180760
> Mute This Topic: https://lists.openembedded.org/mt/98644248/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000059c18a05fac697a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Oh, email, json, netserver and compression are from the=
 python standard library,</div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,helvetica,sans-serif">they are probably still needed. So this p=
atch is wrong!<br></div><div class=3D"gmail_default" style=3D"font-family:a=
rial,helvetica,sans-serif">I was only thinking about PyPI requires from set=
up.py here.</div><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">(Couldn&#39;t they have a more unique name, like python=
3-core-email or similar... ?)<br></div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den tis 2 maj 2023 k=
l 19:35 skrev Ernst Sj=C3=B6strand via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;ernstp=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Remove obsolete or unused =
rdepends.<br>
Add python3-charset-normalizer.<br>
<br>
Signed-off-by: Ernst Sj=C3=B6strand &lt;<a href=3D"mailto:ernstp@gmail.com"=
 target=3D"_blank">ernstp@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-requests_2.28.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3-requests_2.28.2.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++--------<br>
=C2=A01 file changed, 3 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-request=
s_2.28.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.28.2.b=
b</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.2=
8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.28.2.bb</a>=
<br>
index 8ab1ec01212..e16490b2f5a 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.28.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.28.2.bb</a><b=
r>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.28.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.28.2.bb</a><b=
r>
@@ -1,5 +1,5 @@<br>
=C2=A0SUMMARY =3D &quot;Python HTTP for Humans.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://python-requests.org" rel=3D"noreferre=
r" target=3D"_blank">http://python-requests.org</a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://requests.readthedocs.io" rel=3D"nore=
ferrer" target=3D"_blank">https://requests.readthedocs.io</a>&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D34400b68072d710fecd0a=
2940a0d1658&quot;<br>
<br>
@@ -8,17 +8,12 @@ SRC_URI[sha256sum] =3D &quot;98b1b2782e3c6c4904938b84c0eb=
932721069dfdb9134313beff7c83c2<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-email \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-json \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-ndg-httpsclient \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-netserver \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-pyasn1 \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-pyopenssl \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-certifi \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-charset-normalizer \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pysocks \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-urllib3 \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-chardet \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-idna \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-compression \<br>
=C2=A0&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;requests&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180760): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180760" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180760</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98644248/4947=
266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98644248/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000059c18a05fac697a8--

