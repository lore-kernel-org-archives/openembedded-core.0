Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0B9C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 02:54:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.1700.1650941656313754698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 19:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Pz0zi/JR;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650941659; x=1682477659;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OgCKVgySNxkD5ZJ1pwIytEnek1hqQrAbVa2o2+88DMg=;
  b=Pz0zi/JRTIZul0PX4jsCtJonu0OhNs/PuZmxdO/nl4QWmU6R2EsxwJhn
   lXSa6gbPAvnGnSmdeWIuJ1/4GoOlcGej/65FV5nimc/zCz3eq71jFvHLf
   5f1kiASZcJ64bkbI9m4qQwW2Z8Wa6aNrDEebYvQ5XHZp/Y3Wx3M9jLB+e
   4xUaflvDaD8YGi5VYBN9DYT/7y8NJqW5doEw8rD4aWtN02JZZxr/t1Oec
   EV1QXbnqm9h8URRSdr/Xr13if73FDFlZnkk1GGNsg/SCPEx1XcBYPhrZa
   mfHcIogqZY9FvOSEHzZQ5snj8YkKldeh+Kws298rwlrC0xalka1NB80Zv
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264950973"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="264950973"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="660439869"
Received: from huiyingn-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.47.238])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:17 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 5/7] wireless-regdb: upgrade 2022.02.18 ->
 2022.04.08
Date: Tue, 26 Apr 2022 10:54:03 +0800
Message-Id: 
 <e35065026b72a218249e41e2b26aefb06066071c.1650941226.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650941226.git.anuj.mittal@intel.com>
References: <cover.1650941226.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 02:54:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164852

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6ea7450a919f2b571746e7af350c1362e41f8e1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
index 801a6f0584..cd42039680 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f"
+SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
 
 inherit bin_package allarch
 
-- 
2.35.1


