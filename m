Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.5838.1614672493735126718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 00:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: gTYv2JdlSf1uEEdanXMhEB0guwfLcQCFk8DhgkUIHw3+JVy/uqcH2GCyk2g/AB01xr9/Le7gaL
 3QiaIeM8PE2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186055170"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="186055170"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 00:08:15 -0800
IronPort-SDR: 2Ps/BzC6GYJkFZ5aePESpsPjQiVtu1vBbzHt1wEosNwq3W5zxzW+jIJbLaRx3Yo0rhmNGB8A2+
 01Oi/sEu9Xsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="373505277"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2021 00:08:13 -0800
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: sangeeta jain <sangeeta.jain@intel.com>
Subject: [OE-core] [PATCH v2 2/2] meta/recipes-support/libfaketime: added recipe libfaketime
Date: Tue,  2 Mar 2021 16:08:08 +0800
Message-Id: <1614672488-32161-2-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614672488-32161-1-git-send-email-sangeeta.jain@intel.com>
References: <1614672488-32161-1-git-send-email-sangeeta.jain@intel.com>

From: sangeeta jain <sangeeta.jain@intel.com>

libfaketime intercepts various system calls that programs use to retrieve the
current date and time. It then reports modified (faked) dates and times (as
specified the user) to these programs. It can modify the system time a
program sees without having to change the time system-wide. It is useful
for QA to fake the time in the future when building the test build to check
for better reproducibility.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
---
 meta/recipes-support/libfaketime/libfaketime_0.9.8.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-support/libfaketime/libfaketime_0.9.8.bb

diff --git a/meta/recipes-support/libfaketime/libfaketime_0.9.8.bb b/meta/recipes-support/libfaketime/libfaketime_0.9.8.bb
new file mode 100644
index 0000000..e7e203b
--- /dev/null
+++ b/meta/recipes-support/libfaketime/libfaketime_0.9.8.bb
@@ -0,0 +1,19 @@
+SUMMARY = "It can modify the system time a program sees without changing time system-wide"
+HOMEPAGE = "https://github.com/wolfcw/libfaketime"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/wolfcw/libfaketime.git;protocol=https"
+
+SRCREV = "dc2ae5eef31c7a64ce3a976487d8e57d50b8d594"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+        oe_runmake -C src
+}
+
+do_install() {
+
+         oe_runmake install DESTDIR=${D} PREFIX=${prefix}/ LIBDIRNAME=${baselib}
+}
\ No newline at end of file
-- 
2.7.4

