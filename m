Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qlyu6-0001t0-TX
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:51:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949280"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:46:51 -0700
Message-Id: <420d08ece0ff0ac2cd4d402f4ef1105fb2e112e5.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 01/35] meta/conf/local.conf.sample: remove oprofileui-native related settings
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
X-List-Received-Date: Wed, 27 Jul 2011 07:51:43 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

oprofileui-nativesdk would be a better way to handle these kinds of
requirements with the modern system, and it is not something that most
users will need to configure anyway (nor was it supported.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 812b896..7a5e533 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -119,12 +119,6 @@ PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
 # Uncomment this if you want BitBake to emit the log if a build fails.
 BBINCLUDELOGS = "yes"
 
-# Set this if you wish to make pkgconfig libraries from your system available 
-# for native builds. Combined with extra ASSUME_PROVIDEDs this can allow 
-# native builds of applications like oprofileui-native (unsupported feature).
-#EXTRA_NATIVE_PKGCONFIG_PATH = ":/usr/lib/pkgconfig"
-#ASSUME_PROVIDED += "gtk+-native libglade-native"
-
 ENABLE_BINARY_LOCALE_GENERATION = "1"
 
 # The architecture to build SDK items for, by setting this you can build SDK
-- 
1.7.3.4



