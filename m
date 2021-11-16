Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781AAC4332F
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.5109.1637033083559436548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213649320"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="213649320"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567024055"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:54 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/14] cross-canadian: correct the location of
 pkg-config files
Date: Tue, 16 Nov 2021 11:24:19 +0800
Message-Id: 
 <e5022ff0a3e403d772a5b0654f9219274c1d6fb9.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158336

From: Alexander Kanavin <alex.kanavin@gmail.com>

layout_libdir has not been defined for many years.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c84fbed676a8e6717592c86c3742566ad0decac)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index f5c9f61595..3fc9cac442 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -155,7 +155,7 @@ libexecdir = "${exec_prefix}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}
 
 FILES_${PN} = "${prefix}"
 
-export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${layout_libdir}/pkgconfig"
+export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${exec_prefix}/lib/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
 do_populate_sysroot[stamp-extra-info] = ""
-- 
2.33.1


