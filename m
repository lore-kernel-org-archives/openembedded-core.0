Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVg-0001is-8S
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2011 22:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="433405001"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 22:26:25 -0700
Message-Id: <69dbb63bbf2ada9896795032aaac5fa71cd6cfcc.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 12:11:11 +0000
Date: Mon, 09 May 2011 22:26:24 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 23/30] libxkbfile: disable xcb
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
X-List-Received-Date: Tue, 10 May 2011 05:29:34 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Currently libx11 defaults to build without xcb backend and thus this
needs to explicit depends on it or disable it. We opted to disable it
since it is not critical for it to work.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb
index ff2f90f..44e2fa0 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb
@@ -10,9 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aa32e1b87f1da02948ab7b55e129bf5f"
 
 DEPENDS += "virtual/libx11 kbproto"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
+EXTRA_OECONF += "--without-xcb"
+
 BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "59b4fe0bdf8d9b05e45b59e8fe9e7516"
-- 
1.7.1.1



