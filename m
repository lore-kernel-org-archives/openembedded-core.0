Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qm5B7-0007de-GQ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:33:41 +0200
Received: by rex (Postfix, from userid 1000)
	id 62AAC21DE9; Wed, 27 Jul 2011 15:29:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:29:15 +0100
Message-Id: <706a2e04c5d4373a4f5a0dfbaf94bc63f95bc850.1311776363.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
References: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] base.bbclass: Fix PACKAGE_ARCH typo
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
X-List-Received-Date: Wed, 27 Jul 2011 14:33:41 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3ed1bb8..a0a189f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -407,7 +407,7 @@ python () {
         # if multiple differences are present?
         # Look through PACKAGE_ARCHS for the priority order?
         if pkgarch and pkgarch == mach_arch:
-            bb.data.setVar('PACAKGE_ARCH', "${MACHINE_ARCH}", d)
+            bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)
             bb.warn("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?! The recipe may as well mark itself as machine specific directly." % d.getVar("PN", True))
 }
 
-- 
1.7.4.1



