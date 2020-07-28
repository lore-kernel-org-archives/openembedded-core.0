Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: wGgJt36/uSGn8wOQVD72C0KbMbZf1905SKSJQA7me/FFP6DQFo/+yFZm4w67NcMlXNoBdtkMgC
 NJ007UZzrIIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699699"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699699"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:55 -0700
IronPort-SDR: 7VZu1E1BqmzQzft3CoIsUygRKyVEuy80SvHNKv+FERja89VZUY+7wJ7wL9/vY7T1KRrJrAUxz+
 yHEONYN2gaIA==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245771"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 11/32] encodings: clear postinst script
Date: Tue, 28 Jul 2020 16:51:12 +0800
Message-Id: <19c87007f6f92dc94db19e3c23ad06e09f397abe.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Postinst script from xorg-font-common.inc doesn't apply to this recipe.
So clear the postinst script of encodings.

(From OE-Core rev: ba94c908b99713ce115e9240df525c6442a60c7a)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
(cherry picked from commit 99ae6dbb7278dfd264453af852c108fa56a0d4e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
index a39609b5da..74014ff91b 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
@@ -19,3 +19,7 @@ SRC_URI[sha256sum] = "bd96e16143a044b19e87f217cf6a3763a70c561d1076aad6f6d862ec41
 inherit allarch
 
 EXTRA_OECONF += "--with-encodingsdir=${datadir}/fonts/X11/encodings"
+
+# postinst from .inc doesn't apply to this recipe
+pkg_postinst_${PN} () {
+}
-- 
2.25.4

