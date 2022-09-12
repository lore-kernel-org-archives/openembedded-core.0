Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005ABC6FA8A
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 07:32:58 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.4834.1662967975954546501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 00:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oXdvw-006qmM-2s; Mon, 12 Sep 2022 10:32:54 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oXdvw-0004rR-1A; Mon, 12 Sep 2022 10:32:44 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/7] glibc-tests: use += instead of :append
Date: Mon, 12 Sep 2022 10:32:18 +0300
Message-Id: <20220912073221.16601-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220912073221.16601-1-mikko.rapeli@linaro.org>
References: <20220912073221.16601-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: 0.0 (/)
X-Rspam-Report: Action: no action
 Symbol: ASN(0.00)
 Message-ID: 20220912073221.16601-4-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 07:32:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170528

:append can not be modified in bbappends and thus += is
better in re-usable, generic layers and recipes.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/glibc/glibc-tests_2.36.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.36.bb b/meta/recipes-core/glibc/glibc-tests_2.36.bb
index aca9675ebb..c71c0831c6 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.36.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.36.bb
@@ -4,7 +4,7 @@ require glibc-tests.inc
 inherit ptest features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
-SRC_URI:append = " \
+SRC_URI += "\
 	file://run-ptest \
 "
 
@@ -29,7 +29,7 @@ python __anonymous() {
 RPROVIDES:${PN} = "${PN}"
 RRECOMMENDS:${PN} = ""
 RDEPENDS:${PN} = " glibc sed"
-DEPENDS:append = " sed"
+DEPENDS += "sed"
 
 export oe_srcdir="${exec_prefix}/src/debug/glibc/${PV}/"
 
-- 
2.17.1


