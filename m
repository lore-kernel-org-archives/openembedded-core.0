Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6F08260620
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:11:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2015 06:11:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="855904240"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 06:11:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 16:08:46 +0200
Message-Id: <d78639232b00b43a77f61bd8030d0fe69f2f4b42.1448028339.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/9] package_regex.inc: deprecate the file
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
X-List-Received-Date: Fri, 20 Nov 2015 14:11:18 -0000

New entries should be added to recipes themselves

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index d12999b..0035586 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -1,3 +1,5 @@
+# NOTE: THIS FILE IS DEPRECATED. Please add new entries to the recipes themselves.
+#
 # package_regex.inc - This file contains data that tracks
 # upstream project associated with a given recipe. This list is needed
 # for recipes that version information can not be automagically discovered.
-- 
2.6.2


