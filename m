Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id A455D72859
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 11:29:06 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Fri, 9 Jan 2015
	12:29:00 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id E90052800CB;
	Fri,  9 Jan 2015 12:29:00 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Jan 2015 12:28:15 +0100
Message-ID: <1420802895-57586-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] openssl: upgrade to 1.0.1k
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
X-List-Received-Date: Fri, 09 Jan 2015 11:29:14 -0000
Content-Type: text/plain

Upgrade includes 8 CVE bug fixes

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../openssl/{openssl_1.0.1j.bb => openssl_1.0.1k.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1j.bb => openssl_1.0.1k.bb} (92%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1k.bb
similarity index 92%
rename from meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1k.bb
index 2da18ae..16ffc58 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1k.bb
@@ -38,8 +38,8 @@ SRC_URI += "file://configure-targets.patch \
             file://run-ptest \
            "
 
-SRC_URI[md5sum] = "f7175c9cd3c39bb1907ac8bba9df8ed3"
-SRC_URI[sha256sum] = "1b60ca8789ba6f03e8ef20da2293b8dc131c39d83814e775069f02d26354edf3"
+SRC_URI[md5sum] = "d4f002bd22a56881340105028842ae1f"
+SRC_URI[sha256sum] = "8f9faeaebad088e772f4ef5e38252d472be4d878c6b3a2718c10a4fcebe7a41c"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.9.1


