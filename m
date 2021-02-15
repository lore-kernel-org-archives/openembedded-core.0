Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.34019.1613407672803047372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 08:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oRJFgUFs;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id w26so824280otm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 08:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Ugb4tdPxmwIzj5PKV5KUcFXix7JcQG5g3pziALfbsGg=;
        b=oRJFgUFs3gzMr3y59Dk9ABOUUybpNfda+Inc4h7bMfdY1sLdiWjkUUx6NDHg+ghaAR
         dXr6F8E2ulaaQHejVSwQnR58sbh41qNIknonMxu/OaZRCYIMH0kjSQtj/pl6aPyLAehD
         TT7uJXEKr6cW7GtNYcCjQ2s1e4QgZ/5yegxlpLE88dyWtKVOHwQZBZvr3tZHWPgfn5Uv
         F5qq2HT9b6YNlIyWHNV5hmqhMfyhdh23Q+72G+mMefYczTiILD4OZzndlZHwSfcW5Ruw
         F169qUWZyW4p/+4J4b2aIVhTo99u1l2Ecl9gs0M5N2bhmlpaAB5aAtXR7SR7WZS/C8Po
         NNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Ugb4tdPxmwIzj5PKV5KUcFXix7JcQG5g3pziALfbsGg=;
        b=hlALcdpdRZt0hG4HDWI6/BPVATJgYlV1ADGzUdLjEOHq3lHgk/Fx2g4fjzGdvRmRYN
         G4eIdhNms0Pj1DjPo9fWQcuZkMRy4CPnmLLwqzOWuvVGC3lIUIWEZid+1SdoVVu+g4K1
         RCeDfVNXpcf/VcIBukxivrdv9MzEgHTlVBW11KlrwbvVZCUcXqCBeFqL7lFdluRiKWcF
         o1JSBXeF44biUhP+dx4766vn7LBID/TnKr/97XzZXFeNbeKqJYI+xb6nbexuxSda1N69
         ukFTO/2GggpYRiCvCeKsKFjuSwCeHrhbz0ZhOgXbmMqyr1ZpYcwiiSFoTX1C+8slTY6i
         DMEQ==
X-Gm-Message-State: AOAM531s5GaxtX2z9icubdGNOY9jTT7UnC8OCwEIKxiqzUCoQ37kSRpW
	Kl/b8DVxJkmTHpPbmxhK1IU=
X-Google-Smtp-Source: ABdhPJyQBxsB1E6Pz1K5M4iG4qKB108dtoJWXCw7o9FAdmi33jCU1NXo5gFvPVUZQVma4xYXbnESLg==
X-Received: by 2002:a05:6830:1215:: with SMTP id r21mr12425565otp.353.1613407672218;
        Mon, 15 Feb 2021 08:47:52 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id g13sm3576263otl.60.2021.02.15.08.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 08:47:51 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] libomxil: Fix up commercial license flag
To: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com
References: <20210212165157.21896-1-JPEWhacker@gmail.com>
Message-ID: <7a213c0e-3abe-d100-e38e-3d4ef77a5f6c@gmail.com>
Date: Mon, 15 Feb 2021 10:47:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210212165157.21896-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can this please be backported to gatesgarth?

On 2/12/21 10:51 AM, Joshua Watt wrote:
> The commercial license flag on libomxil is set because it may include
> the Adaptive Multi-Rate audio codec (AMR) using FFmepg, which is patent
> encumbered.
>
> It turns out this component is disabled by default in the recipe; add a
> PACKAGECONFIG to enable it and trigger the "commercial" LICENSE_FLAGS on
> it. This make the default build configuration clean unless a user
> specifically asks for AMR support, and prevents them from marking the
> recipe with the "commerical" flag unnecessarily which could hide
> potential problems later on.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> index 2061c280e4..82cdaf54c7 100644
> --- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> +++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "Bellagio is an opensource implementation of the Khronos OpenMAX \
>   HOMEPAGE = "http://omxil.sourceforge.net/"
>   
>   LICENSE = "LGPLv2.1+"
> -LICENSE_FLAGS = "commercial"
> +LICENSE_FLAGS = "${@bb.utils.contains('PACKAGECONFIG', 'amr', 'commercial', '', d)}"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
>                       file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
>   
> @@ -28,6 +28,10 @@ PROVIDES += "virtual/libomxil"
>   
>   CFLAGS += "-fcommon"
>   
> +PACKAGECONFIG ??= ""
> +
> +PACKAGECONFIG[amr] = "--enable-amr,,"
> +
>   #
>   # The .so files under ${libdir}/bellagio are not intended to be versioned and symlinked.
>   # Make sure they get packaged in the main package.
