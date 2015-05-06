Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35C6F73F1D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 07:10:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t467AuHU028034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 May 2015 00:10:56 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 6 May 2015 00:10:55 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 May 2015 15:10:54 +0800
Message-ID: <1430896254-29847-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] curl: upgrade to 7.42.1
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
X-List-Received-Date: Wed, 06 May 2015 07:10:56 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Upgrade to include a security fixes for CVE-2015-3153

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/curl/{curl_7.42.0.bb => curl_7.42.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.42.0.bb => curl_7.42.1.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.42.0.bb b/meta/recipes-support/curl/curl_7.42.1.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.42.0.bb
rename to meta/recipes-support/curl/curl_7.42.1.bb
index 228bdb2..8b0ccb8 100644
--- a/meta/recipes-support/curl/curl_7.42.0.bb
+++ b/meta/recipes-support/curl/curl_7.42.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "0a10174a0ea5105c46e92b51e1b311f8"
-SRC_URI[sha256sum] = "32557d68542f5c6cc8437b5b8a945857b4c5c6b6276da909e35b783d1d66d08f"
+SRC_URI[md5sum] = "296945012ce647b94083ed427c1877a8"
+SRC_URI[sha256sum] = "e2905973391ec2dfd7743a8034ad10eeb58dab8b3a297e7892a41a7999cac887"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.1.0


