Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2976EC46CD8
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:47:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.45511.1702910852353229137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gqsZodVn;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702910861; x=1734446861;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QiUp/oalf/UINuMkCzUtbWfckYVtUqyPe1ZVdAcM92o=;
  b=gqsZodVngBcJEBq8OOPwHfkS82qOby8+uT9iNJ+6SdnlgjW7vV9VaEaw
   nY712XjRvLV3qohWOiqfP4x3ofSq214XyV1kWPvQ864k6vTQ1EhhvA0FX
   6Hz1cSJTNJQSgUEZnoCeHxhuvnAWptB6iqEcGTT8ak63JcrTkOJKFPBdy
   snQNEhNtnTy2X6D52t1Y0WnlHZ35kd2NzpBu0etNK34QkpBceZxABABJN
   6rTOsHeQMhPbYXcMJ+0e5M3Lzq/bVtHoAH/joRQA+qPcnPYVnoN8beRYv
   uFCCRPbD9uSoT2AyhoBhzt5VzHw0ma2moGB0D3cYyV/ey19Lf6Els73GO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2350888"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2350888"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="23802919"
Received: from jsuah-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.240.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] stress-ng: upgrade 0.17.01 -> 0.17.03
Date: Mon, 18 Dec 2023 22:47:22 +0800
Message-ID: <20231218144724.7794-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218144724.7794-1-anuj.mittal@intel.com>
References: <20231218144724.7794-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192652

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.17.01.bb => stress-ng_0.17.03.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.17.01.bb => stress-ng_0.17.03.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.17.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.17.03.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.17.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.17.03.bb
index b6fd96d8578..0da5294f31d 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.17.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.17.03.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "c9669b041eff5905da191974ba0102208a59e04e"
+SRCREV = "8c39f5a2d9b199189456f414afd9e536dae69d1b"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.43.0


