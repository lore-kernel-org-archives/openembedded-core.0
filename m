Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web08.14903.1605815718990983382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aajmz5YF;
 spf=pass (domain: gmail.com, ip: 209.85.219.194, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f194.google.com with SMTP id t33so6367853ybd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XdO+N1r5WoXzYRk43RccSkAtllGyUjHjrWRiIY9Rrfk=;
        b=Aajmz5YFZk5qP9ZVbhi2QPMcXCGsoBuUqRoyXE0ThzUl5zGPsXRNubiNrANg7ri8Fy
         DHp5Asq4SPY0pW/c3HOtKVmTL4P1CcUQfewxQtw+nBUKnRVMK2BbnJngDC7OPtbFG+QT
         tskaabpkjKSrrzYrmxU7ZWWq/JAAmVaIxp57O92Rsu+h6QhODFYLLcVguLdjwSkp9mZs
         v6JnvQY4RlgeuKpvCHyqYnhS3DF4P5jkXnY55mVfT9WBGcyg/3r6PJWHSB80DDbwnXt4
         42jB+zK8Jvlw/wVy6dYtchpBus07ayTOlw0NpE8Bk1iZsHHzbXVJGK7EIXQs7T8X6wnl
         tmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XdO+N1r5WoXzYRk43RccSkAtllGyUjHjrWRiIY9Rrfk=;
        b=i9CDkevAGy4DtlBHh0oUuYdAc6zf2IrqfeQUSLL/aB5uEYWMLqaFLBdXYbcL/Ae5GD
         N8GKOmcr4JB3jbXm0vCsoC6w3MFOkJotNoJC8o33/EhY8nTIu/THd4HJ4ssJ6dKfCnZ9
         6ZuRnEXDgUyIAOczmnP9Qw8gtw/a22y9NTH3xOG0ss+utk7WGyYjF4vo0vQcF0TH9rv5
         CN6vmZfafThW8pF+6rf6hr0hrkGMxyWjsphZF2tsvz3cjhPRJxoovEYT47yYisCt4rwd
         KnbNrmhfq4cB/sxqxjgjl9Bc4oZfBSfGWC/s43CUW8b1S5XHUH3fRWOMHOvbIrxdW00r
         EMYQ==
X-Gm-Message-State: AOAM530Na6E7Lru/CobmUG2HXUuOTIbosqwpl78qd5incbGbkJtCSKsK
	bcBzabaSu9BYTuFAMR0IgLfdIxGjIkXxCC6kdRs=
X-Google-Smtp-Source: ABdhPJy4UR3zV1Ve9krcXbVSLWQ98P2g09y4i+9mo2zBMk8OliCzk3py1tsOSLG4tQNQkvheub1VuT+6M4p7toYkB1c=
X-Received: by 2002:a25:a525:: with SMTP id h34mr13898038ybi.284.1605815718133;
 Thu, 19 Nov 2020 11:55:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605813340.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1605813340.git.bruce.ashfield@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 19 Nov 2020 09:55:07 -1000
Message-ID: <CAGDS+nnGP4-jj1xJYxL=0EEW-nrkFmdO5TX3W0qRWCh2kSDrzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2020 at 9:18 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> Here's my next set of collected changes for linux-yocto. I built and booted the
> 5.4 -stable bump .. and obviously it looks good.
>
> I've also grabbed a pending devsrc change, that looks good to me.
>
> Finally, I have a fix Khem sent for perf builds. I kept 5.4 and 5.8 separate
> for that fix, so Steve can pick them up for Dunfell as appropriate.

Thanks :-)

Steve

> Bruce
>
> The following changes since commit d8f47a68a92802fc47f297de05a0f2817963a7ee:
>
>   kernel: relocate copy of module.lds to module compilation task (2020-11-18 13:59:27 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (4):
>   linux-yocto/5.4: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit
>     arches with 64bit time_t
>   linux-yocto/5.8: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit
>     arches with 64bit time_t
>   linux-yocto/5.8: ext4/tipc warning fixups
>   linux-yocto/5.4: update to v5.4.78
>
> INC@Cisco) (1):
>   kernel-devsrc: improve reproducibility for arm64
>
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 ++++
>  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
>  .../linux/linux-yocto-rt_5.8.bb               |  2 +-
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
>  .../linux/linux-yocto-tiny_5.8.bb             |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 18 +++++++--------
>  7 files changed, 34 insertions(+), 30 deletions(-)
>
> --
> 2.19.1
>
>
> 
>
