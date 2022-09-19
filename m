Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13453C54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:53:47 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.135.1663599217475251169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oaHg4-00EQnT-Sm; Mon, 19 Sep 2022 17:23:17 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oaHg4-000773-Qg; Mon, 19 Sep 2022 17:23:16 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v1 5/5] linux-libc-headers: switch from
 SRC_URI:append to SRC_URI +=
Date: Mon, 19 Sep 2022 17:23:08 +0300
Message-Id: <20220919142308.26441-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220919142308.26441-1-mikko.rapeli@linaro.org>
References: <20220919142308.26441-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20220919142308.26441-5-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:53:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170877

The :append can not be removed via bbappends in custom layers so it's
better to use += appends when ever possible.

(From OE-Core rev: 6604795a3f7e53fd748d4103b521d8baf35cf7be)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab9f6d205f655cffa2c75d89ba0456fa0586480c)
---
 .../linux-libc-headers/linux-libc-headers_5.16.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
index c64629d094..d5039264c4 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
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


