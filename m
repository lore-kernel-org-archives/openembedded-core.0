Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA4FFD530D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 07:50:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90507.1772178649791764153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 23:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dQCIzzs/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2A946C406A3
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 07:51:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 576CE5FE46;
	Fri, 27 Feb 2026 07:50:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A37C1036940B;
	Fri, 27 Feb 2026 08:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772178646; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=teqVYeeV9jyXmZDKSjDDLURPIY8272XQx5vys/Riaxk=;
	b=dQCIzzs/BmRUEjPLzxEojg1aN04Ue8k8DHjwRtaqICCgjyHQ1T0/+vvyApsstlkBLVTdz1
	56TGXnkOgDryJOdFRr+P6g7CLlSYfrToE7v25nhia9uReedCNT8Cg0tTh8+OudgPvld6kG
	eAAdHvumH1s0V7qumY5f5kLjfChtxLaIjAI5O6MU9ncr5LbLltW9V72jaIFdu93UhH9Mwv
	lcjPcNeXJDY6jU5DKxqu/dYQnXp+OJvz2zQtf+gH59UcSKSLA615UdMUcAx3E5CDFw1HtN
	7zNoub++DBKuMWDHbwHEQrXmOyQGKiLkOC+rSEKAk4JtFo8kVns1bXzM2zqzqg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 08:50:37 +0100
Message-Id: <DGPKWATSGOGC.3NYD1GJ1K9V98@bootlin.com>
To: <nilskruse97@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pseudo: Update to pull in fixes for undefined
 __NR_openat2 and SYS_openat2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260227064914.19315-1-nilskruse97@gmail.com>
In-Reply-To: <20260227064914.19315-1-nilskruse97@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 07:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232084

On Fri Feb 27, 2026 at 7:49 AM CET, Nils Kruse via lists.openembedded.org w=
rote:
> This fixes a compilation error on Ubuntu 20.04 hosts.
>
> Signed-off-by: Nils Kruse <nilskruse97@gmail.com>

Hi Nils,

Thanks for your patch, but I believe a similar patch was merged a few
days ago:

https://git.openembedded.org/openembedded-core/commit/?id=3De9a35f32b983de7=
24d2c2e436c017b49d5b70469

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


