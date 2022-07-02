Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A12C43334
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 12:33:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.49723.1656765187154800993
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 05:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZeWg4kYu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id i25so6727021wrc.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=L3Tse9uOc0nbsk9RL90M93mqbDu3/JXcGcGqjKZ3ILI=;
        b=ZeWg4kYuPXrx2kLErANzYfRKk5tkevhHjhfJ4wxV8xB2h3p7zJmuldy69lK8Q0T5wL
         MSup57zXHZL2GtWiE5GOk8YUkhhsUIuv+4cmPc5pySOzEI6fzaNBkQ303eGiP1DIluRU
         TKMpC15RfMlLKs7RiubGRUILCfb/uBUsdhOUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=L3Tse9uOc0nbsk9RL90M93mqbDu3/JXcGcGqjKZ3ILI=;
        b=1AUuDHCRPq4ZM9kN/BW69vi/6WyMRCCCKyGH1bFIuHcOrfghIRMXpxLODb/e0uYccp
         bK+K9yIE5WzkqfvTDGtw1UvlSfbEQTleDzmsM4adVPLVA90Z3AGHRjkPE5KZEyXwmbuj
         EvVZ6DMFD9tkKL8oeSuitf2KP8MedKPv6W4/RkDeDY31m6EcSFSidjEHdocfr+DG6foW
         70Pe/36QMt6j6CTmMInP8t0ZJ+zqwbB+n1jN8T/K1XJ6uCIEuvy712Q5L1Aa+gQgFSwU
         SPrMTVPw5RrV8ylNtYVU4pvjjpEm2br/JRx9QQ03bVGlem94TgobhIG7i5IqzxGLjBwq
         qM5w==
X-Gm-Message-State: AJIora9o3yOAhLiJtyasmJ+zExDxRcr4Pf1oah1FCQ3Wejh9jRS2L/rC
	B3u7wv2xqQioE+LXYtuxQ1/BLA==
X-Google-Smtp-Source: 
 AGRyM1vOcyvKJzLVFAEEQoTwXzNRdj9XWiiFZHlfutv9MAq/92184QPcsVBysxHm2OYdM/Qd4m5d9g==
X-Received: by 2002:a05:6000:18ab:b0:21d:231e:8397 with SMTP id
 b11-20020a05600018ab00b0021d231e8397mr18756261wri.646.1656765185517;
        Sat, 02 Jul 2022 05:33:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3569:71aa:bd43:a6d5?
 ([2001:8b0:aba:5f3c:3569:71aa:bd43:a6d5])
        by smtp.gmail.com with ESMTPSA id
 g4-20020a5d6984000000b0021bbc5a26cfsm22139027wru.79.2022.07.02.05.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 05:33:04 -0700 (PDT)
Message-ID: 
 <dbb26d0b74ed65a993a72d33c6b8a9bfe667a2a5.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] curl: Update to 7.84.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Sat, 02 Jul 2022 13:33:03 +0100
In-Reply-To: <20220701141831.101998-1-jose.quaresma@foundries.io>
References: <20220701141831.101998-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 12:33:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167549

On Fri, 2022-07-01 at 15:18 +0100, Jose Quaresma wrote:
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-support/curl/{curl_7.83.1.bb =3D> curl_7.84.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/curl/{curl_7.83.1.bb =3D> curl_7.84.0.bb} (9=
7%)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.83.1.bb b/meta/recipes-supp=
ort/curl/curl_7.84.0.bb
> similarity index 97%
> rename from meta/recipes-support/curl/curl_7.83.1.bb
> rename to meta/recipes-support/curl/curl_7.84.0.bb
> index 1d9de29a65..ade2846a64 100644
> --- a/meta/recipes-support/curl/curl_7.83.1.bb
> +++ b/meta/recipes-support/curl/curl_7.84.0.bb
> @@ -10,7 +10,7 @@ LICENSE =3D "MIT-open-group"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D190c514872597083303371684954f=
238"
> =20
>  SRC_URI =3D "https://curl.se/download/${BP}.tar.xz"
> -SRC_URI[sha256sum] =3D "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b0=
68396deb705c22c4"
> +SRC_URI[sha256sum] =3D "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080a=
ef49fbcd817c5db8"
> =20
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"

Fails on some platforms:

| In file included from ../../curl-7.84.0/lib/easy.c:89:
| ../../curl-7.84.0/lib/easy_lock.h: In function 'curl_simple_lock_lock':
| ../../curl-7.84.0/lib/easy_lock.h:56:7: error: implicit declaration of fu=
nction 'sched_yield' [-Werror=3Dimplicit-function-declaration]
|    56 |       sched_yield();
|       |       ^~~~~~~~~~~

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5476/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5447/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3228/ste=
ps/13/logs/stdio

Cheers,

Richard


