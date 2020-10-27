Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.15027.1603810600454692356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 07:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t9hV6T5h;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id x7so326780ili.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ULAf9WytjPASBNT/XGM2hQZpK8jamjh+cCXH01jxsc=;
        b=t9hV6T5hexG2GTAe+uBVwfoLYUwkFDXcxsoWLfwdoIh3dtFGh9Q3VTBM3dtY6jqHrQ
         w/GCtTl29TPCIrgLOstvCjGvAtLzaMccfO96aDUc9UGtZ82QtuST21Lquv2joKX6Qcvy
         LEj5x1PWSFQXKWFRUwPTwFhb4CFjmNSyVObdyr/Cpq1xEGh+ZzbBKUgZ1b9jEelpbqTy
         5P4CzUm0UwyxtsD5DYgI8gi6wc9pyR32XTaj9UA850mXa/N+sPbE5ybOVb9beUWTiPWW
         P0cew+N71lr7OvtDTiHLqjQobqnLZdmukUbWpldDmXLCrqH9v7+cHE46lunIEDEPa0Xh
         uNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ULAf9WytjPASBNT/XGM2hQZpK8jamjh+cCXH01jxsc=;
        b=EHT2uJGKE+wtFFxd7rwhWuY/sK4wrSeUPZKW1mda4Tg/+8a23OTaKcFbQAN2dXRPQ3
         K+zdrT9C/YEhFmB9HtpPGAWKFb933u7ChTCv6QbQWNwPccbpn1fB5CQxQAgy11dLFtE6
         fApYz8+9aQzwnrs15VJIMG0JYI5zMDtL2VJpwt5RuPFkySHR3ZxLFM9g6s0x1DHy/m1u
         Oq4ddHqUbuo+7j8Y43wFLefN5fUvEUz+soDSq9kIR2ttoDE+fbrEJedUQvWObsJnAbH+
         4gRok2IZ98nnIpfzHNhZ4iZq9G7pHWvzn568PT489LM96tyn3svWUwmLa2Jdr8HPWjnh
         LcWg==
X-Gm-Message-State: AOAM531OFoGos+jKx6PlleF4IzNNmZnoDcKjNmMX14vo1EzWI9YJqcRO
	3TLo3IuQrQ0eGxV5ueG4vQooW91x03O5u7uXIhY=
X-Google-Smtp-Source: ABdhPJx1xIIU2Au7QX4fAQMHk0VNGmYHPMdt9f8ABFdkWoiPqG+g+S55wZiTK+5+EetbsQNYXW6h6h2ubZGfkpgucKI=
X-Received: by 2002:a92:5eda:: with SMTP id f87mr2335433ilg.131.1603810599871;
 Tue, 27 Oct 2020 07:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201027045858.665102-1-raj.khem@gmail.com>
In-Reply-To: <20201027045858.665102-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 07:44:50 -0700
Message-ID: <CAKmqyKMR+zP6gD3W3xYajWXvSzN9LqZUhpsyseTmUnCQN9LQ6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Disable gold linker and JIT on riscv
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2020 at 9:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> both unsupported _yet_ on RISCV
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-sato/webkit/webkitgtk_2.28.4.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
> index 8ebb3709a8..34b14f86ea 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
> @@ -94,6 +94,10 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
>  EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
>  EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
>
> +# JIT and gold linker does not work on RISCV
> +EXTRA_OECMAKE_append_riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
> +EXTRA_OECMAKE_append_riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
> +
>  # JIT not supported on MIPS either
>  EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
>
> --
> 2.29.1
>
>
> 
>
