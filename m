Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66F4C77358
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 03:28:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1Q3SwEm030394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 19:28:58 -0800
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 19:28:57 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Feb 2016 21:28:49 -0600
Message-ID: <004efb3aaa973dba030847c1c8218238f0cc68c5.1456456877.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456456877.git.mark.hatle@windriver.com>
References: <cover.1456456877.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3 v2] rpm: A number of the patches have been submitted upstream
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
X-List-Received-Date: Fri, 26 Feb 2016 03:28:57 -0000
Content-Type: text/plain

Note the upstream submission in the patches.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch            | 2 +-
 .../0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch   | 2 +-
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch                    | 2 +-
 .../rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch           | 2 +-
 meta/recipes-devtools/rpm/rpm/header-include-fix.patch                | 2 +-
 meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch             | 2 +-
 meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch               | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch                     | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch                  | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch             | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch         | 2 +-
 .../rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch                    | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch             | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch                  | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch                    | 2 +-
 .../rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch  | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch                 | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch      | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch             | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch                      | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch                     | 4 ++--
 meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch         | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch                    | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch    | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch                 | 2 +-
 .../rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch              | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch           | 2 +-
 meta/recipes-devtools/rpm/rpm/rpmatch.patch                           | 2 +-
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch                    | 2 +-
 30 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch b/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
index f5fcfec..c9fb268 100644
--- a/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
+++ b/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
@@ -1,6 +1,6 @@
 [PATCH] define EM_AARCH64
 
-Upstream-Status: pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 EM_AARCH64 maybe not be defined due to old version elf.h, and lead to
 that debugedit can not work on aarch64 elf object files, since there is
diff --git a/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch b/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
index 23bc336..7128250 100644
--- a/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
+++ b/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
@@ -4,7 +4,7 @@ Date: Tue, 11 Nov 2014 16:28:22 +0800
 Subject: [PATCH] using poptParseArgvString to parse the
  _gpg_check_password_cmd
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Both __gpg_check_password_cmd and __gpg_sign_cmd include "%{_gpg_name}", but
 strace shows that gpg_name has a quote when run _gpg_check_password,
diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
index 585cf12..c83c8b5 100644
--- a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
+++ b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
@@ -11,7 +11,7 @@ Note: in all other places a backup copy was used, just not buildid processing.
 Also the process (...) function was modified to verify the data is not
 NULL as well.  This is an extra check and is not strictly necessary.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch b/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
index f7c3100..8040482 100644
--- a/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
+++ b/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
@@ -14,7 +14,7 @@ Before the above operations, invoke elf_begin/elf_update/elf_end
 with ELF_C_RDWR and ELF_F_LAYOUT set to enlarge the above file, it
 could make sure the file is safe for the following elf operations.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  tools/debugedit.c | 25 +++++++++++++++++++++++++
diff --git a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
index 576ff00..e72df45 100644
--- a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
@@ -5,7 +5,7 @@ Using rpmdb.h w/o including errno.h may result in a warning.
 Using rpmtag.h w/o also adding stdint.h will result in numerous failures
 about unknown types on modern compilers.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Qing He <qing.he@intel.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
diff --git a/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch b/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
index 8fab9eb..5d936db 100644
--- a/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
+++ b/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
@@ -14,7 +14,7 @@ install-exec-am. It also removed the dependency in install-data-hook on
 install-pkgbinPROGRAMS. This means install-pkgbinPROGRAMS will only be run once
 so there whould be any file contention.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Morgan Little <morgan.little@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
index 471e6ea..590f58d 100644
--- a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
+++ b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
@@ -4,7 +4,7 @@ We want to see the RPMSENSE_SCRIPT values for use with SMART.  We also
 want to see the MISSINGOK value so we can avoid recommended packages causing
 failures.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
index 41ab498..81fc849 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
@@ -14,7 +14,7 @@ This patch changes the list of supported items to:
   <arch>-<vendor>-<os>
   <arch>-<vendor>-<os>-<extension>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
index 27a0a8d..290ec1a 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
@@ -1,7 +1,7 @@
 Occasionally the cp -p fails with a non-zero return code.  This will cause
 the system abort the build.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
index a6003ba..c57f24c 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
@@ -1,6 +1,6 @@
 Fix an issue where parseEmbedded is not defined, but is still used.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
index 5deb232..057925f 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
@@ -8,7 +8,7 @@ are found. We need to fix the caller to check the return code too.
 
 RP 2014/6/10
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Index: rpm-5.4.14/lib/fsm.c
 ===================================================================
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch b/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
index ed5d8a7..1a48db6 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
@@ -20,7 +20,7 @@ This caused the system to only permit a binary comparison - "new preferred" or
 else comparison the system will now perform a 'last-in-wins' resolution when
 "neither is preferred".
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
index 042e412..e87e02b 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
@@ -2,7 +2,7 @@ During installation, the libtool relink attempts to link to -lrpm...
 The problem is that it hasn't been installed yet!  So small change causes
 the libtool to instead use the build version.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch b/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
index 790a662..a87518b 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
@@ -5,7 +5,7 @@ appears to be invalid.  Instead of relying solely on the platform comparison
 we also want to generate a perceived platform based on the valid rpm contents
 of arch and os.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch b/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
index 9e324e5..6c3e471 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
@@ -1,6 +1,6 @@
 Fix errors when building with sasl2 disabled
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
index ab6ed2c..e58cc13 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
@@ -1,6 +1,6 @@
 lib/order.c: Make the dependency loop messages into debug msgs
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch b/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
index 07d586a..e219124 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
@@ -6,7 +6,7 @@ rpmpsmStage function(rpmVerifyScript->rpmpsmScriptStage->rpmpsmStage) and occur
 fault because of null point(rpmtsGetRdb(ts) == NULL and rpmtsGetRdb(ts)->db_txn).
 So we open rpmdb to avoid bad input when find headerIsEntry true.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
 Index: rpm-5.4.14/lib/verify.c
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
index c15e124..57fc6ce 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
@@ -2,7 +2,7 @@ Add the ability to query the packageorigin
 
 Written by jbj at rpm5.org
 
-Upstream-Status: Inappropriate [not author]
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
index 47470d2..af643b1 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
@@ -17,7 +17,7 @@ Patch taken from http://git.pld-linux.org/?p=packages/rpm.git;a=commitdiff;h=105
 
 RP 2014/6/10
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Index: rpm-5.4.14/build/files.c
 ===================================================================
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
index f26a6e7..200964f 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
@@ -2,7 +2,7 @@ Don't add the first line of /etc/rpm/platform to the list of patterns
 to match when computing an arch score, use it just for getting
 information about the platform (cpu/vendor/os). Fixes #3864.
 
-Upstream-Status: Inappropriate [embedded specific]
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Index: rpm-5.4.14/lib/rpmrc.c
 ===================================================================
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
index 11fd039..3b40fea 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
@@ -1,6 +1,6 @@
 Fix up platform and related sysinfo file loading.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 This ensures that RPM knows the compatible set of package types at all times.
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
index fed54e5..b9675c7 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
@@ -1,7 +1,5 @@
 Fix up platform and related sysinfo file loading (part 2).
 
-Upstream-Status: Pending
-
 We need to ensure that we set the _gnu flag somehow.  We do this by reading
 from the platform file, and setting a new _platform_gnu and related vars.
 
@@ -11,6 +9,8 @@ values.  The macros file uses the configure time defaults in _platform_...
 versions have not been defined.  This preserves existing behavior, but
 ensures reasonable defaults are always available.
 
+Upstream-Status: Submitted [RPM5 maintainer]
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 Index: rpm-5.4.14/lib/rpmrc.c
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch b/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
index e6aff52..7a473db 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
@@ -2,7 +2,7 @@ Fix an issue where the PACKAGEORIGIN is not properly stored.
 
 Restore the rpmtsCallback fdSetOpen call and related code.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch b/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
index 56a243d..526106d 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
@@ -3,7 +3,7 @@ lib/rpmts.c: Ensure that we check both providename and filepaths
 When looking up a missing dependencies, such as /bin/sh, we need to lookup
 in both the providename and filepaths DB, not just the filepaths DB.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
index a516574..b9a2cbc 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
@@ -9,7 +9,7 @@ getent: ELF 32-bit MSB executable, MIPS, N32 MIPS64 [snip]
 
 And "rpm -qp --filecolor" was wrong (it was 1, but should be 4).
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
index 49cdfca..9364576 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
@@ -1,6 +1,6 @@
 Fix a typo in the rpmio Makefile.am
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
index 683275c..5fb40b6 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
@@ -6,7 +6,7 @@ when the generating process is executed on different architectures.
 
 This patch resolves it by taking the byte order that host uses.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
 ---
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
index cb85beb..72d3509 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
@@ -1,5 +1,5 @@
 Source: None
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 Author: Khem Raj <raj.khem@gmail.com>
 Date: 2011-03-03
 Description:
diff --git a/meta/recipes-devtools/rpm/rpm/rpmatch.patch b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
index 2ededda..9bbf580 100644
--- a/meta/recipes-devtools/rpm/rpm/rpmatch.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
@@ -5,7 +5,7 @@ This uses an existing configure check.
 This is needed for uclibc since it does not have the above function
 implemented.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
index 3b4b924..dc7b048 100644
--- a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
+++ b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
@@ -1,6 +1,6 @@
 Define the x* wrappers for uclibc as well
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [RPM5 maintainer]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-- 
2.5.0


