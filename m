Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.5212.1605091755211850215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 02:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=K1FZdKLs;
 spf=pass (domain: burtonini.com, ip: 209.85.167.68, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f68.google.com with SMTP id 74so2546448lfo.5
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 02:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MXRc9gQ0HAJn82IvSClCn3/ytaYFOTkoWQqwv9KGf/A=;
        b=K1FZdKLs6iuyFonNVqVrDW3zvzpKd0xyOP2m+1ITjqaIOhVCdPyKVR6DQA0Yf0hUVV
         TJO1vtGHzldS2VVAkN3siBmiNETmMN+ejkOPizHIcotRVROgodH6zDL1smytoyGDNiTe
         IplsTa4fPAwivuJWIStXinfg4kp8FTqO/nrIed2mlhtE+6zcHhycI0Y+ITmDfFLdeu+4
         P8HI4+B0/noc7DGie/YtA8dvMH60dPsQCf2t3/Twxz0EI/QVb/vw1UqjO3TVSTulfmcy
         ZF243hHCXqQQdvBEe4ZER7yrWguuUSzRt2GmDpAIL4fdHjcEeADI4iWZ8HYACUHfEW5e
         uNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MXRc9gQ0HAJn82IvSClCn3/ytaYFOTkoWQqwv9KGf/A=;
        b=AJrc3dnsqIQSRSF9bSEiGV3z1LNm+6uDcXPJ6PCwulkZnuEBVtU/RHLvktrfpS2KJy
         ErS2Cdz79viaCOkBo2Ku/HINaHLsTCJI+UQ4VvaREkZe442FY6KW4zO5jGsO5P/RsFoP
         yPXtiWsT8uEnuuhNjZGedvQxTI7S9NDUViYn0UuuHPwUeZBdCGLKbzrXeMD4F06H7Emb
         JINOjX9NQi2jQkmxYq6y0ecZ8xWZUDExFdfGnyApS10CXL5COKszHMpUFL49hotHpzAe
         QZhHi/j6hj/9IivfUwUYQLZ/SmU9cp82LAnnU9tdGX+063X7P/04gPpSl4A/1H0O0p9o
         f4ZQ==
X-Gm-Message-State: AOAM532laa/jwqhyXrRwmv9iZWDEu0zGGkKONbtneSENdg3H8ba7fyfS
	tMUKn3yy4j+J1P0s3PuXDNvjBqobfNgrvpr138dIRw==
X-Google-Smtp-Source: ABdhPJwJCZbJxoNmSv9hKUjtY3pg6BIKcb3xPFbEDQWDIGEL54gQpaj4dstAMrxzOza+tzWPCmQn6vbgjGtkXZnaqaw=
X-Received: by 2002:a19:4296:: with SMTP id p144mr8849351lfa.205.1605091753286;
 Wed, 11 Nov 2020 02:49:13 -0800 (PST)
MIME-Version: 1.0
References: <1604893131-60530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1604893131-60530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 11 Nov 2020 10:49:02 +0000
Message-ID: <CAAnfSTvGf5YJaXF=sPrf_3HH1EoxznD+2F-==jaPrJVUJ1xV4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Please remember to build more than just a single recipe when testing,
in particular dependents.  This upgrade broke libical and webkitgtk,
which resulted in three iterations though the autobuilder and me
finding/backporting fixes as appropriate.

Ross

On Mon, 9 Nov 2020 at 03:39, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -License-Update:The address changes are as follows:
>   # Project: http://code.google.com/p/lao-dictionary/
>   # Dictionary: http://lao-dictionary.googlecode.com/git/Lao-Dictionary.txt
>   # License: http://lao-dictionary.googlecode.com/git/Lao-Dictionary-LICENSE.txt
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-support/icu/{icu_67.1.bb => icu_68.1.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/icu/{icu_67.1.bb => icu_68.1.bb} (95%)
>
> diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_68.1.bb
> similarity index 95%
> rename from meta/recipes-support/icu/icu_67.1.bb
> rename to meta/recipes-support/icu/icu_68.1.bb
> index 9e8091ba01..98aa6b7be6 100644
> --- a/meta/recipes-support/icu/icu_67.1.bb
> +++ b/meta/recipes-support/icu/icu_68.1.bb
> @@ -83,7 +83,7 @@ FILES_libicuio = "${libdir}/libicuio.so.*"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -LIC_FILES_CHKSUM = "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
> +LIC_FILES_CHKSUM = "file://../LICENSE;md5=002d2fdc32d17f0ec06e9a47f2c0c8d0"
>
>  def icu_download_version(d):
>      pvsplit = d.getVar('PV').split('.')
> @@ -112,8 +112,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
>  SRC_URI_append_class-target = "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[code.sha256sum] = "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc"
> -SRC_URI[data.sha256sum] = "7c16a59cc8c06128b7ecc1dc4fc056b36b17349312829b17408b9e67b05c4a7e"
> +SRC_URI[code.sha256sum] = "a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d"
> +SRC_URI[data.sha256sum] = "03ea8b4694155620548c8c0ba20444f1e7db246cc79e3b9c4fc7a960b160d510"
>
>  UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
>  UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
> --
> 2.25.1
>
>
>
>
> 
>
