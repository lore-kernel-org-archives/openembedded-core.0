Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUd-0002ZI-4H
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540466"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:19 -0700
Message-Id: <0f20c599998d93dccd24fe2a6d4da1b27d7bb82a.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/28] rsync: Update to 3.0.9
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../rsync/{rsync_3.0.8.bb => rsync_3.0.9.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.0.8.bb => rsync_3.0.9.bb} (73%)

diff --git a/meta/recipes-devtools/rsync/rsync_3.0.8.bb b/meta/recipes-devtools/rsync/rsync_3.0.9.bb
similarity index 73%
rename from meta/recipes-devtools/rsync/rsync_3.0.8.bb
rename to meta/recipes-devtools/rsync/rsync_3.0.9.bb
index 33ab271..8fb0140 100644
--- a/meta/recipes-devtools/rsync/rsync_3.0.8.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.0.9.bb
@@ -4,8 +4,8 @@ PR = "r0"
 
 SRC_URI += "file://acinclude.m4"
 
-SRC_URI[md5sum] = "0ee8346ce16bdfe4c88a236e94c752b4"
-SRC_URI[sha256sum] = "4b3fc271f4c96036b4c73fb019be078e4d8cce2defe1e7ae7cde1117859a2114"
+SRC_URI[md5sum] = "5ee72266fe2c1822333c407e1761b92b"
+SRC_URI[sha256sum] = "30f10f8dd5490d28240d4271bb652b1da7a60b22ed2b9ae28090668de9247c05"
 
 EXTRA_OECONF += "--disable-xattr-support --disable-acl-support"
 
-- 
1.7.6.2



