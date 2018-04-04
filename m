Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id C85F3746D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599843"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:14 +0300
Message-Id: <20180404111321.10824-15-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/22] babeltrace: update to 1.5.5
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:11 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-kernel/lttng/{babeltrace_1.5.4.bb => babeltrace_1.5.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.4.bb => babeltrace_1.5.5.bb} (82%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.4.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
similarity index 82%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
index a29402adb16..92d86b92e8b 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
@@ -15,5 +15,5 @@ SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "3e8cdafec3ac0346a389870e87bf1344"
-SRC_URI[sha256sum] = "9643039923a0abc75a25b3d594cee0017423b57f10d2b625e96ed1e8d4891fc1"
+SRC_URI[md5sum] = "7decafd46093e4e47c14e7307d498986"
+SRC_URI[sha256sum] = "409146789b4a6b81f6a275fcad932a030743d444f6de5bd4a34aaf17aa72e8ac"
-- 
2.16.1


