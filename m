Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC19CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 06:08:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.21475.1697695700225797712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 23:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=UGzeuqUU;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697695700; x=1729231700;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bFOI9rRC5XnGeDL1Nri9XuIywoGdvjiA7HlweEAqc18=;
  b=UGzeuqUUvZIS4plMqb823RgB/mmJk3RViTsTXu3Dk4TCcIGGdroDFiAL
   kZGpekPSLMc/AVaG75ahbgg+KFvaiUyPxOTbkAyWpYo1iqLpsuPxtIumx
   RhBY8MJdzDxNsq/UOjhp+0RU+6pkH1lJihjteeo0G+MGsqeltESepaAKP
   W4/Zk43jKhMuyzDLInN+qpZEQlSAEDT2+0BJSB7vkmMm1YyCV9YcozyPw
   lVtaGdB93gbpiN7+WE6VNbK7Fyj9d0WUa+UU6efs9Fp5cAlWNR1DK6cxA
   oAc6u/jDpkVfyVnMpsK66J1rYUZlVRFGNTEDfTB036sv+NNSwgJDCPQ6M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="386004665"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="386004665"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 23:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="786234224"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="786234224"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga008.jf.intel.com with ESMTP; 18 Oct 2023 23:08:18 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][kirkstone][PATCH] qemu: ignore RHEL specific CVE-2023-2680
Date: Thu, 19 Oct 2023 13:48:40 +0800
Message-Id: <20231019054840.438271-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 06:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189427

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5526eacb960..83bd5d7e67d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -125,6 +125,10 @@ CVE_CHECK_IGNORE += "CVE-2018-18438"
 # this bug related to windows specific.
 CVE_CHECK_IGNORE += "CVE-2023-0664"
 
+# As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
+# RHEL specific issue
+CVE_CHECK_IGNORE += "CVE-2023-2680"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.37.3


