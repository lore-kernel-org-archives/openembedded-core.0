Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6shA-0001gU-N5
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 01:28:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Sep 2011 16:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,426,1312182000"; d="scan'208";a="63215335"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.16])
	by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2011 16:23:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 16:23:21 -0700
Message-Id: <f51dc1ec47da118aca1324f4e0cb1ee776611fbf.1316733769.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316733769.git.sgw@linux.intel.com>
References: <cover.1316733769.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316733769.git.sgw@linux.intel.com>
References: <cover.1316733769.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] populate_sdk_rpm: add items to the INSTALL_PROVIDESNAME_RPM list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2011 23:28:44 -0000

This fixes a problem when building meta-toolchain-gmae, by adding items that
will be provided by the host system, such as /bin/bash, /usr/bin/env and
libGL.so

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/populate_sdk_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 5fb0234..efb0b99 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -35,7 +35,7 @@ fakeroot populate_sdk_rpm () {
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_TARGET_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM=""
+	export INSTALL_PROVIDENAME_RPM="/bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit)"
 	export INSTALL_TASK_RPM="populate_sdk-target"
 
 	# Setup base system configuration
@@ -84,7 +84,7 @@ EOF
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_HOST_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM="/bin/sh"
+	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit)"
 	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"
 
 	# List must be prefered to least preferred order
-- 
1.7.6



