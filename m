Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594E5C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 13:09:37 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.14858.1717592974269326502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 06:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=OteiRhsP;
 spf=pass (domain: snapchat.com, ip: 209.85.208.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so2850551a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717592972; x=1718197772; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2kPHd9d+Rfl8KNlfQhOfQCtoX3qxRbawb+1fddMz9kM=;
        b=OteiRhsPWn9eL/zQHw/we9RiG1T6A2dA6lijvO+k9Cma2dkKkQ7dwjUF6SXtPPt74j
         RCwOacdO2VmBznHpMnDxgMm67UZM5izOtfI311CJScCFNtn6woV1a/Wpcb4gDUOhUjxn
         0hYTHkOfDd+Y2+pFpBGyoRKqVaX+LScgF90IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717592972; x=1718197772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kPHd9d+Rfl8KNlfQhOfQCtoX3qxRbawb+1fddMz9kM=;
        b=iIViFpZZ/XrYdBhqQY4FnLoD0vzmPjeD4LDyu7OC6eYhn1axJDClJVI8T0gZafQLRE
         rShjfTUNnpR0+01UZO1w0GvM10Ay5Ojjua6P61ljwreN28jR+T5hqqo3OU7ncRLjZT9b
         VAsfTV/sFHyK5LdzAtDkvLdsXW2k7dVDepO6az+NUeBOPPZaawU9/MHlDU0lmwhI7ogD
         2udgu/vF+VF2lSXZ4pWrgVRhamDYedaw3e5TjZSuU8fQgZwTzHn8K+BIs6ITe90+6Gz0
         1Ac9DaOFJOvcKFuIzL71DE6RvObivFnCUnFMW8N1uD11zetR0gR9iGSFiQ82arRH9hrr
         96+A==
X-Gm-Message-State: AOJu0Yx1MZ0WT1wqYCExD7KnZFpIuXICmJZX6UbPYjknEDJLSE1I+SqT
	N6zwxje5sPAi4nZzGwsOrccogHeCFMy+P5fmNlgX1QqiBg25zLHS2cip7Jbt3Pxxj6ZpCDhAAEF
	2+tyiMdmCVJZRi5xZp5/lbwJhUjpkm3aUol+qnw==
X-Google-Smtp-Source: AGHT+IEWccy925AQMfhM6Ao/P7dAUNQoLHIHN3lz+2407e4T4Z1Mk+wp0KzUyMpKNH5DdVtdq9OMKeaA+bt2xt1htso=
X-Received: by 2002:a17:906:eb17:b0:a68:b335:76b2 with SMTP id
 a640c23a62f3a-a699f663bcfmr160624866b.20.1717592972452; Wed, 05 Jun 2024
 06:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <17D61DA49AE74721.2477@lists.openembedded.org>
In-Reply-To: <17D61DA49AE74721.2477@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Wed, 5 Jun 2024 15:09:21 +0200
Message-ID: <CAHUKmYYYfMBX_Tw7GS6_PH9AXEaFirjT5GZhK4yUGHPe9eRTfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] build-appliance-image: Update to master head revision
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000fe0d96061a2446a7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 13:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200366

--000000000000fe0d96061a2446a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, please ignore this email. I was on the wrong branch.

On Wed, Jun 5, 2024 at 3:08=E2=80=AFPM Etienne Cordonnier via lists.openemb=
edded.org
<ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> index e406968df2..520d4f1f5f 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -26,7 +26,7 @@ inherit core-image setuptools3 features_check
>
>  REQUIRED_DISTRO_FEATURES +=3D "xattr"
>
> -SRCREV ?=3D "17723c6e34096a53fb186cc70cfc604bb30da8b9"
> +SRCREV ?=3D "06cba9abc4dcb630142be7606f5272be8bcb2e36"
>  SRC_URI =3D "git://git.yoctoproject.org/poky;branch=3Dmaster \
>             file://Yocto_Build_Appliance.vmx \
>             file://Yocto_Build_Appliance.vmxf \
> --
> 2.36.1.vfs.0.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200364):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_200364&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DNvtXcCOMwyadzWMXIbAGRSDG2qFy-wv3TheikoQZNZWEreRGJywHoKGEWyVj9Sp1&s=3DZ-h=
krMv3BKwh0OZFGAl6A5IbpdVbWshodjcIe90BSdM&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_106502540_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DNvtXcCOMwyadz=
WMXIbAGRSDG2qFy-wv3TheikoQZNZWEreRGJywHoKGEWyVj9Sp1&s=3D-xkBPruLvrtSrb22eDm=
cinJF2ak1t385CqLCTTF35Bk&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DNvtXcC=
OMwyadzWMXIbAGRSDG2qFy-wv3TheikoQZNZWEreRGJywHoKGEWyVj9Sp1&s=3DAenuc3d23esQ=
knrM9KQhCtJYd9XpE68iAuXuCfF_r54&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fe0d96061a2446a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, please ignore this email. I was on the wrong branch.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Jun 5, 2024 at 3:08=E2=80=AFPM Etienne Cordonnier via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a =
href=3D"mailto:snap.com@lists.openembedded.org">snap.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/images/<a href=3D"http://build-appliance-image_15.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0.0.bb=
</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/images/<a href=3D"http://build-appliance-ima=
ge_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15=
.0.0.bb</a> b/meta/recipes-core/images/<a href=3D"http://build-appliance-im=
age_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_1=
5.0.0.bb</a><br>
index e406968df2..520d4f1f5f 100644<br>
--- a/meta/recipes-core/images/<a href=3D"http://build-appliance-image_15.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0.0.bb=
</a><br>
+++ b/meta/recipes-core/images/<a href=3D"http://build-appliance-image_15.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0.0.bb=
</a><br>
@@ -26,7 +26,7 @@ inherit core-image setuptools3 features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES +=3D &quot;xattr&quot;<br>
<br>
-SRCREV ?=3D &quot;17723c6e34096a53fb186cc70cfc604bb30da8b9&quot;<br>
+SRCREV ?=3D &quot;06cba9abc4dcb630142be7606f5272be8bcb2e36&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/poky;b=
ranch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/p=
oky;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Yocto_Build_Appliance.vmx =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Yocto_Build_Appliance.vmxf=
 \<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200364): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_20=
0364&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DNvtXcCOMwyadzWMXIb=
AGRSDG2qFy-wv3TheikoQZNZWEreRGJywHoKGEWyVj9Sp1&amp;s=3DZ-hkrMv3BKwh0OZFGAl6=
A5IbpdVbWshodjcIe90BSdM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_200364&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DNvtXcCOMwyadzWMXIbAGRSDG2qFy-wv3TheikoQZNZWEreRGJywHoKGEWyVj9S=
p1&amp;s=3DZ-hkrMv3BKwh0OZFGAl6A5IbpdVbWshodjcIe90BSdM&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_106502540_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DNvtXcCOMwyadzWMXIbAGRSDG2qFy-wv3TheikoQZNZWEre=
RGJywHoKGEWyVj9Sp1&amp;s=3D-xkBPruLvrtSrb22eDmcinJF2ak1t385CqLCTTF35Bk&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_106502540_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DNvtXcCOMwyadzWMXIbAGRSDG2qFy-wv=
3TheikoQZNZWEreRGJywHoKGEWyVj9Sp1&amp;s=3D-xkBPruLvrtSrb22eDmcinJF2ak1t385C=
qLCTTF35Bk&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DNvtXcCOMwyadzWMXIbAGRSDG2qFy-wv3TheikoQZNZW=
EreRGJywHoKGEWyVj9Sp1&amp;s=3DAenuc3d23esQknrM9KQhCtJYd9XpE68iAuXuCfF_r54&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DNvtXcCOMwyadzWMXIbAG=
RSDG2qFy-wv3TheikoQZNZWEreRGJywHoKGEWyVj9Sp1&amp;s=3DAenuc3d23esQknrM9KQhCt=
JYd9XpE68iAuXuCfF_r54&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000fe0d96061a2446a7--

