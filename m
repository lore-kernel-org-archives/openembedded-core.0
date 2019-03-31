Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4657CFDD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 17:00:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b65so3285748plb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=o+ad4Y7xxSqLjChHzM+vxTMZaOczcED51li1vfYGBSo=;
	b=OVR9dkJrBWEcF+kY6kWYCAcQpf2NC52rrWla+ooqNCvsEdj76ARd2auENt2JxMVXYC
	Kig71B07s3yoo4uxlLQv9lLH9MyT77KoodeJ5tLzegHagDLEBIRZa4TV3JM5hhfryE1T
	oVWMNFc+Xnj6JtxSxqbJAnEtInd3V8GzrghuSBiK669dW9tWKGEdPBz728+b3Th7QSeZ
	SWg7zxaotmc8KuUXdSAwx3K/XEw2DO+EXB/7Id7BxYay7eQHrrykWmQxZcnwYU2zS1eB
	CpeEt6Ea66XxF9FWH/CMPYuq+zimuWJF8s29IPDprkkeo1dbmDASbHtdlUNKQZn8Ax3J
	/bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=o+ad4Y7xxSqLjChHzM+vxTMZaOczcED51li1vfYGBSo=;
	b=p44crUz5lVlDNXWuD/geRgeW4ZAx6jmkzXDzRz8YgKdUuA53vhuI+Na7Cy0nYlqviJ
	9fhT0OtjHRzfnWjido1kklyLkN8x9pzVAeKGQznvU58r1qcUalzO0jtGFG6OqWFuM6qI
	Z48qXYWXk1nI09+cUSaCrNNohEBaRUB5OBCpeig5pudJxArOfUdx4jI8vAp0xvbfE2FD
	fFmdaU5yRjT0DEIQi3Qi9hkZto8mgJ2a+ZoSncs3M0A+H4xygGwZrGl4Axracty8AY/X
	mHCXahS69gN1BpDdW6uyBRxmZIizs8p76Q5ww0pPL0su7W3p7MjAR1pOB5Lr3KSWgISC
	AZbw==
X-Gm-Message-State: APjAAAXCxwozBMN6YWQweSCoPFbM+EX0pITX/T29dtYSZkUrM+u4Uxah
	hRwRyYpqVmOm019npQuJ77Jc189D
X-Google-Smtp-Source: APXvYqwNSIkPWPb76kfWdjbuKrMzjopVgF8ndym0ucx6co2gNYKEqX4XVYBVc+YaqJVaTiKactQF5A==
X-Received: by 2002:a17:902:864b:: with SMTP id
	y11mr28132358plt.1.1554051630414; 
	Sun, 31 Mar 2019 10:00:30 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:6515:3c15:208f:c5eb?
	([2601:202:4180:c33:6515:3c15:208f:c5eb])
	by smtp.gmail.com with ESMTPSA id
	t129sm10726200pfb.127.2019.03.31.10.00.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 10:00:29 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190331162956.3066-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <31add999-92a5-c7a3-f912-04eb3ca895bd@gmail.com>
Date: Sun, 31 Mar 2019 10:00:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190331162956.3066-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] curl: update to 7.64.1
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
X-List-Received-Date: Sun, 31 Mar 2019 17:00:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

is this a bug fix only update?

On 3/31/19 9:29 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} (95%)
>
> diff --git a/meta/recipes-support/curl/curl_7.64.0.bb b/meta/recipes-support/curl/curl_7.64.1.bb
> similarity index 95%
> rename from meta/recipes-support/curl/curl_7.64.0.bb
> rename to meta/recipes-support/curl/curl_7.64.1.bb
> index a1b5e7d579..47c28beff6 100644
> --- a/meta/recipes-support/curl/curl_7.64.0.bb
> +++ b/meta/recipes-support/curl/curl_7.64.1.bb
> @@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://0001-replace-krb5-config-with-pkg-config.patch \
>  "
>  
> -SRC_URI[md5sum] = "d0bcc586873cfef08b4b9594e5395a33"
> -SRC_URI[sha256sum] = "d573ba1c2d1cf9d8533fadcce480d778417964e8d04ccddcc76e591d544cf2eb"
> +SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
> +SRC_URI[sha256sum] = "4cc7c738b35250d0680f29e93e0820c4cb40035f43514ea3ec8d60322d41a45d"
>  
>  CVE_PRODUCT = "curl libcurl"
>  inherit autotools pkgconfig binconfig multilib_header


