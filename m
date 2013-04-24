Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47Y-0004Ww-Gl
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2013 10:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632434"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:42 +0100
Message-Id: <66c503947e53444ea1cce7ce1a09dfbb02742705.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/21] libcgroup: add SUMMARY and better DESCRIPTION
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
X-List-Received-Date: Wed, 24 Apr 2013 18:08:50 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.38.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.38.bb b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
index 32b87e6..8bd0ead 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.38.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
@@ -1,4 +1,7 @@
-DESCRIPTION = "Libcgroup"
+SUMMARY = "Linux control group abstraction library"
+DESCRIPTION = "libcgroup is a library that abstracts the control group file system \
+in Linux. Control groups allow you to limit, account and isolate resource usage \
+(CPU, memory, disk I/O, etc.) of groups of processes."
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-- 
1.7.10.4



