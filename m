Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9C19E6AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:14:02 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 18:14:01 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 0B0B028BA1D;
	Thu, 23 Apr 2015 18:14:02 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Apr 2015 18:13:57 +0200
Message-ID: <1429805637-1757-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] curl: upgrade to 7.42.0
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
X-List-Received-Date: Thu, 23 Apr 2015 16:14:05 -0000
Content-Type: text/plain

Upgrade include these security fixes:
1. CVE-2015-3143
2. CVE-2015-3144
3. CVE-2015-3145
4. CVE-2015-3148

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/{curl_7.41.0.bb => curl_7.42.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.41.0.bb => curl_7.42.0.bb} (92%)

diff --git a/meta/recipes-support/curl/curl_7.41.0.bb b/meta/recipes-support/curl/curl_7.42.0.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.41.0.bb
rename to meta/recipes-support/curl/curl_7.42.0.bb
index 49ce716..d4445ff 100644
--- a/meta/recipes-support/curl/curl_7.41.0.bb
+++ b/meta/recipes-support/curl/curl_7.42.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "87e36f88b7a0f9683fa56f1334562c3a"
-SRC_URI[sha256sum] = "9f8b546bdc5c57d959151acae7ce6610fe929d82b8d0fc5b25a3a2296e5f8bea"
+SRC_URI[md5sum] = "0a10174a0ea5105c46e92b51e1b311f8"
+SRC_URI[sha256sum] = "32557d68542f5c6cc8437b5b8a945857b4c5c6b6276da909e35b783d1d66d08f"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


