Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E7BC531C9
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1391.1771440099913837195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LIcdfMLG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NLOCInjz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c720ecf0b-976a5a4a-4399-4b36-ac4c-e46263c3d9d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440099;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u6ZTChxxDXUkloz+CUKcbz59rCMiwmZUqjXxeSuzKGc=;
	b=LIcdfMLGhsPh7WJqdP7lBHK3X495yqSBABvNqEILgu43q5j+AiipqGJyM+cGcWV0
	MMiAaJ3BOwICPJjJlocM+2SW7ZJA8qJwXarDLbf7oSVfKZ7dNwYm5JvOBHGOi2ogxP/
	fWO7eBdVkvAheBsKa6hLWVVwAz7XYv5qZRNRdZUY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440099;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u6ZTChxxDXUkloz+CUKcbz59rCMiwmZUqjXxeSuzKGc=;
	b=NLOCInjzDu2aTN7MEZHdt65ejV1eYRfLUtegzb1/QB+YW05pEYoC9ivPrDAykOhX
	Mo/km7SDj59CRLkZxUxU1BM9u8CqOhGKwtyKWmZzx3HwBuBf8ljxxid4cgylx9jXvCI
	G0hif3uNqgV6iOxAdynlD6uhzuJgUbq0BB5CMSWg=
Content-Type: multipart/mixed; boundary="===============8935845984044436076=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ncurses: upgrading to 6.6 SUCCEEDED
Message-ID: <0101019c720ecf0b-976a5a4a-4399-4b36-ac4c-e46263c3d9d4-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231342

--===============8935845984044436076==
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
From 1a58603d34c34d595c906672680f2c631a247d4c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:20:24 +0000
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
index 8cb92a3939..b852bf72d2 100644
--- a/meta/recipes-core/ncurses/files/0001-tic-hang.patch
+++ b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
@@ -1,4 +1,4 @@
-From a51a53f0eecfd4d083aba8dfcd47c65e93978ff1 Mon Sep 17 00:00:00 2001
+From 055c095e9b7c850dfb1ad7cf8e334f38fa9ba2c3 Mon Sep 17 00:00:00 2001
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
index 11ca66c8e8..66812f75e5 100644
--- a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
+++ b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
@@ -1,4 +1,4 @@
-From 63cf58044f4ab3297c5a2d0e132e87ebfa80c753 Mon Sep 17 00:00:00 2001
+From 58bec4533de00e0b765d8db496f9e20e4efca518 Mon Sep 17 00:00:00 2001
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
index d89399bbe5..e004d7950a 100644
--- a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
+++ b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
@@ -1,4 +1,4 @@
-From 5962a5ee2885f67a396f7e8955ac1bbd7f15d4aa Mon Sep 17 00:00:00 2001
+From ce86a223b09b27981fb3d5ef32672612f0c2eae7 Mon Sep 17 00:00:00 2001
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
index 299852d2c0..0aa7fb22bb 100644
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -1,4 +1,4 @@
-From af798dceafec8a9ea3f83fc250d784511ca0a29c Mon Sep 17 00:00:00 2001
+From 5ed47758886dabe74ff1709137cfc8ea1a4dc3e4 Mon Sep 17 00:00:00 2001
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


--===============8935845984044436076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: FILELIST: added "/usr/share/man/man3/MEVENT.3x /usr/share/man/man3/mmask_t.3x /usr/share/man/man3/A_COLOR.3x /usr/share/man/man3/CCHARW_MAX.3x"
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: FILELIST: added "/usr/share/terminfo/i/illumos /usr/share/terminfo/s/sun-16color /usr/share/terminfo/s/st-0.8.5 /usr/share/terminfo/m/ms+terminal /usr/share/terminfo/v/vte-2022 /usr/share/terminfo/m/ms-terminal-direct /usr/share/terminfo/r/rlogin-color /usr/share/terminfo/e/ecma+standout /usr/share/terminfo/v/vt520-w /usr/share/terminfo/s/sun-256color /usr/share/terminfo/p/pangoterm-256color /usr/share/terminfo/x/xterm+r5+lockeys /usr/share/terminfo/x/xterm+256setaf2 /usr/share/terminfo/s/sclp /usr/share/terminfo/m/mintty+keypad /usr/share/terminfo/x/xterm+r5+fkeys /usr/share/terminfo/v/vt220+sfkeys /usr/share/terminfo/v/vt220+ufkeys /usr/share/terminfo/v/vt525-w /usr/share/terminfo/t/teraterm5.0 /usr/share/terminfo/e/ecma+underline /usr/share/terminfo/l/linux+lockeys /usr/share/terminfo/w/wyse+cvis /usr/share/terminfo/g/ghostty /usr/share/terminfo/v/vt100+pf1-pf4 /usr/share/terminfo/s/sun-direct /usr/share/terminfo/p/pangoterm 
 /usr/share/terminfo/p/pangoterm-direct"

--===============8935845984044436076==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ncurses-upgrade-6.5-6.6.patch"

RnJvbSAxYTU4NjAzZDM0YzM0ZDU5NWM5MDY2NzI2ODBmMmM2MzFhMjQ3ZDRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6MjA6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
Y3Vyc2VzOiB1cGdyYWRlIDYuNSAtPiA2LjYKCi0tLQogLi4uL25jdXJzZXMvZmlsZXMvMDAwMS10
aWMtaGFuZy5wYXRjaCAgICAgICAgIHwgIDYgKystLS0KIC4uLi9maWxlcy8wMDAyLWNvbmZpZ3Vy
ZS1yZXByb2R1Y2libGUucGF0Y2ggICB8ICA2ICsrLS0tCiAuLi4tRG8tbm90LWluY2x1ZGUtTERG
TEFHUy1pbi1nZW5lcmF0ZWQucGF0Y2ggfCAgNCArLS0KIC4uLi9uY3Vyc2VzL2ZpbGVzL0NWRS0y
MDI1LTYxNDEucGF0Y2ggICAgICAgICB8IDI1IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9uY3Vy
c2VzL2ZpbGVzL2V4aXRfcHJvdG90eXBlLnBhdGNoICAgICAgICB8IDEwICsrKystLS0tCiBtZXRh
L3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXMuaW5jICAgICAgICAgfCAgMiArLQogLi4uL3tu
Y3Vyc2VzXzYuNS5iYiA9PiBuY3Vyc2VzXzYuNi5iYn0gICAgICAgIHwgMjIgKysrKysrKysrKysr
KystLQogNyBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL0NWRS0y
MDI1LTYxNDEucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL3tuY3Vyc2Vz
XzYuNS5iYiA9PiBuY3Vyc2VzXzYuNi5iYn0gKDQ0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9uY3Vyc2VzL2ZpbGVzLzAwMDEtdGljLWhhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9uY3Vyc2VzL2ZpbGVzLzAwMDEtdGljLWhhbmcucGF0Y2gKaW5kZXggOGNiOTJhMzkzOS4u
Yjg1MmJmNzJkMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy8w
MDAxLXRpYy1oYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMv
MDAwMS10aWMtaGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTUxYTUzZjBlZWNmZDRk
MDgzYWJhOGRmY2Q0N2M2NWU5Mzk3OGZmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MDU1YzA5NWU5YjdjODUwZGZiMWFkN2NmOGUzMzRmMzhmYTliYTJjMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERh
dGU6IEZyaSwgMzAgTWFyIDIwMTggMTA6MDI6MjQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGlj
IGhhbmcKQEAgLTE3LDEwICsxNywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25n
eHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21pc2MvdGVybWluZm8uc3JjIGIvbWlzYy90
ZXJtaW5mby5zcmMKLWluZGV4IDVkNTc1YjhlLi5mOWNjNjg4MCAxMDA2NDQKK2luZGV4IGYxMTFl
NTM0Li42ZTg2MjcyOSAxMDA2NDQKIC0tLSBhL21pc2MvdGVybWluZm8uc3JjCiArKysgYi9taXNj
L3Rlcm1pbmZvLnNyYwotQEAgLTY1MTgsMTIgKzY1MTgsMTEgQEAga29uc29sZS14ZjN4fEtERSBj
b25zb2xlIHdpbmRvdyB3aXRoIGtleWJvYXJkIGZvciBYRnJlZTg2IDMueCB4dGVybSwKK0BAIC02
NjQ0LDEyICs2NjQ0LDExIEBAIGtvbnNvbGUteGYzeHxLREUgY29uc29sZSB3aW5kb3cgd2l0aCBr
ZXlib2FyZCBmb3IgWEZyZWU4NiAzLnggeHRlcm0sCiAgIyBUaGUgdmFsdWUgZm9yIGticyAoc2Vl
IGtvbnNvbGUtdnQxMDApIHJlZmxlY3RzIGxvY2FsIGN1c3RvbWl6YXRpb24gcmF0aGVyCiAgIyB0
aGFuIHRoZSBzZXR0aW5ncyB1c2VkIGZvciBYRnJlZTg2IHh0ZXJtLgogIGtvbnNvbGUteGY0eHxL
REUgY29uc29sZSB3aW5kb3cgd2l0aCBrZXlib2FyZCBmb3IgWEZyZWU4NiA0LnggeHRlcm0sCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzLzAwMDItY29uZmlndXJl
LXJlcHJvZHVjaWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvMDAw
Mi1jb25maWd1cmUtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IDExY2E2NmM4ZTguLjY2ODEyZjc1
ZTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvMDAwMi1jb25m
aWd1cmUtcmVwcm9kdWNpYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMv
ZmlsZXMvMDAwMi1jb25maWd1cmUtcmVwcm9kdWNpYmxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA2M2NmNTgwNDRmNGFiMzI5N2M1YTJkMGUxMzJlODdlYmZhODBjNzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA1OGJlYzQ1MzNkZTAwZTBiNzY1ZDhkYjQ5NmY5ZTIwZTRlZmNh
NTE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1Lmpp
YUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxNiBBdWcgMjAxNyAxNDo0NToyNyArMDgwMAog
U3ViamVjdDogW1BBVENIXSBjb25maWd1cmU6IHJlcHJvZHVjaWJsZQpAQCAtMTgsMTAgKzE4LDEw
IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQotaW5kZXggNDg4ZDkzZmMuLjAwNWQ0NGUyIDEw
MDc1NQoraW5kZXggNDhhZDM4MWYuLmM4MTZjYmUxIDEwMDc1NQogLS0tIGEvY29uZmlndXJlCiAr
KysgYi9jb25maWd1cmUKLUBAIC01MTI5LDcgKzUxMjksNyBAQCBlbHNlCitAQCAtNTQyMiw3ICs1
NDIyLDcgQEAgZWxzZQogIAkJOzsKICAJKCopCiAgCQljZl9jdl9hcl9mbGFncz11bmtub3duCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzLzAwMDMtZ2VuLXBrZ2Nv
bmZpZy5pbi1Eby1ub3QtaW5jbHVkZS1MREZMQUdTLWluLWdlbmVyYXRlZC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvMDAwMy1nZW4tcGtnY29uZmlnLmluLURvLW5vdC1p
bmNsdWRlLUxERkxBR1MtaW4tZ2VuZXJhdGVkLnBhdGNoCmluZGV4IGQ4OTM5OWJiZTUuLmUwMDRk
Nzk1MGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvMDAwMy1n
ZW4tcGtnY29uZmlnLmluLURvLW5vdC1pbmNsdWRlLUxERkxBR1MtaW4tZ2VuZXJhdGVkLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvMDAwMy1nZW4tcGtnY29uZmln
LmluLURvLW5vdC1pbmNsdWRlLUxERkxBR1MtaW4tZ2VuZXJhdGVkLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA1OTYyYTVlZTI4ODVmNjdhMzk2ZjdlODk1NWFjMWJiZDdmMTVkNGFhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjZTg2YTIyM2IwOWIyNzk4MWZiM2Q1ZWYzMjY3MjYx
MmYwYzJlYWU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTmF0aGFuIFJvc3NpIDxu
YXRoYW5AbmF0aGFucm9zc2kuY29tPgogRGF0ZTogTW9uLCAxNCBEZWMgMjAyMCAxMzozOTowMiAr
MTAwMAogU3ViamVjdDogW1BBVENIXSBnZW4tcGtnY29uZmlnLmluOiBEbyBub3QgaW5jbHVkZSBM
REZMQUdTIGluIGdlbmVyYXRlZCBwYwpAQCAtMTUsNyArMTUsNyBAQCBTaWduZWQtb2ZmLWJ5OiBO
YXRoYW4gUm9zc2kgPG5hdGhhbkBuYXRoYW5yb3NzaS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9taXNjL2dlbi1wa2dj
b25maWcuaW4gYi9taXNjL2dlbi1wa2djb25maWcuaW4KLWluZGV4IDg5YTVjZDRhLi4wN2Q5NGQx
NyAxMDA2NDQKK2luZGV4IGMzNjlkZDI2Li5hYmNhODhmZSAxMDA2NDQKIC0tLSBhL21pc2MvZ2Vu
LXBrZ2NvbmZpZy5pbgogKysrIGIvbWlzYy9nZW4tcGtnY29uZmlnLmluCiBAQCAtODMsNyArODMs
NyBAQCBpZiBbICIkaW5jbHVkZWRpciIgIT0gIi91c3IvaW5jbHVkZSIgXTsgdGhlbgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy9DVkUtMjAyNS02MTQxLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy9DVkUtMjAyNS02MTQxLnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlYzdlOGE5NGU0Li4wMDAwMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvQ1ZFLTIwMjUtNjE0MS5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDI1ICswLDAgQEAKLUZyb20gMjdkMTQ5MzM0MGQ3MTRlN2JlNmUwOGMw
YThmNDNlNDgyNzYxNDljNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206ICJUaG9tYXMg
RS4gRGlja2V5IiA8ZGlja2V5QGludmlzaWJsZS1pc2xhbmQubmV0PgotRGF0ZTogU2F0LCAyOSBN
YXIgMjAyNSAyMjo1MjozNyArMDAwMAotU3ViamVjdDogW1BBVENIXSBzbmFwc2hvdCBvZiBwcm9q
ZWN0ICJuY3Vyc2VzIiwgbGFiZWwgdjZfNV8yMDI1MDMyOQotCi1DVkU6IENWRS0yMDI1LTYxNDEK
LVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9UaG9tYXNEaWNr
ZXkvbmN1cnNlcy1zbmFwc2hvdHMvY29tbWl0LzI3ZDE0OTMzNDBkNzE0ZTdiZTZlMDhjMGE4ZjQz
ZTQ4Mjc2MTQ5YzRdCi1TaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2ll
bWVucy5jb20+Ci0tLS0KLSBuY3Vyc2VzL3RpbmZvL3BhcnNlX2VudHJ5LmMgfCAyICsrCi0gMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvbmN1cnNlcy90aW5m
by9wYXJzZV9lbnRyeS5jIGIvbmN1cnNlcy90aW5mby9wYXJzZV9lbnRyeS5jCi1pbmRleCBhMjI3
OGMwNy4uYzU1MWM3ODAgMTAwNjQ0Ci0tLS0gYS9uY3Vyc2VzL3RpbmZvL3BhcnNlX2VudHJ5LmMK
LSsrKyBiL25jdXJzZXMvdGluZm8vcGFyc2VfZW50cnkuYwotQEAgLTk4NSw2ICs5ODUsOCBAQCBw
b3N0cHJvY2Vzc190ZXJtY2FwKFRFUk1UWVBFMiAqdHAsIGJvb2wgaGFzX2Jhc2UpCi0gCSAgICBi
cCA9IHRwLT5TdHJpbmdzW2Zyb21fcHRyLT5udGVfaW5kZXhdOwotIAkgICAgaWYgKFZBTElEX1NU
UklORyhicCkpIHsKLSAJCWZvciAoZHAgPSBidWYyOyAqYnA7IGJwKyspIHsKLSsJCSAgICBpZiAo
KHNpemVfdCkgKGRwIC0gYnVmMikgPj0gKHNpemVvZihidWYyKSAtIHNpemVvZihURVJNVFlQRTIp
KSkKLSsJCQkgIGJyZWFrOwotIAkJICAgIGlmIChicFswXSA9PSAnJCcgJiYgYnBbMV0gPT0gJzwn
KSB7Ci0gCQkJd2hpbGUgKCpicCAmJiAqYnAgIT0gJz4nKSB7Ci0gCQkJICAgICsrYnA7CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL2V4aXRfcHJvdG90eXBlLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy9leGl0X3Byb3RvdHlwZS5wYXRj
aAppbmRleCAyOTk4NTJkMmMwLi4wYWE3ZmIyMmJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9uY3Vyc2VzL2ZpbGVzL2V4aXRfcHJvdG90eXBlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL25jdXJzZXMvZmlsZXMvZXhpdF9wcm90b3R5cGUucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGFmNzk4ZGNlYWZlYzhhOWVhM2Y4M2ZjMjUwZDc4NDUxMWNhMGEyOWMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDVlZDQ3NzU4ODg2ZGFiZTc0ZmYxNzA5MTM3Y2ZjOGVhMWE0
ZGMzZTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogRGF0ZTogVHVlLCAzMCBBdWcgMjAyMiAxNTo1ODozMiAtMDcwMAogU3ViamVj
dDogW1BBVENIXSBBZGQgbmVlZGVkIGhlYWRlcnMgZm9yIGluY2x1ZGluZyBtYnN0YXRlX3QgYW5k
IGV4aXQoKQpAQCAtMTAsMTggKzEwLDE4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBkaWZm
IC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCAwMDVkNDRlMi4uNzJmYTZjMjMg
MTAwNzU1CitpbmRleCBjODE2Y2JlMS4uYzRlMWUxNGEgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUK
ICsrKyBiL2NvbmZpZ3VyZQotQEAgLTM0NjIsNiArMzQ2Miw3IEBAIHJtIC1mICJjb25mdGVzdC4k
YWNfb2JqZXh0IiAiY29uZnRlc3QuJGFjX2V4dCIKK0BAIC0zNzY5LDYgKzM3NjksNyBAQCBybSAt
ZiAiY29uZnRlc3QuJGFjX29iamV4dCIgImNvbmZ0ZXN0LiRhY19leHQiCiAgICBjYXQgPiJjb25m
dGVzdC4kYWNfZXh0IiA8PF9BQ0VPRgotICNsaW5lIDM0NjMgImNvbmZpZ3VyZSIKKyAjbGluZSAz
NzcwICJjb25maWd1cmUiCiAgI2luY2x1ZGUgImNvbmZkZWZzLmgiCiArI2luY2x1ZGUgPHN0ZGxp
Yi5oPgogICRhY19kZWNsYXJhdGlvbgogIGludAogIG1haW4gKHZvaWQpCi1AQCAtMTM1MzMsNiAr
MTM1MzQsNyBAQCBjYXQgPiJjb25mdGVzdC4kYWNfZXh0IiA8PF9BQ0VPRgorQEAgLTEzOTAzLDYg
KzEzOTA0LDcgQEAgY2F0ID4iY29uZnRlc3QuJGFjX2V4dCIgPDxfQUNFT0YKICAjaW5jbHVkZSA8
c3RkbGliLmg+CiAgI2luY2x1ZGUgPHN0ZGFyZy5oPgogICNpbmNsdWRlIDxzdGRpby5oPgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzLmluYyBiL21ldGEvcmVj
aXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlcy5pbmMKaW5kZXggODQ4MmRiN2Y2ZS4uMTJiOWI3MWM2
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzLmluYworKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXMuaW5jCkBAIC0yLDcgKzIsNyBAQCBT
VU1NQVJZID0gIlRoZSBOZXcgQ3Vyc2VzIGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJTVnI0IGFu
ZCBYU0ktQ3Vyc2VzIGNvbXBhdGlibGUgY3Vyc2VzIGxpYnJhcnkgYW5kIHRlcm1pbmZvIHRvb2xz
IGluY2x1ZGluZyB0aWMsIGluZm9jbXAsIGNhcHRvaW5mby4gU3VwcG9ydHMgY29sb3IsIG11bHRp
cGxlIGhpZ2hsaWdodHMsIGZvcm1zLWRyYXdpbmcgY2hhcmFjdGVycywgYW5kIGF1dG9tYXRpYyBy
ZWNvZ25pdGlvbiBvZiBrZXlwYWQgYW5kIGZ1bmN0aW9uLWtleSBzZXF1ZW5jZXMuIEV4dGVuc2lv
bnMgaW5jbHVkZSByZXNpemFibGUgd2luZG93cyBhbmQgbW91c2Ugc3VwcG9ydCBvbiBib3RoIHh0
ZXJtIGFuZCBMaW51eCBjb25zb2xlIHVzaW5nIHRoZSBncG0gbGlicmFyeS4iCiBIT01FUEFHRSA9
ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvbmN1cnNlcy9uY3Vyc2VzLmh0bWwiCiBMSUNF
TlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTZmMjkx
ZWU1NDU1MWQ5ZDhkOTkyZWNkNjIzZmU0YmM3O2VuZGxpbmU9MjciCitMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO2VuZGxpbmU9Mjc7bWQ1PWM1MzQ4NDRmYTVhNzRkMTRhZThmYTNk
OWIzYjQyMTM4IgogU0VDVElPTiA9ICJsaWJzIgogREVQRU5EUyA9ICJuY3Vyc2VzLW5hdGl2ZSIK
IERFUEVORFM6Y2xhc3MtbmF0aXZlID0gIiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L25jdXJzZXMvbmN1cnNlc182LjUuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJz
ZXNfNi42LmJiCnNpbWlsYXJpdHkgaW5kZXggNDQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1j
b3JlL25jdXJzZXMvbmN1cnNlc182LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL25j
dXJzZXMvbmN1cnNlc182LjYuYmIKaW5kZXggZWNjYzFjMTgwOS4uZDg2NWQ5YjJlYiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzXzYuNS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXNfNi42LmJiCkBAIC0xLDEzICsxLDMxIEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMSw0ICsx
LDQgQEAKKyMgLUNvcHlyaWdodCAyMDE4LTIwMjMsMjAyNCBUaG9tYXMgRS4gRGlja2V5CisjICtD
b3B5cmlnaHQgMjAxOC0yMDI0LDIwMjUgVGhvbWFzIEUuIERpY2tleQorIyAgQ29weXJpZ2h0IDE5
OTgtMjAxNywyMDE4IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAgCisjICBQZXJt
aXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBv
YnRhaW5pbmcgYQorIyAKKyMKKwogcmVxdWlyZSBuY3Vyc2VzLmluYwogCiBTUkNfVVJJICs9ICJm
aWxlOi8vMDAwMS10aWMtaGFuZy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWNvbmZp
Z3VyZS1yZXByb2R1Y2libGUucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMy1nZW4tcGtn
Y29uZmlnLmluLURvLW5vdC1pbmNsdWRlLUxERkxBR1MtaW4tZ2VuZXJhdGVkLnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovL2V4aXRfcHJvdG90eXBlLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTov
L0NWRS0yMDI1LTYxNDEucGF0Y2ggXAogICAgICAgICAgICAiCiAjIGNvbW1pdCBpZCBjb3JyZXNw
b25kcyB0byB0aGUgcmV2aXNpb24gaW4gcGFja2FnZSB2ZXJzaW9uCi1TUkNSRVYgPSAiMWM1NWQ2
NGQ5ZDNlMDAzOTlhMjFmMDRlOWNhYzFlNDcyYWI1ZjcwYSIKK1NSQ1JFViA9ICJhMWM5YzA4MmJi
ZTZhYzE4ZDk2ZWIyZTFlZTIxNDZlMTY2NWRlYWY4IgogRVhUUkFfT0VDT05GICs9ICItLXdpdGgt
YWJpLXZlcnNpb249NSIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5c
ZCtfXGQrKSQiCiAKLS0gCjIuNDcuMQoK

--===============8935845984044436076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ncurses: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses: SRC_URI changed from "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master file://0001-tic-hang.patch file://0002-configure-reproducible.patch file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch file://exit_prototype.patch file://CVE-2025-6141.patch" to "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master file://0001-tic-hang.patch file://0002-configure-reproducible.patch file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch file://exit_prototype.patch"
packages/x86-64-v3-poky-linux/ncurses/ncurses-dbg: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-dbg: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-dbg: PKGSIZE changed from 3978904 to 3992264 (+0%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-dev: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-dev: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-dev: PKGSIZE changed from 338892 to 343861 (+1%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: PKGSIZE changed from 1177783 to 1249019 (+6%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-doc: FILELIST: added "/usr/share/man/man3/MEVENT.3x /usr/share/man/man3/mmask_t.3x /usr/share/man/man3/A_COLOR.3x /usr/share/man/man3/CCHARW_MAX.3x"
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
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtic: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtic: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtic: PKGSIZE changed from 71669 to 71597 (-0%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-libticw: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libticw: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libticw: PKGSIZE changed from 71670 to 71598 (-0%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtinfo: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtinfo: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-libtinfo: PKGSIZE changed from 199807 to 203903 (+2%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-locale: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-locale: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-src: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-src: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-src: PKGSIZE changed from 3319473 to 3352024 (+1%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-src: FILELIST: directory renamed /usr/src/debug/ncurses/6.5/widec/c++ -> /usr/src/debug/ncurses/6.6/widec/c++, directory renamed /usr/src/debug/ncurses/6.5/ncurses/tinfo -> /usr/src/debug/ncurses/6.6/ncurses/tinfo, directory renamed /usr/src/debug/ncurses/6.5/progs -> /usr/src/debug/ncurses/6.6/progs, directory renamed /usr/src/debug/ncurses/6.5/narrowc/include -> /usr/src/debug/ncurses/6.6/narrowc/include, directory renamed /usr/src/debug/ncurses/6.5/narrowc/c++ -> /usr/src/debug/ncurses/6.6/narrowc/c++, directory renamed /usr/src/debug/ncurses/6.5/ncurses -> /usr/src/debug/ncurses/6.6/ncurses, directory renamed /usr/src/debug/ncurses/6.5/ncurses/widechar -> /usr/src/debug/ncurses/6.6/ncurses/widechar, directory renamed /usr/src/debug/ncurses/6.5/ncurses/base -> /usr/src/debug/ncurses/6.6/ncurses/base, directory renamed /usr/src/debug/ncurses/6.5/c++ -> /usr/src/debug/ncurses/6.6/c++, directory renamed /usr/src/debug/ncurses/6.5/narrowc/
 progs -> /usr/src/debug/ncurses/6.6/narrowc/progs, directory renamed /usr/src/debug/ncurses/6.5/ncurses/trace -> /usr/src/debug/ncurses/6.6/ncurses/trace, directory renamed /usr/src/debug/ncurses/6.5/narrowc/ncurses -> /usr/src/debug/ncurses/6.6/narrowc/ncurses, directory renamed /usr/src/debug/ncurses/6.5/menu -> /usr/src/debug/ncurses/6.6/menu, directory renamed /usr/src/debug/ncurses/6.5/form -> /usr/src/debug/ncurses/6.6/form, directory renamed /usr/src/debug/ncurses/6.5/include -> /usr/src/debug/ncurses/6.6/include, directory renamed /usr/src/debug/ncurses/6.5/widec/include -> /usr/src/debug/ncurses/6.6/widec/include, directory renamed /usr/src/debug/ncurses/6.5/panel -> /usr/src/debug/ncurses/6.6/panel, directory renamed /usr/src/debug/ncurses/6.5/ncurses/tty -> /usr/src/debug/ncurses/6.6/ncurses/tty, directory renamed /usr/src/debug/ncurses/6.5/widec/ncurses -> /usr/src/debug/ncurses/6.6/widec/ncurses
packages/x86-64-v3-poky-linux/ncurses/ncurses-staticdev: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-staticdev: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-staticdev: PKGSIZE changed from 1165044 to 1174676 (+1%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo-base: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo-base: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo-base: PKGSIZE changed from 33211 to 33377 (+0%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: PKGSIZE changed from 2150758 to 2204896 (+3%)
packages/x86-64-v3-poky-linux/ncurses/ncurses-terminfo: FILELIST: added "/usr/share/terminfo/x/xterm+256setaf2 /usr/share/terminfo/x/xterm+r5+lockeys /usr/share/terminfo/t/teraterm5.0 /usr/share/terminfo/w/wyse+cvis /usr/share/terminfo/m/ms-terminal-direct /usr/share/terminfo/m/mintty+keypad /usr/share/terminfo/g/ghostty /usr/share/terminfo/p/pangoterm-256color /usr/share/terminfo/x/xterm+r5+fkeys /usr/share/terminfo/s/st-0.8.5 /usr/share/terminfo/m/ms+terminal /usr/share/terminfo/s/sun-direct /usr/share/terminfo/v/vte-2022 /usr/share/terminfo/v/vt520-w /usr/share/terminfo/p/pangoterm /usr/share/terminfo/s/sun-16color /usr/share/terminfo/v/vt220+ufkeys /usr/share/terminfo/v/vt220+sfkeys /usr/share/terminfo/e/ecma+standout /usr/share/terminfo/p/pangoterm-direct /usr/share/terminfo/s/sun-256color /usr/share/terminfo/l/linux+lockeys /usr/share/terminfo/s/sclp /usr/share/terminfo/v/vt100+pf1-pf4 /usr/share/terminfo/r/rlogin-color /usr/share/terminfo/i/illumos /usr/share/terminfo/e/ecma+u
 nderline /usr/share/terminfo/v/vt525-w"
packages/x86-64-v3-poky-linux/ncurses/ncurses-tools: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses-tools: PV changed from "6.5" to "6.6"
packages/x86-64-v3-poky-linux/ncurses/ncurses-tools: PKGSIZE changed from 215450 to 219546 (+2%)
packages/x86-64-v3-poky-linux/ncurses/ncurses: PKGV changed from 6.5 [default] to 6.6 [default]
packages/x86-64-v3-poky-linux/ncurses/ncurses: PV changed from "6.5" to "6.6"

--===============8935845984044436076==--

