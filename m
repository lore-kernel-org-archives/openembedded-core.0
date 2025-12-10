Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF80CD3C53D
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:43:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14533.1765370582373350269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XGD6xT6c;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B022CC19640;
	Wed, 10 Dec 2025 12:42:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A8D660714;
	Wed, 10 Dec 2025 12:43:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7AD1119316C9;
	Wed, 10 Dec 2025 13:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765370580; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+QhR5zylUpWMHO/UFFDmq7A+ZNVWW1b/czyuQiqI2Ys=;
	b=XGD6xT6cNlgw9gyE4h4fwvNWJ27qWlkuDceaAPVQrlY9xMIo45Z9Vun2Y2Pj1GXsKMca1H
	5+QENBZRKgXcEupsAKHltnLOW+hLHKQkV/QVA82XYFdlfIYGS3Kx8uRFZC5rLBTQMghtwi
	8GNb3+PL+OsNoNlcqgrNkVdNfvKLFA1ijAqMONRU7P7fP+RW2b+Q+Ck2qUSUL6hCxkuwO3
	ozgJ9nR0k8GlQQhvd+MG1C8Zn0ZhlpkXjFD8SB1oS3lhWBimindHUhtbYfVh4wjAxyMW3s
	REf42lxw6Y1dja68H1pPYuzUFsKe+RD5TwCg6CtCM0EsECxWxsPwyXum5KdPkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 13:42:58 +0100
Message-Id: <DEUJN3MKRQKB.3HDWIDZ835RP7@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 4/4] mesa: upgrade 25.2.5 -> 25.3.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251210043728.847548-4-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251210043728.847548-4-dmitry.baryshkov@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 12:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227475

On Wed Dec 10, 2025 at 5:37 AM CET, Dmitry Baryshkov via lists.openembedded=
.org wrote:
> Upgrade Mesa to the latest release. Drop VDPAU tracker (dropped
> upstream). Add support for ethosu and rocket Gallium drivers.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for your patches.

It looks like the new version is not building correctly for armv5:

ERROR: mesa-2_25.3.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-work=
er/qemuarmv5/build/build/tmp/work/armv5e-poky-linux-gnueabi/mesa/25.3.1/tem=
p/run.do_compile.92740' failed with exit code 1
...
| In file included from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn=
_protocol_driver_cs.h:11,
|                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn=
_protocol_driver_types.h:11,
|                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn=
_protocol_driver_handles.h:11,
|                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn=
_protocol_driver_structs.h:11,
|                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn=
_protocol_driver_transport.h:12,
|                  from ../sources/mesa-25.3.1/src/virtio/vulkan/vn_ring.c:=
10:
| ../sources/mesa-25.3.1/src/virtio/vulkan/vn_ring.c:18:1: error: static as=
sertion failed: "vn_ring_shared requires lock-free 32-bit atomic_uint"
|    18 | static_assert(ATOMIC_INT_LOCK_FREE =3D=3D 2 && sizeof(atomic_uint=
) =3D=3D 4,
|       | ^~~~~~~~~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2673

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


