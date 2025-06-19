Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4489DC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 11:40:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12756.1750333229995804101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 04:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Fc+hiHLy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A173843918;
	Thu, 19 Jun 2025 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750333227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVmuswzS2a3/VSj3/RRARnxTVGOKez+dSB+6SPEUWVg=;
	b=Fc+hiHLyhb6iAusFCzVf/PLJVDu506ddokBOfhg1tNmEh6qVwXoPgrVMaYzPfe7Kk2N3MA
	J7krd3zNFn8fiQQ+klPjA9O8q8FgEyblfWUeMg75V2h7m4gcd5FroR5Y58aRVZwviWhbbR
	LV/KvSt+swoSP/vx6HvqRPzU297s5YiN8OGklaFZaU98cZssIuIq2gTYZ96Mr1smvSf7Xj
	TBro45XPcG999wILcx+SYHgb1QiOgqijV1vdj5UUrOYPzcalpayIr+68+UaQqqtT59263j
	fbXm8aghOa1RBVcCbPUoAUI1pJEevH5/tzUPVTwiGOJ8uCFIf9RRyZJNQQhkjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 13:40:25 +0200
Message-Id: <DAQHCF8TSZCA.2ZCCQ2WA746D1@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] meta/meta-selftest: add selftest-hello-mod
 recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dixitparmar19@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <DAQ8IV6QATNI.5KU5EZV9S8MH@bootlin.com>
 <22191.1750312600030991891@lists.openembedded.org>
In-Reply-To: <22191.1750312600030991891@lists.openembedded.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffellefgveekfeegheejiedutedukeffkeduvdevvddtgefgffffveefgfdvudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmeelfhdukeemrghfkedumegtheeksgemgeejsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeelfhdukeemrghfkedumegtheeksgemgeejsgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdro
 hhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 11:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219070

On Thu Jun 19, 2025 at 7:56 AM CEST, Dixit Parmar via lists.openembedded.or=
g wrote:
> On Thu, Jun 19, 2025 at 10:15 AM, Mathieu Dubois-Briand wrote:
>
>>=20
>> On Mon Jun 9, 2025 at 3:41 PM CEST, Dixit Parmar via
>> lists.openembedded.org wrote:
>>=20
>>> Kernel module specific oe test cases requires a test kernel
>>> module package to work with. Added selftest-hello-mod
>>> derived from meta-skeleton/recipes-kernel/hello-mod.
>>>=20
>>> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
>>> ---
>>=20
>> Thanks or your patch.
>>=20
>>=20
>>> +S =3D "${WORKDIR}/hello-mod"
>>=20
>> This will trigger an error if some patches in master-next are merged,
>> you can rebase on master-next to see the error. The hello-mod recipe of
>> meta-skeleton was also updated accordingly.
>
> Do you mean I should take the latest reference from master-next for the m=
eta-skeleton/hello-mod to meta-selftest?
>

All I can say for sure is we cannot take both the series from Alexander
and your patch as-is.

So as I believe the said series is likely to be merged, I would indeed
suggest to modify your patch accordingly, and this can be done by taking
the last version of meta-skeleton/hello-mod. But again, I'm not the one
deciding what gets merged, so I cannot be sure if and when it will be
merged.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


