Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B4DC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:02:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.13932.1749034937855836741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bp7yooSR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26A5743AF0;
	Wed,  4 Jun 2025 11:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749034936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5VFyfCCaEk64lTW1P+fW6fHy365y2P1MaDwhsBvdls=;
	b=bp7yooSR+6+d6ZLZVqh49R0eM8PIFoo2tcUGi6TGCBt/oR/pCEvxEIwaR0Nh3nWky1i0Yr
	1K0amOZjFfIthuG9GW/iUxq+0GuGkCFmag8APvo4wvOK4QikLWCK5blsMXY5R6R98NZ4vb
	KzL4yywYPlIoaJb/jD5vcdQx11F2qif1ak2UEzotA2taRsI82Krn+Tg3cdG4KINo/rayEA
	ek+HFQj3xw+R/Kk/UdAmkluBhaz3oqvfHvZZzccJ5EZS9DmIEU8qKGireJQJ3R0NStsKtG
	nUd2j0hJf5CvoGaeWhyRKgw9qLmKGhsUDHzfjLsScIJ9k95EkQMWUW02hyLKsA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 13:02:14 +0200
Message-Id: <DADP50B5JGYK.2EKGV9HRKIMEN@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] m4: Adjust ptest dependencies
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250604052202.1789858-1-raj.khem@gmail.com>
In-Reply-To: <20250604052202.1789858-1-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217901

On Wed Jun 4, 2025 at 7:22 AM CEST, Khem Raj via lists.openembedded.org wro=
te:
> This ensures the dependencies match across musl and glibc
> additional deps on iso8859 gconv/locale seems to be not
> needed anymore for glibc tests
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

It looks like this is breaking some ptests:

Failed ptests:
{'m4': ['test-btoc32-2.sh',
        'test-btowc-2.sh',
        'test-c-strcasecmp.sh',
        'test-c-strncasecmp.sh',
        'test-c32isalnum.sh',
        'test-c32isalpha.sh',
        'test-c32isblank.sh',
        'test-c32iscntrl.sh',
        'test-c32isdigit.sh',
        'test-c32isgraph.sh',
        'test-c32islower.sh',
        'test-c32isprint.sh',
        'test-c32ispunct.sh',
        'test-c32isspace.sh',
        'test-c32isupper.sh',
        'test-c32isxdigit.sh',
        'test-c32rtomb.sh',
        'test-c32tolower.sh',
        'test-iconv',
        'test-iswdigit.sh',
        'test-iswxdigit.sh',
        'test-mbrtoc32-2.sh',
        'test-mbrtowc-2.sh',
        'test-setlocale1.sh',
        'test-striconv',
        'test-strtod1.sh',
        'test-wcrtomb.sh']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1630
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1629

Can you have a look at these please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


