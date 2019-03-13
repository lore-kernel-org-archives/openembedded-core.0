Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9607E71B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 23:08:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b2so2566585pgl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6OL+qUnMXeWUrCuD/08sVQ6+uNpgj3bpX43r6Uiw/0A=;
	b=fVFbHlsGznacyqvdI/xM0w6MBVn8IpGi+jQ/jmXyI0zBlSd75CVno9Q7A8i3lQlAku
	oBtmQfj755NzcaoAebjok5SpqIy/N1FnSA+8CYutYOixHg4PYou6u/jA9Np6RP0TOyY6
	MbBklkrIYP4ODmNzE86XRpOIyIk3go/e7z41tquzgbBghmTadduNejEQWwTTSz7TFM5k
	2ISdTupwIq7K38Apry439jKkyKxqLd0ky8vB7aIyjMjpx51FkF9bP5UCvZQ4As4P/LmE
	5nccvt/2YF93zOUwfx+/0F130JQad2/ETg/Vi5EPa1G7IOrfaKH4GmQx+po7wMbimOxm
	xuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6OL+qUnMXeWUrCuD/08sVQ6+uNpgj3bpX43r6Uiw/0A=;
	b=KY9wUwgBrYsZkjP5UvZ7+9ZnLY9xuRmdYr26QNPgZmZWZf78+zwQQPQ9MnHLnCwEcl
	YdJ1S/LpAbVbwgYpKCQriUye8gxrF6vJJtrOK/ya2o0c+Ts7z3b8d5mNiWYGv1gzWxCE
	ysLMoXPIjVd5DxeZV222oxlSXYtK8v+mLA3fh/ydTdllPRS6MDXHsYCBKdq0rQ2PiosE
	FWf3BIv5iNj82IYW3FYMJigK7H/NOkm0IwiBdJ3aFSRW98fp8X8alHLT8wCNgMOaNcCr
	jlF4s98PBCimqj0co9xPI+68Evbkdzh0bA6Llgc6CEe9HpcQF013rIe0RUNwUZhdYDX7
	HpzA==
X-Gm-Message-State: APjAAAUP4bRSt3qL97Nx/C6fhwD58u6pmonfU8DiI7I18T6TnMaXjeE/
	/F+gTITf/NmLMyaYgBMg+PY=
X-Google-Smtp-Source: APXvYqxN4BYCglwcldnDenamhtccHRjTHmSwJRNLoRpDZJYYo71qoGGJ69ThYncbr4ciAL9ADQqKQQ==
X-Received: by 2002:a63:cc44:: with SMTP id q4mr42483534pgi.183.1552518524525; 
	Wed, 13 Mar 2019 16:08:44 -0700 (PDT)
Received: from [192.168.29.242] (c-71-204-143-8.hsd1.ca.comcast.net.
	[71.204.143.8]) by smtp.gmail.com with ESMTPSA id
	b15sm16099654pgd.44.2019.03.13.16.08.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 16:08:43 -0700 (PDT)
To: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>,
	openembedded-core@lists.openembedded.org
References: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <13babe98-b9e6-c0cc-e890-ea83a1b95cfe@gmail.com>
Date: Wed, 13 Mar 2019 16:08:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
Subject: Re: [Sumo][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Wed, 13 Mar 2019 23:08:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/13/19 1:53 PM, Jonathan Rajotte wrote:
> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>

please provide more info on the update. is this fixing something? is it
a bug fix only release?

- armin
> ---
>  .../lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb} (90%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> similarity index 90%
> rename from meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> rename to meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> index d79a47931c..b5c43200d6 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> @@ -23,8 +23,8 @@ PE = "2"
>  SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
>             file://lttng-ust-doc-examples-disable.patch \
>            "
> -SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
> -SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
> +SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
> +SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
>  
>  CVE_PRODUCT = "ust"
>  


