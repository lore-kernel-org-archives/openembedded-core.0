Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C426C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=YnVrRNsv;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107527; x=1676643527;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=yrXhe5ZBorFLqmjV8KD0cvhrqfSDBGcuBCB/xpFbEwg=;
  b=YnVrRNsvVByqeq04hEKaTiL5yQnoRVxG6UVmGwYyeXQd5YAhGCt0uAQL
   usPELveOwiblgfBGyEdYrDH9FDRFCAhZ5KLPH36GYJqIJPQrORBAepN6o
   aohCVCII0DLL0609xVD9gy03T37LACGF/WJEUfjZ7ooFgbpfdAtR/clTp
   x3cxj1cUfkNcupZs++fykaJv/7fJFohMLDLCsf1ldbscAujVkAasYDh4Y
   w75yj98qnipNgUajWivLjkJbSH3qrBN2+hI9Ev0/lhTcHPZyObkqCDhFV
   QbopCQegQExKpd0WuUyi+U2dFEsrfkbpEWq3zNifrE+t3yRqABTWG2VMv
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250618044"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250618044"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249373"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/14] vim: update to include latest CVE fixes
Date: Thu, 17 Feb 2022 22:18:21 +0800
Message-Id: 
 <1ef8e3ec21b32d6d3654319561b24b8b1ce63243.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161812

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
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7174d818ff..0be75b6306 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
 "
 
-PV .= ".3752"
-SRCREV = "8603be338ac810446f23c092f21bc6082f787519"
+PV .= ".4118"
+SRCREV = "0023f82a76cf43a12b41e71f97a2e860d0444e1b"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.1


