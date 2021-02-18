Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: u47Ww6DicubcPkopHvB+8Fqr/TdszoP3A0nwP3Hz3YhXcbZMGsQi5mu5TJ/b8Q1YWtM72V9XhN
 mb3h0IY5cNMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177999"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177999"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:35 -0800
IronPort-SDR: M2iPuj46AUWIHx+1nL3IB4a0UtZcCaPWaEMx9JOADuPrNZ1i/SG8KHldFeoTDzilfTTtqIvlmw
 cVLV+Rtj1p0A==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269219"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/12] kmscube: upgrade to latest revision
Date: Thu, 18 Feb 2021 12:24:15 +0800
Message-Id: <20210218042418.281245-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 478d5c4de4..bf4cb235a4 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "e6386d1b99366ea7559438c0d3abd2ae2d6d61ac"
+SRCREV = "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.29.2

