Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DE7E64008
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 06:09:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.265317.1776060540606697783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 23:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2RKP0tbV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 190984E429EF
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 06:08:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5E315FFB9;
	Mon, 13 Apr 2026 06:08:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C71710451B9D;
	Mon, 13 Apr 2026 08:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776060538; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9CoQCgOWMWyOeWllUQ+x7rZ7QPQc6Vy9n7V5JFWvjdI=;
	b=2RKP0tbVyVT26QCrK5rKDwNKe93s5StfX5oWtDWZRg9nCK+V8u4XEqEvw9y82Aj9qXSFRn
	s01uxQ67P5d/xxBaiOeTTWZZcKQmOd7x/m61+d61vpP9nOP/eMYdPAEIZBXLwuq7h5L1ag
	m2hRldcBN3X+PbuZbNWPAJZ40RYKxxBxwac+/Z5QB1Z8VnEHhkNufD3AASJHR9U1RDK33M
	UHCmAE247OqFYCWrwDeybOZL7D9nbUfhh9SXdGCBXlAtRSNuVgu4/VBNC8K5JMqmobGd88
	VJ3750o3ws+MDGfq82yj0e8ill9ZqNaKvDSuPvo2+mYv6MvoTdfmJZD8N3E3Zg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 08:08:57 +0200
Message-Id: <DHRSWYZPSE5U.RGDGN11GP80E@bootlin.com>
Subject: Re: [OE-core] [PATCH] ovmf: backport a fix for build with gcc-16
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <martin.jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260412093610.805271-1-martin.jansa@gmail.com>
In-Reply-To: <20260412093610.805271-1-martin.jansa@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 06:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235082

On Sun Apr 12, 2026 at 11:36 AM CEST, Martin Jansa via lists.openembedded.o=
rg wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> Fixes build on host with gcc-16:
>
> StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
> StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but not =
used [-Werror=3Dunused-but-set-variable=3D]
>   113 |   UINTN       Item;
>       |               ^~~~
>
> and
>
> EfiRom.c: In function =E2=80=98main=E2=80=99:
> EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 qualif=
ier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>    78 |       if ((Ptr0 =3D strstr ((CONST CHAR8 *) mOptions.FileList->Fi=
leName, DEFAULT_OUTPUT_EXTENSION)) !=3D NULL) {
>       |                 ^
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---

Hi Martin,

Thanks for your patch, but we already got a similar series. Can you
review it and comment if you feel something is missing?

https://lists.openembedded.org/g/openembedded-core/message/234912

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


