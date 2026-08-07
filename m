Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4781CC2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 15:44:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45342.1786117476989763968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 08:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=olNEjeGp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B59D14E4113F;
	Fri,  7 Aug 2026 15:44:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8459A603F0;
	Fri,  7 Aug 2026 15:44:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FBBA11C37AF3;
	Fri,  7 Aug 2026 17:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786117474; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D6uESmHsYpAqm9KR4IJ8aLs4pZiGe3X7revJLykff44=;
	b=olNEjeGpn+kjqIp4w/1S7FX966o8qyhXxmV7+rN6sCeRTA4TM62AQjfcgpYmc9A8cypl8H
	O+T7hm07YafL9QnNGX8ORitSmtL7bU0FXlILuk0OByby+mP/5S6LF6PL4GX9D/x9bdCPTS
	tEgSDgB1pHgK8rTV7xPzZedhDVSA9jXGRKWYRHqaGPgQM/S8ZVdmdL7sNFQjhSlAeSwCso
	AM4aeQaBwHRLgGuQywOkIQ9yQ2rNkRkuR7sqdGT3F5oMWB58EZxihWNCm1qa1QZ/Pudpr7
	Jok3+cKx/yfmtjcadTNitTFZrDu3eUTnQJn9WxA2XL1aqOoiRk32/1uOoI1Iyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 17:44:32 +0200
Message-Id: <DKITSV7NF7Z2.3PZ90BU6Y01O@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 13/14] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
 <20260804120034.378787-14-adrian.freihofer@siemens.com>
 <DKIT3XLETTWD.4QS3K7M6HPXE@bootlin.com>
 <08283607bf7d58c11af1c20c84e553c62150f511.camel@siemens.com>
In-Reply-To: <08283607bf7d58c11af1c20c84e553c62150f511.camel@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 15:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243016

On Fri Aug 7, 2026 at 5:17 PM CEST, Adrian Freihofer wrote:
>
> Hi Mathieu
>
> I hope this will fix it:
> https://lists.openembedded.org/g/openembedded-core/message/242995
>
> Regards,
> Adrian

Oh yes, it might fix it, thanks! Sorry, I haven't had time to look at today
patches so far.


