Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A484FCD98C7
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:59:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127811.1781524792257693304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lB5vdnI3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5075BC2BB2A
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:59:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3909F60015;
	Mon, 15 Jun 2026 11:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21B30106C85CA;
	Mon, 15 Jun 2026 13:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781524789; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+Kn5ggIQe74UDjgkcz0236vN0Ihp1kICZj1AxeapqpI=;
	b=lB5vdnI3aT6Att05VHehlFOm20iDX6E04/IMsU/ZYtWJEm7aT5HsokpIdF+h1o0+iiRUpc
	+Jvu/qCy6r5+zA80MdenJgLbi1dlCKyyPmnpTwva7Zwqs3jlMgGoluPEwPsV5hsXzg/j0/
	im2oDIn2C7d9Qc85bbS7lDaNI1cBQbExgNl/OW1rhK2bFRaKsyozUfZdRIeJRmyEWRpDb2
	VaV/MVWu61v6ROCOiRmSZnzfxwJ2TL9MV0pTbn+A0OWx+XLtF3K5Dm0SZH4dw+Sg2bRbrW
	NmDvospJEasXe41ff+PU5N/WH/UEl+bBTEezL1AC2A22HK/e7atoELzEloBqLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 13:59:47 +0200
Message-Id: <DJ9LTWU1DJVD.2EMFNNNTRVGSU@bootlin.com>
To: <Kris.Gavvala@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 0/2] libcap: adding ptests
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260613024335.377418-1-kris.gavvala@windriver.com>
In-Reply-To: <20260613024335.377418-1-kris.gavvala@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238842

On Sat Jun 13, 2026 at 4:43 AM CEST, Kris via lists.openembedded.org Gavval=
a wrote:
> This patch series adds ptest support for the libcap package and
> addresses a bug in one of the upstream tests.
>
> The changes enable running a subset of the upstream libcap test suite
> as ptests, and address a bug in libcap_psx_test related to
> exit handling that causes the ptests to hang.
>
> Kris Gavvala (2):
>   libcap: add ptest support
>   libcap: fix hang in libcap psx_test
>

Hi Kris,

Thanks for your patch.

It looks like some ptest is failing:

AssertionError:
Failed ptests:
{'libcap': ['libcap_launch_test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3820
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3838
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/542

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


