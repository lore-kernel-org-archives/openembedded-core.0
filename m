Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDBAC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 16:16:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43914.1785946580840001057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 09:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2S3/BcOW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 68B7C4E410F5;
	Wed,  5 Aug 2026 16:16:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E1CD602AB;
	Wed,  5 Aug 2026 16:16:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 007EE11C34E92;
	Wed,  5 Aug 2026 18:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785946573; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=672yzl6mpNAcA0OfJnfQbezrcAzCtgUQtIhQkZOPM4s=;
	b=2S3/BcOWbO1N4mNAkPm9ISjWI6uTtj5NJGVgXvieYefvdxjxFXtUSYPpdsO0cUX3W/ZTOD
	1HWz0c1vAh1FW9FbB4vOoaTZk3RYeDrMlXLHjDa1xgzG02fHItbwOJYJZ8niGiPimTN/ap
	/4hspdJdxkWRmju7MUN+BGGTq7gs+HQOhfi+rgolGczatYItgcPTeeOc+QgW14JrXy5WgT
	VFbsbISmwjWDEyjgZAMrZ5HQdcESXTREY5mkR7RmMI6wLQ/NNXYCAtx9leQEUSMj9TyEnv
	FF4bPs9ObC3Yfoqp1hsLLQTKMG7uUpoHSo4wRlccW3n3rOWWwOJzlefko2Ktgw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Aug 2026 18:16:12 +0200
Message-Id: <DKH580UVDLMW.GKGLCST2LEAG@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd: upgrade to 261.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260805102615.1663361-1-daniel.turull@ericsson.com>
In-Reply-To: <20260805102615.1663361-1-daniel.turull@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 16:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242877

On Wed Aug 5, 2026 at 12:26 PM CEST, Daniel Turull via lists.openembedded.o=
rg wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Drop two backports that are already in the new version

Hi Daniel,

Thanks for your patch.

It looks like one of the patch is still used in systemd-boot:

Parsing recipes...ERROR: /srv/pokybuild/yocto-worker/genericx86-64/build/la=
yers/openembedded-core/meta/recipes-core/systemd/systemd-boot_261.2.bb: Una=
ble to get checksum for systemd-boot SRC_URI entry 0005-boot-downgrade-EFI_=
MEMORY_ATTRIBUTE_PROTOCOL-warning.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd/poky/0005-boot-downgrade-EFI_MEMORY_ATTRIBU=
TE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd-boot-261.2/poky/0005-boot-downgrade-EFI_MEM=
ORY_ATTRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd-boot/poky/0005-boot-downgrade-EFI_MEMORY_AT=
TRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/files/poky/0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE=
_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd/genericx86-64/0005-boot-downgrade-EFI_MEMOR=
Y_ATTRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd-boot-261.2/genericx86-64/0005-boot-downgrad=
e-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd-boot/genericx86-64/0005-boot-downgrade-EFI_=
MEMORY_ATTRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/files/genericx86-64/0005-boot-downgrade-EFI_MEMORY_=
ATTRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd/x86-64/0005-boot-downgrade-EFI_MEMORY_ATTRI=
BUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd-boot-261.2/x86-64/0005-boot-downgrade-EFI_M=
EMORY_ATTRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd-boot/x86-64/0005-boot-downgrade-EFI_MEMORY_=
ATTRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/files/x86-64/0005-boot-downgrade-EFI_MEMORY_ATTRIBU=
TE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd/0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PR=
OTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd-boot-261.2/0005-boot-downgrade-EFI_MEMORY_A=
TTRIBUTE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/systemd-boot/0005-boot-downgrade-EFI_MEMORY_ATTRIBU=
TE_PROTOCOL-warning.patch
/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/me=
ta/recipes-core/systemd/files/0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROT=
OCOL-warning.patch
ERROR: Parsing halted due to errors, see error messages above

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4331

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


