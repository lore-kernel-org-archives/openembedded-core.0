Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921FBC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 13:33:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48255.1784727195987591903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 06:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XoYhRfCB;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C63114E40ECF;
	Wed, 22 Jul 2026 13:33:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94E2F60388;
	Wed, 22 Jul 2026 13:33:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2839811BD2234;
	Wed, 22 Jul 2026 15:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784727193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BgD++cqByAOwr/vA33oYkpLSRC+sKGS6HkASno4Yj+w=;
	b=XoYhRfCBPh6BTDyUcS1ghdDwmQXf4WMFq7Qt0/QELVPJOvgn24fkRA2M3lBODJkUlsQm1K
	mBpn7GPC+q+W3m3FXYcEKmPOStud4cSZvKg0aNG1O2FCu3bI+SzCmAQS57G3f5io1cdhJq
	GU+ltOljVpyHu0VNrTEFMYil78rmkDWsTRB2O3ud6cNl/6h6v9dV3sflcMLh3W32Fndg2j
	OzSn5S2klOEWDR6WTRgFbf5hLPD1ncTh5d7y/BJnLTfN6wkGbylUcPNLe5DpW1ecajpG9D
	o0Q0AfrM7ZdwtM0Ib6/3mTPE5k77Vl0D/kkOSPQ/JwGooC7tQEIcjOIc82pVSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 15:33:10 +0200
Message-Id: <DK54ZKPXLL25.3GT0TFD4SNJN0@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/3] rust: Fix reproducibility with shared
 source trees
Cc: <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260722061757.109411-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260722061757.109411-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241694

On Wed Jul 22, 2026 at 8:17 AM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Backport an upstream Rust commit to fix a reproducibility
> issue when Rust family recipes share the same source tree.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Deepesh,

Thanks for your patch.

Do you expect this to fix the reproducibility issue after the rust
upgrade to 1.96.1, as sent by Sundeep [1]? Or is this for another issue?

[1]: https://lore.kernel.org/openembedded-core/20260705152012.3160479-1-sun=
deep.kokkonda@windriver.com/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


