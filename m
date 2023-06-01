Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76406C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 11:00:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.28267.1685617258470118626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 04:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FQkDhfSH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685617256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DuIVUYlURy6CuNdmuVYIf64ziUm7HV3jjnAquf+wT8=;
	b=FQkDhfSHukBlosxrcyIg2GJ+HRntDYMfYqAp13Ph+LZdcL4yLnYkGZWH/7xic5JVUPcMm2
	r3MfpG4tn210+Sj/g9XI9LnJ1GwyFtJOBxrO53MdSckFBj1xCv8duxx7la/JH9G+jyZRsK
	CD4eU49dLYmVazsIMNvUojHty4rjFK5Se8NYi0vukwlbEZZgRqy8hyStYwq5NNQHKbAJLM
	ouu5wYcAeigiJiw8MoF8dUL7effo84H5fRm5ARmUZ6CzF7UbCNBuVQUEJdfmGFZN5m3FEq
	YLH4Xr3SS83lXkmoeckhA89YDUjmPFLQVCzTogYkBHyG4GTOwYK1YDIeegYGHg==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E7A160002;
	Thu,  1 Jun 2023 11:00:56 +0000 (UTC)
Date: Thu, 1 Jun 2023 13:00:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] python3-meson-python: New recipe
Message-ID: <202306011100565b118a99@mail.local>
References: <20230601080821.2346868-1-zboszor@gmail.com>
 <20230601080821.2346868-2-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230601080821.2346868-2-zboszor@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 11:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182099

Hello,

This fails on the autobuilders:

stdio: WARNING: Nothing PROVIDES 'python3-pyproject-metadata-native' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb, virtual:native:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb, /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb DEPENDS on or otherwise requires it). Close matches:
stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pyproject-metadata' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-meson-python' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-meson-python-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'python3-pyproject-metadata-native' (but virtual:native:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'python3-pyproject-metadata' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'python3-meson-python' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'python3-meson-python-dev' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)

On 01/06/2023 10:08:21+0200, Zoltan Boszormenyi wrote:
> This python module adds support for a new PEP517 build backend
> used by recent versions of scikit-image, scipy and others.
> 
> The previously added python_mesonpy.bbclass uses it
> 
> Signed-off-by: Zolt�n B�sz�rm�nyi <zboszor@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../python/python3-meson-python_0.13.1.bb     | 22 +++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 8c4c586414..f2448ee3c9 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -647,6 +647,7 @@ RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> +RECIPE_MAINTAINER:pn-python3-meson-python = "Zolt�n B�sz�rm�nyi <zboszor@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> diff --git a/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
> new file mode 100644
> index 0000000000..828a1652fa
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Meson Python build backend (PEP 517)"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
> +
> +DEPENDS = " \
> +	meson-native ninja-native patchelf-native \
> +	python3-pyproject-metadata-native \
> +"
> +
> +PYPI_PACKAGE = "meson_python"
> +
> +inherit pypi python_mesonpy
> +SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
> +
> +DEPENDS:remove:class-native = "python3-meson-python-native"
> +
> +RDEPENDS:${PN} = " \
> +	meson ninja patchelf \
> +	python3-pyproject-metadata \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.40.1
> 

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182054): https://lists.openembedded.org/g/openembedded-core/message/182054
> Mute This Topic: https://lists.openembedded.org/mt/99259620/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

