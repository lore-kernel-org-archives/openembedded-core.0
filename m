Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C691C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 13:06:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4422.1660395997371971671
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 06:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YEbnEoTB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E0A7340005;
	Sat, 13 Aug 2022 13:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660395995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jhpQrYAAmX/n9Ea3Xx/duhYf7AF7hYN+xDNVOTBCy/0=;
	b=YEbnEoTB08rsBwogSg5Ggv+uEgmidhRY6Cat7n6xmmKk03fLAJHQ3s/+d4wI1U5u60evov
	UdKazqv6NKOs3wsXqo7SRUJTeQ5NLqtJSwExsbFw0EXckIholC9zsdUPPUF1ZH2R05g400
	FNuIIZLpGu2oIdjFRpxXuxIKZHNqZpkOJOla1V8bxAhcRR4dbPyAURjX0ZjjIZwhhRL/IZ
	utsCPOGgXK0kQ4kV8UTg6BX4fm6yCa5mEM427eFcWqAf0lLMLNJKHot5j9D4C8sryK5bmc
	MAOr4S+Rru4q48VtN2FFsfA7DxeWLoI03KQts8hFNEy2nVJmwl0VmWTGtbPwHQ==
Date: Sat, 13 Aug 2022 15:06:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH v2 12/44] util-linux: upgrade 2.38 -> 2.38.1
Message-ID: <Yveh2svRupzwP67Z@mail.local>
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-12-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808064237.3975347-12-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 13:06:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169305

Hello,

could you rebase on master?

On 08/08/2022 08:42:05+0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...{util-linux-libuuid_2.38.bb => util-linux-libuuid_2.38.1.bb} | 0
>  meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
>  .../util-linux/{util-linux_2.38.bb => util-linux_2.38.1.bb}     | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.bb => util-linux-libuuid_2.38.1.bb} (100%)
>  rename meta/recipes-core/util-linux/{util-linux_2.38.bb => util-linux_2.38.1.bb} (100%)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
> similarity index 100%
> rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
> rename to meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index c9bddfb7a6..f1511f02a8 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>             file://avoid_parallel_tests.patch \
>             "
>  
> -SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
> +SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.38.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> similarity index 100%
> rename from meta/recipes-core/util-linux/util-linux_2.38.bb
> rename to meta/recipes-core/util-linux/util-linux_2.38.1.bb
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169036): https://lists.openembedded.org/g/openembedded-core/message/169036
> Mute This Topic: https://lists.openembedded.org/mt/92887007/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

