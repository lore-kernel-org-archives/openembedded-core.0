Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C5EEDF04B
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 06:33:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39820.1770877993586354309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 22:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=s9JiBviP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 484F41A0E31
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 06:33:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EA1B606CA;
	Thu, 12 Feb 2026 06:33:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E78811971197;
	Thu, 12 Feb 2026 07:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770877990; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UHVsUDd+8LLgE/RF3ucj2+sBmcVNDtRapbYbfST2a5M=;
	b=s9JiBviPoacL+3RQNOBgG6ITH4PRu1OPoPWZ8W5ue9fsIaUuYjsoXxTtBD8tD8mKECr6zo
	UfAVoZw37/tqhLn5b9UfTAG4G85zZiCc+CFKtTTaXtvX9Y+VtzdP5JyXS6vQhjM+yKOKi0
	DmEndaetZSDasBwKb7xXzDT/0E4UawadZtgkgYMEHnrdw0TztREVQlGiE02kHEqvB9CYIF
	O1PSkcffbRueQ+CqzynEtn0ZVUeedH/Rtc4owsIV77paodyzfeKGG81a1pM1QUCaRL6jrF
	YJYegRsf09jTuH2LJIAIDLTaO31inP4gDWCoFvme70Avzwbn71d9Oq6U3gSu0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 07:33:08 +0100
Message-Id: <DGCRUT67DD3N.3MYY8B7AIFN54@bootlin.com>
Subject: Re: [OE-core] [meta][master][PATCH] libmd: add ptest for 'libmd'
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <nmjain23@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260123054425.3413000-1-namanj1@kpit.com>
 <CALCkg5apDM2hjHPiH1dN5+fE7bmDkkvh+9fW1AHMyNO6oB2B4A@mail.gmail.com>
In-Reply-To: <CALCkg5apDM2hjHPiH1dN5+fE7bmDkkvh+9fW1AHMyNO6oB2B4A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 06:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231013

On Thu Feb 12, 2026 at 6:18 AM CET, Naman Jain via lists.openembedded.org w=
rote:
> Hello,
> Can you please check it
>

Hi Naman,

This patch got merged a few days ago:

https://git.openembedded.org/openembedded-core/commit/?id=3D4c0a41389bdab30=
e3b349fef8df6ca0ef4893b89

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


