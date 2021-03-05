Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vPjga1PkWyLwgI/g+eTOwu09/EKpCEUx4IeL5U/ydz6m0W3waYdVyGSsr/JbvBbM7zY3HGiTSm
 foWZaBG3oFGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671092"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671092"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:39 -0800
IronPort-SDR: FeYBq3Q7MNO3IF5lmHNo3H5xcHqVTIABHefmLsOzHxmMvWePmh+edhLFIBZDalVKt6ttaJIXyz
 QT4Xr1cRwVwQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128959"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:38 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 30/52] bitbake.conf: Introduce FAKEROOTLOGS variable used by bitbake to print pseudo.log
Date: Fri,  5 Mar 2021 12:21:06 +0800
Message-Id: <156d983c0b72adcc32c1ec8bfccd9208e7beccfa.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

Bitbake depends on this variable while looking for pseudo.log file in
case of fakeroot task failure.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8e9e5f62b144828387e20eec2e66fcd61edd0d3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e0a0ec4b4..b38b1d2964 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -696,6 +696,7 @@ FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
+FAKEROOTLOGS = "${WORKDIR}/pseudo/pseudo.log"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 ##################################################################
-- 
2.29.2

