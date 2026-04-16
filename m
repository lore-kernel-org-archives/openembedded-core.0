Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B79F428F5
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:03:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7105.1776319384871371978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mlWF0NxY;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F612C5C3C2
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:03:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F2156042F;
	Thu, 16 Apr 2026 06:03:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74ECB10458E04;
	Thu, 16 Apr 2026 08:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776319380; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ugM98NJ2ROH4s9YDfn/deIIO1h8fsfx/ejSutkFz8vI=;
	b=mlWF0NxYaC/hqAnenZ1pfyt6URWPVUPBHNYUNp7vJ88/fa6jhbxrOe/g4D6j2HK3hLRpCm
	5RZyxesDx+D630VnvRv6hBRuBoSW7PWBp+9q1aRR3c6X/pp9LUMBxTlODU1Mmuh8kCy5PE
	IRBdHzcDt7U42wEfg3C+dU3HYJBSiR+y22mL7q4FDTzLhRFfJWx5hdXQhfsnzIB6ctprtE
	XzVDallQ8In72pARpiYrgEKS9bg6GHiZpGgg5I5eEnzoaUBlrhRXen1uKqUiiLYJzNcQeA
	LJYBKU8ILhoPgZAWF4edPoJe7E7QKcPM6zHqKCxhnXP4x2PFresg36Gijh+vSQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 08:02:58 +0200
Message-Id: <DHUCO13I06C1.2TWO5H4ADGUBZ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] lttng-ust: upgrade 2.14.0 -> 2.15.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260414103828.1714-1-wangmy@fujitsu.com>
In-Reply-To: <20260414103828.1714-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235340

On Tue Apr 14, 2026 at 12:38 PM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch, but this isn't fixing the issues we had: neither
the ptest failure, not the reproducible issue:

ptest errors:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3485

Reproducibility logs, you can ignore strace related errors:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3837
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260415-xp8ojjfp/=
packages/diff-html/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


