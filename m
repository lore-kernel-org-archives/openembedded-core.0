Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA44C87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:26:33 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.13348.1754295988074254968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=our1QKCq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39BD743355;
	Mon,  4 Aug 2025 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754295986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bH4C6hk6ojTzxdRv/4huDEzQ/NZ99MC3wLlr8smmtD4=;
	b=our1QKCqJnO4veFuF3NR2tzTw47uINYDkYp+cv/5a+8v3g8OUzv5HQHjqzNUTOCSqBeMvO
	Z69ebkKiqGPJL7bb0lZK6iJhwQ8yxmorbZ6QUtmiCzxEDKkfGmZqRkicZRIUMw06CmFY01
	EIt3RKPgiN5hJL7xUu3yf6HYDcHDURsKkPC3zhCMhfg53Z52eGxdYqIUqkct+aILw323e9
	VPPVzFcEwqz9q38J46scRihAZRzAbD7kOn2yr603UfzQuvrf3rW5QiiV+IaafgurtnpNwg
	H1kYNqpwc6AodvhIiAhX3Dw41CQk8jLZ0n/5tXhuxdMidBDyWwgTSJt9isgeYg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 10:26:23 +0200
Message-Id: <DBTI0WV2IOR5.3A1LDH28GH3BS@bootlin.com>
To: <mingli.yu@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ovmf: Don't define bool type if building in
 C23 mode
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250801102912.3219302-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20250801102912.3219302-1-mingli.yu@eng.windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddukedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddttddvkeeiheekleffjeehkeeihefhudevteehkeeugfdvieejhffhveelvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmihhnghhlihdrhihusegvnhhgrdifihhnughrihhvv
 ghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 08:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221418

On Fri Aug 1, 2025 at 12:29 PM CEST, Mingli via lists.openembedded.org Yu w=
rote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Backport a patch [1] to fix the below build failure:
>  /buildarea/tmp/work/corei7-64-wrs-linux/ovmf/edk2-stable202502/sources/o=
vmf-edk2-stable202502/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/Libspd=
mStdBoolAlt.h:13:17: error: two or more data types in declaration specifier=
s
>  13 | typedef BOOLEAN bool;
>  | ^~~~
>   /buildarea/tmp/work/corei7-64-wrs-linux/ovmf/edk2-stable202502/sources/=
ovmf-edk2-stable202502/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/Libsp=
dmStdBoolAlt.h:13:1: error: useless type name in empty declaration [-Werror=
]
>   13 | typedef BOOLEAN bool;
>
> [1] https://github.com/tianocore/edk2/commit/772fa11ac82579a8f6fa171e6b83=
5f68af3f64be
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---

Hi,

Thanks for the patch, but it looks like the embedded patch does not
apply cleanly:

ERROR: ovmf-native-edk2-stable202502-r0 do_patch: Applying patch '0001-Secu=
rityPkg-Don-t-define-bool-type-if-building-in-C2.patch' on target directory=
 '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86_64=
-linux/ovmf-native/edk2-stable202502/sources/ovmf-edk2-stable202502'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-world-alt/bui=
ld/build/tmp/work/x86_64-linux/ovmf-native/edk2-stable202502/recipe-sysroot=
-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-SecurityPkg-Don-=
t-define-bool-type-if-building-in-C2.patch
patching file SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBool=
Alt.h
Hunk #1 FAILED at 10 (different line endings).
1 out of 1 hunk FAILED -- rejects in file SecurityPkg/DeviceSecurity/SpdmLi=
b/Include/hal/LibspdmStdBoolAlt.h
Patch 0001-SecurityPkg-Don-t-define-bool-type-if-building-in-C2.patch does =
not apply (enforce with -f)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1998

Can you have a look at this issue please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


