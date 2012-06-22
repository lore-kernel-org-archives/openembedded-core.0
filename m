Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@beast.se-eng.com>) id 1SiAcs-0003uD-7c
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 22:38:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id A0815138AE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 14:21:04 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id T-K9bWHPk01i; Fri, 22 Jun 2012 14:21:03 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTP id E4C7B138AE9;
	Fri, 22 Jun 2012 14:21:02 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id 53CFA2C64A; Fri, 22 Jun 2012 14:22:16 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 14:22:13 -0600
Message-Id: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1340396533-5386-1-git-send-email-ray.danks@se-eng.com>
References: <1340396533-5386-1-git-send-email-ray.danks@se-eng.com>
Subject: [PATCH 2/2] mkelfimage: Add stable git build (initial recipe)
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
X-List-Received-Date: Fri, 22 Jun 2012 20:38:42 -0000

Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
This was originally submitted to the openembedded project:
http://patches.openembedded.org/patch/7687/

Resubmitting to oe-core for review prior to commit in openembedded-core.

 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
new file mode 100644
index 0000000..b341213
--- /dev/null
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -0,0 +1,18 @@
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
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
-- 
1.7.0.4



