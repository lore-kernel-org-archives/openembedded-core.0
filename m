Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A192C369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 10:32:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.5179.1744194732901054371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 03:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Eoo937L2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8A3242EF5;
	Wed,  9 Apr 2025 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744194731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4x/E3+1jSdrMJxrRWVdfKHiL+YKYTNY7ZFR79DUxmo=;
	b=Eoo937L2B/A8jV9NPuk8VoI6/DrKdaKek/XjbF0dlSiQMrLnhr9HKvFa+Rp0m7HV15LlYJ
	04mAqnKYJ8kO7HaS7x5d3PZ8ZhKvscqzRQ9Xlr1HfJs1AzNcvyJ0yHS2T3moKAQ/x0plvx
	Dsuuqkujvvw0eIzyuXfgtJX4rTKTsl+Ruh/R7bmeoij5sZY5Jj4SPddT4vN952HMkp6jTA
	kHAXP6ye60XMiKc2BP07VRFWJN1z541uU7VqL62NJyDySW7qE5ASzCDGD3T55nMukZd/I1
	OEN7wRDhI8dCzyhECptGaqyuDPLH0J6Li1TggEYsbCSpCML/mdTHodvWxt3VoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Apr 2025 12:32:10 +0200
Message-Id: <D921FHIPO4L5.17657PHNL4NID@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] sbc: upgrade 2.0 -> 2.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <1744166786-4539-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744166786-4539-1-git-send-email-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 10:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214583

On Wed Apr 9, 2025 at 4:46 AM CEST, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: Using SPDX-License-Identifier: LGPL-2.1-or-later to repla=
ce the description of license
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch.

It looks like the license file changed, can you fix LIC_FILES_CHKSUM
please?

ERROR: sbc-2.1-r0 do_populate_lic: QA Issue: sbc: The LIC_FILES_CHKSUM does=
 not match for file://src/sbcenc.c;beginline=3D1;endline=3D8;md5=3D1db4f385=
0f47b59e79aeedb2668f4b3e
sbc: The new md5 checksum is cfac6012e2dea914de8b3b7693591622
sbc: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=3D1 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
/*
 * Bluetooth low-complexity, subband codec (SBC) encoder
 * Copyright (C) 2004-2010  Marcel Holtmann <marcel@holtmann.org>
 * Copyright (C) 2008-2010  Nokia Corporation
 * Copyright (C) 2012-2013  Intel Corporation
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=3D8 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
sbc: Check if the license information has changed in /srv/pokybuild/yocto-w=
orker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/sb=
c/2.1/sbc-2.1/src/sbcenc.c (lines 1 through to 8) to verify that the LICENS=
E value "GPL-2.0-or-later & LGPL-2.1-or-later" remains valid [license-check=
sum]
ERROR: sbc-2.1-r0 do_populate_lic: QA Issue: sbc: The LIC_FILES_CHKSUM does=
 not match for file://sbc/sbc.h;beginline=3D1;endline=3D10;md5=3Dc5a50a7fc3=
3c148ee362e2b46574a87f

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1363

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


