Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64985C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 04:58:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.1571.1745384261515813094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 21:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PKHGBsi1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CB4743899;
	Wed, 23 Apr 2025 04:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745384259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOgyx4Tat4zX8EHcmim+CD5uXcxyxu1Oeaw1uFZY/5U=;
	b=PKHGBsi17RQxiK5UBeEFXukGGMEDQooX/aDreTOaOkEtdMozGkQmYIEpJJ4GxLLL/WQKaa
	tyPGmhOm1T3XZjMvidzGUByt4tAbexkkqM+26gMU2icuLTODEDfnSyBlIOOAH5sOwcA7jF
	yQ1EYaqWXh/iEBFqYEbXU4QFYf7fkd90Lq2QbtAG+u6MAVCueN19dltfPAjc6rnh9hDyVi
	+YzvCUmk1NemgdEszWxiFTTr6M/oToScIRO7mtuFhQMBEcr00a4D7WUhZCm0zkfjIEM9LU
	s4p2nJpI0nCXZnCSwtWRKgTblcqEuKJiBI0l+E2cojqAzVhx7yyKJ/EJnEJQCw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 06:57:37 +0200
Message-Id: <D9DR2YV3L26S.29EB7OC0D9J5S@bootlin.com>
Subject: Re: [OE-core] [PATCH V3] icu: set ac_cv_path_install to install
 under hosttools
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250422130702.1337476-1-changqing.li@windriver.com>
In-Reply-To: <20250422130702.1337476-1-changqing.li@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemsgejiedumedvheeljeemvdeijedumegtieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemsgejiedumedvheeljeemvdeijedumegtieegpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheptghhrghnghhqihhnghdrlhhiseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpv
 ghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 04:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215260

On Tue Apr 22, 2025 at 3:07 PM CEST, Changqing Li via lists.openembedded.or=
g wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> icu will check program install path during do_configure, eg:
> checking for a BSD-compatible install... /path/to/install -c
>
> And this path will be writen into pkgdata.inc:
> INSTALL_CMD=3D$(INSTALL-L)
>
> Decided by if install is installed into recipe-sysroot-native during
> do_configure stage, the INSTALL_CMD could be
> /build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bi=
n/install
> or /build/tmp/hosttools/install.
>
> set ac_cv_path_install to install under hosttools to make a determined
> result of INSTALL_CMD, avoid vary caused by the execute sequence of
> another task which DEPENDS on coreutils-native and independent with
> do_configure
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---

Hi,

Thanks for your patch.

It looks like we have some issue with is, as can be seen on the
autobuilder:

ERROR: icu-76-1-r0 do_package_qa: QA Issue: File /usr/lib/icu/76.1/pkgdata.=
inc in package icu-dev contains reference to TMPDIR [buildpaths]
ERROR: icu-76-1-r0 do_package_qa: Fatal QA errors were found, failing task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1435/step=
s/12/logs/stdio

Can you have a look at this failure please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


