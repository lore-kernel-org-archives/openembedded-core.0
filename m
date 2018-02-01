Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4CB786C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465235"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:32 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:02:09 +0200
Message-Id: <20180201180210.21652-19-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/20] babeltrace: update to 1.5.4
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:32 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-kernel/lttng/{babeltrace_1.5.3.bb => babeltrace_1.5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.3.bb => babeltrace_1.5.4.bb} (82%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.3.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
similarity index 82%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.3.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
index 4d81da0160d..a29402adb16 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.3.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
@@ -15,5 +15,5 @@ SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "0cec2745ac316649791c43f416d71ea1"
-SRC_URI[sha256sum] = "2249fee5beba657731f5d6a84c5296c6517f544bfbe7571bd1fd7af23726137c"
+SRC_URI[md5sum] = "3e8cdafec3ac0346a389870e87bf1344"
+SRC_URI[sha256sum] = "9643039923a0abc75a25b3d594cee0017423b57f10d2b625e96ed1e8d4891fc1"
-- 
2.15.1


