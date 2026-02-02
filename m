Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B57D73E86
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 07:00:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47219.1770015629389772500
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 23:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cYt0N/3O;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3488C4E423BD;
	Mon,  2 Feb 2026 07:00:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0660660767;
	Mon,  2 Feb 2026 07:00:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71283119A8891;
	Mon,  2 Feb 2026 08:00:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770015626; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ufKM4bRRVwzBWB+9drJajAUL5dvj1oCt5Q85dlH6qc4=;
	b=cYt0N/3OWaJ4ULS4Y8XqpubBGyzaKs+J2ddiCTCQnoTQKVA4O3SMP6zePY8BnJRYhYDbjE
	9wKwV3RMU95dx/0MKakOKfZzGIOq2qaye7GMPRXQUcgeEeiuF+veIJT6gR4rtrTFAvu1QH
	oSGSu+ThcbJXPN7wIZeB9HrFHn/TFqQZweXkTn0ZDmtjiuQewVj6C30kDklHPHwIfWvsvL
	ty/dewiB4fXu5GkQ0ACQxPPXutD0Aj0yTZ5k9h50j/rFeaovohkFhOAzC4VTV2Mno/eZPj
	nTG/R4Zabn0yrAhIo9v/XH68IEAW9Q0cckHueglfFLTAJP1sn/s3ZOf+h4vQSA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 08:00:23 +0100
Message-Id: <DG4A686102IW.3P6JU6225B6AV@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/6 v2] python3-appdirs: Add new recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260202013640.14467-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260202013640.14467-1-liuyd.fnst@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 07:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230347

On Mon Feb 2, 2026 at 2:36 AM CET, Yiding Liu (Fujitsu) via lists.openembed=
ded.org wrote:
> Move it from meta-openembedded to openembedded-core as it is required by =
hotdoc 0.17.4.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---

Hi Liu,

Thanks for your patch.

Please remember to also update meta/conf/distro/include/maintainers.inc

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


