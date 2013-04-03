Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UNTYg-0004rG-N1
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 21:41:23 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33JO7Gg024634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Apr 2013 14:24:08 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33JO7KZ028332
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Apr 2013 00:54:07 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 4 Apr 2013 00:54:07 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33JO1uB001716;
	Thu, 4 Apr 2013 00:54:06 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Apr 2013 14:23:59 -0500
Message-ID: <1365017039-21728-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365017039-21728-1-git-send-email-Chase.Maupin@ti.com>
References: <1365017039-21728-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/2] linux-dtb: fix whitespace in bash functions
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
X-List-Received-Date: Wed, 03 Apr 2013 19:41:24 -0000
Content-Type: text/plain

* Fix the whitespace in the base functions to use TAB instead
  of spaces.  This is to address feedback from:
        Darren Hart <dvhart@linux.intel.com>

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   86 +++++++++++++++---------------
 1 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 421ffa3..58b93a1 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -12,56 +12,56 @@ python __anonymous () {
 }
 
 do_install_append() {
-    if test -n "${KERNEL_DEVICETREE}"; then
-        for DTS_FILE in ${KERNEL_DEVICETREE}; do
-            if [ ! -f ${DTS_FILE} ]; then
-                echo "Warning: ${DTS_FILE} is not available!"
-                continue
-            fi
-            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
-            install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
-        done
-    fi
+	if test -n "${KERNEL_DEVICETREE}"; then
+		for DTS_FILE in ${KERNEL_DEVICETREE}; do
+			if [ ! -f ${DTS_FILE} ]; then
+				echo "Warning: ${DTS_FILE} is not available!"
+				continue
+			fi
+			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
+			install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+		done
+	fi
 }
 
 do_deploy_append() {
-    if test -n "${KERNEL_DEVICETREE}"; then
-        for DTS_FILE in ${KERNEL_DEVICETREE}; do
-            if [ ! -f ${DTS_FILE} ]; then
-                echo "Warning: ${DTS_FILE} is not available!"
-                continue
-            fi
-            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-            install -d ${DEPLOYDIR}
-            install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
-            cd ${DEPLOYDIR}
-            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
-            cd -
-        done
-    fi
+	if test -n "${KERNEL_DEVICETREE}"; then
+		for DTS_FILE in ${KERNEL_DEVICETREE}; do
+			if [ ! -f ${DTS_FILE} ]; then
+				echo "Warning: ${DTS_FILE} is not available!"
+				continue
+			fi
+			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+			install -d ${DEPLOYDIR}
+			install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
+			cd ${DEPLOYDIR}
+			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
+			cd -
+		done
+	fi
 }
 
 pkg_postinst_kernel-devicetree () {
-    cd /${KERNEL_IMAGEDEST}
-    for DTS_FILE in ${KERNEL_DEVICETREE}
-    do
-        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-        DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-        update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
-    done
+	cd /${KERNEL_IMAGEDEST}
+	for DTS_FILE in ${KERNEL_DEVICETREE}
+	do
+		DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+	done
 }
 
 pkg_postrm_kernel-devicetree () {
-    cd /${KERNEL_IMAGEDEST}
-    for DTS_FILE in ${KERNEL_DEVICETREE}
-    do
-        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-        DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-        update-alternatives --remove ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
-    done
+	cd /${KERNEL_IMAGEDEST}
+	for DTS_FILE in ${KERNEL_DEVICETREE}
+	do
+		DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+		update-alternatives --remove ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+	done
 }
-- 
1.7.0.4



