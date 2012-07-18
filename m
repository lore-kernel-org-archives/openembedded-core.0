Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrSEP-0001Pm-8k
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 13:15:49 +0200
Received: by weyr6 with SMTP id r6so849443wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 04:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RXRBHyBBGenocvEPPL+vbk07klM3nakqDkkwKg071G4=;
	b=jKxdx54iPglkC75DLIejUVzSBVJM/56mavra5D4uzQcs113P0dZ94eTawBtGWIkZq7
	HIEo2PL/ddtZDrcuFmOiowQkIexBqbPzZulm5yi1nhu+2AL64hagu2qgoTN3tWXOvvPz
	g2hcPXahC+RQfabfVuIxpqwEi0enxsMeIabTM2NG47nAbMWO76483ik4pgVPONGWGuuX
	VsMhW33WEusLzxKupMMPV+SBqqQquH6b17ZpSbgTIia0K6CFLzBOX35yqpQn0aBRpXlJ
	6ViHpk5qCehSb2eCt3L5aNrvQDPBuGBKg7gXSXVAIxgKNXX5muXeuqAK0m6iPPJxKzZu
	E0FA==
Received: by 10.216.193.166 with SMTP id k38mr236122wen.200.1342609463845;
	Wed, 18 Jul 2012 04:04:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm47490381wiy.4.2012.07.18.04.04.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 04:04:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 13:04:32 +0200
Message-Id: <1342609472-5729-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] binutils: package ld.gold symlink
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
X-List-Received-Date: Wed, 18 Jul 2012 11:15:49 -0000

* fixes:
  NOTE: package binutils-2.22-r11: task do_package: Started
  WARNING: QA Issue: binutils: Files/directories were installed but not shipped
    /usr/bin/ld.gold
  NOTE: package binutils-2.22-r11: task do_package: Succeeded

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.22.inc |    2 +-
 meta/recipes-devtools/binutils/binutils.inc      |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
index ca2d30e..e776985 100644
--- a/meta/recipes-devtools/binutils/binutils-2.22.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
@@ -1,4 +1,4 @@
-PR = "r11"
+PR = "r12"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 5c8e55b..cd923bd 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -36,6 +36,7 @@ FILES_${PN}-symlinks = " \
 	${bindir}/gprof \
 	${bindir}/ld \
 	${bindir}/ld.bfd \
+	${bindir}/ld.gold \
 	${bindir}/nm \
 	${bindir}/objcopy \
 	${bindir}/objdump \
-- 
1.7.8.6



