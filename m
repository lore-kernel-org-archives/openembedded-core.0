Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudih-00048W-Uz
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:03:44 +0200
Received: by gyg4 with SMTP id 4so2529011gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 21:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9HiY80yhBJqx1ee4Am0VSCrdXJwkdca5wjRQRWmxeJc=;
	b=sZFnoFYX0AtvC1hX0ZccVeksYFpjlG2OROqutMDR95rRSpLC/7btIofYzVlGcbdCOk
	gfsEKHiDRKTYEGymAOfDwFHSMzqg9pozQZ7PrOlnj4ptvRdBWedwMZ2/DuuP/Kfo6oyi
	VNPLL4iO5Bt7WTCsVmb03Lzf1+mmNXJbdWkoE=
Received: by 10.151.157.12 with SMTP id j12mr145713ybo.360.1313816341906;
	Fri, 19 Aug 2011 21:59:01 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f48sm4668774yhh.56.2011.08.19.21.59.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 21:59:01 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2011 04:58:39 +0000
Message-Id: <f9a8df6acae677af7949d6531cce04b0cc2bf44f.1313816148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
Subject: [PATCH 1/8] Use OECORE_DISTRO_VERSION instead of POKY_DISTRO_VERSION
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
X-List-Received-Date: Sat, 20 Aug 2011 05:03:44 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/toolchain-scripts.bbclass |   12 ++++++------
 scripts/oe-find-native-sysroot         |    2 +-
 scripts/runqemu-export-rootfs          |    2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index f7b52be..b7e4e04 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -29,8 +29,8 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
-	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
 # This function creates an environment-setup-script in the TMPDIR which enables
@@ -63,8 +63,8 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
-	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
 # This function creates an environment-setup-script for use by the ADT installer
@@ -97,8 +97,8 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
         echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/acloal"' >> $script
-	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
 #This function create a site config file
diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 26fc730..b99014b 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -59,7 +59,7 @@ fi
 if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/pseudo" ]; then
     echo "Error: Unable to find pseudo binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
 
-    if [ "x$POKY_DISTRO_VERSION" = "x" ]; then
+    if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
         echo "Have you run 'bitbake meta-ide-support'?"
     else
         echo "This shouldn't happen - something is wrong with your toolchain installation"
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 6b4aee8..6f4604d 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -49,7 +49,7 @@ fi
 if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd" ]; then
 	echo "Error: Unable to find rpc.mountd binary in $OECORE_NATIVE_SYSROOT/usr/sbin/"
 
-	if [ "x$POKY_DISTRO_VERSION" = "x" ]; then
+	if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
 	    echo "Have you run 'bitbake meta-ide-support'?"
 	else
 	    echo "This shouldn't happen - something is missing from your toolchain installation"
-- 
1.7.2.5



