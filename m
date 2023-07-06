Return-Path: <dl9pf@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3823FEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:03:50 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web11.21711.1688648626243865608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=dl9pf@gmx.de header.s=s31663417 header.b=ccf18mbB;
 spf=pass (domain: gmx.de, ip: 212.227.17.20, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688648624; x=1689253424; i=dl9pf@gmx.de;
 bh=lVE8plVEOCvfdJGegBm/zt2z1MceuI0QDw1A0ZtZy6Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ccf18mbBVXEKL6HIrn4fyPYv309OjO3MZbbA6YDv77yGOwYnJ9WMFl9SNbybD/986sInpFd
 C0NHeODG6QSqTc5neMblOKWt5VYhITG/QkJHmjLpxzayB/51EZ4iDiDv0JiwSTlkAoalPm8QA
 2Wx+si4tJKWDp+Cgmm9wVf5CPzSuPkwPlVe/W1ZyUyFH0emUlSS2IELMh+9Rcea/+F3a0iJvi
 bItOyt8Z3WZ9xhgDZi9eQZLm52esrgLiYaSCgUEGlqCopkR6T7MMcPbMAj91bUAHXnbZehG5D
 p4aSuTjxyZ738i0ufWe0h2+5UUQaL62QpenDyuEslX7gLLjxdd8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from gmx.de ([77.23.145.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1pkFgm1mFk-00bcpN; Thu, 06
 Jul 2023 15:03:44 +0200
From: dl9pf@gmx.de
To: openembedded-core@lists.openembedded.org
Cc: dl9pf@gmx.de
Subject: [kirkstone][PATCH] backport reproducible build selftest user-facing settings
Date: Thu,  6 Jul 2023 15:01:03 +0200
Message-ID: <20230706130338.7144-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Provags-ID: V03:K1:o6xZy5JhcavHRHhu6w336HwpylPtlTj8sZVTX9sUmHNHCJmaSNe
 BQv13qL8NllW4SqRoHWVaklaIL9CLgcBSdTfxQgHPB7wZdsFrqEQ0DK0JBea4d8E6xyb+tq
 0q5MQKc2IZPTg1tVYV8w3uhsQRSkdowSBR5xatYXAP4d7CPcGXvYh5NNgPxCEnv3AgeUbfz
 5qh4uQoAK5MssvQhTcfXQ==
UI-OutboundReport: notjunk:1;M01:P0:RUwRyQg7Rv8=;AYPjVKpEn704a2RMa1Cs4RM3oD2
 Z0ihZBpnazaoz99Lqlo5Svx/XZ0JvOgY78yM0CUtp8IXKKQw9Yl3+Jnt18o+WK60WLdWg9NUv
 sbIWClY4vA78IQScjmqUnnc/0FYKhRNEvBSrV+23Z5JtPtM6NDYY/bp4s+7fJLbfRkv+dOJjM
 VhrgxpE5qM1Rz4gVgSU8SKnWXcBk/bwM2Bh2hVk3pzzFTuD5vZk2ujj+nBSCXlipdCU/O9daA
 Z9B5N5h3rgXu4KRvgmUemqllcxty5qCIZUzXTOox2RhDx0bLbh596cwi2rmOLLmEWAqa4jrmC
 RcHuXPZr+FylfFhGlrsDscbyZHdbgocRFFmeQw8XFt79izMxsh6gI/VkdB4jTW1Mpst+8jwbj
 xh2KY1pqNF9izbCq1Kn3k+MIs4Vn+r1v2L/li63eIj08qyGieP59crDTeoQ7jL6P5/9yIy/9v
 f4NWaVGalaMU4xmLCSXyRVdVGFyy4Y/zPOb20ao7taPW0xTDGMPfDz7UIAEuvXGA+YItTrOQt
 96lV7alD/z5YEyFBjbXVghYLNL31/4DCJxphY/FW4xSf7gM/s1Y/fu5x0soHFKbNVAZKcAjBz
 3MBAyoi+qskpLHwX4+wpdSDkGdTs4oJsGqCsfplIzQOhCavWEUP4xEQt6z081y4r1K0A5B0yp
 kODAVvGdZiRo5BvYUHLjVpKdPNFovgG6juJdNdivuWw8K0zm8N97pRMsukoKv+NvQEgCRFK66
 l5pkH6H4SgQ4mleZ3auGwaPdNtRXtd+AYqTpoE7vAZyqFExS2/4xgQhQJGyNOLGA8Hzp19v9q
 36o9A20WjdRyh6TwPWBsC+uKgX28CKpmEO4We6A4AUMH8AEqMZeU9vyyLDcZFueiWjXAZG0gw
 npMN+M7aJTQtq2+LbhE/CjtC0V7n2HINo4ou6hT1wEUUllmMdoIrZyigOqFOyOFbFZdIRH/qc
 ByBh2pyNdTxMjY0v8eKMaKxVS4k=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183940

Hi Steve!

Please consider backporting these patches:

    [kirkstone][PATCH 1/2] selftest reproducible.py: support different
    [kirkstone][PATCH 2/2] selftest/reproducible: Allow chose the package

For the autobuilder they are a no-op, but for users adopting the
reproducible selftest, these are very important settings to expose.

Best,
Jan-Simon




