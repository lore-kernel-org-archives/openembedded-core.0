Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5593FF9B617
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:48:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79847.1776854914606088760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UNrWpkRz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62FCD1A337B
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:48:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A67A5FA8F;
	Wed, 22 Apr 2026 10:48:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9B5B10460700;
	Wed, 22 Apr 2026 12:48:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776854911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GghrQ0grndx/mwRXx8KGnaceM/sEtkjeJjAB6cLkYzM=;
	b=UNrWpkRzSwt/n0pzv+cpSgYL4uMPAqdChvr8mIZCGZp1VNj8OgLKHTjGJcDDP76tlY0d6r
	IFKKdkp7I445cfqQJl4UPy9n4Pmu3kSkyvQdI2pXxCmTwORh4vJhX6BvSynSk63FolJHwH
	IXHLPSJ6QamZyH01Xa61BFi74afdsjGrYwEjaNIpXRaxUU17do3P3x1spjxR0DKWBOZUV2
	m0FIDGCPxInr3YwsDrSsPfs7++vvOpHqfWdnv1HyvsQMfj4/+pl7nb5phd67cDDd1NSEyO
	GdSTOGxH0yTvRGQIK1B+xbZ/rz4TmEW16e0LfWrfYKuJpPszkRo6sTJmmrQ+Mw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 12:48:30 +0200
Message-Id: <DHZMHWVSFXOH.1IHEN71RLH8VE@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] sanity: add check for
 own-mirrors/SOURCE_MIRROR_URL
Cc: <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <corentin.guillevic@smile.fr>
References: <20260420143154.452247-2-corentin.guillevic@smile.fr>
 <DHY27VP0PXS1.3BCMSWT6AHOW9@bootlin.com>
 <CAMFqQmo=Sngdi4Tbsnhs+UYXtmt4_FL8jzdqw7jag6RzzVqbYQ@mail.gmail.com>
In-Reply-To: <CAMFqQmo=Sngdi4Tbsnhs+UYXtmt4_FL8jzdqw7jag6RzzVqbYQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235713

Hi,

On Wed Apr 22, 2026 at 11:32 AM CEST, Corentin Guillevic via lists.openembe=
dded.org wrote:
> Hi Antonin,
>
> Sure, but my test has been added to the sanity class. The
> https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/qa-=
checks.rst
> doc
> is related to the insane class. Is there a document relating to the sanit=
y
> class in which I can document the new test?

Ah you're right sorry, I keep mixing them up. Ignore my comment then, there=
's no
docs about all sanity.bbclass checks I think.

Thanks,
Antonin

