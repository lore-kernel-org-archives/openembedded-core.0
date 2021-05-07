Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JEeBz8ARF2zyaygEQq++TIH1gy9EZc53QMNZaltInssa9/IzFcEWtCUvYABI0dxml0Hnp4uP+s
 DaCbmwIuQLmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794716"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794716"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:02 -0700
IronPort-SDR: HgnI4awD1iwcqjMbvaTsabKyBrKPKocx63G/fimV7cu7rAK+qDyjtSCffON60cF0rZsJj8EbLR
 T9OZH1WYc8hA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331569"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:01 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/31] wireless-regdb: upgrade 2020.11.20 -> 2021.04.21
Date: Fri,  7 May 2021 15:02:21 +0800
Message-Id: <b41c32d47b2fcb023ea4abd27af71366fd192236.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df540a630f87c02898f7ce5703f63e9c7bd2c156)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ireless-regdb_2020.11.20.bb => wireless-regdb_2021.04.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.11.20.bb => wireless-regdb_2021.04.21.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
index b3567bca95..f79c0b29ea 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b4164490d82ff7b0086e812ac42ab27baf57be24324d4c0ee1c5dd6ba27f2a52"
+SRC_URI[sha256sum] = "9e4c02b2a9710df4dbdb327c39612e8cbbae6495987afeddaebab28c1ea3d8fa"
 
 inherit bin_package allarch
 
-- 
2.30.2

