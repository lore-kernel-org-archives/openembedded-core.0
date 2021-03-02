Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.5602.1614671727848041525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 23:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: EKagsVK9NInUVsabJ0pXz8s62VcpfSSg1GoQRWpKb0c6WsgBEP9jFQWAkVR5tMMdJfSou8YUzb
 6pVGJ4Fpd3lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184288574"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="184288574"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 23:55:31 -0800
IronPort-SDR: 6bYoRMJImXg6lKJHbH7Kr7le7ov/YVqXMEn5GB++B9JoLakysigqeOX90lnMBS64WRyDLYc5RA
 QEpXNNlgD8MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="398210780"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2021 23:55:30 -0800
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: sangeeta jain <sangeeta.jain@intel.com>
Subject: [OE-core] [PATCH 2/2] meta/recipes-support/libfaketime: added recipe libfaketime
Date: Tue,  2 Mar 2021 15:55:22 +0800
Message-Id: <1614671722-23680-2-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614671722-23680-1-git-send-email-sangeeta.jain@intel.com>
References: <1614671722-23680-1-git-send-email-sangeeta.jain@intel.com>

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

