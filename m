Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A46CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 12:06:04 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19501.1779192358196693636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 05:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eida5XcG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 744831A362B
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 12:05:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3818A5FFC8;
	Tue, 19 May 2026 12:05:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AF19107E8E9D;
	Tue, 19 May 2026 14:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779192355; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W5EG7rGVV/2gzFGME+cuclKDfOHrMCTrnfC0NA0hPU0=;
	b=eida5XcGnaSdry6amusDGVRnlj+JahxiqCcJobty5iquNTXy2waO9KkERMSn996SGpvoVe
	GJXh9MLjnCpSc12V0NKUXDZHzfxMfUTio/Oi2OI05Mw4ISQLYoufDNEMPEzMl2CEaNpsm7
	svmPJs2CrbgZDMhnFeOASPqeG4emH16Kb5+abFwYwXP7TK7aiK08xj5oZrS4CTqqSd97Dm
	blPnVSGFicoIg5E3ZH/9QzGWUQ/B4RUWn5kQpMEljvX9RbV+xqsm3AApBAI3ura9Lbd4J9
	4SP20WN6Z7Y4gO7KhsJNaETQ6iZ8/VYHYUrAKHXzkBEVftniGcI2wJM1Ye/zyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 14:05:54 +0200
Message-Id: <DIMN1W09G0QB.1G0MELGE2OTI5@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/4] nasm: remove groff-native dependency
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
References: <20260518103249.592747-1-ross.burton@arm.com>
In-Reply-To: <20260518103249.592747-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 12:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237320

Hi,

I suspect the series introduced two different errors on, one for groff:

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/musl-qemux=
86/build/build/tmp/work/core2-32-poky-linux-musl/groff/1.24.1/temp/log.do_c=
ompile.1501313
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 GROFFBIN=3Dgroff GROFF_BIN_PATH=3D/srv/pokybuild/y=
octo-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/grof=
f/1.24.1/recipe-sysroot-native/usr/bin
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| sed -e 1h -e '1s,.*,/* DO NOT EDIT! GENERATED AUTOMATICALLY! */,' -e 1G \
|   -e 's|@''HAVE_SYS_CDEFS_H''@|0|g' \
|   ../sources/groff-1.24.1/lib/getopt-cdefs.in.h > lib/getopt-cdefs.h-t
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/hosttools/mkdir =
-p 'lib'
| /bin/bash: line 1: lib/getopt-cdefs.h-t: No such file or directory

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3806

One for nasm (different build):

| asm/uncompress.c:9:10: fatal error: zlib.h: No such file or directory
|     9 | #include "zlib.h"
|       |          ^~~~~~~~
| compilation terminated.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/3765

Also on riscv64:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1607

Can you have a look?

Antonin

