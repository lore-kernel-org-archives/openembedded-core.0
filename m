Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A753DC3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 13:20:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.13252.1692969612094965288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 06:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZZUr/Nm0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EEF01C0005;
	Fri, 25 Aug 2023 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692969610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsKA8opxMAK6BAjq3qdj0lx/s46SLLR0r16lBEa4okI=;
	b=ZZUr/Nm0lFMteXhuMauLe06CFIwLUXlbNgOUZ27b9NeGv8WyWCocB4zfQb5A9R1pWo1lX+
	hY8eDPcPFnsVtbSVVldoYdml+OjW4n6kIMWrJx14MPG6v7yhfa9W/M71pCdvGLzUUEyqE/
	9Cym4c3ongc27U08vOmUssnrldT10pAeQz26NYPcyKAoKcp9i8AYJE7nEW9igQdf2G0L9R
	HZvtKLSaZUAe7VbIUR7BMaK/4+WQamgyNVYnE50cv3YyVbgHBVPaFhr4nO8HABhaz7SFQy
	Nn7E3EXcWxT4qB+ZKU9eOi1GRnXj2Yte+mGrKXsH3RMgYbwmIjtbI8BHpvY9AQ==
Date: Fri, 25 Aug 2023 15:20:07 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Shinde, Yash via lists.openembedded.org"
 <Yash.Shinde=windriver.com@lists.openembedded.org>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
 Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
 Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
 Shivaprasad.Moodalappa@windriver.com
Subject: Re: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -> 1.71.0
Message-ID: <20230825152007.50079565@booty>
In-Reply-To: <20230824143018.3098875-1-Yash.Shinde@windriver.com>
References: <20230824143018.3098875-1-Yash.Shinde@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 13:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186706

Hello Yash,

On Thu, 24 Aug 2023 07:30:18 -0700
"Shinde, Yash via lists.openembedded.org"
<Yash.Shinde=windriver.com@lists.openembedded.org> wrote:

> Switch libstd-rs to use the dummy `sysroot` crate which represents the
> standard library crates. Target getrandom-open64.patch at 0.2.8 (merged
> for 0.2.9).
> 
> Drop bootstrap_fail.patch as it is merged in upstream rust.
> 
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>

The rust.RustSelfTestSystemEmulated.test_rust test is failing on the
ABs with this patch applied:

https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/408/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/407/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/407/steps/12/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

