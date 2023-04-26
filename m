Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F27C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 12:20:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6304.1682511621217834281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 05:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=di9CciDQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 88CF9240003;
	Wed, 26 Apr 2023 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682511619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gx9rL019YbFnT9bGA1LXnMlsulTdEGbgEu5wN+m562g=;
	b=di9CciDQiaxQnBJczDMOZFPjy2JTCtQQMjuM0SNM3QRI8vXuPkhisq9uPdKBXwm5s1xyG/
	Ex0M0bsQdTuYvm/KM1CbwL0nHi0T4Xb7J0GLylyylhYwQcMemb9EGnnDfEuLyX/2vvLdPp
	UszouYc9TzSgiJjVqoUbL4BrRVi7rXQYQjKWxzclXhm+i0a+/CUFHCnS3T8fAiUB76ov5G
	jL4H5WsPSB3cX/UB2PQqv33Zzt+C+6rJ7aas7C88Qgy9FWzndQnVCag6DVNWxedWSgAzJn
	xrkCP6N+/JWpdvGZSNI1Exo1Lch/b3ec7j0LJ7upVlNMi8f/j372LhXEW2Gl9Q==
Date: Wed, 26 Apr 2023 14:20:16 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alex Kiernan" <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.68.2 -> 1.69.0
Message-ID: <20230426142016.710804e3@booty>
In-Reply-To: <20230425203116.12981-1-alex.kiernan@gmail.com>
References: <20230425203116.12981-1-alex.kiernan@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 12:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180439

Hello Alex,

On Tue, 25 Apr 2023 21:31:15 +0100
"Alex Kiernan" <alex.kiernan@gmail.com> wrote:

> Rebase patches, drop crossbeam_atomic is this fully merged upstream.
> 
> https://blog.rust-lang.org/2023/04/20/Rust-1.69.0.html
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

musl-qemu AB tests fail with this patch:

ERROR: rust-1.69.0-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/rust/1.69.0-r0/temp/run.do_install.498791', 1, None, None)
| error: unused import: `libc::fstatat64`
| error: could not compile `std` due to previous error

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7013/steps/11/logs/stdio

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

