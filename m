Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C883CCA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 06:31:15 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.70939.1756794672750859049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 23:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wFHoSz/5;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A79ACC653F1;
	Tue,  2 Sep 2025 06:30:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96CA460695;
	Tue,  2 Sep 2025 06:31:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 470241C22D99E;
	Tue,  2 Sep 2025 08:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756794670; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aayVrPhVzJ56Sjguz9/BmCuRJ5DfLbPmpeuWCqgTkIw=;
	b=wFHoSz/5fMeJwQkuD3UCbc9w7WM6+CillJOFRRFEDnE0Z8b8RLzOnnDQLkvcNxwt1uZrW9
	FLxogunvdoV3bgGHUCPU4avygFIC11saTvTHSa+QLQPNgTp0LNHO25hPvp3SkE93OABDk7
	YEkjAicEv7vO9hSnhLhhgST9X4yjGBsK6Ni/5IX5rFdbif3ZBXs5pG+zOnCynRcO1G6diT
	cpkFAVb2hRT6MKY0vAWu+2mZxcPL9f4x0oeZ3WOXLDqpls8iudPGYbKTqq0lXYB2gMbgUQ
	Ldt65UUwL/xQ6rigIOb9i3wbdwWpuaJ40RY753tNzSNM17p1Qg39MB+KwDA60g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 08:31:05 +0200
Message-Id: <DCI3QFN7RXTR.L14ECZ6BDFAN@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 3/3] kea: Upgrade to 3.0 LTS release
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250829185539.3379514-1-raj.khem@gmail.com>
 <20250829185539.3379514-3-raj.khem@gmail.com>
In-Reply-To: <20250829185539.3379514-3-raj.khem@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 06:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222709

On Fri Aug 29, 2025 at 8:55 PM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> * Drop backported patch and refresh remaining
> * Add fixes to build with boost 1.89.0
> * Switch to meson build system
>
> License-Update: Removed remaining coroutine references [1]
>
> [1] https://github.com/isc-projects/kea/commit/93bab7a99f82e2ceadca14a7a6=
a2440cd69fb8c8
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

It looks like we have some reproducibility issue after the update, as
compilers data are stored:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250901-irpx1jty/=
packages/diff-html/
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2398

Can you have a look?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


