Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D23C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 18:51:05 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.29689.1736967058074042927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 10:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WuBeaSB5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202501151850541f93cd82fbe086e3f6-qymoax@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202501151850541f93cd82fbe086e3f6
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jan 2025 19:50:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zDeGNC16Bx+A3A8hPy0mmMXurt3SVqG41RpNI9PyQ3A=;
 b=WuBeaSB5EfcTTSmXMVvFhnkChSF/OkiJcNeZeqg3UOv9EtusBc1ODS3nWmfFaLRHhEWxru
 XbkL3aLrHNd0nGFaPDmjRCX/inPoAcVAnjBcUX+tqqL2D8DgZYdC7DJ+6TiHH4iRebd+BhPJ
 ALnl91rV5vGp+fnkeLVjo729IJRLlsK8mkwyR+kNkZv9cZ4fUsKpMz6vWlKypb7mkkwZahP/
 EyYVMQX9Eru/XTdnVRad+J8zBSlNIFBI7wVwDaOH6TpiY08/DO/FBdp4CK/GLLfMceGD2MoT
 B8YfUjw9gu3+VfGgxDpaGlGhtGLeEe5FVLujYFa/ENfGncLH/Gz5NUjQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: remove obsolete CVE version suffix
Date: Wed, 15 Jan 2025 19:49:51 +0100
Message-Id: <20250115184951.439212-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 18:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209923

From: Peter Marko <peter.marko@siemens.com>

Since 3.0.0 openssl no longer uses characters in version suffix.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_3.4.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb b/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
index b7f96db3941..9d99c21c208 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
@@ -265,6 +265,3 @@ INSANE_SKIP:${PN} = "already-stripped"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
-
-CVE_VERSION_SUFFIX = "alphabetical"
-
-- 
2.30.2


