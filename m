Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F60C9EC6A
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:36:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30207.1768214186318431511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EZWrl0Vc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38BDF4E4207B;
	Mon, 12 Jan 2026 10:36:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03AD8606FA;
	Mon, 12 Jan 2026 10:36:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80FD5103C87A3;
	Mon, 12 Jan 2026 11:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768214182; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZBac+DWwruvMSjoF9LlWWgnJoSANtGQcX+zk2rMlO80=;
	b=EZWrl0VcIReBV9V6eIs95K/hguBDEnQsxJ4hZBoF3y/6E4+gQS2lT1Bfrakkc4UPmCle9H
	VSfJhf+rCcYpuHPfTGZCE6Oxlc9Z2dVaONBemPek8PNzPbYTNDoHjv6qiqGDCk8n/BkuJM
	XfqixGYS3Muckhz5si6xbP7W1NFdkckhwDFeI9Tip2YB3UIx52n0lQB2teCXCUCc8vw2Us
	LQBaKNn/f2ZTDI3IJbJoN+BVVMpfaLIhj7PdwmFTLmnDJCKwoVmUwlAm2jjG7IsnlVLM/u
	lpZdWk5yOnysM/sF8+f28I4PDOvSPrkUtucSHi/SU/7pI/kzaYyxLF+z4pCLYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 11:36:19 +0100
Message-Id: <DFMJM47EDV3L.2NZJ8NWYZQWCF@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>,
 <mathieu.dubois-briand@bootlin.com>, <adrian.freihofer@gmail.com>
Subject: Re: [OE-core] [PATCH v2] devtool: clean up debug build
References: <18880B4F565039AF.2355985@lists.openembedded.org>
 <20260110075429.2119759-1-hongxu.jia@windriver.com>
In-Reply-To: <20260110075429.2119759-1-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229205

Hi,

On Sat Jan 10, 2026 at 8:54 AM CET, hongxu via lists.openembedded.org wrote=
:
> Due to we rework debug friendly optimization, rename DEBUG_BUILD
> to DEBUG_OPTIMIZE. Then:
>
> - s/DEBUG_BUILD/DEBUG_OPTIMIZE/g
>
> - s/debug-build/debug-optimize/g
>
> - s/debug_build/debug_optimize/g
>
> Note, for specific recipe, we do not use
>   OE_FRAGMENTS +=3D "core/yocto/debug-optimize"
> in recipe
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/fragments/yocto/devtool-ide-sdk.conf |  2 +-
>  meta/lib/oeqa/selftest/cases/devtool.py        |  2 +-
>  scripts/lib/devtool/ide_sdk.py                 | 10 +++++-----
>  scripts/lib/devtool/standard.py                |  6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta/conf/fragments/yocto/devtool-ide-sdk.conf b/meta/conf/f=
ragments/yocto/devtool-ide-sdk.conf
> index ca0269543b..f451b47713 100644
> --- a/meta/conf/fragments/yocto/devtool-ide-sdk.conf
> +++ b/meta/conf/fragments/yocto/devtool-ide-sdk.conf

I can't apply this patch as this file does not exist on master. Does your p=
atch
depend on another one?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


