Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1374D4920F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 11:10:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.38509.1731928235186838988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 03:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WdQxnmTj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4445820005;
	Mon, 18 Nov 2024 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731928233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0f9UwgO7ZAFzS76jjP+nyK3013tMnrZGH/ax6aNvvYk=;
	b=WdQxnmTjIkQUZ7NgyFRJxQ6c9N7P7z5G1AK8GiQvI0b36eYQfKBlvuOgJDyRlsUG0bRT5B
	PRkGlgUE4Q/mByTBc/BBIH6+lbD19zcPSyE5jy/j2gVHqXxRiCgWEf3L+ej7NwWgdFpXGO
	9U4nUGbMUeKKRLAsk7RxckZz3dVkTyGbi4o6KmMI+RMWsjHh9wqJ2W3ikrWQB5vPctJZgu
	1onuOWvsGkqwqCQAXlTuEVnyAOsPZ+9sog3LAploppKX7qa3X8JiuUaitfMMZWVURhvu4x
	ejhOyr3LkJhLSIM7XRsuVRVqNfBkK1hZi02j5YqzUgIHsipszeskTAewyFTITQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Nov 2024 12:10:32 +0100
Message-Id: <D5P9BIC4N8KQ.1611HVEGS7JKC@bootlin.com>
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
Cc: <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
 <D5DH1WX0YPB5.1HGW4MP6F3QTB@bootlin.com> <ZyjeOcX6A5n5DHhB@nuoska>
In-Reply-To: <ZyjeOcX6A5n5DHhB@nuoska>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 11:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207214

Hi Mikko,

On Mon Nov 4, 2024 at 3:46 PM CET, Mikko Rapeli wrote:
[...]
>> Now that this class has made it into master, we need to document it in
>> https://git.yoctoproject.org/yocto-docs. Would you be able to help writi=
ng some
>> documentation about this class and the related variables it defines? It =
would
>> need to be part of documentation/ref-manual/classes.rst, and the variabl=
es would
>> need to be documented in documentation/ref-manual/variables.rst.
>
> Sure, on my todo. Feel free to send something if I don't get into it in
> time. Struggling with some trivialities currently: rm_work wiping rootfs
> and wic creating and empty rootfs instead, breaking builds and tests
> and hindering debugging...

I've created a bug to track the missing doc bits:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15650

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

