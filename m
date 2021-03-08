Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.4203.1615241483321911473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 14:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h9ZfWbrc;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id x4so16905049lfu.7
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 14:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AGCHEHOXihPGfBdHdo+xu+N0e2SaEJyr0HLY7NcjCnw=;
        b=h9ZfWbrcZU9X3SWU7ipeUvy8T655+kTSVKJzhVRze248MLpBy7zbir5HCQOTa4916K
         wk6LVst9jLZRaZbvA/acKZn6dZoVs86/LfQekslvvJFW8uqONwWZiFYdZFiOY0kvxzR1
         TvjyE+IV1EcBi+43w12qn6/ybvHnqx1mpZ5V5YiMJobdFrw3ZL41Cjkaz70WBcXaH5AV
         CkZ1+fu9BQyGyagpPpt+/Z/kPLkSC4cM3fJQJywiTgQUrUN4Kcx41NHWf6djn0odXtfh
         YdRFNUNSLy6PIsd6liGG9sXYTajoYJdtSFitmFI9HjnprhbJdSLjP0uwaVdl0VyKbOue
         oAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AGCHEHOXihPGfBdHdo+xu+N0e2SaEJyr0HLY7NcjCnw=;
        b=T4sBZM9tcBnVZySpL15YjmcxYa1mf7jyubAKHr5HvYCsvTjSWxlxUCLxXrxOydL0xq
         l3i6VytrGAPDUIKmBjLMAT3DyEwOQmdInGXAoytX/gM04RfxOgWEPAMfoyVDhpJh4eLe
         Bxn+1FDWB4DjHvPb4OxMx/krqNpeX+6SY6a1mtCLB5gphJJCUWjROOD2aJYDFHBkJuvQ
         sq2dXd55RcSTlv5OaS1KMicJyJ7ZtJDr2o5Ogm88o/rlZJEXQ6fZO+F86MV50mWq5RR5
         0uYa6uyVEUt6AZgrr56hNzNjK8vw4JIrmO5SJzcs11PNOrc4xJ4aKsI1nMhkxwlZnTJq
         f8Ew==
X-Gm-Message-State: AOAM530A0J7KTva1D6eWzL4IMOf5YT1SMRPu4BgNIsPNSOFN4FxXsXVw
	5d8Z7FKBpgH7m09B5e+2h3WT7+oH8Gl2CbIBXNE=
X-Google-Smtp-Source: ABdhPJxAl0O3XCLqxlQiHxRai6+j6cSvwy0u8EvACQowr2qkVPN7excD0ahZNAyRmfdgB4AHEppiB9KQ9I80aNxabS8=
X-Received: by 2002:a05:6512:3081:: with SMTP id z1mr15642428lfd.257.1615241481295;
 Mon, 08 Mar 2021 14:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20210308193028.34418-1-raj.khem@gmail.com>
In-Reply-To: <20210308193028.34418-1-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 8 Mar 2021 14:11:09 -0800
Message-ID: <CAJ86T=WW59ZDOpvgEQXRCqwnJKCKpmVsUeFVPk8kUC5m8zCz=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] resolvconf: add missing dependencies to RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 8, 2021 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
>
> resolvconf uses flock and readlink.
> So explicitly added dependencies on util-linux (for flock) and coreutils
> (for readlink).
> Note that the options used with flock and readlink are not part of the
> busybox implementations so full-fledged implementations are needed.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> index 6df96b699c..6da8cd6023 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> @@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>  AUTHOR = "Thomas Hood"
>  HOMEPAGE = "http://packages.debian.org/resolvconf"
> -RDEPENDS_${PN} = "bash"
> +RDEPENDS_${PN} = "bash coreutils util-linux"

util-linux-flock has its own package.

Patching resolvconf to use readlink -f (instead of readlink -m) should
be sufficient to allow it to work with busybox readlink.

>  SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
>             file://fix-path-for-busybox.patch \
> --
> 2.30.1
>
>
> 
>
