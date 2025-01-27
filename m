Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F487C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 13:19:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.51044.1737983932337273748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 05:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H9Q+DaRM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13A7320004;
	Mon, 27 Jan 2025 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737983930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRiNAHtjvShlxGHh4G4T+4RuTq8ssvAFOqKBRqQYffg=;
	b=H9Q+DaRMdgWr8pGMT9hfqj3j07AhtGPxQgGKqWDlFDqmiJ1O92M3GAbHnalsNS9VMSZ1Sp
	wEcPSvA8USjS1BN3aHT4dx70GI6Sy3Ze0IyvGlNFp+cn/yoTgwH1BnjIdbk4wOsPCDbNsO
	49+HLhQXCUI5U4lZ6xgqUGRj/Xk3JX6S2RWwdquWpu3/TVe7xGfSKT5DDmTWidX/amVBW5
	iHBhPFauJCFkhpCKqSMLDOqouNlWfMGs6Cc1gOF9HvgKeauFMUyggcIlcgNaYb+fV85nEZ
	v92Ni4sYJ+JG1Mzq9STBwxjIOjmM6pJQOdS4LR7usfJ81pzuPRqBtvi0Sc9GBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 14:18:49 +0100
Message-Id: <D7CVVUWKCUBH.2D7PHFAS6DW4Q@bootlin.com>
Cc: "Joshua Watt" <jpewhacker@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/9] multilib_header.bbclass: need multilib
 headers for nativesdk builds
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
 <20250121085526.1370937-2-hongxu.jia@windriver.com>
In-Reply-To: <20250121085526.1370937-2-hongxu.jia@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 13:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210299

On Tue Jan 21, 2025 at 9:55 AM CET, hongxu via lists.openembedded.org wrote=
:
> The nativesdk multilib support required it to fix multilib headers
> conflict
>
> [ YOCTO #15722 ]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi,

I forgot to mention this last week, but it seems this patch is breaking
builds with meta-mingw.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/914/steps=
/12/logs/stdio

Maybe this is something to fix in meta-mingw directly, but I'm not sure
about what cause this issue.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


