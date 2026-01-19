Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B740DCCF2D1
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 09:05:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31924.1768813554224243187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 01:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xmNMQm7I;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 002121A28B8
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 09:05:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF22460731;
	Mon, 19 Jan 2026 09:05:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A62910B69836;
	Mon, 19 Jan 2026 10:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768813551; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PSFafSwRtY6zHVik5sHHlODu6XgBKz9zCOKwA59fO9w=;
	b=xmNMQm7IOvT+Fi8Nhz/eKDPbaJtxT4ukWNjbaSrsDtGbXUcZDq5ztrO+THFZgNrf3al/5C
	PMc9uX+AqaRkA0YCAVYvz1CV7g/5ioYVzgOg+FnlsE35bWIX2CBqdgxfaEJ9GFfAYWD6Sa
	o5IN/cVAHyIpkdagrLWX2tK6dqaA3KMbpzcpH042wlWsC1HpZMBJO+emjbPoTDXE8sb5w8
	dYNd/KvdSgnDMhn1i/E4cBW614iMhz+EBIa7kT6G1xs3STbztd42hVK3+XofY/T/iv75RH
	hIgjcv5YJtVxlAyCmQbQh3uHNF1m1wq6NfytHUOemJxP/Ucr+XUHKC/cIQtjrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 10:05:49 +0100
Message-Id: <DFSG2N03H80V.31GGEJSS9C774@bootlin.com>
To: <t.f.g.geelen@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V4] qemurunner: Improve qmp module detection.
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260112094737.879408-2-t.f.g.geelen@gmail.com>
 <CAJo0Az4emLrmj3caiG8BDPbT-tvDDvrn3LSsUrg8F+VQbL_zhw@mail.gmail.com>
In-Reply-To: <CAJo0Az4emLrmj3caiG8BDPbT-tvDDvrn3LSsUrg8F+VQbL_zhw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 09:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229600

Hi,

On Sat Jan 17, 2026 at 6:14 PM CET, Tom Geelen via lists.openembedded.org w=
rote:
> Hi,
>
> I haven't received any further feedback and I haven't seen it in
> master-next yet. Is there something I am still missing?

This has passed testing, but due do intermittent issues on our test
infrastructure merging patches has slowed down. Reviews should be on their =
way
soon hopefully.

See https://wiki.yoctoproject.org/wiki/Weekly_Status.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


