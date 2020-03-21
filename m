Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.11718.1584808980436846247
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 09:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JTFxXdxh;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id z3so10898681edq.11
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SQTLhPYT0p9ziMEDtuFwbB2jPqbA2zzGnrtWNZsEy5k=;
        b=JTFxXdxh7UhMkbToZXEAHYx2035AvoyfTnAkn/ra8Vhcd6I8XK/a9o0hCJ9qSu9xSe
         VcniiTgALR4fDYYxNUH51n+hRoRQNZPq2DdqxVOCBsaBL0Ze2+YFDTuq0CZaNCmSP3bT
         l11hZwrvs011xi80pKnyM97QPk/MRmImz0QPhiW89nPDuKnlpYR3EdmnaFAGHCl7TFYn
         uBBdyE3c8CWIg4QsGOJmNt5L0ynXuPYokA09m3RXnIDFCdZBdVhaafzFjgjZ8I7bKrqh
         uuvBjkL9pgmAj4kY5/zMXlefxccj35IQem/4rxhRIGdaxumDEncZ7Rnkhe9uaunawFAp
         7zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SQTLhPYT0p9ziMEDtuFwbB2jPqbA2zzGnrtWNZsEy5k=;
        b=UsjUTtIy6yk7jhWqnw2dRWmTAVhDTjGsat4BubUZpfZSNrt6xsr3+CXWkJTR332VBX
         noPmJ4ubXQO4wya7i/OBUrdMZie/VpZL5RdBoFeDhR4eFYutTKUOmC8p7Geh5wmaFzpW
         k5XYYf9q2bo3ejWKx6MXVLQhfn0iXMyWk4O9gzf0fB/ZZPKLP0WowaRgNmpZtGJyV51a
         ZgQ0Iw1cKRa29+abC1vg02TfkvK/VdmFysusOGUGwtCr+3Vf0YJ6yP4oUKVYHJ3CA3yJ
         rX1uIgMg8Zw0uIsD8+j0hMIowJvtE0d1BkC4WhCtRK4HmEjuAYPn/eQHL40qEbQOojK1
         2VHw==
X-Gm-Message-State: ANhLgQ16Bi0ZQVvoHVKaCKEVxizpU/yXv1tpOc7Q/adpMp/qlHFGr9na
	ipswVAiVPMW3H526r7i6rB32t3B0SIOTKJz7Z7Q=
X-Google-Smtp-Source: ADFU+vtnZ5/26utdEp2nnIvo2KMur7x/340EmFhE/AYL595zkTK0CabFIVZZAKZfncuYS+lVuB9/51bpIURyiO2z274=
X-Received: by 2002:a17:906:aed3:: with SMTP id me19mr13812419ejb.6.1584808978858;
 Sat, 21 Mar 2020 09:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200321050218.33726-1-kexin.hao@windriver.com>
In-Reply-To: <20200321050218.33726-1-kexin.hao@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 21 Mar 2020 12:42:47 -0400
Message-ID: <CADkTA4N-6YbiF+q=u9QpzbTP1q4JJfLOVK6v+b3Nkar37LbJFA@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto-dev: Bump to 5.6-rcx
To: Kevin Hao <kexin.hao@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 21, 2020 at 1:50 AM Kevin Hao <kexin.hao@windriver.com> wrote:
>
> The -dev kernel has been upgraded to v5.6-rcx and the COPYING file in
> the kernel source was updated by kernel commit 74835c7db032 ("COPYING:
> state that all contributions really are covered by this file"). So we
> should also update the md5 checksum of the COPYING file in the
> linux-yocto-dev.bb in order to make the -dev kernel buildable.
> Also update the LINUX_VERSION at the same time.

Please ignore this patch.

I already have a queue that includes this.

Cheers,

Bruce

>
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index c364a97cba4b..06a9108fab49 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -30,11 +30,11 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
>  SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>  SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>
> -LINUX_VERSION ?= "5.5-rc+"
> +LINUX_VERSION ?= "5.6-rc+"
>  LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>  DEPENDS += "openssl-native util-linux-native"
> --
> 2.25.1.377.g2d2118b814c1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
