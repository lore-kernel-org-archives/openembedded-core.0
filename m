Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
 by mx.groups.io with SMTP id smtpd.web08.51548.1606224196418840736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 05:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xr53cUIK;
 spf=pass (domain: konsulko.com, ip: 209.85.161.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f68.google.com with SMTP id y3so4792425ooq.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 05:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=wutpmYgnGgZx33hgtBUUGrM5bvIhdVHzG1pbdbCzmrM=;
        b=Xr53cUIKz2UVVl7dJQWHHyfk4o/685cbFeUcSf+IR6iEt78Xf2DbZPI6CRLig2BIil
         SD19ivq5gipsJZqBZOH6PiLPLtqujve9Bmdv4d4+K6e5+UoSIUaW5jYsZ8B3WrulyS6y
         kCVCGbnqukKwfWTu3q07QUyIs7cLazz3zdJds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=wutpmYgnGgZx33hgtBUUGrM5bvIhdVHzG1pbdbCzmrM=;
        b=d+h3BsNzbJqHkdSD2Cf7fImJLckIjFGE9avA+a5w1SOttQnUq94HSIFlE8d/Aj/qAf
         iyKzwcqXqdXM6Qm7HTduei8MBM0FzREBkPshZxPM+D46O+H3TmnzM8ww5Hv/qDdzXF4a
         WpFHVt3+6B+203zmdHCk7KGFUF7T7cszciVdY4532QMLK/K/ov6+BX9+KAFGPPX4WqV5
         QzwNbjZe5mMH2TZwfScLdZt8j3SBzqhi0YgW95Kq31ToHVRf/v9/h7tPthnyYQKEkAES
         8I9JHp3fV/ypVM7ebh6WJvqD31GhOiNFAZGfPfcutXmVYRbyCrcfrt9ZbftweULXFpGF
         CeqQ==
X-Gm-Message-State: AOAM532vYkGSWSAesi91Wna3lCNsodedApXypBNR5T4Jsicg/XJ5eLXO
	D8IezCItSHk3vBHu4J2/cdrWyONWk8sRoBnNJ6nf/FHWyC8=
X-Google-Smtp-Source: ABdhPJwJXiv060RTb+ypEhiDToml5vfMqWQWQrgr5TK3tYXUx3gOXQQhokZXJZRAX6r2bVD6tgi9uC2Bh3fkmYxaMIc=
X-Received: by 2002:a4a:a444:: with SMTP id w4mr3190760ool.5.1606224195491;
 Tue, 24 Nov 2020 05:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20201124124445.25342-1-pbarker@konsulko.com>
In-Reply-To: <20201124124445.25342-1-pbarker@konsulko.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 24 Nov 2020 13:23:05 +0000
Message-ID: <CAM9ZRVuDA=wmf82CQ9eLtUO26drsp7fz45FP=Sy2nQWdnPXo9A@mail.gmail.com>
Subject: Re: [master/gatesgarth/dunfell PATCH] local.conf.sample: Update list of qemu machines
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2020 at 12:44, Paul Barker <pbarker@konsulko.com> wrote:
>
> The `qemuarmv5` and `qemuriscv64` machines have been support since the
> warrior and zeus releases respectively. Add them to the local.conf
> sample so that they're easier for new users to discover.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  meta/conf/local.conf.sample | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 22d43b20d4..742c3e3cb4 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -19,11 +19,13 @@
>  #
>  #MACHINE ?= "qemuarm"
>  #MACHINE ?= "qemuarm64"
> +#MACHINE ?= "qemuarmv5"
>  #MACHINE ?= "qemumips"
>  #MACHINE ?= "qemumips64"
>  #MACHINE ?= "qemuppc"
>  #MACHINE ?= "qemux86"
>  #MACHINE ?= "qemux86-64"
> +#MACHINE ?= "qemuriscv64"
>  #
>  # This sets the default machine to be qemux86-64 if no other machine is selected:
>  MACHINE ??= "qemux86-64"
> --
> 2.26.2
>

After further discussion on the poky list, let's drop this for now. We
don't have sufficient test coverage at the moment for either of these
machines to list them in the sample config file.

-- 
Paul Barker
Konsulko Group
