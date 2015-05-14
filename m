Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 955BE7408F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 12:31:36 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lnXL14bBDz3hhlM;
	Thu, 14 May 2015 14:31:37 +0200 (CEST)
X-Auth-Info: tT3xkHRHrytWaHYNDlSup+b455ZZRc+ip+6yyyZJtMI=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lnXL11VmjzvdWR;
	Thu, 14 May 2015 14:31:37 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 14:31:14 +0200
Message-Id: <1431606674-5173-10-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431606674-5173-1-git-send-email-marex@denx.de>
References: <1431606674-5173-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 9/9] doc: Document new KERNEL_CLASSES variable
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
X-List-Received-Date: Thu, 14 May 2015 12:31:37 -0000

Document the KERNEL_CLASSES variable, which is used to register
support for various kernel image types.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 documentation/ref-manual/ref-variables.xml | 18 ++++++++++++++++++
 meta/conf/documentation.conf               |  1 +
 2 files changed, 19 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index ee5cbc2..2349207 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -6025,6 +6025,24 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-KERNEL_CLASSES'><glossterm>KERNEL_CLASSES</glossterm>
+            <info>
+                KERNEL_CLASSES[doc] = "A list of classes defining kernel image types that kernel class should inherit."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
+		    A list of classes defining kernel image types that
+		    kernel class should inherit. You typically append this
+		    variable to enable extended image types. An example is
+		    the "kernel-fitimage", which enables fitImage support
+		    and resides in meta/classes/kernel-fitimage.bbclass .
+		    Custom kernel image types can be registered with the
+		    kernel class using this variable.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-KERNEL_EXTRA_ARGS'><glossterm>KERNEL_EXTRA_ARGS</glossterm>
             <info>
                 KERNEL_EXTRA_ARGS[doc] = "Specifies additional make command-line arguments the OpenEmbedded build system passes on when compiling the kernel."
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3a918e8..d55276b 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -241,6 +241,7 @@ IPK_FEED_URIS[doc] = "List of ipkg feed records to put into generated image."
 KARCH[doc] = "Defines the kernel architecture used when assembling the configuration. You define the KARCH variable in the BSP Descriptions."
 KBRANCH[doc] = "A regular expression used by the build process to explicitly identify the kernel branch that is validated, patched and configured during a build."
 KBRANCH_DEFAULT[doc] = "Defines the Linux kernel source repository's default branch used to build the Linux kernel. Unless you specify otherwise, the variable initializes to 'master'."
+KERNEL_CLASSES[doc] = "A list of classes defining kernel image types that kernel class should inherit."
 KERNEL_EXTRA_ARGS[doc] = "Specifies additional make command-line arguments the OpenEmbedded build system passes on when compiling the kernel."
 KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kernel Git repository. The metadata you add through this variable includes config fragments and features descriptions."
 KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
-- 
2.1.4


