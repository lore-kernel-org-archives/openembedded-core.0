Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DbUZjcqXjMjchUS5+m8MJZBcVzEeTQUCiQdNrtrekQe2U10JTbVoJrW8ZaHxXTWW3Fpheatwig
 1Lism1SptTKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062669"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062669"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:05 -0800
IronPort-SDR: Z1KvWYgBipi+J/dVJfVOIEa/cxLbZte1NIE0Y4lO+son53Bsly2JHf28DaU+uXxvXa0cNMjOgE
 0gwM+N5s2EOA==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986591"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:04 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/14] pseudo: Update for arm host and memleak fixes/cleanup
Date: Fri, 15 Jan 2021 00:09:42 +0800
Message-Id: <50b2695919af0db846e91dc8c328fa86225bf17d.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in:

makewrappers: support architecture-overrides in wrapper modifiers
makewrappers: fix Python 2 hangover
Fix some memory leaks
Disable deprecated function warnings
Silence switch block warnings
pseudo_util: don't overrun strings when looking for keys

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 11a3a9203ad595e7fa92acf442a7f3216d6e3830)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7fa11a54e7..29fa9152e2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "1ee9a1e05e200f189f6644411ba9304e8a479b0b"
+SRCREV = "f9754ac14672c4af19b77bc698a1a808b0828265"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.29.2

