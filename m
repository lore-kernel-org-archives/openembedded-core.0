Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id B6723606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 08:41:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jul 2018 01:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,333,1526367600"; d="scan'208";a="214788408"
Received: from hharm-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.169.237])
	by orsmga004.jf.intel.com with ESMTP; 10 Jul 2018 01:41:54 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:41:40 +0800
Message-Id: <20180710084141.9705-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] perf: add dwarf to PACKAGECONFIG
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
X-List-Received-Date: Tue, 10 Jul 2018 08:41:54 -0000

Enable perf to be built with DWARF support.

Fixes [YOCTO #3359]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 51f5597eb9..458b355864 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -12,6 +12,7 @@ LICENSE = "GPLv2"
 PR = "r9"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
+PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
 PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
@@ -80,7 +81,7 @@ EXTRA_OEMAKE = '\
     EXTRA_CFLAGS="-ldw" \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
-    NO_GTK2=1 NO_DWARF=1 \
+    NO_GTK2=1 \
     ${PACKAGECONFIG_CONFARGS} \
 '
 
-- 
2.17.1


