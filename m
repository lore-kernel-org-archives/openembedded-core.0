Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E51EC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:21:22 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.8563.1646749281769388891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=QyebHzCj;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749281; x=1678285281;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=geqeK9wXN9WeQoAM7LfFkj/GxzZk96ms/6jj+l5jQbE=;
  b=QyebHzCjfKV5WsL37NZqE3dvCNsaapnMtU2u00VPDTZSXN+nvkzFrpOf
   CIyHpcUOgFtypr5suMJ1Va2X3FZJAin2ML4rn57P530OlHeUKI7MkW5xC
   kygqTyvyFkZg9q2faLQDTLxjSdMWe76db4+Wf5TWFkUQLvVTODAQw+8y2
   YhG8tGQuzVD37OgxmzaebRIi9VBuYgV1Je3O1A/0u1eIh2iNephqreW02
   KZIlep5OnOQxGQWCm5ZfW666C0Ir8m+3vXDW2VGFTcVK+Np88sXWp4YNK
   9qbNMBE9KxtZrOeIqdaxcIfKl602XWD94sIRWpJ6aDFzFx4w3rdd1Qwr0
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242130082"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="242130082"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513119924"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/15] wireless-regdb: upgrade 2021.08.28 ->
 2022.02.18
Date: Tue,  8 Mar 2022 22:19:57 +0800
Message-Id: 
 <35053703a511fbd3e931740b546b863097485809.1646748870.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646748869.git.anuj.mittal@intel.com>
References: <cover.1646748869.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162914

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5c06ddfd3c0db0d0762c0241c019f59ad310e53)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
index b1cad01a25..2d7e5dad9d 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446"
+SRC_URI[sha256sum] = "8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f"
 
 inherit bin_package allarch
 
-- 
2.35.1


