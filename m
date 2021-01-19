Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8244.1611038799087798389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jbq+8Esvp6vPw9V3LgHqwbG6isV6WDocnTIqbUbafv1iNfN1Sh00pKJG4E16y5WphZGwC+fSmu
 2XKZyQ1wIyWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035659"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035659"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:30 -0800
IronPort-SDR: MXl0JqjDfzBPBZEtzGFQiHsjfN6Ev7y4/EJluU3ipgL/ArKD5VvZid0jNEc8GfllS36fPD0wZi
 vWExhAbM2/xA==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441827"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/30] python3-mako: upgrade 1.1.3 -> 1.1.4
Date: Tue, 19 Jan 2021 14:45:48 +0800
Message-Id: <20210119064552.115692-26-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python3-mako_1.1.3.bb => python3-mako_1.1.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.3.bb => python3-mako_1.1.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.3.bb b/meta/recipes-devtools/python/python3-mako_1.1.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-mako_1.1.3.bb
rename to meta/recipes-devtools/python/python3-mako_1.1.4.bb
index cda4e99220..531fc6a3c0 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.3.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.4.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8195c8c1400ceb53496064314c6736719c6f25e7479cd24c77be3d9361cddc27"
+SRC_URI[sha256sum] = "17831f0b7087c313c0ffae2bcbbd3c1d5ba9eeac9c38f2eb7b50e8c99fe9d5ab"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.29.2

