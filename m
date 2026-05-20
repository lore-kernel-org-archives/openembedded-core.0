Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1131CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 13:14:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11906.1779282889065299452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 06:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZhqgJw0l;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EA1314E42C90
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 13:14:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC33A60019;
	Wed, 20 May 2026 13:14:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81783107EA152;
	Wed, 20 May 2026 15:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779282886; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hxSBiCYQoaNZZRloSifk+VOasvgWRFIiU4dTpWsgdOw=;
	b=ZhqgJw0lnuEALTP7R4Suj74CHK0OAdc0UBXAtg6i0Y241g26EqCE5fS+4rPoJPngBgEvmZ
	iP1xerCfU12iopXx1b0jRmk8KMlzgxoGCif/drw9ORL7VPFWAS8jsDLzxRpUq36La4F/w2
	JyP11iV/u/QtgEiMpPD3MCsd9ZTQdSaSdbt0XLqyAjQMel6dCH30zUJBHplXCUnIwfOIf7
	bg9enlCJIxGkOiSe5+2Wf/kDE15bVnvngbcwMOiAfcdELuuF9isMAugCPBCGHHAebiykjZ
	3bSkpsG6e53mbWPl4/3ykuzRyfAslrNtOAXZNnOiC82TJJ5frg+samI1sp86Sw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 15:14:42 +0200
Message-Id: <DINJ544USQ5A.288HMM4BSCZ78@bootlin.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <Quan.Sun@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20260518180128.3661681-1-Quan.Sun@windriver.com>
In-Reply-To: <20260518180128.3661681-1-Quan.Sun@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 13:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237451

Hi,

This update causes quite a few build failures on our test infra as you can =
see here:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3845

Most jobs in red here are failures with building either qemu-system-native,
qemu-native or nativesdk-qemu, in different contexts. Can you have a look a=
t
those issues?

Thankj,
Antonin

