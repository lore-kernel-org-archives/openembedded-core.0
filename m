Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.2700.1616135321822591209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 23:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BGlIkjZe;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id t16so4492212qvr.12
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 23:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L7sJc5XPG1F4yNZYDeSqwf3tJ478ev1M1FZj8FlbH2E=;
        b=BGlIkjZeWwsbcBgS/Z1DiCWn4J7V5UV8R2i6+q7GyquIHlqk93X7y64iMbMSuOaaFZ
         g8TAm62FepZ0GFmLhYCeW5NYLl4cJYQiwFLhJBJAf2tn5uCfYtfNk53mUZOevQ5AkM4c
         y7rk4zoj5w6aYP51nspwYBxDG8lalk9k2jCLQsA8tyKObPajOw91owN4TjiVVX9DTZ+9
         oqrhJBcPAv2SISMxW5XANUuWBBmo3XGaYVvPOdVNmk/njElwtrfFdlfShfmIYXZvJN6g
         l0FMPylsn9RwbALr1S+KjwNMRz9q6B7gFFNNrtOv5t5QaGYbql9evYEsnMaT1+hdFWDy
         7B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L7sJc5XPG1F4yNZYDeSqwf3tJ478ev1M1FZj8FlbH2E=;
        b=uiQbJ5DQSGwhZ3hhqsYq8dcyPEQp4myY3tj6Rsf16mc+XyGJzrGl+SgxXTJ4kFXx/y
         csPCzLJAT2YP/GlUhfxXsjkucgPT93d7DIrhQbqS8S358MA37cpmlZl4BDC2XxVSnjFF
         PQjylRJcXhdPJ4TJ7ymab2KTJimN21GUhbvuBOdDxiA1+nuzfXInwEv0apUvlMl2CAu/
         CT02RCPQNSxbvruVAAtkCFofbNDdlu45nuVIaZrvWeLaB54SUrkCMDQDSSxPT6ODXHTV
         WpYXOUBFqTMULVuW1HYR3VvqYEpubAXC8bOOAMTs/EqSSCDmxigYmmC+rlQHSUTLF8ik
         pZjQ==
X-Gm-Message-State: AOAM532S7CuCNf0U+8C2+ZqTkkUB4A8KUs6poSgFmsFQIVUfbTLi6k2+
	pSnodj2DScsLjZ2pQDELWczQ/8VCBNP5lb8UqUc=
X-Google-Smtp-Source: ABdhPJxHYpJ73UxpRCa4yZrqiGEEBVkjUTN0UhTS27sIGC5x0+vSPq6zTxVlwoSuGylYyCgFMe1X+5+z9sIyTpAb9V4=
X-Received: by 2002:a05:6214:80d:: with SMTP id df13mr8010654qvb.55.1616135320664;
 Thu, 18 Mar 2021 23:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <1616003424-27799-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1616003424-27799-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Mar 2021 23:28:14 -0700
Message-ID: <CAMKF1sqaVqJxEuSL=HtR-JP46d_g4R=YrF2yYtG1w9UYuYwaoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] stress-ng: upgrade 0.12.04 -> 0.12.05
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

failed on musl

| core-shim.o:core-shim.c:function shim_pidfd_open: error: undefined
reference to 'pidfd_open'
| stress-pthread.o:stress-pthread.c:function stress_pthread: error:
undefined reference to 'pthread_sigqueue'
| collect2: error: ld returned 1 exit status

On Wed, Mar 17, 2021 at 1:51 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../stress-ng/{stress-ng_0.12.04.bb => stress-ng_0.12.05.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/stress-ng/{stress-ng_0.12.04.bb => stress-ng_0.12.05.bb} (90%)
>
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
> similarity index 90%
> rename from meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
> rename to meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
> index 28887204d9..eb6bdb4a81 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
> @@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
>             file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
>             file://no_daddr_t.patch \
>             "
> -SRC_URI[sha256sum] = "b4e34bda8db4ed37e33b7a861bc06ad77cbbd234d63236da2cb58f02e3f3218e"
> +SRC_URI[sha256sum] = "af7779aee38e6d94726ed7d5cf36384a64d50c86e42fff89c141d8609913f425"
>
>  DEPENDS = "coreutils-native"
>
> --
> 2.25.1
>
>
> 
>
