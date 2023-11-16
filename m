Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6C6C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 09:43:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.3545.1700127800206052464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 01:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VUIII7of;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700127800; x=1731663800;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ytu0lngtL+JAeW7fghB0EMs4wt9aPgxA2FccnwWWyyQ=;
  b=VUIII7of2taS5HvD60jOg0hkVoEaSKjZznqvvMwq+rI+hTCoHH9pbF86
   jJHOSDfktMQjUwSnMjXLevytamByWOtuwpY9lxqBjxSz2kbXvAPHux+Pq
   MkfbW1GO7CZ8j+i3cBNhfH38FTK2sW6jAqSNx2pJCUMPGHuiXpryIXwDU
   Js2UkU0VDXRLp1vCoYKANaGCzXy0j5MX0Q1YQYXoLB8mwWkXBEaiSAndR
   jZUHiRDaqXXHoNEBe91Ms0kfaWkNl0awTFGQUm+YxElFFr/XwzCMlCaRE
   ScDXhGIJ3KNCI9JdPYAe+f79W5JsWvWiimiBdEsR74STwMo9wJ76p8prW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="455347007"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="455347007"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 01:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888858549"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="888858549"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 16 Nov 2023 01:43:18 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] ghostscript: ignore GhostPCL CVE-2023-38560
Date: Thu, 16 Nov 2023 17:23:41 +0800
Message-Id: <20231116092341.4153514-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 09:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190767

From: Lee Chee Yang <chee.yang.lee@intel.com>

issue in GhostPCL.
GhostPCL not part of this GhostScript recipe.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 4c4c22cf39e..7f4050755cb 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -23,6 +23,9 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 # however we use an external jpeg which doesn't have the issue.
 CVE_CHECK_IGNORE += "CVE-2013-6629"
 
+# Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
+CVE_CHECK_IGNORE += "CVE-2023-38560"
+
 def gs_verdir(v):
     return "".join(v.split("."))
 
-- 
2.37.3


