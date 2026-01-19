Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B90ED29C33
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 14:42:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36042.1768833761151503875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 06:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FAPKcBs8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F29874E4217D
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 14:42:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA61460731;
	Mon, 19 Jan 2026 14:42:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A16FF10B680F8;
	Mon, 19 Jan 2026 15:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768833758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=//4rvaZukIKai7aEir6r5agHS1d/eGz3XB/vtfdV9Uo=;
	b=FAPKcBs8M+QbcHy5QnV97Fiehfzp98lEcEk4OXUPlKcrTM3XRHfz9Ma59tDfQlOFDPvgb6
	xKinA8qUb/KIQWwh5ONxHzuXgXJr+ZUmUNDI7MbrXPJkVD5jXDEi9+K7XlY2mqJx426+/o
	UhNKMXs33KdsgzwrphuzM4xyfZIsITFwTHGCpKIiR1XQrSKcKKiA2qTFsZqEM6EPCHz2y2
	7MWvfxy4AoXEuFKApCS16VxHJTsQNSQ9nP/K2GPMlQlvqJopiL4z77CBC1QJIdoMCoYaww
	WPACdP/JGCaRkYJVnoNOIejOFqP9dLEz3tptFsNB13K1G5Scz1VJpoSrXtepUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 15:42:37 +0100
Message-Id: <DFSN8I1T09W3.ATICT9K0NWOX@bootlin.com>
Subject: Re: [OE-core] [PATCH] python3: skip flaky test_default_timeout test
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
References: <20260119-skip-python3-test-default-timeout-v1-1-e15fce4cb867@bootlin.com> <2e9127c0edb3ddf367f31776094ca23042687212.camel@linuxfoundation.org>
In-Reply-To: <2e9127c0edb3ddf367f31776094ca23042687212.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 14:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229624

On Mon Jan 19, 2026 at 3:39 PM CET, Richard Purdie wrote:
[...]
> I have the python3.14 upgrade queued in master-next for review so we
> may need to test this with the new python version?

Indeed! I realized this after sending. Will rebase and send a v2, thanks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


