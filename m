Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5907C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 13:42:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.52198.1748353337231215652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 06:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uJuZK-0003dQ-Uo; Tue, 27 May 2025 15:42:14 +0200
Message-ID: <8b7f3750-6ac9-4657-85e1-28756afec19f@pengutronix.de>
Date: Tue, 27 May 2025 15:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] [PATCH v4 07/16] kernel-fit-image.bbclass: add a new FIT
 image implementation
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Cc: "yocto@pengutronix.de" <yocto@pengutronix.de>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
 <20250519110838.82978-8-adrian.freihofer@siemens.com>
 <20250519201556.m5cve4ufizexazuy@pengutronix.de>
 <90f23d0316b620b0654efb1fb51755d6c8dfc0e4.camel@siemens.com>
 <01e21e2c-3b4a-426d-8dcc-a956e83c4632@pengutronix.de>
 <b9506b3b3ec1d9a4fb170cf41744827ffa506ad6.camel@siemens.com>
 <adbb5ba6-cb06-4b58-8981-61ce8feb4c91@pengutronix.de>
 <0f8f0477e22505514617ad3a4f0cfcb317fc1993.camel@siemens.com>
 <f1d252fe-53d5-407e-b5cc-da08dd572cef@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <f1d252fe-53d5-407e-b5cc-da08dd572cef@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 13:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217305

On 5/27/25 15:39, Ahmad Fatoum wrote:
> Yes, project I upstreamed this feature for has 102 device trees in
> the FIT currently.

.. but only 69 of them are unique and thus duplicates could be avoided
with this feature.

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


