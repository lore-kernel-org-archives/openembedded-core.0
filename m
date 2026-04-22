Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C18F94CCB
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:02:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71294.1776837727087280468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 23:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Nlto870O;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9DFF94E42AA2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:02:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64D5F600DD;
	Wed, 22 Apr 2026 06:02:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A583E10460AEA;
	Wed, 22 Apr 2026 08:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776837723; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x5CgusfYEQoCYJGAbdcEngvxihV33YjK3E8pwFIsyDI=;
	b=Nlto870OcmCCbr2UeecRiPjS38TOjoUaAwYfono+jHexpeJLGf2oV1qwSZD2k7EwUjsBYf
	U75Vjjl9KV73MLzcyRmXdl2wPeoCg5dl1akJVziWfZc97ZY+5BU/XWzZZ5804r8eeK+cXY
	/Pr33pyVNXbysUZw0PV5PpL9fhph4xxLpmcw4eYN5po20Bjk8gwOyIzogNdhW7AR3J1D0i
	UbcgdIzVX92/Ue9Bz1MsxORH+q1ImBORck5fTPcDo9wy57i/6CqiTlfC0p5EopbuSpsl/B
	09LLZ33kBhDL0p9+N1zUR+NaS2SENowEGch/vGpiADlEhbfmxcTe7PIRqumW7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 08:02:00 +0200
Message-Id: <DHZGEJZFTQCM.37ZC8I2SFYAJ9@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 46/49] u-boot: upgrade 2026.01 -> 2026.04
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260421095559.1856-1-wangmy@fujitsu.com>
 <20260421095559.1856-46-wangmy@fujitsu.com>
In-Reply-To: <20260421095559.1856-46-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235692

On Tue Apr 21, 2026 at 11:55 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch.

You will need to drop or refresh the CVE-2026-33243.patch patch from the
u-boot recipe:

ERROR: u-boot-1_2026.04-r0 do_patch: Applying patch '/srv/pokybuild/yocto-w=
orker/qemuriscv64/build/layers/openembedded-core/meta/recipes-bsp/u-boot/fi=
les/CVE-2026-33243.patch' on target directory '/srv/pokybuild/yocto-worker/=
qemuriscv64/build/build/tmp/work/qemuriscv64-poky-linux/u-boot/2026.04/sour=
ces/u-boot-2026.04'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1439
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3713
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/3628
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3649

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


