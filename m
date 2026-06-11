Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50186CD98C6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 05:14:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38838.1781154886606102288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 22:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2AsNCVbd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 79AE54E4180D
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 05:14:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 375626000D;
	Thu, 11 Jun 2026 05:14:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B610D106B9D83;
	Thu, 11 Jun 2026 07:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781154883; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x8NeBEuR5s8e6EpTD0cTCsXQXOdXpJn+KKN/nFcATgc=;
	b=2AsNCVbdymLWjJF5v9r6SJJo5YHOLa7HVl3W/ELEustDY1bZBYS6Fib+FkC656qDjqUNQ8
	ndswM7GKHJkbKTDAevfV9K05NvZmiWdtW+GCRypJntR8z/r1ZbP4qL6Cc+Qrh1CVQK7Jy/
	EaTFLCv1tN5T5x6wVE8blLNooahrsZW781GU6L81XpgYvpF9M9zLbiMjjEXUSvZfCdDgrY
	NyOfPYaUkTANjqjX3XhcX4cS0Hal63AHHkKJCLcK0L9+0x1zGo12AyAMVLiKMfE5A+Ilz/
	fIAlLRtOmjHXnzPZz13yym+iV1lytERQfiQsl8+Kt9VAKWddg+NELnrpoO8fMA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 07:14:41 +0200
Message-Id: <DJ5YPKB59JWN.379MO32ZI2BQH@bootlin.com>
Subject: Re: [OE-core] [PATCH 15/16] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6
 -> 26.1.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260610094932.2264-1-wangmy@fujitsu.com>
 <20260610094932.2264-15-wangmy@fujitsu.com>
In-Reply-To: <20260610094932.2264-15-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 05:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238419

On Wed Jun 10, 2026 at 11:49 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi,

Thanks for the upgrade.

It looks like this is failing to build:

ERROR: mesa-native-2_26.1.2-r0 do_compile: Execution of '/srv/pokybuild/yoc=
to-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/mesa-native/26.=
1.2/temp/run.do_compile.2839729' failed with exit code 1
...
| In file included from ../sources/mesa-26.1.2/src/intel/compiler/jay/jay_p=
rivate.h:8,
|                  from src/intel/compiler/jay/jay_nir_algebraic.c:1:
| ../sources/mesa-26.1.2/src/intel/compiler/jay/jay_ir.h:582:22: error: exp=
ected identifier or =E2=80=98(=E2=80=99 before =E2=80=98:=E2=80=99 token
|   582 | enum jay_predication : uint8_t {
|       |                      ^
| ../sources/mesa-26.1.2/src/intel/compiler/jay/jay_ir.h:637:25: error: fie=
ld =E2=80=98predication=E2=80=99 has incomplete type
|   637 |    enum jay_predication predication;
|       |                         ^~~~~~~~~~~
| ../sources/mesa-26.1.2/src/intel/compiler/jay/jay_ir.h: In function =E2=
=80=98jay_inst_has_default=E2=80=99:
| ../sources/mesa-26.1.2/src/intel/compiler/jay/jay_ir.h:681:29: error: =E2=
=80=98JAY_PREDICATED_DEFAULT=E2=80=99 undeclared (first use in this functio=
n)
|   681 |    return I->predication >=3D JAY_PREDICATED_DEFAULT;
|       |                             ^~~~~~~~~~~~~~~~~~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3964
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3928
https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3859

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


