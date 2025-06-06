Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDD9C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:10:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.28842.1749197425222030976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 01:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=miJWbLhh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDB9F1FD31;
	Fri,  6 Jun 2025 08:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749197423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2C62oYghSfFp5a84oNgOG2vwAvoeCnbKHf8tX2/bGm8=;
	b=miJWbLhhlf7V5YAWY66hbnINNlhpmTerWYr67jscwErTfv/wohGugA1QgRkWajnC2EvK5X
	tdlXrvu0ZDaMetdqDlPij1QOkwGBtKv+lL4n5DCt10WqUJ7w2d070oHCd9brAVEyIQoP9J
	VCVu62segFly4bMVM/x0+fm+VWtJYBa8HSjRXNYZz5PEXBtESyYeGU+Jh4VqfUr+3tQp5B
	2oXeFBHjEFZXc1+uEggArA238T40KSjhpXIHX2cHjJyZNgD5yG8XUtrDdGoz/E7/6qrf2e
	iqvIzzemwOxWDWcuadxTKdDXu8xeP330c/eTP2Zy+2QboDTLUQY7SyuXrCTE5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 10:10:21 +0200
Message-Id: <DAFAQHWQA0VW.3JVTO52GL09TF@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] meta/meta-selftest: add
 selftest-hello-mod recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dixitparmar19@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250605125442.364888-1-dixitparmar19@gmail.com>
In-Reply-To: <20250605125442.364888-1-dixitparmar19@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepughigihithhprghrmhgrrhduleesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 08:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218118

On Thu Jun 5, 2025 at 2:54 PM CEST, Dixit Parmar via lists.openembedded.org=
 wrote:
> Kernel module specific oe test cases requires a test kernel
> module package to work with. Added selftest-hello-mod
> derived from meta-skeleton/recipes-kernel/hello-mod.
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
> ...
> --- /dev/null
> +++ b/meta-selftest/recipes-test/selftest-hello-mod/hello-mod_0.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Example of how to build an external Linux kernel module"
> +DESCRIPTION =3D "${SUMMARY}"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e"
> +
> +inherit module
> +
> +SRC_URI =3D "file://Makefile \
> +           file://hello.c \
> +           file://COPYING \
> +          "
> +
> +S =3D "${WORKDIR}"

This is not correct and adds some new errors on the autobuilder:

Parsing recipes...ERROR: /srv/pokybuild/yocto-worker/a-full/build/meta-self=
test/recipes-test/selftest-hello-mod/hello-mod_0.1.bb: Using S =3D ${WORKDI=
R} is no longer supported

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1745

Can you fix this, please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


