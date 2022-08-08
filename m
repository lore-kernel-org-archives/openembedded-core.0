Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59108C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:09:32 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.1096.1659978561941205152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VoAj7aYB;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id w10so9154071plq.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=BRMHxxoohRmW6dQ6dMaNC4jVNEfbIzizrn/Wgm3BtLA=;
        b=VoAj7aYBMgKWFCW2uU59uKDzpAOqalvOBd5oZjAM7QmR0AECHmw5lbUPDPZ6nPU/nq
         Juvl3r14gCeh+7UcJ1ZLtzhaClFLO2d3EJ2S3EPlGSPAv5b2TQ/ca5zb/hrCb2jsT+xi
         5SAPQ71gcpkFmATRR4GSxSt0bXbvpPSkMLrbNy/cbb9y8utdbTUC1zTIVZuViii/4FvH
         wPBszGCFXylPv5s2xUvQ0Qbyx4SdOT6aHDDGrwOQnBPxFi4NeigbvgxAMqPZIB0WBibi
         1S0Tn4l4Ar0+O0U42Z8LJPkjh578q21FJg/VQN3ZfYOVhCm7ZdVytehhkfL8EyGC9ik0
         vcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=BRMHxxoohRmW6dQ6dMaNC4jVNEfbIzizrn/Wgm3BtLA=;
        b=Tfy46lxTLHNFfZicryEeskzhqlxi6UHZD1VAKPpdqLGIkAMXf4I/2e94AdG9+dGV/Y
         zei3RnqYWw1Ih1JjaWP/UH8Q2Jgw/jmqRRyrmBmwlLMaAv7ACMm+BaAYWkX8Dbr6vOuy
         zz+A50xvLTmcfgmz31voMOqSufz0UoaXO2smoSt9c5Jw6SIqe9IAmPHVdBzHfhLAvA8a
         rS//pjtwJomqXeGMIDhzH2G1MIsiYdjpyVbeJKM9HO/Zf/QH2lmVhJpRT7iLdF3Rhff8
         SFpGnLOrXZiecKiEqfFeRgzJaOGFiOQRQJuxBp/iR9UVbhcJ+oCy1hYOsnJU4XIu12Jz
         OH9Q==
X-Gm-Message-State: ACgBeo0YSjowMO6TGkn3ND8j6VRDQJCBXggh/XbrtORv9cc/oUzIBPi4
	Su/DdkIZbNwsn2+Xcr77EQw=
X-Google-Smtp-Source: 
 AA6agR6nSS8ebVsheZ5uQBboaUKo5SVgXuPzvFlt8YQ0eWBZxpI0tc8p+ZMwVya69ioqwfEn4GuAHQ==
X-Received: by 2002:a17:90b:3805:b0:1f4:ebfe:558b with SMTP id
 mq5-20020a17090b380500b001f4ebfe558bmr30354526pjb.48.1659978561328;
        Mon, 08 Aug 2022 10:09:21 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9ab:8bd3:9e60:d783?
 ([2601:646:9200:a0f0:f9ab:8bd3:9e60:d783])
        by smtp.gmail.com with ESMTPSA id
 g72-20020a62524b000000b0052e7f103138sm8905400pfb.38.2022.08.08.10.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 10:09:20 -0700 (PDT)
Message-ID: <0b15d3b8-a2f5-3329-fe79-257d6c5036f5@gmail.com>
Date: Mon, 8 Aug 2022 10:09:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.1
Subject: Re: [OE-core] [PATCH v2 13/44] harfbuzz: upgrade 4.4.1 -> 5.1.0
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-13-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220808064237.3975347-13-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 17:09:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169102



On 8/7/22 11:42 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   ...0001-fix-signedness-of-char-in-tests.patch | 27 +++++++++++++++++++
>   .../{harfbuzz_4.4.1.bb => harfbuzz_5.1.0.bb}  |  6 +++--
>   2 files changed, 31 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
>   rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.4.1.bb => harfbuzz_5.1.0.bb} (90%)
> 
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
> new file mode 100644
> index 0000000000..029ca2bfff
> --- /dev/null
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
> @@ -0,0 +1,27 @@
> +From 1bd3884bc0544ffbb6545ed2391f0932bb8d7d91 Mon Sep 17 00:00:00 2001
> +From: psykose <alice@ayaya.dev>
> +Date: Mon, 1 Aug 2022 07:45:25 +0000
> +Subject: [PATCH] fix signedness of char in tests
> +
> +Upstream-Status: Backport

Link to commit or PR would be handy

> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + src/test-repacker.cc | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/test-repacker.cc b/src/test-repacker.cc
> +index 053c0c6..1b7e1f0 100644
> +--- a/src/test-repacker.cc
> ++++ b/src/test-repacker.cc
> +@@ -112,9 +112,9 @@ static void start_lookup (int8_t type,
> +                           hb_serialize_context_t* c)
> + {
> +   char lookup[] = {
> +-    0, type, // type
> ++    0, (char)type, // type
> +     0, 0, // flag
> +-    0, num_subtables, // num subtables
> ++    0, (char)num_subtables, // num subtables
> +   };
> +
> +   start_object (lookup, 6, c);
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
> similarity index 90%
> rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb
> rename to meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
> index c2867d2a9f..4c2d774803 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
> @@ -11,8 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
>   UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>   UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
>   
> -SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "c5bc33ac099b2e52f01d27cde21cee4281b9d5bfec7684135e268512478bc9ee"
> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
> +           file://0001-fix-signedness-of-char-in-tests.patch \
> +           "
> +SRC_URI[sha256sum] = "2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05"
>   
>   inherit meson pkgconfig lib_package gtk-doc gobject-introspection
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169037): https://lists.openembedded.org/g/openembedded-core/message/169037
> Mute This Topic: https://lists.openembedded.org/mt/92887008/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

