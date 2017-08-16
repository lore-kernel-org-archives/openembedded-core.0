Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B686E78677
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:31:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G8Vf7R025061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 01:31:41 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 01:31:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 16 Aug 2017 04:31:22 -0400
Message-ID: <cfdcc4c94e196313654f11ca8eca4baec1ab300b.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] ncurses: 6.0+20161126 -> 6.0+20170715
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
X-List-Received-Date: Wed, 16 Aug 2017 08:31:41 -0000
Content-Type: text/plain

Rebase patches:
- tic-hang.patch -> 0001
- configure-reproducible.patch -> 0002

Drop fix-cflags-mangle.patch, which accepted by upstream
...
commit 1b74f120ab7be89011408a6ad0f1c748a314bae8
Author: Sven Joachim <svenjoac@gmx.de>
Date:   Sun Feb 26 09:01:34 2017 +0100

    Import upstream patch 20170225

    20170225
        + fixes for CF_CC_ENV_FLAGS (report by Ross Burton).
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/{tic-hang.patch => 0001-tic-hang.patch}  | 26 +++++++++++++++++-----
 ...ble.patch => 0002-configure-reproducible.patch} | 21 ++++++++++++++---
 .../ncurses/files/fix-cflags-mangle.patch          | 18 ---------------
 ...ses_6.0+20161126.bb => ncurses_6.0+20170715.bb} |  7 +++---
 4 files changed, 42 insertions(+), 30 deletions(-)
 rename meta/recipes-core/ncurses/files/{tic-hang.patch => 0001-tic-hang.patch} (63%)
 rename meta/recipes-core/ncurses/files/{configure-reproducible.patch => 0002-configure-reproducible.patch} (50%)
 delete mode 100644 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20161126.bb => ncurses_6.0+20170715.bb} (56%)

diff --git a/meta/recipes-core/ncurses/files/tic-hang.patch b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
similarity index 63%
rename from meta/recipes-core/ncurses/files/tic-hang.patch
rename to meta/recipes-core/ncurses/files/0001-tic-hang.patch
index cba89d2..4a97056 100644
--- a/meta/recipes-core/ncurses/files/tic-hang.patch
+++ b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
@@ -1,13 +1,26 @@
+From a95590f676209832fe0b27226e6de3cb50e2b97c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 16 Aug 2017 14:31:51 +0800
+Subject: [PATCH 1/2] tic hang
+
 Upstream-Status: Inappropriate [configuration]
 
 'tic' of some linux distributions (e.g. fedora 11) hang in an infinite
 loop when processing the original file.
 
-Index: ncurses-5.7/misc/terminfo.src
-===================================================================
---- ncurses-5.7.orig/misc/terminfo.src
-+++ ncurses-5.7/misc/terminfo.src
-@@ -3706,12 +3706,11 @@ konsole-xf3x|KDE console window with key
+Signed-off-by: anonymous
+
+Rebase to 6.0+20170715
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ misc/terminfo.src | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/misc/terminfo.src b/misc/terminfo.src
+index ee3fab3..176d593 100644
+--- a/misc/terminfo.src
++++ b/misc/terminfo.src
+@@ -5177,12 +5177,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
  # The value for kbs reflects local customization rather than the settings used
  # for XFree86 xterm.
  konsole-xf4x|KDE console window with keyboard for XFree86 4.x xterm,
@@ -25,3 +38,6 @@ Index: ncurses-5.7/misc/terminfo.src
  # KDE's "vt100" keyboard has no relationship to any terminal that DEC made, but
  # it is still useful for deriving the other entries.
  konsole-vt100|KDE console window with vt100 (sic) keyboard,
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/ncurses/files/configure-reproducible.patch b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
similarity index 50%
rename from meta/recipes-core/ncurses/files/configure-reproducible.patch
rename to meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
index 54a8bdc..c47ce6a 100644
--- a/meta/recipes-core/ncurses/files/configure-reproducible.patch
+++ b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
@@ -1,15 +1,27 @@
+From 939c994f3756c2d6d3cab2e6a04d05fa7c2b1d56 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 16 Aug 2017 14:45:27 +0800
+Subject: [PATCH 2/2] configure: reproducible
+
 "configure" enforces -U for ar flags, breaking deterministic builds.
 The flag was added to fix some vaguely specified "recent POSIX binutil
-build problems" in 2015. 
+build problems" in 2015.
 
 Upstream-Status: Pending
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 
+Rebase to Rebase to 6.0+20170715
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/configure b/configure
-index 7f31208..aa80911 100755
+index 7d7d2c1..f444354 100755
 --- a/configure
 +++ b/configure
-@@ -4428,7 +4428,7 @@ if test "${cf_cv_ar_flags+set}" = set; then
+@@ -4458,7 +4458,7 @@ if test "${cf_cv_ar_flags+set}" = set; then
  else
  
  	cf_cv_ar_flags=unknown
@@ -18,3 +30,6 @@ index 7f31208..aa80911 100755
  	do
  
  		# check if $ARFLAGS already contains this choice
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
deleted file mode 100644
index e9447c5..0000000
--- a/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-configure has a piece of logic to detect users "abusing" CC to hold compiler
-flags (which we do).  It also has logic to "correct" this by moving the flags
-from CC to CFLAGS, but the sed only handles a single argument in CC.
-
-Replace the sed with awk to filter out all words that start with a hyphen.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure b/configure
-index 7f31208..1a29cfc 100755
---- a/configure
-+++ b/configure
-@@ -2191,2 +2191,2 @@ echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/C
--	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
--	CC=`echo "$CC " | sed -e 's/[ 	]-[^ 	].*$//' -e 's/[ 	]*$//'`
-+	cf_flags=`echo "$CC" | awk  'BEGIN{ORS=" ";RS=" "} /^-.+/ {print $1}'`
-+	CC=`echo "$CC " | awk  'BEGIN{ORS=" ";RS=" "} /^[^-].+/ {print $1}'`
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb b/meta/recipes-core/ncurses/ncurses_6.0+20170715.bb
similarity index 56%
rename from meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
rename to meta/recipes-core/ncurses/ncurses_6.0+20170715.bb
index ace3108..127394c 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20170715.bb
@@ -1,12 +1,11 @@
 require ncurses.inc
 
-SRC_URI += "file://tic-hang.patch \
-            file://fix-cflags-mangle.patch \
+SRC_URI += "file://0001-tic-hang.patch \
+            file://0002-configure-reproducible.patch \
             file://config.cache \
-            file://configure-reproducible.patch \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
+SRCREV = "52681a6a1a18b4d6eb1a716512d0dd827bd71c87"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.8.1


