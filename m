Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Tw4ba-0000Rj-NS
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 06:35:15 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0I5JaTI006246;
	Thu, 17 Jan 2013 21:19:41 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 18 Jan 2013 00:19:32 -0500
Message-Id: <678a21a959f6d93da8964a520ed197f2d03ec83a.1358485481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358485481.git.bruce.ashfield@windriver.com>
References: <cover.1358485481.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1358485481.git.bruce.ashfield@windriver.com>
References: <cover.1358485481.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] guilt: add git 1.8.x support
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
X-List-Received-Date: Fri, 18 Jan 2013 05:35:16 -0000

Updating guilt to allow git 1.8.x as a supported version. This version has
no impact on other functionality within the scripts, so no other adjustments
are necessary.

[YOCTO #3275]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...lt-update-supported-git-versions-to-1.8.x.patch |   28 ++++++++++++++++++++
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch

diff --git a/meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch b/meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
new file mode 100644
index 0000000..579d9bc
--- /dev/null
+++ b/meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
@@ -0,0 +1,28 @@
+From d7fb5d4e159071b6255181fcf436300038fe9e6c Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Wed, 16 Jan 2013 20:48:11 -0500
+Subject: [PATCH] guilt: update supported git versions to 1.8.x
+
+guilt errors on the new 1.8.x git series, when it shouldn't, since
+1.8.x works fine with the existing guilt version.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ guilt |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/guilt b/guilt
+index 346f929..6505653 100755
+--- a/guilt
++++ b/guilt
+@@ -37,6 +37,7 @@ case "$gitver" in
+ 	1.5.*)	;; # git config
+ 	1.6.*)	;; # git config
+ 	1.7.*)	;; # git config
++	1.8.*)	;; # git config
+ 	*)	die "Unsupported version of git ($gitver)" ;;
+ esac
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index 754b528..6652ab6 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
 
 PV = "0.33"
-PR = "r2"
+PR = "r3"
 
 inherit native
 
@@ -20,6 +20,7 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/g/guilt/guilt_${PV}.orig.ta
 	   file://improve_auto_header_gen.patch \
 	   file://guilt-set-git_exec_path.patch \
 	   file://guilt-bash.patch \
+	   file://guilt-update-supported-git-versions-to-1.8.x.patch \
 	   file://optional_head_check.patch"
 
 SRC_URI[md5sum] = "d800c5e0743d90543ef51d797a626e09"
-- 
1.7.10.4



