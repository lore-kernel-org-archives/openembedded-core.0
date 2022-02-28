Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA4FC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:39 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=T8fvkMmt;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056898; x=1677592898;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xBV5DbhgU37hAxNxRwOz6A4BL3Yo9CfWGuKhtfZtYTc=;
  b=T8fvkMmtp3ewvNJh79SZ2iLVaTaZ7EhO8FklGSfZan2gqQ/hY4ngeZ86
   3dVPY0Mws20chJibUVsy+PPeVpsePzQJVFjHgMKMTexybZKTYwTutNuri
   fFub0ewn6wsiapEzSw4tW8LJ2k+BjJnI8wK/kSnneVWoaVenDWr9r82Bx
   pXVv/AyhAU/I0okFm6FqdkJinDHQYq4dTsSE9XUmtraBIFqy+/5XjgT36
   96O1SKhj9NJIoMtFPLaFu1mS3mUpY4kJk/ZxTEjfvP+2Tw/HPcJgBTNH0
   wCd4QS54g3Szwih8p/WyeG84+9qFRI/y+0vOwjsK4YTHjfmD/C09MYUEu
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857416"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857416"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092782"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 33/39] vim: Upgrade 8.2.4314 -> 8.2.4424
Date: Mon, 28 Feb 2022 22:00:23 +0800
Message-Id: 
 <6a262ad3afb672f1976633118ecc390bf4de1ae1.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162489

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License file had some grammar fixes.

Includes CVE-2022-0554.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8d0a4026359c2c8a445dba9456f8a05470293c1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 26310ed591..6caa89c733 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS_${PN} = "diffutils"
 
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=600a38dc53e8931fdfb1238276ee09b0"
+                    file://runtime/doc/uganda.txt;md5=a3f193c20c6faff93c69185d5d070535"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
 "
 
-PV .= ".4314"
-SRCREV = "8cbf2499179db39a46e700ab04d0b36e22bcc1bb"
+PV .= ".4424"
+SRCREV = "cdf717283ca70b18f20b8a2cefe7957083280c6f"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.1


