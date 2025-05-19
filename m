Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE2EC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 19:41:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.3993.1747683696510583114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH6Mg-0000XZ-4C; Mon, 19 May 2025 21:41:34 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH6Mf-000IQW-0t;
	Mon, 19 May 2025 21:41:33 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH6Mf-00Eec1-0Z;
	Mon, 19 May 2025 21:41:33 +0200
Date: Mon, 19 May 2025 21:41:33 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: AdrianF <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, marex@denx.de,
	yocto@pengutronix.de
Subject: Re: [PATCH v4 06/16] kernel-fitimage: refactor order in its
Message-ID: <20250519194133.gbf4wbkeid44b2h6@pengutronix.de>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
 <20250519110838.82978-7-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519110838.82978-7-adrian.freihofer@siemens.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 19:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216876

On 25-05-19, AdrianF wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> When the ITS file is created, the mandatory properties are written first
> before the optional properties are written.
> This is not really useful for the current implementation. But it is a
> preparation for a new Python-based implementation that will expect
> mandatory properties first. This change makes it possible to run the
> tests with both the old and the new implementation.

Why does your python based implementation require the mandatory
properties written first? According the spec, as in [1], the root-node
description starts with an optional property.

[1] https://fitspec.osfw.foundation/#root-node-properties

Regards,
  Marco

