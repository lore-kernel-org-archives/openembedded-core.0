Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B45F9D0CD
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 12:42:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17898.1776170535706881399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 05:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mDl0Vag0;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso52403865e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776170534; x=1776775334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V41nas67FPGyeAVBhoeHPTo6LS78gkDUtLnaB5TmuEg=;
        b=mDl0Vag0fs7Fp49dalUOCHSlunmo0H0AinXmnD1WEgBT2xRE/jl09SXRnCI2K5qwpj
         /5rDOpmq2ryFOE3FtPuxYZ1OL1aF2UZAPmv9/DqxrSS+wZqqA5Y0PT4KkGq8+LqhpBMA
         LdbZXOEji3AhaDDInK0El66lB5wR9UADQGOIBhyOsJWSPKimmAdkLhUlMMTsKJrVCg//
         mpdFwRmuPbp60eLqliO0gqY98DIwQqIH/zHt9SJdkcjSSr0kGIrYcGHtjCGpXFw51gj9
         Udg9DGDLMe5ztS57cSSjdiCYVE2YOFaS0TkIx0MNvbAX+FM443zXe9FTQx+Rx/DTs0jl
         Bt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170534; x=1776775334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V41nas67FPGyeAVBhoeHPTo6LS78gkDUtLnaB5TmuEg=;
        b=d0qiqZ8X4R4coDUm2R+BWdLu3IV7hpJBIodzcwC2898m4ZQnyu2L5T1opCfuEKKNNs
         8fHs1NXijU1B/vkhLon24vQKJg+JHEo8lmCZ9kWkSw/eIbTRmfcq6w8PlidR5pvYzYVI
         RJHK9WAdoR+nVeWBMzYq3IP847wLarr45Hu7ObX9hlH8qvx8VX+T6Wn3BGxU4wGnUudD
         cHO3/rfBSeYZXlVC6QwhdBpReeAAPKM+gRCX8MBk9XNIFh5B/DcKmgzuTpkOBoFXdl1R
         pUOMbC+03ZJOhiQCkmVd9L3N3CflT7cWcQambQUfx4OIAkK6DCNJZAmkvMwZwvNDmnEL
         E8rg==
X-Gm-Message-State: AOJu0YwzfrIC5E5ZpBbPJ7M3z9V9nKV4kgGH66gUiA3X3Hx41nzTtkQk
	rHSv9NikqfeqKQDq/6zC48s2bhgxFQU6LadAC2mSZ5KY3V4q+Zbwjav9kcBPEg==
X-Gm-Gg: AeBDieutQiAzYm8aDWRMRSL95Q5/mpJcafIg6bVU76vFEMorq7Hp9I3dnI7u+s/4c+Y
	ynEx8QhGw6x0BHICYYEBrIpH4vHInjLaFTlM81/dH4ER+Czz+Ism2n704NRTxHGcVS1Sfblz58Y
	79QhPXrOwCLVI2W3IBMgS5l+tFAXgcMVmBdxcaX9PxveviQfN7WM76lqNx0ra5upUx0rb8xQYcy
	Rj9SrMJhW0cB2F0W+Gklxcv6ju3PhLF9QuujQ5XOeZEtG0IYSyCdmzfRHuV35m617XxJFF/fu8x
	jBd3LOZP5aaGq/ZYBW8/sw0AHonaTrZC5LsLe7kfKZ1zo4iqn9GLCTCiflMCYZnHwMd5NB0cjy3
	lHS1WtdbjtTsVB3Nn/MH0XDecfvCUQlv2uhm9WKSjabRjdntOQC56IWPPLY9lQAvGMrm1jlpre2
	dLC/mj+GlQ9p6Aa6RSUU2P0QnFSAfo4KMPZNMFxzG0i92vz9TnqwpwVTOUuHCcGTJoIBHLVyROY
	FJ7gxLAADU7xkR3wekk
X-Received: by 2002:a05:600c:c0dc:b0:488:aa3d:fab1 with SMTP id 5b1f17b1804b1-488d68364f2mr156529555e9.17.1776170533763;
        Tue, 14 Apr 2026 05:42:13 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec090sm41694302f8f.12.2026.04.14.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:42:13 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] apr: remove space before the -std=gnu23 from apr_rules.mk
Date: Tue, 14 Apr 2026 14:42:10 +0200
Message-ID: <20260414124210.427846-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 12:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235157

From: Martin Jansa <martin.jansa@gmail.com>

When -std=gnu23 is added to CC_FOR_BUILD it's with additional space
we need to remove the space as well to avoid the difference between
the build where -std=gnu23 was added and removed by sed and wasn't
added at all like in:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260414-82oogy25/packages/diff-html/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-support/apr/apr_1.7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support/apr/apr_1.7.6.bb
index 9a7a8ddd74..8ad3756b3a 100644
--- a/meta/recipes-support/apr/apr_1.7.6.bb
+++ b/meta/recipes-support/apr/apr_1.7.6.bb
@@ -88,7 +88,7 @@ do_install:append() {
 	oe_multilib_header apr.h
 	install -d ${D}${datadir}/apr
 	# avoid reproducibility issue, -std=gnu23 is used only on hosts with gcc-14 and newer
-	sed -i '/^CC_FOR_BUILD=/s/-std=gnu23//g' ${D}${datadir}/build-1/apr_rules.mk
+	sed -i '/^CC_FOR_BUILD/s/\s-std=gnu23//g' ${D}${datadir}/build-1/apr_rules.mk
 }
 
 do_install:append:class-target() {

