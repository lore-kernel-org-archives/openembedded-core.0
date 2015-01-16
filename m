Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id C9CFE722C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 15:06:29 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 16 Jan 2015 16:06:28 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 898172800CB;
	Fri, 16 Jan 2015 16:06:28 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 16:06:20 +0100
Message-ID: <1421420780-39453-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH v2] curl: upgrade to 7.40
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
X-List-Received-Date: Fri, 16 Jan 2015 15:06:35 -0000
Content-Type: text/plain

Upgraded version include fixes for these CVE bugs:
1. CVE-2014-8150
2. CVE-2014-8151

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.40.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.40.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.38.0.bb b/meta/recipes-support/curl/curl_7.40.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.38.0.bb
rename to meta/recipes-support/curl/curl_7.40.0.bb
index 85bd3be..209ed94 100644
--- a/meta/recipes-support/curl/curl_7.38.0.bb
+++ b/meta/recipes-support/curl/curl_7.40.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "af6b3c299bd891f43cb5f76c4091b7b4"
-SRC_URI[sha256sum] = "035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5a043d5165f9eba"
+SRC_URI[md5sum] = "8d30594212e65657a5c32030f0998fa9"
+SRC_URI[sha256sum] = "899109eb3900fa6b8a2f995df7f449964292776a04763e94fae640700f883fba"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


