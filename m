Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 671E173183
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 13:33:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 11 Jan 2016 05:33:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,552,1444719600"; d="scan'208";a="888160758"
Received: from jlock-mobl.gar.corp.intel.com ([10.252.16.246])
	by orsmga002.jf.intel.com with ESMTP; 11 Jan 2016 05:33:56 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:33:51 +0000
Message-Id: <1452519231-13332-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] wic/help.py: document requirements for valid fstab generation
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
X-List-Received-Date: Mon, 11 Jan 2016 13:33:57 -0000

Without one of the --ondrive, --ondisk or --use-uuid options for a
partition with a mountpoint specified the automatically generated
fstab entry will be invalid.

[YOCTO #8844]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/lib/wic/help.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index be334e7..f5587bb 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -629,6 +629,13 @@ DESCRIPTION
        If a <mountpoint> is not specified the partition will be created
        but will not be mounted.
 
+       Partitions with a <mountpoint> specified will be automatically mounted.
+       This is achieved by wic adding entries to the fstab during image
+       generation. In order for a valid fstab to be generated one of the
+       --ondrive, --ondisk or --use-uuid partition options must be used for
+       each partition that specifies a mountpoint.
+
+
        The following are supported 'part' options:
 
          --size: The minimum partition size. Specify an integer value
-- 
2.5.0


