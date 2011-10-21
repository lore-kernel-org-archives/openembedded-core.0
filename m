Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH7LZ-00040B-30
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 07:08:45 +0200
Received: by pzk33 with SMTP id 33so8911059pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 22:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mDgKENkQl8pZysLu2TDDug5jmEhP4SkfEvDj64SY37I=;
	b=cR83qzJT1muiF0dbuwtEiCT0FrrVj3qif4kG7RzHo7aFbRUz8uUj+22HR40ernLId6
	zV2mJWJ1WbBThrAUzSEi0A9PsLx3ggkqxGksmNb/d1gu9TGx4jhKmutazy5IrP2oYCxn
	i+6pFBWDvh6pdIuid1WcjIlrhdr3kQFoSSQaA=
Received: by 10.68.20.165 with SMTP id o5mr17970729pbe.49.1319173371496;
	Thu, 20 Oct 2011 22:02:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id w4sm26362890pbf.6.2011.10.20.22.02.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 22:02:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 22:02:40 -0700
Message-Id: <1319173361-11527-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] binutils-cross-canadian: Point sysroot to correct location
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
X-List-Received-Date: Fri, 21 Oct 2011 05:08:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-cross-canadian.inc           |    2 +-
 .../binutils/binutils-cross-canadian_2.21.1a.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 95e535a..b1cee67 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -5,7 +5,7 @@ PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "binutils"
 
 DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/libc-nativesdk zlib-nativesdk gettext-nativesdk"
-EXTRA_OECONF = "--with-sysroot=${SDKPATH}/sysroots/${TARGET_SYS} \
+EXTRA_OECONF = "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                 --program-prefix=${TARGET_PREFIX} \
                 --disable-werror"
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb
index e91e7dc..a49aded 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-canadian.inc
-PR = "r1"
+PR = "r2"
-- 
1.7.5.4



