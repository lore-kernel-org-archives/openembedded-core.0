Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.21002.1630930321354336722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 05:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LSzfRnnw;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id t26so3684943uao.12
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 05:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WEx4BdGhSw1sTMbO06/fT9uTg6OnBMbBvB6mFVOvZyM=;
        b=LSzfRnnwDLXw8I0SL8Ov0IrqY/eUn5G6tQaSn1/DMjtywFlVdWt+vW4ZtmTArXfhj4
         pxVAaf4qFXAmazf+zT8DCc4OQOEkMAhBJtKfSKBs9yfeN1DV0hCVHuZ6SjfVv3fMvG95
         u1eco14gKYZ+ICF/+rmY+LynsTR7JPTfkZLJslstRCx1MQ6CereNgzrCI/O2sFnmVHGU
         uWRTaFMQ42oT/FbpUAfO8cDwfS5Jl62+CaB3C6++lRcKzdF+0Wege2pYsa0B7kKeynXk
         sAgPi7NVbFChBpH0x+KBMqfze1Sea/P835hnzJq3G5Yynjq2ArI76Kbt76CiDLLCKSA6
         207Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WEx4BdGhSw1sTMbO06/fT9uTg6OnBMbBvB6mFVOvZyM=;
        b=rOl2FK+MbfbgBlMetIiOH6ljUHt2jHr31noqHWThjTyMKOzF3WXOhzLDd1S/XG+PgQ
         Jq+bpigkUgtBzMo6oDPhC4X9/dekBz8KB8mXEZ14dTeN2QqrcE9ykRJ48sGnDB+KBznh
         K7jHWS0nz8yAmVCEg1ztQMIXBzp+ByZEahEWcDutH8nGz5pLTluGExNdnWZkLNaw8O71
         kUH/sreObGxu6kGNuVco54n3hnZQHzdN+Atboxi+cXS3vTXdzap13eEBWyn8jOSpuQsH
         YSsSRVyIj7XBN3LoMeWt876Aw+JrMOpfpEnqTS5xOxbf+l/9i2e43wjkG7A8PMvmnBsm
         S3Tg==
X-Gm-Message-State: AOAM531OK7YgC8US4iLD5c+48HDDAcctysbHyu+bOmcLfguZ0qyJ3UNz
	E9coOvqqgbz1DjAP3SH9sKNeeLgKZ3OX0fiD/sU=
X-Google-Smtp-Source: ABdhPJz/Mdb0cKvoLKVllaOsYaboKFn/a7+73MVH+mvTfJejQ+Wgw/dOcxyGIEEH9NdsGU7zl5NDow5VqIwMTjPX/AI=
X-Received: by 2002:ab0:4305:: with SMTP id k5mr5117284uak.52.1630930320382;
 Mon, 06 Sep 2021 05:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210905235707.861-1-changhyeok.bae@gmail.com> <YTYCLo3T6uCliJAa@piout.net>
In-Reply-To: <YTYCLo3T6uCliJAa@piout.net>
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
Date: Mon, 6 Sep 2021 14:11:48 +0200
Message-ID: <CACrLJgDj2dYjuhnc4PN7ncAFa58VKmyrmu_p3z64zAshxe1K7A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] iproute2: update to 5.14.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000066608e05cb528ec6"

--00000000000066608e05cb528ec6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for commenting.

Actually I tested it locally and created another laptop because of network
issues.
I missed .bb in file name. I will update it soon.

Best Regards
Changhyeok


2021=EB=85=84 9=EC=9B=94 6=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:57, Al=
exandre Belloni <alexandre.belloni@bootlin.com>=EB=8B=98=EC=9D=B4
=EC=9E=91=EC=84=B1:

> Hello,
>
> On 06/09/2021 01:57:07+0200, Changhyeok Bae wrote:
> > Signed-off-by: Changhyeok <changhyeok.bae@gmail.com>
> > ---
> >  .../iproute2/{iproute2_5.13.0.bb =3D> iproute2_5.14.0}            | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-connectivity/iproute2/{iproute2_5.13.0.bb =3D>
> iproute2_5.14.0} (75%)
> >
> > diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
> b/meta/recipes-connectivity/iproute2/iproute2_5.14.0
> > similarity index 75%
> > rename from meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
> > rename to meta/recipes-connectivity/iproute2/iproute2_5.14.0
> > index 44575bd50c..27fb5c8866 100644
> > --- a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
> > +++ b/meta/recipes-connectivity/iproute2/iproute2_5.14.0
> > @@ -4,7 +4,7 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
> >             file://0001-libc-compat.h-add-musl-workaround.patch \
> >             "
> >
> > -SRC_URI[sha256sum] =3D
> "72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36"
> > +SRC_URI[sha256sum] =3D
> "210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4"
> >
>
> On the autobuilders, this does result in:
>
> ERROR: Nothing RPROVIDES 'iproute2-ss' (but
> /home/pokybuild/yocto-worker/check-layer/build/meta/recipes-devtools/elfu=
tils/
> elfutils_0.185.bb RDEPENDS on or otherwise requires it)
>
> Did you build test this patch?
>
> Regards,
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Thanks
Changhyeok

--00000000000066608e05cb528ec6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for commenting.<div><br></div><div>Actually I te=
sted it locally and created another laptop because of network issues.</div>=
<div>I missed .bb in file name. I will update it soon.</div><div><br></div>=
<div>Best=C2=A0Regards</div><div>Changhyeok</div><div><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2021=EB=85=
=84 9=EC=9B=94 6=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:57, Alexandre Be=
lloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.bellon=
i@bootlin.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 06/09/2021 01:57:07+0200, Changhyeok Bae wrote:<br>
&gt; Signed-off-by: Changhyeok &lt;<a href=3D"mailto:changhyeok.bae@gmail.c=
om" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../iproute2/{<a href=3D"http://iproute2_5.13.0.bb" rel=3D"noref=
errer" target=3D"_blank">iproute2_5.13.0.bb</a> =3D&gt; iproute2_5.14.0}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-connectivity/iproute2/{<a href=3D"http://ipr=
oute2_5.13.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_5.13.0.bb</a=
> =3D&gt; iproute2_5.14.0} (75%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-connectivity/iproute2/<a href=3D"http://ipro=
ute2_5.13.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_5.13.0.bb</a>=
 b/meta/recipes-connectivity/iproute2/iproute2_5.14.0<br>
&gt; similarity index 75%<br>
&gt; rename from meta/recipes-connectivity/iproute2/<a href=3D"http://iprou=
te2_5.13.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_5.13.0.bb</a><=
br>
&gt; rename to meta/recipes-connectivity/iproute2/iproute2_5.14.0<br>
&gt; index 44575bd50c..27fb5c8866 100644<br>
&gt; --- a/meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_5.=
13.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_5.13.0.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/iproute2/iproute2_5.14.0<br>
&gt; @@ -4,7 +4,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/net/=
${BPN}/${BP}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libc-compat=
.h-add-musl-workaround.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;72a2e53774cac9e65f7b617deebb2059f87e8960=
d6e9713e4d788cea966f1b36&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;210fa785a52f3763c4287fd5ae63e246f6311bfa=
a48c424baab6d383bb7591d4&quot;<br>
&gt;=C2=A0 <br>
<br>
On the autobuilders, this does result in:<br>
<br>
ERROR: Nothing RPROVIDES &#39;iproute2-ss&#39; (but /home/pokybuild/yocto-w=
orker/check-layer/build/meta/recipes-devtools/elfutils/<a href=3D"http://el=
futils_0.185.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a>=
 RDEPENDS on or otherwise requires it)<br>
<br>
Did you build test this patch?<br>
<br>
Regards,<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Thanks<div>Changhyeok</div></di=
v></div>

--00000000000066608e05cb528ec6--
