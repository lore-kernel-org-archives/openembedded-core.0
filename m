Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C55EF532EF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 08:21:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15200.1774340480722843609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n7Xncay7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 048AE1A2FC0
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:21:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C02746011D;
	Tue, 24 Mar 2026 08:21:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A85EC1045116E;
	Tue, 24 Mar 2026 09:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774340477; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hb+bme+got+UCvCG4JYgoXASYlBYNxEd4ygtxZKXx0E=;
	b=n7Xncay7Ao3+rADMYHgbpFrGp09wqGv2aEE4ZuNIOeFLgjG8wChkhqOKGq4XNFhMG5EL0r
	wT0WIp6tbfqkzurYK1+KPbncRYpq8WC27NKhYniaOmSRMpJMCHjly5Yj5Nk6gOQeCwnXgj
	Kel5fLvZCUMSfanuDf77u4RNxk985UUWlHX17KttqhUTWtGunHlmqacCfmFs/6EkDPWXM8
	YAmHqAehg4UXVxmQ5ECoyo/bkpzQ8vJ3fLyEivJwinh0qzw3Wcq+ur50qgMNP1f4jOD7uj
	Q398tbS8eYKaX1J0G+bk+qc/LmCu2Dd5aJ+mNKtSeKUaOhGReV3FlODago16sg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 09:21:16 +0100
Message-Id: <DHAV7DUCN3RY.302UM677B9ZL2@bootlin.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: upgrade 2.14.1 -> 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260323034243.2150-1-wangmy@fujitsu.com>
In-Reply-To: <20260323034243.2150-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233775

On Mon Mar 23, 2026 at 4:42 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> disable-tests2.patch
> refresshed for 2.15.0
>
> 0001-tests-do-not-strip-a-helper-library.patch
> removed since it's not available in 2.15.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the upgrade.

We also have musl build issues here:

ERROR: lttng-tools-2.15.0-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/lttn=
g-tools/2.15.0/temp/run.do_compile.3424918' failed with exit code 1
...
| In file included from /srv/pokybuild/yocto-worker/musl-qemux86-64/build/b=
uild/tmp/work/x86-64-v3-poky-linux-musl/lttng-tools/2.15.0/recipe-sysroot/u=
sr/include/fcntl.h:22,
|                  from /srv/pokybuild/yocto-worker/musl-qemux86-64/build/b=
uild/tmp/work/x86-64-v3-poky-linux-musl/lttng-tools/2.15.0/recipe-sysroot/u=
sr/include/sys/epoll.h:11,
|                  from ../../../sources/lttng-tools-2.15.0/src/common/poll=
er.hpp:19,
|                  from ../../../sources/lttng-tools-2.15.0/src/common/poll=
er.cpp:8:
| ../../../sources/lttng-tools-2.15.0/src/common/poller.cpp: In lambda func=
tion:
| ../../../sources/lttng-tools-2.15.0/src/common/poller.cpp:61:57: error: e=
xpected id-expression before numeric constant
|    61 |                 const auto epoll_fd =3D ::epoll_create1(::EPOLL_C=
LOEXEC);
|       |                                                         ^~~~~~~~~=
~~~~
| In file included from /srv/pokybuild/yocto-worker/musl-qemux86-64/build/b=
uild/tmp/work/x86-64-v3-poky-linux-musl/lttng-tools/2.15.0/recipe-sysroot/u=
sr/include/fcntl.h:22,
|                  from /srv/pokybuild/yocto-worker/musl-qemux86-64/build/b=
uild/tmp/work/x86-64-v3-poky-linux-musl/lttng-tools/2.15.0/recipe-sysroot/u=
sr/include/sys/timerfd.h:9,
|                  from ../../../sources/lttng-tools-2.15.0/src/common/time=
rfd.hpp:14,
|                  from ../../../sources/lttng-tools-2.15.0/src/common/time=
rfd.cpp:10:
| ../../../sources/lttng-tools-2.15.0/src/common/timerfd.hpp:22:40: error: =
expected id-expression before numeric constant
|    22 |         explicit timerfd(int flags =3D ::TFD_CLOEXEC);
|       |                                        ^~~~~~~~~~~
| At global scope:
| cc1plus: note: unrecognized command-line option '-Wno-gnu-folding-constan=
t' may have been intended to silence earlier diagnostics
| cc1plus: note: unrecognized command-line option '-Wno-incomplete-setjmp-d=
eclaration' may have been intended to silence earlier diagnostics
| cc1plus: note: unrecognized command-line option '-Wno-gnu-folding-constan=
t' may have been intended to silence earlier diagnostics
| cc1plus: note: unrecognized command-line option '-Wno-incomplete-setjmp-d=
eclaration' may have been intended to silence earlier diagnostics

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3496
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3463
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/2174

Also, I believe we have some reproducibility error:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/lttng-tools-ptest_2.15.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/lttng-tools-ptest_2.15.0-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/lttng-tools-ptest-2.15.0-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3670
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260324-9c_hk1xz/=
packages/diff-html/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


