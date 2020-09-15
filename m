Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.10391.1600165278246270828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 03:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=LH99/5oW;
 spf=pass (domain: burtonini.com, ip: 209.85.167.65, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f65.google.com with SMTP id b12so2485535lfp.9
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CnsZLTsMzv8BdVe2JuCF2tama6ni5LE25cmEO/S58Vc=;
        b=LH99/5oW2yJ6a8z+jHCQVorJtY92cwNHDHHV7zqvqAyh5V+OOKjoPTobbbed6uSAPd
         bfbHURX3f0hCETFKXOgEXZp3V9l+MLR9v9ZOeHJqZf6qUW2VCCWuG2Dvxu2sqTo/rOfa
         NK06N35xI67wDF8WjvXk7ld0wy9a1ER3SF3HHvydrIl1/+E3A1frNlo0eK4jazR1e0Rh
         V7ITSRrgLwQYyu8gwW/N2i/u+zsTteN5b68/NJC+1ngcTHhdp01l2Pi00bq4dHQ0U23Q
         JYsiWFwAIXD7jbb/FaLbZANGlFWoOxULAOxwR6GRj0brVsgbrG2KHq2sZJ2z8NSD/7fZ
         09MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CnsZLTsMzv8BdVe2JuCF2tama6ni5LE25cmEO/S58Vc=;
        b=XuFbPTqp02zd353OnfMSOZdlcf1CN5j3rCeQew/zuJUVMwf0QmGPSWwxcWiuYV8CfQ
         88HUg03Q4Xw9nT1UKyNsM/bvJ8+SoXeDaRDudpWEBiCe6iD7Nvu3iWh6RcvMsgUvpB6C
         c4VVH8+DlXGAr2nhGTt/5X93VRAKwzQXo/+r2G6Kpke2/ykugyVxzYnkpOrphAWwWCiw
         ZBE8iKXaq6UoUfIub12sRxMnQHfKA+5CForb3AyPQ9atwTnt6iRWxPq0NQ7c0d4w0RwJ
         sttwdyPGlbxr2Gg9x+eDCmFWFKwaVdYHkzo6HMKyjOR5bIS/sIt7HAVEMhxMKfQWFzcZ
         z8kQ==
X-Gm-Message-State: AOAM530GnhqD6TgtlTD+MHqZUQodF6GNfJVv66xJIcerey3SIDpQ5rmx
	tpzX/UagyvjO2fK/Zbp8aLrmbAcN+CyrQG5EC9GNAA==
X-Google-Smtp-Source: ABdhPJztUJ8bV7Pwb2t/NhrqTdZ1eu370Yk/jHr1a//P+O83Htn4o7KacMFaHDL96Hs7Y4YW0WXjaoO1iTVpNXImyMY=
X-Received: by 2002:a19:457:: with SMTP id 84mr5844006lfe.205.1600165275937;
 Tue, 15 Sep 2020 03:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200912210406.3328090-1-raj.khem@gmail.com> <20200912210406.3328090-3-raj.khem@gmail.com>
In-Reply-To: <20200912210406.3328090-3-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 15 Sep 2020 11:21:05 +0100
Message-ID: <CAAnfSTtv9uqkKKddk2PNxK=j-p=-zH0g-1tcvePmADhaCSg7KA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] weston-init: Enable RDP screen share
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is this really something we want on by default?

Ross

On Sat, 12 Sep 2020 at 22:04, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/wayland/weston-init/weston.ini | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
> index 1e6dff68fd..b48726d59c 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
> @@ -68,8 +68,8 @@ require-input=false
>  #min_accel_factor = 0.16
>  #max_accel_factor = 1.0
>
> -#[screen-share]
> -#command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
> +[screen-share]
> +command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
>
>  #[xwayland]
>  #path=/usr/bin/Xwayland
> --
> 2.28.0
>
> 
