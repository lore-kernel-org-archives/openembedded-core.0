Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: lPyEDnWOi7UnBMPc7hjCHNw0BBaNltx5EeU3cFTQRC3aovFPYkKUsxBi8tVdS3hPpGIhGWSqtn
 rSANLOeLlVwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240464"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240464"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:23 -0800
IronPort-SDR: 73ZshTl6KUjPliIHImWIKJdQe2/yvtvYyEviwHjUFCkGtevGU6UIQjMvVSCA0tHC6K1ZV2pTut
 r0+vtX97WJHg==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958518"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] resolvconf: upgrade 1.83 -> 1.87
Date: Wed, 20 Jan 2021 15:40:54 +0800
Message-Id: <20210120074058.252462-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../resolvconf/{resolvconf_1.83.bb => resolvconf_1.87.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.83.bb => resolvconf_1.87.bb} (96%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
similarity index 96%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
index 33ee553d19..6df96b699c 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
@@ -11,12 +11,12 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
-          "
+           "
 
-SRCREV = "d001dd2b7ce4c854eaa29e46b9640ab66c6e70bb"
+SRCREV = "1dda36d8465e335c60190c41e7185d782da1bd7b"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

