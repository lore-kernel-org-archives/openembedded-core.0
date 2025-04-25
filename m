Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830E1C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:55:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.5869.1745585721826066445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o6ZnD/8p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45BBB41CFD;
	Fri, 25 Apr 2025 12:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745585719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4w6Ie8mKWZGM+xaXln9Nyopf1JWjF9X8axuzlHHbic=;
	b=o6ZnD/8p1WvUi3KfaLRQr9OYGwU+zGlzU7tVMQl/KBeuNsRJeYX4KDHvecSp0bXj5o2UUn
	cn9qyS+lmu6Yp6AUwl95iRgY46seCZ2KmHUDplLkTQ0BmIrCRIvt2vqkN3afDvWbMF5lNW
	XAG476slV7rS5soY7/T9OZChUhc3I5kE85AkVZjfq8aLrFbioOeY4TqS2R5WF6sqn6pfHo
	X1+aZxnkRlqefUUBxMqfxaFXWqlFNLfced4Kv1WThcr4yTrxFvFZO2LLk3hETMSE9YJqpF
	gI3zd2QHGSceQ5VGfeQgWqz06BwvPtmSIKD7W/XXlVZHZq6KRUGVuwUY8uHMaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 14:55:18 +0200
Message-Id: <D9FQHSM6H94V.3JOM4K3FAOS0I@bootlin.com>
Subject: Re: [oe-core][scarthgap][PATCH 2/3] perlcross: 1.6.1 -> 1.6.2
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <archana.polampalli@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250425121803.767765-1-archana.polampalli@windriver.com>
 <20250425121803.767765-2-archana.polampalli@windriver.com>
In-Reply-To: <20250425121803.767765-2-archana.polampalli@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggffhudetgfejteevledutdefheffffdviedtueeitdetueeuieelfeekgeelieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrrhgthhgrnhgrrdhpohhlrghmphgrlhhlihesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguu
 ggvugdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 12:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215472

Hi Archana,

On Fri Apr 25, 2025 at 2:18 PM CEST, Archana via lists.openembedded.org Pol=
ampalli wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> https://github.com/arsv/perl-cross/releases/tag/1.6.2
>
> Provide support for Perl 5.38.4
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../perl-cross/{perlcross_1.6.bb =3D> perlcross_1.6.2.bb}         | 2 +-

Small thing but the update is from 1.6 to 1.6.2, not 1.6.1 to 1.6.2 as writ=
ten
in the subject.

Antonin

