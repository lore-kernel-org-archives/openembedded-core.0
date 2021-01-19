Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8243.1611038795825494015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FqF1Z+kVrthZJeJ8afv6cjptbn0BkSvz3dBgmZap7tQsLZsPGEGFUGioQLCcOkJ6Prs8ZXdyNF
 EZ1Xj8cVrpPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035646"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035646"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:22 -0800
IronPort-SDR: ezGbslL2GHqT9kjCW/TaQx+b87lxG4k2WLSa8I5MD/6k0O6gEltBRbGEz4N1DRJVVtuj5cPHVj
 oAioAYrljjWg==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441687"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/30] mpg123: upgrade 1.26.3 -> 1.26.4
Date: Tue, 19 Jan 2021 14:45:41 +0800
Message-Id: <20210119064552.115692-19-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Change in copyright years

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mpg123/{mpg123_1.26.3.bb => mpg123_1.26.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.26.3.bb => mpg123_1.26.4.bb} (93%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
similarity index 93%
rename from meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
index 0746d8d47d..c9bbcd30ff 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
@@ -7,10 +7,10 @@ BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "30c998785a898f2846deefc4d17d6e4683a5a550b7eacf6ea506e30a7a736c6e"
+SRC_URI[sha256sum] = "081991540df7a666b29049ad870f293cfa28863b36488ab4d58ceaa7b5846454"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.29.2

