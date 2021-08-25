Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.10795.1629868651318425321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 22:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1mIlI1-00066Z-C4; Wed, 25 Aug 2021 08:17:29 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1mIlI1-0004sB-AW; Wed, 25 Aug 2021 08:17:29 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [dunfell][PATCH] openssl: update from 1.1.1k to 1.1.1l
Date: Wed, 25 Aug 2021 08:17:21 +0300
Message-Id: <20210825051721.42695-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 1.3 (+)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: RCVD_IN_DNSWL_HI(-1.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210825051721.42695-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Changelog shows only security fixes for CVE-2021-3711 and CVE-2021-3712:
https://www.openssl.org/news/cl111.txt

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb} (98%)

Compile tested on master, tested in product CI system runs on x86_64 and
aarch64 on dunfell with all tests passing.

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index 5f281197c9..9412b19fa5 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
+SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.20.1

