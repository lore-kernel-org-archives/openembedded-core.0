Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4D4A731B1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C8PNfv021210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:12 -0700
Message-ID: <0751deadd65a2331abe3b24f9b338928aaec66ef.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] tcl: 8.6.4 -> 8.6.5
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:23 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/tcltk/{tcl_8.6.4.bb => tcl_8.6.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.4.bb => tcl_8.6.5.bb} (95%)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
similarity index 95%
rename from meta/recipes-devtools/tcltk/tcl_8.6.4.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.5.bb
index 61be81d..46fc8a7 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
@@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "d7cbb91f1ded1919370a30edd1534304"
-SRC_URI[sha256sum] = "9e6ed94c981c1d0c5f5fefb8112d06c6bf4d050a7327e95e71d417c416519c8d"
+SRC_URI[md5sum] = "0e6426a4ca9401825fbc6ecf3d89a326"
+SRC_URI[sha256sum] = "ce26d5b9c7504fc25d2f10ef0b82b14cf117315445b5afa9e673ed331830fb53"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
2.8.0


