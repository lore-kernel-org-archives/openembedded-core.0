Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 668 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Mar 2017 10:05:39 UTC
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id 7C35765D00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 10:05:39 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 589b_3f0b_596c65ac_268c_4238_a212_daf3659dc475;
	Fri, 10 Mar 2017 18:54:27 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E5EAAC011F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 18:54:27 +0900 (JST)
Received: from g01jpexchyt33.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	69FC546E970 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 18:54:26 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt33.g01.fujitsu.local (10.128.193.36) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 10 Mar 2017 18:54:25 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Mar 2017 18:54:47 +0900
Message-ID: <1489139687-5619-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] curl: upgrade to 7.53.1
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
X-List-Received-Date: Fri, 10 Mar 2017 10:05:41 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.53.0.bb => curl_7.53.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.53.0.bb => curl_7.53.1.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.53.0.bb b/meta/recipes-support/curl/curl_7.53.1.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.53.0.bb
rename to meta/recipes-support/curl/curl_7.53.1.bb
index a4cca15..bc78ffb 100644
--- a/meta/recipes-support/curl/curl_7.53.0.bb
+++ b/meta/recipes-support/curl/curl_7.53.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "ede199c63b84df39f42da9da68de85c5"
-SRC_URI[sha256sum] = "b2345a8bef87b4c229dedf637cb203b5e21db05e20277c8e1094f0d4da180801"
+SRC_URI[md5sum] = "fb1f03a142236840c1a77c035fa4c542"
+SRC_URI[sha256sum] = "1c7207c06d75e9136a944a2e0528337ce76f15b9ec9ae4bb30d703b59bf530e8"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
1.9.1


