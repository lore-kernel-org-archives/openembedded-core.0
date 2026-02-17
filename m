Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD80EE68148
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 08:51:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8104.1771318270886471266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 00:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NxgTARLu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC4C11A1034
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 08:51:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA0B4606D1;
	Tue, 17 Feb 2026 08:51:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B30F103688B3;
	Tue, 17 Feb 2026 09:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771318268; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gpe1xf080al5kaZVuOGQcrEGRbGgCR0mdTl/bxB7tOk=;
	b=NxgTARLuXTruB2YKnFP7OVQY1Rtmye5o+H3cp8YMipCpJMNZk0io3dYp02w40gw9HSkfrb
	EuVQOzT/mGwkN7bJ5P0vQ3Mlpjjpm2sgKQkViMzjUoWaJmYRZfGSX8ESdxj+4pHmwhCtnE
	gJ9a0psLen7xjhf+9V4tSmMwXXLHMf8lagDKfkk+ETaQJ7c8fx6fsVCt/Rl/Rw8o3hz9tH
	gTtEuCJgv4IaslZLcLbOGJs7q9rez2zQ2mQ2K/0jELAP7EVnIZIU71KLNa8S9g46VOzI6b
	7affeA8H2bGqVhdDCLwSQwWJGVxsbXQ+WuGGgIfyVRFKIQfJUCS8yyhqzEmOFg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 09:51:06 +0100
Message-Id: <DGH3X63VQ28Q.3SWTIURXLCY6X@bootlin.com>
Subject: Re: [OE-core][master][PATCH v4] python3-pip: Backport fix
 CVE-2026-1703
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260213143222.102757-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260213143222.102757-1-adarsh.jagadish.kamini@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 08:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231230

On Fri Feb 13, 2026 at 3:32 PM CET, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch. However python3-pip was recently upgraded to
version 26.0 which includes this fix.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


