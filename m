Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83E3A6EEBE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 02:56:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1D2uVLb021799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Feb 2014 18:56:32 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 12 Feb 2014 18:54:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Feb 2014 10:54:05 +0800
Message-ID: <3c55bf578e73c67ed09a4cfb06a2822776134ab3.1392259689.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392259689.git.hongxu.jia@windriver.com>
References: <cover.1392259689.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/2] socat: upgrade to 1.7.2.3
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
X-List-Received-Date: Thu, 13 Feb 2014 02:56:34 -0000
Content-Type: text/plain

The package has been successfully compiled for all major architectures.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/socat/{files => socat}/compile.patch        | 0
 .../socat/{files => socat}/fix-xxx_SHIFT-autoheader.patch             | 0
 .../recipes-connectivity/socat/{socat_1.7.2.2.bb => socat_1.7.2.3.bb} | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/socat/{files => socat}/compile.patch (100%)
 rename meta/recipes-connectivity/socat/{files => socat}/fix-xxx_SHIFT-autoheader.patch (100%)
 rename meta/recipes-connectivity/socat/{socat_1.7.2.2.bb => socat_1.7.2.3.bb} (89%)

diff --git a/meta/recipes-connectivity/socat/files/compile.patch b/meta/recipes-connectivity/socat/socat/compile.patch
similarity index 100%
rename from meta/recipes-connectivity/socat/files/compile.patch
rename to meta/recipes-connectivity/socat/socat/compile.patch
diff --git a/meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch b/meta/recipes-connectivity/socat/socat/fix-xxx_SHIFT-autoheader.patch
similarity index 100%
rename from meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
rename to meta/recipes-connectivity/socat/socat/fix-xxx_SHIFT-autoheader.patch
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.2.bb b/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
similarity index 89%
rename from meta/recipes-connectivity/socat/socat_1.7.2.2.bb
rename to meta/recipes-connectivity/socat/socat_1.7.2.3.bb
index 398caa3..99060b1 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://compile.patch \
            file://fix-xxx_SHIFT-autoheader.patch"
 
-SRC_URI[md5sum] = "39231e512d8052f328552865df15d42f"
-SRC_URI[sha256sum] = "9a167af11a4d3809cbc66f5e2dcb39b6e371251282ef5de6ea6ff0c4be8a953c"
+SRC_URI[md5sum] = "75008d8baf7c6c9e27aa7afb34a622de"
+SRC_URI[sha256sum] = "0598ac54af7b138cda9e3c141bcf0cc63eeb2ab31f468a772dc3f7eb3896aad0"
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
-- 
1.8.1.2


