Return-Path: <martyn.welch@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id B2ABA78480
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 15:10:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: martyn) with ESMTPSA id 51AD326F0CA
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 15:10:46 +0000
Message-Id: <1510758646-19268-2-git-send-email-martyn.welch@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1510758646-19268-1-git-send-email-martyn.welch@collabora.co.uk>
References: <1510758646-19268-1-git-send-email-martyn.welch@collabora.co.uk>
Subject: [PATCH v3 2/2] ref-manual: Add documentation for prohibited-path QA test
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
X-List-Received-Date: Wed, 15 Nov 2017 15:10:56 -0000

Add documentation for the PROHIBITED_PATHS variable and associated
prohibited-path QA test

Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---
Changes since v1:
 - Correcting author and SOB.

Changes since v2:
 - Reimplemented as image rather than package level QA test, altering
   documentation to suit.
 - Changed variable from PROHIBITED_PATH to PROHIBITED_PATHS to better
   reflect its use.

 documentation/ref-manual/ref-variables.xml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index e31aa21..1fb8a86 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -10820,6 +10820,30 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-PROHIBITED_PATHS'><glossterm>PROHIBITED_PATHS</glossterm>
+            <info>
+                PROHIBITED_PATHS[doc] = "A colon separated list of paths in which recipes are prohibited from installing."
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
+                    <filename>PROHIBITED_PATHS</filename> ensures nothing is
+                    installed under <filename>/mnt</filename>:
+                    <literallayout class='monospaced'>
+     PROHIBITED_PATHS += "/mnt/*"
+                    </literallayout>
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-PROVIDES'><glossterm>PROVIDES</glossterm>
             <info>
                 PROVIDES[doc] = "A list of aliases that a recipe also provides. These aliases are useful for satisfying dependencies of other recipes during the build as specified by DEPENDS."
-- 
2.1.4


