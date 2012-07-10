Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@beast.se-eng.com>) id 1Sobgf-0005cb-GN
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 16:45:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 622A8138125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 08:34:01 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6O8q+a3k0+23; Tue, 10 Jul 2012 08:34:00 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTP id E991F138205;
	Tue, 10 Jul 2012 08:33:59 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id 299DD2149B; Tue, 10 Jul 2012 08:35:25 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 08:35:23 -0600
Message-Id: <1341930923-26277-1-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1341867108-7823-1-git-send-email-ray.danks@se-eng.com>
References: <1341867108-7823-1-git-send-email-ray.danks@se-eng.com>
Subject: [PATCH v2] mkelfimage: Upgrade to e1e6a91
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
X-List-Received-Date: Tue, 10 Jul 2012 14:46:06 -0000

Address QA issue: Files/directories were installed but not shipped.
New revision contains patch to mkelfimage removing
/usr/share/mkelfImage/elf32-i386 directory from Makefile install target.

http://review.coreboot.org/#/c/1195/

Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
v2:
  Reword commit log

 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index 1224a63..4b45c67 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
 
-SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
+SRCREV = "e1e6a91ce0738400fa1615179de88ebc0df29f66"
 PV = "1.0.0+gitr${SRCPV}"
 PR = "r1"
 
-- 
1.7.0.4



