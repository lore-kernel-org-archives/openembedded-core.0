Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.3944.1623383459422790226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 7FwSVr2AoYh5UGjrNdzsji9wjTwqP32c+LZ/0nELSr2m9f2nWdQ8jNsabjqw2psnkLvw57XP8v
 91QLXkJ+ITow==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192565996"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192565996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:50:57 -0700
IronPort-SDR: +nqUR7R9GAFnd0p4EBNKCA6jk6t1mygjUHT14CrDbR+0UxzefHwUgHG0D97KUYpyf/lIVSyia/
 Jt+I5OOT30wg==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091578"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:50:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/17] python3: upgrade 3.9.4 -> 3.9.5
Date: Fri, 11 Jun 2021 11:50:34 +0800
Message-Id: <e40120185659e48f73e1aef029b699e2207e30de.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623383318.git.anuj.mittal@intel.com>
References: <cover.1623383318.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Version 3.9.5 includes a fix for CVE-2021-29921.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be23351f97c1a7362c0ddd240a6de0cddfca1b01)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python3_3.9.4.bb => python3_3.9.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.9.4.bb => python3_3.9.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.9.4.bb b/meta/recipes-devtools/python/python3_3.9.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.4.bb
rename to meta/recipes-devtools/python/python3_3.9.5.bb
index cb371ceed7..82177f4a18 100644
--- a/meta/recipes-devtools/python/python3_3.9.4.bb
+++ b/meta/recipes-devtools/python/python3_3.9.5.bb
@@ -38,7 +38,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "4b0e6644a76f8df864ae24ac500a51bbf68bd098f6a173e27d3b61cdca9aa134"
+SRC_URI[sha256sum] = "0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffcb6d1820d716d83"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.31.1

