Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A39CAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 15:54:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.1108.1757606044450267282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 08:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kvsRj5DE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B153D1A0984
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 15:54:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 884D860638;
	Thu, 11 Sep 2025 15:54:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8142102F29CE;
	Thu, 11 Sep 2025 17:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757606041; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7x4GXhaHzwSJvYC59g6YTBSI128JiaWXvsDjR+6B8Ak=;
	b=kvsRj5DEEPeVj5DUXM5X0FGcCJEldnrHKdj79+Ln5SGxN8+kawgCNZXYMS7/gMqumB9QEj
	LHxhwCF3wnF/nXM1kJ85Ab6TroxsSjCmUZOFKawXyd43bXtGNYo/Sh2qF28uORShfdWUu7
	WxroeoXVzN2JfDuJ2CkOftMKild0pU+EP/D4BP+gX6uwH/fTtZOSQBt7y/qHhsqRokaagc
	sSGV74e44bKyAjvG67qVu6krOcqqF9ZVUeWIUswjPT/hAf2uyTXTHSH8LDnNfH31MsTgfb
	+kFw3j+LwTfHtiCxVTDlRtceDgXLUGPFOmEj0jFaBeqyXr924awvzpTxfbzWHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 17:54:00 +0200
Message-Id: <DCQ3CC40D8Z3.3K5EL5BVFAGUT@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/3] libpng: upgrade 1.6.48 -> 1.6.50
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250722152701.1718859-1-skandigraun@gmail.com>
 <18549C5120596710.28644@lists.openembedded.org>
 <fbede54e-1365-4cf1-91d7-10d937e46439@gmail.com>
In-Reply-To: <fbede54e-1365-4cf1-91d7-10d937e46439@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 15:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223283

On Wed Sep 10, 2025 at 2:03 PM CEST, Gyorgy Sarvari via lists.openembedded.=
org wrote:
> Out of curiosity, did this patch only fell through the cracks and that's
> why it wasn't applied, or is there some issue with it?
>

I have no record of dropping these patches, so it might be we missed
them in the first place.

libmicrohttpd and libwebp got other update patches, but libpng still has
to be updated. I took the patch in my master-next branch this morning.

Thanks,
Mathieu

