Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id ABACC6062B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 07:39:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2020 23:39:51 -0800
X-IronPort-AV: E=Sophos;i="5.70,404,1574150400"; d="scan'208";a="220015668"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.21.206])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2020 23:39:50 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 15:39:36 +0800
Message-Id: <20200205073938.38227-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [zeus][PATCH 1/3] rsync: whitelist CVE-2017-16548
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
X-List-Received-Date: Wed, 05 Feb 2020 07:39:50 -0000
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

patch for this CVE applies to v3.1.3pre1 not for v3.1.3.
patch already in v3.1.3.
see
https://git.samba.org/rsync.git/?p=rsync.git;a=commitdiff;h=47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1;hp=bc112b0e7feece62ce98708092306639a8a53cce

(From OE-Core rev: 1e2739c821312527010fb0afbde5a20cd3f03d24)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rsync/rsync_3.1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
index ffb1d061c0..152ff02a25 100644
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
2.24.1


