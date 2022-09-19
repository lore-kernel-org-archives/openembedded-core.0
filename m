Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00745ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:53:37 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.133.1663599210444224724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oaHg3-00EQnL-Kp; Mon, 19 Sep 2022 17:23:15 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oaHg3-00073q-Ih; Mon, 19 Sep 2022 17:23:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v1 3/5] go-native: switch from SRC_URI:append to
 SRC_URI +=
Date: Mon, 19 Sep 2022 17:23:06 +0300
Message-Id: <20220919142308.26441-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220919142308.26441-1-mikko.rapeli@linaro.org>
References: <20220919142308.26441-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20220919142308.26441-3-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:53:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170876

The :append can not be removed if needed in other layers.

(From OE-Core rev: e129d2f7e3ba312ab5383397eeabf7273d23a529)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09ed655c2a8a0a246e7dcc745ec89f7a1d13813d)
---
 meta/recipes-devtools/go/go-native_1.17.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-native_1.17.13.bb b/meta/recipes-devtools/go/go-native_1.17.13.bb
index 76c0ab73a6..ddf25b2c9b 100644
--- a/meta/recipes-devtools/go/go-native_1.17.13.bb
+++ b/meta/recipes-devtools/go/go-native_1.17.13.bb
@@ -5,7 +5,7 @@ require go-${PV}.inc
 
 inherit native
 
-SRC_URI:append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
+SRC_URI += "https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
 SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
 
 export GOOS = "${BUILD_GOOS}"
-- 
2.17.1


