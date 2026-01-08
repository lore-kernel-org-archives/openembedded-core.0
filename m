Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63301D148B5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:28:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1510.1767857317262861685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:28:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ADaRYepJ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 19E1F4E41FED;
	Thu,  8 Jan 2026 07:28:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D55EB606B6;
	Thu,  8 Jan 2026 07:28:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0E4B103C874C;
	Thu,  8 Jan 2026 08:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767857314; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xsnfiLwnOCpvNsC+77n7DAmlwU/A5dpnGp3JiJ7lmSA=;
	b=ADaRYepJj0fyRwJeX9j2ZJBjR+DyZyh6M6ZXXps6x1yU9brM4wtxr2F5fBHMyHp3Y3K1iK
	gnmDQmX2WTkmxElPciPT+zNWY/TKlkXrz4WnSIi9f0XgjwJlrcRDRlEzoDfnhemNUnImrY
	Z2UT5Mg0iNTmUhtvmDnisLkblzsEltWo23njntcK0k43nigiuPkkwm159ck9MdrHkX9ckj
	KAN2VtYQMJ37WwCsGjZV6D3tBPL0QwLQ3AHZIpN3+t3T+/Oir21ifEzmqnxVLgR93aZzb6
	rnXf69fIvSZAXeq39PvzjGBk2ITPX/tRZR9Mo10mOV8llMWEVhOCafd+yRjNLw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 08:28:33 +0100
Message-Id: <DFJ145W5GNOA.2BDJOK5C3SE75@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] piglit: upgrade to latest revision
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260106205438.994413-1-tgamblin@baylibre.com>
In-Reply-To: <20260106205438.994413-1-tgamblin@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 07:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229039

On Tue Jan 6, 2026 at 9:54 PM CET, Trevor Gamblin wrote:
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Hi Trevor,

Thanks for the update.

It looks like this one is failing to build musl:

ERROR: piglit-1.0+gitr-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/=
1.0+gitr/temp/run.do_compile.2139921' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/tests/spec/ext_sh=
ader_pixel_local_storage/pixel-local-tests.c: In function 'make_test_main_s=
tr':
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/tests/spec/ext_sh=
ader_pixel_local_storage/pixel-local-tests.c:787:17: error: unknown type na=
me 'uint'; did you mean 'int'?
|   787 |                 uint expected[4];

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3044
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3010
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1728

Can you have a look at the issue?

On the other side, I confirm non-musl builds are now working, even
after numpy update.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


