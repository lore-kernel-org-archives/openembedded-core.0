Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7867CFDD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 17:03:13 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y6so5934590ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=42Xny3nY4+E12Q6gcEZzOWYeKO/paDhy7lzL8xqHJHw=;
	b=rQhoDfDkgT42xDOfL4+5E9yAbYzS2PxCqy6Nk7+nEdKDIXTgWvzfuGz2lHtF2Q/2TQ
	5tAYapx/8OJQQ72/uthzZh7epAW5xNRShimCyuQXQgltraCxjvXcqiqUJnHMhBKHOfTr
	hnUYq7f2YAg/kG8bi4df9xIPK/LjE1MqyRohaC5jxKXKV2YDsazyT8d3XwSqRoK6zR5t
	gVIlAOluzvpxIgxv5vuwMpoX3lukm35xVtTtAe3er84HpFqQscv5gqCVuZpilLxj6Y1q
	8GJbGtnsWA2aor0K1UNLTQxadLSS3NnnNdPK4lwHZBFuWhKZXvnxqbZUv8nnApoPlNO1
	dQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=42Xny3nY4+E12Q6gcEZzOWYeKO/paDhy7lzL8xqHJHw=;
	b=pkGaGRw2iwj4GcZXONrEC7OsztfpJqpD1iLN6xDx/BJNC1/QcZMYGZpl/3nmZIxXzU
	tH75Nd1pnICCNZ6KhfTaxNUMdXS5kuUhN9vQj5zLP1O7Od/LA/HfpMGbHNDaVA+pNmsC
	xh0UFYrCaX8wmu6UbjKXGH0GR0+UMX5WwDd56Py79Nr7lgveFx8f3PtvT53OWC9ghujf
	o8/h6lX8pmM+R4jYplhBUSzEa/5vWijZnMV11m42sy6VdhvmPb5zKkGI+Q25GKxbTYx/
	5nyrh89+fsAWtlemK12JaZw8NjjiMiY8O3OsE3n/T7ePucAVe5pDmiHWsP+cYYJy3NO+
	kMAg==
X-Gm-Message-State: APjAAAX/Hb6CPc98byVWkSMYsLgKbEW5rlb9X3NzRxHF6FJondr3dZb+
	mfAnJWJFvVjadS5X5AwhPUMq3I45+lU=
X-Google-Smtp-Source: APXvYqy8BVhNOf+aH71VTPGl0DNFlvBsnabw+gSOuvw62DzMWDhwfFVgHu8WyuQzSwqw4WpiKrzYDQ==
X-Received: by 2002:a2e:978b:: with SMTP id y11mr13746432lji.190.1554051794184;
	Sun, 31 Mar 2019 10:03:14 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	e20sm1569696ljl.95.2019.03.31.10.03.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 10:03:13 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20190331162956.3066-1-open.source@oleksandr-kravchuk.com>
	<31add999-92a5-c7a3-f912-04eb3ca895bd@gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <8eb28e4a-be22-5d57-9eca-8cd4067fd0e9@oleksandr-kravchuk.com>
Date: Sun, 31 Mar 2019 19:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <31add999-92a5-c7a3-f912-04eb3ca895bd@gmail.com>
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
X-List-Received-Date: Sun, 31 Mar 2019 17:03:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Not only big fixes, but mostly: https://curl.haxx.se/changes.html#7_64_1

On 31/03/2019 19:00, akuster808 wrote:
> is this a bug fix only update?
>
> On 3/31/19 9:29 AM, Oleksandr Kravchuk wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} (95%)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.64.0.bb b/meta/recipes-support/curl/curl_7.64.1.bb
>> similarity index 95%
>> rename from meta/recipes-support/curl/curl_7.64.0.bb
>> rename to meta/recipes-support/curl/curl_7.64.1.bb
>> index a1b5e7d579..47c28beff6 100644
>> --- a/meta/recipes-support/curl/curl_7.64.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.64.1.bb
>> @@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>>             file://0001-replace-krb5-config-with-pkg-config.patch \
>>  "
>>  
>> -SRC_URI[md5sum] = "d0bcc586873cfef08b4b9594e5395a33"
>> -SRC_URI[sha256sum] = "d573ba1c2d1cf9d8533fadcce480d778417964e8d04ccddcc76e591d544cf2eb"
>> +SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
>> +SRC_URI[sha256sum] = "4cc7c738b35250d0680f29e93e0820c4cb40035f43514ea3ec8d60322d41a45d"
>>  
>>  CVE_PRODUCT = "curl libcurl"
>>  inherit autotools pkgconfig binconfig multilib_header

