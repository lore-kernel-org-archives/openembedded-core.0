Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3A9778994
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 17:25:57 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id j81-v6so2828175ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 10:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nad/IwgjkmDtpMGuP7BsKFufVDgsN11ej6U/R9iH+4s=;
	b=Yiw83NLxkBI4b5wHBAcrEASSVN13k6ydfK2ks2SvdOfZ0WGbMf5um5I/Vitp3Xrl4J
	Daq1Od7AtxezD6ts/JWWy1dSIWk4E2euBYm0iq2JCemBli2ULEOreIBUC5bHOlbDWFhY
	nAQPdLKn7jy6OkiKVpu+Ztf3MfCYuT1l72J8OTwJdfmBHhuqIAjQWjTOOfsHe/uCxKvp
	IIjoWe1Uh4N5DQBI46wUh/tb+xDaA+0YcR0qO2oUZWKPiAIzJNUHTQLFTVYTy20JY6l7
	1RkyeoQjtd8vTotZ7GOofz+mPatQ61pgUZ1yT+h0DqePCxzy7OypPq43cXWg1BzS9aYH
	OoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nad/IwgjkmDtpMGuP7BsKFufVDgsN11ej6U/R9iH+4s=;
	b=m7U8d4f8fM1VZqoGlN3Y3UgJN4+iIiQuGQnj5Npldhv8RMecQqLW+MNTmU2hevykax
	FNDd23jKvn9rKdOtLBXuu1dBNKFDGRR3/xj/3jfiEtWF44VCL7djaHklqzqiGmq3Fk2f
	xA/LcRKgLgOglMs/wF/mntqlzy4RZqwUFGQzMo3/v2ao1eNtL7yzDHU5wH5KRmnbLLDG
	DLlEw/+39VLU1smvsR4RPiN+uITRqHHv9j2Q+sYHqgjlNcycEyWxGbEY4ej2UO0lNC69
	hq2A3bqywTL8sDf++4sLxbSvTzD95WCE79HnO0XqZX5J7NE3rD529UP2HIEBJ3XOSFVF
	oBSQ==
X-Gm-Message-State: AOUpUlEZ8i0IXfYz55WGTOpyKUDOkDUiQd6ewiwL/L7bfWwIVJxKtf4e
	spcuKuim01SdGurgtHBsq5Bz9oKq
X-Google-Smtp-Source: AAOMgpe82EtLX9h0iDzNrHO62gLPs5dpaNtHHJM+u0N/t7N/euSxv/zfXpwd5a0QnwHg2wdPJOGiQA==
X-Received: by 2002:a24:4207:: with SMTP id i7-v6mr3402203itb.24.1533230758466;
	Thu, 02 Aug 2018 10:25:58 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g198-v6sm1009937itg.4.2018.08.02.10.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Aug 2018 10:25:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <f6ed4f2afd6d43944565fcffa8bc90625770ea50.camel@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 02 Aug 2018 12:25:57 -0500
In-Reply-To: <20180731171913.5202-1-JPEWhacker@gmail.com>
References: <20180719163102.15234-1-JPEWhacker@gmail.com>
	<20180731171913.5202-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v2] u-boot: Fix pylibfdt generation
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
X-List-Received-Date: Thu, 02 Aug 2018 17:25:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-07-31 at 12:19 -0500, Joshua Watt wrote:
> u-boot attempts to build a Python library called pylibfdt. By
> default,
> u-boot would attempt to use the build host's Python interpreter,
> which
> causes numerous problems, not least of which is that it fails if the
> host doesn't have the Python development package installed
> (complaining
> about not being able to find Python.h)
> 
> Rectify this situation by including the proper build time
> dependencies
> for pylibfdt and passing the proper arguments to make.
> 
> [YOCTO #12867]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-
> boot/u-boot.inc
> index c2bcf998402..95c2f4db14d 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -7,8 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit uboot-config uboot-extlinux-config uboot-sign deploy
>  
> +DEPENDS += "swig-native python-native"
> +
>  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX}
> CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
>  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}"'
> +EXTRA_OEMAKE += 'PYTHON=nativepython
> STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
> STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
>  
>  PACKAGECONFIG ??= "openssl"
>  # u-boot will compile its own tools during the build, with specific

This was applied to master as 581a2cb7f8dfc88af785d55ef5ce40b0939c465b.

Armin, could you please backport to sumo?

Thanks,
-- 
Joshua Watt <JPEWhacker@gmail.com>

