Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.20342.1618240314607923495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 08:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J08/qoth;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id d23so2077778qko.12
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L4qAwpILmHyf2bNwK3HR9ztxjgxnOR9WNmB/n7uhtcM=;
        b=J08/qothnuLXvTqSUOxV0uef7dVgX6n4RKptztDGZhvWf89BZDc4b0q2HtiKR0wQWp
         BYWBdC8cdfbdlBcf7+/sNkgRItjFneYB/fSIUoDg38GZxJ7nIIEQr6G32UKtLWb4Opsz
         KSX+pttr+8lrel1P4Et/GnBtAYC6/IyqKJJuejcExkqKtmnPukaoINl2DoenYNQTifNS
         5cFYIlNEZvYv1tlpRgCe04ZIxLIvfNJCxxbTr2v7bNEA3y4gOrCtSEvFaFTncRbmtcOC
         dgO/JtrGfoXBRJuU+MvTMiPy7GUgqz4TEEuIJrZATQFE2Vreh8VLtFHdkH9noZH/Pu19
         01/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L4qAwpILmHyf2bNwK3HR9ztxjgxnOR9WNmB/n7uhtcM=;
        b=czxLWUZz3V7qcWMGBTSZq2+SkVwpUgiVLr4eqThynQ8yuX00J13vnfZEyRKAft0xBQ
         gpK/Ygt9ff5+k2Fn4chrmlqziu5oFlcOWL8w8MgHQVbcKkj+eGkZPHKBhPFOp71isvSM
         VsOrBBJLII82aNWj+OaqKoyZEYXBs41nFdAtb8MV39nMpQ7QjFSCjHQgP0qR2N6HV4Tv
         K1zpkh9tFWvhyQ11cnDlH6NK/Wq8Rhh6u2jnJ81rlXqCz0G3TY6osHhPFYczXW3+0thR
         m/lyAqrK7HbyLG9O6j3zH+ZvK+KZoRUR9pkBzJG0S/Ff866gcXWPsHwSbOL28xP0Z0Xz
         UOsA==
X-Gm-Message-State: AOAM532IehEdN6sJcBZ7PBkpKhSBHSL3T7IWC/NopKyOSM5yIg9/jzdK
	IXb0PGr3dq/x0wXjWTJBV1rdTC0yD7EKlw==
X-Google-Smtp-Source: ABdhPJzdNf8r6T6WWtXy2fLkUifLWEnT2Bi2EIKwcRjYeFxNcbbizcLCjv64eJ+PGbzPi/EuZqX8Ew==
X-Received: by 2002:a37:e508:: with SMTP id e8mr8646590qkg.82.1618240313589;
        Mon, 12 Apr 2021 08:11:53 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id l124sm1114180qkf.31.2021.04.12.08.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 08:11:53 -0700 (PDT)
Date: Mon, 12 Apr 2021 11:11:51 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-yocto-dev: add features/gpio/mockup.scc to KERNEL_FEATURES
Message-ID: <20210412151148.GA37904@gmail.com>
References: <20210409160327.8738-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210409160327.8738-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

He Zhe already sent this, so I grabbed that patch.

Bruce

In message: [OE-core] [PATCH] linux-yocto-dev: add features/gpio/mockup.scc to KERNEL_FEATURES
on 09/04/2021 Sakib Sajal wrote:

> add features/gpio/mockup.scc to KERNEL_FEATURES when
> ptest is enabled as it is required for testing libgpiod.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 8725473d1c..b3947bf213 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -50,5 +50,6 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
>  
>  KERNEL_VERSION_SANITY_SKIP = "1"
> -- 
> 2.25.1
> 

> 
> 
> 

