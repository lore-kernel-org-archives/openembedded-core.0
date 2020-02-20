Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9814960B1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:26:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n3so1386088wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=z/dcd49tnwFr182RsPxZM9X4K5LFUL5QMYfrLhsLep4=;
	b=A5e2/rNDEVDSEGqOWaBT5ahecmT/QlR6WY2nPxuaSfYU3VgO0wYg3XMOMkUh3RJrZC
	sfxahy2ojUWjphpDE3CnF1j2W9n7yutx9vbaeo6vxrvfg36Ow+seNfaTh64i12f2thNw
	5AJwlSvEFQXdnWtTB98KkhmqNV2ZbxsYtBA2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=z/dcd49tnwFr182RsPxZM9X4K5LFUL5QMYfrLhsLep4=;
	b=ZTFmX+Bp8Vi/H1xqSI1CGicOBWvYUbvLheV8jDneh1SfDUR5T93Ja3cyVuISGjvMIS
	ofYBBEYhdgIfFlGVokRkqagCw8C6izwnRj4XwU1ytxKtt4E3GUlKSzYtuKCIdi+3alwc
	ZwQc7Yq6Q2U9X9gq+jH/L/UuH+mG3Tv/XG7nUUCXbbduVpHPgLCFRjO22CmdJXKz/SNN
	pja+uNBVA/Q+JK+mIb1RKjoGZahrQqyHopgr3zaRVgKGY8V3KUXvVNqo2YLqQU4wvSeH
	1d8dZRQxQPjBY2aeILRdB4ODflbJSsnz7QECZPYFXt3vidKStkMRlUBtdmf/iDjj84/o
	nocQ==
X-Gm-Message-State: APjAAAU+NKnd4rIZ0p/dbIjhGImfddPTtoRvS2zydHcVx7A8nzeIalyX
	nCobV2bnHmfbXK7LmDzzwWHHtm95/Ok=
X-Google-Smtp-Source: APXvYqzvyNhG5kGqD0CdL6VXsyfISL+2hj2GM2ljEcR7IBu1YlcmRyqlyICJWZEKLNRAjiWlhd1ifA==
X-Received: by 2002:a1c:9ad6:: with SMTP id c205mr3582415wme.78.1582194377099; 
	Thu, 20 Feb 2020 02:26:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a135sm3469718wme.47.2020.02.20.02.26.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 02:26:16 -0800 (PST)
Message-ID: <62847ad6d3204b5080b2c71f7d6e9f56436e3d02.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 10:26:15 +0000
In-Reply-To: <20200219194752.7967-11-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
	<20200219194752.7967-11-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 11/13] p11-kit: upgrade 0.23.18.1 -> 0.23.20
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
X-List-Received-Date: Thu, 20 Feb 2020 10:26:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 20:47 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../p11-kit/{p11-kit_0.23.18.1.bb => p11-kit_0.23.20.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/p11-kit/{p11-kit_0.23.18.1.bb => p11-kit_0.23.20.bb} (93%)
> 
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
> similarity index 93%
> rename from meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
> rename to meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
> index 19895ec269..26833ef431 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
> @@ -9,7 +9,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
>  DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
>  
>  SRC_URI = "git://github.com/p11-glue/p11-kit"
> -SRCREV = "b0ebe7555c291808db29377ba79cb8326301f0a6"
> +SRCREV = "762cdaa2cd5c5ec09cc844f9a6bdc551c7f6c8ed"
>  S = "${WORKDIR}/git"
>  
>  PACKAGECONFIG ??= ""

This version adds bash-completion which is triggering in some builds
and isn't deterministic.

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/291

Cheers,

Richard


