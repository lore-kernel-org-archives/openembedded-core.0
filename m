Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.33494.1613407724315193477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 08:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e7qBKSwL;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id b16so4172512otq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 08:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=BbzGluMMdfTJcpa1q5HESXphh1vf9vHCsrbAUR8tXHY=;
        b=e7qBKSwLAmY4MSv+M0tkGA3oZAtU+E5GHhgn9yUCFF9cEfyppioliLVnv+Cb8hZ5cs
         YZRTwBLGJqa79aNay5DUZXsH92E9Oug9VYHflvuQw9s7ZLziIWkE7SWvQWkQQlsUNpj0
         6tbJw2dzBKvU7piJVtrpgy+MQaJUh12UjVdrDkmXXNiNPI76BzLshDg8y2I79sa0RjJl
         sCMAAJkmFEZKUeJ+GcLdWsxYBGiKxbRzyrSgwSGO4Pmto9icLeO4DZrC6l7cEn6y2aTH
         W6TSpmSUh/4GlM3W850hTOD1quPDoTMqTphIjZn5iyAN9j5zo1LCT3ziESzvSonkGYTx
         BO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BbzGluMMdfTJcpa1q5HESXphh1vf9vHCsrbAUR8tXHY=;
        b=sXiPALxEeCjqjjf/cSVte9kAA9NJIA//A8vYI/qRQY+gpYO0IbxWWRhhunlO6U5WXi
         AB92rw91Qsve627S32+UOkY8fHOunSX0o5xWPzFh4kDYqJiuwSDWD9lr335EN9OiPwOs
         1xbmbfrVgevKPuthgk3hLkp/dgrDyt+t/H+YL6jLnI19hLFQ5fZ3Jm9BqFsjwhVqvhqS
         9cxOOzR0NZ23j6z6ixcKbPk+F0NuSWFRPpnKjev/W0MNwh3X1K9GGXiRhWPOIeguHHCe
         N1ayFN1xSBAL2bTq008/Ccvuo+eeAoBQts4/YF8ms2brjN0IEOFK1Wy2naHrmgEyVP2J
         tN+w==
X-Gm-Message-State: AOAM532FqtJf73BqFej85GCRcUTB/529Nd+V2IbGG/qIG90skpqoLDAT
	R9cEAMC9/rFLk7RhZ5adyuE=
X-Google-Smtp-Source: ABdhPJzK0vm0pnguPU04iVns4Kltkq2w3UpimIgsQ5M2hepJdcmNR+4qXg1iKQuIlftcq//ywEL5rw==
X-Received: by 2002:a05:6830:1651:: with SMTP id h17mr12832585otr.363.1613407723758;
        Mon, 15 Feb 2021 08:48:43 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id b14sm3377328ooj.26.2021.02.15.08.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 08:48:43 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] weston: remoting backend requires GStreamer base plugins
To: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com
References: <20210212165146.21830-1-JPEWhacker@gmail.com>
Message-ID: <9cc2852f-dd67-9723-b6ec-9cb89999465b@gmail.com>
Date: Mon, 15 Feb 2021 10:48:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210212165146.21830-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can this please be backported to gatesgarth?

On 2/12/21 10:51 AM, Joshua Watt wrote:
> The remoting backend of weston requires the GStreamer base plugins, so
> add them to the PACAKGECONFIG depends list.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/recipes-graphics/wayland/weston_9.0.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> index 75f9fb05fd..d60b5e1a35 100644
> --- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> @@ -73,7 +73,7 @@ PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-color
>   # Clients support
>   PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
>   # Virtual remote output with GStreamer on DRM backend
> -PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
> +PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
>   # Weston with PAM support
>   PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
>   # Weston with screen-share support
