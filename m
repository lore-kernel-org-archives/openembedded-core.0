Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UFQqJ-0006hB-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 16:10:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Mar 2013 07:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,831,1355126400"; d="scan'208";a="300107275"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 12 Mar 2013 07:53:37 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 16:54:11 +0200
Message-Id: <1363100051-27944-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] psplash : update to latest SRCREV afd4e228c606a9998feae44a3fed4474803240b7
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
X-List-Received-Date: Tue, 12 Mar 2013 15:10:29 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 meta/recipes-core/psplash/psplash_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 9bdcb37..482670d 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -5,9 +5,9 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
 
-SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
+SRCREV = "afd4e228c606a9998feae44a3fed4474803240b7"
 PV = "0.1+git${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://psplash-init \
-- 
1.7.9.5



