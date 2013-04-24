Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47t-0004Xt-Qg
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:09:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2013 10:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632578"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:55 +0100
Message-Id: <8f777bebbe0b45b34ce5066a1822aaf629c33262.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 18/21] hwlatdetect: add SUMMARY and DESCRIPTION
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
X-List-Received-Date: Wed, 24 Apr 2013 18:09:14 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
index c3806c1..634b609 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
@@ -1,4 +1,5 @@
-pickDESCRIPTION = "Python hardware latency detector"
+SUMMARY = "Hardware latency detector"
+DESCRIPTION = "Python utility for controlling the kernel hardware latency detection module (hwlat_detector.ko)."
 HOMEPAGE = "http://git.kernel.org/?p=linux/kernel/git/clrkwllms/rt-tests.git"
 SECTION = "tests"
 LICENSE = "GPLv2"
-- 
1.7.10.4



