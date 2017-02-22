Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8164973118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302166"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:02 +0200
Message-Id: <754da87841f3f8a2ba6363209bc21c6a23c3019a.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/24] babeltrace: update to 1.5.2
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-kernel/lttng/{babeltrace_1.5.1.bb => babeltrace_1.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.1.bb => babeltrace_1.5.2.bb} (82%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.2.bb
similarity index 82%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.1.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.2.bb
index c22b3a01b4a..c7ea5c1ba41 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.2.bb
@@ -15,5 +15,5 @@ SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "3f7d29ba2821a966d24759a928a15cdf"
-SRC_URI[sha256sum] = "379e96f1cf867f0a198cf1c315c52ec7d7ad67898402bbe22d1404fc38d19d98"
+SRC_URI[md5sum] = "1176e7f69e128112d5f29fefec39c6ce"
+SRC_URI[sha256sum] = "696ee46e5750ab57a258663e73915d2901b7cd4fc53b06eb3f7a0d7b1012fa56"
-- 
2.11.0


