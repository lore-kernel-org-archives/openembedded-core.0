Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id BD72D6FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 21:59:34 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id y12-v6so5928128plt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VAzScBiWfi0rmS0l+xnlI/KEuTtXaoWkn+A56al5OVY=;
	b=WLrKVet+h0cuK5oVb4pPXePtRteCvKiAL33NWY65DPoPVN77A8hD2uYRPizUS4UyfM
	LRl5lDMt0XZRgoJxvI5bR/QLGeKJIkh+RqIyHvYIG0gLdBo4utv3BLxaPZExlVK0OL3k
	pezYnsITq5LSn1F8c8ZZeqwJTizPwjC2Bd1v84NXVfYLQkIikTVtlwSie1I4zZBq7zHY
	d3glaFkeK2TkQOP6O9Igzt94tP0SNE1Jp959t8NXmByklDt/CJmXCTk6qcLSAmxfidto
	gHt2uvyGLQIbrM+u+HcqURzczfgjoGxL4imY5/yju1GaVAHqed5hAyxM929Zg1pXnzmD
	9amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VAzScBiWfi0rmS0l+xnlI/KEuTtXaoWkn+A56al5OVY=;
	b=AvZzzGsfh8MnFSny6chBFFHZVpFxbCsaPNZSYktIE/XD6nsfib1D4aSbXG22Y/rflL
	fE4z+VaGhsH7+B9r1Ww5clDPL7tvTrrJU+8+KQKOERmWbX87soqNvdIzcfc1bB3omRkb
	f90QrgWx8PXj9Tt+uAkfBrO8/yanR6FN9XqO0sNfB+y5Vvh/bkt2x6tTne9WeKrOPiWh
	nzLcyCjAMBx1XneLz7z2Yw3wkBr5IMI19NaQiVyLRALpq5h+jfYdM+KDeiquRl38ji+I
	sDBS19yKF5i68DTH/61e536ZKOJwfdzbtz1UUaFwIO0hYptl6ARKdF/SDilQ7V8tL44I
	c3vQ==
X-Gm-Message-State: ALQs6tBZJmYd4mblhUVDcC1fSgoOTibDEQ9/BCzqOKYSNnDnf2lKWSNs
	4XyJSWDxY9tMx2A3oYmkFgImgVY7
X-Google-Smtp-Source: AIpwx486UIPXFtLNHC/NefBemiw3pxkdeFMy+wX0n50VkuSsR1QrahOzHTplZuCNJy9JV43AxaOTKw==
X-Received: by 2002:a17:902:579d:: with SMTP id
	l29-v6mr10833611pli.163.1523311175345; 
	Mon, 09 Apr 2018 14:59:35 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:d8c2:1bee:5b5c:2c82?
	([2601:646:8880:466c:d8c2:1bee:5b5c:2c82])
	by smtp.gmail.com with ESMTPSA id
	n27sm1829302pgc.40.2018.04.09.14.59.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 14:59:34 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
	<20180409075141.27481-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <391d78d5-ec72-f717-7b7f-9e4e11db1958@gmail.com>
Date: Mon, 9 Apr 2018 14:59:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180409075141.27481-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] libxcrypt: add -std=gnu99 to BUILD_CPPFLAGS
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
X-List-Received-Date: Mon, 09 Apr 2018 21:59:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/9/18 12:51 AM, Martin Jansa wrote:
> * add it to allow older distributions e.g. Ubuntu 14.04 with gcc 4.8
>   to build this, otherwise it fails with:
>   ../git/gen-des-tables.c: In function 'write_table_u8':
>   ../git/gen-des-tables.c:307:3: error: 'for' loop initial declarations are only allowed in C99 mode
>      for (size_t i = 0; i < m; i++)
>      ^
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> index b1982c1991..a1be4be7ef 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> +++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> @@ -20,7 +20,7 @@ FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowc
>  
>  S = "${WORKDIR}/git"
>  
> -BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
> +BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"

This might change behaviour with gcc5+ e.g. where default is gnu11
in anycase, I think if we could limit this to native version can limit
the impact.

>  TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
>  
>  python () {
> 


