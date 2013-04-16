Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US7gK-0005Vy-2N
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 17:20:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Apr 2013 08:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,486,1363158000"; d="scan'208";a="319073494"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by orsmga002.jf.intel.com with ESMTP; 16 Apr 2013 08:01:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 16:01:24 +0100
Message-Id: <7e220aac59bc88cc8a054d264b5c5a59d065a361.1366124347.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366124347.git.paul.eggleton@linux.intel.com>
References: <cover.1366124347.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366124347.git.paul.eggleton@linux.intel.com>
References: <cover.1366124347.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] qt4-x11-free: bump PR to allow removal of meta-oe bbappend
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
X-List-Received-Date: Tue, 16 Apr 2013 15:20:34 -0000

The meta-oe bbappend only increments PR, if we bump PR here we can
remove that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
index e5db30d..d6edef9 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt4-${PV}.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " -no-neon" ,d)}"
 
-- 
1.7.10.4



