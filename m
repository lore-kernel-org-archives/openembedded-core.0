Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51890CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 12:28:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.12031.1757334511572086246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 05:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R10UJOT6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3C2B34E40B85
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Sep 2025 12:28:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 046E76061A;
	Mon,  8 Sep 2025 12:28:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1157A102F2810;
	Mon,  8 Sep 2025 14:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757334508; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=socQeQkDfTg3Z2stMDJW77tGnKlACZOq4Jy9qrjWPHg=;
	b=R10UJOT6YhzNolFDjK7uB790nUYUAhmkd2cQ/eT2AcCYQaHmSFr/6ksvvWS82JFNEZqVqq
	jkrJ0sayZ4z2WDLXHyL2yyoXif937oA3aB9R+JuxlotUv29HY8WvSoL5BPgoI6cJ9cXO38
	X8yLOMyUtH3lxLhkcOzhza3N5WSUFbidlANgEJ2U2WWFFuX3gpzLgLJqZleKuMIxgzx8lI
	ZUH0E6UJgr4X/alhENdOvHYwAj9gtY10vXav1AfVZE5CsQzPc4XmBWQ+7BUk1mhAnCciZN
	48htbDqLfYWz/vG9xsDTPG9r/tE/Lqw/BaJvnDsf8garoOrQ1HNFklHlL15O+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 14:28:27 +0200
Message-Id: <DCNF3BQPZFW1.2Y406TL2E8Q6X@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] spirv-llvm-translator: small recipe
 cleanup
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250905110845.3139349-1-ross.burton@arm.com>
In-Reply-To: <20250905110845.3139349-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 12:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223066

On Fri Sep 5, 2025 at 1:08 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
> - There is no need for python3native, as this recipe doesn't depend on
>   other python modules.
>
> - Inherit lib_package so the llvm-spirv binary is in a separate package
>   to the libLLVMSPIRVLib.so library.
>
> - Remove obsolete CMake options that no longer appear to be required.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

It looks like we have some reproducibility issues:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libllvmspirvlib-dbg_20.1.4-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libllvmspirvlib20.1_20.1.4-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/libllvmspirvlib-dbg_20.1.4-r0_x86-64-v3.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/libllvmspirvlib20.1_20.1.4-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libllvmspirvlib-dbg-20.1.4-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libllvmspirvlib20.1-20.1.4-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2442
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250908-q5zzw7wr/=
packages/

Can you have a look?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


