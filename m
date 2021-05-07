Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: qwQDKJbopO40+YkntD9h9h+LrBY/xs2DX4mNmtw5A6TGTB9fVp1ABv64tOULd4GXfYoJphRzE4
 6UZgw/Y4/o+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794784"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794784"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:19 -0700
IronPort-SDR: N5qYEZph9Sx1BBAH/3V+59fGfYSs71ugvwUyw87vLxfCxpa9MxorwcBkAk9RXVrDnRUsVsYUCI
 ofLFE9GeOYgQ==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331653"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 21/31] libjpeg-turbo: Use --reproducible option for nasm
Date: Fri,  7 May 2021 15:02:33 +0800
Message-Id: <66db1962e49e6d06d388e4df9b31fc8db5372a42.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This ensures that nasm version and timestamps do but appear in build
outputs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f69c00c4bc1de6cd518fd78f67ff3ca863392f3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
index b6efc6bca0..0bd6af8db9 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
@@ -29,7 +29,7 @@ RCONFLICTS_${PN} += "jpeg"
 
 inherit cmake pkgconfig
 
-export NASMENV = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
-- 
2.30.2

