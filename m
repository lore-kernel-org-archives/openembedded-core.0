Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDA4FA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 09:32:46 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.17457.1666603957155094654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 02:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1omtox-00GLoW-6d; Mon, 24 Oct 2022 12:32:35 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1omtow-00GPAZ-Tc; Mon, 24 Oct 2022 12:32:34 +0300
From: mikko.rapeli@linaro.org
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] os-release: add HOMEPAGE and link to documentation
Date: Mon, 24 Oct 2022 12:32:24 +0300
Message-Id: <20221024093224.3901493-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20221024093224.3901493-1-mikko.rapeli@linaro.org>
References: <20221024093224.3901493-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221024093224.3901493-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 09:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172081

From: Mikko Rapeli <mikko.rapeli@linaro.org>

It's important to use standard variable names in the
/etc/os-release file. Otherwise reporting version etc
details requires custom modifications in various tools.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/os-release/os-release.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 15194df61b..860ee97224 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -2,6 +2,7 @@ inherit allarch
 
 SUMMARY = "Operating system identification"
 DESCRIPTION = "The /usr/lib/os-release file contains operating system identification data."
+HOMEPAGE = "https://www.freedesktop.org/software/systemd/man/os-release.html"
 LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -10,6 +11,7 @@ do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 
+# See: https://www.freedesktop.org/software/systemd/man/os-release.html
 # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
 OS_RELEASE_FIELDS = "\
-- 
2.35.1


