Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE091C4167E
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.1096.1650383345406863973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q5nlXHLv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 50DDF60007;
	Tue, 19 Apr 2022 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650383343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8GNdRvBSMOEiXo4wgx23pxJ/HUMZQErhq1ywkLWkl8=;
	b=Q5nlXHLvB2rMc+sMEZdo5yvI6V2S97vWFtEuTTSWzNzgfsLQt4zB6i1YltJRG9Y5Vcxcyn
	K4k/kgncFKEn7HqGwYc/3d5SS3SSYQLx7k3lkrVuLI7A6lC2rWvxXjd05+rs/wl5SUjwem
	ts85O89eughvKuNTei7AXIiVIGOokZNDwTU+VV3dbT4njhJd5E40DZ2wbg6163JLuIxTHN
	WXOcHdodIhB5CYenZSKm6SSPJv4d6b373613SFC5S/yENU3qumxni086XFwv2P8eo3MLNt
	38cOwSeFkRsHGjxY2TsHmM6Vzknkb9cvC6DXxraaZ7jqqgkDAJ2sRAXreN1M1g==
Date: Tue, 19 Apr 2022 17:49:00 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] apt: upgrade 2.4.3 -> 2.4.5
Message-ID: <20220419174900.59e1853a@melee>
In-Reply-To: <1650283944-16485-4-git-send-email-wangmy@fujitsu.com>
References: <1650283944-16485-1-git-send-email-wangmy@fujitsu.com>
	<1650283944-16485-4-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164633

Hello wangmy,

Il giorno Mon, 18 Apr 2022 20:12:24 +0800
"wangmy" <wangmy@fujitsu.com> ha scritto:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

This patch does not apply: apt is already at 2.4.4.

Can you please send an updated version to upgrade from 2.4.4 to 2.4.5?

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

