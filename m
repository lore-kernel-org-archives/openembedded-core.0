Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF880C7112E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.18785.1650528830921045377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 01:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ShnGaE6W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A7CDFE0013;
	Thu, 21 Apr 2022 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650528829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXcGsXvL7mywlaLB+p/Vu+O6ZnmbhKNRTGashts7dfs=;
	b=ShnGaE6WNT15dW3g5bRtxUJ+620mS3xeG+zIAMVAKQV0CfOy2Qru1F6KRw4BpquSjn1zKG
	5lLETlyePDTVavluxQcaOMQ7zPNfH6TjGjXV8I8+ppMHIu4tUq3QzcIRvhrSqMo/l09x9I
	HtfIJyF+LVv8Xt0TWgAoRs+NGHdZYJefETu5T20w8s5zrlgOfKrvPCUkTWb2JEpS1JJUi3
	BdzvjUfqE2fJosrHUEeNg1u7azCxjMrNbsyBYh8UxsGRngXNHfctAiUlUfv9T9FLVkA0rz
	fk7MVKELZTTMx4KXZbadqwR3av66X6XaFDKzLqZvcK/AEx0bb+PxWY3D7Ez8dw==
Date: Thu, 21 Apr 2022 10:13:46 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>, Wang Mingyu
 <wangmy@fujitsu.com>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.02 -> 3.03
Message-ID: <20220421101346.3b7774ea@melee>
In-Reply-To: <1650524435-13155-1-git-send-email-zhengrq.fnst@fujitsu.com>
References: <1650524435-13155-1-git-send-email-zhengrq.fnst@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164745

Hi zhengruoqin,

Il giorno Thu, 21 Apr 2022 15:00:35 +0800
"zhengruoqin" <zhengrq.fnst@fujitsu.com> ha scritto:

> 0001-Fixed-compile-error-on-GNU-Hurd.patch
> removed since it's included in 3.03.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>

Thank you for sending an update version of your patch, but I'm afraid
it does not apply, and this is for a weird reason, see below.

> diff --git
> a/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
> b/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
> deleted file mode 100644 index d278a32ec7..0000000000 ---
> a/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
> +++ /dev/null @@ -1,28 +0,0 @@
> -From d595594506e6fd2247f7984c276f822ea626434c Mon Sep 17 00:00:00
> -From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>

The patch currently in the repo has a different name here:

From: Wang Mingyu <wangmy@fujitsu.com>

> -Date: Thu, 7 Apr 2022 11:57:19 +0900
> -Subject: [PATCH] Fixed compile error on GNU Hurd
> -
> -Fixed compile error on GNU Hurd due to missing MAX_PATH definition.
> -
> -Upstream-Status: Backport
> [https://github.com/slicer69/sysvinit/commit/14d8d25269016b26965b428a855dd084cc88994d]
> - -Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>

Same here.

Did you apply any mangling to the patch before sending? Please resend
without any mangling and I'll be glad to take your patch for testing.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

