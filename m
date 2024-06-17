Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B96DC2BA18
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 09:58:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.53136.1718618300903944379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 02:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ItcUdssG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11B7724000F;
	Mon, 17 Jun 2024 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718618298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbgusiKz3QqdrLrmVksKT3yjrpm+y7u4WIKSbbbQS0M=;
	b=ItcUdssGaq4O8K8QxFH3mj5RCwm0IgBcIBRfrMJSc9Alrr20MaRIu6qmc/WF5e4IZKhXij
	8fO89g6pOquAPdEH/tLNIpeufE05qt/ioiprtRSalmLoIPmhgBsTd6i3duzPZ1R0U/99Do
	nDy15OAXAseKM3H9iW5hV0+qSL6eOdq304aoY/cVoUtBBx0TDiuY3dJ2R3pLb2v/qJubtt
	gjQN+1ervuQazvBT5wp9Km8CR2KrjlJhdVXCvEYcAxY4u1rz8VlsmB2Yq9pz+FwQt9STQ+
	eryuQxbZ+ZcqpbXPSmAmVXTCue2b9lgo7xOZ6r/22x0V1T7B5li9hOaFjZXWcg==
Date: Mon, 17 Jun 2024 11:58:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yanfei Xu <yanfei.xu@windriver.com>
Subject: Re: [OE-core] [PATCH] classes/kernel: No symlink in postinst without
 KERNEL_IMAGETYPE_SYMLINK
Message-ID: <20240617095817d05a861e@mail.local>
References: <17D75E0D9904A57D.7758@lists.openembedded.org>
 <63nblahrbyridvk7hiooyfbe4al4j45ai7hoxyea2ia44tbuui@3il2zqqhqeh6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63nblahrbyridvk7hiooyfbe4al4j45ai7hoxyea2ia44tbuui@3il2zqqhqeh6>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 09:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200802

On 17/06/2024 08:48:16+0200, Jörg Sommer via lists.openembedded.org wrote:
> Jörg Sommer via lists.openembedded.org schrieb am So 09. Jun, 16:59 (GMT):
> > From: Jörg Sommer <joerg.sommer@navimatix.de>
> > 
> > The commit “Use a copy of image for kernel*.rpm if fs doesn't support
> > symlinks” [1] added postinst and postrm scripts to the kernel package which
> > create a symlink after package installation. This should not happen if
> > `KERNEL_IMAGETYPE_SYMLINK` is not `1`.
> > 
> > Background: The u-boot implementation of jffs2 does not support symlinks.
> > Using a hardlink or removing `${KERNEL_VERSION}` from the file name fails,
> > because the current postinst script replaces the file with the symlink.
> 
> Gently ping.

Testing is ongoing

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200795): https://lists.openembedded.org/g/openembedded-core/message/200795
> Mute This Topic: https://lists.openembedded.org/mt/106576203/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

