Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D60BF9D0E2
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 16:03:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.262.1776182592085555759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 09:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H338ZWOc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 216AC1A32AC;
	Tue, 14 Apr 2026 16:03:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E819060410;
	Tue, 14 Apr 2026 16:03:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CED61045020F;
	Tue, 14 Apr 2026 18:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776182589; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=chQbf6UjObkoYEUN1YiJS9pdC63KxDYyumhaX6sZnUY=;
	b=H338ZWOcDVHOUlvbHn1ZG9lZZY9/wwfyGxLkVTK/Zixw9W9FBAZCrsnzfoVFykQrRfNFjS
	fZOV68ap4DvNHxmjaNhejRdu7twCk4hRlF23ZRGSvjbB6ZnGiXfqGCVkF7qOEGuDzEaE4e
	x5EVoYB+l14pAOGyvhPAyskT2N/gDpky/3aB2xai78HovR8l2/EzK2mNEJPeVGOMb12cBk
	Dpk9eey2qKe1/DiQAfeBbB9IvaV3iLcQ5wRHjEjTk42yma5ggr7PyNDvtQLnusmivSKPLf
	o8UHSL5sDqZbkLOCzoqKaCf+tpzgdgjyvvmTp02QSmAj6SpbCcOLsPtmPkjZ+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 18:03:07 +0200
Message-Id: <DHT06GASNSNY.PWPM4R9918KA@bootlin.com>
Subject: Re: [OE-core][master][PATCH] vim: minor update to 9.2.0340 to fix
 CVEs
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260414075421.604401-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260414075421.604401-1-adarsh.jagadish.kamini@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 16:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235167

On Tue Apr 14, 2026 at 9:54 AM CEST, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> CVEs fixed: CVE-2026-34714 and CVE-2026-33412
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch.

It looks like you will need to drop some vim patches, at least the
CVE-2026-33412.patch one. Right now, vim does not build with your
changes:

ERROR: vim-9.2.0340-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worke=
r/musl-qemux86/build/layers/openembedded-core/meta/recipes-support/vim/file=
s/CVE-2026-33412.patch' on target directory '/srv/pokybuild/yocto-worker/mu=
sl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/vim/9.2.0340/sourc=
es/vim-9.2.0340'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/musl-qemux86/build/bu=
ild/tmp/work/core2-32-poky-linux-musl/vim/9.2.0340/recipe-sysroot-native/et=
c/quiltrc push', 0, 'stdout: Applying patch CVE-2026-33412.patch
patching file src/os_unix.c
Hunk #1 FAILED at 7106.
1 out of 1 hunk FAILED -- rejects in file src/os_unix.c
Patch CVE-2026-33412.patch can be reverse-applied

stderr: ')

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3620

Can you send a new version fixing this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


