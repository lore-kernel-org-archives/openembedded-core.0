Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)
	id 1SoFh5-0005eV-HU for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:16:11 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q69F2QWn011001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 10:02:26 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q69F2Q5l012354
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 10:02:26 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3; Mon, 9 Jul 2012
	10:02:26 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q69F2PLq011137;	Mon, 9 Jul 2012 10:02:25 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1SoFsJ-0007rx-Da; Mon, 09 Jul 2012 10:27:47 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jul 2012 10:27:44 -0500
Message-ID: <1341847664-30221-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] psplash - Update to latest psplash version. LIC_CHKSUM Tweak
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
X-List-Received-Date: Mon, 09 Jul 2012 15:16:11 -0000
Content-Type: text/plain

* Update psplash to the latest version.
* Change the license checksum to use the lines in the psplash.h that contains
  license information instead of doing a checksum on the entire file.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta/recipes-core/psplash/psplash_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 0d88a60..f9b77de 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "PSplash is a userspace graphical boot splash screen for mainly em
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://psplash.h;md5=a87c39812c1e37f3451567cc29a29c8f"
+LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
 
-SRCREV = "e05374aae945bcfc6d962ed0d7b2774b77987e1d"
+SRCREV = "84764337a584002a92940323d374b0e417c573a6"
 PV = "0.1+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://psplash-init \
-- 
1.7.0.4



