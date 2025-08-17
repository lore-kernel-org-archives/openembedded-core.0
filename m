Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969BCCA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 17:26:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.56734.1755451578734570097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 10:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NJHFzwz7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02FF444346;
	Sun, 17 Aug 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755451576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJyB8okoltx/zHOOQ/UPHtFwuIrlIxzlVBPMQe7VPrM=;
	b=NJHFzwz7UnDhkRJYD0gdhL46Bpv1DJCCaQdD9jVPfeHlj93i3bBqV+LIkaZFgU6EDsTsgd
	HAc/LyLvumtmaByhCh84XbJfg4ECPyhuDT4jVT6zLYTEGlp85z0f5O845QQt+o5E1u28Ho
	KNJqS3CNdPVYOJT6zcWJsYrEnJP/FLH3CvLQ5H7F9NRZVD998BZq24PIqWleUR5dIBf4Nz
	5bInQc1qrQXY9wijawqkSuOBe9vAwMJrs0WD6MvcNCcZVNIsSXqDnSjbQafKYYr/LWljrK
	q7QHoKRHEbz78TxiIxlOFeOJzEEU2AGzA7yPPcRB3GaS/qtaV6GQp28WPEMyEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 17 Aug 2025 19:26:14 +0200
Message-Id: <DC4VNCG1YJSI.EVHDCRSBIBIS@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: Upgrade to 21.1.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250815162502.3092192-1-raj.khem@gmail.com>
In-Reply-To: <20250815162502.3092192-1-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedtfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdejvdefudegueejjeehkeejueetudejvddvgeelgeegkeeigeduvdejtdfggeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgeegtdemhedugedtmegvfeekvgemmedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeegtdemhedugedtmegvfeekvgemmedupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhor
 hhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 17:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222007

On Fri Aug 15, 2025 at 6:25 PM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

It looks like this is breaking the build:

ERROR: spirv-llvm-translator-native-21.1.0-r0 do_configure: Execution of '/=
srv/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64-linux=
/spirv-llvm-translator-native/21.1.0/temp/run.do_configure.97313' failed wi=
th exit code 1
...
| CMake Error at CMakeLists.txt:82 (find_package):
|   Could not find a configuration file for package "LLVM" that is compatib=
le
|   with requested version "21.1.0".
|
|   The following configuration files were considered but not accepted:
|=20
|     /srv/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_6=
4-linux/spirv-llvm-translator-native/21.1.0/recipe-sysroot-native/usr/lib/c=
make/llvm/LLVMConfig.cmake, version: 20.1.8

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/2207
https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/2253
https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/2058

Can you have a look at this please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


