Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A5CF433DC
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:12:45 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39945.1776413559838191533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kzkBioo8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DDD70C5C3D7
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:13:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8549260497;
	Fri, 17 Apr 2026 08:12:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C0DA1046095E;
	Fri, 17 Apr 2026 10:12:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776413557; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=seI1oWAHPGxHjewPhpydyfVGlcpXbTPBmW1AJnbDONk=;
	b=kzkBioo8PXOoboSqpmtel8aih6JQFFuE1hEKecF5VfGWbHBojNIeRjD3qEh36EWA0gpNoH
	yZENEjA92PCuqmC0wcT7EkOqCRje61DMXCVhkIP/aFNZ6Lms24n1iwMIEm3LUokmJIQI5o
	vdRBj8JYHH6OTHewaUopJWKOQA1kpD2sqjjZovSME/4q3itmBST6d6EsxJhAApoxcRyM6Z
	z0Dr6VPNDKpAz0OLbmM2dND8VLwjkDttDLkmZ79U1FLYlqK9KmPPyGtMu5qOBpsxGMxGMS
	/1cbqiubnItSJqKwX/ykJx+dKx9Gp3/S6YeGBQwwMh3qUzSa54VdtLk9+huq3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 10:12:35 +0200
Message-Id: <DHVA1T5G5BSM.1PPMQ6SPQQC5X@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mangadi@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] weston: backport gl-shaders fix to avoid
 shader compiler crashes
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260407094759.3116923-1-mangadi@qti.qualcomm.com>
 <DHOHLMLD4MQ9.34VQG7IIO7F3C@bootlin.com>
In-Reply-To: <DHOHLMLD4MQ9.34VQG7IIO7F3C@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235485

On Thu Apr 9, 2026 at 10:38 AM CEST, Mathieu Dubois-Briand wrote:
> On Tue Apr 7, 2026 at 11:47 AM CEST, Mahesh Angadi via lists.openembedded=
.org wrote:
>> Some GPU shader compilers do not optimize away unused YUV shader
>> uniforms, even when the associated code paths are unreachable. This can =
cause
>> Weston to hit assertion failures at runtime on non-Mesa platforms, despi=
te
>> working correctly on Mesa-based drivers.
>>
>> Backport the upstream gl-shaders fix to restore stable behavior across
>> GPU drivers.
>>
>> Signed-off-by: Mahesh Angadi <mangadi@qti.qualcomm.com>
>> ---
>
> Hi Mahesh,
>
> I note this is breaking builds with meta-qcom, as the patch is also
> present in there. But as you are the author of changes in both side, I
> bet you already knew this. :)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/565
>
> Thanks,
> Mathieu

Hi Mahesh,

This patch is now merged into master, so builds with meta-qcom are now
failing. Are you taking care of fixing this into meta-qcom or should I
contact maintainers?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/619

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


