Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F001C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 08:19:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.6634.1657613996513358769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OvvtZpTZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: raj.khem@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so6308345wme.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=r9zPrhn71BcyvBiwCTMJjbuEjt/z/+aMYg9LN0pNOQQ=;
        b=OvvtZpTZ5oyLdOb0pN0JhB+5QTBHeE6h3tZVAlJnbSeMPe2jmfVEfaVzlGJnoyrkt7
         bdMVTfQMmPBMiWM4eLgrrjncdRJVPhlX5W2Q71PDcJ2XXkirv5v8egtbBKrhFZRtBI7z
         DP4L6KKWit5XWw4MBzoZBO58cotn/9XWg/OVo8pGpfZgQzEmtVK+j5CI19OooZpoFrtF
         PtzWrn64QyKPBr8yjMxnw4T4psYX1jEJ7Uq16nGBT1CiS3lzmdPYNyk5IUcJprWg/7/5
         DVu2VAKojBfhH6imq9H75ZQcBl6hi9u0Ri5/efF2oyiY57BJEfTplrzpoKN8URGnPyjK
         87RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=r9zPrhn71BcyvBiwCTMJjbuEjt/z/+aMYg9LN0pNOQQ=;
        b=FsZIxJgbsDWTxof6ik+pfMTO1S8455YCHVPTOS7IFPohSCNtW/2ufkY7WPIHqbEO7I
         8Re1cEyDxmFu8DOuRl3g+6RFW6TtwH1RwPrweJGmB/iCs2RqieasdZiCcmlpqF8fUGkk
         MiVXWTjFx1vIAfXJvsQ1Ptxi/S3BBrR0Q8Gnpn1RF4aJLOyVaoPA87JemWywibaWkfNc
         Qz4ZaL1B5W+wbdZYFAj5EWXXNPASQpMLM9utmCoNpRINETD7KwV8tn41s1eZYYmdH/Ng
         N8vZyF/Cw6wvMZvSRICxFGg5VwffyOwm454Sqi3W5Nm5pSKlf8z/tvQRcQqRgz0T1E1n
         HGqA==
X-Gm-Message-State: AJIora+i4GioPrRb9ERZtZRAmnOqweQUSBuku+2ybENKkB1IuhlynAVX
	Usg94gT2OADD+UK8BeYP9o+w4wlcR7MCJg==
X-Google-Smtp-Source: 
 AGRyM1s4w/9GIUZ8FoCnNCUvHlqvJWsz89JlSs9B4RQUmlamoEcYO4LOy1XhdHOoHOs7Xna+A2aPkQ==
X-Received: by 2002:a05:600c:4fc8:b0:3a1:99cf:7fe with SMTP id
 o8-20020a05600c4fc800b003a199cf07femr2448338wmq.142.1657613994391;
        Tue, 12 Jul 2022 01:19:54 -0700 (PDT)
Received: from [10.11.0.62] ([2.221.90.128])
        by smtp.gmail.com with ESMTPSA id
 t18-20020a5d6912000000b0021d888e1132sm7659423wru.43.2022.07.12.01.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:19:53 -0700 (PDT)
Message-ID: <d857b61c-8b97-056a-25bb-3e274cfe23a1@gmail.com>
Date: Tue, 12 Jul 2022 09:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.1
Subject: Re: [OE-core] [PATCH] curl: Link with libatomic on rv64
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20220712080006.1711090-1-mingli.yu@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220712080006.1711090-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 08:19:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167911

upstream has a fix in code [1] to avoid these calls lets backport that

[1] 
https://github.com/curl/curl/commit/50efb0822aa0e0ab165158dd0a26e65a2290e6d2

On 7/12/22 9:00 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes:
>    undefined reference to `__atomic_exchange_1'
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-support/curl/curl_7.84.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/curl/curl_7.84.0.bb b/meta/recipes-support/curl/curl_7.84.0.bb
> index 0d829cdf23..d8efb45a08 100644
> --- a/meta/recipes-support/curl/curl_7.84.0.bb
> +++ b/meta/recipes-support/curl/curl_7.84.0.bb
> @@ -75,6 +75,8 @@ EXTRA_OECONF = " \
>       ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls nss openssl', d) == '') else ''} \
>   "
>   
> +LDFLAGS:append:riscv64 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
> +
>   do_install:append:class-target() {
>   	# cleanup buildpaths from curl-config
>   	sed -i \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167910): https://lists.openembedded.org/g/openembedded-core/message/167910
> Mute This Topic: https://lists.openembedded.org/mt/92328681/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

