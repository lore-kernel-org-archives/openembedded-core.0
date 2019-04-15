Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6B86BAAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 06:13:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3F6D1CN029842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 23:13:02 -0700 (PDT)
Received: from localhost (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 14 Apr 2019 23:13:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2019 14:12:58 +0800
Message-ID: <1555308778-9316-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.192]
Subject: [PATCH] harfbuzz: update SRC_URI[md5sum] and SRC_URI[sha256sum]
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
X-List-Received-Date: Mon, 15 Apr 2019 06:13:01 -0000
Content-Type: text/plain

The previous md5sum and sha256sum are not correct.
See: https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.4.0.tar.bz2.sha256

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb
index 5855d77..4691d16 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "ebccf8203103766383d4c5a0767b102d"
-SRC_URI[sha256sum] = "9035005903da74667d28bb181986e879e11da3d5986722759fa145cca781ead6"
+SRC_URI[md5sum] = "49f111f9b52ae3d9b31c1a3631a320bd"
+SRC_URI[sha256sum] = "b470eff9dd5b596edf078596b46a1f83c179449f051a469430afc15869db336f"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.7.4


