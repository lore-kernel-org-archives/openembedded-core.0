Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53DFC7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 13:38:52 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.8325.1750945129852954582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 06:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUmoS-0004Iu-3i; Thu, 26 Jun 2025 15:38:48 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUmoR-005SN4-2m;
	Thu, 26 Jun 2025 15:38:47 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUmoR-001ahk-2R;
	Thu, 26 Jun 2025 15:38:47 +0200
Date: Thu, 26 Jun 2025 15:38:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Moritz Haase <Moritz.Haase@bmw.de>
Cc: openembedded-core@lists.openembedded.org, quentin.schulz@cherry.de
Subject: Re: [PATCH] json-c: Re-enable '-Werror' now that icecc is not
 supported anymore
Message-ID: <20250626133847.wowomitohbbegyhq@pengutronix.de>
References: <20250626131413.3666480-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626131413.3666480-1-Moritz.Haase@bmw.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 13:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219355

On 25-06-26, Moritz Haase wrote:
> 6481e8b209b ("json-c: fix icecc compilation") disabled '-Werror' unconditionally
> for all compilers. As support for icecc has been removed via ba4fd5229893
> ("classes/recipes-devtools: Drop icecc from OE-Core") recently, we can re-enable
> it.

Fine by me.

> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

