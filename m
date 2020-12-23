Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.4466.1608694400501832966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 19:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.195, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from loomas.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 42E9360002;
	Wed, 23 Dec 2020 03:33:16 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [gatesgarth][dunfell][PATCH] openssl: Update to 1.1.1i
Date: Tue, 22 Dec 2020 19:33:08 -0800
Message-Id: <20201223033308.2946687-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes a NULL pointer dereference in GENERAL_NAME_cmp function.

CVE: CVE-2020-1971

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 815955837b..c2db596f03 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
+SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.26.2

