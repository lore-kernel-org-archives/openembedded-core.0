Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E21CCD195
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 10:23:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.5402.1761128609877274061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 03:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kbV2unXR;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 52A341A15CE
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 10:23:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A51B606DC;
	Wed, 22 Oct 2025 10:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E741D102F23A9;
	Wed, 22 Oct 2025 12:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761128607; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/T3GNARzCDlXiAwuMx4ZJ40mXqeck4B71yCGHEq+ChE=;
	b=kbV2unXRUwI5Tjzqofi6lEutxdafxdQjSr8Iizt0GUQ0Bbky6uQebuUnqlLoSSX8FtiClY
	mPIrSqgefcfni5GLOtRhW3nvjoaF5yuU9gUIMf/aaSCAl+LvQZDt3EQrxxPLPimqZKShXu
	byo89bGprVlJq3nmpcbVzjoQTouFUUz1O8dDO561R19a+sQqqnevpBJqJJDmE+20PGE2Y8
	JcekyreWvFDyq/HUdZCsvykMNDPlVnobFRi0S7ccVFd0QC7cg8l6DkMMGyT/zI+pAdseo8
	FBaVhxbQBIPG22umZKiDEDE4QyfQWRufe/5gzdqPjcuL6bMmFLmUY4N6Dx1ijg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 12:23:19 +0200
Message-Id: <DDORZHMNHUIA.19MW98T9MIS1M@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 5/5] binutils: patch CVE-2025-11494
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251020220912.483748-1-peter.marko@siemens.com>
 <20251020220912.483748-5-peter.marko@siemens.com>
In-Reply-To: <20251020220912.483748-5-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 10:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225183

On Tue Oct 21, 2025 at 12:09 AM CEST, Peter Marko via lists.openembedded.or=
g wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick commit per NVD CVE report.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---

Hi Peter,

Thanks for your patch. I suspect the last one is responsible of a
reproducibility issue in gnu-efi:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/gnu-efi_4.0.2-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/gnu-efi_4.0.2-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/gnu-efi-4.0.2-r0.x86_64_v3.rpm

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20251021-u0jap9k2/

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


