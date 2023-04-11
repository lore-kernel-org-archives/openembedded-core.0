Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2E7C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 14:18:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.15122.1681222686629862283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 07:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YgicZ8mY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6D82640007;
	Tue, 11 Apr 2023 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681222684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jiSWsivTV1fo49TwEM/k0IWYpoRG+JLvE1eFrYl7t8=;
	b=YgicZ8mYOU+9LZPccFRbkLjFsJZPm25XQzZBQtGMqXb5cckbHsQSxcdjLPLx2wlKenYmzj
	QMzIt4bn4ImAZ7O4WYxmmBNxjLE30WoDey/L0iDOE2p6/Wz9vJQf6b5XNHcw4U78JELO0W
	jpnSAxMJrbdkLDBOrTv1hE92BDbnjiVTacGy1re/GK5fT/gxtmYqKtbwZsiBjljMDtNZBE
	/Uy0jjSetHvskOjGZ+5PA2Gwr4UexTMUIu3F1vPfdnxszBNl6+KgxmQ7ZENQazFolXVI1a
	FLcD9fOJi9eCFWXgHnFfwOVqDoLyM6e9qeOV6u5GFKwBwnjU1Og6mvd/eSxDAA==
Date: Tue, 11 Apr 2023 16:18:02 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] squashfs-tools: upgrade 4.5.1 -> 4.6.0
Message-ID: <20230411161802.2ede442b@booty>
In-Reply-To: <1681174888-30847-2-git-send-email-wangmy@fujitsu.com>
References: <1681174888-30847-1-git-send-email-wangmy@fujitsu.com>
	<1681174888-30847-2-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 14:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179922

Hello Wang,

On Tue, 11 Apr 2023 09:01:28 +0800
"wangmy" <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> https://github.com/plougher/squashfs-tools/blob/master/CHANGES
> 
> 0001-install-manpages.sh-do-not-write-original-timestamps.patch
> removed since it's included in 4.6.0
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

Reproducible testing fails with this patch, even though I'm not sure
exactly why in detail:

Log:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2692/steps/12/logs/stdio

Diffoscope output:
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230411-n16xgjqy/packages/diff-html/

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

