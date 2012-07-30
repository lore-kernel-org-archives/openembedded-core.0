Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SvzIM-0003D0-Mb
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 01:22:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2012 16:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173355728"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 16:11:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 00:10:56 +0100
Message-Id: <d0884e86101c81977e67f506b67f92c056687444.1343689827.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343689827.git.paul.eggleton@linux.intel.com>
References: <cover.1343689827.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343689827.git.paul.eggleton@linux.intel.com>
References: <cover.1343689827.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/populate_sdk_rpm: add depends on rpmresolve-native
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
X-List-Received-Date: Mon, 30 Jul 2012 23:22:39 -0000

As of OE-Core revision 72d1048a8381fa4a8c4c0d082047536727b4be47,
rpmresolve is now required for complementary package installation during
do_populate_sdk.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_rpm.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index fac653b..b4b27ba 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -1,4 +1,5 @@
 do_populate_sdk[depends] += "rpm-native:do_populate_sysroot"
+do_populate_sdk[depends] += "rpmresolve-native:do_populate_sysroot"
 do_populate_sdk[recrdeptask] += "do_package_write_rpm"
 
 rpmlibdir = "/var/lib/rpm"
-- 
1.7.9.5



