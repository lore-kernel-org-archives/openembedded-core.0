Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8946AC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 08:06:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.15169.1682582805727438937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 01:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VdZusym/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E49684000A;
	Thu, 27 Apr 2023 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682582803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvqSXUbCi7Q/mUGSeVUkCMGW0EtQzEJeu+CvE8LNv34=;
	b=VdZusym/LkmZRKBaJJzL5o8N12nCgEl9uux78bUuzgDBHhd0qh9PQz6EwayJVdIXRhhwbx
	Ypurlq3xfBkBMo2zPNj4KqQW92vwxa9kDGC87PgWWJ+mOp1rJM/iv0mhu9PUKlnqmOV5Wf
	FqfJJdexH8hP7srQ2UQ9kCAyoouPHQyuCSdC6ouzJfnMNA5zd1jyfJ8MTBnTYYhEU5hHdE
	r/iVMKLkerCuDy7T9cyJu5gdICV4PWZegR5Xvf0JlKOqnKvIqnuFN02I5AUb6yDHNs+dxo
	9P4TnZGAMQaqj2gCXMYB0m6LHsJiAY0xkpaqP6FiwZkSDacyfLQ46TS5kVR7wQ==
Date: Thu, 27 Apr 2023 10:06:41 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Deepthi Hemraj
 <deepadeepthi98@gmail.com>, Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Subject: Re: [OE-core] [PATCH v3] binutils: stable 2.40 branch updates
Message-ID: <20230427100641.4eef16a9@booty>
In-Reply-To: <20230426171823.1931953-1-raj.khem@gmail.com>
References: <20230426171823.1931953-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 08:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180483

Hello Deepthi, Khem,

On Wed, 26 Apr 2023 10:18:23 -0700
"Khem Raj" <raj.khem@gmail.com> wrote:

> From: Deepthi Hemraj <deepadeepthi98@gmail.com>
> 
> - Rebase existing patches
> - Drop 0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch
>   which is already in
> 
> - Below commits on binutils-2.40 stable branch are updated.

AB testing with this patch produces lots of failures:

ERROR: binutils-2.40-r0 do_package: QA Issue: binutils: Files/directories were installed but not shipped in any package:
  /usr/lib/libgprofng.so

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7055/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/4786/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/7339/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1325/steps/14/logs/stdio

ERROR: nativesdk-binutils-2.40-r0 do_package: QA Issue: nativesdk-binutils: Files/directories were installed but not shipped in any package:
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/lib/libgprofng.so

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/6978/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/7079/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/7416/steps/11/logs/stdio

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

