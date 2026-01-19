Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD762CCF2CE
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:57:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31852.1768813076389944818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Jk/kTFEt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B09F1C2033E
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:57:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6C7D60731;
	Mon, 19 Jan 2026 08:57:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13B0810B697BB;
	Mon, 19 Jan 2026 09:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768813074; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=teWoIQH/fynT1DwvLcW9tzQPi4E36qfPQqPajI9sqkg=;
	b=Jk/kTFEtQAwWE7gYdmBbMWZXHRAKLAg59yd+D5jktG+JLcX+6eumt9PbulsZ/9nQTGDZUC
	Su2sO3uIV9HB86j/cFBfifTbCbyXu5CSR/DGl87QMUYJ8f8jvorveaP2F5hVWtjlLk6Slm
	ryNRYVL5TnpAQ2HJEwPhIH+Lt+VtjnQQkMBQbkPdLIYJrowR/gao4hgnHzLTx4NVG3oenZ
	GS7po1yhzFReoMzl0moIMYfqNMs9YbkJ8wvduCnfL5zSD6Wmu8oasmekMJQO7QikYOJ4aR
	iEHvH8cFL4dKWuGeVxEkmdQeJC3ZiRbv4LQB0zkqJQxjA5917SW50jPEdGzuRw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 09:57:52 +0100
Message-Id: <DFSFWJT4VBSI.2VPGJA1CNDDNX@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3-urllib3: upgrade 2.6.2 -> 2.6.3
References: <20260116222501.269631-1-peter.marko@siemens.com>
In-Reply-To: <20260116222501.269631-1-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229598

Hi,

This update was already sent on the list:
https://lore.kernel.org/r/20260113102509.728-14-wangmy@fujitsu.com

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


