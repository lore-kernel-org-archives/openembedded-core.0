Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A67FD5F87
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 07:46:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.101295.1775634407212919479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 00:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zTW/H7Za;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D6604E42949;
	Wed,  8 Apr 2026 07:46:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE4CE603CB;
	Wed,  8 Apr 2026 07:46:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0D17104503D0;
	Wed,  8 Apr 2026 09:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775634404; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=12O9Eay2nFCeDFrbHoX/H4t7Bzc1b8JMUR12zqQaD+U=;
	b=zTW/H7ZaXbnHYHFKIjFQiyIj26mIGu1UsAAonpcfV3LToPPobkqYox2DCoQUxPR8TLpCAE
	G0OBXW8g4hTiIrUk/yilVY1H/diFZ62eSAhx6VVIxzKvSJ1b6cMf95G3LGylH6h8UCTd13
	cG5jqmLbcvwHagwRBmW68VVu5sw/lb5vdpXTB4yALsny6Bevueh0Jc6exRAUiIV3EjYj0E
	4lJTK4+Wcuu9tCtJKtBth6UYFWk3+juCU3ZmBbrRzWmVwd9BBB6ddwyffydiJMKt/gLaS8
	q21WcF7XkUqnu2udDbhN5/XRdQ2S24QKtJsL9ns2SooPTqSZ6mDigUEb6qAZgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 09:46:43 +0200
Message-Id: <DHNLV3RUPLQ2.ZM318N1MHTL7@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv2 01/10] gst-devtools: upgrade 1.26.9 ->
 1.28.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260408032023.1810147-1-pkj@axis.com>
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 07:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234817

On Wed Apr 8, 2026 at 5:20 AM CEST, Peter Kjellerstedt via lists.openembedd=
ed.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>

Hi Peter,

So after yesterday talk, I thought the idea was to switch to 1.28.1. Am
I wrong? Also, 1.28.2 was released yesterday.

https://gstreamer.freedesktop.org/releases/1.28/#1.28.2

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


