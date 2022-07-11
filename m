Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BADC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 18:07:52 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.32437.1657562870505213572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 11:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TfyiP/+l;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id d17so928892qvs.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tRIULoOEhRdHvAA2521cgjtiH1VE64ds+Sopbz/atUc=;
        b=TfyiP/+lElKXBnU5GYX7sLJBGSDsKMnjMzatQWzyRYyBvJcA9TC/gi2r+cuctwcUB5
         BbwtPWA+KRotS9cR79Z4K9h5Y9CvkzQKWIHHTXFi0UhYJSc7sTcdtDocPwT6yAQTtH4K
         0IM5M6RTotiSjK4dzR5sb4SYbsK4QW5tXiRqEKUzqACwOa4tI6wuJa5Bjkk7Tv3SpP2r
         jGHTzQkBV6aqefgX3Y4SvS7uzlSzoDr4em2qpLJ/2qDAwg4mAJO8EKTJvLdCWhpKvTxC
         yTgMSq3fBEfTxQ0GZ4ciPcfY/O2+65gApFVEgPj5CBfGSZn7aD3K6dLyRGJimexXHc4D
         A77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRIULoOEhRdHvAA2521cgjtiH1VE64ds+Sopbz/atUc=;
        b=eDwuw329xvrkaZrSGaFvsWv4buHnxL5m2YASVRjGv0ZrxPb7Ew6VSBMjJFmUCK1x/1
         aC2iThLF6uTWRGGG2yYNKCwHIa87Yqu7DmD9F7+bfYb+U8TdQbLIQeHDUMNT0SBahT9Z
         UfKHmKM0s30/XaKqUXv9X1grJpxsLpYRMiJIDgrtseATGJW6otF28h/P7xWKDjdxkFWA
         EHdhD+Fa8uN3n+Xs9TVNU37YfENgGa33BTO7eO2HN1dfrpmJlqfZBvZvy3WeWznFaaWw
         60YqvhSoiYjqKPNuqdle8WFs7m6LPhR/MrkYYgskgTBidBDt877GL7aNb8IhPqqrya0B
         5W5Q==
X-Gm-Message-State: AJIora/oCI9qSNknx2S0tEOLbCZ/mI4WjQz40xJEkl73YluHQ+fXuH2U
	jb1ojrkKjVS+loPyY1SxWzL7xy1jPkKnffoF559xA9kPQOPrpw==
X-Google-Smtp-Source: 
 AGRyM1t+VgjCz5Gs1kfgD6aV9QwEkf0Hf0OpSIzX/V93VqjhGkw/rG/TowXhG0Hh38NhuhyAThDFiyA/lXz95Y4NKe0=
X-Received: by 2002:a0c:ed23:0:b0:472:f9c0:9fda with SMTP id
 u3-20020a0ced23000000b00472f9c09fdamr14554546qvq.24.1657562869268; Mon, 11
 Jul 2022 11:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220711083309.1749253-1-sean@geanix.com>
In-Reply-To: <20220711083309.1749253-1-sean@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2022 19:07:38 +0100
Message-ID: 
 <CAMKF1sry2PHb52OyVBFSwFnnuHVB4g5rY-te_-BKjq4uQ0onsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] zlib: split src_uri into inc file
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000004048b05e38b6e9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 18:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167876

--00000000000004048b05e38b6e9e
Content-Type: text/plain; charset="UTF-8"

We are in process of merging the inc files can you cite reasons why we want
to split it

On Mon, Jul 11, 2022 at 9:33 AM Sean Nyekjaer <sean@geanix.com> wrote:

> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta/recipes-core/zlib/zlib.inc       |  4 ++++
>  meta/recipes-core/zlib/zlib_1.2.12.bb | 18 +++++++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
>  create mode 100644 meta/recipes-core/zlib/zlib.inc
>
> diff --git a/meta/recipes-core/zlib/zlib.inc
> b/meta/recipes-core/zlib/zlib.inc
> new file mode 100644
> index 0000000000..2bcc32071a
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib.inc
> @@ -0,0 +1,4 @@
> +SRC_URI = "https://zlib.net/${BP}.tar.xz"
> +UPSTREAM_CHECK_URI = "http://zlib.net/"
> +
> +SRC_URI[sha256sum] =
> "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18"
> diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb
> b/meta/recipes-core/zlib/zlib_1.2.12.bb
> index e921703137..ba986d8cf2 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.12.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
> @@ -6,16 +6,16 @@ SECTION = "libs"
>  LICENSE = "Zlib"
>  LIC_FILES_CHKSUM =
> "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef63bc555f7aa6c0"
>
> -SRC_URI = "https://zlib.net/${BP}.tar.xz \
> -           file://cc.patch \
> -           file://ldflags-tests.patch \
> -           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
> -           file://run-ptest \
> -
>  file://0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch \
> -           "
> -UPSTREAM_CHECK_URI = "http://zlib.net/"
> +include zlib.inc
> +
> +SRC_URI += "file://cc.patch \
> +            file://ldflags-tests.patch \
> +            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
> +            file://run-ptest \
> +
> file://0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch \
> +"
>
> -SRC_URI[sha256sum] =
> "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18"
> +UPSTREAM_CHECK_URI = "http://zlib.net/"
>
>  CFLAGS += "-D_REENTRANT"
>
> --
> 2.36.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167861):
> https://lists.openembedded.org/g/openembedded-core/message/167861
> Mute This Topic: https://lists.openembedded.org/mt/92305639/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000004048b05e38b6e9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We are in process of merging the inc files can you cite r=
easons why we want to split it=C2=A0</div><div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 11, 2022 at 9:33 AM Se=
an Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Sean Nyekjaer=
 &lt;<a href=3D"mailto:sean@geanix.com" target=3D"_blank">sean@geanix.com</=
a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/zlib/zlib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +=
+++<br>
=C2=A0meta/recipes-core/zlib/<a href=3D"http://zlib_1.2.12.bb" rel=3D"noref=
errer" target=3D"_blank">zlib_1.2.12.bb</a> | 18 +++++++++---------<br>
=C2=A02 files changed, 13 insertions(+), 9 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/zlib/zlib.inc<br>
<br>
diff --git a/meta/recipes-core/zlib/zlib.inc b/meta/recipes-core/zlib/zlib.=
inc<br>
new file mode 100644<br>
index 0000000000..2bcc32071a<br>
--- /dev/null<br>
+++ b/meta/recipes-core/zlib/zlib.inc<br>
@@ -0,0 +1,4 @@<br>
+SRC_URI =3D &quot;<a href=3D"https://zlib.net/$%7BBP%7D.tar.xz" rel=3D"nor=
eferrer" target=3D"_blank">https://zlib.net/${BP}.tar.xz</a>&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://zlib.net/" rel=3D"noreferre=
r" target=3D"_blank">http://zlib.net/</a>&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;7db46b8d7726232a621befaab4a1c870f00a90805511c=
0e0090441dac57def18&quot;<br>
diff --git a/meta/recipes-core/zlib/<a href=3D"http://zlib_1.2.12.bb" rel=
=3D"noreferrer" target=3D"_blank">zlib_1.2.12.bb</a> b/meta/recipes-core/zl=
ib/<a href=3D"http://zlib_1.2.12.bb" rel=3D"noreferrer" target=3D"_blank">z=
lib_1.2.12.bb</a><br>
index e921703137..ba986d8cf2 100644<br>
--- a/meta/recipes-core/zlib/<a href=3D"http://zlib_1.2.12.bb" rel=3D"noref=
errer" target=3D"_blank">zlib_1.2.12.bb</a><br>
+++ b/meta/recipes-core/zlib/<a href=3D"http://zlib_1.2.12.bb" rel=3D"noref=
errer" target=3D"_blank">zlib_1.2.12.bb</a><br>
@@ -6,16 +6,16 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;Zlib&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://zlib.h;beginline=3D6;endline=3D23;m=
d5=3D5377232268e952e9ef63bc555f7aa6c0&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://zlib.net/$%7BBP%7D.tar.xz" rel=3D"nor=
eferrer" target=3D"_blank">https://zlib.net/${BP}.tar.xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cc.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ldflags-tests.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure-Pass-LDFLAG=
S-to-link-tests.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Correct-incorrect-inp=
uts-provided-to-the-CRC-functio.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://zlib.net/" rel=3D"noreferre=
r" target=3D"_blank">http://zlib.net/</a>&quot;<br>
+include zlib.inc<br>
+<br>
+SRC_URI +=3D &quot;file://cc.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ldflags-tests.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-Pass-LDFLA=
GS-to-link-tests.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Correct-incorrect-in=
puts-provided-to-the-CRC-functio.patch \<br>
+&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;7db46b8d7726232a621befaab4a1c870f00a90805511c=
0e0090441dac57def18&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://zlib.net/" rel=3D"noreferre=
r" target=3D"_blank">http://zlib.net/</a>&quot;<br>
<br>
=C2=A0CFLAGS +=3D &quot;-D_REENTRANT&quot;<br>
<br>
-- <br>
2.36.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167861): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167861" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167861</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92305639/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92305639/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000004048b05e38b6e9e--

