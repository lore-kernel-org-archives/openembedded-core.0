Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C98C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 17:21:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1414.1685726509386120818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 10:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iIq/q3H3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685726506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWh2dgQo049kqCnsrkEkBS/4GaXI8jqum/0SLnGk0f0=;
	b=iIq/q3H3M+aJWsYmHrxep+v+oYoJeyfM65kxAoR0fOVRU6EKCbFcQvbMC/CEURUNGxvV+4
	uICVXFPbTB3AvcRIYCi33M9YGzgzMdCHpRGTdkBsqjtFCa/ocDOic3x7xexHcmBCMyhBFE
	wnY/x0+4B1+KYYfNssAjD0t4Kw8XzSU3k6qysqnnryE7P3Ps+7uQ2QBrUclccAlw7xcW9P
	JkL2DEvhhkJHq6Q3gZg5AfzE1Tepg+Nua4sfG8VhEEuqQd1J/Q+L6jkp2OKGAcJJ38jSKj
	cZgdzwvF38DKf/DN6Hy7+GzGrHlp0hS1tqYo6IsP4TcT6x0y8Uh7K4Z+WtlCmg==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56789E0005;
	Fri,  2 Jun 2023 17:21:46 +0000 (UTC)
Date: Fri, 2 Jun 2023 19:21:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] python3-pyproject-metadata: New recipe
Message-ID: <20230602172146f5408a36@mail.local>
References: <20230602074419.2450399-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230602074419.2450399-1-zboszor@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 17:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182337

Hello,

the series causes the following warnings:

stdio: WARNING: python3-pyproject-metadata-native-0.7.1-r0 do_fetch: QA Issue: Recipe python3-pyproject-metadata in /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
stdio: WARNING: python3-pyproject-metadata-0.7.1-r0 do_fetch: QA Issue: Recipe python3-pyproject-metadata in /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
stdio: WARNING: python3-meson-python-0.13.1-r0 do_fetch: QA Issue: Recipe python3-meson-python in /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
stdio: WARNING: python3-meson-python-native-0.13.1-r0 do_fetch: QA Issue: Recipe python3-meson-python in /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]

On 02/06/2023 09:44:17+0200, Zoltan Boszormenyi wrote:
> It is a dependency for python3-meson-python.
> 
> Signed-off-by: Zolt�n B�sz�rm�nyi <zboszor@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc         |  1 +
>  .../python/python3-pyproject-metadata_0.7.1.bb   | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 5accca3fef..d910ce6481 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -670,6 +670,7 @@ RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>
>  RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
> +RECIPE_MAINTAINER:pn-python3-pyproject-metadata = "Zolt�n B�sz�rm�nyi <zboszor@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pysocks = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pytest-runner = "Tim Orling <tim.orling@konsulko.com>"
> diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
> new file mode 100644
> index 0000000000..9887af78d0
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "PEP 621 metadata parsing"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
> +
> +PYPI_PACKAGE = "pyproject-metadata"
> +
> +inherit pypi python_setuptools_build_meta
> +SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +RDEPENDS:${PN} += " \
> +    python3-logging \
> +    python3-packaging \
> +    python3-profile \
> +"
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182146): https://lists.openembedded.org/g/openembedded-core/message/182146
> Mute This Topic: https://lists.openembedded.org/mt/99281729/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

