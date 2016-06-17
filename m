Return-Path: <d.falko@partner.samsung.com>
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
	[210.118.77.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBBE60017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:03:00 +0000 (UTC)
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
	by mailout1.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0O8W009TBUKZ0K30@mailout1.w1.samsung.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2016 11:02:59 +0100 (BST)
X-AuditID: cbfec7f4-f796c6d000001486-06-5763cad33324
Received: from eusync2.samsung.com ( [203.254.199.212])
	by eucpsbgm1.samsung.com (EUCPMTA) with SMTP id 39.57.05254.3DAC3675;
	Fri, 17 Jun 2016 11:02:59 +0100 (BST)
Received: from falko-work.rnd.samsung.ru ([106.109.129.11])
	by eusync2.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTPA id <0O8W00CHRUKYOL20@eusync2.samsung.com>; Fri,
	17 Jun 2016 11:02:59 +0100 (BST)
From: Dmitriy Falko <d.falko@partner.samsung.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 13:02:57 +0300
Message-id: <1466157777-11573-1-git-send-email-d.falko@partner.samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMJMWRmVeSWpSXmKPExsVy+t/xK7qXTyWHG3w8oGpx8PA0Zos7P9+x
	OzB5nNu4gtHj4Ls9TAFMUVw2Kak5mWWpRfp2CVwZpxvnMxXMFaz4ubeTqYHxJl8XIyeHhICJ
	xMevV9kgbDGJC/fWA9lcHEICSxkl2mecYoZwWpkkHk3oZAKpYhMwlPjTfBDI5uAQEdCRePPR
	CyTMLKAv8elmP1hYWCBW4sKiWJAwi4CqxKELd8Dm8wp4S3y98YYVYpecxM1zncwTGLkXMDKs
	YhRNLU0uKE5KzzXUK07MLS7NS9dLzs/dxAjx6pcdjIuPWR1iFOBgVOLhXSGaHC7EmlhWXJl7
	iFGCg1lJhFf+GFCINyWxsiq1KD++qDQntfgQozQHi5I479xd70OEBNITS1KzU1MLUotgskwc
	nFINjAllvRs3yYT37GDhV07lV7wn9bQq/hPHC58XzDKzDnz6lXurMTkkJfhNcLb8dOWJTNkX
	G7fyrOyRTj7H8fHOv7vNzK73bhr5O6X0RenO+BRhs3Sl9q8NT2ri2ieHXQiQ+e/7QC/1w2MD
	9vC+q68Mk19czN+98vLj6spzE1rUgx9Mk/+y2pbxhRJLcUaioRZzUXEiAP9uDrXmAQAA
Subject: [meta-oe][PATCH] Alias _obstack_free to obstack_free to build binutils with uclibc
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
X-List-Received-Date: Fri, 17 Jun 2016 10:03:01 -0000

Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
 ...Alias-_obstack_free-to-fix-binutils-build.patch | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index a56fa7c..ea1d37d 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -6,6 +6,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
 SRC_URI = "git://uclibc-ng.org/git/uclibc-ng \
         file://0001-Disable-lrount_tes-function.patch \
+        file://0001-Alias-_obstack_free-to-fix-binutils-build.patch \
         file://uClibc.machine \
         file://uClibc.distro \
         file://obstack.cfg \
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch
new file mode 100644
index 0000000..50425af
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch
@@ -0,0 +1,31 @@
+From f795fc77a2cf90ce77707faddc93a51f736a4553 Mon Sep 17 00:00:00 2001
+From: Dmitriy Falko <d.falko@partner.samsung.com>
+Date: Fri, 17 Jun 2016 11:31:02 +0300
+Subject: [PATCH] Alias _obstack_free to fix binutils build
+
+Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
+---
+ libc/misc/gnu/obstack.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
+index 38cfd83..2689263 100644
+--- a/libc/misc/gnu/obstack.c
++++ b/libc/misc/gnu/obstack.c
+@@ -385,11 +385,11 @@ obstack_free (struct obstack *h, void *obj)
+     abort ();
+ }
+ 
+-# if 0
++
+ /* Older versions of libc used a function _obstack_free intended to be
+    called by non-GCC compilers.  */
+ strong_alias (obstack_free, _obstack_free)
+-# endif
++
+ 
+ int
+ _obstack_memory_used (struct obstack *h)
+-- 
+2.7.4
+
-- 
2.7.4


