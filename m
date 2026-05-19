Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B285CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:24:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21045.1779197035923029043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 06:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mdzj8IWg;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CE7DEC2B9E9
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 13:24:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 720095FFC8;
	Tue, 19 May 2026 13:23:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0785A107E8FC9;
	Tue, 19 May 2026 15:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779197032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+8xFs3BIx1mMQODMdIxPev8qxh3d8Tkr6H0YoFmkBeg=;
	b=mdzj8IWgu0ecPOtBWgCvwULLEco0b9wqkmUC3oYc3lPQpsiA8UO9lbFwGcsLpfdM/wGKr5
	u+wFyXLTTal5iR0VBDxaz0RacHv6+BgS+QnURZxjERt++5Ay9oKT2MrQ/5x95MEpBqqAlJ
	DS9BUpcStunpNeWXTMM40Hb+awaPAE3T21h+rZtWlhxt4Rzp1KodoQLYDRFutGM+6cGb1J
	NelM47kQahbwWnS74GMLIyHPkXba3gFOCSumMryHI+w5e0OjKIJwpuLwPyOXiNUMhTocdj
	5il+WEYzmQuOOXs3wQ52LTVIc5V7h8ON0Y7JNtP9q370wDhNECz5msA8o/JS0g==
Message-ID: <ebbc77ff-d617-4949-9f9c-f83715176182@bootlin.com>
Date: Tue, 19 May 2026 15:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/1] u-boot-tools: drop yaml in DT validation
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
 quentin.schulz@cherry.de, marek.vasut@mailbox.org, festevam@gmail.com,
 khem.raj@oss.qualcomm.com, ricardo.salveti@oss.qualcomm.com
References: <20260429180631.170081-1-joaomarcos.costa@bootlin.com>
 <CAA_5yovdT5_WHP4mTR3ZMP3xodPQfsw1z5wH98vSrBwMWhZwwQ@mail.gmail.com>
 <4533420d-afdf-4d10-a5cb-3e111d96e2d4@rootcommit.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <4533420d-afdf-4d10-a5cb-3e111d96e2d4@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 13:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237323

Hello,

On 5/18/26 21:12, Michael Opdenacker wrote:
> Hi Jo=C3=A3o Marcos
>=20
> FYI, building the "qemuriscv64" machine is still broken on OE-core=20
> (master), and it's seems likely to be related to this change;
(...)

I just checked-out on master, and I don't have this linking issue. Could=20
you please share your 'Build configuration' so I can try to reproduce it?

P.S.: Regardless of reproducing or not, we still need the fix in=20
u-boot-tools' recipe.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

