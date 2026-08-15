Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B51C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 16:11:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11506.1786810288390579550
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 09:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=akjIU7tw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22EC41A166D;
	Sat, 15 Aug 2026 16:11:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCB4F604AA;
	Sat, 15 Aug 2026 16:11:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 534EB11C4F5BA;
	Sat, 15 Aug 2026 18:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786810281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Nw45baV85XdFqXAkp4zfT0kbQPNF94hUC+IeaoFFHCY=;
	b=akjIU7twIdefJPoD458Jqx8ZHwNcVMpO3oZ3Po4hfljLo91X/fT+z4JpWlx80vXTUjaeLf
	Wsu9Pr7ZY81ny50lrBU9QZk/LsFUKRky9znnh4JBPuvdXwTc1bCUJWWOnT5AxszSKjhiHI
	4u8ep9OBvbmryp9P2yOevWVdhdFmAxg4YbK4UiHnFJIM1IauXt5PLoIjqru+HMvV5LXJ9Z
	jUGTjN4pFOvq61qhXEam0Z+4idN26WwfqcGRjPQ0pIV+Rmytt8t06VKAjv6zXLjn/m1W4/
	kmqgN48l9/gkMGkwHRueKrB5byoVXTpIvQhGmShrj97/hOVNPrbSjDWqT7b0JQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Aug 2026 18:11:18 +0200
Message-Id: <DKPNDPZEIJTE.GEZ6PTYB6Y3O@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/7] rust: Upgrade 1.96.1 -> 1.97.1
Cc: "Deepesh Varatharajan" <Deepesh.Varatharajan@windriver.com>, "Sundeep
 KOKKONDA" <sundeep.kokkonda@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260814051829.35088-5-jaipaul.cheernam@est.tech>
In-Reply-To: <20260814051829.35088-5-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 16:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243495

On Fri Aug 14, 2026 at 7:18 AM CEST, Jaipaul Cheernam wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> 1.97.1
> Rust 1.97.1 is a point release that fixes a critical miscompilation in
> an LLVM optimization (rust-lang/rust#159035) that has been silently
> affecting generated code since at least Rust 1.87.
> https://github.com/rust-lang/rust/releases/tag/1.97.1
>
> 1.97.0
> Rust Changes:
> https://github.com/rust-lang/rust/releases/tag/1.97.0
>
> Cargo Changes:
> https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-197-2026-07-=
09
>

Hi Jaipaul,

You will need to update the rust-source entry in
meta/conf/distro/include/maintainers.inc to the correct version.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


