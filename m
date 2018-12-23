Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id D3E2860110
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Dec 2018 16:48:27 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id a14so4695227plm.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Dec 2018 08:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=l8E1Cln40lIhVUzK/4I5PAoKa+juOLeRHxuMXYZietY=;
	b=SZbfCFdk3IXndr2lXdMEJyQZste666C6DstiAf4b3UC5yoPq/7t0s6RRA3gkVcPHjS
	Gb3Zl17ytBvialEncyc0fOzMFfj0kc9SrqFoHzNZecasvNVWZTeO9nhKvVKlN/kRoB5o
	T1DKJakpUbK96iHFNqZJ4kWosbvMzQqu5aSY48Z8yQXCaAcWlXfZsZWaogW1blhPBSk3
	+s4nkHqQpz+qOqRu0R1lb1EhrMM0OglikJ6R1fpsmJnG4OB6MqhU4FBoOeeCkefGd3xj
	g3PKSk5UbNPkQv+Lu9aQd8UpBXYDFXmhxsfuKrwXG/byamwZYc7waWSa6A0YE6arqHV/
	ZENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=l8E1Cln40lIhVUzK/4I5PAoKa+juOLeRHxuMXYZietY=;
	b=lXLOAatpqMb5G0RiWhi9fTOoSmmC370pZy+VwDXvndqgC/6Ri4eaLQvQmn7N6eumLS
	PSXMImtwpgF9Q0M29ezygJeFxRwgp0GglO4goGyi+I/XOjUr3IMRFdaHv6AAYYwvX/Bs
	Nabmh9wLQawdmOaGHx+2C7ECl1fbQClJYHHvFiLY0D8/JuOk7JcU8KHYoo/+hTBQS1PM
	wwaAFa5b9tVOFyQojRCZJybZ7OE0rblEPeVGA3rMm5b4gNKJxtc3tmyOdyjg1TyYOapG
	a1xj2ftvtdoYzW+Yaezw4Q+EV43nG1YkOaUyOifWI76CSlnT1K5w+KZx/yhZ3jLgY3Dh
	Xdvg==
X-Gm-Message-State: AJcUukejPozf84qo9jFmpRYB/sDxWxkZhecNIvP0td+aLddzd0c1VHTP
	ZvAjz72ebVoG4t6Ilire4U1W3wbQ
X-Google-Smtp-Source: ALg8bN7W42AueHLYbg9rE/V0LLCM7mxH5UTWRWaSlTNPATSI887Z9nhLsgDb1FYG9k6Xl6RcYgrhEg==
X-Received: by 2002:a17:902:468:: with SMTP id 95mr10020932ple.3.1545583708519;
	Sun, 23 Dec 2018 08:48:28 -0800 (PST)
Received: from [192.168.6.217] (68-113-57-18.static.snlo.ca.charter.com.
	[68.113.57.18])
	by smtp.gmail.com with ESMTPSA id w3sm39482624pge.8.2018.12.23.08.48.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 08:48:27 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <20181222221322.3768-1-pkj@axis.com>
	<20181222221322.3768-2-pkj@axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <46de7aeb-d3a1-23da-d338-474072c7879a@gmail.com>
Date: Sun, 23 Dec 2018 08:48:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181222221322.3768-2-pkj@axis.com>
Subject: Re: [thud][PATCH 2/2] meson: Correct use of the _append operator
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
X-List-Received-Date: Sun, 23 Dec 2018 16:48:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/22/18 2:13 PM, Peter Kjellerstedt wrote:
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>
> The value to SRC_URI_append_class-native was not prefixed with a space.
> This was not noticed as the SRC_URI before applying the _append contains
> trailing spaces. However, if one, e.g., has a .bbappend and adds to the
> SRC_URI using SRC_URI += "file://foo.patch", then there no longer is any
> trailing space and the _append concatenates the two URIs together,
> leading to a build failue.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This is stagged in stable/thud-nmut.

thanks.

> ---
>
> This is a backport from master.
>
>  meta/recipes-devtools/meson/meson.inc | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
> index b7fb3e698a..40b29d5802 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -15,9 +15,10 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>  SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
>  SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
>  
> -SRC_URI_append_class-native = "file://0002-Make-CPU-family-warnings-fatal.patch \
> -                               file://0001-Support-building-allarch-recipes-again.patch \
> -                               "
> +SRC_URI_append_class-native = " \
> +    file://0002-Make-CPU-family-warnings-fatal.patch \
> +    file://0001-Support-building-allarch-recipes-again.patch \
> +"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
>  


