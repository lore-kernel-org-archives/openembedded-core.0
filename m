Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088D4C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 17:36:23 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.555.1636997781962778966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 09:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DzHMl1JV;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id n26so11061668pff.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 09:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=RyOX+JNoucX5cIq+48ovIEJ3IZhIA/KeQB94Vt7Wgsk=;
        b=DzHMl1JVkIxxOS9XZl5f+QI6Dv2IUID8IjcbYmyFPxdpkK8VHQRe3y+K4q4m6Je43/
         oi5GiLKv4M3tOrLQTOvkcoCeH8qqgJpDPyX+b0D49Dhzl+nf4NdXfSrQoWc13yFZJjvZ
         JMdpM6A1GIB94m8NyUhwq9ntVn3A4iOCCCAuhZvryLfIs9glM0WMN/fxIJ/EFzRcc74d
         BQesGO/FWimVuXn6gbdV4DmC6zuBPemHihDI28CGnHTpJiw1oK/W4cSrshe0cYfPSpQs
         QgpzWkQJawQ4eTYQKOF1KwgHe2BOqkRywd5PuO3CvBh/LfHh1AOdT35F+h21INBPO6qt
         I1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=RyOX+JNoucX5cIq+48ovIEJ3IZhIA/KeQB94Vt7Wgsk=;
        b=vMihGU6yc8Q5kV0LpGtmXvhVHeYhE8K2FFV9O6UszjGe4Mor1cN1/Afgr50UGLzX2b
         pYo1s5OozCtKgt6wuysX45Q8kyJC2upYO2Ukm/lWIjLV5OTf9YJH/Djmp9O+ncCYyN7G
         fXqgrYzaN+MevML4LALMkaav3drX+hi6YRBBkp30pGJShp0eqQU6zIqrNqAg0Hk9VluX
         oHCZgN+pvusrOK87MNfMcLBsaFKA8ynqwLnD1m6SDwxhYai2M6U0lucAw1Ci22OKDf/U
         wtpipTFp3crNfne0Igp4UulCpDL9IqEGvAOQThC56VdSetxzftblyp8Jyia7nOJkPhxs
         U4ig==
X-Gm-Message-State: AOAM532WJ9irdHbwIAQMKTLGKYipSUFf0qei96GqFEW5YZkZ1C2XgsJU
	+9nDzvk9i16FxzvAvpnKPZw=
X-Google-Smtp-Source: 
 ABdhPJyTG6kI+Io6yTHZBsWxPtb9nbLlHQNulcGZ2qlksY7cKx6phCd7kc9h55jdsl7+VdUdOzjsSQ==
X-Received: by 2002:a63:68c9:: with SMTP id d192mr349361pgc.335.1636997781149;
        Mon, 15 Nov 2021 09:36:21 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:bc73:9bbe:f6ac:7062?
 ([2601:646:9200:a0f0:bc73:9bbe:f6ac:7062])
        by smtp.gmail.com with ESMTPSA id
 r6sm13094623pjg.21.2021.11.15.09.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 09:36:20 -0800 (PST)
Message-ID: <4ef0dd57-8c9e-900e-cf43-9c4be74bbffb@gmail.com>
Date: Mon, 15 Nov 2021 09:36:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [OE-core] [hardknott][PATCH v2] rust-cross: Replace TARGET_ARCH
 with TUNE_PKGARCH
Content-Language: en-US
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
 umesh.kalappa0@gmail.com
References: <20211115140340.8047-1-pgowda.cve@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211115140340.8047-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 17:36:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158308



On 11/15/21 6:03 AM, Pgowda wrote:
> rust-cross-* imported from meta-rust has incorrect signatures,
> depending on MACHINEOVERRIDES making it effectively MACHINE_ARCH
> as shown by sstate-diff-machines.sh:
> 
> openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc \
> --machines="qemuarm64 qemuarm64copy" --targets=rust-cross-aarch64-glibc \
> --analyze
> 
>   === Comparing signatures for task do_configure.sigdata between
>   qemuarm64 and qemuarm64copy ===
> ERROR: gcc-runtime different signature for task do_configure.sigdata
> between qemuarm64 and qemuarm64copy
> NOTE: Starting bitbake server...
> Hash for dependent task gcc/gcc-runtime_11.2.bb:do_prepare_recipe_sysroot
> changed from
> da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 to
> 47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
> Unable to find matching sigdata for
> openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:
> do_prepare_recipe_sysroot with hashes
> da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 or
> 47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
> 
> The following patch takes TUNE_PKGARCH into consideration instead
> of TARGET_ARCH and results in signatures as expected.
> 
> [YOCTO #14613]
> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>   meta/recipes-devtools/rust/rust-cross.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
> index bb625f4240..a77f7d5122 100644
> --- a/meta/recipes-devtools/rust/rust-cross.inc
> +++ b/meta/recipes-devtools/rust/rust-cross.inc
> @@ -34,7 +34,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
>   DEPENDS += "rust-native"
>   
>   PROVIDES = "virtual/${TARGET_PREFIX}rust"
> -PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
> +PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"

reluctanly, this is ok for now. But I think we need to think this fresh 
and limit the tune specific changes a bit better, llvm takes a long time 
to compile and this could be inefficient for fleet of similar looking SOCs

>   
>   # In the cross compilation case, rustc doesn't seem to get the rpath quite
>   # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158292): https://lists.openembedded.org/g/openembedded-core/message/158292
> Mute This Topic: https://lists.openembedded.org/mt/87069441/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

