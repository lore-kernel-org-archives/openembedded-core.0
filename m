Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8078C2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 17:21:07 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.19198.1700068859524030543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 09:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dnnvMLNL;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9c3aec5f326so219536366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700068858; x=1700673658; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rVp53RDcskz54J7CvzRgXx0GPsYTTMULCGTUcRwQVjQ=;
        b=dnnvMLNLQ5RdXGiTw67Qc67vjZBPoYxLlINirQBVntAZtHBk6yJowOanVP7e9vyJj2
         AOzreCbt0jr+GhjV0cLHsfuQda6RTVQ1ouySTWkc5W3VtnD+HlQWGrtetlJOxOCfQG13
         ukR71RUvcFoCZYXF3PWp271gUHY5EiMU7ZN4eXF85/jwtVVN69PKbTd+pHrKPgBKPfp2
         rRbIB1Fs5z0GzmE1Tr87Q8c/jMzf7jC8uO93GYF1vYqbOxMRiiS1Lj9Ul9mHBREaNmWK
         13IvYknGMfCrpObFDoEDKigvJBgkqozutk3B76BEVN29ox5EMwU7JT9nU9ZNrz5bK7uF
         On9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700068858; x=1700673658;
        h=content-transfer-encoding:in-reply-to:organization:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVp53RDcskz54J7CvzRgXx0GPsYTTMULCGTUcRwQVjQ=;
        b=gxuVwaI7BulLJZMtAzggCkbF4G/JcYehZ1I/JLzFl+diQfDEL3xuVP7knG/BeW6hNe
         uvdRIR4HaDCqzS1A2c4g8aNbgq94AYngTdQkim7wfJn1Ug71/RDJFMd/+tFTezJsPVGh
         zrWVzrZ5ZtSaoyCAizKTcdyKhrsPU+cYS9SkKEBTHkF6BUPc0N6/DYc0n2Yic55BfRUl
         w069tBK/u1N9wB8xsZfrELFdQ0EAYfnslxjlLNP3r+t7oXE+uOMVY4olSmiAUL8E9xsF
         xb7U0VddOCGb0qs9qcrkaH6BY1lvl7swm83JZaeFgLy3n/Q/Gl1CbxiXfRAQswShOJDr
         Ospw==
X-Gm-Message-State: AOJu0Yy25PqHp+LU4hnRCJGSI+oM6S+a8fzSzj5ey69SoS/NK0sg9uwx
	GaKgFbZrlCoeQHrYxX3hc+w=
X-Google-Smtp-Source: AGHT+IG/yIOI7AOsXDHspCLCi9yx3dxv7dNSxjYSTBRg0+v+OQBCmBTEwgIRi2m8BUhw44FY09WJSw==
X-Received: by 2002:a17:907:9813:b0:9b2:be5e:3674 with SMTP id ji19-20020a170907981300b009b2be5e3674mr6362377ejc.36.1700068857766;
        Wed, 15 Nov 2023 09:20:57 -0800 (PST)
Received: from [192.168.0.148] (cable-static2-2-7.rsnweb.ch. [146.185.2.7])
        by smtp.gmail.com with ESMTPSA id a25-20020a170906469900b0098ce63e36e9sm7456669ejr.16.2023.11.15.09.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 09:20:57 -0800 (PST)
Message-ID: <e7c1441b-bcd8-4861-ae70-39ccefc22041@gmail.com>
Date: Wed, 15 Nov 2023 18:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone 4/7] openssl: Upgrade 3.0.11 -> 3.0.12
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1698632320.git.steve@sakoman.com>
 <5cf9f9426de71a35b06c7b4b9b092f22243676fb.1698632320.git.steve@sakoman.com>
Content-Language: en-US
Cc: peter.marko@siemens.com
From: Andrey Zhizhikin <andrey.z@gmail.com>
Organization: Leica Geosystems AG
In-Reply-To: <5cf9f9426de71a35b06c7b4b9b092f22243676fb.1698632320.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190738

Hello Steve,

I've just stumbled upon the fact that this upgrade causes softhsm 
package to throw SIGSEGV when PKCS#11 engine is used.

There is an ongoing discussion on both OpenSSL [1] and SoftHSM [2] 
repositories on how to address this issue, but there is no definitive 
solution presented at the moment.

Please note, that master openssl version 3.1.4 is also affected in the 
same way, as it looks like that patch(es) applied in openssl were 
back-ported onto both 'openssl-3.0' and 'openssl-3.1' branches.

Since softhsm is used in quite few scenarios to serve as PKCS#11 
provider, I guess this upgrade would break those for quite some people 
that are using LTS release. Therefore, I would suggest to rather revert 
it and wait for appropriate solution to be developed in either of those 
packages, at the costs of having CVE-2023-5363 un-patched.

I would leave it up to you to decide on how to proceed with this further.


On 10/30/2023 3:20 AM, Steve Sakoman wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3011-and-openssl-3012-24-oct-2023
> 
> Major changes between OpenSSL 3.0.11 and OpenSSL 3.0.12 [24 Oct 2023]
> * Mitigate incorrect resize handling for symmetric cipher keys and IVs. (CVE-2023-5363)
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   .../openssl/{openssl_3.0.11.bb => openssl_3.0.12.bb}            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-connectivity/openssl/{openssl_3.0.11.bb => openssl_3.0.12.bb} (99%)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.11.bb b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.11.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.12.bb
> index 22eaa3af33..d8c9b073a2 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.11.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
> @@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
>              file://environment.d-openssl.sh \
>              "
>   
> -SRC_URI[sha256sum] = "b3425d3bb4a2218d0697eb41f7fc0cdede016ed19ca49d168b78e8d947887f55"
> +SRC_URI[sha256sum] = "f93c9e8edde5e9166119de31755fc87b4aa34863662f67ddfcba14d0b6b69b61"
>   
>   inherit lib_package multilib_header multilib_script ptest perlnative
>   MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

Regards,
Andrey


Link: [1]: https://github.com/openssl/openssl/issues/22508
Link: [2]: https://github.com/opendnssec/SoftHSMv2/issues/729

