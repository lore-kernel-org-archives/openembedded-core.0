Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222E9D3F097
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 16:44:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1991.1769618679522727271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 08:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HB5MFxdX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 47ADD4E422FB
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 16:44:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CE1A6071F;
	Wed, 28 Jan 2026 16:44:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09FE0119A8687;
	Wed, 28 Jan 2026 17:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769618676; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F8dbhBY15EYUN1JxpcXpginYXgG9xjKLphs8jSz66lo=;
	b=HB5MFxdX3zxsvjGVbRkVCw6+oBnmQ0VS7gUJXBSCjWkKvMiXrrHzQVzuPdzrPw311oU7aT
	1HTLxh985/lhqqkhT1s2/7GTP7VVk+7xmN6nsWzUtUv4Re8YUF9GdW8IRK+1jax6raqmTC
	lwHTeHfAb5zrdsMdgZMwkFUjSoRo0lAGs2/kAqybVcj4myaksptm3ltuoDa45ybr3xjCPG
	ITcD5wPwPE2HDQUn5hA3L2sU4Y0ODnClGlGn2OwYEi6+sy8ziKi0rzs3AtYfehF1hd0xCh
	2ER48cXt5ntrW4+/eTAVz+lrFetrxDBq1L6i73kzTHm01afdkilBqCmT7pO2Fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 17:44:35 +0100
Message-Id: <DG0DGSLH43T6.27SQHKZ8XUB43@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260126123844.1052-1-wangmy@fujitsu.com>
 <20260126123844.1052-5-wangmy@fujitsu.com>
In-Reply-To: <20260126123844.1052-5-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 16:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230104

On Mon Jan 26, 2026 at 1:38 PM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

It looks like we also have a failing ptest with this one. I'm not sure
why id didn't show on my previous builds, either it is linked with other
commits or it's a bit intermittent.

Failed ptests:
{'python3-wheel': ['tests/test_metadata.py:test_pkginfo_to_metadata']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1004
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2963

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


