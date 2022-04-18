Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E902C64E95
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.36676.1650267683774633012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 00:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jp+UmWpk;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A751240009;
	Mon, 18 Apr 2022 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650267681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qHIhi4GhWrCFYZYAT2PIf3LGGFDoZcnb+gg8u7YAX4=;
	b=jp+UmWpkWBqazPpudVG9CA9r+YCXftv2+MZN7LJsM/hBHUWMrvU0qnX5UGGJ2OEBzS7yu/
	vz5/8YQdjIYVzVvv0VLD6AhH4j/XHUqetII/mT+ui3c8T125NeFaHnhm4PPyLxKYqZXPYd
	4M+V5921oLreLDm+lWcobVcO5CUsmcUIZEPcN+GrDNS6tNhYZH78E8vabAVu+7OYY0Ef1a
	4zPi/7RdX0smMf2jsNKHfEzJ/xS465ZjEQsFLKnaLTfOXPNYWtxaRDV2C9RaA8RO13bf2Z
	LNGsmf9wpJaV5Ivz0kMeJ63r+4FHxlrIt7GUSzAQ8aIcjRYd11e2NfyMH/4+uQ==
Date: Mon, 18 Apr 2022 09:41:19 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Changhyeok Bae" <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH] ethtool: upgrade 5.16 -> 5.17
Message-ID: <20220418094119.149159c5@melee>
In-Reply-To: <20220416052251.81814-1-changhyeok.bae@gmail.com>
References: <20220416052251.81814-1-changhyeok.bae@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164585

Hi Changhyeok Bae,

Il giorno Sat, 16 Apr 2022 05:22:51 +0000
"Changhyeok Bae" <changhyeok.bae@gmail.com> ha scritto:

> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>

Thanks, bu a similar patch had already been sent on April 6 and it is
already on my master-next branch.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

