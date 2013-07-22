Return-Path: <andre.draszik@linaro.org>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 509C660667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 12:39:25 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id c10so3620674qcz.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:x-mailer:mime-version:x-gm-message-state;
	bh=UGae/2aNOqVK0X2L9IpD1rONTuXKJMrNlMfISrTjBdc=;
	b=dlI3sZjqd1CSYOV2oJapDwUX6nivIz2G19fhc2tAt4a2AeWoO2xcgRgdJqOkQEH+1Q
	2Vbsgq5gCW1bF6vXiI2Hp6Wdu9qraNrsDZZQTTcsxHGgJlzGNw5KbmEkbQp0gjb9UTTe
	POrm2x+08pg5XY+2f2DRKQEnaqf98Y+JnlFqt916PZGDuUHqpK5kcAfOUr4CuKrDcsha
	jboKw0yo5qzsLfO6Q4KlVCqYhdXmYgbjixis3N7PC+wNjBgXcqg57mEivPIgBj2diVfg
	XbLCbeYBQKqQm+N3WJi60ZENVQXNgd5UzaS5TfBNOjIJJWT6GKwZsklBCtHF8Bb7Cwnk
	aO7Q==
X-Received: by 10.49.35.108 with SMTP id g12mr32552612qej.86.1374496765256;
	Mon, 22 Jul 2013 05:39:25 -0700 (PDT)
Received: from [10.65.4.44] (git.linaro.org. [54.235.93.228])
	by mx.google.com with ESMTPSA id l4sm40989203qay.0.2013.07.22.05.39.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 05:39:24 -0700 (PDT)
Message-ID: <1374496759.6719.88.camel@bril0118.bri.st.com>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 22 Jul 2013 13:39:19 +0100
In-Reply-To: <CAP9ODKq2JNvmkr+P9Sw6MON8u=Q96mJO-7kMHTPzN=NVC8vOzA@mail.gmail.com>
References: <CAP9ODKoHGqwBXZVbEAtMgig=x6RVud1ZWo2oXFPcD8gUyqiVCg@mail.gmail.com>
	<1374496199.6719.87.camel@bril0118.bri.st.com>
	<CAP9ODKq2JNvmkr+P9Sw6MON8u=Q96mJO-7kMHTPzN=NVC8vOzA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Gm-Message-State: ALoCoQl+8e+TW4o4MNIUvl7/bWr8ebCZVcjxxdEqnpFw7Le9oZbnbJbMhw+6cQ/PksdM9gf6ClxO
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Handle of kernels which need dtc_cpp use
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jul 2013 12:39:26 -0000
X-Groupsio-MsgNum: 42271
Content-Type: multipart/mixed; boundary="=-H0byIE4UzQ/j+YXSX9Jl"

--=-H0byIE4UzQ/j+YXSX9Jl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Attached, but untested, as I'm not in a position to test master at the
moment.

Cheers,
Andre'

On Mon, 2013-07-22 at 09:34 -0300, Otavio Salvador wrote:
> On Mon, Jul 22, 2013 at 9:29 AM, André Draszik <andre.draszik@linaro.org> wrote:
> > Hi,
> >
> > I am using the attached.
> >
> > To use DTC+CPP, instead of giving the full path
> > arch/${ARCH}/boot/dts/<filename>, you only have to specify <filename> in
> > KERNEL_DEVICETREE.
> >
> > This was done to stay compatible with existing build rules, but I don't
> > know if this would work for the case ${ARCH} != arm
> 
> I tried to apply this on master and it failed. Can you please rebase
> this? This does look like the way to go.
> 
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


--=-H0byIE4UzQ/j+YXSX9Jl
Content-Disposition: attachment;
	filename*0=0001-linux-dtb-allow-to-build-dtb-using-support-from-kern.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-linux-dtb-allow-to-build-dtb-using-support-from-kern.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 8bit

From 3e55b7c4cea9fca3b7fc8b93c40f76dc8aec7610 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Date: Fri, 19 Jul 2013 09:15:42 +0100
Subject: [PATCH] linux-dtb: allow to build dtb using support from kernel
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The kernel build system has native support for device tree
source files that /include/ additional files and it also
supports the source file to be pre-processed using CPP.

This commits lets OE use the kbuild system if
$KERNEL_DEVICETREE points to file(s) that are located in
arch/${ARCH}/boot/dts/

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 75 +++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7747718..75b8b76 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,28 +1,66 @@
+inherit kernel-arch
+
 # Support for device tree generation
 FILES_kernel-devicetree = "/boot/devicetree*"
 KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
 
 python __anonymous () {
+    from os import path
+
     devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
     if devicetree:
-        depends = d.getVar("DEPENDS", True)
-        d.setVar("DEPENDS", "%s dtc-native" % depends)
+        S = d.getVar("S", True)
+        for DTS_FILE in devicetree.split():
+            DTS_FILE = S + "/" + DTS_FILE
+            if os.path.exists(DTS_FILE):
+                # full path given, use dtc-native
+                print "old style KERNEL_DEVICETREE, adding depend on dtc-native"
+                depends = d.getVar("DEPENDS", True)
+                d.setVar("DEPENDS", "%s dtc-native" % depends)
+            else:
+                # new style - it's just a file name, under arch/${ARCH}/boot/dts
+                # we don't need dtc-native, as we use the kernel's compiler
+                print "new style KERNEL_DEVICETREE"
         packages = d.getVar("PACKAGES", True)
         d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
 }
 
-do_install_append() {
+do_compile_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTS_FILE in ${KERNEL_DEVICETREE}; do
 			if [ ! -f ${DTS_FILE} ]; then
-				echo "Warning: ${DTS_FILE} is not available!"
-				continue
+				if [ ! -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then
+					echo "Warning: ${DTS_FILE} is not available!"
+					continue
+				fi
+
+				# standard build using kbuild
+				echo "Info: standard kbuild for device tree blob"
+				DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+
+				unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+				oe_runmake ${DTS_BASE_NAME}.dtb CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 			fi
+		done
+	fi
+}
+
+do_install_append() {
+	if test -n "${KERNEL_DEVICETREE}"; then
+		for DTS_FILE in ${KERNEL_DEVICETREE}; do
 			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
-			install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+			if [ ! -f ${DTS_FILE} ]; then
+				if [ ! -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then
+					echo "Warning: ${DTS_FILE} is not available!"
+					continue
+				fi
+
+				install -m 0644 arch/${ARCH}/boot/${DTS_BASE_NAME}.dtb ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+				continue
+			fi
+			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME}.dtb ${DTS_FILE}
+			install -m 0644 ${DTS_BASE_NAME}.dtb ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
 		done
 	fi
 }
@@ -30,15 +68,28 @@ do_install_append() {
 do_deploy_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTS_FILE in ${KERNEL_DEVICETREE}; do
+			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
 			if [ ! -f ${DTS_FILE} ]; then
-				echo "Warning: ${DTS_FILE} is not available!"
-				continue
+				if [ ! -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then
+					echo "Warning: ${DTS_FILE} is not available!"
+					continue
+				fi
+
+				# standard build using kbuild
+				echo "Info: standard kbuild for device tree blob"
 			fi
-			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+
 			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+
 			install -d ${DEPLOYDIR}
-			install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
+
+			if [ -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then
+				install -m 0644 ${B}/arch/${ARCH}/boot/${DTS_BASE_NAME}.dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
+			else
+				install -m 0644 ${B}/${DTS_BASE_NAME}.dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
+			fi
+
 			cd ${DEPLOYDIR}
 			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
 			cd -
-- 
1.8.2


--=-H0byIE4UzQ/j+YXSX9Jl--
