Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9c9yd4+imgKZCgxpGbwBZLt4V/NdiLqAV9TXzuqLLVXskGDjhxODfHx9oaD5kteUYb633G2Dwg
 Du0kqRq91pIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917825"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917825"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:19 -0700
IronPort-SDR: zgjZqWjgoAem/5Y6r8euy9ZgdPzopIRQhbM2atIl7qwcEpgV4dOc112AQvkfdCnXPlcDGY3lIc
 NW5NDIc6LO0Q==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645818"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/15] ruby: upgrade 3.0.0 -> 3.0.1
Date: Wed, 12 May 2021 16:35:44 +0800
Message-Id: <9fde0b5121b6cda894ef761a526fa4feced02d5f.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6949a028fd31bd04ed0478fb34a58b971f31e1f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/ruby/{ruby_3.0.0.bb => ruby_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.0.bb => ruby_3.0.1.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.0.0.bb b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.0.0.bb
rename to meta/recipes-devtools/ruby/ruby_3.0.1.bb
index 28e12c3cd7..944cb81c1d 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
@@ -8,7 +8,7 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[sha256sum] = "a13ed141a1c18eb967aac1e33f4d6ad5f21be1ac543c344e0d6feeee54af8e28"
+SRC_URI[sha256sum] = "369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.31.1

