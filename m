Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: NGz2pu/LWyhRb5ObbnkEmu39LRWcPmLKrnUITafgAneCtR3HAH65Y8i71y+vqUbCeA7VDmw67e
 Hwu4JzQ3yFdg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:33 -0700
IronPort-SDR: hkhjLtOEIMsfrf/cI2kyxX+I0eR7EzcUnYUvJQPVwrLSkjv2DcNH3sHFRkDYgiYF6atN/S43sl
 XM5485D+MNqQ==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866187"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 10/25] gstreamer1.0: upgrade 1.16.1 -> 1.16.2
Date: Fri, 29 May 2020 13:52:46 +0800
Message-Id: <ebd7c24aa0fd5718b23af047090bd8ddf6e80d37.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0_1.16.1.bb => gstreamer1.0_1.16.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.1.bb => gstreamer1.0_1.16.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
index ff92f63bac..cf7c1bca12 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
@@ -27,8 +27,8 @@ SRC_URI = " \
     file://add-a-target-to-compile-tests.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "c505fb818b36988daaa846e9e63eabe8"
-SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d"
+SRC_URI[md5sum] = "0e661ed5bdf1d8996e430228d022628e"
+SRC_URI[sha256sum] = "e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    "
-- 
2.25.4

