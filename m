Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A018C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 07:06:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4468.1786777562340490979
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 00:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y+h6nog+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2050B1A165D;
	Sat, 15 Aug 2026 07:06:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD39B604AA;
	Sat, 15 Aug 2026 07:05:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE3A711C4F3FD;
	Sat, 15 Aug 2026 09:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786777555; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jPyptEZBHEDLNZo4Uv4eFiHAM7fYeURgij//mHdX86c=;
	b=Y+h6nog+Ccabxwbcw4PM44Kwf1cp9pKUvYjQXkhpNEhAQLAeIrraIMwOpAF3cEvbCrKK7X
	cO8byb7h4/a8/SLm+g2VGdJ7ytRxd8g1n53atuliHjWzevsrLugeUEQKPZpq0sRkBZLfEC
	bEDBIM3reRqg5o0hxd4IXKZ7yBDdyD6OvtXhMrXygvjboY8WVxa4uUGi9LtULJ0Pylpj+t
	Z8FwDKJvpuuLaovWaFZcvWwmMc/JhPuifW6Lhzb9cJWN3oFtXn1YEqhFE5eaTArK36V596
	2ny2Kht9MYtoe9q+wR8kv5u+ggbCgWO0Mwm1D5d9VMqZ21zPUXRAO6ciUyrI+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Aug 2026 09:05:52 +0200
Message-Id: <DKPBS41I2VXL.13RDKB81EOENQ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/5] meta: fix trailing whitespace across
 classes, conf and recipes
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 07:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243476

On Thu Aug 13, 2026 at 9:16 PM CEST, Jaipaul Cheernam wrote:
> Fix all trailing whitespace warnings reported by bitbake during parsing.
> These were flagged on the Yocto autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4405
>
> 53 files fixed across 5 patches, split by category:
> - classes-global (7 files)
> - classes-recipe (11 files)
> - classes (2 files)
> - conf (2 files)
> - recipes (31 files)
>

Hi Jaipaul,

Thanks for your patch.

It looks like you missed some of these:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4480/ste=
ps/22/logs/warnings
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/4402/step=
s/14/logs/warnings

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


