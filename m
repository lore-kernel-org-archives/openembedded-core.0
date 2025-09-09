Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE55CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 15:49:41 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.1877.1757432979730510361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 08:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6JkJiAY;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7a16441so859601566b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 08:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757432978; x=1758037778; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Znm54XOXCzqGHc0u5+V+fKUZaZZ3SkujlVfC/LhR04=;
        b=A6JkJiAYvwG+9bdtozTl30Qcw4OCmwoE5fCorpucm11dRsNL0JSzI+wXCphx6ZP5m+
         p6zW1avpNRJe/lerWRPtqmAIFZF9EPGL/kDJkpA6woFhEPIO5KYCP9z9t//hUVafrTwL
         0jp221rCkYPxkvCdqrf/w2AqaPtyGuEyQhpeSsLHO1h8HF6JPwy0OJqSIFtszqpJT3fE
         7rmMGgFvP/EFJQXvtz5jQAF24XEAMtxCc4h9O1qU0uYA1kXGVQh66n8Ujv+sj7E0ZChh
         bPi3/TlPmK8Xw4ez9qsFoXBfzkjCUCXBsI+RQDNNG6o88x/ZmbPvUjNOE4Lv+tAug1p8
         2aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757432978; x=1758037778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Znm54XOXCzqGHc0u5+V+fKUZaZZ3SkujlVfC/LhR04=;
        b=lDYCjfg/Y4FATb415c3+yio5L1k/aPyDcEKZSMiIuWaBdsFfks6cPlOv+HKVFyHAGC
         RVYDOzimbHdyUqKrYaM3yrKN8PuNvs5NX728yP6j9ZQX1LvaootFQNQtMWO689NWw/k+
         gw9ZNvUy7Myt8CecKLm8XH11ZfJYP4irX56BnHuvKwoIFXHRXfsmsdLEWjov3kWSwZ0L
         kZKfQywpLeiXvBOPYH0pxCbZ9CWkO26TOp4OMrvaff9Z82NNlth01A5wmhHZyt+gXjJH
         QUBDH0t05TczAPd8kNAiwljIS3Fcy4qzD1SfJqd6rEMknwldBZ7x4qmporsIxnSPfGu5
         8NFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPbwkUoxODu4TUnUvyOyL3XTqPeDEqgm+IzmxwesTsC+1QN56iRR+kVCM2Ap96aSloMfwK4Y/p0oqPDQAJM8RBjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwrNHYUCPD468sN8ToN/A0FlNmTSPoAML9dtSrhPv7Eqw/g84lN
	z4ykfhrIXy3g2KLNjlLciklhdDz/uQzGXjS878f26wNH1Qn8X8pyKHGL
X-Gm-Gg: ASbGncsojCnZUH05db9SPpNhN5yXuHwyzeTCO/isU6IeWqWXsljdDipkpcKI6lZC7v8
	OWQLU9nCpJ9zZ3yRoJgTP1yipFnD9sPBD/gcXJCIH9dW1XXn/6QU3ZvaxYlfofYn8biZIqWsRad
	V2pFKTt0vZniouCcYFvnFi1U2JtBc6Fj/1H6Tj00C6hn0C++cax9lTnnM2Wn2em8ihRNhlsOEDA
	182Dl5mE7ctPqriN8lIarQoxzidr7ht7kFrbkmYb7y+fWOZqBCGVaFjqmSqmgIO0KXLP2fARC/M
	4RrbMbrKQ+Z8gAXl+XZC7Un4mjFu9MvKvW2XHkwnlQ0JeeQ3bugRAegS86BTfjvjUxfr/KAspNy
	lcj9NF3/BjIguRYRoOUqAuSOlh72b9pQ=
X-Google-Smtp-Source: AGHT+IF9++qHYiuPHiWauez3qRSrUHvMayVWzvJrcOfcNo7i/yrhmrYVHb6QAaQSHz7U4wtTpPUlig==
X-Received: by 2002:a17:907:9410:b0:b04:f5a:8c13 with SMTP id a640c23a62f3a-b04b14b37c6mr1141849566b.15.1757432977815;
        Tue, 09 Sep 2025 08:49:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833ebe61sm9036166b.89.2025.09.09.08.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 08:49:37 -0700 (PDT)
Message-ID: <66181824-1f94-4cd1-8881-d231b4c61a7c@gmail.com>
Date: Tue, 9 Sep 2025 17:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] wic: Add sector size support to WIC partition
 and bootimg_efi plugin for UFS
To: macpaul.lin@mediatek.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexander Kanavin <alex@linutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Otavio Salvador <otavio@ossystems.com.br>,
 openembedded-core@lists.openembedded.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250909134117.2219965-1-macpaul.lin@mediatek.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250909134117.2219965-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 15:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223121

On 9/9/25 15:41, Macpaul Lin via lists.openembedded.org wrote:
> Introduce --sector-size argument to ksparse.py and propagate sector_size
> to partition objects. Update bootimg_efi plugin to validate sector size
> and pass it to mkdosfs, enabling creation of EFI system partitions with
> variable sector sizes. This change is required to support UFS storage.
>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  scripts/lib/wic/help.py                       |  6 ++++++
>  scripts/lib/wic/ksparser.py                   |  1 +
>  scripts/lib/wic/partition.py                  |  1 +
>  scripts/lib/wic/plugins/source/bootimg_efi.py | 18 ++++++++++++++++--
>  4 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 6b49a67de938..35347b2df8ad 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -885,6 +885,12 @@ DESCRIPTION
>                         is larger than --fixed-size and error will be
>                         raised when assembling disk image.
>  
> +         --sector-size: The sector size in bytes. The value must be an
> +                        integer and one of 512, 1024, or 4096. The
> +                        default is 512. This enables a variable sector
> +                        size for EFI partitions, which is supported on
> +                        devices such as eMMC and UFS storages.
> +
>           --source: This option is a wic-specific option that names the
>                     source of the data that will populate the
>                     partition.  The most common value for this option
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 705f98975084..0bfdabe1bf22 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -182,6 +182,7 @@ class KickStart():
>          sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
>          sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
>  
> +        part.add_argument('--sector-size', type=int, default=512)
>          part.add_argument('--source')
>          part.add_argument('--sourceparams')
>          part.add_argument('--system-id', type=systemidtype)
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 0c9b1a5b9620..d64b2e731f5b 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -49,6 +49,7 @@ class Partition():
>          self.rootfs_dir = args.rootfs_dir
>          self.size = args.size
>          self.fixed_size = args.fixed_size
> +        self.sector_size = args.sector_size
>          self.source = args.source
>          self.sourceparams = args.sourceparams
>          self.system_id = args.system_id
> diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
> index cf16705a285a..a1b00d91bf53 100644
> --- a/scripts/lib/wic/plugins/source/bootimg_efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
> @@ -415,8 +415,22 @@ class BootimgEFIPlugin(SourcePlugin):
>  
>          label = part.label if part.label else "ESP"
>  
> -        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
> -                    (label, part.fsuuid, bootimg, blocks)
> +        # Validate part.fixed_size
> +        if part.sector_size not in (512, 1024, 4096):
> +            logger.debug("Invalid '--sector-size' specified (%s). " \
> +                         "Allowed values are 512, 1024, or 4096. " \
> +                         "Setting to default 512.",
> +                         part.sector_size)
> +            part.sector_size = 512
> +
> +        # Support variable sector size
> +        # mkdosfs -C expects number of blocks, which is (size in bytes) // sector_size
> +        size_bytes = blocks * 1024
> +        blocks = size_bytes // part.sector_size

I believe that this can be off by one, on the short side. E.g. if
sector_size = 4096 and the original value of blocks = $n * 4 + 3, then
the final blocks will end up as $n, and the last 3kB is cut off.

> +
> +        dosfs_cmd = "mkdosfs -n %s -i %s -C %s %d -S %d" % \
> +                    (label, part.fsuuid, bootimg, blocks, part.sector_size)

The "-v" argument seems to be lost - could you please add it back?

> +
>          exec_native_cmd(dosfs_cmd, native_sysroot)
>          logger.debug("mkdosfs:\n%s" % (str(out)))
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223111): https://lists.openembedded.org/g/openembedded-core/message/223111
> Mute This Topic: https://lists.openembedded.org/mt/115150315/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


