Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@beast.se-eng.com>) id 1Skhyc-0004xq-85
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:39:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 83D421391C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:28:41 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UwyV+yfKJpvp; Fri, 29 Jun 2012 14:28:40 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTP id E1D4F1391C2;
	Fri, 29 Jun 2012 14:28:39 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id 3548B38344; Fri, 29 Jun 2012 14:30:09 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 14:30:07 -0600
Message-Id: <1341001807-10206-1-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1340984497-32423-2-git-send-email-ray.danks@se-eng.com>
References: <1340984497-32423-2-git-send-email-ray.danks@se-eng.com>
Subject: [PATCH 2/2 v3] mkelfimage: Add stable git build (initial recipe)
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
X-List-Received-Date: Fri, 29 Jun 2012 20:39:38 -0000

Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
Acked-by: Darren Hart <dvhart@linux.intel.com>
---
This was originally submitted to the openembedded project:
http://patches.openembedded.org/patch/7687/

v2:
 Remove depreciated NATIVE_INSTALL_WORKS

v3:
 No changes from v2

 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
new file mode 100644
index 0000000..1224a63
--- /dev/null
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
+HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
+
+SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
+PV = "1.0.0+gitr${SRCPV}"
+PR = "r1"
+
+SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http;branch=master"
+
+S = "${WORKDIR}/git/util/mkelfImage"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.7.0.4



