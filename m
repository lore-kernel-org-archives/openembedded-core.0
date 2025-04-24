Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F31C369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:10:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13691.1745496626445275899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HoiIziXi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3198B43A0D;
	Thu, 24 Apr 2025 12:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745496624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iCJCV1uMieiUpx+PlptqVm5PWe6B9mtp6EaWe6LzUc=;
	b=HoiIziXiTuMH7Din1NFCDf6xyQ2UOkKP22IsUDErH7ZdmkzAUeObIKV4hbQYTsBzDStm3L
	6m1Rk3oDnAPJv/TJmK4lKSU70souIBmKIyv1fjsDGieYuV6xCJE0TJGgtdGwbgfAh+sQsa
	3YxAl7sdCTxCzo5W1Qf4a8CdJYVwlHwa+IoBRG+kkR37wrpBlkGarNw5xRq5lhKGWUpSk/
	e3FkwG2RTv7JKFED3L95PXDkRSH+c/Kj0ZHGJ9QQOpqVEiOzzW07dAmarHwhEHugV/EWEh
	w08bWqQHxrnbpNKbW10+0qo8awoBe4dTFZYiyYbWJ7f4G6DQdOmxL4A0My2PHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 14:10:23 +0200
Message-Id: <D9EUWV18KMLM.1TAQMGWBOXA2M@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Changqing Li" <changqing.li@windriver.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icu: Add coreutils-native as DEPENDS
Cc: "OE-core" <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250418081919.382562-1-changqing.li@windriver.com>
 <0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org>
 <4aea547a-0b02-4ec4-8050-57a0f2d0677c@windriver.com>
In-Reply-To: <4aea547a-0b02-4ec4-8050-57a0f2d0677c@windriver.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehvedtkeffueelheektddvjefhiefhgedtudevgeehvdevlefgveetkeevleelteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheptghhrghnghhqihhnghdrlhhiseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhgui
 hgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 12:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215367

On Thu Apr 24, 2025 at 5:28 AM CEST, Changqing Li wrote:
>
> On 4/21/25 20:26, Richard Purdie wrote:
> Hi, Mathieu, Richard
>
> According to Richard's comments, I send a=C2=A0 V3 patch:=C2=A0 [PATCH V3=
] icu:=20
> set ac_cv_path_install to install under hosttools
>
> But I noticed that [PATCH V2] icu: Add coreutils-native as DEPENDS is on=
=20
> master-next.
>
> So I am wondering maybe V2 is merged by accident?=C2=A0 Please help to ch=
eck,=20
> if there is no problem, you can just ignore this mail.
>

Yes, my bad. IIRC the v2 was working fine on my side, so I kept it in my
branch and then forgot to drop it when you sent the v3.

I'm dropping the v2 now.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


