Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C79046FBCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 09:05:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4S95eJh007366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 02:05:41 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 02:05:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 17:05:31 +0800
Message-ID: <c836c1495fcc4bbac269ecfda6db3dfdbb7779be.1401267658.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401267658.git.hongxu.jia@windriver.com>
References: <cover.1401267658.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/3] apr: upgrade to 1.5.1
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
X-List-Received-Date: Wed, 28 May 2014 09:05:41 -0000
Content-Type: text/plain

The LICENSE has no change, except a newline added.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/apr/{apr_1.4.8.bb => apr_1.5.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/apr/{apr_1.4.8.bb => apr_1.5.1.bb} (91%)

diff --git a/meta/recipes-support/apr/apr_1.4.8.bb b/meta/recipes-support/apr/apr_1.5.1.bb
similarity index 91%
rename from meta/recipes-support/apr/apr_1.4.8.bb
rename to meta/recipes-support/apr/apr_1.5.1.bb
index 0a77ad7..7f2d2ca 100644
--- a/meta/recipes-support/apr/apr_1.4.8.bb
+++ b/meta/recipes-support/apr/apr_1.5.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 DEPENDS = "util-linux"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
                     file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
 
 BBCLASSEXTEND = "native"
@@ -16,8 +16,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "ce2ab01a0c3cdb71cf0a6326b8654f41"
-SRC_URI[sha256sum] = "61b8d2f8d321c6365ee3d71d0bb41f3a89c44da6124cc5b407a3b8319d660421"
+SRC_URI[md5sum] = "5486180ec5a23efb5cae6d4292b300ab"
+SRC_URI[sha256sum] = "e94abe431d4da48425fcccdb27b469bd0f8151488f82e5630a56f26590e198ac"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest
 
-- 
1.8.1.2


