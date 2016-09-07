Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A81FB775D5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 05:49:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u875naY9013276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 22:49:36 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 6 Sep 2016 22:49:35 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2016 13:47:10 +0800
Message-ID: <1473227230-3022-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: 2.12.4 -> 2.12.5
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
X-List-Received-Date: Wed, 07 Sep 2016 05:49:39 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Fix a regression introduced in 2.12.4 that caused
a hang in the network process after a load failure.

Fix several crashes and rendering issues.

reference: https://webkitgtk.org/2016/09/05/webkitgtk2.12.5-released.html

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.12.4.bb => webkitgtk_2.12.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.12.4.bb => webkitgtk_2.12.5.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.12.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
index 0193e17..57ac35f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
@@ -20,8 +20,8 @@ SRC_URI = "\
   file://ppc-musl-fix.patch \
   file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
   "
-SRC_URI[md5sum] = "0331ac714fd1a0587ffea470ef1afb20"
-SRC_URI[sha256sum] = "424d3177599abbc1eb1a1ad7928dd280a62006e992f2fada2e059375a9609a77"
+SRC_URI[md5sum] = "7a9ea00ec195488db90fdeb2d174ddaf"
+SRC_URI[sha256sum] = "6b147854b864a5f115fadb97b2b6200b2f696db015216a34e7298d11c88b1c40"
 
 inherit cmake lib_package pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even
 
-- 
2.8.1


