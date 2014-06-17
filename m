Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A393C6FF6D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:01:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5H71gPG023277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 00:01:42 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 00:01:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2014 15:01:07 +0800
Message-ID: <ff2af98362701eb3174c4d6fc27dd689384e56e2.1402988295.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1402988295.git.hongxu.jia@windriver.com>
References: <cover.1402988295.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/4] qmmp: upgrade to 0.7.7
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
X-List-Received-Date: Tue, 17 Jun 2014 07:01:41 -0000
Content-Type: text/plain

Build:
1) Add LICENSE_FLAGS_WHITELIST += "commercial" to local.conf

2) bitbake qmmp

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-qt/qt-apps/{qmmp_0.7.5.bb => qmmp_0.7.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-qt/qt-apps/{qmmp_0.7.5.bb => qmmp_0.7.7.bb} (95%)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.7.5.bb b/meta/recipes-qt/qt-apps/qmmp_0.7.7.bb
similarity index 95%
rename from meta/recipes-qt/qt-apps/qmmp_0.7.5.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.7.7.bb
index 910e7c2..9725b42 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.7.5.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.7.7.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2 \
            file://no-host-paths.patch \
           "
 
-SRC_URI[md5sum] = "dcc3c9ecd4dfbf0ced91c59cb894d460"
-SRC_URI[sha256sum] = "6066aea939813667dae7cf32ff1d6eb9913894977d132c2cd729fea22d24cf67"
+SRC_URI[md5sum] = "9376b5d535ed540e97bdff79b42607ae"
+SRC_URI[sha256sum] = "dda66bf60121a8a2cb7175b16b3b948099f8c119ee9a11c671555e8c38caa387"
 
 inherit cmake qt4x11
 
-- 
1.8.1.2


