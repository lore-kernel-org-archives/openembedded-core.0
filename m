Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id BD6E061C4E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 18:56:11 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t24so8329777pgj.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 11:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=bUBT1TersOXF9yuEac0lVAYZZQyBGfKgmMFDU0Ixsdo=;
	b=Iy7S3zJWsjKBcA1Fzv896FS19vo3uGqDYsEp0/AdrU0BfvLcVWVjO/8ucgqzmTCYfN
	nx9xR7Yv7TDLHWxmyqcIhsteyIl3KkEo2ueMvZ3hA/AetevFbrA6GjufWbD7HQOGfCau
	CoaFNWt+W+DiZa0Rg593kBhmanjzYSlBjydQhXicS1lx5CkBxWDA4bLVwjmeM0PsRgrR
	wUFHWvEPsKDfpH1zpU9W6NWyh7YdwL3E7SCoaCXUz8xQlcPqjnbHy1HfvXDA+qPasKmJ
	ewuAACkbOGhDoa7swlx4C/kaN98HEnz8WS2ccFDOocKybC7fdwjSAN99jWWCqdegrtMK
	VxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bUBT1TersOXF9yuEac0lVAYZZQyBGfKgmMFDU0Ixsdo=;
	b=KU8t38AhBii6OEalDY3znTvhK7iNNYOjsgbmZ2V1tyw1ynjSRrrj1VMtC866D/4pwF
	KpRMVZLrYAijzpYFEYXAWpgrGAD8qU55rJ9SML5pw07rs2PY5zDnjeFdFATFm0VfQqJY
	lYcRSzMQNU2K7UxQT5NzwmGQdZoHz3yFFpc1r2jk9N9t8AKKY5gUhwzHlz+rSZWXnYHz
	aF9vSlTHXpUaLqlMCZe9xogi0838CH+kWWurz1zGfROnJ04UOcugr/jl3AGsnNMamSCW
	LHDuK/MxIr8+3oLuCrgwaru+16LikDw6zmTvOyLKD/guY7bOxilPT5wfovw34VzLH1Le
	Z4bQ==
X-Gm-Message-State: ANhLgQ0nmg3PRjoX5cEcUVLKEbA0fggIvp8i18D0EKHZ4VGjCp/Pey7o
	ZGmdU2uFG79vXuny/xH/A/+isG6W
X-Google-Smtp-Source: ADFU+vvirabIvy6Df5if0KOXkW8WSfo7KCD5J+tGI0cQtIziUYOkHsseKI2Yg55uMWXHdgMD3DisLQ==
X-Received: by 2002:aa7:94a5:: with SMTP id a5mr25092274pfl.67.1584298572334; 
	Sun, 15 Mar 2020 11:56:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f?
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	136sm62025234pgh.26.2020.03.15.11.56.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 15 Mar 2020 11:56:11 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20200315181308.12792-1-bunk@stusta.de>
	<20200315181308.12792-3-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <51a214de-d173-1dcd-061d-7e127487e364@gmail.com>
Date: Sun, 15 Mar 2020 11:56:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200315181308.12792-3-bunk@stusta.de>
Subject: Re: [warrior][PATCH 3/3] gnupg: upgrade 2.2.16 -> 2.2.17
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
X-List-Received-Date: Sun, 15 Mar 2020 18:56:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/15/20 11:13 AM, Adrian Bunk wrote:
> From: Anuj Mittal <anuj.mittal@intel.com>
>
> Also fixes CVE-2019-13050. Announcement:
>
> https://lists.gnupg.org/pipermail/gnupg-announce/2019q3/000439.html
>
> (From OE-Core rev: c6e46323f0d62daf8bd424e642581fdcba920ef7)
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

are these bug fix only updates?


> ---
>  .../gnupg/{gnupg_2.2.16.bb => gnupg_2.2.17.bb}               | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/gnupg/{gnupg_2.2.16.bb => gnupg_2.2.17.bb} (92%)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.2.16.bb b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
> similarity index 92%
> rename from meta/recipes-support/gnupg/gnupg_2.2.16.bb
> rename to meta/recipes-support/gnupg/gnupg_2.2.17.bb
> index cb7c6c5c62..e5456dd9b9 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.2.16.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
> @@ -19,9 +19,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>  SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
>                                  file://relocate.patch"
>  
> -
> -SRC_URI[md5sum] = "d90e186df1c06845880ea58a318f070b"
> -SRC_URI[sha256sum] = "6cbe8d454bf5dc204621eed3016d721b66298fa95363395bb8eeceb1d2fd14cb"
> +SRC_URI[md5sum] = "1ba2d9b70c377f8e967742064c27a19c"
> +SRC_URI[sha256sum] = "afa262868e39b651a2db4c071fba90415154243e83a830ca00516f9a807fd514"
>  
>  EXTRA_OECONF = "--disable-ldap \
>  		--disable-ccid-driver \


