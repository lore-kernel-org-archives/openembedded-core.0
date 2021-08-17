Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.34266.1629168135472276180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214133327"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="214133327"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:18 -0700
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="593153069"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.145])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] ixgbe: upgrade 5.11.3 -> 5.12.5
Date: Tue, 17 Aug 2021 10:42:06 +0800
Message-Id: <20210817024209.114840-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817024209.114840-1-anuj.mittal@intel.com>
References: <20210817024209.114840-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in this release:
- Added support for 5.12 kernel version
- Added support for RHEL 8.4
- Added support for SLES 15sp3
- Various bug fixes

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../intel-ethernet/{ixgbe_5.11.3.bb => ixgbe_5.12.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-kernel/intel-ethernet/{ixgbe_5.11.3.bb => ixgbe_5.12.5.bb} (93%)

diff --git a/recipes-kernel/intel-ethernet/ixgbe_5.11.3.bb b/recipes-kernel/intel-ethernet/ixgbe_5.12.5.bb
similarity index 93%
rename from recipes-kernel/intel-ethernet/ixgbe_5.11.3.bb
rename to recipes-kernel/intel-ethernet/ixgbe_5.12.5.bb
index 2845abee..86b0e666 100644
--- a/recipes-kernel/intel-ethernet/ixgbe_5.11.3.bb
+++ b/recipes-kernel/intel-ethernet/ixgbe_5.12.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}/COPYING;md5=a216b4192dc6b777b6f0db56
 SRC_URI = "https://sourceforge.net/projects/e1000/files/ixgbe%20stable/${PV}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "b7e5de734c406d28ea146366a5cc3b58bb3b6be039977863e4e1b217a8185ae2"
+SRC_URI[sha256sum] = "8156a262e0bb3ef053cac04d61af64c19dd94e9361f997e91e1abf315051d70a"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/e1000/files/ixgbe%20stable/"
 UPSTREAM_CHECK_REGEX = "ixgbe%20stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.31.1

