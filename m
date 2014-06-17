Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 181356FF6F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:01:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5H71d1P020921
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 00:01:39 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 00:01:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2014 15:01:06 +0800
Message-ID: <1f93e9d397df97a6a49e3b1f69e9ab80146a9e06.1402988295.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1402988295.git.hongxu.jia@windriver.com>
References: <cover.1402988295.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/4] directfb: upgrade to 1.7.4
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
X-List-Received-Date: Tue, 17 Jun 2014 07:01:39 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../directfb/{directfb_1.7.1.bb => directfb_1.7.4.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb_1.7.1.bb => directfb_1.7.4.bb} (70%)

diff --git a/meta/recipes-graphics/directfb/directfb_1.7.1.bb b/meta/recipes-graphics/directfb/directfb_1.7.4.bb
similarity index 70%
rename from meta/recipes-graphics/directfb/directfb_1.7.1.bb
rename to meta/recipes-graphics/directfb/directfb_1.7.4.bb
index 15f38ac..512df68 100644
--- a/meta/recipes-graphics/directfb/directfb_1.7.1.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.7.4.bb
@@ -1,6 +1,6 @@
 require directfb.inc
 
-RV = "1.7-1"
+RV = "1.7-4"
 
 DEPENDS += "sysfsutils"
 
@@ -20,5 +20,5 @@ EXTRA_OECONF = "\
 
 LEAD_SONAME = "libdirectfb-1.7.so.0"
 
-SRC_URI[md5sum] = "0ef44c16a414312fd38d6764e2cb9893"
-SRC_URI[sha256sum] = "dd7de38b3cd1408411b37ca28ec73e14b7672e5e28256b7bf91826240c81f519"
+SRC_URI[md5sum] = "f5bdacde77fc653279819796ae11341e"
+SRC_URI[sha256sum] = "20ccd60011c788e50c940ab566943d050679067bc84dc37ca447f1b4af08481b"
-- 
1.8.1.2


