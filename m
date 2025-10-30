Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A42CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:38:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.690.1761838691670394119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 08:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Th6nLnJR;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF1BC1A1795
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:38:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A59776068C;
	Thu, 30 Oct 2025 15:38:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87E9311808A7E;
	Thu, 30 Oct 2025 16:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761838689; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SbbH9kb5357DxLkd4fytV5QSkTntZ944Zb5w0ofXIFg=;
	b=Th6nLnJRxFM/zU64y/XAXxGfZ+svYZj1fLOADBLUzqMh7ODP/AZD1unGGTtPiG1XdJh4Sj
	bz8Me4RshzF28b0gewcSAIRC/4cy2OKwx5vZkGjF8XEkyqHRyd2zcXVn2NUZDlOV3Bf1Jw
	JShEBdU98H7Pw4NARdMY4ReuQi4UKBddy88C1gJfqgUOTsIR+yXEfJob351hqVgSu5pEBe
	LivIkkn0J+QW8GxeaVh5STEHAZuT9BbsuqQRY++212uVa479TDBicqZdeP700hIRupC09P
	8HOI/Wo45ugyHtrEPEBghpRHprDGR1g3pgftxUccmS+wfJjFfd9NYAEHaYOMHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 16:38:07 +0100
Message-Id: <DDVROVJXILSI.2PL0JU2W5JJ54@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 1/2] libconfig: import recipe from meta-oe
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225499

On Thu Oct 30, 2025 at 12:54 PM CET, Dmitry Baryshkov via lists.openembedde=
d.org wrote:
> One of the freedreno tools in the Mesa package depends on libconfig.
> Recipes from other layers also depend on libconfig. It makes sense to
> move libconfig to OE-Core in order to reduce inter-layer dependencies.
>
> Changes between meta-oe and this recipe:
> - Upgraded to 1.8.1
> - Switched to UPSTREAM_CHECK_GITTAGREGEX
> - Switched from autotools-brokensep to autotools
> - Added a patch fixing reproducibility issues
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

I still have to launch a full test session, but on the reproducibility
side, it looks correct now:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2806

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


