Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C527D58B1D
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:02:41 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28179.1773579754738474092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QwhAOcxJ;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1136; q=dns/txt;
  s=iport01; t=1773579754; x=1774789354;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GOEil2VvH5jLnvCo3/mGp2PbHcJ5Kk5uRFWincTx9ag=;
  b=QwhAOcxJqp7y/4Nbg5ggs9mObQ3dvQ56pI7PiHAo5jXYgg52eUaBWBR0
   5ouASIhc2qrCoDTZ2uRZ1Cp0Cj+2f4OfJ42i4tAu98QwnuDbKuWkQo0kv
   cQZcmTYV3UOkWXD1dwmDf483O6FfuW8nqoloIWoKdaVNbRt3cjaUmuPS4
   ViMstGFE3R3kAcuWfEL4XRieb3hV8VYnp2XeatLiSwH5TZ7CuU9OIMPjX
   pMHhZc05ax3NaSq499scI/sRjYrhN39tqHJzocsHsIbUP9J7ovLu4ejc7
   7jtRvaZshtq8mWX5nSTNG2VbIHC2YHgez4Yvb7iG/vlotNbPRpWyFahhI
   w==;
X-CSE-ConnectionGUID: ycM2SCdPQoK2IVRCmctc+Q==
X-CSE-MsgGUID: DjseuU+/QHqSjMxsjZ9/Ug==
X-IPAS-Result: =?us-ascii?q?A0CwBQAXrbZp/5T/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyAVYgJgsrKxmDAgGCcwIBEbFagiyBAeAiAQsUA?=
 =?us-ascii?q?YE4hTyIGXSEeicbG4FyhAd2hAqBBoV3BIIigQ6Bf5EtSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaQE6gVlwFYMiC?=
 =?us-ascii?q?UkZD45fzHIjNT0CBwIHDQMLkWiBfQEB?=
IronPort-Data: A9a23:3oEZSauDxgQfqAz8ArSBddQ2bufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKW7VbvePZzDzf9pwbtvg80hX78PXyIViTQQ9qytmRStHgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/na9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw6+1SW1pl+
 cQhLxNXTy65rOe93Ln4c7w57igjBJGD0II3oHpsy3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtHYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoLbHZ0JwRrA9
 woq+UzVAAoXKeHcjgOl60muo//UnxGqH78dQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:aZS/qarpE9QwhasNEFTrQS8aV5oqeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT0C7Y+eAa2STSq3BkW6FL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3AqESyx2qE2KdRO6cv1pbRFsrmUdEuVyfm53voGki?=
 =?us-ascii?q?bU0dXcpaQQkObu5oxxg=3D=3D?=
X-Talos-MUID: 9a23:/T+rhgsxxssu0wsul82nqDN5OdpVoOOXKFk2k7AWoMu2ZGtNNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690047409"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:02:34 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id CF7C718000261
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:33 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 7D82BCC12B5; Sun, 15 Mar 2026 06:02:33 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][master][PATCH 1/7] python3-libarchive-c: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 05:59:42 -0700
Message-Id: <20260315125948.3002743-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315125948.3002743-1-deeratho@cisco.com>
References: <20260315125948.3002743-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233109

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-libarchive-c to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-devtools/python/python3-libarchive-c_5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 8b5de01b69..76396be8fd 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -36,7 +36,7 @@ RDEPENDS:${PN}-ptest += " \
         locale-base-en-us \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/libarchive
-- 
2.35.6


