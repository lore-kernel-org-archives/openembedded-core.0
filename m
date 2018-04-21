Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD95771985
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 21:18:34 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id t12so5697291pgp.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kiizUeWCWyaMcDnDhxmLxMSlKrjVaHU5SP8rB/Cnfpo=;
	b=eqPwMex1WhUBIdHHUsKTccC6KaULvK+N5c6b92hKuY4TpVoIKksf3qfldxQPdJNB5z
	lvho9mJQcWaxlkDj97rmawTvCALvLOpewgz2ph7Z+uCmnUlpVK4hZHgd6uu/RKyg5D72
	SRPuACIc/j8TEzGo3tkqxa7+BPyo4PIH6vmLROsrOuNU2cnmPUPjsbUwn8w2sVV/N2Nk
	Bh/l2xfQLiMV+1AYWPvc0dq+Y5EesSWpk6WRo2JPpfdYkyizMzseVSt0m42WyOzVsZPK
	9SaEVSW8XotvgjezmFE5xL0N9H2AQ/DcsPPPR1AeTB9/xcYEzMSMsUxqav7Ex3KlulN8
	8+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=kiizUeWCWyaMcDnDhxmLxMSlKrjVaHU5SP8rB/Cnfpo=;
	b=Q97sx4jqSeGXGJONfUdg4OCoFCa793t+0ipAOA8s5xXBW2QT+L8DMqiy2sHgvPPch3
	HqsbhP5pW7hGpEfRmDBjyS5joaBRxdD5GLxUyxlYv+OjmwgKZgVRunx4wNjtq0tuvOO9
	hxNt+bcgFYDQrnpGzgmWz0kzAwNuac8cXy7c0L9xJfgc2MJWkpyuPV3wM4JJiid9UiXX
	VcEpV6Td0eTtp69bkPb186tH9F10ZiLRwdHq8Opvr7Ca07IV8O3rdGH+vK47a8LAgz9Q
	R1nlfCPSgRohOaZEBzKH4koiigOWpOUM5PMGs7jqXzX3I1Z/py/PrZg/hnzW9QqkIlaj
	/pkw==
X-Gm-Message-State: ALQs6tDY3rMzXFR+AKJVzeGKQd4UgRk0G+h110N0RznUfl5cPJIDGLTQ
	TeFtWrjiMFYyy/YuAW4blsZWTA==
X-Google-Smtp-Source: AIpwx4+cLhvJ/Cma2Z/A2b16gsBxUO62ckdeOvUmTq3kjSDtV1MDtxZedkXRaH4IvFfpMo+9/ITP7A==
X-Received: by 10.101.101.136 with SMTP id u8mr12556851pgv.333.1524345515927; 
	Sat, 21 Apr 2018 14:18:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:ad3f:3096:6add:98d8?
	([2601:202:4000:1184:ad3f:3096:6add:98d8])
	by smtp.gmail.com with ESMTPSA id
	125sm14791003pff.158.2018.04.21.14.18.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Apr 2018 14:18:35 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20180421162436.17402-1-dev@sashko.rv.ua>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <92ffe7dc-2e08-4055-f69a-19e8abc549af@gmail.com>
Date: Sat, 21 Apr 2018 14:18:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180421162436.17402-1-dev@sashko.rv.ua>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: Re: [meta-oe][PATCH] curl: upgrade to 7.59.0
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
X-List-Received-Date: Sat, 21 Apr 2018 21:18:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/21/2018 09:24 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> ---
>  meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} (95%)

Thank you for the patch but an update is sitting in master-next

http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-support/curl?h=master-next&id=632c034669a66ee4af2d915eee92f665c4282675

- armin
>
> diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-support/curl/curl_7.59.0.bb
> similarity index 95%
> rename from meta/recipes-support/curl/curl_7.58.0.bb
> rename to meta/recipes-support/curl/curl_7.59.0.bb
> index d2d0180268..c244c60d69 100644
> --- a/meta/recipes-support/curl/curl_7.58.0.bb
> +++ b/meta/recipes-support/curl/curl_7.59.0.bb
> @@ -15,8 +15,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>  #
>  SRC_URI += " file://configure_ac.patch"
>  
> -SRC_URI[md5sum] = "fa049f9f90c1ae473a2a7bcfa14de976"
> -SRC_URI[sha256sum] = "1cb081f97807c01e3ed747b6e1c9fee7a01cb10048f1cd0b5f56cfe0209de731"
> +SRC_URI[md5sum] = "a2192804f7c2636a09320416afcf888e"
> +SRC_URI[sha256sum] = "b5920ffd6a8c95585fb95070e0ced38322790cb335c39d0dab852d12e157b5a0"
>  
>  CVE_PRODUCT = "libcurl"
>  inherit autotools pkgconfig binconfig multilib_header


