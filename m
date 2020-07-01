Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.22873.1593613054589389580
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TGpSLaxA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id s10so24014895wrw.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=SxNEJyuylQhuGCoMxlDcg2WRW/8N975ne55wlSbW3Uo=;
        b=TGpSLaxATsRtFzif+l8zLWaNhcfkwwF12QIMv81BfBpTocnlwHlWtKAEMx2E2g2apo
         iytxkdNuXTGuPitrOrPW+LQmZepgnjQqaxdtKKFIX3BT90OsW4dUCC/dhe/ZRirdaCYE
         w5GzRdfD3Hv5sz5lbwabO2sjRMC0TwAxzqHGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SxNEJyuylQhuGCoMxlDcg2WRW/8N975ne55wlSbW3Uo=;
        b=iW/7eJCglrA1nxOputZdbhvOPg+0EGvSojX90QeAlaF33CbGRyAbC4g8AvsXMsOuxW
         2PyRoX3ENfWl/K3h6v4fPyvVme3L/+gDW/MhUCavj3J4lysJsnVrmDT+RoqSWtD3O95M
         D644VQ8dijpuXjjSXopgznrS6jU6IvZk7LG+9ok78WykelVDlCyIyGZb5VWJx2iPm+QR
         px4bVpbv2StmtMVXhvidjtVqGIySRt8myTTqRha+XLLejd8zyGPk4kIRKb9xO0GB5kBe
         WB8bNj/rcDWCXZevldXOD55wBzgnhL6u1IptggAYFGf/7Wq9Xs4juf+Zyi0OA20NtVLF
         ei4g==
X-Gm-Message-State: AOAM532ByPjMZR1YoHpgZUg287qZUOGq2mb1fmjru1AlSq60dp1zW/Oh
	ovFHAPyPIgMOGYDx/MtsFQu6TDMroxM2bA==
X-Google-Smtp-Source: ABdhPJw/UTTV2nS/rEQrn9KlIWcC8G5cH+jCo+kGQIIsZALsbyrYbmFc6kqioyInDejOdbzK76qTRQ==
X-Received: by 2002:a5d:4bc4:: with SMTP id l4mr25676730wrt.97.1593613053168;
        Wed, 01 Jul 2020 07:17:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e17sm7177474wrr.88.2020.07.01.07.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 07:17:32 -0700 (PDT)
Message-ID: <bf681918eddcf553adc749ceb184fe3583f9acc9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gtk+3: upgrade 3.24.20 -> 3.24.21
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Jul 2020 15:17:31 +0100
In-Reply-To: <1593586907-23161-2-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586907-23161-1-git-send-email-wangmy@cn.fujitsu.com>
	 <1593586907-23161-2-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 15:01 +0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../recipes-gnome/gtk+/{gtk+3_3.24.20.bb => gtk+3_3.24.21.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk+3_3.24.20.bb => gtk+3_3.24.21.bb} (84%)
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb
> similarity index 84%
> rename from meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb
> rename to meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb
> index e5744a4b05..70c0e66db7 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb
> @@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
>             file://0003-Add-disable-opengl-configure-option.patch \
>             file://link_fribidi.patch \
>             "
> -SRC_URI[md5sum] = "b302acc0a4b42e2980ef18628f9ce951"
> -SRC_URI[sha256sum] = "2dac69f716e8d04ba7a95091589e2baaec95dcace932cb15839163db479b1df3"
> +SRC_URI[md5sum] = "95afed6c860d27de827db66434d681da"
> +SRC_URI[sha256sum] = "aeea6ae7cd35e83dfc7699be716519faefca346c62e784dd1a37d9df94c08f52"

This fails the reproducible builds test:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1098
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1085
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1102

oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

Cheers,

Richard

