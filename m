Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE80CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 08:59:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.4709.1755766781887294695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 01:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Xgxz5NxQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 171D54E40B50
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:59:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E452D60303;
	Thu, 21 Aug 2025 08:59:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7355E1C22DAB5;
	Thu, 21 Aug 2025 10:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755766779; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Iwb/qCMasT3bObiZDPe20eORK9aEgee+NKpppIaZRmc=;
	b=Xgxz5NxQLOOR/zNL4AQrW9GDgCcUqSwtYRrqdpv7pfOJwaXdAXaz5PCG8l/U/ryML42iV+
	qNCmC26HP/JCC2WqXhaPCzCMim+imlh94nBov5NI5S5nMioBd4UpJXjIXAVol4Wf2UAIBq
	f45USTTXr32iLyiLQ8HjtwoGWLdcvt85QhCfU9Ycj6nwr12qOzFHZg/z8+C2xDJaL12Lj0
	8sMQC5RjhJA3tjxpymEC8uPG1VFPfgQM9SuCBf0WHTLbpIk5C9VcnTD4Gn0eYpzF1ZZGJl
	zb+dmFsijXWOh9HE3T2wb4Q7SBpJSRtnEJC2WiMjTcprQPST9DDQZMNloRZRDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Aug 2025 10:59:35 +0200
Message-Id: <DC7ZDLOTYSQS.1SA72YH1CS6UT@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] spirv-llvm-translator: small recipe
 cleanup
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250820132929.2644708-1-ross.burton@arm.com>
In-Reply-To: <20250820132929.2644708-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222224

On Wed Aug 20, 2025 at 3:29 PM CEST, Ross Burton via lists.openembedded.org=
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

It looks like we have a reproducibility issue:

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

http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250821-1clwvk91/p=
ackages/diff-html/
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2325

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


