Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.9088.1624633964634761455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 08:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M9u0LtRR;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id h2so13903659edt.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MP7j5xjidhdwXXV9/ZqIGjq6tZduIhKcjHNbNheAafw=;
        b=M9u0LtRRnNX15qwQ3cVV34vQs3JwYcFxH+NWwgkAtAyJFeX5ju9tdkfqLrXErpadRU
         mw6v+BKnf7IGjE91M3HD/n5cfXGoLsdn+AIXbpycem666XfG5Hg0lQz7R+gAnBQbAkZ/
         7XLS8ajGzczB7VGmb29+MJBjNagAyAn964IMwWDSo+v9+WRezVhYHf/S3aWOjs8/Y6zC
         +0fB9raYkQj5NR1LyFu2VtC4K+zBKLEiP4Z2Fojfr9rjR0ogoVkFB8MF7qpRln7EUBz/
         H0yc2KXyCOGtq1a7Yu9QeevST5zMNwqDLdDXxFzhiwfEQIk1DNWEq9fQIV5MbzvMGjyC
         dJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MP7j5xjidhdwXXV9/ZqIGjq6tZduIhKcjHNbNheAafw=;
        b=S40KNSJgHOlJxTEdiQTA2CRgonJqrh3g2ImEO1JDsTQXp/sm0K0Ni7TiwBY6CxKjuo
         qayPH8aatgY44ghqEgFwi5mxqJoqMYeVPorGH6VXP5tKhaCqpAV7VCk0uD57gH88n/2T
         8CCe1B41CBewMEYR51mOYsY7Qn9T/w6WyimbRUGj96tjKZgApoC6me6YMCe3M8lgmlyi
         BTDSp5zQeHUMzTgS/ZsgHTBBVr6APSL923NXlYnj0j7QKWvfT9MRiQoKicBXiENz9yhM
         t5vVdDM3NplNuEZx1ufFDKx12dPFg9i6eZgrExzULBq9H9bNntwHzBZmec1FLsGvc4nD
         3Stw==
X-Gm-Message-State: AOAM532SA4Ra+v0OsvzIYVCck00myXS6IhwZ8OFT3TOEP6xtiWIE+5tD
	wZCm1LvuyQeWfO0giA0vGxJFD5FRdC5HL04AOGXH0uQOCWl/Mw==
X-Google-Smtp-Source: ABdhPJy09UmO1MmMEs+94CabEK5XUYnvxjDkjgjEHjZCmxvk8/BgLlAa0vqW9y2rXVnERdT5fcRsyL1jSneDrmGXwjE=
X-Received: by 2002:aa7:cf03:: with SMTP id a3mr15519172edy.27.1624633962911;
 Fri, 25 Jun 2021 08:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210625151024.23062-1-trevor.gamblin@windriver.com>
In-Reply-To: <20210625151024.23062-1-trevor.gamblin@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 25 Jun 2021 11:12:31 -0400
Message-ID: <CADkTA4M8MEoiBPwSwgJXF+BnC+dMiOh4g6Xv5s_Nwu9xJ23cUA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-yocto/5.10: update SRCREV for NF support
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Ignore this change.

When I release the next set of -stable kernels, this will be part of it.

As of now, those changes are not ready for release yet.

cheers,

Bruce

On Fri, Jun 25, 2021 at 11:10 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> yocto-kernel-cache/yocto-5.10 has been updated to support the latest
> kernel netfilter/nf_tables configurations, so update the SRCREV to match.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> index 877e8d2946..7d5cdaad90 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> @@ -12,7 +12,7 @@ python () {
>  }
>
>  SRCREV_machine ?= "6186341e981ad4fd3941c7c9af509923bbe2a2a5"
> -SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
> +SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> index f99782c1be..1be6ba8150 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> @@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
>  SRCREV_machine_qemux86-64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
>  SRCREV_machine_qemumips64 ?= "769a7118662a2256e20df60be9c9727f9c5878b0"
>  SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
> -SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
> +SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
>
>  # remap qemuarm to qemuarma15 for the 5.8 kernel
>  # KMACHINE_qemuarm ?= "qemuarma15"
> --
> 2.29.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
