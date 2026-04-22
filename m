Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB81F94CCD
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:05:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71147.1776837913713114538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 23:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H6GHD1NF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6414CC5C9B9;
	Wed, 22 Apr 2026 06:05:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B53B1600DD;
	Wed, 22 Apr 2026 06:05:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD9D810460AEA;
	Wed, 22 Apr 2026 08:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776837911; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kpQTB2taEd5Vq9pUijgawU9Tc/DY5yQC7VaQlT1MEe8=;
	b=H6GHD1NF5jWfgSZ0WdZVpT8Wa1uY4cML2X3aESkX2MOS9GsKfOUNEAHtJ6IJNzSDbtCpU0
	r+QAR81JGkrDm30uWszi7tPbE4d5HVuk76i8gIjYxEbGdsLNWTupwrxQNuDwu/M0Tzzcdh
	tGgpxvE0SCOy3V5jIMn54ZPQ9veKXKhpJsvrf57DPsx8RGmcH6y1Na3x3HSOD2kkvEFDie
	PEVBWXtNUWUbhOCHsqmMi3aQrUayADLlchQqvGjPeX7uv6yTjAEwDWXZc0r6F1bNFXMV84
	G6kwfr3ujlj8H5/HOz2JLOKgIcQtUb000yiGZlz0wZwH+/z1u7TRXk5oHpzD9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 08:05:09 +0200
Message-Id: <DHZGGZ09LJY1.3820STLZWCV35@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 37/49] python3-shacl2code: upgrade 0.0.24 ->
 1.0.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260421095559.1856-1-wangmy@fujitsu.com>
 <20260421095559.1856-37-wangmy@fujitsu.com>
In-Reply-To: <20260421095559.1856-37-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235693

On Tue Apr 21, 2026 at 11:55 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch.

You will also need to upgrade python3-spdx-python-model:

ERROR: python3-spdx-python-model-0.0.4-r0 do_compile: Execution of '/srv/po=
kybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-li=
nux-musl/python3-spdx-python-model/0.0.4/temp/run.do_compile.3385056' faile=
d with exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Missing dependencies:
| 	shacl2code=3D=3D0.0.24
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3699
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3661
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3641

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


