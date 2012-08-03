Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)
	id 1SxRjU-0004lT-Gx for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 01:56:40 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q73NgxU8005831
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Aug 2012 18:42:59 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q73Ngxw6029716
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Aug 2012 18:42:59 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 3 Aug 2012 18:42:59 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q73Ngx9S019439;	Fri, 3 Aug 2012 18:42:59 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1SxRbG-00068a-GQ; Fri, 03 Aug 2012 18:48:10 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Aug 2012 18:47:02 -0500
Message-ID: <1344037622-23545-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] psplash: Update to latest psplash version
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
X-List-Received-Date: Fri, 03 Aug 2012 23:56:40 -0000
Content-Type: text/plain

* Update to the latest version of psplash which fixes a segmentation fault
  bug

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta/recipes-core/psplash/psplash_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 13c90ed..7c033e7 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -5,9 +5,9 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
 
-SRCREV = "84764337a584002a92940323d374b0e417c573a6"
+SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
 PV = "0.1+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://psplash-init \
-- 
1.7.0.4



