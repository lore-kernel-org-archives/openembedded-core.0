Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAm0-0001tT-K6
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 00:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="632520424"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 00:25:04 -0700
Message-Id: <3942cafa92e7afc8f47caad6ff1c8970988b4612.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 23:13:53 -0700
Date: Fri, 22 Apr 2011  0:25:04 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 33/33] qemu-helper-nativesdk: Update LIC_FILE_CHKSUM for renamed helper
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:28 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../qemu/qemu-helper-nativesdk_1.0.bb              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
index 15f872b..a3dca3d 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
@@ -6,7 +6,7 @@ PR = "r9"
 FILESPATH = "${FILE_DIRNAME}/qemu-helper"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999 \
-                    file://${COREBASE}/scripts/runqemu;endline=18;md5=ce52af3dd295e20ad1d849611b83690b"
+                    file://${COREBASE}/scripts/runqemu;endline=18;md5=77fbe442a88b1bcdc29c3ba67733b21b"
 
 
 SRC_URI = "file://${COREBASE}/scripts/runqemu \
-- 
1.7.1



