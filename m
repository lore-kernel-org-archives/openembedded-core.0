Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B00497D3CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 22:06:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6JM5QTp028604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 15:05:51 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 19 Jul 2019 15:05:31 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2019 15:05:31 -0700
Message-ID: <20190719220531.40164-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] libtool: remove host information from libtool
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
X-List-Received-Date: Fri, 19 Jul 2019 22:06:00 -0000
Content-Type: text/plain

Import patch from Debian.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libtool/libtool/debian-no_hostname.patch        | 21 +++++++++++++++++++++
 meta/recipes-devtools/libtool/libtool_2.4.6.bb      |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/libtool/libtool/debian-no_hostname.patch

diff --git a/meta/recipes-devtools/libtool/libtool/debian-no_hostname.patch b/meta/recipes-devtools/libtool/libtool/debian-no_hostname.patch
new file mode 100755
index 0000000..5add0cc
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/debian-no_hostname.patch
@@ -0,0 +1,21 @@
+libtool: remove host specific info from header file
+
+https://sources.debian.org/data/main/libt/libtool/2.4.6-10/debian/patches/
+        no_hostname.patch
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+Index: libtool-2.4.6/m4/libtool.m4
+===================================================================
+--- libtool-2.4.6.orig/m4/libtool.m4
++++ libtool-2.4.6/m4/libtool.m4
+@@ -728,7 +728,6 @@ _LT_CONFIG_SAVE_COMMANDS([
+     cat <<_LT_EOF >> "$cfgfile"
+ #! $SHELL
+ # Generated automatically by $as_me ($PACKAGE) $VERSION
+-# Libtool was configured on host `(hostname || uname -n) 2>/dev/null | sed 1q`:
+ # NOTE: Changes made to this file will be lost: look at ltmain.sh.
+ 
+ # Provide generalized library-building support services.
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index f5fdd00..a5715fa 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-SRC_URI += "file://multilib.patch"
+SRC_URI += "file://multilib.patch file://debian-no_hostname.patch"
 
 RDEPENDS_${PN} += "bash"
 
-- 
2.7.4


