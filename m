Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.8516.1620384908852671794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 03:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: kwavNoaH2rJ31x+cJHW8VDvN6VA3gEN/qETFTEwes2N76zrZjhyJ0IcQZeOTBkJT2EH45J5F2Y
 Rym74FGvryzA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185835087"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="scan'208";a="185835087"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 03:55:06 -0700
IronPort-SDR: IcLgFjEKfPWMhsMOjUFwQKh3tbqDMvherknnijeatd49UU34UHDBP1hjDOc9mFKg8JCIixKuDd
 D+bNqbXDOp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="scan'208";a="391049611"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga006.jf.intel.com with ESMTP; 07 May 2021 03:55:05 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH] ruby: upgrade 3.0.0 -> 3.0.1
Date: Fri,  7 May 2021 18:55:04 +0800
Message-Id: <20210507105504.79732-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

(From OE-Core rev: b6949a028fd31bd04ed0478fb34a58b971f31e1f)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.17.1

