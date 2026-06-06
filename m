Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5378CD8C8E
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 12:19:17 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14873.1780748353086568756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2026 05:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=MC5RnzEo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260606121910e133ce9069000207e0-hh26my@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260606121910e133ce9069000207e0
        for <openembedded-core@lists.openembedded.org>;
        Sat, 06 Jun 2026 14:19:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Tz8ZnTCFoJbD6WMKTZwjNRsSVtDzL4xgYiS871dZd64=;
 b=MC5RnzEoEhMWEfr+VUxEMjEgmKb9by75a7nitzvm1hvktDHkI81ugEI2nQSXBEXv8boemv
 bjUxXLz6BjATArYhqmR+65hoFo6sK47yoibUsnoXaRCtxfUclFNKp6kf1r2iIdVyPwLcEEGw
 KspErthnTyfXy4RHmu+AdhwViTDD2s1ul4Sg5LtpKaFZiuTcF2pUyctX+bC+QlAFl9h7+aQq
 7fBPvCs56AkusUBGak+aomyKbEULqGjC2I4rFDZBiP+m4L7/OvGWibbuqXTfiaQYtx3bR25a
 EW+6ukCzJyRPvh96H4gOcA8Nl5sgedbvj5TMgBnV+EJXaBcj/QW6wGag==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/3] oeqa/selftest/fitimage: fix missing whitespace around assignment
Date: Sat,  6 Jun 2026 14:17:55 +0200
Message-ID: <20260606121836.2782754-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260606121836.2782754-1-adrian.freihofer@siemens.com>
References: <20260606121836.2782754-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 12:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238217

From: Adrian Freihofer <adrian.freihofer@siemens.com>

BitBake conf parser expects spaces around '=' in assignment statements.
The missing spaces in the config string written to selftest.inc caused a
BitBake warning about non-standard syntax.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3541c07520..34b248ee0b 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1865,7 +1865,7 @@ UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "the-kernel-config-key"
 UBOOT_SIGN_IMG_KEYNAME = "the-kernel-image-key"
-UBOOT_MKIMAGE_DTCOPTS="-I dts -O dtb -p 2000"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 FIT_SIGN_INDIVIDUAL = "1"
 """
         self.write_config(config)
-- 
2.54.0


