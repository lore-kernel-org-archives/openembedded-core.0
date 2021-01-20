Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xrnU/ruO8VymNEshE9fKA+xzYrzpIExbIhXRoRle594UoNAj8FKhuCSlzUfkwHE0wM1bG4DNMW
 8zwtO5hR8uPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240478"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:27 -0800
IronPort-SDR: g0vPL2IeAiIlSM80f6dmFpBpRY7zZNbm7or+agC/f0hil8PvIPZ54hR3uTFIg1d5SKIP3jaxdw
 xtS6geo/lfUw==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958538"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] meson: upgrade 0.56.0 -> 0.56.2
Date: Wed, 20 Jan 2021 15:40:57 +0800
Message-Id: <20210120074058.252462-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/meson/meson.inc                       | 2 +-
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch   | 2 +-
 .../meson/0002-Support-building-allarch-recipes-again.patch | 6 +++---
 .../meson/{meson_0.56.0.bb => meson_0.56.2.bb}              | 0
 ...{nativesdk-meson_0.56.0.bb => nativesdk-meson_0.56.2.bb} | 0
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.56.0.bb => meson_0.56.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.56.0.bb => nativesdk-meson_0.56.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 2d3adbdb1a..d0ebec9911 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
            "
-SRC_URI[sha256sum] = "291dd38ff1cd55fcfca8fc985181dd39be0d3e5826e5f0013bf867be40117213"
+SRC_URI[sha256sum] = "3cb8bdb91383f7f8da642f916e4c44066a29262caa499341e2880f010edb87f4"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 86edcb5241..edd262df5a 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 110a525e5ebed2fca138d72da493c39510311c1f Mon Sep 17 00:00:00 2001
+From 248d17b7221e7ebc9d84154eac11ae4ebb5189ab Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 2d804740ad..2bbd2c149c 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 38f59e256f760aa959c13f4c5713f87ff7addee5 Mon Sep 17 00:00:00 2001
+From 3c0d3d1a32d4a66aa0b7ab9af3e975243855a1db Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,10 +13,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index d1be65b..90f3573 100644
+index 5ba3a1a..0bf4969 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -36,6 +36,7 @@ _T = T.TypeVar('_T')
+@@ -38,6 +38,7 @@ _T = T.TypeVar('_T')
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson_0.56.0.bb b/meta/recipes-devtools/meson/meson_0.56.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.56.0.bb
rename to meta/recipes-devtools/meson/meson_0.56.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb
-- 
2.29.2

