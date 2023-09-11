Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2804EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 13:40:11 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.58693.1694439606393709453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 06:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qfh91-00AWY8-0x;
	Mon, 11 Sep 2023 16:40:03 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qfh91-00AzYa-1e; Mon, 11 Sep 2023 16:40:03 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] openssh: update Upstream-Status to Denied in test logging patch
Date: Mon, 11 Sep 2023 16:39:49 +0300
Message-Id: <20230911133950.2618970-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: NEURAL_SPAM(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230911133950.2618970-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 13:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187490

Upstream rejected the change:
https://github.com/openssh/openssh-portable/pull/437

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...0001-openssh-regress-Makefile-print-logs-if-test-fails.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
index baa68dc6ff..3355ac4f23 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
@@ -14,7 +14,7 @@ Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
  regress/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/437]
+Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
 
 diff --git a/regress/Makefile b/regress/Makefile
 index d80bf59..a972dff 100644
-- 
2.34.1


