Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5hku-0003PM-Gl
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 20:12:33 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so891448pad.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 10:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=LS28r+FOH1G4OtuSIRy3bWpyt2K+ig24HkbwVWAovzA=;
	b=0jdo43mfM1AdrpycpGAgRPA8arAFUUHWwebmdj04I2bkpgsW3fyHEMTOv7+bw4NxwS
	l2OnlSrsEZ6eHn6vZ4g6Iby2SuEAFoM3N/3cPEtomDPkmDwwzqjAjU9FmxQb+sgT6T8l
	bTH4s5C5f3OvmBpajWL+X3lEjkH0PtOgmmDkrUCvXNKxiuiZGFY703wJ61SkU6FsP17n
	Dw6hjzi+s3dY06ylpAYsz5Zec3Ll3ldeRih82YimlPtzn60djRv2Rhp2ZHwAZAUrBZLM
	TrF/bzM8sJrnnT6daeifCyL1tRFpbUWt4iPwDPgeNc7ZAkhkCcNATMtJyilwDizZIsf+
	87Qw==
X-Received: by 10.66.84.202 with SMTP id b10mr66660542paz.71.1360781790444;
	Wed, 13 Feb 2013 10:56:30 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id q4sm85572879paz.20.2013.02.13.10.56.28
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 10:56:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 10:56:15 -0800
Message-Id: <1360781775-22283-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Revert "pseudo_git.bb: Bump to pseudo 1.4.4."
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
X-List-Received-Date: Wed, 13 Feb 2013 19:12:34 -0000

This reverts commit 600dff4f2c6c37fa0a0cff2d287bade037c214b6.

We are seeing regressions eg. when building openssh it ends up
with

WARNING: useradd command did not succeed. Retrying...
ERROR: tried running useradd command 10 times without success, giving up
---
 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_1.4.4.bb |    8 --------
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.4.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
new file mode 100644
index 0000000..8f25bd0
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
@@ -0,0 +1,8 @@
+require pseudo.inc
+
+PR = "r0"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "ac943153aa78e210e2d0db7c85845db3"
+SRC_URI[sha256sum] = "0ca12a319c0ee87d1c8b2a4310c36a6d68d8d4b8c9c7dba00bace1773baf18e8"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.4.bb
deleted file mode 100644
index dea607c..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.4.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require pseudo.inc
-
-PR = "r0"
-
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "ae18a1388c032ac910adbf8c3111fdc4"
-SRC_URI[sha256sum] = "e72cb188fd8efb9eadfb5ce571a45a99245ae312eb9830cb9a9726bb25e47c17"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index efffc95..bbdba43 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "363a94bb851046f62648d7c96c749e899bd0648e"
-PV = "1.4.4+git${SRCPV}"
+SRCREV = "a01d7884e5f3acba1460cf6b500d28390e7af9f8"
+PV = "1.4.3+git${SRCPV}"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.9.5



