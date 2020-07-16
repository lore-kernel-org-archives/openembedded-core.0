Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12053.1594892178854619826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 02:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: HehdhOT+08Ssmw+sXNwaFGvVuGU0cH3ftHCr5SRrDqqw/6nVsURB4WMKGxwjk9R27ufUwoJI70
 2L4sK4r2hxbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="214086604"
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; 
   d="scan'208";a="214086604"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 02:36:10 -0700
IronPort-SDR: /9XqP1yOfKjqIASkxS0nU2yeEpV8ej6zaw4HgpEh2cmmYp3vGZi+B+q4+jeNMMHYMmApCQY/Hy
 ccQFBIRFSLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; 
   d="scan'208";a="269206623"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jul 2020 02:36:09 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libva-initial: upgrade 2.7.1 -> 2.8.0
Date: Thu, 16 Jul 2020 17:43:37 +0800
Message-Id: <20200716094338.9110-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716094338.9110-1-naveen.kumar.saini@intel.com>
References: <20200716094338.9110-1-naveen.kumar.saini@intel.com>

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../libva/{libva-initial_2.7.1.bb => libva-initial_2.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.7.1.bb => libva-initial_2.8.0.bb} (62%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.7.1.bb b/meta/recipes-graphics/libva/libva-initial_2.8.0.bb
similarity index 62%
rename from meta/recipes-graphics/libva/libva-initial_2.7.1.bb
rename to meta/recipes-graphics/libva/libva-initial_2.8.0.bb
index 3e2b806c6d..f90bb510c4 100644
--- a/meta/recipes-graphics/libva/libva-initial_2.7.1.bb
+++ b/meta/recipes-graphics/libva/libva-initial_2.8.0.bb
@@ -1,7 +1,7 @@
 require libva.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "a00ff19d9f969259b9784172adad7788dbf3de827d985c5d27c230efd5d98a04"
+SRC_URI[sha256sum] = "adbb1244d278908f89ccfcf254a442de6d71934565a492cb6f03caf2ed4d1ec3"
 
 do_install_append () {
 	rm -f ${D}${libdir}/*.so*
-- 
2.17.1

