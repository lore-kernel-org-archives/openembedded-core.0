Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA8D770A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:41:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 04:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="596861536"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 04:41:03 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:44:02 +0200
Message-Id: <9ca29868b674dd7aa3eec5b1dbc1075ee0b9976d.1447072488.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
References: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 5/8] atk: Upgrade 2.16.0 -> 2.18.0
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
X-List-Received-Date: Mon, 09 Nov 2015 12:41:12 -0000

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


