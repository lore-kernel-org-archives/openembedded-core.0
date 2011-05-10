Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVM-0001Zb-Tv
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="744876615"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 22:26:25 -0700
Message-Id: <53dcd8765a9a16ee85e6e1c47fda5a7a748a3f31.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Sun, 8 May 2011 02:50:43 +0000
Date: Mon, 09 May 2011 22:26:25 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 24/30] insane.bbclass: skip license checksum if LICENSE is "CLOSED"
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
X-List-Received-Date: Tue, 10 May 2011 05:29:11 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/insane.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e9d4bfa..35809b9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -348,8 +348,12 @@ def package_qa_check_license(workdir, d):
     sane = True
 
     lic_files = bb.data.getVar('LIC_FILES_CHKSUM', d, True)
+    lic = bb.data.getVar('LICENSE', d, True)
     pn = bb.data.getVar('PN', d, True)
 
+    if lic == "CLOSED":
+        return True
+
     if not lic_files:
         # just throw a warning now. Once licensing data in entered for enough of the recipes,
         # this will be converted into error and False will be returned.
-- 
1.7.1.1



