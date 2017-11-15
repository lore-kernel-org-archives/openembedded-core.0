Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E5CCA78480
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 15:27:14 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b6so17006739pff.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 07:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=A3FajRi0kaDMV9SQGus+v+OpBW7crBhcRE8AxDh7Oto=;
	b=vM14JUP10HhnJKKAuUVewtyAt+T1Z5j+KzH0wVDtJsPtp1jtBXIEfahprozxm/E5hC
	2gyM8cT5M9sufCp14JA6WJfKp59bAL60TGZgJFV/fodI9HWHA4pzUkb9KbbABZNm2O1z
	0AHFNlOethrPHSDhUZFpX6Yv9mRIQXwHL+m1VW/lkvJAFB1MUGZBlf2BXfK5ot56o8Nr
	T69Krqq3ib+vCq55CtJYakhqw6+1dQXgw5mSqp8yomDpjoiu2z+EMuIHs1vNGTU2bfPI
	o/jyhSxn2ju/W+F9W7BF7R39LzEQELj2CHjlvYyRYlI4hpF/oUFKnidzyA1goSXym+IW
	qOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=A3FajRi0kaDMV9SQGus+v+OpBW7crBhcRE8AxDh7Oto=;
	b=MwgANYWtcRXCS+00tIdmOeMz0XfpNmZ89FPZR8Hw2XRT9yoaHns14CZfKBZAIFb3/K
	mGnvG9vO0jfuj4sIy2Hr78XTrPMEk2gVFlDqNdFXktkygn+4xCgzRn+PhVJvE1Z34FFb
	CivIKAg06oXdRl2gLJt+TCOTsavmSvWaPgMJExBKfQV8dTcwDIFO1ulh+CUrAIqbKiSH
	3LdueFrViVrVe1gSTqW1lA0ftxpCPwQOz2OUCflDrLADLYyfEZlmxtUznjaLDBBxdLpY
	RYraKTCJcmTQFQhCwhSjRn/LcezqaQGRwi6+UNLVmyWkhLiKf9zeRX2r5SOqpHHJ/qva
	/FCQ==
X-Gm-Message-State: AJaThX54X95xvvCIndR0EGf0x9/JK/z2kBgzmHleg3oNJeO0b8wc5hHT
	skJpJLiuBRm1gEztmD+aiEMl4A==
X-Google-Smtp-Source: AGs4zMaT/JslBtXN11HzCUYh5mldwSzofXLm8ASQN8/523sksCSpA4NpyHQuCRJeC4aUvgxTQlo2uA==
X-Received: by 10.84.160.200 with SMTP id v8mr15835258plg.55.1510759635464;
	Wed, 15 Nov 2017 07:27:15 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:d04d:dd67:32c6:fbd1?
	([2601:202:4001:9ea0:d04d:dd67:32c6:fbd1])
	by smtp.gmail.com with ESMTPSA id
	r18sm36050056pge.87.2017.11.15.07.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 07:27:15 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1510715185.git.raj.khem@gmail.com>
	<bbb2b97f66c8c7ab5f32ea229d81e1d81e980d3b.1510715185.git.raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a3256d70-fe9e-8dd3-0f46-825f6be0cb76@gmail.com>
Date: Wed, 15 Nov 2017 07:27:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <bbb2b97f66c8c7ab5f32ea229d81e1d81e980d3b.1510715185.git.raj.khem@gmail.com>
Subject: Re: [PATCH 4/8] gdb: Upgrade to 8.0.1
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
X-List-Received-Date: Wed, 15 Nov 2017 15:27:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/14/2017 07:09 PM, Khem Raj wrote:
> Minor bugfix release, details are here
> https://sourceware.org/ml/gdb-announce/2017/msg00004.html
Since these are bug fixes only, its it update backport to Rocko?

- armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gdb/{gdb-8.0.inc => gdb-8.0.1.inc}              | 4 ++--
>  .../gdb/{gdb-cross-canadian_8.0.bb => gdb-cross-canadian_8.0.1.bb}    | 0
>  meta/recipes-devtools/gdb/{gdb-cross_8.0.bb => gdb-cross_8.0.1.bb}    | 0
>  meta/recipes-devtools/gdb/{gdb_8.0.bb => gdb_8.0.1.bb}                | 0
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-8.0.inc => gdb-8.0.1.inc} (88%)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.0.bb => gdb-cross-canadian_8.0.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_8.0.bb => gdb-cross_8.0.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb_8.0.bb => gdb_8.0.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-8.0.inc b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
> similarity index 88%
> rename from meta/recipes-devtools/gdb/gdb-8.0.inc
> rename to meta/recipes-devtools/gdb/gdb-8.0.1.inc
> index fba32ce12c..04a1c809db 100644
> --- a/meta/recipes-devtools/gdb/gdb-8.0.inc
> +++ b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
> @@ -17,6 +17,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
>             file://0010-resolve-restrict-keyword-conflict.patch \
>             file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
>  "
> -SRC_URI[md5sum] = "c3d35cd949084be53b92cc1e03485f88"
> -SRC_URI[sha256sum] = "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"
> +SRC_URI[md5sum] = "48cac527e6f3018b865ece021e9723ac"
> +SRC_URI[sha256sum] = "3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3"
>  
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.0.bb b/meta/recipes-devtools/gdb/gdb-cross_8.0.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_8.0.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_8.0.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb_8.0.bb b/meta/recipes-devtools/gdb/gdb_8.0.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_8.0.bb
> rename to meta/recipes-devtools/gdb/gdb_8.0.1.bb


