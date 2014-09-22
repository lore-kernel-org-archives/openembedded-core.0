Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 963976FD28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 11:36:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 460CA3161232;
	Mon, 22 Sep 2014 13:36:19 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 13:35:17 +0200
Message-Id: <1411385721-22264-6-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 5/9] ref-manual: document IMAGE_BOOT_FILES
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
X-List-Received-Date: Mon, 22 Sep 2014 11:36:19 -0000

Document IMAGE_BOOT_FILES variable.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 documentation/ref-manual/ref-variables.xml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 7ea753d..5282790 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -3235,6 +3235,24 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-IMAGE_BOOT_FILES'><glossterm>IMAGE_BOOT_FILES</glossterm>
+            <glossdef>
+                <para>
+                    Comma separated list of files that will be installed into
+                    boot partition when preparing an image. Source files By default the file
+                    is installed unser tha same name as source file. To change
+                    the destination name, separate it with &quot;;&quot;. Source files
+                    need to be located in
+                    <link linkend='var-DEPLOY_DIR_IMAGE'><filename>DEPLOY_DIR_IMAGE</filename></link>.
+                    Examples:
+
+                    <literallayout class="monospaced">
+     IMAGE_BOOT_FILES = "u-boot.img uImage:kernel"
+     IMAGE_BOOT_FILES = "u-boot.${UBOOT_SUFFIX} ${KERNEL_IMAGETYPE}""
+                    </literallayout></para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-IMAGE_CLASSES'><glossterm>IMAGE_CLASSES</glossterm>
             <glossdef>
                 <para>
-- 
1.9.0


