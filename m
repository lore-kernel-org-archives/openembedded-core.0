Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsiI9-00007O-4F
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:04:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2012 13:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102140822"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2012 13:55:24 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 13:55:21 -0800
Message-Id: <5c0971fd58af250c14b7eeaa3206e1b8c5bff840.1328133261.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1328133261.git.nitin.a.kamble@intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
Subject: [PATCH 7/8] linux-libc-headers: new recipes for latest upstream 3.2.2
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
X-List-Received-Date: Wed, 01 Feb 2012 22:04:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../linux-libc-headers/linux-libc-headers_3.2.2.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.2.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.2.bb
new file mode 100644
index 0000000..b009a45
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.2.bb
@@ -0,0 +1,7 @@
+require linux-libc-headers.inc
+
+PR = "r0"
+
+SRC_URI += " file://connector-msg-size-fix.patch"
+SRC_URI[md5sum] = "c0303125c8eda431b10084eece7564e3"
+SRC_URI[sha256sum] = "9f20bd2332db32e2d5b0fc346762d486faab19e0dd059c82964116421bb7cceb"
-- 
1.7.6.4



