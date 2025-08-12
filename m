Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8318C87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 11:41:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.71640.1754998895557204476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 04:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pSAIYtFy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F72043B0B;
	Tue, 12 Aug 2025 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754998893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ykp4ALabyvLo5bSq105z/Yu8TpX/sBLyIaqUu2xWFg=;
	b=pSAIYtFyg66rTw44DmWQ7qWphL5RAT7bZuuM3GOekxIgMsU2EtIT7BOuiEZPSUC/+QwsfF
	NzM3L5PVfc5HU6w62RP6DnhboY6RvJVSyZVxuoe2GQfrBjeuW2nljS/LFRIg1AXpwOcfBR
	HW2JQZ1hobgmGedXiVcUCZNTyUlHhkBBEieYw7yLTvt20dBf+meERxt9uGOjbzLby4KioK
	s6ji1/9V/BMLuIV5yz9WfCQMUNr4zDaXK7RUhr0jI38JEYnFaJSMGe5tb5Il4CmkPAF7tf
	uOfQKEsZyZ+AWGLYPVAWR2elxq2qgVe2OYp/RvJajn08LR3HlLsLBiJLUnvHKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 13:41:33 +0200
Message-Id: <DC0F6PAWLK7U.MDD78DHJC5D@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/3] libtirpc: Fix version scripts to work
 with lld linker
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250812051312.4067998-1-raj.khem@gmail.com>
 <20250812051312.4067998-3-raj.khem@gmail.com>
In-Reply-To: <20250812051312.4067998-3-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeehvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 11:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221766

On Tue Aug 12, 2025 at 7:13 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> Since bfd linker does not enable string checking for versioned symbols, b=
uild is generating
> undefined versioned symbols, which LLD does not allow by default. Actuall=
y these symbols
> should not be generated at all when given features are not enabled
>
> Fixes link errors with lld
>
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol '_svcauth_gss' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'authgss_create' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'authgss_create_default' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'authgss_free_private_data' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'authgss_get_private_data' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'authgss_service' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'cbc_crypt' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'ecb_crypt' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'endrpcent' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'getrpcent' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'getrpcbynumber' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'getrpcbyname' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'gss_log_debug' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'gss_log_hexdump' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'gss_log_status' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'rpc_gss_get_error' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'rpc_gss_get_mech_info' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'rpc_gss_get_mechanisms' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'rpc_gss_get_principal_name' failed: symbol not defined
> aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0=
.3.0' to symbol 'rpc_gss_get_versions' failed: symbol not defined
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for the v2, but I believe it breaks the build with musl, on both
quota and nfs-utils:

ERROR: quota-4.10-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/=
musl-qemuarm64/build/build/tmp/work/cortexa57-poky-linux-musl/quota/4.10/te=
mp/run.do_compile.1692753' failed with exit code 1
...
| /usr/src/debug/quota/4.10/svc_socket.c:39:(.text+0x30): undefined referen=
ce to `getrpcbynumber'
| collect2: error: ld returned 1 exit status
...
ERROR: nfs-utils-2.8.3-r0 do_configure: Execution of '/srv/pokybuild/yocto-=
worker/musl-qemuarm64/build/build/tmp/work/cortexa57-poky-linux-musl/nfs-ut=
ils/2.8.3/temp/run.do_configure.2602719' failed with exit code 1
...
| configure: error: Neither getrpcbynumber_r nor getrpcbynumber are availab=
le

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/942
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2224
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2254

Can you have a look at these errors please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


