Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60C9CA5FBB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 13:53:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13935.1790776425726490949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 06:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UAfYkISI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 683D21A104B;
	Wed, 30 Sep 2026 13:53:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C12360749;
	Wed, 30 Sep 2026 13:53:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6322D103298D6;
	Wed, 30 Sep 2026 15:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790776418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NKacGWyL8urQkMZqWWAEVYm0LYHK/c/Oim5inm2VVbE=;
	b=UAfYkISIH9o8Nq83oW5ChiOIOHgJSGQ2aqhcmB9VmWAbwk/QtDnfo0vRInv8rSvhjsHJvZ
	KIwGdXeYn6+8HFsPHIWXUSk5IS9bJ6gOPg7Z0sd63Fr/lZLO/NqoYCq+Yb7+TtdqywDdge
	ZHF5DYuA7FGpZcA3ULh08xlpn5INBQiaKCGu8+ESH3doX6NnkJL6BLrWeYVJltdI/CHb/t
	c0w0hHSgYqdDgrus5by3pk2z5Z3haSdJjZUYYVMtiF4KNsUX6HRkAj7qeHnm5An//p3Ysp
	lo4ZNSMmyOwtem4VLxO3l+Hzeyksn/cHA/CSt9dyP/6rsptFbkbZjzta2UFNIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 15:53:36 +0200
Message-Id: <DLSP9CPWY9EB.2ESPI3N00Y6CM@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Fix CVE-2026-5450
Cc: "Sourav Kumar Pramanik" <souravkumar.pramanik@bmwtechworks.in>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <UpStream_IP-SP@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260930102124.82827-1-UpStream_IP-SP@bmwtechworks.in>
In-Reply-To: <20260930102124.82827-1-UpStream_IP-SP@bmwtechworks.in>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 13:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246972

On Wed Sep 30, 2026 at 12:21 PM CEST, Sourav Kumar Pramanik via lists.opene=
mbedded.org wrote:
> From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
>
> This change fixes CVE-2026-5450
>
> Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=
=3D839898777226a3ed88c0859f25ffe712519b4ead]
>
> Comment: Patch refreshed as per glibc 2.39 source code
>
> Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.i=
n>
> ---

Hi Sourav Kumar,

> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index 88ad5e44e8..b01225e530 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb

Glibc 2.39, I bet this is for a stable branch. Missing the branch name
in mail title?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


