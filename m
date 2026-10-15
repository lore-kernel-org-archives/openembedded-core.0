Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17167CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:39:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33204.1792042792486407270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rMLhVSTs;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1574C4E41246
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D393C6075C;
	Thu, 15 Oct 2026 05:39:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1813310328B6D;
	Thu, 15 Oct 2026 07:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792042789; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VLbMPyGhSQMJo7MqavTesfKVvBILH8oSyogeISDwJQI=;
	b=rMLhVSTskfeWiDto6X2Qq3Hjzb0V2ivtY8Z9QZKf7sI2G0BS9VOD3tnZ+VzsGbiIwm3yPc
	9lU6twss+0VrFGbTjgOjcae5jydroW7D0ZbdI8dlUagVML3NG9DCQ/J6425B5noZUChK77
	2E7Uwz71vYXsW56JIvwlojHGf7rOE1o0N0L3kaCGZIDs7egCten9F5/Pd4pWGwMWRqDOrN
	QkQ/HHj0LQlLaepfie6VkgVADgpiRPdk9yC3DNeA/e8szgDIwTovDC2TV+ygu54Jy4bEBb
	ys5gT14BxC+JQIjbRr8hnsS5Fi7YbN0p0zpPSMuvJDwI9FDoGLcbS4+jdLl8/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 07:39:46 +0200
Message-Id: <DM565EXJJ70B.2BI1H9TQXH6R5@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-flit-core: upgrade 3.12.0 -> 4.1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261014153344.81727-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261014153344.81727-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247854

On Wed Oct 14, 2026 at 5:33 PM CEST, Jaipaul Cheernam wrote:
> ChangeLog: https://flit.pypa.io/en/stable/history.html#version-4-1
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade, but we have yet another dependency issue, now on
5 different modules:

ERROR: python3-typing-extensions-native-4.16.0-r0 do_compile: Execution of =
'/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linu=
x/python3-typing-extensions-native/4.16.0/temp/run.do_compile.73236' failed=
 with exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/x86_64-linux/python3-typing-extensions-nati=
ve/4.16.0/recipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4,>=3D3.11
| 		wanted: <4,>=3D3.11
| 		found: 4.1.0

ERROR: python3-pip-native-26.2.1-r0 do_compile: Execution of '/srv/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-pip-=
native/26.2.1/temp/run.do_compile.83903' failed with exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|=20
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/x86_64-linux/python3-pip-native/26.2.1/reci=
pe-sysroot-native/usr/bin/nativepython3):
| 	flit-core<4,>=3D3.11
| 		wanted: <4,>=3D3.11
| 		found: 4.1.0

ERROR: python3-docutils-native-0.23-r0 do_compile: Execution of '/srv/pokyb=
uild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-d=
ocutils-native/0.23/temp/run.do_compile.2356' failed with exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/x86_64-linux/python3-docutils-native/0.23/r=
ecipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4,>=3D3.11
| 		wanted: <4,>=3D3.11
| 		found: 4.1.0

ERROR: python3-jinja2-native-3.1.6-r0 do_compile: Execution of '/srv/pokybu=
ild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-ji=
nja2-native/3.1.6/temp/run.do_compile.22559' failed with exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/re=
cipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4
| 		wanted: <4
| 		found: 4.1.0

ERROR: python3-unittest-automake-output-0.4-r0 do_compile: Execution of '/s=
rv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-=
linux/python3-unittest-automake-output/0.4/temp/run.do_compile.3224' failed=
 with exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automa=
ke-output/0.4/recipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4,>=3D3.2
| 		wanted: <4,>=3D3.2
| 		found: 4.1.0

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4853

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


