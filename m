Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id A66EC710C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 14:43:52 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 10 Sep 2014 16:43:46 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id D5AD0288E2C;
	Wed, 10 Sep 2014 16:43:46 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Sep 2014 16:43:22 +0200
Message-ID: <1410360202-22215-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] curl: upgrade to 7.38.0
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
X-List-Received-Date: Wed, 10 Sep 2014 14:43:54 -0000
Content-Type: text/plain

Fixes two HTTP cookie related security bugs:
 1. CVE-2014-3613
 2. CVE-2014-3620

Changelog:
	http://curl.haxx.se/changes.html#7_38_0

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/{curl_7.37.1.bb => curl_7.38.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.37.1.bb => curl_7.38.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.38.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.37.1.bb
rename to meta/recipes-support/curl/curl_7.38.0.bb
index 8bcd9ba..3077074 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.38.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "95c627abcf6494f5abe55effe7cd6a57"
-SRC_URI[sha256sum] = "c3ef3cd148f3778ddbefb344117d7829db60656efe1031f9e3065fc0faa25136"
+SRC_URI[md5sum] = "af6b3c299bd891f43cb5f76c4091b7b4"
+SRC_URI[sha256sum] = "035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5a043d5165f9eba"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


