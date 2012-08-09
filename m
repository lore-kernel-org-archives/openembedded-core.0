Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SzHge-0007hW-Dj
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 03:37:20 +0200
Received: by pbcwy7 with SMTP id wy7so14323pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 18:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xbkzbvObbf5J5l7fgYd9Crjm7TGStUqT+NcdoSfCuQk=;
	b=dJn432RxLJbGsscGP1lY3cBZgnipAcUFOiterHUJJg9VBi/R3VQMfXyZ+HfS/5J27z
	u26rl7VhqIfnyDU3JCp4RtiL8HDI2ZADhYZk1ZqBSbi1Hva1grXNxozQ4qI4t02wVFIA
	Ezrn9iUQHN+S80w2cyXu8GIohRmwh0ALqLuC/xNfxj8/6PpFabgar0p4KDkzzhhtYxLh
	UBURvFzK1lGG7PB3n7zzCb21oYEdKlvPP7IVeh31KOSnu0kNH9UVIWUFJMeWgk/P/EXB
	eq7SBmlW2EOfa7ZH+MAHTWyfanFpZU8GQq/W9zpK3Z7lwTqK5SSFY/JHsbi2DlPxc22T
	pEjg==
Received: by 10.68.231.130 with SMTP id tg2mr40926290pbc.70.1344475531698;
	Wed, 08 Aug 2012 18:25:31 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rd7sm5428pbc.70.2012.08.08.18.25.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 18:25:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2012 18:25:15 -0700
Message-Id: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 01/12] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Thu, 09 Aug 2012 01:37:20 -0000

svn tar balls are 96M as compared to 1.3G git tars
its unnessary to suck in that much of data.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 4ad4819..c6ba0b2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r9"
+PR = "r10"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -11,7 +11,7 @@ PR = "r9"
 # using 4.7.1.0 for upgrade path when we move past 4.7.2 release
 # then we should drop the last 0 as well.
 
-PV = "4.7.1.0+git${SRCPV}"
+PV = "4.7.1.0+svn${SRCPV}"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
@@ -21,7 +21,7 @@ PV = "4.7.1.0+git${SRCPV}"
 
 BINV = "4.7.2"
 
-SRCREV = "d07e24f4ab59f264d68d21838795349faab5dede"
+SRCREV = "190218"
 BRANCH = "gcc-4_7-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 
@@ -36,7 +36,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
-SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
+SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
@@ -77,7 +77,7 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
 	   file://disablesdt.patch \
 	  "
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
 B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
-- 
1.7.9.5



