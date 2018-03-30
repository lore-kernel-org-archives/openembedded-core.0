Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC9A7454A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:46:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2U6kqGa014118
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 23:46:52 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 23:46:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2018 02:46:28 -0400
Message-ID: <9bd4412245729a5a05fd62b1752ba3c539f416b8.1522392229.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1522392229.git.hongxu.jia@windriver.com>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] ncureses: 6.0+20171125 -> 6.1
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
X-List-Received-Date: Fri, 30 Mar 2018 06:46:52 -0000
Content-Type: text/plain

1. Rebase 0001, 0002

2. Fix [already-stripped] QA Issue
Since the following commit add, it strip executables which
are installed by default.
...
commit 087eaf92c621098927f3f98e3652411de48f8b6b
Author: Sven Joachim <svenjoac@gmx.de>
Date:   Sun Jan 21 08:01:41 2018 +0100

    Import upstream patch 20180120

    20180120
        + build-fix in picsmap.c for stdint.h existence.
        + add --disable-stripping option to configure scripts.
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-core/ncurses/files/0001-tic-hang.patch | 24 +++++++++++-----------
 .../files/0002-configure-reproducible.patch        |  8 ++++----
 meta/recipes-core/ncurses/ncurses.inc              |  1 +
 .../{ncurses_6.0+20171125.bb => ncurses_6.1.bb}    |  2 +-
 4 files changed, 18 insertions(+), 17 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20171125.bb => ncurses_6.1.bb} (86%)

diff --git a/meta/recipes-core/ncurses/files/0001-tic-hang.patch b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
index 4a97056..f98a943 100644
--- a/meta/recipes-core/ncurses/files/0001-tic-hang.patch
+++ b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
@@ -1,6 +1,6 @@
-From a95590f676209832fe0b27226e6de3cb50e2b97c Mon Sep 17 00:00:00 2001
+From 168ba7a681be73ac024438e33e14fde1d5aea97d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 16 Aug 2017 14:31:51 +0800
+Date: Fri, 30 Mar 2018 10:02:24 +0800
 Subject: [PATCH 1/2] tic hang
 
 Upstream-Status: Inappropriate [configuration]
@@ -10,34 +10,34 @@ loop when processing the original file.
 
 Signed-off-by: anonymous
 
-Rebase to 6.0+20170715
+Rebase to 6.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  misc/terminfo.src | 11 +++++------
  1 file changed, 5 insertions(+), 6 deletions(-)
 
 diff --git a/misc/terminfo.src b/misc/terminfo.src
-index ee3fab3..176d593 100644
+index 84f4810..6b385ec 100644
 --- a/misc/terminfo.src
 +++ b/misc/terminfo.src
-@@ -5177,12 +5177,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
- # The value for kbs reflects local customization rather than the settings used
- # for XFree86 xterm.
+@@ -5562,12 +5562,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
+ # The value for kbs (see konsole-vt100) reflects local customization rather
+ # than the settings used for XFree86 xterm.
  konsole-xf4x|KDE console window with keyboard for XFree86 4.x xterm,
 -	kend=\EOF, khome=\EOH, use=konsole+pcfkeys,
 -	use=konsole-vt100,
--# Konsole does not implement shifted cursor-keys.
+-
 -konsole+pcfkeys|konsole subset of xterm+pcfkeys,
--	kLFT@, kRIT@, kcbt=\E[Z, kind@, kri@, kDN@, kUP@, use=xterm+pcc2,
--	use=xterm+pcf0,
+-	kcbt=\E[Z, use=xterm+pcc2, use=xterm+pcf0,
+-	use=xterm+pce2,
 +	kend=\EOF, kf1=\EOP, kf13=\EO2P, kf14=\EO2Q, kf15=\EO2R,
 +	kf16=\EO2S, kf17=\E[15;2~, kf18=\E[17;2~, kf19=\E[18;2~,
 +	kf2=\EOQ, kf20=\E[19;2~, kf21=\E[20;2~, kf22=\E[21;2~,
 +	kf23=\E[23;2~, kf24=\E[24;2~, kf3=\EOR, kf4=\EOS,
 +	khome=\EOH, use=konsole-vt100,
+ 
+ # Obsolete: vt100.keymap
  # KDE's "vt100" keyboard has no relationship to any terminal that DEC made, but
- # it is still useful for deriving the other entries.
- konsole-vt100|KDE console window with vt100 (sic) keyboard,
 -- 
 1.8.3.1
 
diff --git a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
index c47ce6a..5721956 100644
--- a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
+++ b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
@@ -1,4 +1,4 @@
-From 939c994f3756c2d6d3cab2e6a04d05fa7c2b1d56 Mon Sep 17 00:00:00 2001
+From 2a53c03ffa90f0050a949fc5920f0df3e668ff42 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 16 Aug 2017 14:45:27 +0800
 Subject: [PATCH 2/2] configure: reproducible
@@ -10,7 +10,7 @@ build problems" in 2015.
 Upstream-Status: Pending
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 
-Rebase to Rebase to 6.0+20170715
+Rebase to 6.1
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -18,10 +18,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 7d7d2c1..f444354 100755
+index adead92..fa4fdb7 100755
 --- a/configure
 +++ b/configure
-@@ -4458,7 +4458,7 @@ if test "${cf_cv_ar_flags+set}" = set; then
+@@ -4503,7 +4503,7 @@ if test "${cf_cv_ar_flags+set}" = set; then
  else
  
  	cf_cv_ar_flags=unknown
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 01e41d5..99fc478 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -87,6 +87,7 @@ ncurses_configure() {
 	        --disable-rpath-hack \
 		${EXCONFIG_ARGS} \
 	        --with-manpage-format=normal \
+	        --disable-stripping \
 	        "$@" || return 1
 	cd ..
 }
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb b/meta/recipes-core/ncurses/ncurses_6.1.bb
similarity index 86%
rename from meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
rename to meta/recipes-core/ncurses/ncurses_6.1.bb
index 6c4b96f..8d72f57 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "5d849e836052459901cfe0b85a0b2939ff8d2b2a"
+SRCREV = "518fe9f913a0bfb80f1e366c9fcccf23e79dc69b"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.8.1


