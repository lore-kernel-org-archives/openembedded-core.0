Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B116A6B7BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:21:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s568LXk7022212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 01:21:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 01:21:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 16:22:26 +0800
Message-ID: <d04b9d9275126daf15d538362b046e93ed45c99d.1402042902.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402042902.git.Qi.Chen@windriver.com>
References: <cover.1402042902.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] glib-2.0: upgrade from 2.40.0 to 2.41.0
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
X-List-Received-Date: Fri, 06 Jun 2014 08:21:34 -0000
Content-Type: text/plain

Upgrade glib-2.0 from 2.40.0 to 2.41.0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{glib-2.0_2.40.0.bb => glib-2.0_2.41.0.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.40.0.bb => glib-2.0_2.41.0.bb} (81%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.41.0.bb
similarity index 81%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.41.0.bb
index ff1fb87..252d306 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.41.0.bb
@@ -17,5 +17,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "05fb7cb17eacbc718e90366a1eae60d9"
-SRC_URI[sha256sum] = "0d27f195966ecb1995dcce0754129fd66ebe820c7cd29200d264b02af1aa28b5"
+SRC_URI[md5sum] = "65a0d3fa1e79b7d21bbc09579a0f3cf3"
+SRC_URI[sha256sum] = "e85e2714147928e3f6410a3f9a5c11ebfcfc7b3b11706e3374636b091dc7c3f7"
-- 
1.7.9.5


