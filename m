Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B21CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 21:53:54 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.3685.1761602031630290429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 14:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=T63JXDy0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-2025102721534989c6f593c200020740-cayg_v@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025102721534989c6f593c200020740
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 22:53:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vvc9JC5ZqgjYxp2uW+wkaGLk0/7CRvY4nusraEedGb0=;
 b=T63JXDy0l2KQbci7XQhmMomrTFVPsGrwBnX4LEmr/1YioR06uf5Xgc7JT9U0Fp1u9sbVC+
 axOnCf0B94wV+uxPKnskk1GikQnIr6iJLFabH8SsXguzUGunsw1C8nSvsAIGRavUZbizZWTj
 6TtNXb5WvoWAI0IYErOhByKzPn+mUwCUl76QbL1X7I2ZwTuflx8lY2Dhhyf15yp0d2ad+M5w
 z0JpDTouvCEnNC8uSYrdW9qB/2eF3pmbfm/RJjmnaxupoEdD0aseQbRgHZyh0fG7xKLphT9O
 QUqV4bN7Mnd0Oo9M6aU1mEjVzK6cZJL3JEYaCPvAbdb1S4oG62s7A+ww==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] uboot-config.bbclass: fix obsolete comment
Date: Mon, 27 Oct 2025 22:53:34 +0100
Message-ID: <20251027215334.2458150-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 21:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225367

From: Adrian Freihofer <adrian.freihofer@siemens.com>

fitImage is no longer a supported KERNEL_IMAGETYPE. The comment is wrong.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/uboot-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index eb82dd3583b..fd6c0451426 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -85,7 +85,7 @@ SPL_MKIMAGE_DTCOPTS ??= ""
 UBOOT_MKIMAGE ?= "uboot-mkimage"
 UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
 
-# Signature activation - this requires KERNEL_IMAGETYPE = "fitImage"
+# Signature activation
 UBOOT_SIGN_ENABLE ?= "0"
 
 # Arguments passed to mkimage for signing
-- 
2.51.0


