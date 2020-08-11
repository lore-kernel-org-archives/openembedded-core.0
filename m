Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.1442.1597170465796799579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 11:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=etL19JA/;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.67, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f67.google.com with SMTP id c16so14138947ejx.12
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4c+CsJbrRJgtspm66AJvMNH+A193P7eJF9YX8bhrbIk=;
        b=etL19JA/EvOES/OD6NGaxIDdSwihTb03K5arCKo4sEGPerFgIhOGmbLmvhW8v8lKD6
         G1m9WK84cNOVUJWw+XdF3fyAcPvba99O7ghmdsAOmUPrL9xbLCBE5eLKo87pGDGm0v/F
         J1u6c39xhtycS7Ix20yxTAVkZHwftbB+aYNldz2cKJjQj5/hCpjEO3v68NXiMU3P7wE4
         Qs4eJpfq6zQ2rnVjB1hORxA7p5IFPT86+BOXTqHiqZOhj0538ivP61akrvIoTvk4r8IZ
         OrxQ5vKucODfbp5UnE+dePxtNJhAt6gtCgrtboH6I4lMey7wJsM+4TGcranU42kx4dzG
         nr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4c+CsJbrRJgtspm66AJvMNH+A193P7eJF9YX8bhrbIk=;
        b=tsqikPOP0Dwu5hMwwo8CewwLH2g3F1zSYXsuyKaLddF7lUTgn57DIlR7lftBGma88B
         38z1DILkbKdb0PNOHKN+6SrS1tNsiepxuB5O9xw6mZwKmA+IyLhnujuisLm3zLwE21ls
         GSPLd2I8MxkafILNunQByhbvqAeW+yT0fOO0sbidN75CYoxGLyP2+YnQ9RYKez/d1rEv
         uhTsNw2xgnbidS2/1zBnkJuN07jLLMjaGI/eY6vQiQxTih4O46a/vf/FBcMxs4ZsHu5E
         zbU0kxauw9QolZ/hckNFE0jkK7EMCCif4Q5x69kb0tFtCqFNfk0sbrxicIIigs6x/RzI
         sgAw==
X-Gm-Message-State: AOAM533nSMxP+B72h4JToU7QSEPwcVbgICNFjtNzNj/1QWsr4eOOupBk
	yiIB2pdq5PrirsTFuHpAz+fQ9o1S/6TLK6CDHzM9Mw==
X-Google-Smtp-Source: ABdhPJzBtHRQWgRkhqhs/gBcqoQa2ehrDyFOXCuugb0vUcQ+5kV/yNW3U+UtlSHeIXORAOxaV7GW91cfS1DbjlCas+w=
X-Received: by 2002:a17:906:1911:: with SMTP id a17mr26106727eje.431.1597170464191;
 Tue, 11 Aug 2020 11:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200811181701.2638189-1-raj.khem@gmail.com>
In-Reply-To: <20200811181701.2638189-1-raj.khem@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 11 Aug 2020 08:27:33 -1000
Message-ID: <CAOSpxdaJtBOv18SzU0nDdQpAPMdaErFx4U8VGEBDNtb-=fDogg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] go: update 1.14.4 -> 1.14.6
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Zhixiong Chi <zhixiong.chi@windriver.com>
Content-Type: text/plain; charset="UTF-8"

Zhixiong Chi submitted a patch today to fix CVE-2020-16845.

I don't see that referenced in your patch, so I assume we'll need to
take both patches.

Will do an autobuilder test this morning with both applied.

Steve

On Tue, Aug 11, 2020 at 8:17 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Includes security Fixes for CVE-2020-14039 and CVE-2020-15586
>
> (cherry picked from commit 97d5c2d1f2dffe2518f46bbe57cb9348eb59c633)
> (cherry picked from commit 6591d269792fe864d7af4e379035f1cebc4510f5)
> (cherry picked from commit c9011d04eb624aeabf5d707e88de80137bcc2eb1)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
> index c52593db6b..64c2768f7e 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -1,7 +1,7 @@
>  require go-common.inc
>
>  GO_BASEVERSION = "1.14"
> -GO_MINOR = ".1"
> +GO_MINOR = ".6"
>  PV .= "${GO_MINOR}"
>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>
> @@ -18,5 +18,4 @@ SRC_URI += "\
>      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>  "
>  SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> -
> -SRC_URI[main.sha256sum] = "2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676"
> +SRC_URI[main.sha256sum] = "73fc9d781815d411928eccb92bf20d5b4264797be69410eac854babe44c94c09"
> --
> 2.28.0
>
> 
