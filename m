Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9B37ECC7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 20:58:19 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x127so18813727pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=HKwIsD6mx1jd6RJy8hoBsfi5UQxLpqS366Ab7y1fYUA=;
	b=EkVVcqBFJYLPzRbCPt/rg5/tPaH2oxR5BZmfWz/xWyD+hTJDe+Q4PalEGQ/aoEJbcV
	DFi9T5r8jhOXdEjrfJsVLOYCWBl551FwZIAIbIVYKu+dnHPcFKO4yXVC0WfP3ISg3wcI
	hWGi/e/59HAOB+JsLVvHYNB2zlaEjZ9l1tbyT0/4CbNNwbV2kit+EgM0tsZo8gImFIhz
	fTKIqIRKcFhShPZ6uSKOtoi8JTfzvCE7cL8sWY5LEv9yHiIQUiaxaYipk27yMdOWm6Fh
	oZ8R7egAu2A9TFbq2w7ylrIto5kkAM3U2fZwEAj8EN9ITiGqqY9mkjx/wczDzTWQY6cp
	ThmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=HKwIsD6mx1jd6RJy8hoBsfi5UQxLpqS366Ab7y1fYUA=;
	b=C6PCrZcSF+lV0frjUCuz5qZ9k3wzad5rR+xAsqEFo0N0WBYglfam7c4nYMrOlE5dUb
	pKJ4TFrl5A79LRupwOtoYKx9G6fmngna8Hnm6ESqpVa++zqO8EliFDWgtfBV/3g7GU5Z
	LZrHvNxJUlWIhmljtFAengV/JihJQlFGq4mTQXqw1FENqLnX1hLrfhw1HFGnZjGHUBGj
	kzlpo5uLuCVkkSAQQC5hHvADOOR0OgWXiIBHRB6B0CEP5XVILsHmQnH0IKiTUA5oQ47+
	1Qe8xl08SuKw3x3L9hYG0v6uK37WYp+EtnwIBHDduZmMz5RcyvL3LHcmw76g1OmY9lZk
	LXbA==
X-Gm-Message-State: APjAAAWeZBE8dIau/ZQrHtNwSoDVy6jiRodFIc55eOnSb8aszdESe7Vt
	l+NJ7BDt3YYPig2wOw78s2VHxxgDsak=
X-Google-Smtp-Source: APXvYqy7N/zfv17qkEKCRbPh52rQFFudiP2mBFj7sH64VATkwYQPFD3EmYMy+JzL1A0jOgdL7aevJg==
X-Received: by 2002:a63:4c5a:: with SMTP id m26mr44458189pgl.270.1568408300697;
	Fri, 13 Sep 2019 13:58:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:b812:1f2e:5b35:90e5?
	([2601:202:4180:c33:b812:1f2e:5b35:90e5])
	by smtp.gmail.com with ESMTPSA id
	129sm33401197pfd.173.2019.09.13.13.58.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Sep 2019 13:58:20 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190913191705.32022-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <12846e1e-2489-5686-b2ff-eca62620e96c@gmail.com>
Date: Fri, 13 Sep 2019 13:58:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913191705.32022-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2] curl: update to 7.66.0
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
X-List-Received-Date: Fri, 13 Sep 2019 20:58:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/13/19 12:17 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

What is in Version 2?
> ---
>  meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} (95%)
>
> diff --git a/meta/recipes-support/curl/curl_7.65.3.bb b/meta/recipes-support/curl/curl_7.66.0.bb
> similarity index 95%
> rename from meta/recipes-support/curl/curl_7.65.3.bb
> rename to meta/recipes-support/curl/curl_7.66.0.bb
> index 96f90fb8ba..d1975f2460 100644
> --- a/meta/recipes-support/curl/curl_7.65.3.bb
> +++ b/meta/recipes-support/curl/curl_7.66.0.bb
> @@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://0001-replace-krb5-config-with-pkg-config.patch \
>  "
>  
> -SRC_URI[md5sum] = "bdd220d018c23e7f9ee82894e62a70bc"
> -SRC_URI[sha256sum] = "0a855e83be482d7bc9ea00e05bdb1551a44966076762f9650959179c89fce509"
> +SRC_URI[md5sum] = "c238aa394e3aa47ca4fcb0491774149f"
> +SRC_URI[sha256sum] = "6618234e0235c420a21f4cb4c2dd0badde76e6139668739085a70c4e2fe7a141"
>  
>  CVE_PRODUCT = "curl libcurl"
>  inherit autotools pkgconfig binconfig multilib_header


