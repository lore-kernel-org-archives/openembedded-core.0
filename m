Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B33C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:16 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZklhDA2F;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983995; x=1675519995;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mGvBn6cQI9Gtr4V2TIhABgjGdiB07pLF/yVCawZ8VNY=;
  b=ZklhDA2Fk6SqyuMP9C4jwWnImqAsXtL0KHtEkMIdgeKhyGKaN/6mhuuZ
   OMkgpzWAf/Z286EfL1KtLiWW0sENCH6T8UgqrQFVNoWbJINghoy3cmXeW
   gm6rj87iUDS4XZ5ZXX0nkHLX6DQa9+NjTL2mdIke1huW+R9tQeZ5CRsv/
   bijE+an1AiDWXCE9fV4w8VtrPkLd7iyDadI4Qjq7gq2gbCBKBIerKDFwe
   1p9tFRXR7mG3/O7KAjWLakchXeSu7G56oROVPGoIB2A2RBdN+D03sqQwu
   oW6KqFROpNuPw1oNiwgAP4QuW6zYzaoM+ly4brF4iBw0wWQT9z8dZ3aXy
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321661"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321661"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750113"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 15/17] vim: upgrade to patch 4269
Date: Fri,  4 Feb 2022 22:12:41 +0800
Message-Id: 
 <61dcaeda02fe1136610f1cf4d4ec271f16dacfcf.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161362

From: Ross Burton <ross@burtonini.com>

Upgrade to the latest patch release to fix the following CVEs:

- CVE-2022-0261
- CVE-2022-0318
- CVE-2022-0319

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96442e681c3acd82b09e3becd78e902709945f1f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d68fade26a..6c70bb7529 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4118"
-SRCREV = "0023f82a76cf43a12b41e71f97a2e860d0444e1b"
+PV .= ".4269"
+SRCREV = "48a604845e33399893d6bf293e71bcd2a412800d"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


