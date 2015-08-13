Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6E66173D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 23:08:33 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 14 Aug 2015 01:08:31 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 54FC928BA20;
	Fri, 14 Aug 2015 01:08:32 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Aug 2015 01:08:28 +0200
Message-ID: <1439507308-64809-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] curl: upgrade to 7.44
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
X-List-Received-Date: Thu, 13 Aug 2015 23:08:40 -0000
Content-Type: text/plain

Bump to version 7.44

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/{curl_7.43.0.bb => curl_7.44.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.43.0.bb => curl_7.44.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.43.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.43.0.bb
rename to meta/recipes-support/curl/curl_7.44.0.bb
index 15713e1..b293303 100644
--- a/meta/recipes-support/curl/curl_7.43.0.bb
+++ b/meta/recipes-support/curl/curl_7.44.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "11bddbb452a8b766b932f859aaeeed39"
-SRC_URI[sha256sum] = "baa654a1122530483ccc1c58cc112fec3724a82c11c6a389f1e6a37dc8858df9"
+SRC_URI[md5sum] = "6b952ca00e5473b16a11f05f06aa8dae"
+SRC_URI[sha256sum] = "1e2541bae6582bb697c0fbae49e1d3e6fad5d05d5aa80dbd6f072e0a44341814"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


