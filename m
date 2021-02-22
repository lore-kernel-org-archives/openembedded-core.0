Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.36802.1614009670915969052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: K+ds3cbZLoVyfrRIpJbZasueAWFfTtYrsqWIpUEaEDqwsxJOJqANYt7TxZXbtvhnPLz0FvUSnl
 +JCTZQ4I58Tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706133"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706133"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:16 -0800
IronPort-SDR: /xwtIJpTgxEf5YMoAgHk3isZ9iZ45VWGmBmbm/JIqF1bMKMSpA/vT0k+vkDXXi2/v0lQdJGh4s
 f4odK+VSZ/4Q==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302088"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:15 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 25/30] watchdog: Avoid reproducibility failures after fixing build
Date: Tue, 23 Feb 2021 00:00:28 +0800
Message-Id: <eb6323932b0d852ad5c10cb7e1e5015bb3e51e3e.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add some temporary bumps to versions to change the output hash so
the fix applies correctly. Can be dropped next time we update the
recipe and the output changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69205edcdff865048e55a6b7feaf82064ebc10c5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/watchdog/watchdog_5.16.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 24a05dcda7..a44a459c20 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -18,6 +18,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
 SRC_URI[md5sum] = "1b4f51cabc64d1bee2fce7cdd626831f"
 SRC_URI[sha256sum] = "b8e7c070e1b72aee2663bdc13b5cc39f76c9232669cfbb1ac0adc7275a3b019d"
 
+# Can be dropped when the output next changes, avoids failures after
+# reproducibility issues
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.29.2

