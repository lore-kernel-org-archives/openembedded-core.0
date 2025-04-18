Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED54CC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 16:26:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.86.1744993604686733206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 09:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OLAACztk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9660443291;
	Fri, 18 Apr 2025 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744993602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DehdgyH86N858nwpUMzXLSDfeoL9IQI5g5Db8LhkGPA=;
	b=OLAACztkN8ANqOYvVu8z84JCChBEvsnUbwQaKsU81Wd6iLSz9TYKjznXypS52QX2o5Va5B
	98Bat7rTpl1DQGw4y31Aa6b+NThdZyJao9l5XYRu6mpkCNn3P+KSDUW5RWnUCC8qIjkRGW
	eOdr/UXRR7bDbDex7OrTbk1W6Z14mc1YIwbX44U/nB/kNmVM76WqMGb2HZQ5fv0aCKSYhG
	13jTeFqYa5K1W6eJ/sPASSRkdVhLP4y0XDTeQBZ/dih2YrvaZVzAujqiACxJSHMpJaLiM4
	19BKB7El/18SPaLXh/UBARx2s/FcoH746RxXn8ETWVv7mQio9akIVz+3nLMp7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Apr 2025 18:26:41 +0200
Message-Id: <D99WLTK5WV0E.27NXW99OIGMYH@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] icu: Add coreutils-native as DEPENDS
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250418081919.382562-1-changqing.li@windriver.com>
In-Reply-To: <20250418081919.382562-1-changqing.li@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedviedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheptghhrghnghhqihhnghdrlhhiseifihhnughrihhvvghrrdgtohhmpdhrtghpthhto
 hepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 16:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215135

On Fri Apr 18, 2025 at 10:19 AM CEST, Changqing Li via lists.openembedded.o=
rg wrote:
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
> or /build/tmp/hosttools/install
>
> Add coreutils-native as DEPENDS to make a determined result of
> INSTALL_CMD, avoid vary caused by the execute sequence of another task
> which DEPENDS on coreutils-native and also independent with do_configure
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---

Hi,

Thanks for your patch.

It looks like this is raising a QA issue:

ERROR: nativesdk-icu-76-1-r0 do_package_qa: QA Issue: File /usr/local/oe-sd=
k-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/icu/76.1/pkgdat=
a.inc in package nativesdk-icu-dev contains reference to TMPDIR [buildpaths=
]
ERROR: nativesdk-icu-76-1-r0 do_package_qa: Fatal QA errors were found, fai=
ling task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1404

Can you have a look at this error please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


