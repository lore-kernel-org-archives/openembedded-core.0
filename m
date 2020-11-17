Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Fo93kRrJpvIncChx1fyy2NRaPgf2hTCKcrjxbR5f/e4daBVIU1vcxJ5scw8/YORWH1bqgDgcWc
 zzPaRU++25bA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719955"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719955"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:20 -0800
IronPort-SDR: sGhbsCnb90Ln8LkD+Mpy0sr3I1JlkUWdsRtN1Kz3dRAE0PJ1Ox1KfnxaXzAnLNC7hFLbXJ27XQ
 2I/0ULP2fQlA==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802938"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/19] libdnf: Fix license as it contains 'or later' clause
Date: Tue, 17 Nov 2020 23:35:52 +0800
Message-Id: <01fd8b51074a91053f632b2932238e35c926045c.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license headers are clear that the code is "or later", fix LICENSE
to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e565e0b908c71ad5106d1c6c73d269b819787e55)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/libdnf/libdnf_0.48.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
index 37991e6d80..25c1bc68ba 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Library providing simplified C and Python API to libsolv"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
-- 
2.28.0

