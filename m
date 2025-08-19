Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1E9CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 14:04:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.14995.1755612254132440516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 07:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Icg27RWT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DA460C6B393;
	Tue, 19 Aug 2025 14:03:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4410860697;
	Tue, 19 Aug 2025 14:04:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA6851C228AF3;
	Tue, 19 Aug 2025 16:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755612250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Iw2SgqrPtjrHSFFzYrdCQrpQ8hWEvCht/y1noEQMMBk=;
	b=Icg27RWTtQifsaEOHVOdM5QVTNq962s5LWlDSmvsy0PRC8EN+liE5VOxoTnI9/kl/Pjxow
	i7IRTMLWqd/A4dWjsuDxBqq/a3ZfZiiNgZnuqqmQ8Yi3mE6mM44VKVGRqww3F5v5QKjMvz
	BbTab2oxhsX71NiYWc+rBavdftv0y98hFY/T6qOzrqfwgwKHRX/l5f2D3a7mhhwsKfIrnE
	rkm5YTn1EHSg0Yc+fyMnxexRlEwPCAKfUApp9Y4IZF/84CcOWz7nvEvDgJqdOMgFo6a2rH
	IM9nVbHySeILnqCQLQiBQJhC6JUZPOv1LQNfrMKQWi1tLblN/jaWPyerRwKziA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Aug 2025 16:03:46 +0200
Message-Id: <DC6GLEVBVKZW.28X2L6NT5YP7V@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 0/9] mesa: lighten up target's libclc
 dependencies and fix panfrost support
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Markus Volk"
 <f_l_k@t-online.de>, "Trevor Woerner" <twoerner@gmail.com>, "Ross Burton"
 <ross.burton@arm.com>, "Otavio Salvador"
 <otavio.salvador@ossystems.com.br>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
In-Reply-To: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 14:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222115

Hi Quentin,

Thanks for your patch.

It looks like this is causing some issue:
ERROR: libepoxy-native-1.5.10-r0 do_prepare_recipe_sysroot: The file /usr/s=
hare/drirc.d/00-mesa-defaults.conf is installed by both mesa-native and mes=
a-tools-native, aborting
ERROR: libsdl2-native-2.32.8-r0 do_prepare_recipe_sysroot: The file /usr/sh=
are/drirc.d/00-mesa-defaults.conf is installed by both mesa-native and mesa=
-tools-native, aborting

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2135
https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/2073

Can you have a loot at it please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


