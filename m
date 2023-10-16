Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396A4CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 09:11:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.113449.1697447491094388099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 02:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Lhbdrfc8;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697447491; x=1728983491;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r306f1ztLVT4n9NQxuRGZZQUKgt53y5mWY1/8saqVA8=;
  b=Lhbdrfc8RWP0nNYK9DMnmLA/mecglnIOPBM407gXFfmIpJAaJ66w8e1h
   PV2gLSLmUQxB+KO0WnWZfDNg1w8b0wbP64qkQpytVwo13+5FWu2IbUy4D
   kPG3GVXNsG9wnPZo9R8OcvWpsgA/2sXNKlcvxdHWm1ZCeb7B+XB/GUzus
   9UXXoxktANM3zf2sz6c7/DpJjtfBoMJGeau0US/c2OgSSwITU3448zSZD
   ZRjPRjcUMC5uBVRYN26Do/cZtgRvmbqnb/NDwsfAOwn3f1+0pjOjbKLSA
   s34m4ZhBOgd0Jn/0Y4CwemTCR+xHCyOgWDj05oKhdsf7joHvVkBgyrvAb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375850927"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="375850927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 02:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790731814"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="790731814"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 16 Oct 2023 02:11:29 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: ignore RHEL specific CVE-2023-2680
Date: Mon, 16 Oct 2023 16:51:51 +0800
Message-Id: <20231016085151.902382-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 09:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189280

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b331f87c0d..78c495516f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -56,6 +56,9 @@ CVE_STATUS[CVE-2018-18438] = "disputed: The issues identified by this CVE were d
 # https://bugzilla.redhat.com/show_bug.cgi?id=2167423
 CVE_STATUS[CVE-2023-0664] = "not-applicable-platform: Issue only applies on Windows"
 
+# As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
+CVE_STATUS[CVE-2023-2680] = "not-applicable-platform: RHEL specific issue."
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.37.3


