Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UNkRh-0002vC-C1
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 15:43:27 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r34DQ2N2020672
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Apr 2013 08:26:03 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r34DQ0Zk025941
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Apr 2013 18:56:02 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 4 Apr 2013 18:56:01 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r34DPuNN019519;
	Thu, 4 Apr 2013 18:56:00 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Apr 2013 08:25:55 -0500
Message-ID: <1365081955-19381-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365081955-19381-1-git-send-email-Chase.Maupin@ti.com>
References: <1365081955-19381-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/2][for-danny] linux-dtb: fix whitespace in bash functions
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
X-List-Received-Date: Thu, 04 Apr 2013 13:43:34 -0000
Content-Type: text/plain

* Fix the whitespace in the base functions to use TAB instead
  of spaces.  This is to address feedback from:
        Darren Hart <dvhart@linux.intel.com>
* This patch has already been accepted into the master branch
  http://cgit.openembedded.org/openembedded-core/commit/?id=ab6630df4d100ff501b33a1c7ec9d1e6a2d4f0ee

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   86 +++++++++++++++---------------
 1 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 36852b5..a51e6c0 100644
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



