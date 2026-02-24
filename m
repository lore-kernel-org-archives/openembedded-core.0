Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE27EFB81A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 08:52:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16146.1771923172257358214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 00:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uxoNKm1v;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F8004E41057;
	Tue, 24 Feb 2026 08:52:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 242F75FD9D;
	Tue, 24 Feb 2026 08:52:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80A2F10368E75;
	Tue, 24 Feb 2026 09:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771923169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=83vebnOmd+LYFXsEts2suirenqrmTECx5HeEEFPoJ+Q=;
	b=uxoNKm1v693el4lFQyU+8m1EwDsL87/JYEIPpXRIxgkwzto8NuMBGtlZbd6JiCUBsCSbpd
	ZaqulzzSh8vAxxNV/Wnxcx6yVlJKAv6cTtwhxdt+4e5ZOQ8vi6PnGIRUEj7wan4y9hWkH3
	/e3CrH2CgCh/QX8ENvJuC5kuLOqwDZYbQGrDI1IJD69GK185uZiO2dvoBSlSGPwWjvM/4V
	dDGOb4b8yTfP32Z+D5xzTQ8IoXPag45TZ/kBeqzGKMVOoDrzTvm3PqKdXFys1CBj8DtbkR
	8a+xmrAZMf5uF4JJsiBAwDBUSbRWHjGvb4DEP39m8t//aOrtWT3D3IKUPjYocw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 09:52:46 +0100
Message-Id: <DGN2C9C4VRH6.2P5XSY46IY4HI@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] linux-firmware: upgrade 20260110 ->
 20260221
Cc: "Sairamreddy Bojja" <sbojja@qti.qualcomm.com>, "Vivek Puar"
 <vpuar@qti.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260223184247.394616-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260223184247.394616-1-dmitry.baryshkov@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231749

On Mon Feb 23, 2026 at 7:42 PM CET, Dmitry Baryshkov via lists.openembedded=
.org wrote:
> Upgrade the firmware package to latest release. Add firmware for TI
> TAS2783, Qualcomm Adreno A801, Qualcomm Glymur, Radxa Dragon Q6A CDSP
> and several Intel Sensors Hub firmware versions. Also pick up several
> ADSP topologies for Qualcomm X Elite and Qualcomm SM8450 based devices.
>
> License-Update: copyright years, new firmware
> Co-developed-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
> Signed-off-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
> Cc: Vivek Puar <vpuar@qti.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for your patch.

I bet you already know it, but just to be sure: this patch is breaking
builds with meta-qcom, so meta-qcom will need changes on this patch is
merged.

ERROR: linux-firmware-1_20260221-r0 do_patch: Applying patch '/srv/pokybuil=
d/yocto-worker/meta-qcom/build/meta-qcom/recipes-kernel/linux-firmware/linu=
x-firmware/0001-linux-firmware-qcom-sync-audioreach-firmwares-from-v.patch'=
 on target directory '/srv/pokybuild/yocto-worker/meta-qcom/build/build/tmp=
/work/all-poky-linux/linux-firmware/20260221/sources/linux-firmware-2026022=
1'
BBHandledException("Applying '0001-linux-firmware-qcom-sync-audioreach-firm=
wares-from-v.patch' failed:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/245

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


