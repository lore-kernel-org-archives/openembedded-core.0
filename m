Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5396.1595477000395282811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 21:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06N42xfX020820
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 21:03:09 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Jul 2020
 21:02:36 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] ccache: Upgrade to 3.7.11
Date: Wed, 22 Jul 2020 21:02:35 -0700
Message-ID: <20200723040236.75818-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Bug fixes:
  Added knowledge about -fprofile-{correction,reorder-functions,values}.
  ccache now handles the Intel compiler option -xCODE (where CODE is a processor feature code) correctly.
  Added support for NVCC's -Werror and --Werror options.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ccache/{ccache_3.7.10.bb => ccache_3.7.11.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_3.7.10.bb => ccache_3.7.11.bb} (91%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.7.10.bb b/meta/recipes-devtools/ccache/ccache_3.7.11.bb
similarity index 91%
rename from meta/recipes-devtools/ccache/ccache_3.7.10.bb
rename to meta/recipes-devtools/ccache/ccache_3.7.11.bb
index 852583dfd2..fd004f4c9b 100644
--- a/meta/recipes-devtools/ccache/ccache_3.7.10.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.7.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22d514dbc01fdf9a9784334b6b59417a"
 DEPENDS = "zlib"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "447ddf21a5f0ffa6b6d26839ae876a6d17d0d7e3533926cdf78ecd11dad793f8"
+SRC_URI[sha256sum] = "34309a59d4b6b6b33756366aa9d3144a4655587be9f914476b4c0e2d36365f01"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.17.1

