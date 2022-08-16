Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C870C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 14:55:39 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.16829.1660661731072635763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 07:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EyAW93Ur;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id z2so13847414edc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 07:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yC5ClZMvBGRolbFOs5twy1i3eEXpLiwPX5G4FT7H3ls=;
        b=EyAW93UrMSLXJ8ifsUavNipxKJYpyKoFcBaFseTaLwYvVYYYVuXx+e3g/IBTRl5ydq
         dskkFY0K1WYLkUOD0CvLutmm8+WNzokLyjFuT/lMSgGVxUxQr8pG3+9vUnb4ia9vW7lx
         GIjp6tyIXd32K5qUOEzLc+mpO718DWsBUREdMk9jmAmjZtRo/rJW4BQj07hxHg+VVMo6
         zbQGDGmU3Cslx/nvW3iVwcSP34nkd9zET1ILmn2+09XlcbOeQXXy6XrVev+cnQep5Shz
         CQOirwovvd08NmxaW+zFwQfm7GLaMJd/TxMID1lYlogcs6uGLCk7tcIywlLhnBb/7Znn
         KT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yC5ClZMvBGRolbFOs5twy1i3eEXpLiwPX5G4FT7H3ls=;
        b=z6cOR11Wa5dWfmLloWEqp6A2/RiYiTwEg1mS+2VW1BLMkdNVDbRO6S4Kltey21ImSf
         VXIC8qtM8qOgwjBAO89mzJQBszUagjtdpjrasUnlZVEaGyErg1vCGFVRYsqXlJM0VGU8
         SW/hddLFfJPDdAcsn4ppMRWb5isqN1p8yM9ktCGbr8u7DEYs1KJKFyF25o8vuDv0KQC6
         4ikwUIeGsuPhG9C2Z/tNSX0LYtHq4HYfg2GLZv1Bft0WVNA73XnBg/jDxZUVuOUg6jGY
         OyD6EvgxbGJHrENLTQut4ZMzO5WNn1vuyv3VPnFifoYiCbCi/5zC4aznOto+jzdlV4re
         QKog==
X-Gm-Message-State: ACgBeo3xiTYARpnMWURQppASwUFBJU7d4nfTUTFBvAIKup3s6HnwcWH1
	xulMlOJL5LWCELi/TDZSOaGrFO7qU/PAqbQbXsQ=
X-Google-Smtp-Source: 
 AA6agR4OstsVzC/2eA1bvfgEc1bmqIS40Vkws7dhcbu/WzCks9kKABfMgxkb3I2m8sl+VraObpJV0CA50QTvcRkaK5o=
X-Received: by 2002:a05:6402:450c:b0:443:6279:774f with SMTP id
 ez12-20020a056402450c00b004436279774fmr14845144edb.11.1660661729010; Tue, 16
 Aug 2022 07:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220816075432.22347-1-kai.kang@windriver.com>
In-Reply-To: <20220816075432.22347-1-kai.kang@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 16 Aug 2022 07:55:18 -0700
Message-ID: 
 <CABcZANmYBerOcEo9NRhY43w8SQyEKsbdSMbgMwFh81Rh1u7Xhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distrooverrides.bbclass: use IMAGE_CLASSES
To: kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000732afd05e65cf081"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 14:55:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169439

--000000000000732afd05e65cf081
Content-Type: text/plain; charset="UTF-8"

This class functionality isn't limited to images.

On Tue, Aug 16, 2022 at 12:54 AM kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Update comment in distrooverrides.bbclass to use IMAGE_CLASSES rather
> than globally with INHERIT.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes-recipe/distrooverrides.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/distrooverrides.bbclass
> b/meta/classes-recipe/distrooverrides.bbclass
> index 8d9d7cda7d..b5346b465e 100644
> --- a/meta/classes-recipe/distrooverrides.bbclass
> +++ b/meta/classes-recipe/distrooverrides.bbclass
> @@ -17,7 +17,7 @@
>  #
>  # The class is meant to be used in a layer.conf or distro
>  # .inc file with:
> -# INHERIT += "distrooverrides"
> +# IMAGE_CLASSES += "distrooverrides"
>  # DISTRO_FEATURES_OVERRIDES += "my-feature"
>  #
>  # Beware that this part of OVERRIDES changes during parsing, so usage
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169428):
> https://lists.openembedded.org/g/openembedded-core/message/169428
> Mute This Topic: https://lists.openembedded.org/mt/93054585/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--000000000000732afd05e65cf081
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This class functionality isn&#39;t limited to images.</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, Aug 16, 2022 at 12:54 AM kai &lt;<a href=3D"mailto:kai.kang@windriver.co=
m">kai.kang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@wind=
river.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
Update comment in distrooverrides.bbclass to use IMAGE_CLASSES rather<br>
than globally with INHERIT.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/distrooverrides.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/distrooverrides.bbclass b/meta/classes-rec=
ipe/distrooverrides.bbclass<br>
index 8d9d7cda7d..b5346b465e 100644<br>
--- a/meta/classes-recipe/distrooverrides.bbclass<br>
+++ b/meta/classes-recipe/distrooverrides.bbclass<br>
@@ -17,7 +17,7 @@<br>
=C2=A0#<br>
=C2=A0# The class is meant to be used in a layer.conf or distro<br>
=C2=A0# .inc file with:<br>
-# INHERIT +=3D &quot;distrooverrides&quot;<br>
+# IMAGE_CLASSES +=3D &quot;distrooverrides&quot;<br>
=C2=A0# DISTRO_FEATURES_OVERRIDES +=3D &quot;my-feature&quot;<br>
=C2=A0#<br>
=C2=A0# Beware that this part of OVERRIDES changes during parsing, so usage=
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169428): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169428" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169428</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93054585/3617=
123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93054585/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D=
"#333333">Christopher Larson<br><a>chris_larson@mentor.com</a>,=C2=A0<a>chr=
is.larson@siemens.com</a>,=C2=A0<a>kergoth@gmail.com</a><br>Principal Softw=
are Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemens Digital Industrie=
s Software</font><br></div></div></div>

--000000000000732afd05e65cf081--

