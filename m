Return-Path: <chee.yang.lee@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4B97FD59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 05:26:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 21:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="374488824"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 20 Jan 2020 21:26:48 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 13:26:47 +0800
Message-Id: <1579584407-14563-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579584407-14563-1-git-send-email-chee.yang.lee@intel.com>
References: <1579584407-14563-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH 2/2] rsync: whitelist CVE-2017-16548
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
X-List-Received-Date: Tue, 21 Jan 2020 05:26:48 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

patch for this CVE applies to v3.1.3pre1 not for v3.1.3.
patch already in v3.1.3.
see
https://git.samba.org/rsync.git/?p=rsync.git;a=commitdiff;h=47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1;hp=bc112b0e7feece62ce98708092306639a8a53cce

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/rsync/rsync_3.1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
index ffb1d06..152ff02 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
@@ -20,6 +20,9 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
 SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
 SRC_URI[sha256sum] = "55cc554efec5fdaad70de921cd5a5eeb6c29a95524c715f3bbf849235b0800c0"
 
+# -16548 required for v3.1.3pre1. Already in v3.1.3.
+CVE_CHECK_WHITELIST += " CVE-2017-16548 "
+
 inherit autotools
 
 PACKAGECONFIG ??= "acl attr \
-- 
2.7.4


