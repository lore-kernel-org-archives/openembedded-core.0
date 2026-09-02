Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE296C61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:56:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5807.1788328588308483822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pRMgbygc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EFFBA4E414BF;
	Wed,  2 Sep 2026 05:56:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B03336053C;
	Wed,  2 Sep 2026 05:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53DEE11C79266;
	Wed,  2 Sep 2026 07:56:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788328581; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sU3sRJCzqy8h2VlsjL/7kztsgiact3y4Huhq3rBbVac=;
	b=pRMgbygcAZojPCqGcN8OpfTEmM6EgKilZshHyOlr5y9zXHW+c2hFUtyJxOtEvjh2JMlZaH
	OGDQdyV+CpwtHvUgdPO7tcVdCMWx8I0qw7CRq54rfP9nm9CMMJOjMSL9/WbUjQ8iDlRl8K
	QyjxpXgIn6LSh7xw/4wRG5f0u7i+2JSvPUihAV8/eR54qnivcTeQvzU/NVvLooHZhror2V
	vtAo/HddG4UexU5jGCfMPqYzLwKmZJ4p/iVoJs2vxLr0bexQpUNdMikSe7UdGR5exI1erw
	KQcczLLnkQVa0m9o5UtJkbpjIvk5TX0p+WURLQ18iXANUPThSSa//o9BegWtiQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 07:56:09 +0200
Message-Id: <DL4LKJ7LE12H.ZX61VL1U1U66@bootlin.com>
Subject: Re: [OE-core] [PATCHv5] boost-asio: Add recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <gustali@axis.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260901083157.3345681-1-gustali@axis.com>
In-Reply-To: <20260901083157.3345681-1-gustali@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244887

On Tue Sep 1, 2026 at 10:31 AM CEST, Gustav Lindberg via lists.openembedded=
.org wrote:
> This is needed to build boost asio as a shared library rather than a
> header-only library, which is needed to save memory.
>
> Signed-off-by: Gustav Lindberg <gustali@axis.com>
> ---

Hi Gustav,

Thanks for the new version. This looks better on the tests, but you need
to add yourself as a maintainer in
meta/conf/distro/include/maintainers.inc.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


