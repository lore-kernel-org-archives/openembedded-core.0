Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7726CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 17:10:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.38473.1761585006901797199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 10:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=itaunE5j;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2CE8C4E41373
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 17:10:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E12736062C;
	Mon, 27 Oct 2025 17:10:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41E21102F250C;
	Mon, 27 Oct 2025 18:10:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761585004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4GQkDuk2P8HMeRwCm/oneK/AZAAQFq/cNhW+VcJ85sw=;
	b=itaunE5jdLqx4raPd2sne665M+gyhYwxfIdJDtnZw+I+O0GTJA3Irs6MAPBaEAoG/Sj9pu
	BZYao20/pScugsCDoszJtzHjPwsyPECFin84Vm1QqVjLDXAt/DCCQIc9gZAZmbMeOrcJ4D
	TmbgSs3wVl5A6fddvadj88+Rgu5LEH3Jv7n8UHzgkGAPTv2/Uw3kbNvlNicr4oPdXidypf
	/Ug5x6gp4iMwb1VowIWOhQmuf5Y72Mgv/MQT7CzSO+G5M+Cp6AX+Kx1H0kg6CBuU831w9H
	uUjyFEF7N8RbgqyJeGrbLLh0HPlLCTByWPTisiW9D5i4P5boTregjWaopXdKqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 18:09:59 +0100
Message-Id: <DDT9RKMCRMIH.1SD6UWN350K3R@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] wic: add option to specify the diskid
Cc: "Ross Burton" <Ross.Burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Steffen Greber" <sgreber@lilafast.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251027144643.102409-1-sgreber@lilafast.org>
In-Reply-To: <20251027144643.102409-1-sgreber@lilafast.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 17:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225339

On Mon Oct 27, 2025 at 3:46 PM CET, Steffen Greber wrote:
> This adds a feature to specify the disk ID when creating a disk with
> the wic tool. This is useful when using the DOS partition scheme and
> booting with root=3DPARTUUID=3D<partuuid>. In DOS partitions, the partiti=
on
> ID is <diskid>-<partition-number>, so it makes sense to let the user
> define the disk ID.
>
> You can specify it in the kickstart file using the --diskid argument
> to the bootloader command. The value can be given in decimal or
> hexadecimal format (e.g. 3735928559 or 0xdeadbeef). If omitted, the
> previous behaviour does not change.
>
> Signed-off-by: Steffen Greber <sgreber@lilafast.org>
>
> Add WIC tests and support setting GPT diskid
>
> Add unit tests for wic.py to cover previous patch review.
> Also extend implementation to allow defining the diskid for GPT partition=
s.
>
> CC: Ross Burton <Ross.Burton@arm.com>
> Signed-off-by: Steffen Greber <sgreber@lilafast.org>
> ---

Hi Steffen,

Thanks for the v2, but it looks like the v1 was merged. Can you rebase
on master and make a separate patch for tests and GPT partitions
handling?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


