Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FDDC3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 07:28:37 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.18930.1719905309707365238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 00:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TdM6FppH;
 spf=pass (domain: mvista.com, ip: 209.85.208.171, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so53586861fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719905308; x=1720510108; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n5myEV7WtxroKXvquQjhLOLEqvlYoorIUAonHHpphTA=;
        b=TdM6FppHbikF3e6hY7nn4PYCGHPlgRTk54p77cBFeZoIoatGUh4SUEJApbEXJw1rf1
         IWUlKJ225S6uisvfVevnMhhyFM6Fa/rSYgmQoNv3aYGQVVLOHOdu62XfzbmUg4gxMLwF
         DNfRQh0Rwon9VjKnZ0GfUVfqKmMj10Xn9gBZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719905308; x=1720510108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5myEV7WtxroKXvquQjhLOLEqvlYoorIUAonHHpphTA=;
        b=j2OL65AxneeaYkTsTe1Z6fe2m9AXZrlbqOMxsCfn9LrPwazpuYvjy73DRsKM8Z5l67
         z9ANaATrZVtgxU9atHqAY1SMYyuuls5WGWBv3EyiZsEf87XXkV++AlDfcE+u+mxS8+W1
         sIGw8Qy0g90GvrXMn6mFszJDRp+qSpENAKIo3Oy9gaPmtUXvGQw4EBTe4jBn+amRORn7
         gXZ2g6z+YZ4GalHWxQgg46zAjH1KLaS7ZWOhg/rOH2RGtJtK8mBsc25TczaJQ8Okb2sM
         zo9imgjktQc2fth9HZ2qpYRswFf7BVcx5tPvGDE9fDfbTNXHq64NAeNN9U0j/UklRy24
         SVSw==
X-Gm-Message-State: AOJu0Yyi+AAW+9dUFCclYdS4jFFSitS2G6vzd6t8/myMIx9x3Ni4OY+P
	V42I0rRdkjxpfr+e2DXGcCBmZHQt3RF9W4UJCjqusporCiYzobQZAsZg64JMyayFXxgnVTtcPNs
	8cVRJsF9nGV3lfE6HIrkEkUv9l2p6j53MEUO8AA==
X-Google-Smtp-Source: AGHT+IGg146vPcW0Uig3LuRKLO6/+horV4zkgHKWqgUu+k3O0s1JYPMWi3EOcVkA1HWHsvQscEZ/BVj229Cjl2wOYK0=
X-Received: by 2002:a2e:a889:0:b0:2ee:56b0:38e3 with SMTP id
 38308e7fff4ca-2ee5e3bef3amr68453171fa.24.1719905307520; Tue, 02 Jul 2024
 00:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240604070141.3609519-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240604070141.3609519-1-richard.purdie@linuxfoundation.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 2 Jul 2024 12:58:16 +0530
Message-ID: <CANQUz1_ifXkZrycqrEBHQnLssMrdjvBpvM9fUQDbGbNNji0nsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-jinja2: Upgrade 3.1.3 -> 3.1.4
To: richard.purdie@linuxfoundation.org, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e70eb1061c3ea823"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 07:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201413

--000000000000e70eb1061c3ea823
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard / Steve,

Could you merge this patch to Scarthgap branch from Master. Upgrade to
3.1.4 fixes CVE-2024-34064 .

Thanks & Regards,
Vijay

On Tue, Jun 4, 2024 at 12:31=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> Switch to use flit core since upstream changed.
>
> They also changed the capitalisation under pypi.
>
> The license didn't change but the file was renamed, probably as it wasn't
> rst.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../{python3-jinja2_3.1.3.bb =3D> python3-jinja2_3.1.4.bb}  | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/python/{python3-jinja2_3.1.3.bb =3D>
> python3-jinja2_3.1.4.bb} (79%)
>
> diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
> b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
> similarity index 79%
> rename from meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
> rename to meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
> index 636fb35811b..2c020370113 100644
> --- a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
> +++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
> @@ -2,17 +2,17 @@ SUMMARY =3D "Python Jinja2: A small but fast and easy t=
o
> use stand-alone template
>  HOMEPAGE =3D "https://pypi.org/project/Jinja2/"
>
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D5dc88300786f1c214c1e9827a5229462"
>
> -SRC_URI[sha256sum] =3D
> "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
> +SRC_URI[sha256sum] =3D
> "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
>
> -PYPI_PACKAGE =3D "Jinja2"
> +PYPI_PACKAGE =3D "jinja2"
>
>  CVE_PRODUCT =3D "jinja2 jinja"
>
>  CLEANBROKEN =3D "1"
>
> -inherit pypi setuptools3 ptest
> +inherit pypi python_flit_core ptest
>
>  SRC_URI +=3D " \
>         file://run-ptest \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200295):
> https://lists.openembedded.org/g/openembedded-core/message/200295
> Mute This Topic: https://lists.openembedded.org/mt/106478262/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e70eb1061c3ea823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Richard / Steve, <br><br></div>Could you merg=
e this patch to Scarthgap branch from Master. Upgrade to 3.1.4 fixes=C2=A0<=
span id=3D"gmail-summary_alias_container"><span id=3D"gmail-short_desc_none=
dit_display">CVE-2024-34064 .<br><br></span></span></div><div><span id=3D"g=
mail-summary_alias_container"><span id=3D"gmail-short_desc_nonedit_display"=
>Thanks &amp; Regards,</span></span></div><div><span id=3D"gmail-summary_al=
ias_container"><span id=3D"gmail-short_desc_nonedit_display">Vijay<br></spa=
n></span></div><div><span id=3D"gmail-summary_alias_container"><span id=3D"=
gmail-short_desc_nonedit_display"></span></span></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 4, 2024 =
at 12:31=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:lin=
uxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Switch to use flit core since upstream changed.<br>
<br>
They also changed the capitalisation under pypi.<br>
<br>
The license didn&#39;t change but the file was renamed, probably as it wasn=
&#39;t<br>
rst.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0.../{<a href=3D"http://python3-jinja2_3.1.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-jinja2_3.1.3.bb</a> =3D&gt; <a href=3D"http://pytho=
n3-jinja2_3.1.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_3.1=
.4.bb</a>}=C2=A0 | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-jinja2=
_3.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_3.1.3.bb</a>=
 =3D&gt; <a href=3D"http://python3-jinja2_3.1.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-jinja2_3.1.4.bb</a>} (79%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_=
3.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_3.1.3.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_3.1.4.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-jinja2_3.1.4.bb</a><br>
similarity index 79%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_3=
.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_3.1.3.bb</a><b=
r>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_3.1=
.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_3.1.4.bb</a><br>
index 636fb35811b..2c020370113 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_3.1.3.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_3.1.3.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_3.1.4.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_3.1.4.bb</a><br>
@@ -2,17 +2,17 @@ SUMMARY =3D &quot;Python Jinja2: A small but fast and eas=
y to use stand-alone template<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/Jinja2/" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.org/project/Jinja2/</a>&quot=
;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3D5dc88300786f1c214c1e98=
27a5229462&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D5dc88300786f1c214c1e98=
27a5229462&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc=
3aed565432d5925ba90&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6=
122a993f0ac800cb369&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Jinja2&quot;<br>
+PYPI_PACKAGE =3D &quot;jinja2&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;jinja2 jinja&quot;<br>
<br>
=C2=A0CLEANBROKEN =3D &quot;1&quot;<br>
<br>
-inherit pypi setuptools3 ptest<br>
+inherit pypi python_flit_core ptest<br>
<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200295): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200295" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200295</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106478262/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106478262/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e70eb1061c3ea823--

