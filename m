Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8802DEFCBD1
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 06:59:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44938.1773644332512256440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 23:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iRWbQ0NX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3F5E04E426C9;
	Mon, 16 Mar 2026 06:58:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDCA85FC4A;
	Mon, 16 Mar 2026 06:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B49210369B83;
	Mon, 16 Mar 2026 07:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773644329; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sL6AtUgQSd6cZMXZXlis66tsp6J5Bo5HP89w6qGwNkM=;
	b=iRWbQ0NXvzaMh123Zefbdgmom2p870TzC0c/6BWNRlhuOra1NU7bgJHt4M54+mf66Rntdt
	uMKv/AuQf1bwR/p7edhDG87mzjKM9QOWBeBHclXxVs25esrP1max+o0OroldI9qfb4ll+i
	FFnCnuMVDpXVjNfv2w241hoUVNIb0fOk0aSblCrwE4epzmwlLh+ondfC/Bp4ySQZVR7b9y
	rQHa4ULcuMIJa5Gs791I6Pmd+v3FlTOUjUDgrJBSjhV0U0iBq3LNxPohcuc/YoUnYpWklC
	iLIW9thmxndj//cakdi+E6TBRIJlBrnqrSa1ix5c8KMq1zgMDeS5TgeAIp+S8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 07:58:47 +0100
Message-Id: <DH40FVLW5UZ5.3UMAXI8AR29Y9@bootlin.com>
Subject: Re: [OE-core] [PATCH] externalsrc: fix duplicate entries in
 .git/info/exclude
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adityakurdunkar2@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260218225544.3523943-1-adityakurdunkar2@gmail.com>
 <411950.1773631917427006142@lists.openembedded.org>
In-Reply-To: <411950.1773631917427006142@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 06:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233213

On Mon Mar 16, 2026 at 4:31 AM CET, Aditya Kurdunkar via lists.openembedded=
.org wrote:
> Hi everyone,
> I=E2=80=99m new to contributing to the OpenEmbedded project. Could someon=
e please let me know the process for getting this patch reviewed?

Hi,

Your patch was already merged. Thanks for your patch!

https://git.openembedded.org/openembedded-core/commit/?id=3D4f96eaa0981b5d8=
8a90de7641150423c01543d58

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


