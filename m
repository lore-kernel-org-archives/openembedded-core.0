Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7BED132D6
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:42:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.59078.1730731333215442824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 06:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rw+WMY+y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD1AB1C0014;
	Mon,  4 Nov 2024 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730731331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pz1Y0Dq7iwe478q+fFlxzmE3NHs0NA1cXM0U1dQRTg=;
	b=Rw+WMY+ykgmlvLjUKG6Bd4onLcj1uaHXeq/62eIEDwzO5nM/c39uUilRPiTVT37O6Lz2jM
	ddz7dy8+qOLfJLLPDsViPOBDenpXbffzKQSTR4rXYznlIIUE3OUUQuDJY7vVorQ0CcMe3h
	bZ7wd9N6WsTBWkHAktbOfezSj5OS9lNU8b/15hAyQKm/p2hOmvG8DQgo3GAS7bU2fcaJJp
	PkfUKLyrah6Z4GsWBHTRT5LtUoIF1RlCNUT/h1jG9q5EiSnOIB6EOdQCT8uthr0NhA/Li3
	c5DCfTl632rbKFsyUssl/NzynH3+QhOO3trIMF/l/hebGCCf/GefdWAOcUvnJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 15:42:10 +0100
Message-Id: <D5DH1WX0YPB5.1HGW4MP6F3QTB@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
In-Reply-To: <20241023120839.437771-1-mikko.rapeli@linaro.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 14:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206683

Hi Mikko,

On Wed Oct 23, 2024 at 2:08 PM CEST, Mikko Rapeli wrote:
> These changes enable building systemd uki images which combine
> kernel, kernel command line, initrd and possibly signatures to
> a single UEFI binary. This binary can be booted with UEFI firmware
> and systemd-boot. No grub is needed and UEFI firmware and/or
> systemd-boot provide possibilities for boot menus.
> The uki binary can also be signed for UEFI secure boot
> so the secure boot extends from firmware to kernel and initrd.
> Binding secure boot to full userspace is then easier since for example
> kernel command line and initrd contain the support needed to mount
> encrypted dm-verity etc partitions, and/or create partitions on demand
> with systemd-repart using device specific TPM devices for encryption.

Now that this class has made it into master, we need to document it in
https://git.yoctoproject.org/yocto-docs. Would you be able to help writing =
some
documentation about this class and the related variables it defines? It wou=
ld
need to be part of documentation/ref-manual/classes.rst, and the variables =
would
need to be documented in documentation/ref-manual/variables.rst.

Regards,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

