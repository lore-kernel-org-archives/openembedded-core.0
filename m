Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AF5C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:11:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.47427.1739783472136228344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 01:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XKUUo7ad;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 049FB4330E;
	Mon, 17 Feb 2025 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739783470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55KcQ/NHHG+95591H98QxZzJr1PzRsh+L51N0v7n6Zk=;
	b=XKUUo7adxpue6CisUAri0MwDFpAXgsbPIeyMiPbWkqyDn8HwIsZwC/QoNgiD04OL139JRC
	eFyXdrj1kyS4ldInFtiZcQHOX5CMLNahaSuS1DWVBx7W3PkROlsK2Ex4roZatGSXtYclDX
	5BXkZp44Oz8oSRFMDyfA1JjfpwHmI3YHxpnIBaZMy/ptm5xdc/KVkG16mbTDbdqguyS/qx
	H+zyMJ1QMMhvFk4U1Pg3f1Bg7r9HLNMJ3008TD81o1GafQ3zJTMLPNjyOjEwua11QMxeyp
	U38Zq0OyTrhtKbCtdfo3OgY8gvygajdAtHnx9MJLUbs4QfQbUWWoaXt1+dPltg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 10:11:09 +0100
Message-Id: <D7ULRO9YDXHS.1QDCIQ63BGI8E@bootlin.com>
To: <festevam@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mtd-utils: Upgrade to 2.3.0
Cc: "Fabio Estevam" <festevam@denx.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250215204941.1453502-1-festevam@gmail.com>
In-Reply-To: <20250215204941.1453502-1-festevam@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkedttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueekvdelffdvuedvkeelfefhgeetieejtdfhfeduuddtkeegffeuueeifeehhffgnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepfhgvs
 hhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepfhgvshhtvghvrghmseguvghngidruggv
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 09:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211535

On Sat Feb 15, 2025 at 9:49 PM CET, Fabio Estevam via lists.openembedded.or=
g wrote:
> From: Fabio Estevam <festevam@denx.de>
>
> Upgrade to mtd-utils 2.3.0.
>
> Details about the 2.3.0 release:
>
> https://lore.kernel.org/linux-mtd/1b7a55a6-1c5b-4e86-8006-e2010e54367e@si=
gma-star.at/T/#u
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Hi Fabio,

Thanks for your patch. However, I believe this is breaking some builds
on the autobuilder, with the following error:

ERROR: mtd-utils-2.3.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/mtd-util=
s/2.3.0/temp/run.do_compile.2425952' failed with exit code 1
...
| In file included from ../git/ubifs-utils/common/bitops.c:7:
| ../git/ubifs-utils/common/defs.h:16:10: fatal error: execinfo.h: No such =
file or directory
|    16 | #include <execinfo.h>
|       |          ^~~~~~~~~~~~
| compilation terminated.
| make: *** [Makefile:4822: ubifs-utils/common/mkfs_ubifs-bitops.o] Error 1
| ERROR: oe_runmake failed

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1045/ste=
ps/12/logs/stdio

Can you have a look at this issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


