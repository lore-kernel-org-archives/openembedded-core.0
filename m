Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 17C056B073
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 22:18:17 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i2so164452pgj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 15:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=LprWUekIwM+dmOh7HqbeCduyTCeWhrQl2rlppcS7pH8=;
	b=OKsXwOHBEh9T7//Dx8xHEtxo2bCJRYYBpJ8erjrDcJAEXcVVscOpQkzRGaOkeTzKh9
	1suUCA5/0qab4cZn08UJ8tUBmMsz6zxuY81vlq4BHwQOt7rlk2cNqWi3xz4gFYZIfY57
	qf5um0HdIcGwidaZDAX/+jja3TSSPxQ39KgitR8VEW3tBeSnno/1xIoYl2rHIwt+5DxH
	PKtcuF5vdbkk1iFeeKjjVkw2euGVUvuN8AEjWu3h0mrB2aI8JVCuu9cpRH4dZIHFjReZ
	K/d5WTSmGEfQbj8zkkNnrsqtKeVNE4Mr+TlQpbV0yJqd749ilExuNhzINQK+GDxnHoKt
	pfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=LprWUekIwM+dmOh7HqbeCduyTCeWhrQl2rlppcS7pH8=;
	b=gWLMO5KIeuZiKCxHg8DRRvweTPYw9craNeKgf7lVOIpjWDbuPfYdJuH4c6eHeil8kn
	pmbSehBblp3UXmuuP1+UEtOrNIUJnJNeIvCLbb1B9G+Jvilfj0zap23cqMi2hmDeOVaR
	t2BN/V2914NykJb1YhbyFLZXMO9rM8eYXHN9d0WRxKsisVUNthDb/2MtHIAHHpl+D8Y5
	4jO0E5fukD7+ZMODzFWVnTDaahg79IUqtPZzaopEAswdoV9frxSY88G9G0t3O39PgYvD
	h8wA+9wnCspNuSyfvCqC6t6VB3k1UJoxErjzVB+/Xxv5SYAWJi/tY1uBiiUXfFQwWh0a
	Vlvw==
X-Gm-Message-State: APjAAAXYwtDdPgLlGZJEj0bltIh7aNPjzwCMUxCFmYWz4E/RcQzQNho9
	6cfrDH6Zzf3ROvjxd6C4iCBSSwRh
X-Google-Smtp-Source: APXvYqyWV5qCV/rMkKFbADGJ0LiNlhFtNsS/vf0+JH8BNwZFri4zSEKktcE2sKwaaGv7lJeDxIvbog==
X-Received: by 2002:a62:70c9:: with SMTP id l192mr4235112pfc.207.1553033898006;
	Tue, 19 Mar 2019 15:18:18 -0700 (PDT)
Received: from [10.20.245.5] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id j20sm92674pff.22.2019.03.19.15.18.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 15:18:17 -0700 (PDT)
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20190319163652.24216-1-otavio@ossystems.com.br>
	<20190319163652.24216-2-otavio@ossystems.com.br>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <254384af-50d5-f2db-3da9-5d3877775151@gmail.com>
Date: Tue, 19 Mar 2019 15:18:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190319163652.24216-2-otavio@ossystems.com.br>
Subject: Re: [PATCH v5 2/3] openssl: Upgrade 1.1.1a -> 1.1.1b
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2019 22:18:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/19/19 9:36 AM, Otavio Salvador wrote:
> License-Update: copyright years updated
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v5: None
> Changes in v4:
> - new patch
I don't see a patch and V5 does not mention removing patch
>
> Changes in v3: None
> Changes in v2: None
If none why V listed?

Is this update applicable to Thud?

- armin
>
>  .../openssl/{openssl_1.1.1a.bb => openssl_1.1.1b.bb}        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1a.bb => openssl_1.1.1b.bb} (96%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
> similarity index 96%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
> index 506d6d378c..450ef930c5 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
> @@ -7,7 +7,7 @@ SECTION = "libs/network"
>  # "openssl" here actually means both OpenSSL and SSLeay licenses apply
>  # (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENSEMAPped)
>  LICENSE = "openssl"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
>  
>  DEPENDS = "hostperl-runtime-native"
>  
> @@ -22,8 +22,8 @@ SRC_URI_append_class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>  
> -SRC_URI[md5sum] = "963deb2272d6be7d4c2458afd2517b73"
> -SRC_URI[sha256sum] = "fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5d71d9ffed3f9f41"
> +SRC_URI[md5sum] = "4532712e7bcc9414f5bce995e4e13930"
> +SRC_URI[sha256sum] = "5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b"
>  
>  inherit lib_package multilib_header ptest
>  


