Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id C1B277760A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 07:39:21 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 4cb7_821a_4339996a_3dd7_49c7_a2d9_cc4b42011a90;
	Mon, 05 Jun 2017 16:39:19 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id E4DA0AC00F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 16:39:17 +0900 (JST)
Received: from g01jpexchkw33.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	D9E44BD6649 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 16:39:16 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw33.g01.fujitsu.local (10.0.193.36) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 5 Jun 2017 16:39:17 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jun 2017 16:40:05 +0900
Message-ID: <1496648405-5829-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] lsbinitscripts: Upgrade to 9.72
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
X-List-Received-Date: Mon, 05 Jun 2017 07:39:22 -0000
Content-Type: text/plain

1. Upgrade lsbinitscripts from 9.68 to 9.72

2. Rebase the following patch file.
   functions.patch

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../lsb/lsbinitscripts/functions.patch             | 43 ++++++++++++----------
 ...binitscripts_9.68.bb => lsbinitscripts_9.72.bb} |  8 ++--
 2 files changed, 28 insertions(+), 23 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.68.bb => lsbinitscripts_9.72.bb} (70%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
index a756d04..feef610 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
+++ b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
@@ -1,26 +1,31 @@
-Upstream-Status: Inappropriate [configuration]
+From 57468c5f4e364bdad556604dca09046e1afca929 Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Mon, 5 Jun 2017 16:26:47 +0900
+Subject: [PATCH] Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-Index: initscripts-9.43/rc.d/init.d/functions
-===================================================================
---- initscripts-9.43.orig/rc.d/init.d/functions
-+++ initscripts-9.43/rc.d/init.d/functions
-@@ -13,6 +13,7 @@ umask 022
- PATH="/sbin:/usr/sbin:/bin:/usr/bin"
- export PATH
- 
-+
- if [ $PPID -ne 1 -a -z "$SYSTEMCTL_SKIP_REDIRECT" ] && \
- 		( /bin/mountpoint -q /cgroup/systemd || /bin/mountpoint -q /sys/fs/cgroup/systemd ) ; then
-         case "$0" in
-@@ -54,7 +55,7 @@ systemctl_redirect () {
+Rebase on 9.72
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ initscripts-9.72/rc.d/init.d/functions | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/initscripts-9.72/rc.d/init.d/functions b/initscripts-9.72/rc.d/init.d/functions
+index 0f627f1..a6aa092 100644
+--- a/initscripts-9.72/rc.d/init.d/functions
++++ b/initscripts-9.72/rc.d/init.d/functions
+@@ -59,7 +59,7 @@ systemctl_redirect () {
  [ -z "${COLUMNS:-}" ] && COLUMNS=80
  
  if [ -z "${CONSOLETYPE:-}" ]; then
--  if [ -c "/dev/stderr" -a -r "/dev/stderr" ]; then
-+  if [ -c "/dev/stderr" -a -r "/dev/stderr" -a -e /sbin/consoletype ]; then
-     CONSOLETYPE="$(/sbin/consoletype < /dev/stderr 2>/dev/null)"
-   else
-     CONSOLETYPE="serial"
+-    if [ -c "/dev/stderr" -a -r "/dev/stderr" ]; then
++    if [ -c "/dev/stderr" -a -r "/dev/stderr" -a -e /sbin/consoletype ]; then
+         CONSOLETYPE="$(/sbin/consoletype < /dev/stderr 2>/dev/null)"
+     else
+         CONSOLETYPE="serial"
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
similarity index 70%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
index 0c08fff..448663f 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
@@ -8,13 +8,13 @@ RDEPENDS_${PN} += "util-linux"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/6a51a5af38e01445f53989ed0727c3e1/initscripts-${PV}.tar.bz2 \
-           file://functions.patch \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.gz/sha512/b6ed38f9576e9227c2ecf047e2d60e1e872f40d51d13861b0c91dddb282f10f7e6b79706a4d1435d7a57a14a0b73a1b71541cfe44c00e8e03ef96b08de19ec32/initscripts-${PV}.tar.gz \
+           file://functions.patch;striplevel=2 \
            file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
           " 
 
-SRC_URI[md5sum] = "6a51a5af38e01445f53989ed0727c3e1"
-SRC_URI[sha256sum] = "2a1c6e9dbaa37a676518f4803b501e107c058bb14ef7a8db24c52b77fbcba531"
+SRC_URI[md5sum] = "d6c798f40dceb117e12126d94cb25a9a"
+SRC_URI[sha256sum] = "1793677bdd1f7ee4cb00878ce43346196374f848a4c8e4559e086040fc7487db"
 
 inherit update-alternatives
 
-- 
1.9.1


