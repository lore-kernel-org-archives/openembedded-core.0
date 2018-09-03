Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 965166006A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 09:35:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w839ZTZv026587
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2018 02:35:29 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 02:35:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Sep 2018 17:35:25 +0800
Message-ID: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 03 Sep 2018 09:35:30 -0000
Content-Type: text/plain

They can't be built without opengl in DISTRO_FEATURES.
[snip]
|webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
fatal error: GL/gl.h: No such file or directory
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.20.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
index a528c5d..93d74bb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
@@ -29,8 +29,7 @@ SRC_URI[sha256sum] = "579b307d78fa16a73f112790178022166d7ad17d4147492ced9b9fba48
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-# depends on libxt
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
-- 
2.7.4


