Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8324A6023B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 18:27:01 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t3so6990531pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=j8001lmrfF/6bOgAyPpJgX/p91amRNNpUJScBl3aeYw=;
	b=lEjhHFDgcDElRw9KDB/lf4s8bKn/hslR6t0e0YBlC4qsBX+wM2PiM64W7N4pYhBJyc
	k/gyGHNvGwK40Ic5ONKGgf6YZE/Ra6cQSwJ6/9hbXKeg12Nh0B4hkMp8zfHYTcWxDr0K
	031CuCfxN+FZFO8vJaMMpwqNIvUIjQnyQ6P82xOj7KLjhGE/ooedQaX87D8u8k7jP2I+
	R4HuSNA44ZNlAes4zFpKLEQ8ugJSBuawYjdgJuwv1xXwUuZ2HU7O4zxQrT3+iRkv8XSL
	gMda4k3c/+vXIWG3Lsc/3DyVahQ14kOF9Xzo1Xy/YI6eosEbxNRxJ/hTWCOCBWFusBTv
	UgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=j8001lmrfF/6bOgAyPpJgX/p91amRNNpUJScBl3aeYw=;
	b=OSnOJd/C2BzCINRXtdSBeLnKFhVIq0mo6Z65ec0O3A9nRl16yxyqNPe2juqqVb0gYa
	gZboFxwWTCY/R9iksMo0yrM/pt2kM7XbdlF8oxYH5UWis2Jf2yPvCfLq8TcDkDjI2VMF
	WWLFsYQfWML03Mu6Eq+BUYdRHuAMDWv7cqhfQyzcf7jmT+5LljqIwDbYQImM/xon1zOX
	6xBPBvauept/gdFsidnvCDt3bg1UE74P+o8id9meilcNu5dSRZnCXvQe+WOz4tHd0wHp
	WSbMUl9qzKAlLqUTnEc8Bls7cmAEt4+WQwh4njddeBTvN46W4VM7e2gnB0ZcyzP/bdFi
	tldw==
X-Gm-Message-State: ANhLgQ3c3aeyHhuhF4fQpoaM+dctB7YPyRegsFVoc5Y+/SbOk5EYGNKU
	tD2OGcYX3/UlPL4mnv3yq0uhDVIr
X-Google-Smtp-Source: ADFU+vtdgw9M9C3wzjvczmB26tXXUV3YLoDhYPMbD4U7+Vf7l4KLRt6iKLn0DAvghmYTKL2XVmmRgQ==
X-Received: by 2002:a62:5213:: with SMTP id g19mr20584949pfb.28.1584210422279; 
	Sat, 14 Mar 2020 11:27:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f?
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	a71sm24628059pfa.162.2020.03.14.11.27.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 14 Mar 2020 11:27:01 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200314160706.2796013-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <247f037c-10bd-0eac-68d9-09155b51c81f@gmail.com>
Date: Sat, 14 Mar 2020 11:27:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200314160706.2796013-1-raj.khem@gmail.com>
Subject: Re: [PATCH] bison: Update to 3.5.3
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
X-List-Received-Date: Sat, 14 Mar 2020 18:27:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/14/20 9:07 AM, Khem Raj wrote:
> bugfix release [1]
>
> [1] https://lists.gnu.org/archive/html/bison-announce/2020-03/msg00000.html

does this fix the issue you reported on IRC?
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-devtools/bison/{bison_3.5.2.bb => bison_3.5.3.bb} | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>  rename meta/recipes-devtools/bison/{bison_3.5.2.bb => bison_3.5.3.bb} (90%)
>
> diff --git a/meta/recipes-devtools/bison/bison_3.5.2.bb b/meta/recipes-devtools/bison/bison_3.5.3.bb
> similarity index 90%
> rename from meta/recipes-devtools/bison/bison_3.5.2.bb
> rename to meta/recipes-devtools/bison/bison_3.5.3.bb
> index b5b4a8ef76..09e4b18f9e 100644
> --- a/meta/recipes-devtools/bison/bison_3.5.2.bb
> +++ b/meta/recipes-devtools/bison/bison_3.5.3.bb
> @@ -13,13 +13,11 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
>             file://dont-depend-on-help2man.patch.patch \
>             file://add-with-bisonlocaledir.patch \
>  "
> +SRC_URI[sha256sum] = "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd982a7c4"
no md5sum ?

- armin
>  
>  # No point in hardcoding path to m4, just use PATH
>  EXTRA_OECONF += "M4=m4"
>  
> -SRC_URI[md5sum] = "49fc2cf23e31e697d5072835e1662a97"
> -SRC_URI[sha256sum] = "24e273db9eb6da8bbb6f0648284d0724a5cbd6268a163db402f961350a4e50dd"
> -
>  inherit autotools gettext texinfo
>  
>  # The automatic m4 path detection gets confused, so force the right value


