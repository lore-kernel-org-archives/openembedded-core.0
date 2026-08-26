Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE49C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 14:27:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13862.1787754478401621071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 07:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KPZ/+L11;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3776B1A1843;
	Wed, 26 Aug 2026 14:27:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B474604EC;
	Wed, 26 Aug 2026 14:27:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B155F11C78277;
	Wed, 26 Aug 2026 16:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787754471; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EDYYwyWgNWTyR6rs08aTrkAmt/eR0Qlla5melIN0XG0=;
	b=KPZ/+L11ekrm3X9ZeYW04etaamSCDJVuYgqoxHXBAqMdQbCXc8rzSvWzo4IA0sLDA83VZB
	chnS8gMQ8RxhBY+IbiJDGkPMTA5VRFPEsrrtrm9w4HUC/yseVz/eAzUF4xlwuMy2fEUKSD
	UyqELI6qN/A65lJ3tDbL5Rjg5BKuFZtP8a+eYNqk74X/zVu24+Hn1b7AyDnDdRMJCiJcPu
	1mqmEroOCWMWWfhwc8l71Fo9SL3vS5WseDZolfirMCkzSQoaqRWth204qEx9RE8kZ6Utuh
	c+Vk8lDnmUk+SliM8TIUC9TSO888Vpa6B+0o3f4wicp6XAGwH3Cu2018cH3+cg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 16:27:48 +0200
Message-Id: <DKYY2H10VBNX.1OFI6Y7CMWBZL@bootlin.com>
Subject: Re: [OE-core] [PATCH 15/17] python3-shacl2code: upgrade 1.1.0 ->
 1.2.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260826081832.1059-1-wangmy@fujitsu.com>
 <20260826081832.1059-8-wangmy@fujitsu.com>
In-Reply-To: <20260826081832.1059-8-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244400

On Wed Aug 26, 2026 at 10:18 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

It looks like this is breaking python3-spdx-python-model:

ERROR: python3-spdx-python-model-0.0.6-r0 do_compile: Execution of '/srv/po=
kybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-li=
nux-musl/python3-spdx-python-model/0.0.6/temp/run.do_compile.4043276' faile=
d with exit code 1
...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/musl-qemux=
86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-spdx-python-mo=
del/0.0.6/temp/log.do_compile.4043276
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/mus=
l-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-spdx-py=
thon-model/0.0.6/recipe-sysroot-native/usr/bin/nativepython3):
| 	shacl2code=3D=3D1.1.0
| 		wanted: =3D=3D1.1.0
| 		found: 1.2.0
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-spdx-python-model-0.0.6-r0: task do_compile: Failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4549
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4345

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


