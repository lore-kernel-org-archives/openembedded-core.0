Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26628CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 15:24:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13843.1790868247254488950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 08:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=Jgnz/kmx;
 spf=pass (domain: rootcommit.com, ip: 185.246.84.56, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E15E1A138F
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2026 15:24:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D509B60341;
	Thu,  1 Oct 2026 15:24:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7F1110328295;
	Thu,  1 Oct 2026 17:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1790868244;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=WPTFX2Lib7kG2RTJwbuhPCJT3HMv49YZT8z1RztCMsQ=;
	b=Jgnz/kmxD07NvVEWiufr7z+00kbWhW9C4uAsRMdvsvaqQlHYvPPLalV7Ju85OfyCttqe5Y
	cEwBr03hcgucAe2lh+GznNjxWAddpDp73zKXrRxLg7wAqXEMocJHgRICLojPtF6ZAKUG2H
	TTIa/e9u6m238cxuSqEkRAbEBQZg37uNZ+ItxJq0sztaT/jQWoOmJEbzvb+g4wVrESQBLh
	IhliWaAfsiZrfYE0wahjb8J5jXBLNBN6vOguA2wDVEIfmk5c5ThH+tObYz60SKSkJqdSm7
	9Vi+53cwZihrf8UcnIu11Qp8K9/Q6l5hySzepp1OplYuVxIN3U+ekY/agbarIw==
Message-ID: <8c9472e6-543d-4016-a5c1-91c4880cb902@rootcommit.com>
Date: Thu, 1 Oct 2026 17:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] harfbuzz: upgrade 14.5.0 -> 14.5.1
To: jennifer.chukwu@amarulasolutions.com
References: <20261001135051.3423293-1-jennifer.chukwu@amarulasolutions.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Autocrypt: addr=michael.opdenacker@rootcommit.com; keydata=
 xjMEagLVOhYJKwYBBAHaRw8BAQdApKjypQYDpk7gc2tKU7srAaN/v2wqp3zsRtrICl5tMarN
 Nk1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29t
 PsKQBBMWCgA4FiEEHltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwMFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AACgkQzXRqZ2jNCaAK/QD/fCa/2kPEcJYpt3XjoXUFC40rV5p92/Mn/CcV
 cDDLTNcA/19zgdNIKAqVOaJAcLwhBjCCIZJfAQ80CuPOdGRR5NMGzjgEagLVOhIKKwYBBAGX
 VQEFAQEHQCujvLLf/3B2yAjCRJWU9BUta58RTcZ9ZYYxzsOBj5FmAwEIB8J4BBgWCgAgFiEE
 HltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwwACgkQzXRqZ2jNCaAWEgD/SY55n6h+sq1u
 /Kdbsd4z+uOz2+0Z9V0HtrYLdfgdBTIA/0nuXShti770G4hZDQD52XLANSdPbO7hbwmpNKHm y3UE
In-Reply-To: <20261001135051.3423293-1-jennifer.chukwu@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 15:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247040


On 10/1/26 3:50 PM, Jennifer Chukwu via lists.openembedded.org wrote:
> Overview of changes leading to 14.5.1
> - Map the `fonupa` (Uralic Phonetic Alphabet) BCP 47 variant to the `UPPH`
>    OpenType language system tag.
> - Produce smaller `cmap` subtables and drop no-op variation device tables when
>    subsetting.
> - Fix possible deadlock in `hb_font_destroy()` after `hb_ft_font_set_funcs()`,
>    a regression from 14.5.0.
> - Fix signed integer overflows when scaling glyph extents and applying
>    synthetic slant and emboldening.
> - Fix float-to-int overflow in `VARC` component axis coordinates with
>    malformed fonts.
> - Fix a memory leak in the experimental WebAssembly shaper when shaping with
>    features.
> - Fix accumulator overflows in the experimental raster library when rendering
>    glyphs with very many overlapping edges.
> - Fix heap buffer overflow in the experimental GPU library with malicious
>    `COLR` fonts.
> - Various build and CI fixes.
>
> Signed-off-by: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
> ---
>   .../harfbuzz/{harfbuzz_14.5.0.bb => harfbuzz_14.5.1.bb}         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.5.0.bb => harfbuzz_14.5.1.bb} (96%)
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
> similarity index 96%
> rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
> rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
> index 438aa23133..d10f1bfa01 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
>                       "
>   
>   SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9"
> +SRC_URI[sha256sum] = "7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506886b6d85f7f8d6"
>   
>   inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases

Reviewed-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Thanks Jennifer!
Michael.


