Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: YSoF9WIUQLcBN4ucYl3b/YNxv3WHoQwpXS2aqENeVsUPMM7MNugg7in26RYzoZmdV+WR1xYlLU
 jhEPjJRhQXeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613723"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613723"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:49 -0800
IronPort-SDR: Dk3B8PHIp4XDxnO7I4hPA50N2OC7FtgJMnChHJ7Zezfh4zGg06In2oTG0/0J49QU/6/9klfx2z
 k34PkJtrBKIw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209487"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:48 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 23/30] diffstat: point the license checksum at the license
Date: Fri,  8 Jan 2021 12:18:05 +0800
Message-Id: <cec30244d9c7051dbd727fddeb4b617c783c6fd5.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Previously install-sh was used, which is installed by autoconf so isn't
a relevant license.

Also remove S assignment, as that's the default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23cb39a5fa2a55681e7bc2605f435135cec9173b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.63.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
index 61b2ea5dc2..863f924b22 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
@@ -5,7 +5,7 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0ca4a5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a3d0bb117493e804b0c1a868ddf23321"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
@@ -16,8 +16,6 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
 SRC_URI[md5sum] = "b9272ec8af6257103261ec3622692991"
 SRC_URI[sha256sum] = "7eddd53401b99b90bac3f7ebf23dd583d7d99c6106e67a4f1161b7a20110dc6f"
 
-S = "${WORKDIR}/diffstat-${PV}"
-
 inherit autotools gettext ptest
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
-- 
2.29.2

