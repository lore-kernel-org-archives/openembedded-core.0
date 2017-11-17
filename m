Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6E58178834
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 17:51:55 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 087315C38FD;
	Fri, 17 Nov 2017 18:46:32 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 18:51:41 +0100
Message-Id: <20171117175142.2642-3-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171117175142.2642-1-stefan@agner.ch>
References: <20171117175142.2642-1-stefan@agner.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510940793; bh=dn/BH8Kl+ORhZMrFkYweKH9cTkW0WZOt2XUTQuirEgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=GhYYcK/v0c3PXF6V+upbFZkPxOO6QPTUrE3pjGoDALTFFFFqku/xYnRQyCjDa1RH0HMTllhXKD7rR6xTUjCs2/GuHpenHVjU8aPCdRz+mpBGd5H1YKJ+NQYbvmQjmoLY+BJAe2ekbR+O+JNSMpOykihlXFQr0gJYt2uoKE1/6a4=
Cc: Stefan Agner <stefan.agner@toradex.com>, otavio@ossystems.com.br
Subject: [rocko][PATCH 3/4] openssl: Upgrade 1.1.0f -> 1.1.0g
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2017 17:51:55 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Deals with two CVEs:
* bn_sqrx8x_internal carry bug on x86_64 (CVE-2017-3736)
* Malformed X.509 IPAddressFamily could cause OOB read (CVE-2017-3735)

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../openssl/{openssl_1.1.0f.bb => openssl_1.1.0g.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.0f.bb => openssl_1.1.0g.bb} (96%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
similarity index 96%
rename from meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
index 711a95985a..5f3e9a9dfa 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cae6da10f4ffd9703214776d2aabce32"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "7b521dea79ab159e8ec879d2333369fa"
-SRC_URI[sha256sum] = "12f746f3f2493b2f39da7ecf63d7ee19c6ac9ec6a4fcd8c229da8a522cb12765"
+SRC_URI[md5sum] = "ba5f1b8b835b88cadbce9b35ed9531a6"
+SRC_URI[sha256sum] = "de4d501267da39310905cb6dc8c6121f7a2cad45a7707f76df828fe1b85073af"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
-- 
2.13.6


