Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.34266.1629168135472276180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214133326"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="214133326"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="593153067"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.145])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] ispc: upgrade 1.16.0 -> 1.16.1
Date: Tue, 17 Aug 2021 10:42:05 +0800
Message-Id: <20210817024209.114840-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817024209.114840-1-anuj.mittal@intel.com>
References: <20210817024209.114840-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-core/ispc/{ispc_1.16.0.bb => ispc_1.16.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename dynamic-layers/clang-layer/recipes-core/ispc/{ispc_1.16.0.bb => ispc_1.16.1.bb} (94%)

diff --git a/dynamic-layers/clang-layer/recipes-core/ispc/ispc_1.16.0.bb b/dynamic-layers/clang-layer/recipes-core/ispc/ispc_1.16.1.bb
similarity index 94%
rename from dynamic-layers/clang-layer/recipes-core/ispc/ispc_1.16.0.bb
rename to dynamic-layers/clang-layer/recipes-core/ispc/ispc_1.16.1.bb
index de7e8472..c319885f 100644
--- a/dynamic-layers/clang-layer/recipes-core/ispc/ispc_1.16.0.bb
+++ b/dynamic-layers/clang-layer/recipes-core/ispc/ispc_1.16.1.bb
@@ -11,12 +11,12 @@ inherit cmake python3native
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/ispc/ispc.git;protocol=https;branch=main \
+SRC_URI = "git://github.com/ispc/ispc.git;protocol=https;branch=releases/v1.16.x \
            file://0001-CMakeLists.txt-link-with-libclang-cpp-library-instea.patch \
            file://0002-cmake-don-t-build-for-32-bit-targets.patch \
            file://8b5d0f26916e776bc3664e6a4dc68eff3a198d7a.patch \
            "
-SRCREV = "bdd411085d3e398cf7927cb3b94b00af676737ba"
+SRCREV = "ae404c1da54422bc70696fbdaa4055bca0d1711e"
 
 COMPATIBLE_HOST = '(x86_64).*-linux'
 
-- 
2.31.1

