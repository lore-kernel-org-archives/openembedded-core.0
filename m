Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.47552.1622485220017460828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 11:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tjUrM6Sl;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id dj8so2142856edb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 11:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R3yeXD6AIehxm6+77rTVbnkHh244gT7YQIwIkeo5wdw=;
        b=tjUrM6SlyU/+XTOQPG6w0TKk0gHFwbwE9QyE+h0VIj7lDM9RP3FCUVY3T+rMzq7Bke
         6IuYLfrrl60PSgTY5TUv3qEmN2k6HDj97m4vCC8UHAygdMRbTZpk8AgC//nZpbVUouFR
         CdVKeDXuBn/ZuwzpKZsezw2lt2ZyKEp+NXmamC/hpwEGokhen0MR12HsoR2lNmcXgeh3
         1p5ETOdJVTG5Wwi4P9GHv3xChdIEE9BJf3kTxBaLWSRDKfr2rCncZxZ/7rfqHvVJcZ6e
         mvZD/EhJABFxFR/9mU8FR1WolYGWn8JBskYCm9xSd6Fxi/9n9Q1nZA4OW2VRHM6ixNBx
         gtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3yeXD6AIehxm6+77rTVbnkHh244gT7YQIwIkeo5wdw=;
        b=YWjullwi1bj6kjqpR8poULb5QRDHaogUUTp02y/XO3jU0VQkU1WGeeXa6uwFiBYq5k
         eryi7WkPCrcG8oFu9B8K0o7P2pVlNW4+cQXMLtcaQRsdlLW2zEb5ExTWS7NRhXX8ZpkW
         0xbqdfKE5vJZ9EDpyKl6cCNDyb9vqkB6xhrqVH2UP8R17YKHzOD/6Y0uDFTy9Yu1xyDd
         LjnoB6aetg1IBWV6+SYktKH5lTlaVaSmPxRZGUink8lE9Jm83+Mc/sQS3VTJDHe5Obnt
         mqt7R9JOxLwUL8uC3VQ9AJbLqdMNowgve+ER01GBMiNJFqunLj/8lTdFLbU5qS2F+iUD
         P9DQ==
X-Gm-Message-State: AOAM530Y+FZuVdt3GGrQrykD571aN5jM8efFxCD6Wk/Q/jzsjFpy8THq
	mKt2RS1GPuCm57V4I4+qx4VjAjWP/aTHNK42BHQ=
X-Google-Smtp-Source: ABdhPJwDgaStp73euocKzhzAqqv2bVm56qznDDd/pbgSPXVpKdxSmFZQEDmBdmHhnMD4l9NokdHJJMtyFYu6LtYsvcc=
X-Received: by 2002:aa7:c885:: with SMTP id p5mr681554eds.234.1622485218365;
 Mon, 31 May 2021 11:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210531181609.963494-1-akuster808@gmail.com> <20210531181609.963494-2-akuster808@gmail.com>
In-Reply-To: <20210531181609.963494-2-akuster808@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 31 May 2021 14:20:07 -0400
Message-ID: <CADkTA4Nz_WY9M+AZX9AgvXAbCZL-zyCT5YTeAx=B=0y839YU6g@mail.gmail.com>
Subject: Re: [OE-core] [v2][PATCH 2/3] kernel.bbclass: link in kernel-features
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for v2!

On Mon, May 31, 2021 at 2:16 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> --
> V2]
> rename kernel-kfrag to kernel-features
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 8693ab86be..493136dfb0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,4 +1,4 @@
> -inherit linux-kernel-base kernel-module-split
> +inherit linux-kernel-base kernel-module-split kernel-features

Since we have the bbwarn, can this just go into kernel-yocto.bbclass
as a default include (for now) ?

As part of my series to move things around, I can relocate it to kernel.bbclass.

We are sending two different messages as it stands, and everyone is
going to get a bbawarn that isn't using linux-yocto, but is using
kernel.bbclass :D (not that i mind, but others will object ;))

Bruce


>
>  COMPATIBLE_HOST = ".*-linux"
>
> --
> 2.25.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
