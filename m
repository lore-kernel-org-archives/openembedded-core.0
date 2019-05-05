Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 73A7B6C45E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 21:47:07 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id e6so5448719pgc.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 May 2019 14:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=hKgahn/n13EP+ldzTJX9Ax1DdxESZ6QkuU8vBjrz4KI=;
	b=EPTGOoobDJekJ14CfB2jOh9A1aa7rLrReCVDkrhjqtNEB+dd1Y8yaoBntQOEQlTvHX
	bhQIn148ggK60vh0o4g9KfqG1+6Wod3toraKVNbHmoOYUgMetghOD+ES2TNEUK+FEPs1
	pPb7TflV6/u0fSkayardO5F3Mlzfpv8LpqxM9E2SGfhB8olrJ/PzdtaNXFlUwKpDhVKS
	N3yrlQsjf0nz7lvM6F6QDNd7YPQhIMU2dYc4kML/TYsUzifl8zyhY3h4f7iZgMAZ8X9i
	oojaefF8r1BIAC28lCUz0i3CMMTngYrSzmKftxnBUB7m+XozFC/XBMO7v+w8P8prMka4
	+t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=hKgahn/n13EP+ldzTJX9Ax1DdxESZ6QkuU8vBjrz4KI=;
	b=gmKXxm735Yi9VwIQHvgtc4UwYETN5DbHEOZ8aJ9G/S8tbk/qUBgmhgo2LdWtgotqfy
	V+OSf8DZEfu2IhB2WR/M6jpKyotJSLWKu9RbkyV1Qp2R/4N/3Q9kYrZZmtksrhsXBMYW
	hnCwfoanK6GTxkgrFrPzGm7xuBFZPf4vQUnT5MsvgOyVIkrf85SA3aNouLiNP1Ojsomp
	Vs12cSGPrfMj4hcgS9m9GFsbwn1VSyy2ZvrixHnDifbLZ3w7hWe5vO/bGXzC1iFGppg/
	td+x9+sPUyGEk2aM90V1f4/tVE3tKomHzJE0FjFCNw2myG6JrPmicZH90QvC6f4SP5W9
	EkNA==
X-Gm-Message-State: APjAAAVYP8EmtsTehIqJAqmfknlZsTQ1EE7ffDQVLrHrX+RncKTF5IZE
	thPLsdwYbns/O/CYWq1gCb3J1s2g
X-Google-Smtp-Source: APXvYqxvqjJfa1sxprE0ncMEwH/9G5CNqBr9NGsa9Fn1mTNBwnY7BZPJVRnqEccRIrRlnMx4a/Ihxw==
X-Received: by 2002:aa7:8652:: with SMTP id a18mr27978543pfo.167.1557092828050;
	Sun, 05 May 2019 14:47:08 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:f540:e8d2:3651:aece?
	([2601:202:4180:c33:f540:e8d2:3651:aece])
	by smtp.gmail.com with ESMTPSA id
	g1sm11208803pge.50.2019.05.05.14.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 May 2019 14:47:07 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190505192424.26245-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <77226c8e-5539-869b-e5b8-2d90bb0df4ab@gmail.com>
Date: Sun, 5 May 2019 14:47:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505192424.26245-1-bunk@stusta.de>
Subject: Re: [warrior][PATCH] nettle: fix the Segmentation fault
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
X-List-Received-Date: Sun, 05 May 2019 21:47:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/5/19 12:24 PM, Adrian Bunk wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> The commit[8ac8fa8ee1 nettle: update to 3.4.1]
> add CFLAGS_append = " -std=c99" to silence the
> below error for native build:
> | ../nettle-3.4.1/rsa-sign-tr.c: In function 'sec_equal':
> | ../nettle-3.4.1/rsa-sign-tr.c:243:3: error: 'for' loop initial declarations are only allowed in C99 mode
>    for (size_t i = 0; i < limbs; i++)
>    ^
> | ../nettle-3.4.1/rsa-sign-tr.c:243:3: note: use option -std=c99 or -std=gnu99 to compile your code
> | Makefile:263: recipe for target 'rsa-sign-tr.o' failed

got it in stable/warrior-nmut

thanks,
Armin
>
> But the above change will trigger below Segmentation
> fault:
>  # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
>  [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
>  [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
>  Segmentation fault
>
> So update the logic to CFLAGS_append = " -std=gnu99"
> to fix the issue.
>
> (From OE-Core rev: 91359a91b8c89dc5e1f3a946137204156c47a3af)
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-support/nettle/nettle_3.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
> index dd49c30c84..8375fcf2df 100644
> --- a/meta/recipes-support/nettle/nettle_3.4.1.bb
> +++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
> @@ -30,7 +30,7 @@ inherit autotools ptest multilib_header
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>  
>  EXTRA_OECONF = "--disable-openssl"
> -CFLAGS_append = " -std=c99"
> +CFLAGS_append = " -std=gnu99"
>  
>  do_compile_ptest() {
>          oe_runmake buildtest


