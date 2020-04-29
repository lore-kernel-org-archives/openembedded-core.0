Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.1076.1588155715120489104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 03:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jTjqi-0006Fg-0b; Wed, 29 Apr 2020 12:21:52 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jTjqh-0006o9-4G; Wed, 29 Apr 2020 12:21:51 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH] openssl: upgrade 1.1.1f -> 1.1.1g
Date: Wed, 29 Apr 2020 12:21:45 +0200
Message-Id: <20200429102145.24242-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

This also fixes CVE-2020-1967.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 .../openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 3fa2b41fb929..66fa8f7d0a0a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
+SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.26.2

