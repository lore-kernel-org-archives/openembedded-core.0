Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDDE605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 01:48:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3D1mO3X023674
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 18:48:25 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sun, 12 Apr 2015 18:48:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 09:48:19 +0800
Message-ID: <aa5e4579846c75ff3d52601f6f9fb2728e4ff9f9.1428889561.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428889561.git.Qi.Chen@windriver.com>
References: <cover.1428889561.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/6] curl: upgrade to 7.41.0
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
X-List-Received-Date: Mon, 13 Apr 2015 01:48:24 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/curl/{curl_7.40.0.bb => curl_7.41.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.40.0.bb => curl_7.41.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.40.0.bb b/meta/recipes-support/curl/curl_7.41.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.40.0.bb
rename to meta/recipes-support/curl/curl_7.41.0.bb
index 4cde9c6..c3c3c0b 100644
--- a/meta/recipes-support/curl/curl_7.40.0.bb
+++ b/meta/recipes-support/curl/curl_7.41.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "8d30594212e65657a5c32030f0998fa9"
-SRC_URI[sha256sum] = "899109eb3900fa6b8a2f995df7f449964292776a04763e94fae640700f883fba"
+SRC_URI[md5sum] = "87e36f88b7a0f9683fa56f1334562c3a"
+SRC_URI[sha256sum] = "9f8b546bdc5c57d959151acae7ce6610fe929d82b8d0fc5b25a3a2296e5f8bea"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


