Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.691.1632153435143522469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 08:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FLHH2h0b;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id z24so43511558lfu.13
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R/c+OafMrcvGk5ngnBfLof9jEZD1ExYkNForVGYvfeM=;
        b=FLHH2h0buymWH9kUIj4p81pMHb/6gjn6AFXKXRDogRGy7xejLv3ZrooFOQnhPJyuLv
         amLfu2ih8O4pYgXW55KYgRRZAx7kvMcXS7jS9Ifxa3bm3Kk1/DwgMfCUdIK9Krjo4fTg
         ybp8JX1RZJdLpgTreCrkfI8ANmPQBdk7nZuRtroPCHktuljdvGAB+kdAhkSm9YIbaSuL
         TSfEld3i6Xbg62jNi7cuATQa24xQNcpedDyiNm2njkWMEvhiuIUX6pkYc/+SHJ7PMZtG
         kziRdDD48CShem9vl38Y0k6P4rLX4dZsGt/4gQMKUd3meq9vVODZ0wzWgX15w+u068QI
         qouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R/c+OafMrcvGk5ngnBfLof9jEZD1ExYkNForVGYvfeM=;
        b=ufGZ7mP21nElZF/bqFiCs1vDJGWr3RRRR5pyW3cIoOjPybddGWwcxzjKAV2ULryLAA
         Be0Rv5zrCArYSMuSpCSTFTTJwlXmRybxTS9hQX3MQpQGv7UI5CZGDLtSY1Xvj2Vq6Uas
         YexN0Rb7b3cWZDlZsUMdySmJ59IiaclLSQoejHm7MajRkxCu+UBEVvzoPfuQypnr7n8d
         e31+ocS6awX7bvRDrPIdxwW8ZbM4GfLkNYm/FQBzlN2raBiwLzqYSBVUljw1YE04rw94
         AktAe+NPnUtlnbqymyblNLppknT8OBnlgO03lMgnjdzEkREfAxLzH2R0FRn8s7iqu7hY
         gw2w==
X-Gm-Message-State: AOAM530WUKfvJpZT7JMzZB4Bt9+zcODbxLiqqjGjFBW5TaXz21NJEZU8
	k6CCLEUqP9TOLSL9KTqZ9zW//tBfWMolp9CQwXA=
X-Google-Smtp-Source: ABdhPJw1nsaBMUHFAQ3ZjTwHyMf/IIyAelB0aZxMPwsMGnRv/b2rGEqE2I7U613njjTaS+ig87sShV0LYhqR7F2fpEU=
X-Received: by 2002:a05:6512:1308:: with SMTP id x8mr19802376lfu.161.1632153357039;
 Mon, 20 Sep 2021 08:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210920100704.312573-1-quaresma.jose@gmail.com> <b38d915afcb3ddae8f582e106e880f960cc71f95.camel@linuxfoundation.org>
In-Reply-To: <b38d915afcb3ddae8f582e106e880f960cc71f95.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 20 Sep 2021 16:55:47 +0100
Message-ID: <CANPvuRnim-knH2-0arG6+MZ4bSRgqmRDhQrOjUpF4KoLR82pcw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] poky: fixes backwards compatible for the SDKPATHINSTALL
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 20/09/2021 =C3=A0(s) 11:57:
>
> On Mon, 2021-09-20 at 11:07 +0100, Jose Quaresma wrote:
> > Previously the SDKPATH can be used to custumize the path
> > of the SDK installation. Drop the SDKPATH and use SDKPATHINSTALL
> > without that brokes backwards compatible for any distro with
> > SDKPATH customized.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta-poky/conf/distro/poky.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/po=
ky.conf
> > index 5b54df874e..7dad7012ba 100644
> > --- a/meta-poky/conf/distro/poky.conf
> > +++ b/meta-poky/conf/distro/poky.conf
> > @@ -24,7 +24,7 @@ DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT} ${PO=
KY_DEFAULT_DISTRO_FEATURES}"
> >  PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
> >
> >  SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TU=
NE_PKGARCH}-${MACHINE}"
> > -SDKPATHINSTALL =3D "/opt/${DISTRO}/${SDK_VERSION}"
> > +SDKPATHINSTALL =3D "${SDKPATH}"
> >
> >  DISTRO_EXTRA_RDEPENDS +=3D " ${POKY_DEFAULT_EXTRA_RDEPENDS}"
> >  DISTRO_EXTRA_RRECOMMENDS +=3D " ${POKY_DEFAULT_EXTRA_RRECOMMENDS}"
>
> Distros need to switch to use SDKPATHINSTALL.
>
> This change breaks the poky default value instead of any distro that has
> customised and disables the SDK hard coded path fix which was the origina=
l point
> of the change.
>
> Cheers,
>
> Richard
>
>
>
>

I understand that fixing this on a customized distro is easy and we
only need to overwrite SDKPATHINSTALL if needed.

So,  to take advantage of the:
 sdk: Decouple default install path from built in path
 https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Ddunfell&id=3D6=
fef2a1c2ca8a4450c8a4b49e6eb5e01f80ef97b

The dunfell users need to avoid the usage versions strings in SDKPATH
because they change over time and
customize the SDKPATHINSTALL as well, having version strings in the
last is not a problem.

All distros need to do what poky distro does at:
 poky: Use SDKPATHINSTALL instead of SDKPATH
 https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Ddunfell&id=3D6=
7dbe8a1c2b485d0cec174d28107b0ac8ea77d5f

You can drop this patch.

--=20
Best regards,

Jos=C3=A9 Quaresma
