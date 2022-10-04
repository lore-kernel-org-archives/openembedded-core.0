Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8789C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:26:05 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.7693.1664864762806450476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=XpvWScmm;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664864762; x=1696400762;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=38vb5HIrrT31FixbZAUjG5Rhjzhndg+SK/iQ5R+azY4=;
  b=XpvWScmm/sCWxQdtX5vNxB1TD6J8wyN0I534J+G2MtA5JtAg1RYdCS/a
   gUi4b2xf1R8DIXDl8f3Q71UL/ZmZErBK53nETIGxYZrsanUrICA90rTiC
   b5RRH/txahFJQExdEiWVYi3XrCzlJaOL1Hf4feG/eZaNWNg8svRJuMomh
   I4qq0yFMFw+xCa6OuXXhwfqnkxZAMDXIQYsJIZBELyMS5jPk0ekQaZrm6
   S07dJZjbODqJnqQdXV+/ZnaD9YYtU1lR/GaKhuLpAazhvYy7rtGV3GcIj
   qyXVIPS7+Nx1DioFYB2dc0e87tJ3C/pNol85CIs5ecREKy5JR8krVffYV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="304381685"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200";
   d="scan'208";a="304381685"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 23:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="799010620"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200";
   d="scan'208";a="799010620"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 03 Oct 2022 23:25:57 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][Patch] vim: Upgrade 9.0.0598 -> 9.0.0614
Date: Tue,  4 Oct 2022 14:25:52 +0800
Message-Id: <20221004062552.1230810-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 06:26:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171373

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Include fixes for CVE-2022-3352.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index cbc370100b..0710f6afbf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0598"
-SRCREV = "8279af514ca7e5fd3c31cf13b0864163d1a0bfeb"
+PV .= ".0614"
+SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.37.3


