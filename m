Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 307E772FD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 01:44:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1M1iZsN031615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:44:35 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 17:44:35 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2017 17:44:29 -0800
Message-ID: <934e1f790e184aa4c2509e23955beea020c502e9.1487727826.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1487727826.git.liezhi.yang@windriver.com>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] ccache: 3.3.3 -> 3.3.4
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
X-List-Received-Date: Wed, 22 Feb 2017 01:44:34 -0000
Content-Type: text/plain

The LIC_FILES_CHKSUM is changed because of the date. The contents are the same.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/{ccache_3.3.3.bb => ccache_3.3.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.3.3.bb => ccache_3.3.4.bb} (48%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.3.3.bb b/meta/recipes-devtools/ccache/ccache_3.3.4.bb
similarity index 48%
rename from meta/recipes-devtools/ccache/ccache_3.3.3.bb
rename to meta/recipes-devtools/ccache/ccache_3.3.4.bb
index ded7b309277..45b2899bbeb 100644
--- a/meta/recipes-devtools/ccache/ccache_3.3.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.3.4.bb
@@ -1,10 +1,10 @@
 require ccache.inc
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=938c02728101936f2a74a67d1d82ee25"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7fe21f9470f2305e95e7d8a632255079"
 
-SRC_URI[md5sum] = "ea1f95303749b9ac136c617d1b333eef"
-SRC_URI[sha256sum] = "87a399a2267cfac3f36411fbc12ff8959f408cffd050ad15fe423df88e977e8f"
+SRC_URI[md5sum] = "61326f1edac7cd211a7018458dfe2d86"
+SRC_URI[sha256sum] = "1348b54e7c35dd2f8d17923389e03c546e599cfbde6459d2f31cf6f1521ec538"
 
 SRC_URI += " \
             file://0002-dev.mk.in-fix-file-name-too-long.patch \
-- 
2.11.0.rc2.dirty


