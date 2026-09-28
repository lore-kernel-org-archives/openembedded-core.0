Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0335BCA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:29:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61319.1790609369207130546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 08:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TEDh7nG8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D69DD4E4109A;
	Mon, 28 Sep 2026 15:29:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB857601BD;
	Mon, 28 Sep 2026 15:29:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54A6F103290CA;
	Mon, 28 Sep 2026 17:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790609362; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=de/oOzuinUrFRySETwhEh6sq/pBIx9je1gVL7wxmxIg=;
	b=TEDh7nG8tg5oVA960SbP6UMXApue8tVlb4X3hkzJ64e2BFI20CR2zUa9UeRvbW8QPV5Ga4
	cmHafhEXHLQqIlxoxXQiMoQp38eCdw1uS0zgLXEhQ1+okvJANdSOije5ynUB0OUFzBI/3M
	UvBDsDhvn86H9tRR6OlAz3/L/BoaKE3iw4Bo3m/x0T/xgGsft5bxD5Z4LsGEL694FsHAbq
	xDAGfzr4W98+dKUb25uwtLFuXhUaS49FNNABiJyAv0UwXJP/LgzbTsa8pBFnX/UWRXCp4b
	Xyugds0vcBIuCSwaaC5AqkNxBhFjJMw2iXLus5ZWLvbVMfiEgAN0Mb81RqLwIQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 17:29:20 +0200
Message-Id: <DLR21K924L92.2B1TSJTMIOZ29@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/9] openssh: set status for CVE-2026-55655
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260927193609.359250-1-peter.marko@siemens.com>
 <20260927193609.359250-6-peter.marko@siemens.com>
In-Reply-To: <20260927193609.359250-6-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 15:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246772

On Sun Sep 27, 2026 at 9:36 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Per [1] and [2] this this is only problem in RedHet patches.

Small typo on RedHat, but it's probably not worth a new version just for
that.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


