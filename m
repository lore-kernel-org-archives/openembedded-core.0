Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD153C5B555
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 17:16:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.22314.1749057411938752586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 10:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TC5GwIKe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B639438F1;
	Wed,  4 Jun 2025 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749057410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5AluMbw/12N7D/PbaMXnsAxEe25VNr2dSs9hMfIw/M=;
	b=TC5GwIKey0soUWJsWbNPHq/TWMA25WpQlBKPooz1dMon6AwyvR2hq/E3GZG4I+P+fGj0lW
	FxQUGgRkGz9f4SDcBmdP3LT+aLeDnrrkuHKF4MqpAASz/vKnZj32DI+fIj+LbF0OIeLJyo
	T9VE2vlD+689462VO7OBlhD+I92TFavvFiRgnCKWbjP11YxBIbBLGZN071OXOWHbdo5QdQ
	2bJHSQB84IoCB1Fiz483yk/5mL5AmvTstfAHOgKs9sEId9valMMkpLiNUcnNAT4HdmgZGZ
	JQ0upsi6kUWIvstIJk+hkRAKgQwSwTZHMAZxn/QxI/2XK0y1T9weF9+VK7uYvQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 19:16:48 +0200
Message-Id: <DADX3SXTRM5I.6JK2KR2HA7DY@bootlin.com>
Subject: Re: [OE-core] [PATCH 34/45] python3-click: upgrade 8.1.8 -> 8.2.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250604084524.864-1-wangmy@fujitsu.com>
 <20250604084524.864-34-wangmy@fujitsu.com>
In-Reply-To: <20250604084524.864-34-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkedvtdduteetteegjeeukefhgfejgffffeffueffjefhvdehjeefkeefuddvvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeifrghnghhmhiesfhhujhhithhsuhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 17:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217958

On Wed Jun 4, 2025 at 10:45 AM CEST, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch.

It looks like we have some failing ptests with click:

Failed ptests:
{'python3-click': ['tests/test_utils.py:test_echo_via_pager[test0-cat]',
                   'tests/test_utils.py:test_echo_via_pager[test0-cat_]',
                   'tests/test_utils.py:test_echo_via_pager[test0-_cat_]',
...


https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1633
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1632

Ptest details can be found there:

https://valkyrie.yocto.io/pub/non-release/20250604-83/testresults/qemux86-6=
4-ptest/core-image-ptest-python3-click/
https://valkyrie.yocto.io/pub/non-release/20250604-83/testresults/qemuarm64=
-ptest/core-image-ptest-python3-click/

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


