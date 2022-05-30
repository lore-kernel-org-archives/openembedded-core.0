Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5C3C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 20:41:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41429.1653943275685143968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 13:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dDArlo3Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 408D3FF808;
	Mon, 30 May 2022 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653943273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsAHdbWp4x6jSt6XEQ50vQoJwee8HX/znDbRT31AtGk=;
	b=dDArlo3QZTKAoYmVh7B6yeEKrOvborQ9xLy8Xvtxi7Fi9fH82ssfbdGFoxZJn3/KopJgEG
	ZGj5f10aG8iIdaNHiyTx8erKPKpgXbOSfjEgwKLfdaUIkv3jX5huabWmznaKzbjA+iiks2
	f1avgg2qW8KagLk2bzKN5aaMfI9QBuZWaUFauv6XV+7vSLm8PcxQtYrqEej9fECg8oEfIB
	czlNpCkT0EA9fd/IFLcT/5d9eGQWIcAp0zRwp92oXxEA4+/sBE+fqc3W9WP1DewQJzmS9q
	C9IF3gg1evqeQOcD1Opb6fIElW4v2zmG8CJNMO5hdJ/9C+MBP4AAxx6Fy1EQwA==
Date: Mon, 30 May 2022 22:41:11 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Simone Weiss" <simone.weiss@elektrobit.com>
Cc: <openembedded-core@lists.openembedded.org>, Kai Tomerius
 <kai.tomerius@elektrobit.com>
Subject: Re: [OE-core] [PATCH] json-c: Add ptest for json-c
Message-ID: <20220530224111.7ac1b7d4@melee>
In-Reply-To: 
 <5e05e3aa-6b3f-44b1-85d1-8cd220310306@denue6es010.ebgroup.elektrobit.com>
References: 
 <5e05e3aa-6b3f-44b1-85d1-8cd220310306@denue6es010.ebgroup.elektrobit.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 20:41:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166298

Hi Simone,

Il giorno Mon, 30 May 2022 11:47:45 +0200
"Simone Weiss" <simone.weiss@elektrobit.com> ha scritto:

> Also add a script for executing the ptests. All tests were sucessful on a=
 trial
> run. Also add a small script for running the tests.
>=20
> Signed-off-by: Simone Wei=C3=9F <simone.weiss@elektrobit.com>
> Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>

This patch causes reproducibility build failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/936/step=
s/12/logs/stdio

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

