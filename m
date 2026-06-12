Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738B0CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 07:23:21 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65211.1781248996152768199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 00:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=s90BPSOX;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E3384C49F73
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:23:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18A1060012;
	Fri, 12 Jun 2026 07:23:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 451E1106C8513;
	Fri, 12 Jun 2026 09:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781248993; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S21hwCzHjxCzBYgF+aPlmuzlBe5x9b9akUFiWDdbp60=;
	b=s90BPSOXkYZzbBnNa8DD2g3aRyAGRTaFnPOKzDFI61gLF/nJ133H9GygSqnDnioOxdRmql
	b7c3NgZwmVj+Lz13EAFdgDR28bvJASNks8bslXIfTrmaxNaWFUU4dG/UIxPWy5o53tZ6QD
	0eT4eyK4dW0YdA20dxiSeOEL0rP9JX6/XyFjv07lJq4mh01d+GJQwA9xrg27+zGiB7aF+P
	ELJTMmqfS/vR25PROS5eEYxglz8LGbPfmupALFMnNLtGKdV2fQqcIfJTovdLpBpFsOYJ8u
	deaJxy3lM9vF6tGWwswipxQ0apPeI9pbgw+BzMDvAr08yED3O1NLHbNGvvIY1g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 09:23:12 +0200
Message-Id: <DJ6W2INPGLFC.31QDXLJHDF9IZ@bootlin.com>
Subject: Re: [OE-core] [meta][scarthgap][PATCH] tiff: fix CVE-2026-4775
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <nmjain23@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612034133.804411-1-namanj1@kpit.com>
 <DJ6W1TADIW9X.ZVL79ILEM8U@bootlin.com>
In-Reply-To: <DJ6W1TADIW9X.ZVL79ILEM8U@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238593

On Fri Jun 12, 2026 at 9:22 AM CEST, Mathieu Dubois-Briand wrote:
> On Fri Jun 12, 2026 at 5:41 AM CEST, Naman Jain via lists.openembedded.or=
g wrote:
>> Fix CVE-2026-4775
>>
>> Reference: https://gitlab.com/libtiff/libtiff/-/commit/782a11d6b5b61c6dc=
21e714950a4af5bf89f023c
>>
>> Signed-off-by: Naman Jain <namanj1@kpit.com>
>> ---
>
> Hi Naman,
>
> Thanks for your patch, but we already have this CVE backport in the
> master branch. Was this meant to target a stable branch?
>
> Thanks,
> Mathieu

Hum, looks like I have a bad morning, sorry. Your patch is clearly
targeting scarthgap.

Sorry for the noise,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


