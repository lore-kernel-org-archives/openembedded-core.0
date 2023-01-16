Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B836C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 03:05:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.157951.1673838332528305400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 19:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=P3LTjO6D;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673838332; x=1705374332;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iwA4DvNuAY8iPSNggKhwubZm98/anw3zvyxAzQtg9fs=;
  b=P3LTjO6DhA4o3hw94dNNnAWXp9K7eVeuyv4SZIVX7r3aOVKyKfz1t/Sx
   0vNYJJnTiobJ1bYfHrErpdqdGG4nftP8P0LUZtOrl1J0k05YihXjCmJPd
   C1a77YO4QK7wd20hdrRr1Knb1rIz0VBO55lcHMfojcpIPpCBRwSjGUgvf
   RK+ehdVPGxmqWgV5+h9XSGH66v1RqJVBL1A9/B3kDSpDNt7OFwsjkbYNQ
   Te1YgoPMNgFrFVk/wzpuG1RZt6qqykupdlzZXUhlB9smmEe7zqebZdia3
   L5RIvMpDoTv3SVUS2Ks93LzFHJ524yQgZFsPHClSg09Vpr8pTUwqbcFi8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="410618297"
X-IronPort-AV: E=Sophos;i="5.97,219,1669104000"; 
   d="scan'208";a="410618297"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2023 19:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="727317293"
X-IronPort-AV: E=Sophos;i="5.97,219,1669104000"; 
   d="scan'208";a="727317293"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jan 2023 19:05:31 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [langdale][patch] git: Upgrade to 2.37.4
Date: Mon, 16 Jan 2023 11:05:24 +0800
Message-Id: <20230116030524.1405836-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 03:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175958

From: Lee Chee Yang <chee.yang.lee@intel.com>

upgrade include fixes for CVE-2022-39253 CVE-2022-39260

Release notes:
https://github.com/git/git/blob/master/Documentation/RelNotes/2.37.4.txt

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/git/{git_2.37.3.bb => git_2.37.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.3.bb => git_2.37.4.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.3.bb b/meta/recipes-devtools/git/git_2.37.4.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.3.bb
rename to meta/recipes-devtools/git/git_2.37.4.bb
index 2eed85e807..2205a50d16 100644
--- a/meta/recipes-devtools/git/git_2.37.3.bb
+++ b/meta/recipes-devtools/git/git_2.37.4.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "181f65587155ea48c682f63135678ec53055adf1532428752912d356e46b64a8"
+SRC_URI[tarball.sha256sum] = "a638c9bf9e45e8d48592076266adaa9b7aa272a99ee2aee2e166a649a9ba8a03"
-- 
2.37.3


