Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QgKKZ-0005kI-8v
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 19:31:40 +0200
Received: by mail-yi0-f47.google.com with SMTP id 18so1691397yib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=3wZokQRNCfjv+q0J2+9JrCHzZfVn5VuxABoLolOleEU=;
	b=KazHm3zht0xahoecF+1uwpxKXhuQ5hdFI7UlS+QXidImpRIzr4DjQrqbsi+HphGzBf
	e19ff2qulJ4yHL1cFXNJz+SqDsgpzEFa+ungEqPdR4LPQQZoAJ0E6WDgAA34my0A3DKn
	NMCT/Avp2LLILD8LVDakeRn82+lH7uLj+7CoE=
Received: by 10.236.78.33 with SMTP id f21mr6234742yhe.247.1310405265101;
	Mon, 11 Jul 2011 10:27:45 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id z28sm3592901yhn.35.2011.07.11.10.27.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 10:27:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 17:27:19 +0000
Message-Id: <20c3ca693fdd81de50e817ff64ada90a4bf71ade.1310405202.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
Subject: [PATCH 5/5] cmake: update to 2.8.5 release
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
X-List-Received-Date: Mon, 11 Jul 2011 17:31:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb |   11 +++--------
 meta/recipes-devtools/cmake/cmake_2.8.5.bb        |   11 +++--------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
index c8da1cb..3fe0c2e 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
@@ -1,12 +1,7 @@
 require cmake.inc
 inherit native
 
-# This was need to keep version consistent - will be removed once 2.8.5 is released
-SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-2.8.5-rc3.tar.gz \
-           file://support-oe-qt4-tools-names.patch"
-S = "${WORKDIR}/cmake-2.8.5-rc3"
+PR = "${INC_PR}.1"
 
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "2d8018f8fa4c499e2c5b288d71660cba"
-SRC_URI[sha256sum] = "2987befc451f6404ea93bb99f00a38b80724fb655f121fed3bb0a08b65a771c8"
+SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
+SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
index 2a9a82c..64e7574 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
@@ -4,17 +4,12 @@ inherit cmake
 
 DEPENDS += "curl expat zlib libarchive ncurses"
 
-PR = "${INC_PR}.0"
-
-# This was need to keep version consistent - will be removed once 2.8.5 is released
-SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-2.8.5-rc3.tar.gz \
-           file://support-oe-qt4-tools-names.patch"
-S = "${WORKDIR}/cmake-2.8.5-rc3"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-SRC_URI[md5sum] = "2d8018f8fa4c499e2c5b288d71660cba"
-SRC_URI[sha256sum] = "2987befc451f6404ea93bb99f00a38b80724fb655f121fed3bb0a08b65a771c8"
+SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
+SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
1.7.2.5



