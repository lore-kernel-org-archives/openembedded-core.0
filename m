Return-Path: <lizj@suika.fct.css.fujitsu.com>
Received: from fgwmail6.fujitsu.co.jp (fgwmail6.fujitsu.co.jp [192.51.44.36])
	by mail.openembedded.org (Postfix) with ESMTP id 4C06960F9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:02:37 +0000 (UTC)
Received: from m3.gw.fujitsu.co.jp (unknown [10.0.50.73])
	by fgwmail6.fujitsu.co.jp (Postfix) with ESMTP id 0F5DD3EE0AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:39 +0900 (JST)
Received: from smail (m3 [127.0.0.1])
	by outgoing.m3.gw.fujitsu.co.jp (Postfix) with ESMTP id 0174945DEB7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:39 +0900 (JST)
Received: from s3.gw.fujitsu.co.jp (s3.gw.fujitsu.co.jp [10.0.50.93])
	by m3.gw.fujitsu.co.jp (Postfix) with ESMTP id E006845DEB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:38 +0900 (JST)
Received: from s3.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s3.gw.fujitsu.co.jp (Postfix) with ESMTP id D46A31DB8038
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:38 +0900 (JST)
Received: from suika.fct.css.fujitsu.com (mikan.fct.css.fujitsu.com
	[10.24.14.129])
	by s3.gw.fujitsu.co.jp (Postfix) with ESMTP id 8F7D81DB803C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:38 +0900 (JST)
Received: by suika.fct.css.fujitsu.com (Postfix, from userid 506)
	id 5F13F180C60; Mon, 16 Sep 2013 11:02:37 +0900 (JST)
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:02:34 +0900
Message-Id: <1379296954-30892-2-git-send-email-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1379296954-30892-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1379296954-30892-1-git-send-email-lizhijian@cn.fujitsu.com>
Subject: [PATCH 2/2] kbd: Allow resizecons on x86_64
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
X-List-Received-Date: Mon, 16 Sep 2013 02:02:38 -0000

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 .../kbd-1.15.2/Allow-resizecons-on-x86_64.patch    |   28 ++++++++++++++++++++
 meta/recipes-core/kbd/kbd_1.15.2.bb                |    3 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/kbd/kbd-1.15.2/Allow-resizecons-on-x86_64.patch

diff --git a/meta/recipes-core/kbd/kbd-1.15.2/Allow-resizecons-on-x86_64.patch b/meta/recipes-core/kbd/kbd-1.15.2/Allow-resizecons-on-x86_64.patch
new file mode 100644
index 0000000..1a49846
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd-1.15.2/Allow-resizecons-on-x86_64.patch
@@ -0,0 +1,28 @@
+Upstream-status: Accepted
+This patch had accepted at kdb-1.5.4
+
+From e069cfa96b41a6714118e15496cdd6b83fc16ad2 Mon Sep 17 00:00:00 2001
+From: Alexey Gladkov <gladkov.alexey@gmail.com>
+Date: Mon, 27 Feb 2012 14:30:50 +0400
+Subject: [PATCH] Allow resizecons on x86_64
+
+Signed-off-by: Alexey Gladkov <gladkov.alexey@gmail.com>
+---
+ configure.ac |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a8115ed..b58f3bd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -62,6 +62,7 @@ AM_CONDITIONAL(KEYCODES_PROGS, test "$KEYCODES_PROGS" = "yes")
+ 
+ case $host_cpu in
+ 	i?86*) RESIZECONS_PROGS=yes ;;
++	x86_64*) RESIZECONS_PROGS=yes ;;
+ 	*)     RESIZECONS_PROGS=no ;;
+ esac
+ AM_CONDITIONAL(RESIZECONS_PROGS, test "$RESIZECONS_PROGS" = "yes")
+-- 
+1.7.1
+
diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index c5cb66a..a150ff1 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -12,7 +12,8 @@ RCONFLICTS_${PN} = "console-tools"
 
 PR = "r4"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2 \
+           file://Allow-resizecons-on-x86_64.patch"
 
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
 SRC_URI[sha256sum] = "b3602d191eef7a6a8317fc3cd231efa40a89ac235dce57a77cac825a2a21eba6"
-- 
1.7.1


