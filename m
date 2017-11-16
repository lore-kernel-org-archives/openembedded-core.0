Return-Path: <martyn.welch@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id A61B478790
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:06:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: martyn) with ESMTPSA id E3CE926F185
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 15:05:58 +0000
Message-Id: <1510844758-20290-3-git-send-email-martyn.welch@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1510844758-20290-1-git-send-email-martyn.welch@collabora.co.uk>
References: <1510844758-20290-1-git-send-email-martyn.welch@collabora.co.uk>
Subject: [PATCH v4 3/3] ref-manual: Add documentation for prohibited-path QA test
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
X-List-Received-Date: Thu, 16 Nov 2017 15:06:28 -0000

Add documentation for the IMAGE_QA_PROHIBITED_PATHS variable and
associated prohibited-path QA test

Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---
Changes since v1:
 - Correcting author and SOB.

Changes since v2:
 - Reimplemented as image rather than package level QA test, altering
   documentation to suit.
 - Changed variable from PROHIBITED_PATH to PROHIBITED_PATHS to better
   reflect its use.

Changes since v3:
 - Variable changed from PROHIBITED_PATHS to IMAGE_QA_PROHIBITED_PATHS.

 documentation/ref-manual/ref-variables.xml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index e31aa21..57f969f 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -6162,6 +6162,30 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-IMAGE_QA_PROHIBITED_PATHS'><glossterm>IMAGE_QA_PROHIBITED_PATHS</glossterm>
+            <info>
+                IMAGE_QA_PROHIBITED_PATHS[doc] = "A colon separated list of paths in which recipes are prohibited from installing."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
+                    A colon separated list of paths in which recipes are
+                    prohibited from installing.
+                    Shell-style wildcards can be used in paths. All paths need
+                    to be absolute paths.
+                </para>
+
+                <para>
+                    For example, the following
+                    <filename>IMAGE_QA_PROHIBITED_PATHS</filename> ensures
+                    nothing is installed under <filename>/mnt</filename>:
+                    <literallayout class='monospaced'>
+     IMAGE_QA_PROHIBITED_PATHS += "/mnt/*"
+                    </literallayout>
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-IMAGE_ROOTFS'><glossterm>IMAGE_ROOTFS</glossterm>
             <info>
                 IMAGE_ROOTFS[doc] = "The location of the root filesystem while it is under construction (i.e. during do_rootfs)."
-- 
2.1.4


