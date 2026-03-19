Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37D01090227
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 13:42:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11460.1773927719498534823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 06:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k3MiGNW6;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1F065C42872;
	Thu, 19 Mar 2026 13:42:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F9485FDEB;
	Thu, 19 Mar 2026 13:41:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3B0210450748;
	Thu, 19 Mar 2026 14:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773927715; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m3/7nr3aRpZzfzYgf+X6Mw2TpExh66PSLsXw8GwCnv4=;
	b=k3MiGNW6q1b2vHqO0pUeWqKIHwcTewxUzPTxAjCniM+QFFdPsiD7d3lPZ2xsGxMADaGZZ4
	TUKwXyLUY9nz7UzC+gPFHn9r8zOuhuc9c7b/4du7OTKvwLjGz0vvhinT3E5dE/2LeH3le9
	AvKZGcmi0OrBAASAMC6NvHQY3b7GbxkRCOBmfMu7f5qS7fIuJPQ+tsNTIoKRA8bSXCXEaN
	SVvyIj4TvO9GdmJx+3mPNPoDUu165JUXD6OBcA7+Vl77Lviq1mM2WJdx86QB8YeW0uMXtX
	4B5IF79DzzcEnnGdgomzOWFs/Rc34F4ZJd/WuEx9KGIR7//xwjbox6YX2aE4UQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 14:41:54 +0100
Message-Id: <DH6SW5NRFL5I.ARPDBHZCXP22@bootlin.com>
Subject: Re: [OE-core] [PATCH 19/40] lttng-ust: upgrade 2.14.0 -> 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260319101332.2067-1-wangmy@fujitsu.com>
 <20260319101332.2067-19-wangmy@fujitsu.com>
In-Reply-To: <20260319101332.2067-19-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 13:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233527

On Thu Mar 19, 2026 at 11:13 AM CET, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the upgrade.

I believe this is breaking the lttng-tools build:

ERROR: lttng-tools-2.14.1-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/qemuarm64-alt/build/build/tmp/work/cortexa57-poky-linux/lttng-tools=
/2.14.1/temp/run.do_compile.2227508' failed with exit code 1
...
| In file included from ../../../../sources/lttng-tools-2.14.1/src/common/c=
ommon.hpp:12,
|                  from ../../../../sources/lttng-tools-2.14.1/src/bin/lttn=
g-sessiond/snapshot.hpp:13,
|                  from ../../../../sources/lttng-tools-2.14.1/src/bin/lttn=
g-sessiond/consumer.hpp:12,
|                  from ../../../../sources/lttng-tools-2.14.1/src/bin/lttn=
g-sessiond/buffer-registry.hpp:11,
|                  from ../../../../sources/lttng-tools-2.14.1/src/bin/lttn=
g-sessiond/buffer-registry.cpp:9:
| ../../../../sources/lttng-tools-2.14.1/src/bin/lttng-sessiond/buffer-regi=
stry.cpp: In function 'void buffer_reg_stream_destroy(buffer_reg_stream*, l=
ttng_domain_type)':
| ../../../../sources/lttng-tools-2.14.1/src/bin/lttng-sessiond/buffer-regi=
stry.cpp:488:78: error: 'struct lttng_ust_abi_object_data' has no member na=
med 'handle'
|   488 |         DBG3("Buffer registry stream destroy with handle %d", reg=
p->obj.ust->handle);
|       |                                                                  =
            ^~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3390
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3433
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/3394

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


