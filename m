Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1T9LSt-0007Yb-2v
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 21:40:43 +0200
Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 05 Sep 2012 12:27:12 -0700
Received: by qatn12 with SMTP id n12so1348989qat.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 12:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=+xzE/6U/UJ0qZ8AQjY5dqI1TEh2YLslucJNl2W3EYzM=;
	b=oYxdUyOeQRe8h172USnCHNEf1NkgBDjPIDjCZzPMYUyMajikhSINCUOinh/tU+MbkH
	D0hto7jY9rIHZ5bJLNYoyLVC1KguiuH/8qGxPrpb4lVkfo/Iswar8HxmphYSmrk8TUR5
	RA5Wpup8dSmtqPQLPWEtiZWy7sXFEZUEHm02Vh5a72WeEF4wGbu8W/Sp6UkeRo4EaoZi
	eUR8Up140sWgLfXUuMicdylk6rlkmMhoLn9Q0qYfokFmyRN89Kh2UEVF9mMFLvko7ery
	2RboGEWUzN1hYCitnkJpoCTuHPrkEOXmoRWAJxgl7HKqENr7hfajWcZRCTcFAMl+r9mz
	VmmA==
MIME-Version: 1.0
Received: by 10.229.135.213 with SMTP id o21mr12551013qct.59.1346873231618;
	Wed, 05 Sep 2012 12:27:11 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Wed, 5 Sep 2012 12:27:11 -0700 (PDT)
Date: Wed, 5 Sep 2012 12:27:11 -0700
Message-ID: <CAPhnLPC1-bNechnKcYaoy8RnFCfstuyJibpdHmP8_S9GYu2b7w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl7UyVF/mowovbydfVUvLbB6hNNwqlstsjfGhOYwtLb8+onAfI+yGClBaYY2R78ucKCm7y3
Subject: [PATCH 1/1] [REVISION 2] adt-installer: Add adt-installer-dev.bb
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
X-List-Received-Date: Wed, 05 Sep 2012 19:40:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

This adds an adt-installer-dev for QA and autobuilder use.
It repoints the ADTREPO url to adtrepo-dev.yp.org.

I've split out the main adt-installer recipe into an inc
and ensure that we're able to build both tarballs.

adt-installer -->> adt-installer.tar.bz2
adt-installer-dev -->> adt-installer-dev.tar.bz2

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../installer/adt-installer-dev_1.0.bb             |   26 ++++++
 meta/recipes-devtools/installer/adt-installer.inc  |   87 ++++++++++++++++++++
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 .../installer/adt-installer_1.0.bb                 |   69 +---------------
 4 files changed, 117 insertions(+), 67 deletions(-)
 create mode 100644 meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
 create mode 100644 meta/recipes-devtools/installer/adt-installer.inc

diff --git a/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
b/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
new file mode 100644
index 0000000..16cc481
--- /dev/null
+++ b/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
@@ -0,0 +1,26 @@
+# Yocto ADT Installer bb file
+#
+# Copyright 2010-2012 by Intel Corp.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy
+# of this software and associated documentation files (the
"Software"), to deal
+# in the Software without restriction, including without limitation the rights
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# copies of the Software, and to permit persons to whom the Software is
+# furnished to do so, subject to the following conditions:
+
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+# THE SOFTWARE.
+
+require adt-installer.inc
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/adt-installer:"
+ADTREPO = "http://adtrepo-dev.yoctoproject.org/${SDK_VERSION}"
diff --git a/meta/recipes-devtools/installer/adt-installer.inc
b/meta/recipes-devtools/installer/adt-installer.inc
new file mode 100644
index 0000000..6dedcf2
--- /dev/null
+++ b/meta/recipes-devtools/installer/adt-installer.inc
@@ -0,0 +1,87 @@
+# Yocto ADT Installer include file
+#
+# Copyright 2010-2012 by Intel Corp.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy
+# of this software and associated documentation files (the
"Software"), to deal
+# in the Software without restriction, including without limitation the rights
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# copies of the Software, and to permit persons to whom the Software is
+# furnished to do so, subject to the following conditions:
+
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+# THE SOFTWARE.
+
+DESCRIPTION = "Meta package for creating sdk installer tarball"
+LIC_FILES_CHKSUM =
"file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+
file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LICENSE = "MIT"
+
+ALLOW_EMPTY = "1"
+
+PACKAGES = ""
+
+PR = "r11"
+
+ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
+ADT_DIR = "${WORKDIR}/adt-installer/"
+YOCTOADT_VERSION = "${SDK_VERSION}"
+S = "${WORKDIR}/trunk"
+
+SRCREV = "596"
+PV = "0.1.8+svnr${SRCPV}"
+SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
+           file://wget_cache.patch \
+           file://adt_installer \
+           file://scripts/adt_installer_internal \
+           file://scripts/util \
+           file://scripts/data_define \
+           file://scripts/extract_rootfs \
+           file://adt_installer.conf \
+           file://opkg/conf/opkg-sdk-x86_64.conf \
+           file://opkg/conf/opkg-sdk-i686.conf \
+	  "
+
+do_populate_adt[umask] = "022"
+
+fakeroot do_populate_adt () {
+	cd ${WORKDIR}
+	mkdir -p ${ADT_DEPLOY}
+	rm -f ${ADT_DEPLOY}/${PN}.tar.bz2
+	rm -rf ${ADT_DIR}
+	mkdir -p ${ADT_DIR}/opkg/build
+	cp -r opkg ${ADT_DIR}/
+	sed -i -e 's#ADTREPO_URL#${ADTREPO}#' ${ADT_DIR}/opkg/conf/*.conf
+	cp -r trunk ${ADT_DIR}/opkg/build/
+	mv ${ADT_DIR}/opkg/build/trunk ${ADT_DIR}/opkg/build/opkg-svn
+	cp -r scripts ${ADT_DIR}/
+	cp adt_installer ${ADT_DIR}
+	cp adt_installer.conf ${ADT_DIR}
+	sed -i -e 's#ADTREPO#${ADTREPO}#' ${ADT_DIR}/adt_installer.conf
+	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
+	echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
+	echo 'DEFAULT_INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
+	cp ${COREBASE}/scripts/relocate_sdk.py ${ADT_DIR}/scripts/
+	tar cfj ${PN}.tar.bz2 adt-installer
+	cp ${WORKDIR}/${PN}.tar.bz2 ${ADT_DEPLOY}
+}
+
+do_populate_adt[nostamp] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_package[noexec] = "1"
+do_package_write[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+do_poplulate_sysroot[noexec] = "1"
+
+addtask populate_adt before do_build after do_install
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index afc69a4..171d2ac 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -23,7 +23,7 @@

 # Your yocto distro repository, this should include IPKG based
packages and root filesystem files where the installation is based on

-YOCTOADT_REPO="http://adtrepo.yoctoproject.org/YOCTOADT_VERSION"
+YOCTOADT_REPO="ADTREPO"

 # The following are for system wide setup
 # Target architectures that you want to setup host cross dev environment for
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb
b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index becdef6..19c0fe5 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -1,6 +1,6 @@
 # Yocto ADT Installer bb file
 #
-# Copyright 2010-2011 by Intel Corp.
+# Copyright 2010-2012 by Intel Corp.
 #
 # Permission is hereby granted, free of charge, to any person obtaining a copy
 # of this software and associated documentation files (the
"Software"), to deal
@@ -20,70 +20,7 @@
 # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 # THE SOFTWARE.

+require adt-installer.inc

-DESCRIPTION = "Meta package for creating sdk installer tarball"
-LIC_FILES_CHKSUM =
"file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-
file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-LICENSE = "MIT"
-
-ALLOW_EMPTY = "1"
-
-PACKAGES = ""
-
-PR = "r10"
-
-ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
-ADT_DIR = "${WORKDIR}/adt-installer/"
-YOCTOADT_VERSION = "${SDK_VERSION}"
-S = "${WORKDIR}/trunk"
-
-SRCREV = "596"
-PV = "0.1.8+svnr${SRCPV}"
-SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
-           file://wget_cache.patch \
-           file://adt_installer \
-           file://scripts/adt_installer_internal \
-           file://scripts/util \
-           file://scripts/data_define \
-           file://scripts/extract_rootfs \
-           file://adt_installer.conf \
-           file://opkg/conf/opkg-sdk-x86_64.conf \
-           file://opkg/conf/opkg-sdk-i686.conf \
-	  "
-
+FILESEXTRAPATHS_prepend := "${THISDIR}/adt-installer:"
 ADTREPO = "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
-
-do_populate_adt[umask] = "022"
-
-fakeroot do_populate_adt () {
-	cd ${WORKDIR}
-	mkdir -p ${ADT_DEPLOY}
-	rm -f ${ADT_DEPLOY}/adt-installer.tar.bz2
-	rm -rf ${ADT_DIR}
-	mkdir -p ${ADT_DIR}/opkg/build
-	cp -r opkg ${ADT_DIR}/
-	sed -i -e 's#ADTREPO_URL#${ADTREPO}#' ${ADT_DIR}/opkg/conf/*.conf
-	cp -r trunk ${ADT_DIR}/opkg/build/
-	mv ${ADT_DIR}/opkg/build/trunk ${ADT_DIR}/opkg/build/opkg-svn
-	cp -r scripts ${ADT_DIR}/
-	cp adt_installer ${ADT_DIR}
-	cp adt_installer.conf ${ADT_DIR}
-	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
-	echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
-	echo 'DEFAULT_INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
-	cp ${COREBASE}/scripts/relocate_sdk.py ${ADT_DIR}/scripts/
-	tar cfj adt_installer.tar.bz2 adt-installer
-	cp ${WORKDIR}/adt_installer.tar.bz2 ${ADT_DEPLOY}
-}
-
-do_populate_adt[nostamp] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-do_package[noexec] = "1"
-do_package_write[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_poplulate_sysroot[noexec] = "1"
-
-addtask populate_adt before do_build after do_install
-- 
1.7.9.5


