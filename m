Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CBCC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 09:57:50 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.70349.1656928664203331946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kNRB6bEe;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656928664; x=1688464664;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zD9/op1OrTK/BwyS4ZYXZWDpsKWueM3yg8r66gsYYqw=;
  b=kNRB6bEeC+M32dOV/jz+GlpP50iTzcD/XPox4qAWmIkWI39cBnbIeBtw
   aGL8dNJ4mi9G93b8yO+jL+pxdCmkMVM4ZrKnnDisyQ5aD5TspeFcLHfFH
   i6A0t8zZwZ/YR5giqPyzjyCpB1VMj1Udi0eNmTQsfCVAlTTqYcZRuxpJQ
   rM65oTa6qDXuxvdzdfGw2ujkjHt0n5S4JiGS2/SgED936uTQtR6CJzcxB
   UAvbWsTR8Te3KCqXwe2Lyj0kt2pWjovSrQPsQfqd5hlug3mEZHyHdNtX7
   j1ty6AOHsyuFQxPtKIEJo7ei8c5rK9BONURNHUkHtKdP58bxSFpR1o7Zo
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="263511836"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400";
   d="scan'208";a="263511836"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 02:57:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400";
   d="scan'208";a="660152659"
Received: from normannu-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.148.51])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 02:57:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] efivar: change branch name to main
Date: Mon,  4 Jul 2022 17:57:28 +0800
Message-Id: <20220704095728.25494-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 09:57:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167601

Upstream has changed branch name to main from master. Change SRC_URI
accordingly.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/efivar/efivar_37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index fa1fe1ecdf1..858c61ae6ab 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://determinism.patch \
            file://no-werror.patch"
 SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
-- 
2.35.3


