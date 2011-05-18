Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFz-0003ul-4H
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:22 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:43 -0700
Message-Id: <8adde659b147637fbb75b5b5831d7ac4d288ee07.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 14/30] qt4-tools-native: Fix the patch location
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
X-List-Received-Date: Wed, 18 May 2011 22:30:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb b/meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb
index deb4231..8d292af 100644
--- a/meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb
@@ -1,9 +1,9 @@
 require qt4-tools-native.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # Find the g++.conf/linux.conf in the right directory.
-FILESPATHPKG =. "qt-${PV}:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
 EXTRA_OECONF += " -no-fast -silent -no-rpath"
 
-- 
1.7.3.4



