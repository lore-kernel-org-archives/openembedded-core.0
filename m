Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEC9C83F1A
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:37:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8531.1693449425070265863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="129618135"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="129618135"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:37:02 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C21C3DE571
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:36:58 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E7F27D9484
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:36:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B5E62FC2743;
	Thu, 31 Aug 2023 11:36:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mc: upgrade 4.8.29 -> 4.8.30
Date: Thu, 31 Aug 2023 10:36:52 +0800
Message-Id: <1693449412-28006-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10--21.166100-10.000000
X-TMASE-MatchedRID: Zht1puvKudmjz0nOeth/yTsjyooeEcrIkdS3kPlaZyXkABvhO7aBvqTz
	q4wH3yI2mUhH31Cro3qIhClGtlmSzrWtJ+5PTkamCKKJ1/F/gpkXivwflisSrMboqPA6+88kZ0v
	Ie4Szkl5GfFNIzJg95NMJDfA5t9ISC2chykIIZH2C+Y2uxPjocht0qAFnFONlQQ1XgvCe7sHgH0
	jYraCk7xYV5DP+K8pS8cpg1h6+HVzPQ4CxWrSq9RMxKDqgAFSzRWnXH60ddk8um94DE3gzXzVka
	xwyOBfM9RzkM0/MzhOqXyh18B+tZxMc78ZH7fZ5a87CDXaKRVJMkOX0UoduuaShvRjfn4cU6+f8
	731wcoUILxoCYZ47qepe9co8GDkGQEqVrQL6Q6AZgmFGHqyx6x+KaaVwAG43tXl9IxEPXOqNejW
	/sHdeEIHA6IBd3vQs/mcjwogdDrmGnc61hHySTENF5tKVli5Ksk61leL8Ml8vfU/riSJXkfhTWE
	9k4RmGlBaLXuhNm4TIr44+5MNKOg3NgVL679Kbx8grZ2BZhYZd5/m3qrxFzFiayHqr0UxMJvBKa
	cYtpwdIzoKKwkRHDh+EHk13RNJ6NazZgZY9vGvjpxdo/JwVm2v34qCfZeB4S6QizeDUeN5RTJUE
	RpZVAlslxAfd+6tXeTjw/FyRX6S/WXZS/HqJ2mvfiVSqJzu3SnQ4MjwaO9cqtq5d3cxkNQP90fJ
	P9eHt
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186943

From: Wang Mingyu <wangmy@fujitsu.com>

0001-mc-replace-perl-w-with-use-warnings.patch
removed since it's included in 4.8.30

Changelog:
==========
- Core
--------
    * Support PCRE2 as search engine (via ----with-search-engine=pcre2) (#4450)
    * Implement panelization buffers for both file panels (#4370)

- VFS
-------
    * tar: support extended headers (including long file names and sparse files) (#1952, #2201)
    * extfs helpers: replace "perl -w" with "use warnings" (MidnightCommander/mc#174)
    * extfs/patchfs: be more specific in error message (#4485)

- Editor
---------
    * Add syntax highlighting:
        - Jenkinsfiles (#4469)
        - B language (#4470)
    * Improve syntax highlighting:
        - ECMAScript (MidnightCommander/mc#172)
        - ECMAScript in TypeScript (MidnightCommander/mc#172)
        - use diff syntax highlighting for git commit messages (COMMIT_EDITMSG) (MidnightCommander/mc#85)

- Misc
--------
    * Code cleanup (#4426, #4438)
    * Filehighlight:
        - recognize vsix files as zip files (MidnightCommander/mc#171)
    * Skin updates:
        - julia256 (#4441, #4445)

- Fixes
----------
    * Usage of 'sed' in build system/makefiles is not portable (#4459, #4466)
    * Unportable '$<' in Makefiles (#4460)
    * FTBFS if ncurses used without --with-ncurses-includes= configure parameter (#4462)
    * Ncurses library is duplicated in MCLIBS (#4463, #4465)
    * FTBFS without ext2fs attributes support (#4464)
    * Wrong sort order after swapping panels (#4432)
    * Incorrect time delimiter in the copy/move progress window (#4437)
    * Incorrect redraw of overlapped file panels (#4408)
    * Subshell/Command line prompt is empty/missing (#3121)
    * Find file: relative ignore directory is applied to the start search directory (#4235)
    * Diff viewer: options are not applied on second run (#4486)
    * mc.ext.ini: 'Edit' command from 'Default' section is ignored (#4434)
    * mc.ext.ini: .md files are not recognized as Markdown ones by extension (#4444)
    * mcedit: off-by-one error in paragraph formatting (#4446)
    * ftp: incomplete file listing: block and character devices, pipes, sockets are missed (#4472)
    * Various typos in the source code (MidnightCommander/mc#177, MidnightCommander/mc#178)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-mc-replace-perl-w-with-use-warnings.patch | 127 ------------------
 .../mc/{mc_4.8.29.bb => mc_4.8.30.bb}         |   3 +-
 2 files changed, 1 insertion(+), 129 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
 rename meta/recipes-extended/mc/{mc_4.8.29.bb => mc_4.8.30.bb} (95%)

diff --git a/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
deleted file mode 100644
index 5ede82d342..0000000000
--- a/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 62c86b69106d0d702167ba1b963ea1c201cce5af Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 6 Apr 2017 02:24:28 -0700
-Subject: [PATCH] mc: replace "perl -w" with "use warnings"
-
-The shebang's max length is usually 128 as defined in
-/usr/include/linux/binfmts.h:
-  #define BINPRM_BUF_SIZE 128
-
-There would be errors when @PERL@ is longer than 128, use
-'/usr/bin/env perl' can fix the problem, but '/usr/bin/env perl -w'
-doesn't work:
-
-/usr/bin/env: perl -w: No such file or directory
-
-So replace "perl -w" with "use warnings" to make it work.
-
-The man2hlp.in already has "use warnings;", so just remove '-w' is OK.
-
-Upstream-Status: Submitted [https://github.com/MidnightCommander/mc/pull/174]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- src/man2hlp/man2hlp.in           | 2 +-
- src/vfs/extfs/helpers/a+.in      | 4 +++-
- src/vfs/extfs/helpers/mailfs.in  | 3 ++-
- src/vfs/extfs/helpers/patchfs.in | 3 ++-
- src/vfs/extfs/helpers/ulib.in    | 4 +++-
- src/vfs/extfs/helpers/uzip.in    | 3 ++-
- 6 files changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/src/man2hlp/man2hlp.in b/src/man2hlp/man2hlp.in
-index 08765d8..8aa7131 100644
---- a/src/man2hlp/man2hlp.in
-+++ b/src/man2hlp/man2hlp.in
-@@ -1,4 +1,4 @@
--#! @PERL_FOR_BUILD@ -w
-+#! @PERL_FOR_BUILD@
- #
- #  Man page to help file converter
- #  Copyright (C) 1994, 1995, 1998, 2000, 2001, 2002, 2003, 2004, 2005,
-diff --git a/src/vfs/extfs/helpers/a+.in b/src/vfs/extfs/helpers/a+.in
-index 579441c..fe446f4 100644
---- a/src/vfs/extfs/helpers/a+.in
-+++ b/src/vfs/extfs/helpers/a+.in
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
- #
- # External filesystem for mc, using mtools
- # Written Ludek Brukner <lubr@barco.cz>, 1997
-@@ -9,6 +9,8 @@
- 
- # These mtools components must be in PATH for this to work
- 
-+use warnings;
-+
- sub quote {
-     $_ = shift(@_);
-     s/([^\w\/.+-])/\\$1/g;
-diff --git a/src/vfs/extfs/helpers/mailfs.in b/src/vfs/extfs/helpers/mailfs.in
-index 4bdd68b..5bb373b 100644
---- a/src/vfs/extfs/helpers/mailfs.in
-+++ b/src/vfs/extfs/helpers/mailfs.in
-@@ -1,6 +1,7 @@
--#! @PERL@ -w
-+#! @PERL@
- 
- use bytes;
-+use warnings;
- 
- # MC extfs for (possibly compressed) Berkeley style mailbox files
- # Peter Daum <gator@cs.tu-berlin.de> (Jan 1998, mc-4.1.24)
-diff --git a/src/vfs/extfs/helpers/patchfs.in b/src/vfs/extfs/helpers/patchfs.in
-index c20cd54..1f1e75b 100644
---- a/src/vfs/extfs/helpers/patchfs.in
-+++ b/src/vfs/extfs/helpers/patchfs.in
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
- #
- # Written by Adam Byrtek <alpha@debian.org>, 2002
- # Rewritten by David Sterba <dave@jikos.cz>, 2009
-@@ -9,6 +9,7 @@
- 
- use bytes;
- use strict;
-+use warnings;
- use POSIX;
- use File::Temp 'tempfile';
- 
-diff --git a/src/vfs/extfs/helpers/ulib.in b/src/vfs/extfs/helpers/ulib.in
-index 418611f..82c7ccf 100644
---- a/src/vfs/extfs/helpers/ulib.in
-+++ b/src/vfs/extfs/helpers/ulib.in
-@@ -1,9 +1,11 @@
--#! @PERL@ -w
-+#! @PERL@
- #
- # VFS to manage the gputils archives.
- # Written by Molnár Károly (proton7@freemail.hu) 2012
- #
- 
-+use warnings;
-+
- my %month = ('jan' => '01', 'feb' => '02', 'mar' => '03',
-              'apr' => '04', 'may' => '05', 'jun' => '06',
-              'jul' => '07', 'aug' => '08', 'sep' => '09',
-diff --git a/src/vfs/extfs/helpers/uzip.in b/src/vfs/extfs/helpers/uzip.in
-index c468f3a..ceffb53 100644
---- a/src/vfs/extfs/helpers/uzip.in
-+++ b/src/vfs/extfs/helpers/uzip.in
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
- #
- # zip file archive Virtual File System for Midnight Commander
- # Version 1.4.0 (2001-08-07).
-@@ -9,6 +9,7 @@
- use POSIX;
- use File::Basename;
- use strict;
-+use warnings;
- 
- #
- # Configuration options
diff --git a/meta/recipes-extended/mc/mc_4.8.29.bb b/meta/recipes-extended/mc/mc_4.8.30.bb
similarity index 95%
rename from meta/recipes-extended/mc/mc_4.8.29.bb
rename to meta/recipes-extended/mc/mc_4.8.30.bb
index e7f4aacc2e..258ac38e15 100644
--- a/meta/recipes-extended/mc/mc_4.8.29.bb
+++ b/meta/recipes-extended/mc/mc_4.8.30.bb
@@ -9,10 +9,9 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 RRECOMMENDS:${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
-           file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "ba6b2d8752806ac23fe045c1b081eb66dcefa6159205c79f86c005dcaf9941c1"
+SRC_URI[sha256sum] = "38171f22f889e3030ec9055463d3ecd7843984ab24e6497d8294d1c441a7ddb4"
 
 inherit autotools gettext pkgconfig
 
-- 
2.34.1


