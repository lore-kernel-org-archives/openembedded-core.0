Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4FF7ECCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 09:19:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id h19so18673199wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jsk7IEYD4uI+Ux/SfZ8GyvzwrjptNjhm3SMoX9lcDTo=;
	b=aDb2ELlXK2gXnjW/BPQmn7ZcDQ5lPn0T4WrP4q2zSydg8zMG6Q6IhztaWbpJnqlat8
	ExeDixx3oKZC0wDXiD8MfP0atqpBerJKS7iuS8H6FerS1MDg7JCoq8OYqQb9Yo8Y4YI2
	00NPfj0b6/6fFrzcFH+3cz9omrc2DTkycjyhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jsk7IEYD4uI+Ux/SfZ8GyvzwrjptNjhm3SMoX9lcDTo=;
	b=C46Tfod8WJRJG6IYiF0P+tJ8iV6p3bRLD2GW2xSRQIlNv/GNxekfQch+r5R2Fc0Qkt
	rP7cNedJh0211zK4uF6AvLMlBmGgJaxb9AnDIDyX4KdDVPPsUvLupv5UQPSIj2x41UU3
	684DyFq5XFCKltR8M7ddpn330v+LNi8rZoxsv2IAQpqkxn4swD5/TxzGb4veLihOb/JY
	bTfmu0Tf3IPN/mE5yKFPYY3bygHc4SuG8sn1QKz7zRxrkqlItT5tXXz+oN8MgBPAqRK2
	fOLrO2BCKnqO5m8NoXsRS54o1X/UoN+/UJQKlCMiBlFXjztyKc9yp9QUqVewXWrMi/uL
	UjYw==
X-Gm-Message-State: APjAAAU28LWZS64DBcr0I7PmRfEvK5qv4TXZrgBZUTWiQV/JqoMh5I8S
	AEjmqOvzR2AO0PRnAIraqOsVtwAq6jg=
X-Google-Smtp-Source: APXvYqzpFmi+RhfUHUgHx0NAkstubbBD3xt+Y69mt8YUXKttpMQTYsQgn7HqSCVyKsVRT40NIId4EA==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr34261590wmc.175.1563355163881;
	Wed, 17 Jul 2019 02:19:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v5sm24050506wre.50.2019.07.17.02.19.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 02:19:23 -0700 (PDT)
Message-ID: <09978b11aded8890d37f2a64f7833f7a028e2577.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ulrich =?ISO-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 10:19:21 +0100
In-Reply-To: <20190716135444.12057-1-u.oelmann@pengutronix.de>
References: <20190716135444.12057-1-u.oelmann@pengutronix.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: =?ISO-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>
Subject: Re: [PATCH] squashfs-tools: upgrade to commit f95864afe883
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
X-List-Received-Date: Wed, 17 Jul 2019 09:19:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-07-16 at 15:54 +0200, Ulrich Ölmann wrote:  
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> index dc1568a77c9a..cca0524b7ea4 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> @@ -6,12 +6,9 @@ LICENSE = "GPL-2"
>  LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  PV = "4.3+gitr${SRCPV}"
> -SRCREV = "9c1db6d13a51a2e009f0027ef336ce03624eac0d"
> +SRCREV = "f95864afe8833fe3ad782d714b41378e860977b1"
>  SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
> -           file://0001-mksquashfs.c-get-inline-functions-work-with-C99.patch;striplevel=2 \
>             file://squashfs-tools-4.3-sysmacros.patch;striplevel=2 \
> -           file://fix-compat.patch \
> -           file://0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch;striplevel=2 \
>  "
>  UPSTREAM_CHECK_COMMITS = "1"
>  SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
> @@ -24,13 +21,15 @@ COMPATIBLE_HOST_libc-musl = 'null'
>  
>  EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
>  
> -PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr"
> +PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr zstd reproducible"
>  PACKAGECONFIG[gzip] = "GZIP_SUPPORT=1,GZIP_SUPPORT=0,zlib"
>  PACKAGECONFIG[xz] = "XZ_SUPPORT=1,XZ_SUPPORT=0,xz"
>  PACKAGECONFIG[lzo] = "LZO_SUPPORT=1,LZO_SUPPORT=0,lzo"
>  PACKAGECONFIG[lz4] = "LZ4_SUPPORT=1,LZ4_SUPPORT=0,lz4"
>  PACKAGECONFIG[lzma] = "LZMA_XZ_SUPPORT=1,LZMA_XZ_SUPPORT=0,xz"
>  PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
> +PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
> +PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"

This fails in OE-Core since zstd isn't present and you've enabled that
by default:

e.g.:
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/827

(but many other similar failures).

Adding the PACKAGECONFIG[zstd] is good, we just can't enable it by
default.

Cheers,

Richard


