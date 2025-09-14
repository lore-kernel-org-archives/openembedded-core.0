Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5968CAC58F
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 09:40:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.6346.1757842837757229437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 02:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=g2ObYu8g;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 553C01A0DDC
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 09:40:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A7CE6063F;
	Sun, 14 Sep 2025 09:40:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D867102F2925;
	Sun, 14 Sep 2025 11:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757842835; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8t+j4qcG0Cc7Al0gKRU+7P0x8GmoTYFA3yROsCcmh1o=;
	b=g2ObYu8gSYvJTK9y7z0ucVd0BbIwCQQ1JEPHqUkRi5bIOVvaNQkteYhzWQHnJuEjE+KOML
	iIoup/LGK7odlV3U78WSBjJNf4vPwj3Oq2GCQJj55z4LDkTkxuEW5rYPhoMjE9ag79G6NI
	mPlyWv2bGyMWyZuZwsCdKRwLSIwukuzapHNplgpvycbTB1pXuE1hXZllXNBlnX/2kSlV2c
	bdBwuaF5M1pA2S5rm/ojUoUfkFngB+nKfbXDbDtlJlXzJmYEv/QzCQGxdQ/l2Ve8PTz9JS
	djgpGnT/eN86MiyCSiNWuMbKIRbF41scKqj/p7Qo9iEs3Ipbe483W8dUndtzQg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 11:40:32 +0200
Message-Id: <DCSFA11LTKOJ.5F9G4SE07942@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: add PROVIDES for Vulkan and OpenCL
 ICDs
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250912134427.1763047-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250912134427.1763047-1-dmitry.baryshkov@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 09:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223344

On Fri Sep 12, 2025 at 3:44 PM CEST, Dmitry Baryshkov via lists.openembedde=
d.org wrote:
> In order to let BSPs easily select OpenCL and Vulkan Installable Client
> Drivers, add two virtual package names: virtual-opencl-icd and
> virtual-vulkan-icd.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for your patches.

It looks like it is introducing some build issue:

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Unable to install packages. Co=
mmand '/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/qemua=
rm64-poky-linux/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/bin/opkg =
--volatile-cache -f /srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/t=
mp/work/qemuarm64-poky-linux/core-image-sato-sdk/1.0/opkg.conf -t /srv/poky=
build/yocto-worker/qemuarm64-alt/build/build/tmp/work/qemuarm64-poky-linux/=
core-image-sato-sdk/1.0/temp/ipktemp/ -o /srv/pokybuild/yocto-worker/qemuar=
m64-alt/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato-sdk/1.0/r=
ootfs  --force-postinstall --prefer-arch-to-version   install kernel-devsrc=
 opkg packagegroup-base-extended packagegroup-core-boot packagegroup-core-e=
clipse-debug packagegroup-core-sdk packagegroup-core-ssh-openssh packagegro=
up-core-standalone-sdk-target packagegroup-core-tools-debug packagegroup-co=
re-tools-profile packagegroup-core-tools-testapps packagegroup-core-x11-bas=
e packagegroup-core-x11-sato psplash run-postinsts ssh-pregen-hostkeys' ret=
urned 1:
Solver encountered 1 problem(s):
Problem 1/1:
  - package packagegroup-core-tools-testapps-1.0-r0.qemuarm64 requires mesa=
-demos, but none of the providers can be installed
  - package mesa-demos-9.0.0-r0.cortexa57 requires libvulkan1 >=3D 1.4.321.=
0, but none of the providers can be installed
  - conflicting requests
  - nothing provides virtual-vulkan-icd needed by libvulkan1-1.4.321.0-r0.c=
ortexa57

Solution 1:
  - do not ask to install a package providing packagegroup-core-tools-testa=
pps

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2366
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2395

Can you have a look at this issue please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


