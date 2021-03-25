Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.2206.1616700057500836893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 12:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1lPVXK-0006tT-U5; Thu, 25 Mar 2021 21:20:55 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1lPVXK-0000no-SP; Thu, 25 Mar 2021 21:20:54 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH][gatesgarth][dunfell] openssl: update to 1.1.1k to fix CVE-2021-3450 and CVE-2021-3449
Date: Thu, 25 Mar 2021 21:20:52 +0200
Message-Id: <20210325192052.2976-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
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
 Message-ID: 20210325192052.2976-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Only security issues fixed in this release according to
https://www.openssl.org/news/cl111.txt

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
index f054d2fdba..5f281197c9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf"
+SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.20.1

