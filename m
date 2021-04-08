Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9666.1617894615240231636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 08:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=U8+cQL8e;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.52, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f52.google.com with SMTP id a12so2491414wrq.13
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uitUOYId7m1XjEn+oiG3rN+mjf5KxvUCvO7QIS7HcfQ=;
        b=U8+cQL8e9EHDK4AJ24OsMUBAmf5wteJUZ8gvngf0Bg99nPC9fdxel1JIA5qVdkfR8H
         /tmcoW/paRCM+tnyjEdMoGHOtDGNoF/Qj3N1R7Ow0BCSjB4+fV7qfs9//EaFLEZ2YLS2
         E8xHtVFSf0iiBSe0W9ETI2SnSwQBCh5XwO+MD/oWZwE9wacPUCG4GVwHhSMIS8HfcWZ4
         D+Cu5+ZnG/gpa0tTRwG05guEq3Ku96niT/RJ3b3nxMeOeLo7zsg1IEj74MtW3ZfCKEL5
         6YrfGYZNySjj3otaMr3qDTpwHDUY2aGBuu/n8frsLp7Sl68r81d3bOU7jsKqwpXE3wDF
         CirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uitUOYId7m1XjEn+oiG3rN+mjf5KxvUCvO7QIS7HcfQ=;
        b=pvzXOdgNKsdPeUEkwQZ79Bpqcf2DWybZUmRBjcgbCVHtVXSREiw7Cir6eXZRGq7SRU
         9sQEUWrYfRaebG+sfybzbqs8WAONxuxdZokvMjPVcDcFSi6BCVI8VfQak2pplCf2cCO2
         ieC/ZxDB0GHz/uJdR4EeWwaCrT928iEZ1mXaANuECV695mzQACSiqFCS1DwZMZ3X+H+h
         02G9uFuWCBXSxolX24ViE/h5sT5ECOIN6F3qVEwVk3Du4gjbXUUhS0Zyr574i+m9feRo
         70HjNkof/9sY4wFUUeFkp4CVnfQ7hbU7twHXkG16e60FNiP+BXnJeORVc3E1LU4iCWCJ
         NIQQ==
X-Gm-Message-State: AOAM531Is4GThdKGHURTvh1QJ1yv2G7/tk8DItaKjBOUZ/IiJdlN4P+O
	RG79vssRXHokL9EzQvjnDUKdWk7MIDlqcSNhUDQenQ==
X-Google-Smtp-Source: ABdhPJwHQm6hRcgmUMvn7zXywAb1TANvN+JLNYE6K5gl21raHGzGwoA/5pN556rqoR6WCyawtfnGA5HX5sz4NZZ25Lo=
X-Received: by 2002:adf:f98c:: with SMTP id f12mr9903361wrr.329.1617894613741;
 Thu, 08 Apr 2021 08:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210407141903.12612-1-anibal.limon@linaro.org>
In-Reply-To: <20210407141903.12612-1-anibal.limon@linaro.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 8 Apr 2021 05:10:01 -1000
Message-ID: <CAOSpxdYjjhcKO12YE_xQFQxWLDqDiqZoAMeDP2WGdqpuPJ9k8g@mail.gmail.com>
Subject: Re: [dunfell][PATCH] build-appliance-image: Update to master head revision
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard typically updates build-appliance-image SRCREV as part of the
release process.  So this will happen in dunfell as part of the 3.1.7
release process in the next week or so.

Steve

On Wed, Apr 7, 2021 at 4:19 AM An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.=
org> wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/m=
eta/recipes-core/images/build-appliance-image_15.0.0.bb
> index 925235db60..1aeb952db2 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -24,7 +24,7 @@ IMAGE_FSTYPES =3D "wic.vmdk wic.vhd wic.vhdx"
>
>  inherit core-image setuptools3
>
> -SRCREV ?=3D "c6483187f96c6d21b7129ad78de3ff976fbe5970"
> +SRCREV ?=3D "42514ade8bdb9502f49a56752561f6c2e9f23348"
>  SRC_URI =3D "git://git.yoctoproject.org/poky \
>             file://Yocto_Build_Appliance.vmx \
>             file://Yocto_Build_Appliance.vmxf \
> --
> 2.31.0
>
