Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB44DCA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 06:09:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.32747.1756966193704947214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 23:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RbFInPVE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DC0B91A0DAC;
	Thu,  4 Sep 2025 06:09:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1316606C4;
	Thu,  4 Sep 2025 06:09:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B02011C228A5D;
	Thu,  4 Sep 2025 08:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756966191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l7rPvc86qfZW/kM9d/MeHIKLoL85c0s+Gcv7s5Tt/cs=;
	b=RbFInPVEun08ZOUhgbXQd5Dd6BSHDVAgapgQfjsgnPskIOsyT0+05g1l+RqIcE3KjWSMTC
	O/qCo+I7tFsVxbOJ4J/Z987vo1/GQs/ReSu+Z/Q9WWoGCAycb+6D1rKDEvk7pwMU/2+WRp
	tdmgTwVKVnPLW0/mrcmwkR2gYvV8CzsXyRqrFlp8sDEMb5wu1xoL7QQCxXSF3n6fsyThMk
	qCAEjhRyP2/J67PZ0L7JEa4fzB4AOQGNRLg6bHDoiBjIV34KxdREFVTTnLKOPSFeKnboS4
	/Aqgio2qKwUtER6+EtnUKL918MxDrAlK3aXMCAe0Ei87Z980ipPm4DZf1AneUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 08:09:36 +0200
Message-Id: <DCJSJ2XDAYRQ.O73EFFHWIDLZ@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Markus Volk"
 <f_l_k@t-online.de>, "Trevor Woerner" <twoerner@gmail.com>, "Ross Burton"
 <ross.burton@arm.com>, "Otavio Salvador"
 <otavio.salvador@ossystems.com.br>, "Khem Raj" <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <quentin.schulz@cherry.de>, "Quentin Schulz" <foss@0leil.net>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
 <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
 <b309bed3-501f-4bbc-a95a-f0f2e44e7bed@cherry.de>
In-Reply-To: <b309bed3-501f-4bbc-a95a-f0f2e44e7bed@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 06:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222903

On Mon Sep 1, 2025 at 5:16 PM CEST, Quentin Schulz via lists.openembedded.o=
rg wrote:
> Discussing with Ross on private IRC chat, another option could be to=20
> postpone patch 12 and merge the rest as they should work just fine like=
=20
> that. Patch 12 is a build optimization to avoid building panfrost/asahi=
=20
> drivers in mesa-native to be able to build panfrost/asahi mesa target=20
> drivers with precomp-compilers enabled (which are enabled via=20
> panfrost/asahi tools in mesa-tools-native), as well as only having=20
> libclc dependency on the host and not requiring libclc PACKAGECONFIG to=
=20
> be present in both mesa-native and mesa target recipes.
>

Hi Quentin,

I just want to confirm, this series builds successfully on the
autobuilder after dropping patch 12.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


