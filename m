Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65DACD3424
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 04:48:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11382.1778042896227930421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 21:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rAY8kM55;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E52C1C5CD52;
	Wed,  6 May 2026 04:49:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A26226053C;
	Wed,  6 May 2026 04:48:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22A9811AD026C;
	Wed,  6 May 2026 06:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778042893; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JClHsz4MRGeI6GOnGnAsQ7BGdxEb3ip19ni94V1HKK0=;
	b=rAY8kM55IqhjdcwWuWBH33ToJj/yXKCFKcUs+OjI6aZEbomHrf7yyT+jgqeRMlVW5Q2wUP
	S+dlYvnM5x/fA/8OrWWRHKP+kgxjgKBRvPyhl+LuI+WYUmQMxNuIX4dn6pEwi/xzJtqQt2
	RJ7BcZ5yi6iycwZZYRqyxDP1DoJ2eX2Ph+Uo7/pcSeFLtV5ZsHnoDUPV4i1DXTHSOh6fKa
	0v1bnJCfRpTds4rvxUU0tv0Mrr8ng9ZbNjIThOJiy36zxFjvQvLkt3lo5vbH0x46iwWpqU
	8ZZ0rcLSTFmJbYQ+xDhNiWjnp0BMbPoEEZBq86CJ+mmFJe6jEV5v2z3i4uwNdw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 06:48:11 +0200
Message-Id: <DIBBLNWCBLM2.3IL1YBR2X1LQY@bootlin.com>
To: "Denys Dmytriyenko" <denis@denix.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] xz: upgrade 5.8.2 -> 5.8.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260505180933.938257-1-denis@denix.org>
In-Reply-To: <20260505180933.938257-1-denis@denix.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 04:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236530

On Tue May 5, 2026 at 8:09 PM CEST, Denys Dmytriyenko wrote:
> Remove previously backported patch.
>
> Release notes:
> https://github.com/tukaani-project/xz/releases/tag/v5.8.3
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---

Hi Denys,

Thanks for your patch, but we already have a pending patch for the same
upgrade.

https://lists.openembedded.org/g/openembedded-core/message/236371

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


