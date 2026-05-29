Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE201CD5BD2
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 07:02:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4923.1780038121732548874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 00:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Wp6QaVFo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C39CD4E42D7D;
	Fri, 29 May 2026 07:01:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9913C601FA;
	Fri, 29 May 2026 07:01:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B734A10888CB3;
	Fri, 29 May 2026 09:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780038119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pnUvCu6YPzPQ7IiisP8Pl/ts31PqtPrpPjIOqr9oV+Y=;
	b=Wp6QaVFoBg4i97mrr513gaVdsfSsObtyMhxY+iIXx/E55ojbraXsnFBIYGLT7s404yvTbg
	/hkbEbPryF/1AgZuvZkyOGgq0TR2NbQKMQRYV268ZILTI3clCCKI39MhSB5Pip+BTNVff/
	v03RjnZcb9DBW0RPCLzGs4/v6pIz9oIkx+LeHUR7g+PikXn7CHFbFvMKidpnJ7CxXT53Xw
	6cfg4LjufZNUgXWmNEJmaXbV6AelDLKRvU5EdxAR2ph7JPtss9JxY+adW9v5xJtk/PVqFg
	acz5RE1SXad4EzxtvZgUevavGpl/4U3KMCjhu0bkVJIBMnh49pHUAh/PvG9jnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 09:01:55 +0200
Message-Id: <DIUYUL35MIBC.28DFKH9L53KYC@bootlin.com>
Subject: Re: [OE-core] [PATCH] bluez5: add patch to fix 8.56 gatt cache
 issue
Cc: <shuai.zhang@oss.qualcomm.com>, <cheng.jiang@oss.qualcomm.com>,
 <chezhou@qti.qualcomm.com>, <wei.deng@oss.qualcomm.com>,
 <yiboz@qti.qualcomm.com>, <jinwang.li@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mengshi.wu@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260521062216.3352030-1-mengshi.wu@oss.qualcomm.com>
 <20f1b74e-69df-4f4e-8adc-bafcae25dfbf@oss.qualcomm.com>
In-Reply-To: <20f1b74e-69df-4f4e-8adc-bafcae25dfbf@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 07:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237745

On Fri May 29, 2026 at 6:06 AM CEST, Mengshi Wu via lists.openembedded.org =
wrote:
> Dear maintainers,
>
> Please help review this patch. Sorry for bothering. Thanks
>
> On 5/21/2026 2:22 PM, Mengshi Wu wrote:

Hi,

This mail is not in my inbox, and it looks like it never reached the
mailing-list:
https://lore.kernel.org/openembedded-core/?q=3Dbluez5%3A+add+patch+to+fix+8=
.56+gatt+cache+issue

Can you try to send it again?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


