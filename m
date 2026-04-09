Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC297E9DE6C
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:39:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127541.1775723940344401652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=t3w2zBTd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D8801A3230;
	Thu,  9 Apr 2026 08:38:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 336E25FDEB;
	Thu,  9 Apr 2026 08:38:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46F1F104500A8;
	Thu,  9 Apr 2026 10:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775723937; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5qr+c/TaztYGNXCoo9xHgaGw6MIqlzQ1f63NO9vvf+o=;
	b=t3w2zBTdhOcBb6UR+uP1UGluGOZdkwjcPSwBMqIYTPL42dJZ35G3QeFyAryC3wIpUCIw4M
	e92qdirva3L7E4MDdAirRqyHpteumklFohtzZg4gjc5x5HylsVe51Th6Zmh04cyp2jVSTr
	n0HKukU+c1n68IW1AeWlibaSeyigzNN+8zeDtVygLnqFL7NiP1tgn/z74WWZMvgkopYAr9
	VkvS2M4CphCcm/UbTMrUxe0DWXwqXu6l2XINenzNovkIqp5GekiAHv/TRcGhanoGj+rroS
	gT59Lplqk3UwDpTorVDGT8Tnty6UNneRAPguCfXiNAy1F+DJa5V0m3/au7Tv6w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 10:38:56 +0200
Message-Id: <DHOHLMLD4MQ9.34VQG7IIO7F3C@bootlin.com>
Subject: Re: [OE-core] [PATCH] weston: backport gl-shaders fix to avoid
 shader compiler crashes
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mangadi@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260407094759.3116923-1-mangadi@qti.qualcomm.com>
In-Reply-To: <20260407094759.3116923-1-mangadi@qti.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234894

On Tue Apr 7, 2026 at 11:47 AM CEST, Mahesh Angadi via lists.openembedded.o=
rg wrote:
> Some GPU shader compilers do not optimize away unused YUV shader
> uniforms, even when the associated code paths are unreachable. This can c=
ause
> Weston to hit assertion failures at runtime on non-Mesa platforms, despit=
e
> working correctly on Mesa-based drivers.
>
> Backport the upstream gl-shaders fix to restore stable behavior across
> GPU drivers.
>
> Signed-off-by: Mahesh Angadi <mangadi@qti.qualcomm.com>
> ---

Hi Mahesh,

I note this is breaking builds with meta-qcom, as the patch is also
present in there. But as you are the author of changes in both side, I
bet you already knew this. :)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/565

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


