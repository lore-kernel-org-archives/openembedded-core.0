Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.64333.1597750316347803941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 04:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1k7zqK-0002WC-49; Tue, 18 Aug 2020 14:31:52 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1k7zqK-0008VJ-1E; Tue, 18 Aug 2020 14:31:52 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH 1/2] alsa-topology-conf: use ${datadir} in do_install()
Date: Tue, 18 Aug 2020 14:31:42 +0300
Message-Id: <20200818113143.31819-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 3.3 (+++)
X-Rspam-Report: Action: no action
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: SUBJECT_HAS_CURRENCY(1.00)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Message-ID: 20200818113143.31819-1-mikko.rapeli@bmw.de
X-Rspam-Bar: +++
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Fixes build with custom directory structure.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb
index fd949be8a0..3575c460e4 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb
@@ -10,8 +10,8 @@ SRC_URI[sha256sum] = "833f99b2cbda34e0cfef867ef1d2e6a74fe276bb7fc525a573be32077f
 inherit allarch
 
 do_install() {
-        install -d ${D}/usr/share/alsa
-        cp -r ${S}/topology ${D}/usr/share/alsa
+        install -d "${D}${datadir}/alsa"
+        cp -r "${S}/topology" "${D}${datadir}/alsa"
 }
 
 PACKAGES = "${PN}"
-- 
2.20.1

