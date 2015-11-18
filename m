Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 534B26AC3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:51:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2015 01:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853512410"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2015 01:51:53 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 11:52:29 +0200
Message-Id: <74c46f175bda61769c25fee4e4c26e50b3cfcae4.1447840091.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/8] package_regex.inc: deprecate the file
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
X-List-Received-Date: Wed, 18 Nov 2015 09:51:54 -0000

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
2.1.4


