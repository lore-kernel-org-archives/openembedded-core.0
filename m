Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7A6C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 11:56:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.5269.1650974170563529458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 04:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ajRKk93Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AD7756000C;
	Tue, 26 Apr 2022 11:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650974168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HCJlW6Esazi0uNNgzG7gxBev+W5cKApl8xgeul5wo8=;
	b=ajRKk93YwJrqvHDdB3M75HFtJPY2J6Z5GqNt/W6SCyyxYnRatyJX1Dxy92wVSWKCpd2oPY
	NLU+3WfahHfE9iWBPyuK31PALD4Q7AIr3AdEvb2rf2ej0f6R923zkDUEZX7M9pMeyd7YaF
	yWE+/aEjf3uZcl3TZmgf8TERmGr6C4TxuUUFDgxOF1EFMMsLdbhRfZCyVubcH0Cu5JPWv1
	qW8L++6mRtZQw+mVM+bYWhXW2Fo9P3apIbdav1L4n0k8wMRwgTGeFogG7lshEiimZHzxR5
	ocZOey457MMphYiFnN2xH2MvXZF9ehwbJ8A1HPCPKmZj9DWu4y/fBSuaqSjdDA==
Date: Tue, 26 Apr 2022 13:56:05 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pgowda" <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com,
 alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH] rust: update 1.59.0 -> 1.60.0
Message-ID: <20220426135605.34ac2f80@melee>
In-Reply-To: <20220425100533.101314-1-pgowda.cve@gmail.com>
References: <20220425100533.101314-1-pgowda.cve@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 11:56:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164866

Hello Pgowda,

Il giorno Mon, 25 Apr 2022 03:05:33 -0700
"Pgowda" <pgowda.cve@gmail.com> ha scritto:

> Rust has been upgraded to rust-1.60.0 that uses LLVM 14.
> 
> Please refer the following link for more detailed features.
> https://blog.rust-lang.org/2022/04/07/Rust-1.60.0.html
> https://github.com/rust-lang/rust/blob/master/RELEASES.md
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>

Testing with this patch applied triggers many warnings:

WARNING: preferred version 1.59% of cargo-native not available (for item cargo-native)
WARNING: versions of cargo-native available: 1.60.0
WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs)
WARNING: versions of libstd-rs available: 1.60.0
WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs)
WARNING: versions of libstd-rs available: 1.60.0
WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs-dev)
WARNING: versions of libstd-rs available: 1.60.0
WARNING: preferred version 1.59% of rust-native not available (for item rust-native)
WARNING: versions of rust-native available: 1.60.0
WARNING: preferred version 1.59% of rust-llvm-native not available (for item rust-llvm-native)
WARNING: versions of rust-llvm-native available: 1.60.0

See also the logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5151/steps/11/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5151/steps/11/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

