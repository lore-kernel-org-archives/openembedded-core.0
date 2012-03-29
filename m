Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD8vC-0008F8-Lb
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 08:33:22 +0200
Received: by eekc1 with SMTP id c1so617624eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kb3Kzywy4Ehjqq4ck5B3DANOMoO9beDVzsVcBzwseJ8=;
	b=Dl0syEhwDYQmy1Nm6wxd4RsLyncLLmyiVRQ+1VM+5xfIIgRfAZ0VSPoOQfxrk9bjOc
	SaRHKW1DG/9IP0Y9HjvjvE8t20zCs+HhXVAC+iVJxnfF3F5Trh+JK7s/qT+hjin8WXZQ
	+pFv12ep4qkiLX9rCJmYMXMVYVCvAU3Arccd08rjDHPX56hQlmN313ZY80miKp7diHLB
	c7baCvasBMqrBWAS3aJGiEKRliEakW7ijJToI+RYpY2fiYEcqwpYWS2rZ3vgXWkx+kN+
	yUEiD8odyA1yHQITj8Bpq/pse3h3GbyNOSovypUdjGgT8juTL+7pZ6TK+kyc3cX/wrWV
	qFew==
Received: by 10.180.105.194 with SMTP id go2mr2338306wib.22.1333002259944;
	Wed, 28 Mar 2012 23:24:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm23900690wiv.11.2012.03.28.23.24.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:24:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:24:07 +0200
Message-Id: <49e5bc38bdd5b01d3fb35b4d26a2d189ad2c2c44.1333001415.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
References: <4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1333001415.git.Martin.Jansa@gmail.com>
References: <cover.1333001415.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] kernel.bbclass: unify white spaces
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
X-List-Received-Date: Thu, 29 Mar 2012 06:33:22 -0000

* indentation was with spaces and tabs, unify to use tabs instead of
  spaces, because "python populate_packages" expects tabs (or 8 spaces)
  and we're doing populate_packages_preppend here

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |   38 +++++++++++++++++++-------------------
 1 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8cd5fc7..f1494b1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -11,15 +11,15 @@ INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
-    if kerneltype == 'uImage':
-    	depends = d.getVar("DEPENDS", True)
-    	depends = "%s u-boot-mkimage-native" % depends
-    	d.setVar("DEPENDS", depends)
-
-    image = d.getVar('INITRAMFS_IMAGE', True)
-    if image:
-        d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
+	kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
+	if kerneltype == 'uImage':
+		depends = d.getVar("DEPENDS", True)
+		depends = "%s u-boot-mkimage-native" % depends
+		d.setVar("DEPENDS", depends)
+
+	image = d.getVar('INITRAMFS_IMAGE', True)
+	if image:
+		d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
 }
 
 inherit kernel-arch deploy
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



