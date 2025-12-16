Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714C2D5CC9D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:41:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18754.1765878077521610394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KkcriBty;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6A5144E41C26;
	Tue, 16 Dec 2025 09:41:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A1836071C;
	Tue, 16 Dec 2025 09:41:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 009AA11943283;
	Tue, 16 Dec 2025 10:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765878074; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kXatQgsKOL13PYYrFAnrhY2jY1wxS2PEWuEhKJSzivo=;
	b=KkcriBtyYrAhhKKgPCBQTzImX3U9BOVs/1qBkbdATbS4nO5/bY7g47kIPN/uM7BQWd9bzY
	dCLT6wP5EjLN6BgeiDRtvY0eFbDFnO35+zB9eIeJLq2sdOFXqdLdF6G/Uw7Y62mmhgzPzM
	VU1ztJ8gQ+90dwcZAACpX7OcNQJbmLUoh5hi+N3du98ow+CnfPwd1ZLfGMdX8bjVYPvotA
	PMBtDrkEyE47xlJ2U4u8LZNc2Zzt/kixg6nbAR4yOXOL5cLlulZNt87Mhq78J85y/OSjC2
	qFKpP0mXUGciDZ/SLiPpLztTIBO8oijntJtyOau6cyn0IyHNrggmc4V7iCVEYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 10:41:12 +0100
Message-Id: <DEZJJ73RABKA.BBYM9XN1HSLS@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] socat: 1.8.0.3 -> 1.8.1.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251215084345.1797393-1-hongxu.jia@windriver.com>
 <20251215084345.1797393-2-hongxu.jia@windriver.com>
 <DEZJIBHT7GKY.AIXJ4FBZHXER@bootlin.com>
In-Reply-To: <DEZJIBHT7GKY.AIXJ4FBZHXER@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227932

On Tue Dec 16, 2025 at 10:40 AM CET, Mathieu Dubois-Briand wrote:
> On Mon Dec 15, 2025 at 9:43 AM CET, hongxu via lists.openembedded.org wro=
te:
>> License-Update: No change, update README to add new lines
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>
> Hi Hongxu,
>
> Thanks for your patch.
>
> It looks like the new version is having build issues with musl:
>
> ERROR: socat-1.8.1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/socat/1=
.8.1.0/temp/run.do_compile.476916' failed with exit code 1
> ...
> | ../sources/socat-1.8.1.0/xio-netlink.c: In function 'xio_netlink_mtu':
> | ../sources/socat-1.8.1.0/xio-netlink.c:33:59: error: initialization of =
'int' from 'void *' makes integer from pointer without a cast [-Wint-conver=
sion]
> |    33 |         struct msghdr rtmsg =3D { &sa, sizeof(sa), &iov, 1, NUL=
L, 0, 0 };
> |       |                                                           ^~~~
> | ../sources/socat-1.8.1.0/xio-netlink.c:33:59: note: (near initializatio=
n for 'rtmsg.__pad1')
> | make: *** [<builtin>: xio-netlink.o] Error 1
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

Sorry, I forgot to add some links:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2910
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1595

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


