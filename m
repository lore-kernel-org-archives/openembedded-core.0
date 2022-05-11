Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2F1C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:58:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NP07XLC6;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237881; x=1683773881;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZuTGvweLAG5NJDT11FJ4FwGoaqjFF+p9H33pRwtU3QA=;
  b=NP07XLC6w36Y2mWQc56C3jUO/p98XMrcunrz6Py7WqYA7EKaqS5SbfbJ
   mG2olnVqI/ncckm7hI0ly+/a6EHD9W9bkvOMVvGM0sknt50WETarKJPju
   pl5dsAGnBzEWdNNFBm+G3Mfg9OAAfkc+fsnYe0nCTlqAgZ5npXifkfpT4
   bVerULUnDuFGQbt+IHy+hYn8ibmXzqJi7Lh1UBJE/qY/CA2pZo0k3Z3qo
   L0GZNzZF9jNtzbaGmCBgLP5tfVtHmIihpUzYy+0b1vNM3dh8l8kgrVQZE
   3U/bQXtcTqs1hvR+0Go65kA9oykDaLBTcnrNBhinvqx7g6lCjWk1vLI+p
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106067"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106067"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754833"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:00 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/17] lttng-modules: upgrade 2.13.1 -> 2.13.2
Date: Wed, 11 May 2022 10:57:28 +0800
Message-Id: 
 <8407ac82264475ade1f8ef7fbafd70f830a0376c.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:58:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165481

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
* Fix: incorrect in/out direction for syscall exit
* fix: net: socket: rename SKB_DROP_REASON_SOCKET_FILTER (v5.17)
* fix: net: skb: introduce kfree_skb_reason() (v5.17)
* fix: random: rather than entropy_store abstraction, use global (v5.17)
* fix: btrfs: pass fs_info to trace_btrfs_transaction_commit (v5.17)
* fix: mm: compaction: fix the migration stats in trace_mm_compaction_migratepages() (v5.17)
* fix: block: remove the ->rq_disk field in struct request (v5.17)
* fix: block: remove GENHD_FL_SUPPRESS_PARTITION_INFO (v5.17)
* Copyright ownership transfer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 093d6dba95c03911d3d7e1b3b07ceff2c1de5563)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{lttng-modules_2.13.1.bb => lttng-modules_2.13.2.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.1.bb => lttng-modules_2.13.2.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
index b05cad6be7..b438d06c6c 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
@@ -9,12 +9,11 @@ inherit module
 
 include lttng-platforms.inc
 
-SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-          "
+SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2"
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "a7c86d91c9bbe66d27f025aa04b8cfc6d7785ed2fc7ef774930800ee44d7f343"
+SRC_URI[sha256sum] = "dfd547d9041c8c545ae5b7bfef3f0ef2d9f2520d6ab44188c9ea8de56d5d298a"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.35.3


