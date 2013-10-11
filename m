Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D50E96CF02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506425"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:14 -0700
Message-Id: <ad33d58b3d1938464c8e710ee73db38be32d5145.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 08/18] rsync: upgrade to 3.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2013 15:27:30 -0000

(From OE-Core rev: abf242bf2336b4d2161d0d5ab27cf63b93dde84b)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rsync/{rsync_3.0.9.bb => rsync_3.1.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.0.9.bb => rsync_3.1.0.bb} (82%)

diff --git a/meta/recipes-devtools/rsync/rsync_3.0.9.bb b/meta/recipes-devtools/rsync/rsync_3.1.0.bb
similarity index 82%
rename from meta/recipes-devtools/rsync/rsync_3.0.9.bb
rename to meta/recipes-devtools/rsync/rsync_3.1.0.bb
index e296555..72c072d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.0.9.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.0.bb
@@ -1,11 +1,10 @@
 require rsync.inc
 
-PR = "r0"
 
 SRC_URI += "file://acinclude.m4"
 
-SRC_URI[md5sum] = "5ee72266fe2c1822333c407e1761b92b"
-SRC_URI[sha256sum] = "30f10f8dd5490d28240d4271bb652b1da7a60b22ed2b9ae28090668de9247c05"
+SRC_URI[md5sum] = "3be148772a33224771a8d4d2a028b132"
+SRC_URI[sha256sum] = "81ca23f77fc9b957eb9845a6024f41af0ff0c619b7f38576887c63fa38e2394e"
 
 EXTRA_OECONF += "--disable-xattr-support --disable-acl-support"
 
-- 
1.8.3.1


