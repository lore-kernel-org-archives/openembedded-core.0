Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFFECA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 06:31:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.39682.1757572298596230188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 23:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sFc8VC+K;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AF7221A0D55
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 06:31:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7750E606BB;
	Thu, 11 Sep 2025 06:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96C8C102F2A07;
	Thu, 11 Sep 2025 08:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757572296; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XHIHrHqsgI9UqH8kwn5cX3govD33hndkQ5Wt9iHf6dw=;
	b=sFc8VC+KQkIXNZZuHLPB0oCu8AH3cXrGZWwpVoWvE+a5r5RVy13Y6/x0phbNPiDHkHLwsq
	CSHOETIe/wGamarT8DM8IJwuUP59CH5SP7zun3B3Fi0trREmFy2/CjHBlWcrZJsHhTAy8/
	Gp2OY/Yn+UynfhBY3ZjrGudj9vE2sqYNRlV2ib3rAieYtXpBamE+/uVoQjQ1iFHZdmVPY4
	Qn9TZ7M5Wy6M3l8upJynW2+x4loSuXnf1JlDWzYqHFxWIPjBvI8A4W98aJh1RrdwAVxCgQ
	xeIMP0rTFrKWd5Tn3bpieLDq09Y6x0Mq8g8qUfYMwYXTbp84Yu/l9nOalZ0lmQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 08:31:26 +0200
Message-Id: <DCPRDM0BB7WS.1HR2FA1OV8AJ3@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 39/40] tcl8: upgrade 8.6.16 -> 8.6.17
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250910091646.998-1-wangmy@fujitsu.com>
 <20250910091646.998-39-wangmy@fujitsu.com>
In-Reply-To: <20250910091646.998-39-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 06:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223246

On Wed Sep 10, 2025 at 11:16 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the update, but this is causing ptest failures:

Failed ptests:
{'tcl8': ['cmdAH.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2227
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2267

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250910-103/testresults/qemuarm6=
4-ptest/core-image-ptest-tcl8/
https://valkyrie.yocto.io/pub/non-release/20250910-103/testresults/qemux86-=
64-ptest/core-image-ptest-tcl8/

We already had a similar error a few days ago:
https://lists.openembedded.org/g/openembedded-core/message/223053?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2Ctcl8%2C20%2C2%2C0%2C115078011.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


