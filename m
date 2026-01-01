Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D93CEED626
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102965.1767267471913800669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2QfZX/1L;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tIzFceIC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b79598f14-78f50508-b532-49c9-85e0-d16782b6ead6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DskEGIQQ21iht16xKYyfJA/iH2WYBzZ92whXyNdXkz4=;
	b=2QfZX/1LgYoFqJFxSPdzPAA9oV1ZunBEasVk8UcSD8zEtmmZSDz0eMpfRk/k3Lid
	R9G6GfxX6poef32PUdEUNsLiV0kTHgeBKo6zT9S8CO+K7lw4Gdsa8iHmdkUpnkmEYb+
	n7sHJ5uCBmGEmPl+Ncw9JuZq41MXvgfAJkOycoRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DskEGIQQ21iht16xKYyfJA/iH2WYBzZ92whXyNdXkz4=;
	b=tIzFceICQGT9nLHQKCpdqNDOEgElIukPw1THapekoC0ZjMKY/G1pr8I+w8dII0BO
	JZNAwPVTgC9OI4+cuAuhKzBgfrotmxbN+QZfU71B0CsNrPiEQlCKKZuQKwTMd24k0nj
	V2Rkr+HdG1rzTG5kECegrt7ubdBO3MJIhmycSoJY=
Content-Type: multipart/mixed; boundary="===============0094804827074806897=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ncurses: upgrading to 6.6 SUCCEEDED
Message-ID: <0101019b79598f14-78f50508-b532-49c9-85e0-d16782b6ead6-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228763

--===============0094804827074806897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ncurses* to *6.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ncurses-upgrade-6.5-6.6.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 40c5f7fede9ca584bce81f3599865c10a2514db0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 06:44:28 +0000
Subject: [PATCH] ncurses: upgrade 6.5 -> 6.6

---
 .../ncurses/files/0001-tic-hang.patch         |  6 ++---
 .../files/0002-configure-reproducible.patch   |  6 ++---
 ...-Do-not-include-LDFLAGS-in-generated.patch |  4 +--
 .../ncurses/files/CVE-2025-6141.patch         | 25 -------------------
 .../ncurses/files/exit_prototype.patch        | 10 ++++----
 meta/recipes-core/ncurses/ncurses.inc         |  2 +-
 .../{ncurses_6.5.bb => ncurses_6.6.bb}        | 22 ++++++++++++++--
 7 files changed, 34 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/CVE-2025-6141.patch
 rename meta/recipes-core/ncurses/{ncurses_6.5.bb => ncurses_6.6.bb} (44%)

diff --git a/meta/recipes-core/ncurses/files/0001-tic-hang.patch b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
index 8cb92a3939..720ecfa123 100644
--- a/meta/recipes-core/ncurses/files/0001-tic-hang.patch
+++ b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
@@ -1,4 +1,4 @@
-From a51a53f0eecfd4d083aba8dfcd47c65e93978ff1 Mon Sep 17 00:00:00 2001
+From 34efae1be466a47135d03b714bc23a43b6fbcca4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 30 Mar 2018 10:02:24 +0800
 Subject: [PATCH] tic hang
@@ -17,10 +17,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+), 6 deletions(-)
 
 diff --git a/misc/terminfo.src b/misc/terminfo.src
-index 5d575b8e..f9cc6880 100644
+index f111e534..6e862729 100644
 --- a/misc/terminfo.src
 +++ b/misc/terminfo.src
-@@ -6518,12 +6518,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
+@@ -6644,12 +6644,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
  # The value for kbs (see konsole-vt100) reflects local customization rather
  # than the settings used for XFree86 xterm.
  konsole-xf4x|KDE console window with keyboard for XFree86 4.x xterm,
diff --git a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
index 11ca66c8e8..e1235a6278 100644
--- a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
+++ b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
@@ -1,4 +1,4 @@
-From 63cf58044f4ab3297c5a2d0e132e87ebfa80c753 Mon Sep 17 00:00:00 2001
+From 5180ee487821fb89ff9a4aa47771fd6db48df58d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 16 Aug 2017 14:45:27 +0800
 Subject: [PATCH] configure: reproducible
@@ -18,10 +18,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 488d93fc..005d44e2 100755
+index 48ad381f..c816cbe1 100755
 --- a/configure
 +++ b/configure
-@@ -5129,7 +5129,7 @@ else
+@@ -5422,7 +5422,7 @@ else
  		;;
  	(*)
  		cf_cv_ar_flags=unknown
diff --git a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
index d89399bbe5..6387002d85 100644
--- a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
+++ b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
@@ -1,4 +1,4 @@
-From 5962a5ee2885f67a396f7e8955ac1bbd7f15d4aa Mon Sep 17 00:00:00 2001
+From 15b49af35f51212fed26f1f82d03f2e4e55fc8d8 Mon Sep 17 00:00:00 2001
 From: Nathan Rossi <nathan@nathanrossi.com>
 Date: Mon, 14 Dec 2020 13:39:02 +1000
 Subject: [PATCH] gen-pkgconfig.in: Do not include LDFLAGS in generated pc
@@ -15,7 +15,7 @@ Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/misc/gen-pkgconfig.in b/misc/gen-pkgconfig.in
-index 89a5cd4a..07d94d17 100644
+index c369dd26..abca88fe 100644
 --- a/misc/gen-pkgconfig.in
 +++ b/misc/gen-pkgconfig.in
 @@ -83,7 +83,7 @@ if [ "$includedir" != "/usr/include" ]; then
diff --git a/meta/recipes-core/ncurses/files/CVE-2025-6141.patch b/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
deleted file mode 100644
index ec7e8a94e4..0000000000
--- a/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 27d1493340d714e7be6e08c0a8f43e48276149c4 Mon Sep 17 00:00:00 2001
-From: "Thomas E. Dickey" <dickey@invisible-island.net>
-Date: Sat, 29 Mar 2025 22:52:37 +0000
-Subject: [PATCH] snapshot of project "ncurses", label v6_5_20250329
-
-CVE: CVE-2025-6141
-Upstream-Status: Backport [https://github.com/ThomasDickey/ncurses-snapshots/commit/27d1493340d714e7be6e08c0a8f43e48276149c4]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- ncurses/tinfo/parse_entry.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
-index a2278c07..c551c780 100644
---- a/ncurses/tinfo/parse_entry.c
-+++ b/ncurses/tinfo/parse_entry.c
-@@ -985,6 +985,8 @@ postprocess_termcap(TERMTYPE2 *tp, bool has_base)
- 	    bp = tp->Strings[from_ptr->nte_index];
- 	    if (VALID_STRING(bp)) {
- 		for (dp = buf2; *bp; bp++) {
-+		    if ((size_t) (dp - buf2) >= (sizeof(buf2) - sizeof(TERMTYPE2)))
-+			  break;
- 		    if (bp[0] == '$' && bp[1] == '<') {
- 			while (*bp && *bp != '>') {
- 			    ++bp;
diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
index 299852d2c0..73f32b7b2d 100644
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -1,4 +1,4 @@
-From af798dceafec8a9ea3f83fc250d784511ca0a29c Mon Sep 17 00:00:00 2001
+From 35db68dff4106931373d33ca82606333efbbb1d3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 30 Aug 2022 15:58:32 -0700
 Subject: [PATCH] Add needed headers for including mbstate_t and exit()
@@ -10,18 +10,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 005d44e2..72fa6c23 100755
+index c816cbe1..c4e1e14a 100755
 --- a/configure
 +++ b/configure
-@@ -3462,6 +3462,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
+@@ -3769,6 +3769,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
    cat >"conftest.$ac_ext" <<_ACEOF
- #line 3463 "configure"
+ #line 3770 "configure"
  #include "confdefs.h"
 +#include <stdlib.h>
  $ac_declaration
  int
  main (void)
-@@ -13533,6 +13534,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
+@@ -13903,6 +13904,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
  #include <stdlib.h>
  #include <stdarg.h>
  #include <stdio.h>
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8482db7f6e..12b9b71c66 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6f291ee54551d9d8d992ecd623fe4bc7;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;endline=27;md5=c534844fa5a74d14ae8fa3d9b3b42138"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
diff --git a/meta/recipes-core/ncurses/ncurses_6.5.bb b/meta/recipes-core/ncurses/ncurses_6.6.bb
similarity index 44%
rename from meta/recipes-core/ncurses/ncurses_6.5.bb
rename to meta/recipes-core/ncurses/ncurses_6.6.bb
index eccc1c1809..d865d9b2eb 100644
--- a/meta/recipes-core/ncurses/ncurses_6.5.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.6.bb
@@ -1,13 +1,31 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright 2018-2023,2024 Thomas E. Dickey
+# +Copyright 2018-2024,2025 Thomas E. Dickey
+#  Copyright 1998-2017,2018 Free Software Foundation, Inc.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a
+# 
+#
+
 require ncurses.inc
 
 SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://exit_prototype.patch \
-           file://CVE-2025-6141.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
+SRCREV = "a1c9c082bbe6ac18d96eb2e1ee2146e1665deaf8"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+_\d+)$"
 
-- 
2.47.1


--===============0094804827074806897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ncurses: SRC_URI changed from "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master file://0001-tic-hang.patch file://0002-configure-reproducible.patch file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch file://exit_prototype.patch file://CVE-2025-6141.patch" to "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master file://0001-tic-hang.patch file://0002-configure-reproducible.patch file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch file://exit_prototype.patch"
packages/x86-64-v3-poky-linux/ncurses: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-dbg: PKGSIZE changed from 3978904 to 3992264 (+0%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-dbg: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-dbg: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-dev: PKGSIZE changed from 338892 to 343861 (+1%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-dev: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-dev: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: PKGSIZE changed from 1177783 to 1249019 (+6%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: FILELIST: added "/usr/share/man/man3/A_COLOR.3x /usr/share/man/man3/CCHARW_MAX.3x /usr/share/man/man3/MEVENT.3x /usr/share/man/man3/mmask_t.3x"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libform: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libform: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libformw: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libformw: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libmenu: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libmenu: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libmenuw: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libmenuw: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libncurses: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libncurses: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libncursesw: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libncursesw: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libpanel: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libpanel: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libpanelw: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libpanelw: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtic: PKGSIZE changed from 71669 to 71597 (-0%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtic: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtic: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libticw: PKGSIZE changed from 71670 to 71598 (-0%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-libticw: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libticw: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtinfo: PKGSIZE changed from 199807 to 203903 (+2%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtinfo: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtinfo: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-locale: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-locale: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-src: PKGSIZE changed from 3319473 to 3352024 (+1%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-src: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-src: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-src: FILELIST: directory renamed /usr/src/debug/ncurses/6.5/c++ -> /usr/src/debug/ncurses/6.6/c++, directory renamed /usr/src/debug/ncurses/6.5/ncurses/base -> /usr/src/debug/ncurses/6.6/ncurses/base, directory renamed /usr/src/debug/ncurses/6.5/narrowc/progs -> /usr/src/debug/ncurses/6.6/narrowc/progs, directory renamed /usr/src/debug/ncurses/6.5/ncurses/trace -> /usr/src/debug/ncurses/6.6/ncurses/trace, directory renamed /usr/src/debug/ncurses/6.5/menu -> /usr/src/debug/ncurses/6.6/menu, directory renamed /usr/src/debug/ncurses/6.5/ncurses/tinfo -> /usr/src/debug/ncurses/6.6/ncurses/tinfo, directory renamed /usr/src/debug/ncurses/6.5/form -> /usr/src/debug/ncurses/6.6/form, directory renamed /usr/src/debug/ncurses/6.5/progs -> /usr/src/debug/ncurses/6.6/progs, directory renamed /usr/src/debug/ncurses/6.5/ncurses/widechar -> /usr/src/debug/ncurses/6.6/ncurses/widechar, directory renamed /usr/src/debug/ncurses/6.5/ncurses -> /usr/src/debu
 g/ncurses/6.6/ncurses, directory renamed /usr/src/debug/ncurses/6.5/widec/c++ -> /usr/src/debug/ncurses/6.6/widec/c++, directory renamed /usr/src/debug/ncurses/6.5/narrowc/ncurses -> /usr/src/debug/ncurses/6.6/narrowc/ncurses, directory renamed /usr/src/debug/ncurses/6.5/narrowc/c++ -> /usr/src/debug/ncurses/6.6/narrowc/c++, directory renamed /usr/src/debug/ncurses/6.5/widec/include -> /usr/src/debug/ncurses/6.6/widec/include, directory renamed /usr/src/debug/ncurses/6.5/widec/ncurses -> /usr/src/debug/ncurses/6.6/widec/ncurses, directory renamed /usr/src/debug/ncurses/6.5/ncurses/tty -> /usr/src/debug/ncurses/6.6/ncurses/tty, directory renamed /usr/src/debug/ncurses/6.5/narrowc/include -> /usr/src/debug/ncurses/6.6/narrowc/include, directory renamed /usr/src/debug/ncurses/6.5/include -> /usr/src/debug/ncurses/6.6/include, directory renamed /usr/src/debug/ncurses/6.5/panel -> /usr/src/debug/ncurses/6.6/panel
packages/x86-64-v3-poky-linux/ncurses/ncurses-staticdev: PKGSIZE changed from 1165044 to 1174676 (+1%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-staticdev: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-staticdev: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo-base: PKGSIZE changed from 33211 to 33377 (+0%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo-base: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo-base: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: PKGSIZE changed from 2150758 to 2204896 (+3%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: FILELIST: added "/usr/share/terminfo/i/illumos /usr/share/terminfo/x/xterm+r5+lockeys /usr/share/terminfo/t/teraterm5.0 /usr/share/terminfo/p/pangoterm /usr/share/terminfo/s/sun-16color /usr/share/terminfo/v/vt525-w /usr/share/terminfo/s/sun-256color /usr/share/terminfo/r/rlogin-color /usr/share/terminfo/v/vt520-w /usr/share/terminfo/g/ghostty /usr/share/terminfo/s/sclp /usr/share/terminfo/m/ms-terminal-direct /usr/share/terminfo/m/ms+terminal /usr/share/terminfo/v/vt220+sfkeys /usr/share/terminfo/v/vt220+ufkeys /usr/share/terminfo/x/xterm+r5+fkeys /usr/share/terminfo/e/ecma+underline /usr/share/terminfo/s/sun-direct /usr/share/terminfo/l/linux+lockeys /usr/share/terminfo/m/mintty+keypad /usr/share/terminfo/w/wyse+cvis /usr/share/terminfo/v/vte-2022 /usr/share/terminfo/p/pangoterm-256color /usr/share/terminfo/s/st-0.8.5 /usr/share/terminfo/v/vt100+pf1-pf4 /usr/share/terminfo/e/ecma+standout /usr/share/terminfo/p/pangoterm-direct
  /usr/share/terminfo/x/xterm+256setaf2"
packages/x86-64-v3-poky-linux/ncurses/ncurses-tools: PKGSIZE changed from 215450 to 219546 (+2%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-tools: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-tools: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses: PV changed from "6.5" to "6.6"

--===============0094804827074806897==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ncurses-upgrade-6.5-6.6.patch"

RnJvbSA0MGM1ZjdmZWRlOWNhNTg0YmNlODFmMzU5OTg2NWMxMGEyNTE0ZGIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNjo0NDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5j
dXJzZXM6IHVwZ3JhZGUgNi41IC0+IDYuNgoKLS0tCiAuLi4vbmN1cnNlcy9maWxlcy8wMDAxLXRp
Yy1oYW5nLnBhdGNoICAgICAgICAgfCAgNiArKy0tLQogLi4uL2ZpbGVzLzAwMDItY29uZmlndXJl
LXJlcHJvZHVjaWJsZS5wYXRjaCAgIHwgIDYgKystLS0KIC4uLi1Eby1ub3QtaW5jbHVkZS1MREZM
QUdTLWluLWdlbmVyYXRlZC5wYXRjaCB8ICA0ICstLQogLi4uL25jdXJzZXMvZmlsZXMvQ1ZFLTIw
MjUtNjE0MS5wYXRjaCAgICAgICAgIHwgMjUgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL25jdXJz
ZXMvZmlsZXMvZXhpdF9wcm90b3R5cGUucGF0Y2ggICAgICAgIHwgMTAgKysrKy0tLS0KIG1ldGEv
cmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlcy5pbmMgICAgICAgICB8ICAyICstCiAuLi4ve25j
dXJzZXNfNi41LmJiID0+IG5jdXJzZXNfNi42LmJifSAgICAgICAgfCAyMiArKysrKysrKysrKysr
Ky0tCiA3IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvQ1ZFLTIw
MjUtNjE0MS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMve25jdXJzZXNf
Ni41LmJiID0+IG5jdXJzZXNfNi42LmJifSAoNDQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL25jdXJzZXMvZmlsZXMvMDAwMS10aWMtaGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b3JlL25jdXJzZXMvZmlsZXMvMDAwMS10aWMtaGFuZy5wYXRjaAppbmRleCA4Y2I5MmEzOTM5Li43
MjBlY2ZhMTIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzLzAw
MDEtdGljLWhhbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy8w
MDAxLXRpYy1oYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNTFhNTNmMGVlY2ZkNGQw
ODNhYmE4ZGZjZDQ3YzY1ZTkzOTc4ZmYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAz
NGVmYWUxYmU0NjZhNDcxMzVkMDNiNzE0YmMyM2E0M2I2ZmJjY2E0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogRnJpLCAzMCBNYXIgMjAxOCAxMDowMjoyNCArMDgwMAogU3ViamVjdDogW1BBVENIXSB0aWMg
aGFuZwpAQCAtMTcsMTAgKzE3LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4
dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWlzYy90ZXJtaW5mby5zcmMgYi9taXNjL3Rl
cm1pbmZvLnNyYwotaW5kZXggNWQ1NzViOGUuLmY5Y2M2ODgwIDEwMDY0NAoraW5kZXggZjExMWU1
MzQuLjZlODYyNzI5IDEwMDY0NAogLS0tIGEvbWlzYy90ZXJtaW5mby5zcmMKICsrKyBiL21pc2Mv
dGVybWluZm8uc3JjCi1AQCAtNjUxOCwxMiArNjUxOCwxMSBAQCBrb25zb2xlLXhmM3h8S0RFIGNv
bnNvbGUgd2luZG93IHdpdGgga2V5Ym9hcmQgZm9yIFhGcmVlODYgMy54IHh0ZXJtLAorQEAgLTY2
NDQsMTIgKzY2NDQsMTEgQEAga29uc29sZS14ZjN4fEtERSBjb25zb2xlIHdpbmRvdyB3aXRoIGtl
eWJvYXJkIGZvciBYRnJlZTg2IDMueCB4dGVybSwKICAjIFRoZSB2YWx1ZSBmb3Iga2JzIChzZWUg
a29uc29sZS12dDEwMCkgcmVmbGVjdHMgbG9jYWwgY3VzdG9taXphdGlvbiByYXRoZXIKICAjIHRo
YW4gdGhlIHNldHRpbmdzIHVzZWQgZm9yIFhGcmVlODYgeHRlcm0uCiAga29uc29sZS14ZjR4fEtE
RSBjb25zb2xlIHdpbmRvdyB3aXRoIGtleWJvYXJkIGZvciBYRnJlZTg2IDQueCB4dGVybSwKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvMDAwMi1jb25maWd1cmUt
cmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy8wMDAy
LWNvbmZpZ3VyZS1yZXByb2R1Y2libGUucGF0Y2gKaW5kZXggMTFjYTY2YzhlOC4uZTEyMzVhNjI3
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy8wMDAyLWNvbmZp
Z3VyZS1yZXByb2R1Y2libGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9m
aWxlcy8wMDAyLWNvbmZpZ3VyZS1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDYzY2Y1ODA0NGY0YWIzMjk3YzVhMmQwZTEzMmU4N2ViZmE4MGM3NTMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDUxODBlZTQ4NzgyMWZiODlmZjlhNGFhNDc3NzFmZDZkYjQ4ZGY1
OGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE2IEF1ZyAyMDE3IDE0OjQ1OjI3ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogcmVwcm9kdWNpYmxlCkBAIC0xOCwxMCArMTgsMTAg
QEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCA0ODhkOTNmYy4uMDA1ZDQ0ZTIgMTAw
NzU1CitpbmRleCA0OGFkMzgxZi4uYzgxNmNiZTEgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsr
KyBiL2NvbmZpZ3VyZQotQEAgLTUxMjksNyArNTEyOSw3IEBAIGVsc2UKK0BAIC01NDIyLDcgKzU0
MjIsNyBAQCBlbHNlCiAgCQk7OwogIAkoKikKICAJCWNmX2N2X2FyX2ZsYWdzPXVua25vd24KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvMDAwMy1nZW4tcGtnY29u
ZmlnLmluLURvLW5vdC1pbmNsdWRlLUxERkxBR1MtaW4tZ2VuZXJhdGVkLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy8wMDAzLWdlbi1wa2djb25maWcuaW4tRG8tbm90LWlu
Y2x1ZGUtTERGTEFHUy1pbi1nZW5lcmF0ZWQucGF0Y2gKaW5kZXggZDg5Mzk5YmJlNS4uNjM4NzAw
MmQ4NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy8wMDAzLWdl
bi1wa2djb25maWcuaW4tRG8tbm90LWluY2x1ZGUtTERGTEFHUy1pbi1nZW5lcmF0ZWQucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy8wMDAzLWdlbi1wa2djb25maWcu
aW4tRG8tbm90LWluY2x1ZGUtTERGTEFHUy1pbi1nZW5lcmF0ZWQucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDU5NjJhNWVlMjg4NWY2N2EzOTZmN2U4OTU1YWMxYmJkN2YxNWQ0YWEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE1YjQ5YWYzNWY1MTIxMmZlZDI2ZjFmODJkMDNmMmU0
ZTU1ZmM4ZDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBOYXRoYW4gUm9zc2kgPG5h
dGhhbkBuYXRoYW5yb3NzaS5jb20+CiBEYXRlOiBNb24sIDE0IERlYyAyMDIwIDEzOjM5OjAyICsx
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbi1wa2djb25maWcuaW46IERvIG5vdCBpbmNsdWRlIExE
RkxBR1MgaW4gZ2VuZXJhdGVkIHBjCkBAIC0xNSw3ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IE5h
dGhhbiBSb3NzaSA8bmF0aGFuQG5hdGhhbnJvc3NpLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL21pc2MvZ2VuLXBrZ2Nv
bmZpZy5pbiBiL21pc2MvZ2VuLXBrZ2NvbmZpZy5pbgotaW5kZXggODlhNWNkNGEuLjA3ZDk0ZDE3
IDEwMDY0NAoraW5kZXggYzM2OWRkMjYuLmFiY2E4OGZlIDEwMDY0NAogLS0tIGEvbWlzYy9nZW4t
cGtnY29uZmlnLmluCiArKysgYi9taXNjL2dlbi1wa2djb25maWcuaW4KIEBAIC04Myw3ICs4Myw3
IEBAIGlmIFsgIiRpbmNsdWRlZGlyIiAhPSAiL3Vzci9pbmNsdWRlIiBdOyB0aGVuCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL0NWRS0yMDI1LTYxNDEucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL0NWRS0yMDI1LTYxNDEucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGVjN2U4YTk0ZTQuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy9DVkUtMjAyNS02MTQxLnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsMjUgKzAsMCBAQAotRnJvbSAyN2QxNDkzMzQwZDcxNGU3YmU2ZTA4YzBh
OGY0M2U0ODI3NjE0OWM0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogIlRob21hcyBF
LiBEaWNrZXkiIDxkaWNrZXlAaW52aXNpYmxlLWlzbGFuZC5uZXQ+Ci1EYXRlOiBTYXQsIDI5IE1h
ciAyMDI1IDIyOjUyOjM3ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIHNuYXBzaG90IG9mIHByb2pl
Y3QgIm5jdXJzZXMiLCBsYWJlbCB2Nl81XzIwMjUwMzI5Ci0KLUNWRTogQ1ZFLTIwMjUtNjE0MQot
VXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL1Rob21hc0RpY2tl
eS9uY3Vyc2VzLXNuYXBzaG90cy9jb21taXQvMjdkMTQ5MzM0MGQ3MTRlN2JlNmUwOGMwYThmNDNl
NDgyNzYxNDljNF0KLVNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVt
ZW5zLmNvbT4KLS0tLQotIG5jdXJzZXMvdGluZm8vcGFyc2VfZW50cnkuYyB8IDIgKysKLSAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9uY3Vyc2VzL3RpbmZv
L3BhcnNlX2VudHJ5LmMgYi9uY3Vyc2VzL3RpbmZvL3BhcnNlX2VudHJ5LmMKLWluZGV4IGEyMjc4
YzA3Li5jNTUxYzc4MCAxMDA2NDQKLS0tLSBhL25jdXJzZXMvdGluZm8vcGFyc2VfZW50cnkuYwot
KysrIGIvbmN1cnNlcy90aW5mby9wYXJzZV9lbnRyeS5jCi1AQCAtOTg1LDYgKzk4NSw4IEBAIHBv
c3Rwcm9jZXNzX3Rlcm1jYXAoVEVSTVRZUEUyICp0cCwgYm9vbCBoYXNfYmFzZSkKLSAJICAgIGJw
ID0gdHAtPlN0cmluZ3NbZnJvbV9wdHItPm50ZV9pbmRleF07Ci0gCSAgICBpZiAoVkFMSURfU1RS
SU5HKGJwKSkgewotIAkJZm9yIChkcCA9IGJ1ZjI7ICpicDsgYnArKykgewotKwkJICAgIGlmICgo
c2l6ZV90KSAoZHAgLSBidWYyKSA+PSAoc2l6ZW9mKGJ1ZjIpIC0gc2l6ZW9mKFRFUk1UWVBFMikp
KQotKwkJCSAgYnJlYWs7Ci0gCQkgICAgaWYgKGJwWzBdID09ICckJyAmJiBicFsxXSA9PSAnPCcp
IHsKLSAJCQl3aGlsZSAoKmJwICYmICpicCAhPSAnPicpIHsKLSAJCQkgICAgKyticDsKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvZXhpdF9wcm90b3R5cGUucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL2V4aXRfcHJvdG90eXBlLnBhdGNo
CmluZGV4IDI5OTg1MmQyYzAuLjczZjMyYjdiMmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL25jdXJzZXMvZmlsZXMvZXhpdF9wcm90b3R5cGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvbmN1cnNlcy9maWxlcy9leGl0X3Byb3RvdHlwZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gYWY3OThkY2VhZmVjOGE5ZWEzZjgzZmMyNTBkNzg0NTExY2EwYTI5YyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzVkYjY4ZGZmNDEwNjkzMTM3M2QzM2NhODI2MDYzMzNlZmJi
YjFkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBUdWUsIDMwIEF1ZyAyMDIyIDE1OjU4OjMyIC0wNzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEFkZCBuZWVkZWQgaGVhZGVycyBmb3IgaW5jbHVkaW5nIG1ic3RhdGVfdCBhbmQg
ZXhpdCgpCkBAIC0xMCwxOCArMTAsMTggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYg
LS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKLWluZGV4IDAwNWQ0NGUyLi43MmZhNmMyMyAx
MDA3NTUKK2luZGV4IGM4MTZjYmUxLi5jNGUxZTE0YSAxMDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQog
KysrIGIvY29uZmlndXJlCi1AQCAtMzQ2Miw2ICszNDYyLDcgQEAgcm0gLWYgImNvbmZ0ZXN0LiRh
Y19vYmpleHQiICJjb25mdGVzdC4kYWNfZXh0IgorQEAgLTM3NjksNiArMzc2OSw3IEBAIHJtIC1m
ICJjb25mdGVzdC4kYWNfb2JqZXh0IiAiY29uZnRlc3QuJGFjX2V4dCIKICAgIGNhdCA+ImNvbmZ0
ZXN0LiRhY19leHQiIDw8X0FDRU9GCi0gI2xpbmUgMzQ2MyAiY29uZmlndXJlIgorICNsaW5lIDM3
NzAgImNvbmZpZ3VyZSIKICAjaW5jbHVkZSAiY29uZmRlZnMuaCIKICsjaW5jbHVkZSA8c3RkbGli
Lmg+CiAgJGFjX2RlY2xhcmF0aW9uCiAgaW50CiAgbWFpbiAodm9pZCkKLUBAIC0xMzUzMyw2ICsx
MzUzNCw3IEBAIGNhdCA+ImNvbmZ0ZXN0LiRhY19leHQiIDw8X0FDRU9GCitAQCAtMTM5MDMsNiAr
MTM5MDQsNyBAQCBjYXQgPiJjb25mdGVzdC4kYWNfZXh0IiA8PF9BQ0VPRgogICNpbmNsdWRlIDxz
dGRsaWIuaD4KICAjaW5jbHVkZSA8c3RkYXJnLmg+CiAgI2luY2x1ZGUgPHN0ZGlvLmg+CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXMuaW5jIGIvbWV0YS9yZWNp
cGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzLmluYwppbmRleCA4NDgyZGI3ZjZlLi4xMmI5YjcxYzY2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXMuaW5jCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlcy5pbmMKQEAgLTIsNyArMiw3IEBAIFNV
TU1BUlkgPSAiVGhlIE5ldyBDdXJzZXMgbGlicmFyeSIKIERFU0NSSVBUSU9OID0gIlNWcjQgYW5k
IFhTSS1DdXJzZXMgY29tcGF0aWJsZSBjdXJzZXMgbGlicmFyeSBhbmQgdGVybWluZm8gdG9vbHMg
aW5jbHVkaW5nIHRpYywgaW5mb2NtcCwgY2FwdG9pbmZvLiBTdXBwb3J0cyBjb2xvciwgbXVsdGlw
bGUgaGlnaGxpZ2h0cywgZm9ybXMtZHJhd2luZyBjaGFyYWN0ZXJzLCBhbmQgYXV0b21hdGljIHJl
Y29nbml0aW9uIG9mIGtleXBhZCBhbmQgZnVuY3Rpb24ta2V5IHNlcXVlbmNlcy4gRXh0ZW5zaW9u
cyBpbmNsdWRlIHJlc2l6YWJsZSB3aW5kb3dzIGFuZCBtb3VzZSBzdXBwb3J0IG9uIGJvdGggeHRl
cm0gYW5kIExpbnV4IGNvbnNvbGUgdXNpbmcgdGhlIGdwbSBsaWJyYXJ5LiIKIEhPTUVQQUdFID0g
Imh0dHA6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9uY3Vyc2VzL25jdXJzZXMuaHRtbCIKIExJQ0VO
U0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NmYyOTFl
ZTU0NTUxZDlkOGQ5OTJlY2Q2MjNmZTRiYzc7ZW5kbGluZT0yNyIKK0xJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7ZW5kbGluZT0yNzttZDU9YzUzNDg0NGZhNWE3NGQxNGFlOGZhM2Q5
YjNiNDIxMzgiCiBTRUNUSU9OID0gImxpYnMiCiBERVBFTkRTID0gIm5jdXJzZXMtbmF0aXZlIgog
REVQRU5EUzpjbGFzcy1uYXRpdmUgPSAiIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
bmN1cnNlcy9uY3Vyc2VzXzYuNS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNl
c182LjYuYmIKc2ltaWxhcml0eSBpbmRleCA0NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNv
cmUvbmN1cnNlcy9uY3Vyc2VzXzYuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvbmN1
cnNlcy9uY3Vyc2VzXzYuNi5iYgppbmRleCBlY2NjMWMxODA5Li5kODY1ZDliMmViIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXNfNi41LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlc182LjYuYmIKQEAgLTEsMTMgKzEsMzEgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDQgKzEs
NCBAQAorIyAtQ29weXJpZ2h0IDIwMTgtMjAyMywyMDI0IFRob21hcyBFLiBEaWNrZXkKKyMgK0Nv
cHlyaWdodCAyMDE4LTIwMjQsMjAyNSBUaG9tYXMgRS4gRGlja2V5CisjICBDb3B5cmlnaHQgMTk5
OC0yMDE3LDIwMTggRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjICAKKyMgIFBlcm1p
c3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9i
dGFpbmluZyBhCisjIAorIworCiByZXF1aXJlIG5jdXJzZXMuaW5jCiAKIFNSQ19VUkkgKz0gImZp
bGU6Ly8wMDAxLXRpYy1oYW5nLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItY29uZmln
dXJlLXJlcHJvZHVjaWJsZS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLWdlbi1wa2dj
b25maWcuaW4tRG8tbm90LWluY2x1ZGUtTERGTEFHUy1pbi1nZW5lcmF0ZWQucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vZXhpdF9wcm90b3R5cGUucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8v
Q1ZFLTIwMjUtNjE0MS5wYXRjaCBcCiAgICAgICAgICAgICIKICMgY29tbWl0IGlkIGNvcnJlc3Bv
bmRzIHRvIHRoZSByZXZpc2lvbiBpbiBwYWNrYWdlIHZlcnNpb24KLVNSQ1JFViA9ICIxYzU1ZDY0
ZDlkM2UwMDM5OWEyMWYwNGU5Y2FjMWU0NzJhYjVmNzBhIgorU1JDUkVWID0gImExYzljMDgyYmJl
NmFjMThkOTZlYjJlMWVlMjE0NmUxNjY1ZGVhZjgiCiBFWFRSQV9PRUNPTkYgKz0gIi0td2l0aC1h
YmktdmVyc2lvbj01IgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPlxk
K19cZCspJCIKIAotLSAKMi40Ny4xCgo=

--===============0094804827074806897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: FILELIST: added "/usr/share/man/man3/A_COLOR.3x /usr/share/man/man3/CCHARW_MAX.3x /usr/share/man/man3/mmask_t.3x /usr/share/man/man3/MEVENT.3x"
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: FILELIST: added "/usr/share/terminfo/s/sun-16color /usr/share/terminfo/p/pangoterm /usr/share/terminfo/v/vt525-w /usr/share/terminfo/s/sun-256color /usr/share/terminfo/i/illumos /usr/share/terminfo/x/xterm+r5+lockeys /usr/share/terminfo/t/teraterm5.0 /usr/share/terminfo/m/ms-terminal-direct /usr/share/terminfo/v/vt220+sfkeys /usr/share/terminfo/v/vt220+ufkeys /usr/share/terminfo/m/ms+terminal /usr/share/terminfo/r/rlogin-color /usr/share/terminfo/v/vt520-w /usr/share/terminfo/g/ghostty /usr/share/terminfo/s/sclp /usr/share/terminfo/l/linux+lockeys /usr/share/terminfo/s/sun-direct /usr/share/terminfo/w/wyse+cvis /usr/share/terminfo/m/mintty+keypad /usr/share/terminfo/v/vte-2022 /usr/share/terminfo/p/pangoterm-256color /usr/share/terminfo/x/xterm+r5+fkeys /usr/share/terminfo/e/ecma+underline /usr/share/terminfo/e/ecma+standout /usr/share/terminfo/p/pangoterm-direct /usr/share/terminfo/x/xterm+256setaf2 /usr/share/terminfo/s/st-0.8
 .5 /usr/share/terminfo/v/vt100+pf1-pf4"

--===============0094804827074806897==--

