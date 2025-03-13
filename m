Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE66C35FF1
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 20:04:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.24577.1741896277463158880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 13:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WchjgxBC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2222320454;
	Thu, 13 Mar 2025 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741896275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pih+8ovY/skGVB2lVct00dygmzwRWy+BIWC7GP3oAOA=;
	b=WchjgxBCC3hnyFy851uqsthBZlqjcnIVHi+6IKL2MSbT5A8US9t0Tl/kTtR0y+JrbGhu62
	FvsPQW+wrRiNwN8FncZJyyImoBffug7OHejYlhvodg/Q07i6fWD4QqGTZ83WoQ0lSmybwM
	q4Ta1+57/JPHtwPbWc7vTgHm+qY86+0J3ev+M/hNYPrHlVY2WyqL5AkWWsc+kaMc4JjlcP
	8oZ095jGquhIExljZfYdplqFdF7bX1Te9LAWWuLqsN68aJcUSwXw3WztAktvsMPna9iiKS
	D3kR7uIaiA5FQnMu8Pc78Pq9dlqKl16+b/Hjtq4p1eHSod14cNmKddqwU8DAjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 21:04:33 +0100
Message-Id: <D8FEP0VACG5M.2FZC28RSMSHOP@bootlin.com>
To: <alex.kiernan@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH OE-Core v3 0/4] Upgrade kmod 33 -> 34.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
In-Reply-To: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeitdetvdelffegfeeuvdetlefffeejhfdutdektdekheegfeejleefjeehjefgtdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhkvghrnhgvlhdrohhrghdpkhhmohgurdhtohholhhspdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemkeejleejmegrrgduieemvghffeegmegshedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemkeejleejmegrrgduieemvghffeegmegshedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprghlvgigrdhkihgvrhhnrghnsehgm
 hgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 20:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212805

On Thu Mar 13, 2025 at 3:13 PM CET, Alex Kiernan via lists.openembedded.org=
 wrote:
> Bring scdoc in from meta-wayland to support generation of the manpages. C=
onvert
> to meson from autotools. Clean up usage of kmod in eudev.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> Changes in v3:
> - Fix maintainer for scdoc
> - Stop using autotools in scdoc (it just has a Makefile)
> - Set upstream commit correctly for scdoc 1.11.3
> - Fix scdcoc metadata
> - Link to v2: https://lore.kernel.org/r/20250313-upgrade-kmod-v2-0-2103ca=
9a26ad@gmail.com
>
> ---

Hi,

Thanks for the new version, but it appears to be failing on the
selftests:

AssertionError: Regex didn't match: 'Line \\d+ of \\"/usr/src/debug/kmod/.*=
/tools/kmod.c\\" starts at address 0x[0-9A-Fa-f]+ <kmod_help>' not found in=
 'Reading symbols from /tmp/debugfs-xvl6_emr/bin/kmod...\nReading symbols f=
rom /tmp/debugfs-xvl6_emr/bin/.debug/kmod...\n0x00007ffff7fe3ac0 in _start =
() from /tmp/debugfs-xvl6_emr/lib/ld-linux-x86-64.so.2\nLine 118 of "/usr/i=
nclude/bits/stdio2.h" starts at address 0x55555555edd0 <kmod_help> and ends=
 at 0x55555555edd7 <kmod_help+7>.'

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1759546/raw_inlin=
e

Can you have a look at this ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


