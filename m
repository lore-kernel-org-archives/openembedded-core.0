Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.33853.1618240411123368455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 08:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qxH9Ym6h;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id h7so10160145qtx.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f+RXN6B+3/bl1n8PIt6C/h9h0xRUyYFDBAfIMGGkWwc=;
        b=qxH9Ym6h2GFwDmfUf917R0RzXzYKfjI5dFQARyuxhgBYOKDrEg/8dNELyCO+nLnQnc
         MbP5HbkZgOIrmgYcpz6rbE6Q0BZFsaxoB/CydTxC0KPbqyJqZgxGEYV4T9oNG0K1QWNF
         h8H0exbxYxbDIiCgi7qV8lwVVD82DptG9iaHZH3z+z/rO1r+dumt17WoyChuia+Isp7Q
         Pca6WYHupUxqjxQPt3WNs9g2ddDxbddjjxWXAb7/myrYo6KXa5IVduDZsarWhlj/DD9V
         mWEjOvaqqBLVgTaXp1XSKHrQOMvNnAYV3qRWmC+5Kcdn0CcVgOdX0th5dUdULHqVTRW8
         aYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f+RXN6B+3/bl1n8PIt6C/h9h0xRUyYFDBAfIMGGkWwc=;
        b=D7+M1znvQ/xH18QC2ZC8cRH4R+hRi6tBYECporYmopJ7rwGN4wVNuV55EMw6vSB6vj
         ephwnVxSzsj3rxyC5m+tFA5EMpQXmi94JzfK/o3aomaY0OzkVqreYAhkcOMOPYjPzfOx
         M8Ov3U7bEUSnCTczSBIDpC4aMLBDlaVa6KqB2NcYkKtv3YQFCiaS/3DADRUtpSPxCQr3
         oExqLatc8ADD1JMWKlP5LeZjcB4B+Azo6eP/kDPcgT+zKuqILtR7uU0CRVXsDkipnCJo
         MekhfTaNocoA6RdTac9j1gmyIEn+Kw9UeHrpzOGloH8Zevaop6L0PR/wS0kXaKorgOyX
         +8IA==
X-Gm-Message-State: AOAM531SCRROqwHjMJBX+ebA/2OJr5SGN4A7j04END6db1/oQnLuHOOY
	soGsojrNZbLFPK9kJBMMX0yIF2IV/3S4ow==
X-Google-Smtp-Source: ABdhPJzBvoaTqglBUy9loQ4rfV/7ahUME63BTrSObLWFlKfflrl/u/GjI0Af0VHSV5Z2FNe0F7zfog==
X-Received: by 2002:ac8:5f10:: with SMTP id x16mr26579309qta.6.1618240410267;
        Mon, 12 Apr 2021 08:13:30 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j129sm8112787qkf.110.2021.04.12.08.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 08:13:29 -0700 (PDT)
Date: Mon, 12 Apr 2021 11:13:28 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto-dev: add features/scsi/scsi-debug.scc features/gpio/mockup.scc to KERNEL_FEATURES
Message-ID: <20210412151325.GA37958@gmail.com>
References: <20210409081647.37679-1-zhe.he@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210409081647.37679-1-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


In message: [PATCH] linux-yocto-dev: add features/scsi/scsi-debug.scc features/gpio/mockup.scc to KERNEL_FEATURES
on 09/04/2021 He Zhe wrote:

> Add features/scsi/scsi-debug.scc and features/gpio/mockup.scc to
> KERNEL_FEATURES to meet ptest requirement as what we did for other
> linux-yocto*.

Staged.

I'll send this with my next pull request.

Bruce

> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 8725473d1c..ee41d612fd 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -50,5 +50,7 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
>  
>  KERNEL_VERSION_SANITY_SKIP = "1"
> -- 
> 2.17.1
> 
