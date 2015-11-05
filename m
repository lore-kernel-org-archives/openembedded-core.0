Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2890576E70
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:26:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2015 05:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,247,1444719600"; d="scan'208";a="843801058"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2015 05:26:01 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 15:29:02 +0200
Message-Id: <2002f5adf9c2b481d9248bb0c6e373eae0b7e519.1446729162.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <824e863ff0a986c0c812f25fbe5bebcf060bde02.1446729162.git.jussi.kukkonen@intel.com>
References: <824e863ff0a986c0c812f25fbe5bebcf060bde02.1446729162.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1446729162.git.jussi.kukkonen@intel.com>
References: <cover.1446729162.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/6] atk: Upgrade 2.16.0 -> 2.18.0
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
X-List-Received-Date: Thu, 05 Nov 2015 13:26:02 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/atk/{atk_2.16.0.bb => atk_2.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.16.0.bb => atk_2.18.0.bb} (78%)

diff --git a/meta/recipes-support/atk/atk_2.16.0.bb b/meta/recipes-support/atk/atk_2.18.0.bb
similarity index 78%
rename from meta/recipes-support/atk/atk_2.16.0.bb
rename to meta/recipes-support/atk/atk_2.18.0.bb
index 0f8f9b5..83bcae0 100644
--- a/meta/recipes-support/atk/atk_2.16.0.bb
+++ b/meta/recipes-support/atk/atk_2.18.0.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gtk-doc
 
-SRC_URI[archive.md5sum] = "c7c5002bd6e58b4723a165f1bf312116"
-SRC_URI[archive.sha256sum] = "095f986060a6a0b22eb15eef84ae9f14a1cf8082488faa6886d94c37438ae562"
+SRC_URI[archive.md5sum] = "fd3678f35004b4c92e3da39356996054"
+SRC_URI[archive.sha256sum] = "ce6c48d77bf951083029d5a396dd552d836fff3c1715d3a7022e917e46d0c92b"
 
 BBCLASSEXTEND = "native"
 
-- 
2.1.4


