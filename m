Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2061FCA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 15:52:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.1164.1755877929492314404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 08:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Eq+Yq7bZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 955694E40BBD;
	Fri, 22 Aug 2025 15:52:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54748604AD;
	Fri, 22 Aug 2025 15:52:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54BE21C22872B;
	Fri, 22 Aug 2025 17:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755877926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vrS0HiNg9jZLgmdq+KSRnBTfgCwCVUAwxGLOy2J1F+w=;
	b=Eq+Yq7bZ6RgBK5rcquaMpbh0Ltsf+WQH1a690QFLVuryMVQJiOjn5RgmnRYzYjikj48Viw
	kL68vZArmVw/UUc5s3mPTSzCLRHN2BU7L9hLYliMhM7SvBBY9AFWJBa9BysyW+pE4n0W3n
	VGthTLSQVWqNP2SVCsF7M4rE1F3FKBgm3AeiQMMNKRjS+zeZf9XdIK8ixAlxOWDl1xZ9e7
	9Fh3c+YyfVVviEb+lohzr9BQbgju1Y1+68OC+Hg/56cEEngMn0mo19j1GsndG8Soa6znJ2
	1s5jj4L/cypr6weyvpmFD4b1cG4IeNxcIeOsH1ux1l207BBzxWwycqkodOyRxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Aug 2025 17:52:00 +0200
Message-Id: <DC92RWVBN7V4.30RLT0SCEWDPC@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel-yocto: -stable and new reference
 kernel
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1755784780.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1755784780.git.bruce.ashfield@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 15:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222338

On Thu Aug 21, 2025 at 4:03 PM CEST, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> Here's the next set of updates to the linux-yocto kernel.
>
> The plan is to introduce 6.16 as the latest reference kernel, and keep
> 6.12 around (since it is a LTS).
>
> This isn't ready to be the default for builds, but it has passed my
> core-iamge-kernel-dev testing, so I wanted to make the recipes available
> as visibility to where we are headed for the release (plus, I'm out of
> the office on holidays until the first week of September, so making it
> the default would be a bad idea from me being able to support issues).
>

Hi Bruce,

Thanks for the series.

I understand this isn't fully ready, but I did launch a full build
anyway: most builders succeed, we just have one warning on config
fragments:

WARNING: linux-yocto-6.16.2+git-r0 do_kernel_configcheck: [kernel config]: =
specified values did not make it into the kernel's final configuration:
...
[INFO]: config 'CONFIG_CRYPTO_LIB_CHACHA' was set, but it wasn't assignable=
, check (parent) dependencies
...
[INFO]: config 'CONFIG_CRYPTO_CHACHA20_NEON' was set, but it wasn't assigna=
ble, check (parent) dependencies
...
[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_CRYPTO_SHA2_ARM_CE
     - CONFIG_CRYPTO_CRC32_ARM_CE

https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2248

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


