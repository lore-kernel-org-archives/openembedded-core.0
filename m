Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEA21125811
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 17:44:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2262.1773251038120772885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 10:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=N7RxfJ2B;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E3DE04E42627
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 17:43:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FF1F60004;
	Wed, 11 Mar 2026 17:43:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2FE51036921C;
	Wed, 11 Mar 2026 18:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773251035; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z7B7joV18ljt83UMJ4hCNLyyaBH2pSMWCKOQEiT2L2M=;
	b=N7RxfJ2BLZOYnT0gSQCaFA1R32ZrUpb7kEK3Ja1JctOtlfjyaRlh5FeOxMlJ7echvgyF3b
	drCul+Y8rCzFw8+qJJU9TDd/PgjXDpGRXrjfgM2I8EcWaaw5LWWF9elY8CQCRLAzxXitfK
	MxtBUbaaiHo433aJXj4Wv8af09Qrc7C0vhj3kCJ+KkTBaO0drC2tKi1Qd9byXuNq7Z7MXy
	xayQYM1pKCs3xDkDS5ag1HE4ky4JXlbOcvW+T25RnitCmEHD+5Po7O0fesS75Ds0yuGXXy
	O7EuM/zckuZasCptM1F4PKHSX/rCHXClkEp9eKeENOyqMj+MYOknH8ln+XaXuQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 18:43:51 +0100
Message-Id: <DH0511XM7D7D.9MO7RMV68IAQ@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/6] glibc: Upgrade to 2.43 release
Cc: <Sundeep.Kokkonda@windriver.com>, <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
 <DGZZWPDHTXLA.21EF97RXLFL6F@bootlin.com>
In-Reply-To: <DGZZWPDHTXLA.21EF97RXLFL6F@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 17:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232898

On Wed Mar 11, 2026 at 2:43 PM CET, Mathieu Dubois-Briand wrote:
> We also have this busybox ptest failure, only on arm64. I suspect it is
> related to this series, but I will launch a build to confirm.
>
> Failed ptests:
> {'busybox': ['printf_understands_%s_\'"x\'_"\'y"_"\'zTAIL"',
>              'printf_handles_positive_numbers_for_%f']}
>
> https://valkyrie.yocto.io/pub/non-release/20260311-60/testresults/qemuarm=
64-ptest/core-image-ptest-busybox/
>
> Thanks,
> Mathieu

I confirm the issue is gone after dropping this series, so the busybox
ptest failure is probably related to the glibc upgrade.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


