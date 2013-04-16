Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US7fg-0005Vy-Rc
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 17:20:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Apr 2013 08:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,486,1363158000"; d="scan'208";a="319073484"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by orsmga002.jf.intel.com with ESMTP; 16 Apr 2013 08:01:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 16:01:22 +0100
Message-Id: <1d9cb612d2171f0688ec49693393c1c8586246aa.1366124347.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366124347.git.paul.eggleton@linux.intel.com>
References: <cover.1366124347.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366124347.git.paul.eggleton@linux.intel.com>
References: <cover.1366124347.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] packagegroup-qte-toolchain-target: bump PR to allow removal of meta-oe bbappend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 15:20:15 -0000

The meta-oe bbappend only increments PR, if we bump PR here we can
remove that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
index 9c3b22c..5b0e44b 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 
-PR = "r5"
+PR = "r6"
 
 QTLIBPREFIX = "-embedded"
 
-- 
1.7.10.4



