Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EE6C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:48 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ldESTyWR;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118407; x=1674654407;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LvBnfWk9zJrO3rZKYFfkAmn6tESUCLEJPrXrqBr7rS4=;
  b=ldESTyWROQ7pMsWHasT6dDZZgjAtZX1KG/Yexum+HKa9PE0pNJ8SzbAT
   mv6hYPiTgfZMCVE9R+3btj7kt+mhq3LLhQLYfxwT9UmdDkpKIY4muDH0l
   8X4ctil8jgIq9opxvH0kHblzYT6ejd3Cmvgm118oAKTzAmSlri5v5VZJ/
   2oQyoyoDrdHUiBlUWh+25Ewsu3cOnSHT6+b6D+h+yn1udRO9wuJGnhaSY
   zJ4R3PBrEV4h8naVRlbttYVgz/CxDuY7FMuqVYRZlF5QUNCPI0qnIkNlD
   axqYvgT0C09KS8GnItDex8xGkm6p08h+k9xI1cAtmpRHwAxuZdbnHtGWJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016514"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016514"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494374"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/13] vim: update to include latest CVE fixes
Date: Tue, 25 Jan 2022 21:46:04 +0800
Message-Id: 
 <10e6043aa5a11675127760097580b78a8cac4515.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160931

From: Ross Burton <ross@burtonini.com>

Update the version to 4.2.4118, which incorporates the following CVE
fixes:

- CVE-2021-4187
- CVE-2022-0128
- CVE-2022-0156
- CVE-2022-0158

Also remove the explicit whitelisting of CVE-2021-3968 as this is now
handled with an accurate CPE specifying the fixed version.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 764519ad0da6b881918667ca272fcc273b56168a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0ddf95ab72..d68fade26a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,15 +20,12 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".3752"
-SRCREV = "8603be338ac810446f23c092f21bc6082f787519"
+PV .= ".4118"
+SRCREV = "0023f82a76cf43a12b41e71f97a2e860d0444e1b"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 
-# CVE-2021-3968 is related to an issue which was introduced after 8.2, this can be removed after 8.3.
-CVE_CHECK_WHITELIST += "CVE-2021-3968"
-
 S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-- 
2.34.1


