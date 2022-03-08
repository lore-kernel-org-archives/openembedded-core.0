Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B344C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:21:21 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.8485.1646749280809201859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=JziSlbei;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749280; x=1678285280;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hxrM7PM4fgFMQHs/D8TpCtM9+UuDwGVNHqQxS+3En2g=;
  b=JziSlbeiXErUNqsd1EoYNT0JXxECvXGs7ssopDrg07mIbaBO6AFyWOsP
   4Cv7klSxPifYCERfhQDZBqjlNz8XFT3pm0cHOEy8iMczj53yj9bJKKA9L
   rD+xsEQs/MmjAt1z9HHgftSifxdLqvM0MOs/w0oYh9x3QPtFLNUkGmfWM
   Tk8hCd6NYjrRKDmsjgmgr589BXU1rwausFVuglyOELswzRiRi+/cUiZoU
   1i+FNQdVCKc8vcPGGrOrcdmWoMF6MCZdAy/2/ncNVT6Sffk5KMFyUQpT6
   oQKRtHxbKkYwSFKgZyUTx9Tb4Pd+CV9xyRgsCzwaaiK15SQSM/heLbg/D
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242130075"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="242130075"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513119914"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:44 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/15] lttng-modules: upgrade 2.12.6 -> 2.12.7
Date: Tue,  8 Mar 2022 22:19:56 +0800
Message-Id: 
 <a5bade232676ffe282f2058eedfc20cfc19bf036.1646748870.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646748869.git.anuj.mittal@intel.com>
References: <cover.1646748869.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:21:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162912

Changelog:

* fix: mm: move kvmalloc-related functions to slab.h (v5.16)
* fix: block: don't call blk_status_to_errno in blk_update_request (v5.16)
* fix: KVM: MMU: change tracepoints arguments to kvm_page_fault (v5.16)
* fix: KVM: x86: Get exit_reason as part of kvm_x86_ops.get_exit_info (v5.16)
* fix: isystem: delete global -isystem compile option (v5.16)
* fix: block: move block-related definitions out of fs.h (v5.16)
* fix: implicit-int error in EXPORT_SYMBOL_GPL
* fix: Revert "Makefile: Enable -Wimplicit-fallthrough for Clang" (v5.15)
* fix: cpu/hotplug: Remove deprecated CPU-hotplug functions. (v5.15)
* fix: sched: Change task_struct::state (v5.14)
* fix: btrfs: pass btrfs_inode to btrfs_writepage_endio_finish_ordered() (v5.14)
* fix: adjust ranges for RHEL 8.4

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../lttng/{lttng-modules_2.12.6.bb => lttng-modules_2.12.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.6.bb => lttng-modules_2.12.7.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.7.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.12.7.bb
index 1dff2b05f7..5eb3902bb3 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.7.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            "
 
-SRC_URI[sha256sum] = "95ac2a2cf92d85d23ffbdaca6a1ec0d7c167211d1e0fb850ab90004a3f475eaa"
+SRC_URI[sha256sum] = "32ab2d17d513cd2f458f8844c66a0d013283301fc7329b55d6503153cf8cb253"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.35.1


