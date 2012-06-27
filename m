Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jrsantos@jonathanrsantos.com>) id 1SjuRk-0001Wn-Jy
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:46:24 +0200
Received: by vbbfr13 with SMTP id fr13so798631vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 08:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=LfHCsXSS8C2bU8V0oH2n2MXQhxtVbX5AITDNbUSN/f8=;
	b=EZ3XOb4RT6YiTV10LR4eksJx83AFkMzCd7vANnkRybUs2zD7/CnxUIjgtdrwX9CCDt
	Rm1CV/bAyjSgrRnyafHShkro7z7Ss+qX4/an+ye6CLuGe28H0/DmxJGytLAGJbR1mSsT
	z3MGl53fN1nx2iwOYdcdTQIFRlJdOCJx2yRJYhKAVJ8vI/1FQeAD1IO/Mp6dpzT0pUEx
	yaaYIUBobp4kLT1TOrkxTL5PdEOdtJJ0SH+6cH46T4zNImKLdYmAhFx+1Ge/PoQpX8ju
	bCkSRS/np8CKcnXLkZXFfucMJiClQ9X+EE9d9kKcvAj9Z3ipWiA70/B2yRZ58VnMentl
	gvaA==
Received: by 10.220.16.8 with SMTP id m8mr14315644vca.10.1340811330810;
	Wed, 27 Jun 2012 08:35:30 -0700 (PDT)
Received: from el-gaucho.home (pool-72-74-140-89.bstnma.fios.verizon.net.
	[72.74.140.89])
	by mx.google.com with ESMTPS id by3sm59531441vdc.17.2012.06.27.08.35.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 08:35:30 -0700 (PDT)
From: Jonathan Santos <jrsantos@jonathanrsantos.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 11:35:25 -0400
Message-Id: <1340811325-6186-1-git-send-email-jrsantos@jonathanrsantos.com>
X-Mailer: git-send-email 1.7.11
X-Gm-Message-State: ALoCoQlU1nqpn8N65LEb3fQvfU0033ckXu4EEUM7CocY1MB8YvBaoD1mg/rvLFhYoxF0ByyA/XrA
Cc: Jonathan Santos <jrsantos@jonathanrsantos.com>
Subject: [PATCH] mklibs-native: Upgrade to 0.1.34
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
X-List-Received-Date: Wed, 27 Jun 2012 15:46:24 -0000

Signed-off-by: Jonathan Santos <jrsantos@jonathanrsantos.com>
---
 .../mklibs/files/include-unistd.h-for-gcc47.patch  | 43 ----------------------
 .../mklibs/mklibs-native_0.1.33.bb                 | 25 -------------
 .../mklibs/mklibs-native_0.1.34.bb                 | 22 +++++++++++
 3 files changed, 22 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch
 delete mode 100644 meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
 create mode 100644 meta/recipes-devtools/mklibs/mklibs-native_0.1.34.bb

diff --git a/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch b/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch
deleted file mode 100644
index baa12bd..0000000
--- a/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-include <unistd.h> to fix build on gcc 4.7
-
-Many of the standard C++ library include files have been edited to no
-longer include <unistd.h> to remove namespace pollution in gcc 4.7, so
-we need include <unistd.h> manually sometimes.
-
-mklibs (0.1.33+nmu1) UNRELEASED; urgency=low
- * Non-maintainer upload
- * Fix FTBFS with gcc 4.7 due to missing <unistd.h> include (Closes: #667282).
-
--- Cyril Brulebois <kibi@debian.org>  Thu, 05 Apr 2012 00:15:27 +0000
-
-mklibs (0.1.33) unstable; urgency=low
- 
-  * Adjust the libc_pic directory for multiarch as well.
-
-Upstream-Status: Backport 
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-[Added upstream information about patch]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
----
- src/mklibs-readelf/elf.cpp |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/mklibs-readelf/elf.cpp b/src/mklibs-readelf/elf.cpp
-index 444f330..654c46f 100644
---- a/src/mklibs-readelf/elf.cpp
-+++ b/src/mklibs-readelf/elf.cpp
-@@ -25,6 +25,7 @@
- #include <fcntl.h>
- #include <sys/mman.h>
- #include <sys/stat.h>
-+#include <unistd.h>
- 
- using namespace Elf;
- 
--- 
-1.7.10
-
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
deleted file mode 100644
index a8d12ec..0000000
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "mklibs produces cut-down shared libraries that contain only the routines required by a particular set of executables."
-HOMEPAGE = "https://code.launchpad.net/mklibs"
-SECTION = "devel"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
-DEPENDS = "python-native"
-
-PR = "r1"
-
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.gz \
-	file://ac_init_fix.patch\
-	file://fix_STT_GNU_IFUNC.patch\
-	file://include-unistd.h-for-gcc47.patch \
-"
-
-SRC_URI[md5sum] = "a462d9b802164993d247c1193116d78b"
-SRC_URI[sha256sum] = "706aa22ec979bc54adaf9616d278cecc2f1e8cd5faa656269c9760e8669fcc1e"
-
-S = "${WORKDIR}/${BPN}"
-
-inherit autotools gettext native
-
-do_configure_prepend() {
-	sed "s+MKLIBS_VERSION+${PV}+" ${S}/configure.ac
-}
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.34.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.34.bb
new file mode 100644
index 0000000..f2c3033
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.34.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "mklibs produces cut-down shared libraries that contain only the routines required by a particular set of executables."
+HOMEPAGE = "https://code.launchpad.net/mklibs"
+SECTION = "devel"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
+DEPENDS = "python-native"
+
+PR = "r0"
+
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.gz \
+	file://ac_init_fix.patch\
+	file://fix_STT_GNU_IFUNC.patch\
+"
+
+SRC_URI[md5sum] = "afe0ed527ba96b8a882b5de350603007"
+SRC_URI[sha256sum] = "0c13c314f5c397529f58a5a02d57d83aeb4463d6a0d80b9374c6576ec37ed39f"
+
+inherit autotools gettext native
+
+do_configure_prepend() {
+	sed "s+MKLIBS_VERSION+${PV}+" ${S}/configure.ac
+}
-- 
1.7.11



