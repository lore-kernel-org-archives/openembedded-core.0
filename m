Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884AFC83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 05:51:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7265.1753249910715050790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 22:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hML1gnA+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36E81441C9;
	Wed, 23 Jul 2025 05:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753249908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Es2iTtMrSwcdIfc4NjuBRMkMlg9C0eO9QWaV6otEkfI=;
	b=hML1gnA+HBSf9vVuUAXsgC3mVX/8lwR0+ESbWJnm6kEsQSa4zCsVROkwZy900z3MuYHudI
	ZvMJ14WRnoGmxDWUAt0on19wRVIU5Zc+ImfYDGeUb08kiz3zbA9YW70bVg9f5iETZOzpS6
	HWouZcLXCthsanRaQEEHau91NkLeoUTVHnCN1Nt6epnvFATpDE9R9fXa4CKSKXxybrfOLu
	3HUNNX2zDYNHML/d5tBKl9z1vID2Iw0IHGYZL8gKtmswmBLhC/d2KR/I6/I1sxo3iPuzr1
	fluRJQxqX2h3Rh0S1QNGrZEjNddP17yYxXRTIlXPJxNpUdDD2gx3dd7lYyyMrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 07:51:43 +0200
Message-Id: <DBJ77YFBBNED.2NE9TOFHYZ07O@bootlin.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>, "Joao Marcos Costa"
 <joaomarcos.costa@bootlin.com>, <mingli.yu@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/4] babeltrace2: Enable python plugins
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
 <20250720090010.3122861-2-mingli.yu@eng.windriver.com>
 <1728b300-fcaf-4969-8ea8-b41735242764@bootlin.com>
 <1ae568be-00d1-4589-9ab0-887c05bae482@windriver.com>
In-Reply-To: <1ae568be-00d1-4589-9ab0-887c05bae482@windriver.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejieellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggeegveelvdfgteevkeetgeduhfeiuefghefgieefteeiteelieduudejvdeiueenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemledukedvmeegfegtheemrgegheeimeekjeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemledukedvmeegfegtheemrgegheeimeekjeekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepmhhinhhglhhirdihuhesfihinhgurhhivhgvrhdrtghomhdprhgtp
 hhtthhopehjohgrohhmrghrtghoshdrtghoshhtrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhnghhlihdrhihusegvnhhgrdifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 05:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220788

>> There are some ptest errors in the autobuilder:
>> -
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1923=
/steps/12/logs/stdio
>> -
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/1931=
/steps/12/logs/stdio
>>=20
>> Could you please take a look?
>
> I will look into this.
>
> Could I access the ptest-runner.log such as=20
> tmp/work/qemux86_64-poky-linux/core-image-ptest-babeltrace2/1.0/testimage=
/ptest_log.20250710153833/ptest-runner.log=20
> corresponding to=20
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1923/=
steps/12/logs/stdio?

Hi Mingli,

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250720-85/testresults/qemuarm64=
-ptest/core-image-ptest-lttng-tools/
https://valkyrie.yocto.io/pub/non-release/20250720-85/testresults/qemux86-6=
4-ptest/core-image-ptest-lttng-tools/

>
> Thanks,
> Mingli
>
>>=20
>> Thanks!
>>=20
>> --=20
>> Best regards,
>> Jo=C3=A3o Marcos Costa

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


