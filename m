Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6vAl-0005KY-VR
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 04:07:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2011 19:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="54690253"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.16])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2011 19:02:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 19:02:04 -0700
Message-Id: <94cd82c1f52c969f3216472ac4508470a83eb88b.1316743143.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316743143.git.sgw@linux.intel.com>
References: <cover.1316743143.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316743143.git.sgw@linux.intel.com>
References: <cover.1316743143.git.sgw@linux.intel.com>
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
X-List-Received-Date: Fri, 23 Sep 2011 02:07:28 -0000

This fixes a problem when building meta-toolchain-gmae, by adding items that
will be provided by the host system, such as /bin/bash, /usr/bin/env and
libGL.so

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/populate_sdk_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 5fb0234..8b0473f 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -35,7 +35,7 @@ fakeroot populate_sdk_rpm () {
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_TARGET_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM=""
+	export INSTALL_PROVIDENAME_RPM="/bin/bash /usr/bin/env /usr/bin/perl pkgconfig"
 	export INSTALL_TASK_RPM="populate_sdk-target"
 
 	# Setup base system configuration
@@ -84,7 +84,7 @@ EOF
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_HOST_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM="/bin/sh"
+	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit) libGL.so()"
 	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"
 
 	# List must be prefered to least preferred order
-- 
1.7.6



