Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7736DC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:33:28 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.8716.1702978406581349903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="144162600"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="144162600"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:33:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DE4299674
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:33:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C7F7DBF3CA
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:33:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6004A2646DF
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:33:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 179361A006F;
	Tue, 19 Dec 2023 17:33:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gpgme: upgrade 1.23.1 -> 1.23.2
Date: Tue, 19 Dec 2023 17:33:12 +0800
Message-Id: <1702978392-7681-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--19.996400-10.000000
X-TMASE-MatchedRID: lJXJK5z5GImjz0nOeth/yUIIxwDaU5mrNroBpCbt+Gb+Aw16GgqpOxdb
	csnuEIpbkPI1/ZdqoS051liPCy4eA6u7hW2NfAHl5TBV9C2UM3GycrvYxo9Kp4Ajsy+r+wvnuxW
	P7AlD8NM67N42Y4YqcwtTJGIoQ/4BsEBAuoaUqK/y3h9RQZ4StFqpydj6fMhRB/FMznsE8cPs/R
	/hFDFDJSL637QCIVpitWdWe73PBg0jyYBEFWjAaZ1U1lojafr/FInyGi5rPwK+f7ap9DJaDeikw
	R/RlN8aHEXpGNdFlNzZ/bFe3kMc+BipbBBoU1Dt46cXaPycFZvpe/Nr2K/5BzqUJVT3gpbTuJEU
	mdYPGSWLOLamdcUN01bmKN2foe3A5OfLcAgV63o8xwCU4LSqsCEEwm0ncLbiU6cdXdRjF1kjL8W
	DWZGeou0B0MT8S0EkgDLqnrRlXrZLA5JD98yI6t0H8LFZNFG7JQhrLH5KSJ0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192701

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 * Preserve more specific existing failure code.
 * qt: Start dirmngr with gpgconf to avoid multiple instances.
 * qt: On Windows, use UTF-8 when logging the error text.
 * qt: Remove left-over partial files more persistently.
 * qt: Use a temporary file name when creating signed or encrypted
   archives.
 * qt: Build Qt 6 bindings with -fPIC if requested or Qt 6 was built with
   this flag. 

0001-autogen.sh-remove-unknown-in-version.patch0001-pkgconfig.patch
0001-pkgconfig.patch
0001-use-closefrom-on-linux-and-glibc-2.34.patch
0003-Correctly-install-python-modules.patch
0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
0006-fix-build-path-issue.patch
0008-do-not-auto-check-var-PYTHON.patch
refreshed for 1.23.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-autogen.sh-remove-unknown-in-version.patch  | 10 ++++------
 .../recipes-support/gpgme/gpgme/0001-pkgconfig.patch |  8 ++++----
 .../0001-use-closefrom-on-linux-and-glibc-2.34.patch | 10 ++++------
 .../0003-Correctly-install-python-modules.patch      | 12 +++++-------
 ...fig-skip-all-lib-or-usr-lib-directories-in-.patch | 12 +++++-------
 .../gpgme/gpgme/0006-fix-build-path-issue.patch      | 12 +++++-------
 .../gpgme/0008-do-not-auto-check-var-PYTHON.patch    |  6 +++---
 .../gpgme/{gpgme_1.23.1.bb => gpgme_1.23.2.bb}       |  2 +-
 8 files changed, 31 insertions(+), 41 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.23.1.bb => gpgme_1.23.2.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 81af86e7b2..6d67e6d6c9 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 46f346dff73122caffe62eda84596a3a3bec859e Mon Sep 17 00:00:00 2001
+From acc4750ffa79a5c2ef3c95cf31ef51352a68837b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 28 Feb 2023 13:43:51 +0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
@@ -12,15 +12,16 @@ Remove the '-unknown' suffix to fix this issue.
 Upstream-Status: Submitted [https://lists.gnupg.org/pipermail/gnupg-devel/2023-February/035293.html]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  autogen.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 9b36158..d5cccd2 100755
+index 4e1665b..a55326d 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -266,7 +266,7 @@ if [ "$myhost" = "find-version" ]; then
+@@ -269,7 +269,7 @@ if [ "$myhost" = "find-version" ]; then
      else
        ingit=no
        beta=yes
@@ -29,6 +30,3 @@ index 9b36158..d5cccd2 100755
        rev="0000000"
        rvd="0"
      fi
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 738b23cd58..831771ca2d 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From f8221238d51066b7a1a5f2917cce2791876ea8b0 Mon Sep 17 00:00:00 2001
+From 7b3a00cb0fc27c896dd85c9afc474bd9c2aea30d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 10 May 2019 14:23:55 +0800
 Subject: [PATCH] pkgconfig
@@ -26,10 +26,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index d1b9aca..9c4f97c 100644
+index ae4c7da..df892c9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1043,6 +1043,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -1112,6 +1112,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -38,7 +38,7 @@ index d1b9aca..9c4f97c 100644
  AC_CONFIG_FILES(lang/cpp/tests/Makefile)
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 67805a8..d38ba02 100644
+index ca70950..bda5498 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index f3de55f7b3..3d05808d63 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From adb1d4e5498a19e9d591ac8f42f9ddfdb23a1354 Mon Sep 17 00:00:00 2001
+From e1fc4b06dcb62e1c2d85ae99f39ef1a8860570e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
@@ -8,15 +8,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Rebase to 1.17.0
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
 ---
  src/posix-io.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index 5c6cf1d..52e513a 100644
+index a422d8f..0d0a98b 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
-@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+@@ -577,7 +577,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
                if (fd_list[i].fd > fd)
                  fd = fd_list[i].fd;
              fd++;
@@ -25,6 +26,3 @@ index 5c6cf1d..52e513a 100644
              closefrom (fd);
              max_fds = fd;
  #else /*!__sun */
--- 
-2.25.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
index de1689ec05..204fe5934d 100644
--- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
+++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
@@ -1,7 +1,7 @@
-From f632148fcc8757bb9a9601a6dab275e88cd309d2 Mon Sep 17 00:00:00 2001
+From 8c850aa109c42d0c193bccc7af45dbc2689b23f6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 15:28:49 +0800
-Subject: [PATCH 3/7] Correctly install python modules
+Subject: [PATCH] Correctly install python modules
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -12,15 +12,16 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Rebase to 1.10.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  lang/python/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 6988faf..36c6f7b 100644
+index 68b98e8..bbb9111 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -93,6 +93,7 @@ install-exec-local:
+@@ -97,6 +97,7 @@ install-exec-local:
  	  --build-base="$$(basename "$${PYTHON}")-gpg" \
  	  install \
  	  --prefix "$(DESTDIR)$(prefix)" \
@@ -28,6 +29,3 @@ index 6988faf..36c6f7b 100644
  	  --verbose ; \
  	done
  
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 50bf21463f..7fe0c9538a 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,7 +1,7 @@
-From 8d9613c34ae495bbcbd725a2e7ac48138ba53c30 Mon Sep 17 00:00:00 2001
+From 57475742b0288b4ee53c01c59c3ab03c1ef7932e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
-Subject: [PATCH 5/7] gpgme-config: skip all /lib* or /usr/lib* directories in
+Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
  output
 
 The logic was not working in multilib setups which use other
@@ -9,15 +9,16 @@ directory names than plain /lib or /usr/lib.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  src/gpgme-config.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gpgme-config.in b/src/gpgme-config.in
-index a4d152e..8342865 100644
+index 56b98f8..e96f3c3 100644
 --- a/src/gpgme-config.in
 +++ b/src/gpgme-config.in
-@@ -154,7 +154,7 @@ while test $# -gt 0; do
+@@ -157,7 +157,7 @@ while test $# -gt 0; do
              for i in $libs $tmp_l $assuan_libs $gpg_error_libs $tmp_x; do
                skip=no
                case $i in
@@ -26,6 +27,3 @@ index a4d152e..8342865 100644
                        skip=yes
                        ;;
                    -L*|-l*)
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
index 1471184d67..8d48db2feb 100644
--- a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
+++ b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
@@ -1,7 +1,7 @@
-From ef920688bfe1c7328c9e97229d62ccd35304ad84 Mon Sep 17 00:00:00 2001
+From 7938a5a760827aec737ea49d2f8719051abda188 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 31 Jan 2018 11:01:09 +0800
-Subject: [PATCH 6/7] fix build path issue
+Subject: [PATCH] fix build path issue
 
 Get the "--root" directory supplied to the "install" command,
 and use it as a prefix to strip off the purported filename
@@ -12,15 +12,16 @@ to use relative path.
 
 Upstream-Status: Submitted [gnupg-devel@gnupg.org]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  lang/python/Makefile.am | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 36c6f7b..ce9a108 100644
+index bbb9111..cee499e 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -92,8 +92,9 @@ install-exec-local:
+@@ -96,8 +96,9 @@ install-exec-local:
  	  build \
  	  --build-base="$$(basename "$${PYTHON}")-gpg" \
  	  install \
@@ -32,6 +33,3 @@ index 36c6f7b..ce9a108 100644
  	  --verbose ; \
  	done
  
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
index 214cf348e4..a11621ed64 100644
--- a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
+++ b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
@@ -1,4 +1,4 @@
-From 94cf9f8fc79c0d1d4529cebdd74328927fda36a2 Mon Sep 17 00:00:00 2001
+From 84c389705e7742d2b68e144a5733e618441d293e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 16:19:54 +0800
 Subject: [PATCH] do not auto check var-PYTHON
@@ -18,10 +18,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index df218ec..6a619ef 100644
+index df892c9..8c6194e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -521,9 +521,8 @@ if test "$found_py" = "1"; then
+@@ -590,9 +590,8 @@ if test "$found_py" = "1"; then
  	if test "$found_py" = "1" -o "$found_py3" = "1"; then
  	  # Reset everything, so that we can look for another Python.
            m4_foreach([mym4pythonver],
diff --git a/meta/recipes-support/gpgme/gpgme_1.23.1.bb b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.23.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.23.2.bb
index e029b73a8f..0d53400bd4 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "a0c316f7ab7d3bfb01a8753c3370dc906e5b61436021f3b54ff1483b513769bd"
+SRC_URI[sha256sum] = "9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.34.1


