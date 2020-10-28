Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.3830.1603858249900592068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 21:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mg/iMroT;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id 188so3427178qkk.12
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 21:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=NKCb7/uu8l0AhGKmAUrheRGIzxxKIFsQ+kdHBnXlWtc=;
        b=mg/iMroTOQb7T3BVauwTOkk+dEm5OtdNhKaiBa74VnFeiERz796WFOKJN7e7XzsbTv
         RXeKffvS8oE5jR0N0M30cUDNgcowuaQp+kIiA0OBI5F0RpfDXyL96O7utXtaUKCxT8N7
         Etk7gINDTVNykTW8WugqrJmjlKN3VTY+p60sPa4qCrXnvjGG9lFc+C0c62kCouZ8ZNWk
         2Rn8qhjz6Mo2RAO4r+/lIS+JrhwumqKsXpQPWyEydpMbynnYtEUo6OlrSgsXGEXsw///
         6VwZ9833PtYnGfeNQKUFS5d+gL6MsFG8HGbLH7wnD7O7CGYj3G8IfzO68ZVUZI0BSGD1
         kPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NKCb7/uu8l0AhGKmAUrheRGIzxxKIFsQ+kdHBnXlWtc=;
        b=OKVsLekxtm9/N9mybj2euCDjOMpsBkTByXhrCYiFKEC0kiXZj7b9E/zUEQebZOL+/K
         U0OBjSWKoVe/pP64wxLcPEjeCY8UPO3wwnfI8bnWsQfhiH69fUbrLAvRelmW/F7EzvjC
         DG0ew2Mq+7E6vXBgks91hyhsCO7S5oP+dR5cN0vPRSPIXDZD9ZPT9g09L5hkF9DKTaJ2
         n0AGdUhs3AqCkTLXLHCQj60nr9ZFUkd5zJ43HdPRzYcpLdEKXQxQ2dH79kNBEWzqCrRu
         YcTantALrXgei9RU38rz7kUnIv8yFBkAweWVhD0Wuyrudlv/3fh1eZCfA3pZ04A8D7ut
         vN9A==
X-Gm-Message-State: AOAM531D+LVqzZ6SDw0vXhfmAhPBbYAuwU0NbaCxCMvNWGhOCpmHbKs2
	GJVNtmVLOCZuG0j9I0oipEN9EX8ZRxOqVKrd8KL1kyaQ9tw=
X-Google-Smtp-Source: ABdhPJztgjjw5PDYZGEGXjKI38ljT8KIGGC+shs66I5uA1yt3MmRSXrDaeGNT4JiKeuqSHCsmE1aU8TzzuS0IvYpSeQ=
X-Received: by 2002:a05:620a:1187:: with SMTP id b7mr5649470qkk.212.1603858248636;
 Tue, 27 Oct 2020 21:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201028040904.3446105-1-raj.khem@gmail.com> <20201028040904.3446105-2-raj.khem@gmail.com>
In-Reply-To: <20201028040904.3446105-2-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 27 Oct 2020 21:10:22 -0700
Message-ID: <CAMKF1spw4-U+snX_OeBvtk_ZvFDY4Z+HHKJteAM7iBSm6OToww@mail.gmail.com>
Subject: Re: [PATCH] musl: Update to latest master
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

ignore this one. an exact patch is already sent earlier today

On Tue, Oct 27, 2020 at 9:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Changes in this revision bump are
> * 0b87551b (upstream/master) lift sigaction abort locking to fix posix_spawn child deadlock
> * 99d5098a update crypt_blowfish to support $2b$ prefix
> * 957c2763 remove unused weak definition of __tl_sync in membarrier.c
> * 55767360 move aio implementation details to a proper internal header
> * 37337660 remove long-unused struct __timer from pthread_impl.h
> * 85e16aec drop use of pthread_once in timer_create
> * 6ae2568b remove unused SIGTIMER handler in timer_create
> * 47baa030 remove incorrect fflush from assert failure handler
> * da845d52 fix getgrouplist when nscd reports an empty list
> * b7bc9665 fix posix_spawn interaction with fork and abort by taking lock
> * 25ea9f71 fix unintended observability of SIGABRT disposition reset via sigaction
> * bd153422 implement _Fork and refactor fork using it
> * e1e98d86 rename fork source file
> * 50716702 ldso: use pthread_t rather than kernel tid to track ctor visitor
> * 1efc8eb2 fix stale lock when allocation of ctor queue fails during dlopen
> * 69a1b390 drop use of pthread_once in mutexattr kernel support tests
> * b115bee4 fix missing synchronization of fork with abort
> * 3cd3de61 move __abort_lock to its own file and drop pointless weak_alias trick
> * 34904d83 fix fork of processes with active async io contexts
>
> Details are here [1]
>
> [1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=a5aff1972c9e3981566414b09a28e331ccd2be5d..0b87551bdfb74ac411caa335d8ad0b89a7f139c6
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 9c0818cfa5..897e56e10f 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>
> -SRCREV = "a5aff1972c9e3981566414b09a28e331ccd2be5d"
> +SRCREV = "0b87551bdfb74ac411caa335d8ad0b89a7f139c6"
>
>  BASEVER = "1.2.1"
>
> --
> 2.29.1
>
