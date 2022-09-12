Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18533C6FA8B
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 07:33:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.4842.1662967978137361065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 00:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oXdvy-006qmo-Ch; Mon, 12 Sep 2022 10:32:56 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oXdvy-0004vB-AQ; Mon, 12 Sep 2022 10:32:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 7/7] linux-libc-headers: switch from SRC_URI:append to SRC_URI
 +=
Date: Mon, 12 Sep 2022 10:32:21 +0300
Message-Id: <20220912073221.16601-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220912073221.16601-1-mikko.rapeli@linaro.org>
References: <20220912073221.16601-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: 0.0 (/)
X-Rspam-Report: Action: no action
 Symbol: ASN(0.00)
 Message-ID: 20220912073221.16601-7-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 07:33:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170531

The :append can not be removed via bbappends in custom layers so it's
better to use += appends when ever possible.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../linux-libc-headers/linux-libc-headers_5.19.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb
index 528e1d3379..3557526d14 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb
@@ -7,7 +7,7 @@ SRC_URI:append:libc-musl = "\
     file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch \
    "
 
-SRC_URI:append = "\
+SRC_URI += "\
     file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch \
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
 "
-- 
2.17.1


