Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TJLop-0003oY-Kx
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 12:04:43 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 47A1FD22BB;
	Wed,  3 Oct 2012 11:51:47 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 11:51:32 +0200
Message-Id: <1349257892-32178-6-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 5/5] util-linux: add AArch64 support
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
X-List-Received-Date: Wed, 03 Oct 2012 10:04:44 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../util-linux/util-linux/add-aarch64-support.patch  |   18 ++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.21.2.bb    |    3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch

diff --git a/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch b/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
new file mode 100644
index 0000000..4480f13
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
@@ -0,0 +1,18 @@
+---
+ fdisk/fdiskbsdlabel.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+--- util-linux-2.21.2.orig/fdisk/fdiskbsdlabel.h
++++ util-linux-2.21.2/fdisk/fdiskbsdlabel.h
+@@ -46,10 +46,11 @@
+ 
+ #define BSD_LINUX_BOOTDIR "/usr/ucb/mdec"
+ 
+ #if defined (__i386__) || defined (__sparc__) || defined (__arm__) || \
+     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
++    defined (__aarch64__) || \
+     defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
+ #define BSD_LABELSECTOR   1
+ #define BSD_LABELOFFSET   0
+ #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
+ #define BSD_LABELSECTOR   0
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
index 39e3609..e64ebe9 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r5"
+PR = "r6"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -9,6 +9,7 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \
 	    file://configure-sbindir.patch \
+	    file://add-aarch64-support.patch \
 "
 
 SRC_URI[md5sum] = "b75b3cfecb943f74338382fde693c2c3"
-- 
1.7.10.4



