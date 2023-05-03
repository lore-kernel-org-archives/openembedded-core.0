Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE85C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:33:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.17953.1683117216517950248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cPGHFwo3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2CC2CC0012;
	Wed,  3 May 2023 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683117214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbivylAe8b7S5eZaTED67LMrwmS5v7MNqb+8Io4fXG0=;
	b=cPGHFwo3XJlMt3KcOV9PEpdfV8Yp7nPWWPdccKpKlIdt8utSerm3+LgrRp8kK06DR4DjOb
	m6At13K8J6s17vdzfUjMRcb7Cbf+jvWhXuiiZh3+oAVTCubnNOZtOCHKMJx7lGtcwbVoZb
	RuaAvbDMx5FmFkO+9fBOrf6Jie6LCb+JYhzNMoY5Lg3+3oWAR6oAuWuWcxpAt2KqYBuQzC
	TdvChFaeppAYbSriWua+eupAkZZS3dUd/EkB4vrN3HugowZC/rI9/QIUbKf12UVj/kGTqe
	NO2KZDMBU+pbiy6Y3tJvTjXgbyuwUs3nkQTj2/haGez+wCB6ldgzeztOQvqiBw==
Date: Wed, 3 May 2023 14:33:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ernst =?iso-8859-1?Q?Sj=F6strand?= <ernstp@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/6] python3-fixtures: add recipe
Message-ID: <202305031233333684da27@mail.local>
References: <20230502173422.1439794-1-ernstp@gmail.com>
 <20230502173422.1439794-2-ernstp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230502173422.1439794-2-ernstp@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180813

Hello,

without a maintainers entry, this will fail build testing

On 02/05/2023 19:34:18+0200, Ernst Sj�strand wrote:
> Signed-off-by: Ernst Sj�strand <ernstp@gmail.com>
> ---
>  .../python/python3-fixtures_4.0.1.bb          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
> 
> diff --git a/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb b/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
> new file mode 100644
> index 00000000000..f71eec6497e
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Python fixtures for testing / resource management"
> +HOMEPAGE = "https://github.com/testing-cabal/fixtures"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=239e2f4698b85aad5ed39bae5d2ef226"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "d2758826400d095b79666cf93a32a84f50ff8cd179831927efb48cd1e3ca7466"
> +
> +DEPENDS += " \
> +    ${PYTHON_PN}-pbr-native \
> +    "
> +
> +RDEPENDS:${PN} += "\
> +    ${PYTHON_PN}-pbr \
> +    "
> +
> +BBCLASSEXTEND = "nativesdk"
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180757): https://lists.openembedded.org/g/openembedded-core/message/180757
> Mute This Topic: https://lists.openembedded.org/mt/98644245/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

