Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF32CC6B0E
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 08:06:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2384.1791878801507682139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 01:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1bPYQDYm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3EB9B4E411D2
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 08:06:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12D1560362;
	Tue, 13 Oct 2026 08:06:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCDED11D70160;
	Tue, 13 Oct 2026 10:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791878798; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UffzGogb6hHnIEo01aZ9h1/5zNPOWs5WZCXXlxlGNH0=;
	b=1bPYQDYmcKlshY8YkYplAeLmkLjNcQN48w2nJO/V0Rozm8XMKY8y+BpHVYQRrHuKXO+dnN
	8PjmpiKGUca59WHUbVV7vZjF+E9m+CPSkjQ1N0aiJ2WdbqYEmxwwFXE6BV+7oGoJ7AZ+pe
	zNCezzbENMU7kIFnKrUUcDTBi+yTvn33G+hHNU3hU1BJmPAtfUUNV4qxLCt6Y3bddYm0hD
	6NU2EiaLVEL4RGVrg1xlPv2rT+ZuMNdp2pisNT6Lku+yS3gnoAvOQLIoHeul0ZL5zppImd
	+KLzfgkDuuo8Mkg+UaQNyNx6qtIdOm8O6Fa2AeJuyxoHzXYOtKt5Icn2nAIsLw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 10:06:37 +0200
Message-Id: <DM3K0RBU4C0S.WYGDXEQBPP2@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 02/18] python3-uv-build: Upgrade 0.12.21 ->
 0.13.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
 <20261012132005.23909-3-jaipaul.cheernam@est.tech>
In-Reply-To: <20261012132005.23909-3-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 08:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247706

On Mon Oct 12, 2026 at 3:19 PM CEST, Jaipaul Cheernam wrote:
> ChangeLog: https://github.com/astral-sh/uv/blob/0.13.0/CHANGELOG.md#0130
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Hi Jaipaul,

Thanks for the upgrade. This is breaking python3-cryptography-vectors
build:

ERROR: python3-cryptography-vectors-50.0.2-r0 do_compile: Execution of '/sr=
v/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/x86-64-v3-po=
ky-linux/python3-cryptography-vectors/50.0.2/temp/run.do_compile.3505210' f=
ailed with exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|=20
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/qem=
ux86-64-ptest/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptograph=
y-vectors/50.0.2/recipe-sysroot-native/usr/bin/nativepython3):
| 	uv_build<0.13.0,>=3D0.7.19
| 		wanted: <0.13.0,>=3D0.7.19
| 		found: 0.13.0
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4733

Upstream made a fix a few hours ago, we can probably just backport it
until they release a new version:

https://github.com/pyca/cryptography/commit/45fcb26ffae8e43bb3f7e5b50e2b0b9=
ea5742abf

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


