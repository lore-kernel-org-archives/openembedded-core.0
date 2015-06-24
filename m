Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF9675A2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:34:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8YNhe013945
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:34:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 24 Jun 2015 01:34:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 16:34:36 +0800
Message-ID: <486e6cd74dc02e139fad6e970cd5f9884dcae677.1435134771.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435134771.git.Qi.Chen@windriver.com>
References: <cover.1435134771.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] curl: upgrade to 7.43.0
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
X-List-Received-Date: Wed, 24 Jun 2015 08:34:22 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/curl/{curl_7.42.1.bb => curl_7.43.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.42.1.bb => curl_7.43.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.42.1.bb b/meta/recipes-support/curl/curl_7.43.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.42.1.bb
rename to meta/recipes-support/curl/curl_7.43.0.bb
index 8b0ccb8..15713e1 100644
--- a/meta/recipes-support/curl/curl_7.42.1.bb
+++ b/meta/recipes-support/curl/curl_7.43.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "296945012ce647b94083ed427c1877a8"
-SRC_URI[sha256sum] = "e2905973391ec2dfd7743a8034ad10eeb58dab8b3a297e7892a41a7999cac887"
+SRC_URI[md5sum] = "11bddbb452a8b766b932f859aaeeed39"
+SRC_URI[sha256sum] = "baa654a1122530483ccc1c58cc112fec3724a82c11c6a389f1e6a37dc8858df9"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


