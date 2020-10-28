Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web09.4801.1603922981399894281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 15:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XxpDgiJj;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id c6so458380qkg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 15:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgjUJiejHQnAgQhahxG6wXBR6BaXd2NM9pgrOuGB4NI=;
        b=XxpDgiJjHV9YZStdrCEJQRUlK4ySMjsX7KZGPaHb2rUUR9x3MqeNAoP4lLufcY7jr1
         iKgFIbdMO7OzkvFstKUCzp6d6ojEmJttuqiEPHvOAu5lXJGe6ZKuAKgxj7mktKrZT6ZC
         2stLDIZVyDjRcRh+B/HOmEhoacJN31So5OzlIj1HrE61LfJ5s9NiKy+1Nqo2D7qGhPCI
         1ABH4nGYz96aavPSEic74x9tMsIE5J/aVACxfsYCb1HmxGwtFnPsHEOgbdUirRsMxscb
         p2637WWRYGlnfno9r7M5QegEYjRckNElRc3HEt0nKEf98zEf2rm5VaPEerhgAmyrfz77
         ofeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgjUJiejHQnAgQhahxG6wXBR6BaXd2NM9pgrOuGB4NI=;
        b=V6jAPrL3sMdN6lAtS7bN5Yd21buIJVSh87IM3CotL1W/oLOEzvUOIQwCAgmBO+OinC
         hKMWUX2FVBCFEmFm9Pc1+GSqrukU7hWVD1J/bSLVTt8DCpIxS5tfJhEghZEJqRsK83Ki
         wY5CkVNrGP2U4pGMGGN2Ux5AN1Nhmeh8yAQpedGGbyTKFTDPSIFeibwzGvAS0SIWS1zQ
         QeraT/IGz/Xi3UpgJfrOVwS4OuBx7G54lbzXoKB25KQ/KcYsQhWHWyVzO/vBo7/mzr2x
         MOHlMg4IoVxbjDo/CXND0703K3Cdl0r8yjdUDkd15kNzbzQ9yxKVyUM1mYhispxiEDOY
         5kkQ==
X-Gm-Message-State: AOAM530DocIEd5hKqO0cm1v2SVPwRVnBRlrmhkzR0qQxfQtJHawZ/RHL
	lO4LgvMhbjglc9omJmJ+W+BAu/eRo1xnbZisgRU=
X-Google-Smtp-Source: ABdhPJz3a3031ZyJeGANLkDxtrtB/p2+s8geHV0c55M+S1Ii5oKAMZZtDznio/C7niNLFa6x7xQNITOedbQTSc/MFHQ=
X-Received: by 2002:a05:620a:1187:: with SMTP id b7mr1014983qkk.212.1603922980397;
 Wed, 28 Oct 2020 15:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com> <20201028210558.21070-25-alex.kanavin@gmail.com>
In-Reply-To: <20201028210558.21070-25-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Oct 2020 15:09:14 -0700
Message-ID: <CAMKF1srtg4ML0FUCCqkQEZdz4xgvtd+9M0S5P1N6=eang+8Aow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/33] libhandy: upgrade 0.0.13 -> 1.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-gnome/libhandy/libhandy_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

perhaps rename the recipe to libhandy_1.0.0.bb and drop setting PV in recipe ?

>
> diff --git a/meta/recipes-gnome/libhandy/libhandy_git.bb b/meta/recipes-gnome/libhandy/libhandy_git.bb
> index 9f74014640..01b932a528 100644
> --- a/meta/recipes-gnome/libhandy/libhandy_git.bb
> +++ b/meta/recipes-gnome/libhandy/libhandy_git.bb
> @@ -3,9 +3,9 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
>  SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
> -SRCREV = "7a193d7692c9c76a1a94f17c4d30b585f77d177c"
> +SRCREV = "94313c206258860b2428712e7ece1d02c5177857"
>  S = "${WORKDIR}/git"
> -PV = "0.0.13"
> +PV = "1.0.0"
>
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
> --
> 2.29.0
>
>
> 
>
