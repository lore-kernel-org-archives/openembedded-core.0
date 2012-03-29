Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDGB1-0001uJ-3W
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 16:18:11 +0200
Received: by wera1 with SMTP id a1so1061990wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 07:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bRv3Ls6fXRK8Icpk4Di6QCTpkG7unLRbYb9J7wvL8UI=;
	b=dG7tgHud49AJcI6OH+kG9KWXWgfNSiJU4AYDFeLwWPaV1dG2+yaAruSOQaIlgFXGo/
	w8zpD1XIqqKN151xx9v05C7bPZvrMUZansleFvrfPk9xkr//Qy/I16l3ulOak97/fiRr
	tRagEcokhIUWx+AGZEuL6HiSdwgncKB8D0o8hwB09n7pKpO3oki5A1GN74v2HGY5eA3u
	vqTA6JYOOJBKanilgdbHLQudIrNfCrsOYgruXtFQsu7rPGBJiva37VW+t1QZEr7SvuPX
	sEz8a1XTgjCRxAxCpfSwuK2PxX6yt/OlwHPuKe4CkhO86P+uuSgpRQnpmO78qvJ7TUGM
	L7pg==
Received: by 10.180.104.230 with SMTP id gh6mr5921238wib.22.1333030147726;
	Thu, 29 Mar 2012 07:09:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm29214784wib.6.2012.03.29.07.09.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 07:09:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 16:08:55 +0200
Message-Id: <77dc17088ca318bb94fe008d8a3ee970bb81092d.1333028738.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <95ae402382812a107254fa222cf9694f502927b3.1333028738.git.Martin.Jansa@gmail.com>
References: <95ae402382812a107254fa222cf9694f502927b3.1333028738.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1333028738.git.Martin.Jansa@gmail.com>
References: <cover.1333028738.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/2] kernel.bbclass: unify white spaces
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
X-List-Received-Date: Thu, 29 Mar 2012 14:18:11 -0000

* indentation was with spaces and tabs, unify to use tabs instead of
  spaces, for shell code and populate_packages_preppend,
  because "python populate_packages" expects tabs (or 8 spaces)
* and use 4 spaces for anonymous python

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0ae9bed..cf060c6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -13,9 +13,9 @@ INITRAMFS_TASK ?= ""
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
     if kerneltype == 'uImage':
-    	depends = d.getVar("DEPENDS", True)
-    	depends = "%s u-boot-mkimage-native" % depends
-    	d.setVar("DEPENDS", depends)
+        depends = d.getVar("DEPENDS", True)
+        depends = "%s u-boot-mkimage-native" % depends
+        d.setVar("DEPENDS", depends)
 
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
@@ -91,7 +91,7 @@ kernel_do_compile() {
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake ${PARALLEL_MAKE} modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+		oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	else
 		bbnote "no modules to compile"
 	fi
@@ -115,7 +115,7 @@ kernel_do_install() {
 
 	#
 	# Install various kernel output (zImage, map file, config, module support files)
-	#	
+	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
@@ -188,7 +188,7 @@ kernel_do_install() {
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
 	           arch/powerpc/boot/mktree"
 	for entry in $bin_files; do
-	        rm -f $kerneldir/$entry
+		rm -f $kerneldir/$entry
 	done
 }
 
@@ -386,10 +386,10 @@ python populate_packages_prepend () {
 		return deps
 	
 	def get_dependencies(file, pattern, format):
-                # file no longer includes PKGD
+		# file no longer includes PKGD
 		file = file.replace(d.getVar('PKGD', True) or '', '', 1)
-                # instead is prefixed with /lib/modules/${KERNEL_VERSION}
-                file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
+		# instead is prefixed with /lib/modules/${KERNEL_VERSION}
+		file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
 
 		if module_deps.has_key(file):
 			import re
@@ -493,11 +493,11 @@ python populate_packages_prepend () {
 do_sizecheck() {
 	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
 		size=`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
-        	if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
+		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
 			rm ${KERNEL_OUTPUT}
-                	die  "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
-        	fi
-    	fi
+			die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
+		fi
+	fi
 }
 
 addtask sizecheck before do_install after do_compile
-- 
1.7.8.5



