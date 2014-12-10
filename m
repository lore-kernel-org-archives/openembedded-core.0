Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 6622D7235C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:54:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 2C0E71C9B28;
	Wed, 10 Dec 2014 12:46:38 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>>,
	Rifenbark Scott <scott.m.rifenbark@intel.com>
Date: Wed, 10 Dec 2014 12:45:58 +0100
Message-Id: <1418211958-27738-4-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 3/3] ref-manual: update IMAGE_BOOT_FILES entry
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
X-List-Received-Date: Wed, 10 Dec 2014 11:54:39 -0000

Update entry for IMAGE_BOOT_FILES with information on glob patterns.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 documentation/ref-manual/ref-variables.xml | 37 ++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 0bae35a..bd857ef 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -3863,19 +3863,42 @@
             <glossdef>
                 <para>
                     A space-separated list of files installed into the
-                    boot partition when preparing an image.
-                    By default, the files are installed under the same name as
-                    the source files.
+                    boot partition when preparing an image using
+                    <filename>wic</filename> tool with
+                    <filename>bootimg-partition</filename> source
+                    plugin. By default, the files are installed under
+                    the same name as the source files.
+
                     To change the installed name, separate it from the
-                    original name with a semi-colon (;).
-                    Source files need to be located in
-                    <link linkend='var-DEPLOY_DIR_IMAGE'><filename>DEPLOY_DIR_IMAGE</filename></link>.
+                    original name with a semi-colon (;).  Source files
+                    need to be located in <link
+                    linkend='var-DEPLOY_DIR_IMAGE'><filename>DEPLOY_DIR_IMAGE</filename></link>.
                     Here are two examples:
 
                     <literallayout class="monospaced">
      IMAGE_BOOT_FILES = "u-boot.img uImage;kernel"
      IMAGE_BOOT_FILES = "u-boot.${UBOOT_SUFFIX} ${KERNEL_IMAGETYPE}"
-                    </literallayout></para>
+                    </literallayout>
+
+                    Alternatively source files can be picked up using
+                    a glob pattern. In this case the destination file
+                    will have the same as base name of the source file
+                    path. To install files into a directory within the
+                    target location pass its name after a semi-colon
+                    (;). Here are two examples:
+
+                    <literallayout class="monospaced">
+     IMAGE_BOOT_FILES = "bcm2835-bootfiles/*"
+     IMAGE_BOOT_FILES = "bcm2835-bootfiles/*;boot/"
+                    </literallayout>
+
+                    The first example installs all files from
+                    <filename>${DEPLOY_DIR_IMAGE}/bcm2835-bootfiles</filename>
+                    into the root of the target partition. The second
+                    example installs the same files into a
+                    <filename>boot</filename> directory within the
+                    target partition.
+                </para>
             </glossdef>
         </glossentry>
 
-- 
1.9.3


