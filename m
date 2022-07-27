Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B90C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:53:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.18308.1658919223728595075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B6wIWlQe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 44FD740011;
	Wed, 27 Jul 2022 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658919221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=serGT4nZWeil7GfEBXhZBcVHi/6M7MkI0GUtiPo0C9U=;
	b=B6wIWlQeSvOydoReo+i7qwvIy1ufXJUrixKpGWezi3Nbynqa4VY9p7ESnbDv64UubHV3lL
	AYaotQ1PbnwtFqhGihI+wHCsc290sRUU7rpk6yUQxq/ve2rJwyFEnQmq9zI7m3WHs2UpDV
	vo8a66SuSY4CoNgpnE3G7WbpIT9ACtahwE2h++yY+qZJIcplnQ/eHcXAF2WW5jKVhjswqz
	YLOQRcEeDi89UTlZkwjBipLohgxKm8IfNHSh2sFTibBTx83wAQtvUFMzjAHQVMi+Aeoly3
	pQvMA3LC5ao8ZcN1s01JBGqhyKFc/R0VzZ5AbLxsq9Sku9tdKSPY2Ei41xUaCA==
Date: Wed, 27 Jul 2022 12:53:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Rusty Howell" <rustyhowell@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
Message-ID: <20220727125339.70e1886c@booty>
In-Reply-To: <20220726211328.2122681-1-rustyhowell@gmail.com>
References: <20220726211328.2122681-1-rustyhowell@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 10:53:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168552

Hello Rusty,

On Tue, 26 Jul 2022 15:13:28 -0600
"Rusty Howell" <rustyhowell@gmail.com> wrote:

> Currently in an image created with debian package management, dpkg is missing the md5sums in
> /var/lib/dpkg/status for files designated as conffiles.  They are just listed as "newconffile",
> which is an intermediate state when dpkg installs a package with an conf file.  Also, when the
> device first boots the script /usr/sbin/run-postinsts does not cause /var/lib/dpkg/status to update
> those hashes either.
> 
> The problem here is that when using a package feed, all the conf files are listed as "newconffile",
> which will indicate to dpkg to replace them all on the first update.  dpkg will not follow the rules for
> confold, confnew, confdef.

This patch does not apply on the current master branch of oe-core.
Maybe you wrote it on an older commit or on a branch (e.g. kirkstone)?

Also we require you so sign-off the patches you send on the mailing
list ('git commit -s' does that automatically).

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

