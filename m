Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EB3C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 09:29:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.17171.1736933352462331383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 01:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jw+XEgs0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FE7140004;
	Wed, 15 Jan 2025 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736933350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+B6ZThOvWmptgdEqhbbCafZuOqkRsOxHOcsElx2rZs=;
	b=Jw+XEgs0+y6ElpVSKqtAcXiH1dZgSA8q0e/95f5RH7ZYqiS8DDOHdeSOBn0Ohn/4z/C8aU
	SAKansEHevuR8vWEj9/A5tysqFFxGqtTT9vFEUTpFw8b4A3aiNyynzaK2XkhqLXmDd3CDC
	0zpKRuemNwWb1XCZc8mNZq/NUFzWRULRnDIIfgqj/ypulaHibpN85uU0loA8mxKEnu4VYR
	TTuSRegH2qh4GAbwhti+3cjKjQQrRVlEhSaadayvfaLLJG/Y6WXwrujfG3F6b12zwnauGh
	pVYMY1e21Oyl9/HalCQNHJVr+4RX0uBAmMhVGFNij8slCsNhgiMMUS1Wk/HYOA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jan 2025 10:29:09 +0100
Message-Id: <D72JHH8CTDO7.9XFNG0WRIW9V@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Randy MacLeod" <randy.macleod@windriver.com>, <gavrosc@yahoo.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] Sanity test for cpp toolchain
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250113204447.14948-1-gavrosc.ref@yahoo.com>
 <20250113204447.14948-1-gavrosc@yahoo.com>
 <1a75199a-d831-42f1-b6d8-45edddbd2ad4@windriver.com>
In-Reply-To: <1a75199a-d831-42f1-b6d8-45edddbd2ad4@windriver.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 09:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209824

Hi Randy,

On Mon Jan 13, 2025 at 11:02 PM CET, Randy MacLeod wrote:
[...]
>> +
>> +        output_binary =3D cpp_file_name + ".out"
>> +        compile_command =3D ['g++', '-std=3Dc++17', cpp_file_name, '-o'=
, output_binary]
>
> Maybe use BUILD_CC here?
>
> Oddly, that variable isn't in the docs but BUILD_CC_ARCH is:
> https://docs.yoctoproject.org/ref-manual/variables.html#term-BUILD_CC_ARC=
H
>
> CC-ing Antonin to see if that's a bug.

Looks like a bug to me :) I've created one:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15719

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

