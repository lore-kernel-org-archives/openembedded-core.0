Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/CrFj1Rsjq+gEjeOsQpT4A+Q0NuW705yY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qor85-0002sw-ND
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 08:10:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7465dPP000704
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 01:05:39 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 01:05:38 -0500
Message-Id: <1312437938-29860-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] prelink: Add lib64 dirs to prelink.conf
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
X-List-Received-Date: Thu, 04 Aug 2011 06:10:02 -0000

Handle multlib or cases that baselib is lib64.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/prelink/prelink/prelink.conf |    8 ++++----
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink/prelink.conf b/meta/recipes-devtools/prelink/prelink/prelink.conf
index c5a4f4a..ed30c28 100644
--- a/meta/recipes-devtools/prelink/prelink/prelink.conf
+++ b/meta/recipes-devtools/prelink/prelink/prelink.conf
@@ -12,7 +12,7 @@
 -l /usr/bin
 -l /usr/X11R6/bin
 -l /usr/games
--l /usr/local/lib
--l /lib
--l /usr/lib
--l /usr/X11R6/lib
+-l /usr/local/lib{,64}
+-l /lib{,64}
+-l /usr/lib{,64}
+-l /usr/X11R6/lib{,64}
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index c653d4d..bb95da7 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
 PV = "1.0+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
-- 
1.7.3.4



