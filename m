Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLszj-0003rB-GD
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 11:54:27 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 089EBD22BA;
	Wed, 10 Oct 2012 11:41:23 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2012 11:41:14 +0200
Message-Id: <1349862074-13950-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] packagegroup-self-hosted: recommend kernel modules instead of depending on them
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
X-List-Received-Date: Wed, 10 Oct 2012 09:54:27 -0000

Requested kernel modules may be integrated in kernel or totally disabled
as not needed on target.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../packagegroups/packagegroup-self-hosted.bb           |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index de0a46d..19f5a16 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -4,7 +4,7 @@
 
 SUMMARY = "Self-hosting"
 DESCRIPTION = "Packages required to run the build system"
-PR = "r11"
+PR = "r12"
 LICENSE = "MIT"
 
 inherit packagegroup
@@ -37,11 +37,6 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     genext2fs \
     hdparm \
     iptables \
-    kernel-module-tun \
-    kernel-module-iptable-raw \
-    kernel-module-iptable-nat \
-    kernel-module-iptable-mangle \
-    kernel-module-iptable-filter \
     lsb \
     mc \
     parted \
@@ -50,6 +45,14 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     vte \
     "
 
+RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
+    kernel-module-tun \
+    kernel-module-iptable-raw \
+    kernel-module-iptable-nat \
+    kernel-module-iptable-mangle \
+    kernel-module-iptable-filter \
+	"
+
 # eglibc-utils: for rpcgen
 RDEPENDS_packagegroup-self-hosted-sdk = "\
     autoconf \
-- 
1.7.10.4



