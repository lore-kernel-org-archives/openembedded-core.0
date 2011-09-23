Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6vhU-0005qf-ID
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 04:41:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Sep 2011 19:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,426,1312182000"; d="scan'208";a="19844915"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.16])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Sep 2011 19:35:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 19:35:52 -0700
Message-Id: <e29f6f15240fca1ca22a88aec8e167165153e66b.1316745222.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316745222.git.sgw@linux.intel.com>
References: <cover.1316745222.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316745222.git.sgw@linux.intel.com>
References: <cover.1316745222.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] populate_sdk_rpm: add pkgconfig(pkg-config) to the list
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
X-List-Received-Date: Fri, 23 Sep 2011 02:41:16 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/populate_sdk_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index e837f9e..b550427 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -35,7 +35,7 @@ fakeroot populate_sdk_rpm () {
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_TARGET_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM="/bin/bash /usr/bin/env /usr/bin/perl pkgconfig"
+	export INSTALL_PROVIDENAME_RPM="/bin/bash /usr/bin/env /usr/bin/perl pkgconfigpkgconfig(pkg-config)"
 	export INSTALL_TASK_RPM="populate_sdk-target"
 
 	# Setup base system configuration
-- 
1.7.6



