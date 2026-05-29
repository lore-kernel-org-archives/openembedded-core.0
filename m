Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52818CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 12:42:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9350.1780058542569390252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 05:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0jbKh3Vc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E759BC6245A;
	Fri, 29 May 2026 12:42:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 430E8601FA;
	Fri, 29 May 2026 12:42:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9ED510888CBE;
	Fri, 29 May 2026 14:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780058539; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y2G+3dag7fmZJPSYuPsbxmNbkyTmxkK3mqxLkumKpTQ=;
	b=0jbKh3VcPad5BMxijkEvlSaCTc5XYVHmjd7uwqcDxS6Umnu4YoCPLv06+yQqpdzK3JBmZm
	Z9W6hauuIoxi5iEZzdoNX0yMqwG2/E5X70kUsCkWH+L/Hz9z0PplRT0H9GtlVHFX4KtGTl
	98C7jNae4cnU8EBAKQzpSi+GagXA+tutpZ9uBOULfQG9GKLoiXDaBSw0IgjnVaQkrgWDsI
	3W50UP5MV07LRYrT63JF9wCdVJLuWwb/q24ci2e68ssgATKf2drzEflpxgja+FFOsRr6pq
	6ExYbPSN3U67Ml6vZOFIkAbU0ReaLqREaYNl/Mk3rRtLQceitircSWskWTceEA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 14:42:16 +0200
Message-Id: <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Quan.Sun@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
In-Reply-To: <20260528202639.4097815-1-Quan.Sun@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 12:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237751

On Thu May 28, 2026 at 10:26 PM CEST, Quan Sun via lists.openembedded.org w=
rote:
> From: Quan Sun <Quan.Sun@windriver.com>
>
> Upgrade QEMU to version 11.0.0.
>

Hi,

Thanks for the new version.

It looks like we are almost there, I now have just one selftest failing:
2026-05-29 08:23:23,583 - oe-selftest - INFO - runtime_test.TestImage.test_=
testimage_virgl_gtk_sdl (subunit.RemotedTestCase)
2026-05-29 08:23:23,584 - oe-selftest - INFO -  ... FAIL
...
runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: -qmp unix:./.i1y4=
asol,server,wait: info: QEMU waiting for connection on: disconnected:unix:.=
/.i1y4asol,server=3Don
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID[=
eax=3D07h,ecx=3D00h].EBX.hle [bit 4]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID[=
eax=3D07h,ecx=3D00h].EBX.rtm [bit 11]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID[=
eax=3D07h,ecx=3D00h].EBX.hle [bit 4]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID[=
eax=3D07h,ecx=3D00h].EBX.rtm [bit 11]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID[=
eax=3D07h,ecx=3D00h].EBX.hle [bit 4]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID[=
eax=3D07h,ecx=3D00h].EBX.rtm [bit 11]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID[=
eax=3D07h,ecx=3D00h].EBX.hle [bit 4]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID[=
eax=3D07h,ecx=3D00h].EBX.rtm [bit 11]
glx: failed to create dri3 screen
failed to load driver: vgem

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3924
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3786

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


