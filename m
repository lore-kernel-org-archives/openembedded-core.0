Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BADC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 16:14:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.91879.1754064836599420372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 09:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lx+ps7BX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E699444F2;
	Fri,  1 Aug 2025 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754064833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oWl+pO6R0OLg/HD3Zq/Zap5VNVvrEB+kwuseV2nPjpw=;
	b=lx+ps7BXpVNjtCsbZBncuSX2WsURTyxtS0R1wWoB6iuHCzjGUAZk8WxlyRba/GStNk2gCC
	lsNlmSgp85VqQcPD8bx2BdLkhkOD9s3W+yZMSUpzsgqQQ0HSLsFKxhgDocWTGymh2OuDoo
	SrV811aWChvms6xN16Jy4H2JS0Cd6JASzmAAXxuqfx80i79DSM6ceOYJ0zT93oq7zHMNaJ
	LctRCOUXWZ7QmivMjQsH9nRNPQNSHgNCztMdF65rR8y8nLKhBTyme+xOYwV5aNsi3kY5Nc
	K6GUeSs8lrH+N4pJoZzKYTWf0dbu6TxoFEwFgTMIBlT1bJf+sV6vXBLKiacdQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 18:13:52 +0200
Message-Id: <DBR837TZX59J.9N2ST9LM6WP2@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/7] toolchain/clang-native: Set BUILD_LDFLAGS
 instead of LDFLAGS
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250801042242.3076232-1-raj.khem@gmail.com>
 <DBR3USPY34UA.F664WZTD1W0R@bootlin.com>
In-Reply-To: <DBR3USPY34UA.F664WZTD1W0R@bootlin.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdegudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkedvtdduteetteegjeeukefhgfejgffffeffueffjefhvdehjeefkeefuddvvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemugguieemvdegfedtmehfkedujeemkeefvgdtmegujegsrgemkeduledunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeguugeimedvgeeftdemfhekudejmeekfegvtdemugejsggrmeekudeluddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhop
 ehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 16:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221368

On Fri Aug 1, 2025 at 2:54 PM CEST, Mathieu Dubois-Briand wrote:
> On Fri Aug 1, 2025 at 6:22 AM CEST, Khem Raj via lists.openembedded.org w=
rote:
>> BUILD_LDFLAGS is used by other recipes to emit native LDFLAGS
>> into their cmake toolchain files especially in QT layers. it
>> will usually be inherited by recipes wanting clang provide
>> BUILD_* variables so this is more appropriate than LDFLAGS to
>> pass these options.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>
> Hi Khem,
>
> It looks like something in there is breaking the reproducibility:
>
> AssertionError: The following deb packages are different and not in exclu=
sion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./core2-64/clang-dev_20.1.8-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/ipk/./core2-64/clang-dev_20.1.8-r0_core2-64.ipk
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./core2_64/clang-dev-20.1.8-r0.core2_64.rpm
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2205
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250801-t697t4f=
j/packages/diff-html/
>
> Can you have a look at this?

I did a rebuild of this one and is succeed. So either we have an
intermittent fail or some cache issue, not really sure...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2210


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


