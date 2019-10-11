Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 222957D075
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 19:30:09 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 23so6354988pgk.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9QNjEhzb0pthG342PPBcSBZ1TRBXaFLotywsY3LS/bg=;
	b=M3cO8qqrVQXmjqIbqm2OQBv+qSKvgM6BAXAhRZ6pX/CY+6G9DwaZq3r6hA5gQ/MuB4
	5TfuKOxjjlJfnhGQtm+aTZigHQUXUgpkbI2yb+34mtCc6Wvfubaq5oAbnclUkpVBsrYr
	5r/kzR82LJP+uMDDx7Ctu74YIN9N79s027y/jdFILPXI6qgfmenm5a/Msj9ievjR+LT5
	D+Jwe8hgCdS24f9kQ8Pru9ZPu9s54mBNXpcNLiBS6vHjM7EEVGTs1GzEW/tTXp2SO3s6
	QTgpr3XMw3kVbvPP4AL9lGsoidW8wLQVfQbHLx4MSStiAB6Or6BeyQyW3fj/kLhag5NG
	GM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=9QNjEhzb0pthG342PPBcSBZ1TRBXaFLotywsY3LS/bg=;
	b=RDauRy0qWPzJFlVzzWknYlMjrqeMVgsI2gfw+OuNcynge1ohzYCadZvjXrODelQRp9
	AvQ7IaKLUrmyrHLd1bnSCXkOugdF6el3a0Mn0yXcuW9EKZBafOW6yTknDkFmaawCJdin
	CKQqRiLjYut9sDd5z2grePgXxG3rIzMAn6qxZYX73IsUeoFqOc0qXKnI6Og51gOci+YB
	vBqAxGRFh4JUcYbRForqAnLgnKp3JLTs3lAWQa1h26dD9G+7eAKq4hGNaPeLUhfonmh8
	B8kOzkJqNCpMKWmg9d9UYsvEBmtxuooJtncES6Q2rBN2LHXW6qOCryDGbRSeieihtO7c
	gC2Q==
X-Gm-Message-State: APjAAAXU21vtgwfP/1VpOLq1wD4AqToacwhkcr8pgKRkuVTbR1GK59CO
	XM8T9R3NIlsooe/Zjn94MCGAigev
X-Google-Smtp-Source: APXvYqxGpFp8ydcbGDo8/GpuVTVM8AlO5tbw9cEB0j3tq31VCafPO9/CJC/4THeUmNcgWkT2vLsTfg==
X-Received: by 2002:a63:a1d:: with SMTP id 29mr508806pgk.218.1570822210663;
	Fri, 11 Oct 2019 12:30:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:103e:a562:b75f:8d63?
	([2601:202:4180:a5c0:103e:a562:b75f:8d63])
	by smtp.gmail.com with ESMTPSA id
	v5sm11519301pfv.76.2019.10.11.12.30.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2019 12:30:10 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-10-alex.kanavin@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <60257c1a-0225-dd3d-af04-bddad416de07@gmail.com>
Date: Fri, 11 Oct 2019 12:30:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011114754.91740-10-alex.kanavin@gmail.com>
Subject: Re: [PATCH 10/19] gtk-doc: upgrade 1.31 -> 1.32
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
X-List-Received-Date: Fri, 11 Oct 2019 19:30:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/11/19 4:47 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch      | 2 +-
>  .../gtk-doc/{gtk-doc_1.31.bb => gtk-doc_1.32.bb}              | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.31.bb => gtk-doc_1.32.bb} (93%)
>
> diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> index 8c9bc954420..5ca4e3e086d 100644
> --- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> +++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> @@ -1,4 +1,4 @@
> -From 9537a7998a220b698b26d926a111bb400ff1ce01 Mon Sep 17 00:00:00 2001
> +From 657310f3842c84d28f6b77e8ad4d9b93472ca5da Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 5 Sep 2016 22:25:44 +0100

Why did the patch change?
>  Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
> diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
> similarity index 93%
> rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb
> rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
> index 4f97ce06333..50d4d99722f 100644
> --- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb
> +++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
> @@ -18,8 +18,8 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
>  PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
>  
> -SRC_URI[archive.md5sum] = "6239713011369a4fbdc7619350403772"
> -SRC_URI[archive.sha256sum] = "a51687956d0377ac70904d03fdc73c9e116589b4a01453fa92162442b3657011"
> +SRC_URI[archive.md5sum] = "07764836262e154e94922e5f2aa476ae"
> +SRC_URI[archive.sha256sum] = "de0ef034fb17cb21ab0c635ec730d19746bce52984a6706e7bbec6fb5e0b907c"
>  SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
>             file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
>             file://conditionaltests.patch \


