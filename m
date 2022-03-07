Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A56AC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:00 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26508.1646662438266182811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=O6vO3bER;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662439; x=1678198439;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mnX12M9XTkiptv07E5yafl5tPz6Lgi73o8eRId8mU4s=;
  b=O6vO3bERYpShgOUTAHLFJoEyg0Y2cpYwM8VwpEDa+dltJAaNSzD4EZPL
   qOyhw0shy9P2AT0ahbGILyaZx7aYLzohD1ta0RYBO1S4BiENauCLBF52h
   uRWe3PC0eYpTymyNkZ08h2nWIjzaFeo5nGs2CFMb0QWdguASYC0RcV01+
   HMFW62HlrIOjjIqVIr2pEav7nBZdd5nHHdQDtHhw0NtnGYO62hP3ZEwYQ
   5ePJlnYKQ0SiBY2sSHO/h58bZrG7z1INZc7BV9QRuGRx3up2z9XCGddmP
   ca1NE1HMuLubHAjDW1ykNulaBj5B8B219Mr+Yrag3zJEoOU9jE7xUhJGT
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112521"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112521"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070822"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/25] wireless-regdb: upgrade 2021.08.28 ->
 2022.02.18
Date: Mon,  7 Mar 2022 22:09:47 +0800
Message-Id: 
 <04c5f72add897fe2ef09b5ac0983ede8a36e7816.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162832

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
index c673f8044c..801a6f0584 100644
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


