Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sczxu-0007u8-OQ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:15:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jun 2012 07:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="162865734"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2012 07:03:27 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	bruce.ashfield@windriver.com
Date: Fri,  8 Jun 2012 09:03:00 -0500
Message-Id: <de4d8424907e977a377790243abb15f509fab4e5.1339163939.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1339163939.git.tom.zanussi@intel.com>
References: <cover.1339163939.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] linux-yocto/3.2: fix meta SRCREV typo
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
X-List-Received-Date: Fri, 08 Jun 2012 14:15:02 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Remove a stray character at the end of the meta SRCREV.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 85c0096..e6cf9bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?= "1396a8f7b62f8926dc1fa474c7d94ae920d81852"
 SRCREV_machine_qemux86 ?= "9d32bb075e349cc69c7af42b60f6715c5d8c972e"
 SRCREV_machine_qemux86-64 ?= "dd488f551fa0f8e3bf1aadd78083b8547bba8bdf"
 SRCREV_machine ?= "76133a1cadf0de417c29ed15d6fbb12c41c0802b"
-SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654l"
+SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



