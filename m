Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UFOcV-0001im-P1
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 13:47:55 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Mar 2013 05:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,830,1355126400"; d="scan'208";a="213332442"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.45])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Mar 2013 05:31:12 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 14:31:44 +0200
Message-Id: <1363091504-5139-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] psplash : update to latest SRCREV afd4e228c606a9998feae44a3fed4474803240b7
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
X-List-Received-Date: Tue, 12 Mar 2013 12:47:56 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 meta/recipes-core/psplash/psplash_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 9bdcb37..3aca891 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
 
-SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
+SRCREV = "afd4e228c606a9998feae44a3fed4474803240b7"
 PV = "0.1+git${SRCPV}"
 PR = "r6"
 
-- 
1.7.9.5



