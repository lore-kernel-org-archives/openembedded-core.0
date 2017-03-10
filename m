Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EED8C71C3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 03:43:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16404447"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Mar 2017 11:43:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6684C47D8B83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:43:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 10 Mar 2017 11:43:20 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Mar 2017 11:42:02 +0800
Message-ID: <1489117322-17601-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 6684C47D8B83.AE43C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] rpm: 5.4.16 -> 5.4.17
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
X-List-Received-Date: Fri, 10 Mar 2017 03:43:35 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

1) Upgrade rpm from 5.4.16 to 5.4.17
2) Delete 44 patches below, since they are integrated upstream.
    0001-Disable-__sync_add_and_fetch_8-on-nios2.patch
    0001-define-EM_AARCH64.patch
    0001-macros-add-_gpg_sign_cmd_extra_args.patch
    0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
    dbconvert.patch
    debugedit-segv.patch
    debugedit-valid-file-to-fix-segment-fault.patch
    header-include-fix.patch
    makefile-am-exec-hook.patch
    python-rpm-rpmsense.patch
    rpm-atomic-ops.patch
    rpm-canonarch.patch
    rpm-db_buffer_small.patch
    rpm-disable-blaketest.patch
    rpm-fix-logio-cp.patch
    rpm-fix-parseEmbedded.patch
    rpm-gnu-atomic.patch
    rpm-hardlink-segfault-fix.patch
    rpm-keccak-sse-intrin.patch
    rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
    rpm-libsql-fix.patch
    rpm-lsb-compatibility.patch
    rpm-mongodb-sasl.patch
    rpm-no-loopmsg.patch
    rpm-opendb-before-verifyscript-to-avoid-null-point.patch
    rpm-packageorigin.patch
    rpm-payload-use-hashed-inode.patch
    rpm-platform-file-fix.patch
    rpm-platform.patch
    rpm-platform2.patch
    rpm-py-init.patch
    rpm-python-AddErase.patch
    rpm-python-restore-origin.patch
    rpm-python-tagname.patch
    rpm-reloc-macros.patch
    rpm-resolvedep.patch
    rpm-rpmfc.c-fix-for-N32-MIPS64.patch
    rpm-rpmio-headers.patch
    rpm-tag-generate-endian-conversion-fix.patch
    rpm-tagname-type.patch
    rpm-tools-mtree-LDFLAGS.patch
    rpmatch.patch
    rpmqv_cc_b_gone.patch
    uclibc-support.patch
3) Modify 3 patches below to make it compatible with new version
    0001-rpm-Fix-build-on-musl.patch
    0001-system.h-query.c-support-nosignature.patch
    popt-disable-auto-stack-protector.patch
    rpm-db5-or-db6.patch
    rpm-db60.patch
    rpm-macros.patch
    rpm-rpmdb-grammar.patch
    rpm-syck-fix-gram.patch
4) Add 2 patches to fix build problem
    0001-Fix-a-build-error.patch
    Fix-a-fPIC-build-problem.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...1-Disable-__sync_add_and_fetch_8-on-nios2.patch |   30 -
 .../rpm/rpm/0001-Fix-a-build-error.patch           |   29 +
 .../rpm/rpm/0001-define-EM_AARCH64.patch           |   35 -
 .../0001-macros-add-_gpg_sign_cmd_extra_args.patch |   43 -
 .../rpm/rpm/0001-rpm-Fix-build-on-musl.patch       |  340 ++++---
 ...0001-system.h-query.c-support-nosignature.patch |   16 +-
 ...arseArgvString-to-parse-the-_gpg_check_pa.patch |   49 -
 .../rpm/rpm/Fix-a-fPIC-build-problem.patch         |   25 +
 meta/recipes-devtools/rpm/rpm/dbconvert.patch      |   27 -
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |  100 --
 ...debugedit-valid-file-to-fix-segment-fault.patch |   65 --
 .../rpm/rpm/header-include-fix.patch               |   36 -
 .../rpm/rpm/makefile-am-exec-hook.patch            |   33 -
 .../rpm/popt-disable-auto-stack-protector.patch    |   27 +-
 .../rpm/rpm/python-rpm-rpmsense.patch              |   31 -
 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |   73 --
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  136 ---
 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   61 +-
 meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   31 +-
 .../rpm/rpm/rpm-db_buffer_small.patch              |   77 --
 .../rpm/rpm/rpm-disable-blaketest.patch            |   28 -
 .../rpm/rpm/rpm-fix-logio-cp.patch                 |   30 -
 .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 -
 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch |   64 --
 .../rpm/rpm/rpm-hardlink-segfault-fix.patch        |   43 -
 .../rpm/rpm/rpm-keccak-sse-intrin.patch            |   27 -
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |   52 -
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |   22 -
 .../rpm/rpm/rpm-lsb-compatibility.patch            |   24 -
 meta/recipes-devtools/rpm/rpm/rpm-macros.patch     |   30 +-
 .../rpm/rpm/rpm-mongodb-sasl.patch                 |   69 --
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   19 -
 ...b-before-verifyscript-to-avoid-null-point.patch |   24 -
 .../rpm/rpm/rpm-packageorigin.patch                |   25 -
 .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |  126 ---
 .../rpm/rpm/rpm-platform-file-fix.patch            |   28 -
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |  137 ---
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |  105 --
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   29 -
 .../rpm/rpm/rpm-python-AddErase.patch              |   35 -
 .../rpm/rpm/rpm-python-restore-origin.patch        |   49 -
 .../rpm/rpm/rpm-python-tagname.patch               |   24 -
 .../rpm/rpm/rpm-reloc-macros.patch                 |   31 -
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |   40 -
 .../rpm/rpm/rpm-rpmdb-grammar.patch                |  102 +-
 .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |   34 -
 .../rpm/rpm/rpm-rpmio-headers.patch                |   19 -
 .../rpm/rpm/rpm-syck-fix-gram.patch                | 1051 ++------------------
 .../rpm-tag-generate-endian-conversion-fix.patch   |   50 -
 .../rpm/rpm/rpm-tagname-type.patch                 |   25 -
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |   24 -
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   34 -
 .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   50 -
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   63 --
 .../rpm/{rpm_5.4.16.bb => rpm_5.4.17.bb}           |  167 ++--
 55 files changed, 544 insertions(+), 3427 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-Fix-a-build-error.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-macros-add-_gpg_sign_cmd_extra_args.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/Fix-a-fPIC-build-problem.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/dbconvert.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/header-include-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.16.bb => rpm_5.4.17.bb} (80%)

diff --git a/meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch b/meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch
deleted file mode 100644
index e9b73b8..0000000
--- a/meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 06967a50f20095f5ca30b8214f4c98ba0f5262bf Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Sun, 3 Apr 2016 06:55:25 +0200
-Subject: [PATCH] Disable __sync_add_and_fetch_8 on nios2
-
-The NIOS2 softcore does not implement the __sync_add_and_fetch_8,
-so disable it accordingly.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Submitted
----
- rpmio/bson.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rpmio/bson.h b/rpmio/bson.h
-index 57023f1..60c7d02 100644
---- a/rpmio/bson.h
-+++ b/rpmio/bson.h
-@@ -880,7 +880,7 @@ BSON_END_DECLS
- BSON_BEGIN_DECLS
- 
- /* Some architectures do not support __sync_add_and_fetch_8 */
--#if (__mips == 32) || (defined(__PPC__) && !defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8))
-+#if (__mips == 32) || (__nios2__) || (defined(__PPC__) && !defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8))
- # define __BSON_NEED_ATOMIC_64 1
- #endif
- 
--- 
-2.8.0.rc3
-
diff --git a/meta/recipes-devtools/rpm/rpm/0001-Fix-a-build-error.patch b/meta/recipes-devtools/rpm/rpm/0001-Fix-a-build-error.patch
new file mode 100644
index 0000000..508040a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/0001-Fix-a-build-error.patch
@@ -0,0 +1,29 @@
+From 8db3d095c7cdb921c45a46cc31bb027edff460b8 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 8 Mar 2017 07:56:18 +0900
+Subject: [PATCH] Fix a build error.
+
+Because build tpm in build dir, so there is a build error as following:
+
+"ln: creating symbolic link `rpm/_rpm.so': No such file or directory"
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ python/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 8bcb92a..4ada35d 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -72,6 +72,7 @@ rpm:
+ 	@-cp $(srcdir)/rpm/transaction.py rpm/transaction.py
+ 
+ rpm/_rpm.so:	rpm
++	@mkdir -p rpm
+ 	@ln -sf ../.libs/_rpmmodule.so rpm/_rpm.so
+ 
+ rpm/_rpmb.so:	rpm
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch b/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
deleted file mode 100644
index c9fb268..0000000
--- a/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-[PATCH] define EM_AARCH64
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-EM_AARCH64 maybe not be defined due to old version elf.h, and lead to
-that debugedit can not work on aarch64 elf object files, since there is
-no other dependence, except these two macro, define them to make
-debugedit work on aarch64 elf files.
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- tools/debugedit.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/tools/debugedit.c b/tools/debugedit.c
-index de693ed..d16a641 100644
---- a/tools/debugedit.c
-+++ b/tools/debugedit.c
-@@ -35,6 +35,13 @@
- 
- #include <gelf.h>
- 
-+#ifndef EM_AARCH64
-+#define EM_AARCH64      183             /* ARM AARCH64 */
-+#endif
-+#ifndef R_AARCH64_ABS32
-+#define R_AARCH64_ABS32 258
-+#endif 
-+
- /* some defines taken from the dwarf standard */
- 
- #define DW_TAG_compile_unit	0x11
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/rpm/rpm/0001-macros-add-_gpg_sign_cmd_extra_args.patch b/meta/recipes-devtools/rpm/rpm/0001-macros-add-_gpg_sign_cmd_extra_args.patch
deleted file mode 100644
index eb43a87..0000000
--- a/meta/recipes-devtools/rpm/rpm/0001-macros-add-_gpg_sign_cmd_extra_args.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From fa9726ff69f86d6a87c4c4bd7e3d2881999a872a Mon Sep 17 00:00:00 2001
-From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
-Date: Thu, 23 Feb 2017 11:14:20 +0200
-Subject: [PATCH] macros: add %_gpg_sign_cmd_extra_args
-
-Similar to what rpm4 has. This macro can be used to customize the
-gpg command line options when signing packages. This is needed for
-gpg 2.1 which requires "--pinentry-mode loopback" to allow
-non-interactive signing.
-
-Upstream-Status: Pending
-
-Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
----
- macros/macros.in | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/macros/macros.in b/macros/macros.in
-index 8bc5840..fda3c66 100644
---- a/macros/macros.in
-+++ b/macros/macros.in
-@@ -524,7 +524,9 @@ $_arbitrary_tags_tests	Foo:Bar
- %_gpg_passphrase_way %{?_gpg_passphrase:--passphrase "%{_gpg_passphrase}"}%{!?_gpg_passphrase:--passphrase-fd 3}
- 
- %__gpg_check_password_cmd	%{__gpg} \
--	gpg --batch --no-verbose %{_gpg_passphrase_way} -u "%{_gpg_name}" -so -
-+	gpg --batch --no-verbose %{_gpg_passphrase_way} \
-+	%{?_gpg_sign_cmd_extra_args:%{_gpg_sign_cmd_extra_args}} \
-+	-u "%{_gpg_name}" -so -
- #%__pgp_check_password_cmd	%{__pgp} \
- #	pgp +batchmode=on +verbose=0 "%{_pgp_name}" -sf
- #%__pgp5_check_password_cmd	%{__pgp} \
-@@ -532,6 +534,7 @@ $_arbitrary_tags_tests	Foo:Bar
- 
- %__gpg_sign_cmd			%{__gpg} \
- 	gpg --batch --no-verbose --no-armor %{_gpg_passphrase_way}  --no-secmem-warning \
-+	%{?_gpg_sign_cmd_extra_args:%{_gpg_sign_cmd_extra_args}} \
- 	-u "%{_gpg_name}" -sbo %{__signature_filename} %{__plaintext_filename}
- #%__pgp_sign_cmd			%{__pgp} \
- #	pgp +batchmode=on +verbose=0 +armor=off \
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch b/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
index 70dd4ff..3c05572 100644
--- a/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
+++ b/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
@@ -1,10 +1,6 @@
-From 0af17c2ae86c1e8e42b96f6dface08f535bb55ad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Feb 2016 08:33:24 +0000
 Subject: [PATCH] rpm: Fix build on musl
 
-Provide alternatives to assumptions about glibc
-on linux
+Provide alternatives to assumptions about glibc on linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -15,29 +11,45 @@ due to the way MUSL changes are patched in.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
----
-Upstream-Status: Pending
+Updated to 5.4.17
 
- lib/poptALL.c          |    2 ++
- rpmio/fts.c            |    4 ++++
- rpmio/poptIO.c         |    2 ++
- rpmqv.c                |    2 ++
- system.h               |   13 ++++++-------
- tools/debugedit.c      |   47 +++++++++++++++++++++++++++++++++++++++++++++++
- tools/rpm2cpio.c       |    2 ++
- tools/rpmcache.c       |    2 ++
- tools/rpmcmp.c         |    2 ++
- tools/rpmdeps-oecore.c |    2 ++
- tools/rpmdeps.c        |    2 ++
- tools/rpmdigest.c      |    2 ++
- tools/rpmfind.c        |    6 +++---
- 13 files changed, 78 insertions(+), 10 deletions(-)
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ lib/poptALL.c          |  2 ++
+ rpmio/fts.c            |  4 ++++
+ rpmio/poptIO.c         |  2 ++
+ rpmqv.c                |  2 ++
+ rpmqv.cc               |  3 +++
+ system.h               | 13 ++++++-------
+ tools/debugedit.c      | 47 +++++++++++++++++++++++++++++++++++++++++++++++
+ tools/rpm2cpio.c       |  2 ++
+ tools/rpmcache.c       |  2 ++
+ tools/rpmcmp.c         |  2 ++
+ tools/rpmdeps-oecore.c |  2 ++
+ tools/rpmdeps.c        |  2 ++
+ tools/rpmdigest.c      |  2 ++
+ tools/rpmfind.c        |  6 +++---
+ 14 files changed, 81 insertions(+), 10 deletions(-)
 
-Index: rpm-5.4.15/rpmio/fts.c
-===================================================================
---- rpm-5.4.15.orig/rpmio/fts.c
-+++ rpm-5.4.15/rpmio/fts.c
-@@ -124,6 +124,10 @@ static char sccsid[] = "@(#)fts.c	8.6 (B
+diff --git a/lib/poptALL.c b/lib/poptALL.c
+index d2bffbe..2587517 100644
+--- a/lib/poptALL.c
++++ b/lib/poptALL.c
+@@ -4,7 +4,9 @@
+  */
+ 
+ #include "system.h"
++#ifdef __GLIBC__
+ extern const char *__progname;
++#endif
+ 
+ #if defined(RPM_VENDOR_WINDRIVER)
+ const char *__usrlibrpm = USRLIBRPM;
+diff --git a/rpmio/fts.c b/rpmio/fts.c
+index 862db13..d98fbe8 100644
+--- a/rpmio/fts.c
++++ b/rpmio/fts.c
+@@ -124,6 +124,10 @@ static char sccsid[] = "@(#)fts.c	8.6 (Berkeley) 8/14/94";
  #   define __fxstat64(_stat_ver, _fd, _sbp)    fstat((_fd), (_sbp))
  #endif
  
@@ -48,10 +60,76 @@ Index: rpm-5.4.15/rpmio/fts.c
  #if !defined(_D_EXACT_NAMLEN)
  #   define _D_EXACT_NAMLEN(d) (strlen((d)->d_name))
  #endif
-Index: rpm-5.4.15/tools/debugedit.c
-===================================================================
---- rpm-5.4.15.orig/tools/debugedit.c
-+++ rpm-5.4.15/tools/debugedit.c
+diff --git a/rpmio/poptIO.c b/rpmio/poptIO.c
+index 939125d..012ddb2 100644
+--- a/rpmio/poptIO.c
++++ b/rpmio/poptIO.c
+@@ -65,7 +65,9 @@ extern int _rpmsvn_debug;
+ GENfree(rpmioP)
+ #endif	/* __cplusplus */
+ 
++#ifdef __GLIBC__
+ const char *__progname;
++#endif
+ 
+ #if !defined(POPT_ARGFLAG_TOGGLE)	/* XXX compat with popt < 1.15 */
+ #define	POPT_ARGFLAG_TOGGLE	0
+diff --git a/rpmqv.c b/rpmqv.c
+index 38adaeb..b77ba51 100644
+--- a/rpmqv.c
++++ b/rpmqv.c
+@@ -1,5 +1,7 @@
+ #include "system.h"
++#ifdef __GLIBC__
+ extern const char *__progname;
++#endif
+ 
+ /* Copyright (C) 1998-2002 - Red Hat, Inc. */
+ 
+diff --git a/rpmqv.cc b/rpmqv.cc
+index 0485ddb..9152f11 100644
+--- a/rpmqv.cc
++++ b/rpmqv.cc
+@@ -1,5 +1,8 @@
+ #include "system.h"
++#ifdef __GLIBC__
+ extern const char *__progname;
++#endif
++
+ 
+ /* Copyright (C) 1998-2002 - Red Hat, Inc. */
+ 
+diff --git a/system.h b/system.h
+index 0952c25..18bd805 100644
+--- a/system.h
++++ b/system.h
+@@ -375,16 +375,15 @@ extern int _tolower(int) __THROW	/*@*/;
+ #define	__progname	__assert_program_name
+ #endif
+ #define	setprogname(pn)
++/*@unchecked@*/
++extern const char *__progname;
+ #else
+-#define	__progname	program_name
+-#define	setprogname(pn)	\
+-  { if ((__progname = strrchr(pn, '/')) != NULL) __progname++; \
+-    else __progname = pn;		\
+-  }
+-#endif
++#define	setprogname(pn)
++#define	progname	__progname
+ 
+ /*@unchecked@*/
+-extern const char *__progname;
++extern char *__progname;
++#endif
+ 
+ /* -- Retrofit missing prototypes (if needed). */
+ #ifdef __cplusplus
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index 3bef4ef..9ca4723 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
 @@ -22,7 +22,12 @@
  #include <byteswap.h>
  #include <endian.h>
@@ -65,7 +143,7 @@ Index: rpm-5.4.15/tools/debugedit.c
  #include <limits.h>
  #include <string.h>
  #include <stdlib.h>
-@@ -1535,6 +1540,48 @@ handle_build_id (DSO *dso, Elf_Data *bui
+@@ -1535,6 +1540,48 @@ handle_build_id (DSO *dso, Elf_Data *build_id,
      puts (hex);
    }
  }
@@ -114,96 +192,10 @@ Index: rpm-5.4.15/tools/debugedit.c
  
  /* It avoided the segment fault while file's bss offset have a large number.
     See https://bugzilla.redhat.com/show_bug.cgi?id=1019707
-Index: rpm-5.4.15/tools/rpmfind.c
-===================================================================
---- rpm-5.4.15.orig/tools/rpmfind.c
-+++ rpm-5.4.15/tools/rpmfind.c
-@@ -1175,7 +1175,7 @@ find_parsenum(PLAN *plan, const char *op
-      * and endchar points to the beginning of the string we know we have
-      * a syntax error.
-      */
--#if defined(__sun)
-+#if defined(__sun) || !defined(__GLIBC_)
-     value = strtoll(str, &endchar, 10);
- #else
-     value = strtoq(str, &endchar, 10);
-@@ -1215,7 +1215,7 @@ find_parsetime(PLAN *plan, const char *o
- 	break;
-     }
- 
--#if defined(__sun)
-+#if defined(__sun) || !defined(__GLIBC_)
-     value = strtoll(str, &unit, 10);
- #else
-     value = strtoq(str, &unit, 10);
-@@ -1253,7 +1253,7 @@ find_parsetime(PLAN *plan, const char *o
- 	str = unit + 1;
- 	if (*str == '\0')	/* EOS */
- 	    break;
--#if defined(__sun)
-+#if defined(__sun) || !defined(__GLIBC_)
- 	value = strtoll(str, &unit, 10);
- #else
- 	value = strtoq(str, &unit, 10);
-Index: rpm-5.4.15/system.h
-===================================================================
---- rpm-5.4.15.orig/system.h
-+++ rpm-5.4.15/system.h
-@@ -372,16 +372,15 @@ extern int _tolower(int) __THROW	/*@*/;
- #define	__progname	__assert_program_name
- #endif
- #define	setprogname(pn)
-+/*@unchecked@*/
-+extern const char *__progname;
- #else
--#define	__progname	program_name
--#define	setprogname(pn)	\
--  { if ((__progname = strrchr(pn, '/')) != NULL) __progname++; \
--    else __progname = pn;		\
--  }
--#endif
-+#define	setprogname(pn)
-+#define	progname	__progname
- 
- /*@unchecked@*/
--extern const char *__progname;
-+extern char *__progname;
-+#endif
- 
- /* -- Retrofit missing prototypes (if needed). */
- #ifdef __cplusplus
-Index: rpm-5.4.15/rpmio/poptIO.c
-===================================================================
---- rpm-5.4.15.orig/rpmio/poptIO.c
-+++ rpm-5.4.15/rpmio/poptIO.c
-@@ -65,7 +65,9 @@ extern int _rpmsvn_debug;
- GENfree(rpmioP)
- #endif	/* __cplusplus */
- 
-+#ifdef __GLIBC__
- const char *__progname;
-+#endif
- 
- #if !defined(POPT_ARGFLAG_TOGGLE)	/* XXX compat with popt < 1.15 */
- #define	POPT_ARGFLAG_TOGGLE	0
-Index: rpm-5.4.15/lib/poptALL.c
-===================================================================
---- rpm-5.4.15.orig/lib/poptALL.c
-+++ rpm-5.4.15/lib/poptALL.c
-@@ -4,7 +4,9 @@
-  */
- 
- #include "system.h"
-+#ifdef __GLIBC__
- extern const char *__progname;
-+#endif
- 
- #if defined(RPM_VENDOR_WINDRIVER)
- const char *__usrlibrpm = USRLIBRPM;
-Index: rpm-5.4.15/tools/rpm2cpio.c
-===================================================================
---- rpm-5.4.15.orig/tools/rpm2cpio.c
-+++ rpm-5.4.15/tools/rpm2cpio.c
+diff --git a/tools/rpm2cpio.c b/tools/rpm2cpio.c
+index 87b54df..2ee7359 100644
+--- a/tools/rpm2cpio.c
++++ b/tools/rpm2cpio.c
 @@ -1,7 +1,9 @@
  /* rpmarchive: spit out the main archive portion of a package */
  
@@ -214,10 +206,10 @@ Index: rpm-5.4.15/tools/rpm2cpio.c
  
  #include <rpmio.h>
  #include <rpmiotypes.h>	/* XXX fnpyKey */
-Index: rpm-5.4.15/tools/rpmcache.c
-===================================================================
---- rpm-5.4.15.orig/tools/rpmcache.c
-+++ rpm-5.4.15/tools/rpmcache.c
+diff --git a/tools/rpmcache.c b/tools/rpmcache.c
+index 2e24192..58343e6 100644
+--- a/tools/rpmcache.c
++++ b/tools/rpmcache.c
 @@ -3,7 +3,9 @@
   */
  
@@ -228,10 +220,25 @@ Index: rpm-5.4.15/tools/rpmcache.c
  
  #include <fnmatch.h>
  #include <fts.h>
-Index: rpm-5.4.15/tools/rpmdeps-oecore.c
-===================================================================
---- rpm-5.4.15.orig/tools/rpmdeps-oecore.c
-+++ rpm-5.4.15/tools/rpmdeps-oecore.c
+diff --git a/tools/rpmcmp.c b/tools/rpmcmp.c
+index 2800580..7921572 100644
+--- a/tools/rpmcmp.c
++++ b/tools/rpmcmp.c
+@@ -13,8 +13,10 @@
+ 
+ #include "debug.h"
+ 
++#ifdef __GLIBC__
+ const char *__progname;
+ #define	progname	__progname
++#endif
+ 
+ static int pointRpmEVR(ARGV_t av)
+ {
+diff --git a/tools/rpmdeps-oecore.c b/tools/rpmdeps-oecore.c
+index e646da9..134cdf6 100644
+--- a/tools/rpmdeps-oecore.c
++++ b/tools/rpmdeps-oecore.c
 @@ -1,5 +1,7 @@
  #include "system.h"
 +#ifdef __GLIBC__
@@ -240,10 +247,10 @@ Index: rpm-5.4.15/tools/rpmdeps-oecore.c
  
  #include <rpmio.h>
  #include <rpmiotypes.h>
-Index: rpm-5.4.15/tools/rpmdeps.c
-===================================================================
---- rpm-5.4.15.orig/tools/rpmdeps.c
-+++ rpm-5.4.15/tools/rpmdeps.c
+diff --git a/tools/rpmdeps.c b/tools/rpmdeps.c
+index 57a21d5..a1c301d 100644
+--- a/tools/rpmdeps.c
++++ b/tools/rpmdeps.c
 @@ -1,5 +1,7 @@
  #include "system.h"
 +#ifdef __GLIBC__
@@ -252,10 +259,10 @@ Index: rpm-5.4.15/tools/rpmdeps.c
  
  #include <rpmio.h>
  #include <rpmiotypes.h>
-Index: rpm-5.4.15/tools/rpmdigest.c
-===================================================================
---- rpm-5.4.15.orig/tools/rpmdigest.c
-+++ rpm-5.4.15/tools/rpmdigest.c
+diff --git a/tools/rpmdigest.c b/tools/rpmdigest.c
+index e7dd8cc..767b9b3 100644
+--- a/tools/rpmdigest.c
++++ b/tools/rpmdigest.c
 @@ -1,6 +1,8 @@
  #include "system.h"
 +#ifdef __GLIBC__
@@ -265,30 +272,37 @@ Index: rpm-5.4.15/tools/rpmdigest.c
  
  #define	_RPMIOB_INTERNAL
  #include <rpmiotypes.h>
-Index: rpm-5.4.15/tools/rpmcmp.c
-===================================================================
---- rpm-5.4.15.orig/tools/rpmcmp.c
-+++ rpm-5.4.15/tools/rpmcmp.c
-@@ -13,8 +13,10 @@
- 
- #include "debug.h"
- 
-+#ifdef __GLIBC__
- const char *__progname;
- #define	progname	__progname
-+#endif
- 
- static int pointRpmEVR(ARGV_t av)
- {
-Index: rpm-5.4.15/rpmqv.c
-===================================================================
---- rpm-5.4.15.orig/rpmqv.c
-+++ rpm-5.4.15/rpmqv.c
-@@ -1,5 +1,7 @@
- #include "system.h"
-+#ifdef __GLIBC__
- extern const char *__progname;
-+#endif
- 
- /* Copyright (C) 1998-2002 - Red Hat, Inc. */
+diff --git a/tools/rpmfind.c b/tools/rpmfind.c
+index f1dbb29..6d186f6 100644
+--- a/tools/rpmfind.c
++++ b/tools/rpmfind.c
+@@ -1179,7 +1179,7 @@ find_parsenum(PLAN *plan, const char *option, char *vp, char *endch)
+      * and endchar points to the beginning of the string we know we have
+      * a syntax error.
+      */
+-#if defined(__sun)
++#if defined(__sun) || !defined(__GLIBC_)
+     value = strtoll(str, &endchar, 10);
+ #else
+     value = strtoq(str, &endchar, 10);
+@@ -1219,7 +1219,7 @@ find_parsetime(PLAN *plan, const char *option, char *vp)
+ 	break;
+     }
  
+-#if defined(__sun)
++#if defined(__sun) || !defined(__GLIBC_)
+     value = strtoll(str, &unit, 10);
+ #else
+     value = strtoq(str, &unit, 10);
+@@ -1257,7 +1257,7 @@ find_parsetime(PLAN *plan, const char *option, char *vp)
+ 	str = unit + 1;
+ 	if (*str == '\0')	/* EOS */
+ 	    break;
+-#if defined(__sun)
++#if defined(__sun) || !defined(__GLIBC_)
+ 	value = strtoll(str, &unit, 10);
+ #else
+ 	value = strtoq(str, &unit, 10);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch b/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
index 77dc5b6..33a98aa 100644
--- a/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
+++ b/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
@@ -11,16 +11,17 @@ Subject: [PATCH] system.h/query.c: support nosignature
 Upstream-Status: Submitted [Sent email to rpm-devel@rpm5.org]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
  lib/query.c | 6 +++---
  system.h    | 4 ++--
  2 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/lib/query.c b/lib/query.c
-index 50a7453..b761d76 100644
+index f1c5dcd..78f8ce8 100644
 --- a/lib/query.c
 +++ b/lib/query.c
-@@ -954,19 +954,19 @@ JBJDEBUG((stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, qva, argv));
+@@ -958,19 +958,19 @@ JBJDEBUG((stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, qva, argv));
      vsflags = (rpmVSFlags) rpmExpandNumeric("%{?_vsflags_query}");
      vsflags = (rpmVSFlags) 0;	/* XXX FIXME: ignore default disablers. */
  #if defined(SUPPORT_NOSIGNATURES)
@@ -44,11 +45,11 @@ index 50a7453..b761d76 100644
      }
      VSF_CLR(vsflags, NEEDPAYLOAD);	/* XXX needed? */
 diff --git a/system.h b/system.h
-index 2ff8906..ad4619a 100644
+index f5af7e7..0952c25 100644
 --- a/system.h
 +++ b/system.h
-@@ -787,9 +787,9 @@ static inline const char *rcsid(const char *p) { \
- #define SUPPORT_I18NSTRING_TYPE	1
+@@ -786,9 +786,9 @@ static inline const char *rcsid(const char *p) { \
+ #undef	SUPPORT_I18NSTRING_TYPE
  
  /**
 - * Eliminate signature/digest disablers.
@@ -56,8 +57,9 @@ index 2ff8906..ad4619a 100644
   */
 -#undef	SUPPORT_NOSIGNATURES
 +#define SUPPORT_NOSIGNATURES 1
+ #undef	SUPPORT_NODIGESTS
  
  /**
-  * Permit ar(1) payloads. Disabled while rpmio/iosm.c is under development.
 -- 
-2.9.0
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch b/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
deleted file mode 100644
index 7128250..0000000
--- a/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 64851c6622aff64787a9fcea26cccde183b7c743 Mon Sep 17 00:00:00 2001
-From: "Roy.Li" <rongqing.li@windriver.com>
-Date: Tue, 11 Nov 2014 16:28:22 +0800
-Subject: [PATCH] using poptParseArgvString to parse the
- _gpg_check_password_cmd
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Both __gpg_check_password_cmd and __gpg_sign_cmd include "%{_gpg_name}", but
-strace shows that gpg_name has a quote when run _gpg_check_password,
-but not when run __gpg_sign_cmd; for example, if gpg_name is "tester"
-
-    execve("/usr/bin/gpg", ["gpg", "--batch", "--no-verbose",
-    "--passphrase-fd", "3", "-u", "\"tester\"", "-so", "-"], [/* 20 vars */]) = 0
-
-    execve("/usr/bin/gpg", ["gpg", "--batch", "--no-verbose", "--no-armor",
-    "--passphrase-fd", "3", "--no-secmem-warning", "-u", "tester", "-sbo"..,) = 0
-
-it can be fixed by removing the quote around %{gpg_name} when define
-__gpg_check_password_cmd in macros/macros, like below, but if gpg_name includes
-space, it will not work.
-
-     %__gpg_check_password_cmd       %{__gpg} \
-        gpg --batch --no-verbose --passphrase-fd 3 -u %{_gpg_name} -so -
-
-The poptParseArgvString function is used to parse _gpg_sign_cmd, so using
-poptParseArgvString to parse __gpg_check_password_cmd to fix this issue.
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- rpmdb/signature.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rpmdb/signature.c b/rpmdb/signature.c
-index c35e0ab..016e8d1 100644
---- a/rpmdb/signature.c
-+++ b/rpmdb/signature.c
-@@ -529,7 +529,7 @@ int rpmCheckPassPhrase(const char * passPhrase)
-   		(void) setenv("GNUPGHOME", gpg_path, 1);
- 
- 	    cmd = rpmExpand("%{?__gpg_check_password_cmd}", NULL);
--	    rc = argvSplit(&av, cmd, NULL);
-+	    rc = poptParseArgvString(cmd, NULL, (const char ***)&av);
- 	    if (!rc)
- 		rc = execve(av[0], (char *const *)av+1, environ);
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/rpm/rpm/Fix-a-fPIC-build-problem.patch b/meta/recipes-devtools/rpm/rpm/Fix-a-fPIC-build-problem.patch
new file mode 100644
index 0000000..8ee3f0b
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/Fix-a-fPIC-build-problem.patch
@@ -0,0 +1,25 @@
+Subject: [PATCH] fix a fPIC build problem
+
+meet the issue as below when compile rpm-navive
+/usr/bin/ld: duktape.o: relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with –fPIC
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ rpmio/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rpmio/Makefile.am b/rpmio/Makefile.am
+index 5f69345..7e6a713 100644
+--- a/rpmio/Makefile.am
++++ b/rpmio/Makefile.am
+@@ -639,6 +639,6 @@ duktape.o: duktape.c duktape.h
+ 	$(COMPILE) $(duk_CFLAGS) -c -o $@ $<
+ 
+ duk_SOURCES = duk.c
+-duk_CFLAGS = -Os -pedantic -std=c99 -Wall -Wno-suggest-attribute=pure -fstrict-aliasing -fomit-frame-pointer -DDUK_OPT_SELF_TESTS -DDUK_CMDLINE_FANCY
++duk_CFLAGS = -Os -pedantic -std=c99 -Wall -Wno-suggest-attribute=pure -fstrict-aliasing -fomit-frame-pointer -DDUK_OPT_SELF_TESTS -DDUK_CMDLINE_FANCY -fPIC
+ duk_LDADD = duktape.o -lreadline -lncurses -lm
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/dbconvert.patch b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
deleted file mode 100644
index 1fdbf09..0000000
--- a/meta/recipes-devtools/rpm/rpm/dbconvert.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate
-
-Hack to prevent unneeded demo app from building on older libc
-where it will break the build
-
-Index: rpm-5.4.14/tools/Makefile.am
-===================================================================
---- rpm-5.4.14.orig/tools/Makefile.am
-+++ rpm-5.4.14/tools/Makefile.am
-@@ -29,7 +29,7 @@ EXTRA_PROGRAMS = nix-copy-closure nix-en
- 	xiu-instantiate xiu-store
- noinst_PROGRAMS =
- 
--EXTRA_PROGRAMS += augtool cudftool dbconvert debugedit \
-+EXTRA_PROGRAMS += augtool cudftool debugedit \
- 	nix-build nix-channel nix-collect-garbage \
- 	nix-log2xml nix-prefetch-url nix-pull nix-push \
- 	xiu-echo xiu-hash \
-@@ -64,7 +64,7 @@ pkgbin_PROGRAMS =	\
- 	rpmcache rpmdigest rpmrepo rpmspecdump \
- 	rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
- if WITH_DB
--pkgbin_PROGRAMS +=	dbconvert
-+pkgbin_PROGRAMS +=	
- endif
- dist_man_MANS =		rpmgrep.1
- 
diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
deleted file mode 100644
index c83c8b5..0000000
--- a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-During the recalculation of the buildid, it's necessary to change the word
-back to the original endian.  However, if we do this in-place, we've also
-affected the headers that we're also working on.  The side effect of this is
-we can no longer rely on 'sh_type' as it may have been changed.
-
-This patch ensures that any time we translate the loaded data to the machine
-format, we only do it in a backup copy and never the original copy.
-
-Note: in all other places a backup copy was used, just not buildid processing.
-
-Also the process (...) function was modified to verify the data is not
-NULL as well.  This is an extra check and is not strictly necessary.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/tools/debugedit.c
-===================================================================
---- rpm.orig/tools/debugedit.c
-+++ rpm/tools/debugedit.c
-@@ -1403,7 +1403,8 @@ static inline void process (hashFunction
- 		const void *data, size_t size)
- {
-     memchunk chunk = { .data = (void *) data, .size = size };
--    hashFunctionContextUpdateMC (ctx, &chunk);
-+    if (data != NULL && size != 0)
-+      hashFunctionContextUpdateMC (ctx, &chunk);
- }
- 
- /* Compute a fresh build ID bit-string from the editted file contents.  */
-@@ -1456,14 +1457,16 @@ handle_build_id (DSO *dso, Elf_Data *bui
-       GElf_Ehdr ehdr;
-       GElf_Phdr phdr;
-       GElf_Shdr shdr;
--    } u;
--    Elf_Data x = { .d_version = EV_CURRENT, .d_buf = &u };
--
--    x.d_type = ELF_T_EHDR;
--    x.d_size = sizeof u.ehdr;
--    u.ehdr = dso->ehdr;
--    u.ehdr.e_phoff = u.ehdr.e_shoff = 0;
--    if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
-+    } u1, u2;
-+    Elf_Data src  = { .d_version = EV_CURRENT, .d_buf = &u1 };
-+    Elf_Data dest = { .d_version = EV_CURRENT, .d_buf = &u2 };
-+
-+    src.d_type = ELF_T_EHDR;
-+    src.d_size = sizeof u1.ehdr;
-+    dest.d_size = sizeof u2.ehdr;
-+    u1.ehdr = dso->ehdr;
-+    u1.ehdr.e_phoff = u1.ehdr.e_shoff = 0;
-+    if (elf64_xlatetom (&dest, &src, dso->ehdr.e_ident[EI_DATA]) == NULL)
-       {
-       bad:
- 	fprintf (stderr, "Failed to compute header checksum: %s\n",
-@@ -1471,29 +1474,31 @@ handle_build_id (DSO *dso, Elf_Data *bui
- 	exit (1);
-       }
- 
--    x.d_type = ELF_T_PHDR;
--    x.d_size = sizeof u.phdr;
-+    src.d_type = ELF_T_PHDR;
-+    src.d_size = sizeof u1.phdr;
-+    dest.d_size = sizeof u2.phdr;
-     for (i = 0; i < dso->ehdr.e_phnum; ++i)
-       {
--	if (gelf_getphdr (dso->elf, i, &u.phdr) == NULL)
-+	if (gelf_getphdr (dso->elf, i, &u1.phdr) == NULL)
- 	  goto bad;
--	if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
-+	if (elf64_xlatetom (&dest, &src, dso->ehdr.e_ident[EI_DATA]) == NULL)
- 	  goto bad;
--	process (&ctx, x.d_buf, x.d_size);
-+	process (&ctx, dest.d_buf, dest.d_size);
-       }
- 
--    x.d_type = ELF_T_SHDR;
--    x.d_size = sizeof u.shdr;
-+    src.d_type = ELF_T_SHDR;
-+    src.d_size = sizeof u1.shdr;
-+    dest.d_size = sizeof u2.shdr;
-     for (i = 0; i < dso->ehdr.e_shnum; ++i)
-       if (dso->scn[i] != NULL)
- 	{
--	  u.shdr = dso->shdr[i];
--	  u.shdr.sh_offset = 0;
--	  if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
-+	  u1.shdr = dso->shdr[i];
-+	  u1.shdr.sh_offset = 0;
-+	  if (elf64_xlatetom (&dest, &src, dso->ehdr.e_ident[EI_DATA]) == NULL)
- 	    goto bad;
--	  process (&ctx, x.d_buf, x.d_size);
-+	  process (&ctx, dest.d_buf, dest.d_size);
- 
--	  if (u.shdr.sh_type != SHT_NOBITS)
-+	  if (u1.shdr.sh_type != SHT_NOBITS)
- 	    {
- 	      Elf_Data *d = elf_rawdata (dso->scn[i], NULL);
- 	      if (d == NULL)
diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch b/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
deleted file mode 100644
index 8040482..0000000
--- a/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-debugedit: fix segment fault while file's bss offset have a large number
-
-While ELF_C_RDWR_MMAP was used, elf_begin invoked mmap() to map file
-into memory. While the file's bss Offset has a large number, elf_update
-caculated file size by __elf64_updatenull_wrlock and the size was
-enlarged.
-
-In this situation, elf_update invoked ftruncate to enlarge the file,
-and memory size (elf->maximum_size) also was incorrectly updated.
-There was segment fault in elf_end which invoked munmap with the
-length is the enlarged file size, not the mmap's length.
-
-Before the above operations, invoke elf_begin/elf_update/elf_end
-with ELF_C_RDWR and ELF_F_LAYOUT set to enlarge the above file, it
-could make sure the file is safe for the following elf operations.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tools/debugedit.c | 25 +++++++++++++++++++++++++
- 1 file changed, 25 insertions(+)
-
-Index: rpm-5.4.14/tools/debugedit.c
-===================================================================
---- rpm-5.4.14.orig/tools/debugedit.c
-+++ rpm-5.4.14/tools/debugedit.c
-@@ -1525,6 +1525,28 @@ handle_build_id (DSO *dso, Elf_Data *bui
-   }
- }
- 
-+/* It avoided the segment fault while file's bss offset have a large number.
-+   See https://bugzilla.redhat.com/show_bug.cgi?id=1019707
-+       https://bugzilla.redhat.com/show_bug.cgi?id=1020842 for detail. */
-+void valid_file(int fd)
-+{
-+  Elf *elf = elf_begin (fd, ELF_C_RDWR, NULL);
-+  if (elf == NULL)
-+  {
-+    error (1, 0, "elf_begin: %s", elf_errmsg (-1));
-+    return;
-+  }
-+
-+  elf_flagelf (elf, ELF_C_SET, ELF_F_LAYOUT);
-+
-+  if (elf_update (elf, ELF_C_WRITE) < 0)
-+    error (1, 0, "elf_update: %s", elf_errmsg (-1));
-+
-+  elf_end (elf);
-+
-+  return;
-+}
-+
- int
- main (int argc, char *argv[])
- {
-@@ -1621,6 +1643,9 @@ main (int argc, char *argv[])
-       exit (1);
-     }
- 
-+  /* Make sure the file is valid. */
-+  valid_file(fd);
-+
-   dso = fdopen_dso (fd, file);
-   if (dso == NULL)
-     exit (1);
diff --git a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
deleted file mode 100644
index e72df45..0000000
--- a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Update two rpm headers to include other headers.
-
-Using rpmdb.h w/o including errno.h may result in a warning.
-
-Using rpmtag.h w/o also adding stdint.h will result in numerous failures
-about unknown types on modern compilers.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Qing He <qing.he@intel.com>
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/rpmdb/rpmdb.h
-===================================================================
---- rpm-5.4.14.orig/rpmdb/rpmdb.h
-+++ rpm-5.4.14/rpmdb/rpmdb.h
-@@ -9,6 +9,7 @@
- 
- #include <assert.h>
- #include <mire.h>
-+#include <errno.h>
- 
- #include <rpmtypes.h>
- #include <rpmtag.h>	/* XXX Header typedef */
-Index: rpm-5.4.14/rpmdb/rpmtag.h
-===================================================================
---- rpm-5.4.14.orig/rpmdb/rpmtag.h
-+++ rpm-5.4.14/rpmdb/rpmtag.h
-@@ -7,6 +7,7 @@
- 
- #include <rpmiotypes.h>
- #include <rpmsw.h>
-+#include <stdint.h>
- 
- #ifdef __cplusplus
- extern "C" {
diff --git a/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch b/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
deleted file mode 100644
index 5d936db..0000000
--- a/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-rpm: Resolve parallel install issue when installing lua
-
-When lua is being installed on some systems that are being run with high levels
-of parallelization there are cases where install-data-am and install-exec-hook
-are processed at the same or a very short time apart. This causes
-install-pkgbinPROGRAMS, which is a dependency of both, to be run at around the
-same time This sometimes causes file contention and will sometimes be in a state
-where install-exec-hook is looking for a file that is being installed or both
-install-pkgbinPROGRAMS being run are installing the same file and fail because
-it cannon create a new file.
-
-This patch allows install-exec-hook to be called by install-data-am instead of
-install-exec-am. It also removed the dependency in install-data-hook on
-install-pkgbinPROGRAMS. This means install-pkgbinPROGRAMS will only be run once
-so there whould be any file contention.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Morgan Little <morgan.little@windriver.com>
-
-Index: rpm-5.4.14/lua/Makefile.am
-===================================================================
---- rpm-5.4.14.orig/lua/Makefile.am
-+++ rpm-5.4.14/lua/Makefile.am
-@@ -326,7 +326,7 @@ clean-local:
- # XXX Build & install as rpmlua/rpmluac with hardlinks to lua/luac post install.
- # XXX CVS has lua/luac sub-directories in the Attic that collide with the
- # XXX lua/luac executable names when using cvs update.
--install-exec-hook:	install-pkgbinPROGRAMS
-+install-data-hook:	
- 	mkdir -p $(DESTDIR)$(pkgbindir)
- 	$(__RM) -f $(DESTDIR)$(pkgbindir)/lua
- 	$(__LN) $(DESTDIR)$(pkgbindir)/rpmlua $(DESTDIR)$(pkgbindir)/lua
diff --git a/meta/recipes-devtools/rpm/rpm/popt-disable-auto-stack-protector.patch b/meta/recipes-devtools/rpm/rpm/popt-disable-auto-stack-protector.patch
index bcad8dc..42dc1de 100644
--- a/meta/recipes-devtools/rpm/rpm/popt-disable-auto-stack-protector.patch
+++ b/meta/recipes-devtools/rpm/rpm/popt-disable-auto-stack-protector.patch
@@ -3,20 +3,24 @@ popt: Disable default stack protection on internal version of popt
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ popt/configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
-Index: rpm-5.4.15/popt/configure.ac
-===================================================================
---- rpm-5.4.15.orig/popt/configure.ac
-+++ rpm-5.4.15/popt/configure.ac
-@@ -123,7 +123,6 @@ AS_IF([test "x$popt_gcc_warnings" = xyes
-   popt_CFLAGS_ADD([-Wjump-misses-init],[POPT_CFLAGS])
-   popt_CFLAGS_ADD([-Wno-format-nonliteral],[POPT_CFLAGS])
-   popt_CFLAGS_ADD([-Wframe-larger-than=$MAX_STACK_SIZE],[POPT_CFLAGS])
--  popt_CFLAGS_ADD([-fstack-protector-all],[POPT_CFLAGS])
+diff --git a/popt/configure.ac b/popt/configure.ac
+index 0eb6012..3bb0794 100755
+--- a/popt/configure.ac
++++ b/popt/configure.ac
+@@ -73,7 +73,6 @@ AS_IF([test "x$popt_gcc_warnings" = xyes],
    popt_CFLAGS_ADD([-fasynchronous-unwind-tables],[POPT_CFLAGS])
    popt_CFLAGS_ADD([-fdiagnostics-show-option],[POPT_CFLAGS])
+   popt_CFLAGS_ADD([-fipa-pure-const],[POPT_CFLAGS])
+-  popt_CFLAGS_ADD([-fstack-protector-all],[POPT_CFLAGS])
+   popt_CFLAGS_ADD([-fstrict-aliasing],[POPT_CFLAGS])
+   popt_CFLAGS_ADD([-fstrict-overflow],[POPT_CFLAGS])
    popt_CFLAGS_ADD([-funit-at-a-time],[POPT_CFLAGS])
-@@ -203,7 +202,7 @@ AC_SUBST([POPT_LDFLAGS])
+@@ -216,7 +215,7 @@ AC_SUBST([POPT_LDFLAGS])
  # -fno-delete-null-pointer as the kernel does http://patchwork.kernel.org/patch/36060/
  # GNU GCC (usually "gcc")
  AS_IF([test "x$GCC" != x],
@@ -25,3 +29,6 @@ Index: rpm-5.4.15/popt/configure.ac
     do
    	popt_CFLAGS_ADD([$c], [POPT_CFLAGS])
     done
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
deleted file mode 100644
index 590f58d..0000000
--- a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-rpmmodule.c: Export a few additional RPMSENSE values
-
-We want to see the RPMSENSE_SCRIPT values for use with SMART.  We also
-want to see the MISSINGOK value so we can avoid recommended packages causing
-failures.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/python/rpmmodule.c
-===================================================================
---- rpm.orig/python/rpmmodule.c
-+++ rpm/python/rpmmodule.c
-@@ -525,12 +525,15 @@ static int initModule(PyObject *m)
-     REGISTER_ENUM(RPMSENSE_PREREQ);
-     REGISTER_ENUM(RPMSENSE_PRETRANS);
-     REGISTER_ENUM(RPMSENSE_INTERP);
-+#else
-+ #if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
-     REGISTER_ENUM(RPMSENSE_SCRIPT_PRE);
-     REGISTER_ENUM(RPMSENSE_SCRIPT_POST);
-     REGISTER_ENUM(RPMSENSE_SCRIPT_PREUN);
-     REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN);
-     REGISTER_ENUM(RPMSENSE_SCRIPT_VERIFY);
--#else
-+    REGISTER_ENUM(RPMSENSE_MISSINGOK);
-+ #endif
-     REGISTER_ENUM(RPMSENSE_NOTEQUAL);
- #endif
-     REGISTER_ENUM(RPMSENSE_FIND_REQUIRES);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch b/meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
deleted file mode 100644
index cc241f4..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Some architectures do not have __sync_add_and_fetch_8 implemented.
-
-MIPS (32-bit) and some PPC systems do not have sync_add_and_fetch_8.
-
-Provide an alternative.  This alternative function is based on code from:
-  https://github.com/mongodb/libbson/blob/master/src/bson/bson-atomic.c
-
-Code is under an Apache 2.0 License.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.15/rpmio/bson.h
-===================================================================
---- rpm-5.4.15.orig/rpmio/bson.h
-+++ rpm-5.4.15/rpmio/bson.h
-@@ -879,10 +879,18 @@ BSON_END_DECLS
- 
- BSON_BEGIN_DECLS
- 
-+/* Some architectures do not support __sync_add_and_fetch_8 */
-+#if (__mips == 32) || (defined(__PPC__) && !defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8))
-+# define __BSON_NEED_ATOMIC_64 1
-+#endif
- 
- #if defined(__GNUC__)
- # define bson_atomic_int_add(p, v)   (__sync_add_and_fetch(p, v))
--# define bson_atomic_int64_add(p, v) (__sync_add_and_fetch_8(p, v))
-+#ifndef __BSON_NEED_ATOMIC_64
-+#  define bson_atomic_int64_add(p, v) (__sync_add_and_fetch_8(p, v))
-+# else
-+   int64_t bson_atomic_int64_add (volatile int64_t *p, int64_t n);
-+# endif
- # define bson_memory_barrier         __sync_synchronize
- #elif defined(_MSC_VER) || defined(_WIN32)
- # define bson_atomic_int_add(p, v)   (InterlockedExchangeAdd((long int *)(p), v))
-Index: rpm-5.4.15/rpmio/bson.c
-===================================================================
---- rpm-5.4.15.orig/rpmio/bson.c
-+++ rpm-5.4.15/rpmio/bson.c
-@@ -3863,13 +3863,30 @@ _bson_context_get_oid_seq64_threadsafe (
- #elif defined BSON_OS_WIN32
-    uint64_t seq = InterlockedIncrement64 ((int64_t *)&context->seq64);
- #else
--   uint64_t seq = __sync_fetch_and_add_8 (&context->seq64, 1);
-+   uint64_t seq = bson_atomic_int64_add (&context->seq64, 1);
- #endif
- 
-    seq = BSON_UINT64_TO_BE (seq);
-    memcpy (&oid->bytes[4], &seq, 8);
- }
- 
-+#ifdef __BSON_NEED_ATOMIC_64
-+#include <pthread.h>
-+static pthread_mutex_t gSync64 = PTHREAD_MUTEX_INITIALIZER;
-+int64_t
-+bson_atomic_int64_add (volatile int64_t *p,
-+                       int64_t           n)
-+{
-+   int64_t ret;
-+
-+   pthread_mutex_lock (&gSync64);
-+   *p += n;
-+   ret = *p;
-+   pthread_mutex_unlock (&gSync64);
-+
-+   return ret;
-+}
-+#endif
- 
- /**
-  * bson_context_new:
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
deleted file mode 100644
index 81fc849..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-lib/rpmrc.c: Update --target processing to support full GNU canonical arch
-
-Prior to this patch, when using --target, RPM supported the format:
-  <arch>
-  <arch>-<os>
-  <arch>-<os>-gnu
-  <arch>-<arbitrary items>-<os>
-  <arch>-<arbitrary items>-<os>-gnu
-
-This patch changes the list of supported items to:
-  <arch>
-  <arch>-<os>
-  <arch>-<os>-gnu
-  <arch>-<vendor>-<os>
-  <arch>-<vendor>-<os>-<extension>
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/lib/rpmrc.c
-===================================================================
---- rpm-5.4.14.orig/lib/rpmrc.c
-+++ rpm-5.4.14/lib/rpmrc.c
-@@ -925,8 +925,8 @@ static void getMachineInfo(int type, /*@
- 
- static void rpmRebuildTargetVars(const char ** target, const char ** canontarget)
- {
--
--    char *ca = NULL, *co = NULL, *ct = NULL;
-+    /* ca = arch, cv = vendor, co = os, ce = extension, ct = canon target */
-+    char *ca = NULL, *cv = NULL, *co = NULL, *ce = NULL, *ct = NULL;
-     int x;
- 
-     /* Rebuild the compat table to recalculate the current target arch.  */
-@@ -936,23 +936,60 @@ static void rpmRebuildTargetVars(const c
-     rpmSetTables(RPM_MACHTABLE_BUILDARCH, RPM_MACHTABLE_BUILDOS);
- 
-     if (target && *target) {
-+	/* GNU canonical format is:
-+	 *  <arch>-<vendor>-<os>[-extension]
-+	 *
-+	 * We support the both the GNU canonical format
-+	 * as well as the traditional RPM formats: 
-+	 *  <arch>
-+	 *  <arch>-<os>[-gnu]
-+	 */
- 	char *c;
- 	/* Set arch and os from specified build target */
- 	ca = xstrdup(*target);
--	if ((c = strchr(ca, '-')) != NULL) {
-+	if ((c = strchr(ca, '-')) == NULL) {
-+	    /* Format is <arch> */
-+	    ;
-+	} else {
- 	    *c++ = '\0';
--	    
--	    if ((co = strrchr(c, '-')) == NULL) {
--		co = c;
-+	    cv = c;
-+
-+	    if ((c = strchr(c, '-')) == NULL) {
-+		/* Format is <arch>-<os> */
-+		co = cv;
-+		cv = NULL;
- 	    } else {
--		if (!xstrcasecmp(co, "-gnu"))
--		    *co = '\0';
--		if ((co = strrchr(c, '-')) == NULL)
--		    co = c;
--		else
--		    co++;
-+		*c++ = '\0';
-+		co = c;
-+
-+		if ((c = strchr(c, '-')) == NULL) {
-+		    /* Might be:
-+		     *  <arch>-<vendor>-<os>
-+		     *  <arch>-<os>-gnu
-+		     */
-+		    if (!xstrcasecmp(co, "gnu")) {
-+			/* Format was <arch>-<os>-gnu */
-+			ce = co;
-+			co = cv;
-+			cv = NULL;
-+		    }
-+		} else {
-+		    /* Format was <arch>-<vendor>-<os>-<extension> */
-+		    *c++ = '\0';
-+		    ce = c;
-+		}
- 	    }
-+	    if (cv != NULL) cv = xstrdup(cv);
- 	    if (co != NULL) co = xstrdup(co);
-+	    if (ce != NULL) {
-+		/* We need to prefix it with a "-" */
-+		char * lce = NULL;
-+
-+		lce = xmalloc(strlen(ce) + sizeof("-"));
-+		sprintf(lce, "-%s", ce);
-+
-+		ce = lce;
-+	    }
- 	}
-     } else {
- 	const char *a = NULL;
-@@ -995,8 +1032,16 @@ static void rpmRebuildTargetVars(const c
-     addMacro(NULL, "_target", NULL, ct, RMIL_RPMRC);
-     delMacro(NULL, "_target_cpu");
-     addMacro(NULL, "_target_cpu", NULL, ca, RMIL_RPMRC);
-+    if (cv) {
-+	delMacro(NULL, "_target_vendor");
-+	addMacro(NULL, "_target_vendor", NULL, cv, RMIL_RPMRC);
-+    }
-     delMacro(NULL, "_target_os");
-     addMacro(NULL, "_target_os", NULL, co, RMIL_RPMRC);
-+    if (ce) {
-+	delMacro(NULL, "_gnu");
-+	addMacro(NULL, "_gnu", NULL, ce, RMIL_RPMRC);
-+    }
- 
-     if (canontarget)
- 	*canontarget = ct;
-@@ -1004,8 +1049,12 @@ static void rpmRebuildTargetVars(const c
- 	ct = _free(ct);
-     ca = _free(ca);
-     /*@-usereleased@*/
-+    cv = _free(cv);
-+    /*@-usereleased@*/
-     co = _free(co);
-     /*@=usereleased@*/
-+    ce = _free(ce);
-+    /*@-usereleased@*/
- }
- 
- void rpmFreeRpmrc(void)
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
index 5d08d27..e5f3b36 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
@@ -6,24 +6,25 @@ Subject: [PATCH] Support both db5 and db6.
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- configure.ac | 103 ++++++++++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 81 insertions(+), 22 deletions(-)
+ configure.ac | 104 ++++++++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 82 insertions(+), 22 deletions(-)
 
-Index: rpm/configure.ac
-===================================================================
---- rpm.orig/configure.ac
-+++ rpm/configure.ac
-@@ -871,8 +871,6 @@ else
+diff --git a/configure.ac b/configure.ac
+index 6907d00..4303067 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1082,8 +1082,6 @@ else
      MYPATH=$PATH
  fi
  
--DBXY=db61
+-DBXY=db62
 -
  AC_PATH_PROG(__BASH, bash, %{_bindir}/bash, $MYPATH)
  AC_PATH_PROG(__BZIP2, bzip2, %{_bindir}/bzip2, $MYPATH)
  AC_PATH_PROG(__CAT, cat, /bin/cat, $MYPATH)
-@@ -884,22 +882,6 @@ AC_PATH_PROG(__CMAKE, cmake, %{_bindir}/
+@@ -1095,22 +1093,6 @@ AC_PATH_PROG(__CMAKE, cmake, %{_bindir}/cmake, $MYPATH)
  AC_PATH_PROG(__CPIO, cpio, /bin/cpio, $MYPATH)
  AC_PATH_PROG(__CURL, curl, %{_bindir}/curl, $MYPATH)
  AC_PATH_PROG(__CVS, cvs, %{_bindir}/cvs, $MYPATH)
@@ -46,7 +47,7 @@ Index: rpm/configure.ac
  AC_PATH_PROG(__DIFF, diff, /bin/diff, $MYPATH)
  AC_PATH_PROG(__DITTO, ditto, %{_bindir}/ditto, $MYPATH)
  AC_PATH_PROG(__FILE, file, %{_bindir}/file, $MYPATH)
-@@ -2050,13 +2032,46 @@ RPM_CHECK_LIB(
+@@ -2292,13 +2274,46 @@ RPM_CHECK_LIB(
  
  dnl # Berkeley-DB & SQLite
  DBLIBSRCS=""
@@ -69,7 +70,7 @@ Index: rpm/configure.ac
 +]])],
 +[RPM_CHECK_LIB(
      [Berkeley-DB], [db],
-     [db-6.1], [db_create], [db.h],
+     [db-6.2], [db_create], [db.h],
 -    [yes,external], [db3],
 +    [yes,external], [db6],
      [ DBLIBSRCS="$DBLIBSRCS db3.c"
@@ -96,40 +97,29 @@ Index: rpm/configure.ac
        AM_CONDITIONAL(WITH_DB, [ true ])
        AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
        if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
-@@ -2068,6 +2083,11 @@ RPM_CHECK_LIB(
+@@ -2310,6 +2325,12 @@ RPM_CHECK_LIB(
      [ AM_CONDITIONAL(WITH_DB, [ false ])
        AM_CONDITIONAL(WITH_DB_INTERNAL, [ false ])
      ])
 +])
 +
-+if test ".$ac_cv_lib_db_6_1_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
++if test ".$ac_cv_lib_db_6_2_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
 +    CPPFLAGS="${CPPFLAGS_save}"
 +fi
++
  
  dnl # Sqlite external
  RPM_CHECK_LIB(
-@@ -2078,10 +2098,11 @@ RPM_CHECK_LIB(
+@@ -2320,10 +2341,29 @@ RPM_CHECK_LIB(
      [])
  
  dnl # Sqlite 3.8.3.1 from db-6.1.19
-+if test ".$ac_cv_lib_db_6_1_db_create" = .yes; then
++if test ".$ac_cv_lib_db_6_2_db_create" = .yes; then
  RPM_CHECK_LIB(
      [Berkeley-DB (+SQLite3)], [dbsql],
-     [db_sql-6.1], [sqlite3_open], [dbsql.h],
+     [db_sql-6.2], [sqlite3_open], [dbsql.h],
 -    [yes,external], [db3/sql],
 +    [yes,external], [db6/sql],
-     [
-       AM_CONDITIONAL(WITH_DBSQL, [ true ])
-       AC_DEFINE(WITH_SQLITE, 1, [Define as 1 if building with SQLite library])
-@@ -2095,12 +2116,50 @@ RPM_CHECK_LIB(
-     ], [
-       AM_CONDITIONAL(WITH_DBSQL, [ false ])
-     ])
-+elif test ".$ac_cv_lib_db_5_3_db_create" = .yes; then
-+RPM_CHECK_LIB(
-+    [Berkeley-DB (+SQLite3)], [dbsql],
-+    [db_sql-5.3], [sqlite3_open], [dbsql.h],
-+    [yes,external], [db53/sql],
 +    [
 +      AM_CONDITIONAL(WITH_DBSQL, [ true ])
 +      AC_DEFINE(WITH_SQLITE, 1, [Define as 1 if building with SQLite library])
@@ -143,6 +133,18 @@ Index: rpm/configure.ac
 +    ], [
 +      AM_CONDITIONAL(WITH_DBSQL, [ false ])
 +    ])
++elif test ".$ac_cv_lib_db_5_3_db_create" = .yes; then
++RPM_CHECK_LIB(
++    [Berkeley-DB (+SQLite3)], [dbsql],
++    [db_sql-5.3], [sqlite3_open], [dbsql.h],
++    [yes,external], [db53/sql],
+     [
+       AM_CONDITIONAL(WITH_DBSQL, [ true ])
+       AC_DEFINE(WITH_SQLITE, 1, [Define as 1 if building with SQLite library])
+@@ -2337,12 +2377,32 @@ RPM_CHECK_LIB(
+     ], [
+       AM_CONDITIONAL(WITH_DBSQL, [ false ])
+     ])
 +else
 +AM_CONDITIONAL(WITH_DBSQL, [ false ])
 +fi
@@ -172,3 +174,6 @@ Index: rpm/configure.ac
  AC_ARG_WITH(db-largefile, AS_HELP_STRING([--with-db-largefile], [build Berkeley-DB with LARGEFILE support]))
  AC_ARG_WITH(db-mutex,     AS_HELP_STRING([--with-db-mutex=ARG], [build Berkeley-DB with MUTEX type ARG]))
  
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
index b4df8b7..a776993 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
@@ -3,16 +3,20 @@ Set the DB 6 version to match oe-core db 6.0.30
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ configure.ac | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
 
-Index: rpm/configure.ac
-===================================================================
---- rpm.orig/configure.ac
-+++ rpm/configure.ac
-@@ -2049,10 +2049,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+diff --git a/configure.ac b/configure.ac
+index 4303067..0ce9d0e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2291,10 +2291,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
  ]])],
  [RPM_CHECK_LIB(
      [Berkeley-DB], [db],
--    [db-6.1], [db_create], [db.h],
+-    [db-6.2], [db_create], [db.h],
 +    [db-6.0], [db_create], [db.h],
      [yes,external], [db6],
      [ DBLIBSRCS="$DBLIBSRCS db3.c"
@@ -21,31 +25,31 @@ Index: rpm/configure.ac
        AM_CONDITIONAL(WITH_DB, [ true ])
        AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
        if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
-@@ -2085,7 +2085,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+@@ -2327,7 +2327,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
      ])
  ])
  
--if test ".$ac_cv_lib_db_6_1_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
+-if test ".$ac_cv_lib_db_6_2_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
 +if test ".$ac_cv_lib_db_6_0_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
      CPPFLAGS="${CPPFLAGS_save}"
  fi
  
-@@ -2097,11 +2097,11 @@ RPM_CHECK_LIB(
+@@ -2340,11 +2340,11 @@ RPM_CHECK_LIB(
      [ DBLIBSRCS="$DBLIBSRCS sqlite.c" ],
      [])
  
 -dnl # Sqlite 3.8.3.1 from db-6.1.19
--if test ".$ac_cv_lib_db_6_1_db_create" = .yes; then
+-if test ".$ac_cv_lib_db_6_2_db_create" = .yes; then
 +dnl # Sqlite 3.8.3.1 from db-6.0.30
 +if test ".$ac_cv_lib_db_6_0_db_create" = .yes; then
  RPM_CHECK_LIB(
      [Berkeley-DB (+SQLite3)], [dbsql],
--    [db_sql-6.1], [sqlite3_open], [dbsql.h],
+-    [db_sql-6.2], [sqlite3_open], [dbsql.h],
 +    [db_sql-6.0], [sqlite3_open], [dbsql.h],
      [yes,external], [db6/sql],
      [
        AM_CONDITIONAL(WITH_DBSQL, [ true ])
-@@ -2253,7 +2253,7 @@ AC_SUBST(WITH_RUBY_CPPFLAGS)
+@@ -2496,7 +2496,7 @@ AC_SUBST(WITH_RUBY_CPPFLAGS)
  AC_SUBST(WITH_RUBY_SUBDIR)
  AC_SUBST(WITH_RUBY_VENDORARCHDIR)
  
@@ -54,3 +58,6 @@ Index: rpm/configure.ac
  WITH_JAVA=no
  AC_ARG_WITH([java],
      AS_HELP_STRING([--with-java], [build RPM with java support]),
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch b/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
deleted file mode 100644
index 16b8e30..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-In certain cases with BerkleyDB 5.3.x we are getting the error:
-
-db3.c:1443: dbcursor->pget(-30999): BDB0063 DB_BUFFER_SMALL: User memory too small for return value
-
-See https://bugs.launchpad.net/rpm/+bug/934420 for more information.
-
-It appears to be some type of a bug in the BerkleyDB 5.3.x.  In an attempt
-to workaround the problem, when we encounter this situation we attempt
-to adjust the size of the mmap buffer until the call works, or we
-end up trying 10 times.  The new size is either the updated vp->size
-from the failed pget call, or the previous size + 1024.
-
-If DBI debugging is enabled, additional diagnostics are printed, otherwise
-a basic retry and success message is added to show that the failure was
-resolved.
-
-Upstream-Status: Inappropriate (workaround)
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/rpmdb/rpmdb.c
-===================================================================
---- rpm-5.4.14.orig/rpmdb/rpmdb.c
-+++ rpm-5.4.14/rpmdb/rpmdb.c
-@@ -2212,8 +2212,12 @@ static int rpmmiGet(dbiIndex dbi, DBC *
- 	vp->flags |= DB_DBT_USERMEM;
- 	rc = dbiGet(dbi, dbcursor, kp, vp, flags);
- 	if (rc == DB_BUFFER_SMALL) {
-+	    int retry = 0;
-+	    size_t origlen = vp->size;
- 	    size_t uhlen = vp->size;
--	    void * uh = mmap(NULL, uhlen, _prot, _flags, _fdno, _off);
-+	    void * uh;
-+retry_get:
-+	    uh = mmap(NULL, uhlen, _prot, _flags, _fdno, _off);
- 	    if (uh == NULL || uh == (void *)-1)
- 		fprintf(stderr,
- 		    "==> mmap(%p[%u], 0x%x, 0x%x, %d, 0x%x) error(%d): %s\n",
-@@ -2235,6 +2239,25 @@ static int rpmmiGet(dbiIndex dbi, DBC *
- 		if (munmap(uh, uhlen) != 0)
- 		    fprintf(stderr, "==> munmap(%p[%u]) error(%d): %s\n",
-                 	uh, (unsigned)uhlen, errno, strerror(errno));
-+	        /* We want to be sure to limit the number of retry attempts to avoid a loop! */
-+	        if (rc == DB_BUFFER_SMALL && retry < 10) {
-+		   /* If we got a largr vp-size back, use that, otherwise increment the size by 1k */
-+	           uhlen = vp->size > uhlen ? vp->size : uhlen + 1024;
-+		   retry++;
-+	           if ((dbi)->dbi_debug)
-+	               fprintf(stderr, "==> DB_BUFFER_SMALL orig requested (%d), configured (%d), forcing larger buffer (%d), new size (%d)\n",
-+	                    origlen, vp->ulen, uhlen, vp->size);
-+	           else
-+	               fprintf(stderr, "==> retry (%d) db3cpget (%d)\n", retry, uhlen);
-+	           goto retry_get;
-+	        }
-+	    }
-+	    if (retry) {
-+	        if ((dbi)->dbi_debug)
-+	           fprintf(stderr, "==> success orig requested (%d), configured buffer (%d), buffer (%d), size after dbiGet (%d)\n",
-+			origlen, vp->ulen, uhlen, vp->size);
-+	        else
-+	           fprintf(stderr, "==> success\n");
- 	    }
- 	}
-     } else
-Index: rpm-5.4.14/rpmdb/db3.c
-===================================================================
---- rpm-5.4.14.orig/rpmdb/db3.c
-+++ rpm-5.4.14/rpmdb/db3.c
-@@ -1509,7 +1509,7 @@ assert(db != NULL);
- #endif
-     }
- 
--DBIDEBUG(dbi, (stderr, "<-- %s(%p,%p,%p,%p,%p,0x%x) rc %d %s%s\n", __FUNCTION__, dbi, dbcursor, key, pkey, data, flags, rc, _DBCFLAGS(flags), _KEYDATA(key, pkey, data, NULL)));
-+DBIDEBUG(dbi, (stderr, "<-- %s(%p,%p,%p,%p,%p,0x%x) rc %d %s%s\n", __FUNCTION__, dbi, dbcursor, key, pkey, data, flags, rc, _DBCFLAGS(flags), _KEYDATA(key, pkey, rc == DB_BUFFER_SMALL ? NULL : data, NULL)));
-     return rc;
- }
- /*@=mustmod@*/
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch b/meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch
deleted file mode 100644
index adbef6d..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-rpmio: Disable building of the tblake2 test(s).
-
-There is some type of a dependency fault here that can occasionally result in:
-
-gcc: error: tblake2b.o: No such file or directory
-or
-gcc: error: tblake2bp.o: No such file or directory
-
-These items are simply test cases that are not packaged, so they can be
-safely disabled to resolve the dependency issue.
-
-Upstream-Status: Inappropriate [workaround]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.15/rpmio/Makefile.am
-===================================================================
---- rpm-5.4.15.orig/rpmio/Makefile.am
-+++ rpm-5.4.15/rpmio/Makefile.am
-@@ -29,7 +29,7 @@ EXTRA_PROGRAMS += bsdiff bspatch pcrsed
- 	tmire todbc toid tperl tpython tput trpmio tsexp tsvn tsw ttcl \
- 	dumpasn1 lookup3 trel twitter github tmicrojson duk
- 
--noinst_PROGRAMS += b2sum tset tblake2b tblake2bp tblake2s tblake2sp tgfs
-+#noinst_PROGRAMS += b2sum tset tblake2b tblake2bp tblake2s tblake2sp tgfs
- if WITH_LIBGIT2
- noinst_PROGRAMS += tgit
- else
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
deleted file mode 100644
index 290ec1a..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Occasionally the cp -p fails with a non-zero return code.  This will cause
-the system abort the build.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/rpmdb/Makefile.am
-===================================================================
---- rpm.orig/rpmdb/Makefile.am
-+++ rpm/rpmdb/Makefile.am
-@@ -234,11 +234,14 @@ lcov-report:
- #lcov-upload: lcov
- #	rsync -rvz -e ssh --delete lcov/* ???
- 
-+$(builddir)/logio_recover_template: $(srcdir)/logio_recover_template
-+	@if test ".$(builddir)" != ".$(srcdir)"; then \
-+		cp -fp $(srcdir)/logio_recover_template \
-+		      $(builddir)/logio_recover_template ; \
-+	 fi
-+
- logio_BUILT = logio_auto.c logio_autop.c logio_auto.h logio_template
--$(logio_BUILT):	logio.awk logio.src logio_recover_template
--	@test -e $(builddir)/logio_recover_template || \
--		cp -p $(srcdir)/logio_recover_template \
--		      $(builddir)/logio_recover_template
-+$(logio_BUILT):	logio.awk logio.src $(builddir)/logio_recover_template
- 	@rm -f $(logio_BUILT)
- 	@$(AWK) -f $(srcdir)/logio.awk \
- 		-v header_file=logio_auto.h \
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
deleted file mode 100644
index c57f24c..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Fix an issue where parseEmbedded is not defined, but is still used.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/rpmio/macro.c
-===================================================================
---- rpm.orig/rpmio/macro.c
-+++ rpm/rpmio/macro.c
-@@ -1616,8 +1616,6 @@ exit:
-  * @retval *avp		invocation args
-  * @return		script string
-  */
--#if defined(WITH_AUGEAS) || defined(WITH_FICL) || defined(WITH_MOZJS) || defined(WITH_JNIEMBED) || defined(WITH_PERLEMBED) || defined(WITH_PYTHONEMBED) || defined(WITH_RUBYEMBED) || defined(WITH_MRUBY_EMBED) || defined(WITH_SQLITE) || defined(WITH_SQUIRREL) || defined(WITH_TCL)
--
- static char _FIXME_embedded_interpreter_eval_returned_null[] =
-     "FIXME: embedded interpreter eval returned null.";
- 
-@@ -1668,7 +1666,6 @@ bingo:
-     script[nb] = '\0';
-     return script;
- }
--#endif
- 
- /**
-  * The main macro recursion loop.
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch b/meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch
deleted file mode 100644
index 36a418f..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-configure.ac: Check if the current compiler supports the transactions
-
-Some distributions appear to have compilers that are built without support
-for transactions, even though they are GCC 4.7 or newer.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.15/configure.ac
-===================================================================
---- rpm-5.4.15.orig/configure.ac
-+++ rpm-5.4.15/configure.ac
-@@ -425,9 +425,34 @@ dnl # --- other optimizations
-   rpm_CFLAGS_ADD([-D_FORTIFY_SOURCE=2 -fstack-protector], [RPM_CFLAGS])
- dnl #  rpm_CFLAGS_ADD([-fstack-protector-all],[RPM_CFLAGS])
- 
--     if test \( ".`$CC --version 2>&1 | grep 'GCC'`" != . \); then
--         rpm_CFLAGS_ADD([-fgnu-tm], [RPM_CFLAGS])
--     fi
-+dnl # Check if the current gcc supports -fgnu-tm and __transaction_atomic
-+AC_MSG_CHECKING([If the compiler supports __transaction_atomic])
-+save_CFLAGS="$CFLAGS"
-+save_LDFLAGS="$LDFLAGS"
-+CFLAGS="${CFLAGS} -fgnu-tm -litm"
-+LDFLAGS="${LDFLAGS} -litm"
-+AC_LINK_IFELSE([AC_LANG_SOURCE([[
-+int
-+main()
-+{
-+#if !__clang__ &&  ((__GNUC__ == 4 && __GNUC_MINOR__ >= 7) || (__GNUC__ > 4)) /* XXX gud enuf? */
-+        int i = 0;
-+        __transaction_atomic { i++; }
-+#else
-+# error Compiler does not support __transaction_atomic
-+#endif
-+        return 0;
-+}
-+]])], [
-+        AC_DEFINE([HAVE_GNUC_TM_ATOMIC], [1],
-+                [Define to 1 if the compiler supports __transaction_atomic.])
-+        AC_MSG_RESULT([yes])
-+], [
-+	CFLAGS="$save_CFLAGS"
-+	LDFLAGS="$save_LDFLAGS"
-+	AC_MSG_RESULT([no])
-+])
-+
- 
- dnl # --- options below are added to RPM_CFLAGS but _NOT_ added to CFLAGS
-             CPPFLAGS="$CPPFLAGS $RPM_CPPFLAGS"
-Index: rpm-5.4.15/rpmio/rpmutil.h
-===================================================================
---- rpm-5.4.15.orig/rpmio/rpmutil.h
-+++ rpm-5.4.15/rpmio/rpmutil.h
-@@ -105,7 +105,7 @@
- #  define RPM_GNUC_INTERNAL
- #endif
- 
--#if !__clang__ &&  __GNUC__ == 4 && __GNUC_MINOR__ >= 7	/* XXX gud enuf? */
-+#ifdef HAVE_GNUC_TM_ATOMIC
- #  define RPM_GNUC_TM_SAFE	__attribute__((transaction_safe))
- #  define RPM_GNUC_TM_PURE	__attribute__((transaction_pure))
- #  define RPM_GNUC_TM_CALLABLE	__attribute__((transaction_callable))
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
deleted file mode 100644
index 057925f..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-We need to sanity check that the nlink size and our linksLeft counter
-do match. If an rpm is badly constructed with identical inode values
-for multiple hardlinked files, such an rpm will otherwise access memory
-out of array bounds and cause memory corruption and crashes.
-
-The fix is to add in the sanity check and exit if bad circumstances
-are found. We need to fix the caller to check the return code too.
-
-RP 2014/6/10
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Index: rpm-5.4.14/lib/fsm.c
-===================================================================
---- rpm-5.4.14.orig/lib/fsm.c
-+++ rpm-5.4.14/lib/fsm.c
-@@ -495,6 +495,11 @@ static int saveHardLink(/*@special@*/ /*
-     }
- 
-     if (fsm->goal == IOSM_PKGBUILD) --fsm->li->linksLeft;
-+    if (fsm->li->linksLeft > st->st_nlink) {
-+	rpmlog(RPMLOG_ERR, _("Corrupted hardlinks found (count %d does not match %d), exiting.\n"), fsm->li->linksLeft, st->st_nlink);
-+	return -1;
-+    }
-+
-     fsm->li->filex[fsm->li->linksLeft] = fsm->ix;
-     /*@-observertrans -dependenttrans@*/
-     fsm->li->nsuffix[fsm->li->linksLeft] = fsm->nsuffix;
-@@ -1878,8 +1883,13 @@ if (!(fsmGetFi(fsm)->mapflags & IOSM_PAY
- 	fsm->postpone = iosmFileActionSkipped(fsm->action);
- 	if (fsm->goal == IOSM_PKGINSTALL || fsm->goal == IOSM_PKGBUILD) {
- 	    /*@-evalorder@*/ /* FIX: saveHardLink can modify fsm */
--	    if (S_ISREG(st->st_mode) && st->st_nlink > 1)
-+	    if (S_ISREG(st->st_mode) && st->st_nlink > 1) {
- 		fsm->postpone = saveHardLink(fsm);
-+		if (fsm->postpone < 0) {
-+		    rc = RPMRC_FAIL;
-+		    break;
-+		}
-+	    }
- 	    /*@=evalorder@*/
- 	}
- if (fsmGetFi(fsm)->mapflags & IOSM_PAYLOAD_LIST) fsm->postpone = 1;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch b/meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
deleted file mode 100644
index 72884d4..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-rpm - rpmio/keccak.c: make SSE/MMX dependent upon gcc config
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.15/rpmio/keccak.c
-===================================================================
---- rpm-5.4.15.orig/rpmio/keccak.c
-+++ rpm-5.4.15/rpmio/keccak.c
-@@ -17,9 +17,13 @@ http://keccak.noekeon.org/
- #if OPTIMIZED == 64
- /* ===== "KeccakOpt64-settings.h" */
- #define Unrolling 18
--//#define UseBebigokimisa
--#define UseSSE
--//#define UseMMX
-+#if defined(__SSE2__)
-+ #define UseSSE
-+#elif defined(__MMX__)
-+ #define UseMMX
-+#else
-+ #define UseBebigokimisa
-+#endif
- /* ===== */
- #endif
- 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch b/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
deleted file mode 100644
index 1a48db6..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 67ec7531e6297200eaa97ef917d49b0a75876cb4 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 2 Dec 2015 00:56:07 -0800
-Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
-
-The following error can occur:
-  smart install libc6-2.22-r0.1@lib32_mips32r2octeon3 libc6-dbg-2.22-r0.1@lib32_mips32r2octeon3
-error: file /sbin/ldconfig conflicts between attempted installs of libc6-2.22-r0.1.lib32_mips32r2octeon3 and libc6-2.22-r0.1.octeon3_n32
-error: file /sbin/.debug/ldconfig conflicts between attempted installs of libc6-dbg-2.22-r0.1.lib32_mips32r2octeon3 and libc6-dbg-2.22-r0.1.octeon3_n32
-
-This was because:
-transactions_color = 001 (ELF32) & 010 (ELF64) & 100 (ELF32 N32 MIPS64)
-FColor = Current file color (001) & transaction_color (111)
-oFcolor = Previous file color (100) & transaction_color (111)
-
-There are two places where the conflict comparisons occur.  In both places
-the 'else' clause was too restrictive (opposite of the 'positive' clause).
-This caused the system to only permit a binary comparison - "new preferred" or
-"old preferred".  It did not permissing "neither preferred".  By removing the
-else comparison the system will now perform a 'last-in-wins' resolution when
-"neither is preferred".
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
----
- lib/transaction.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: rpm-5.4.14/lib/transaction.c
-===================================================================
---- rpm-5.4.14.orig/lib/transaction.c
-+++ rpm-5.4.14/lib/transaction.c
-@@ -154,7 +154,7 @@ static int handleInstInstalledFile(const
- 		fi->actions[fx] = FA_SKIPCOLOR;
- #endif
- 		rConflicts = 0;
--	    } else if (FColor & prefcolor) {
-+	    } else {
- #ifdef	REFERENCE
- 		rpmfsSetAction(fs, fx, FA_CREATE);
- #else
-@@ -420,7 +420,7 @@ assert(otherFi != NULL);
- 			fi->actions[i] = FA_SKIPCOLOR;
- 			rConflicts = 0;
- 		    } else
--		    if (FColor == 0 && oFColor == 0) {
-+		    {
- 			/* ... otherwise, do both, last in wins. */
- 			otherFi->actions[otherFileNum] = FA_CREATE;
- 			fi->actions[i] = FA_CREATE;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
deleted file mode 100644
index e87e02b..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-During installation, the libtool relink attempts to link to -lrpm...
-The problem is that it hasn't been installed yet!  So small change causes
-the libtool to instead use the build version.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/lib/Makefile.am
-===================================================================
---- rpm-5.4.14.orig/lib/Makefile.am
-+++ rpm-5.4.14/lib/Makefile.am
-@@ -120,6 +120,9 @@ librpm.la: $(librpm_la_OBJECTS) $(librpm
- #libsql_la_SOURCES	= libsql.c
- #libsql_la_LIBADD	= librpm.la $(RPMDB_LDADD_COMMON)
- 
-+# pkglib libraries needs to have usrlib libraries already installed!
-+install-pkglibLTLIBRARIES: install-usrlibLTLIBRARIES
-+
- install-data-hook:
- if !ENABLE_BUILD_LAFILES
- 	-for l in $(usrlib_LTLIBRARIES); do \
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch b/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
deleted file mode 100644
index a87518b..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Enable platform tag matching workaround in OE.
-
-When installing some LSB packages the 'platform' field in the package
-appears to be invalid.  Instead of relying solely on the platform comparison
-we also want to generate a perceived platform based on the valid rpm contents
-of arch and os.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/lib/depends.c
-===================================================================
---- rpm-5.4.14.orig/lib/depends.c
-+++ rpm-5.4.14/lib/depends.c
-@@ -595,7 +595,7 @@ int rpmtsAddInstallElement(rpmts ts, Hea
- 	    platform = rpmExpand(arch, "-unknown-", os, NULL);
- 
- 	rc = rpmPlatformScore(platform, platpat, nplatpat);
--#if defined(RPM_VENDOR_MANDRIVA)
-+#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_OE)
- 	/*
- 	 * If no match on platform tag, we'll try again with arch tag
- 	 * in case platform tag is inconsistent with it, which is the case
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-macros.patch b/meta/recipes-devtools/rpm/rpm/rpm-macros.patch
index c7ab2d2..d659c69 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-macros.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-macros.patch
@@ -6,21 +6,16 @@ were used by RPM 5.4.0.
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ macros/macros.in | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
-Index: rpm-5.4.14/macros/macros.in
-===================================================================
---- rpm-5.4.14.orig/macros/macros.in
-+++ rpm-5.4.14/macros/macros.in
-@@ -1022,7 +1022,7 @@ $_arbitrary_tags_tests	Foo:Bar
- 
- #==============================================================================
- # ---- rpmbuild macros.
--#%%{load:%{_usrlibrpm}/macros.rpmbuild}
-+%{load:%{_usrlibrpm}/macros.rpmbuild}
- 
- #------------------------------------------------------------------------
- # cmake(...) configuration
-@@ -1038,15 +1038,15 @@ $_arbitrary_tags_tests	Foo:Bar
+diff --git a/macros/macros.in b/macros/macros.in
+index 0f805b4..2ee2084 100644
+--- a/macros/macros.in
++++ b/macros/macros.in
+@@ -1074,15 +1074,15 @@ $_arbitrary_tags_tests	Foo:Bar
  
  #------------------------------------------------------------------------
  # perl(...) configuration
@@ -39,7 +34,7 @@ Index: rpm-5.4.14/macros/macros.in
  
  #------------------------------------------------------------------------
  # java(...) configuration.
-@@ -1054,11 +1054,11 @@ $_arbitrary_tags_tests	Foo:Bar
+@@ -1090,11 +1090,11 @@ $_arbitrary_tags_tests	Foo:Bar
  
  #------------------------------------------------------------------------
  # libtool(...) configuration.
@@ -53,7 +48,7 @@ Index: rpm-5.4.14/macros/macros.in
  
  #------------------------------------------------------------------------
  # mono(...) configuration.
-@@ -1070,7 +1070,7 @@ $_arbitrary_tags_tests	Foo:Bar
+@@ -1106,7 +1106,7 @@ $_arbitrary_tags_tests	Foo:Bar
  
  #------------------------------------------------------------------------
  # tcl(...) configuration.
@@ -62,3 +57,6 @@ Index: rpm-5.4.14/macros/macros.in
  
  #------------------------------------------------------------------------
  # typelib(...) configuration.
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch b/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
deleted file mode 100644
index 6c3e471..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Fix errors when building with sasl2 disabled
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/rpmio/mongoc.c
-===================================================================
---- rpm.orig/rpmio/mongoc.c
-+++ rpm/rpmio/mongoc.c
-@@ -39,8 +39,10 @@
- # include <winerror.h>
- #endif
- 
-+#ifdef HAVE_LIBSASL2
- #include <sasl/sasl.h>
- #include <sasl/saslutil.h>
-+#endif
- 
- #include <openssl/bio.h>
- #include <openssl/ssl.h>
-@@ -14228,6 +14230,7 @@ mongoc_read_prefs_copy (const mongoc_rea
-    return ret;
- }
- 
-+#ifdef MONGOC_ENABLE_SASL
- /*==============================================================*/
- /* --- mongoc-sasl.c */
- 
-@@ -14555,6 +14558,7 @@ _mongoc_sasl_step (mongoc_sasl_t *sasl,
- 
-    return true;
- }
-+#endif
- 
- /*==============================================================*/
- /* --- mongoc-socket.c */
-Index: rpm/rpmio/mongoc.h
-===================================================================
---- rpm.orig/rpmio/mongoc.h
-+++ rpm/rpmio/mongoc.h
-@@ -38,8 +38,10 @@
- # include <sys/un.h>
- #endif
- 
-+#ifdef HAVE_LIBSASL2
- #include <sasl/sasl.h>
- #include <sasl/saslutil.h>
-+#endif
- 
- #include <openssl/bio.h>
- #include <openssl/ssl.h>
-@@ -2455,6 +2457,8 @@ BSON_END_DECLS
- /*==============================================================*/
- /* --- mongoc-sasl-private.h */
- 
-+#ifdef MONGOC_ENABLE_SASL
-+
- BSON_BEGIN_DECLS
- 
- 
-@@ -2498,6 +2502,7 @@ bool _mongoc_sasl_step             (mong
- 
- 
- BSON_END_DECLS
-+#endif
- 
- /*==============================================================*/
- /* --- mongoc-ssl-private.h */
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
deleted file mode 100644
index e58cc13..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-lib/order.c: Make the dependency loop messages into debug msgs
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/lib/order.c
-===================================================================
---- rpm-5.4.14.orig/lib/order.c
-+++ rpm-5.4.14/lib/order.c
-@@ -2175,7 +2175,7 @@ rescan:
- 		const char * dp;
- 		rpmlogLvl msglvl = (anaconda || (rpmtsDFlags(ts) & RPMDEPS_FLAG_DEPLOOPS))
- 			? RPMLOG_WARNING : RPMLOG_ERR;
--#if defined(RPM_VENDOR_MANDRIVA) /* loop-detection-optional-loglevel */
-+#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_OE) /* loop-detection-optional-loglevel */
- 		// Report loops as debug-level message by default (7 = RPMLOG_DEBUG), overridable
- 		msglvl = rpmExpandNumeric("%{?_loop_detection_loglevel}%{?!_loop_detection_loglevel:7}");
- #endif
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch b/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
deleted file mode 100644
index e219124..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-rpm: opendb before rpmverifyscript to avoid null point input
-
-If the command is "rpm -V" and the return value of (headerIsEntry(h, RPMTAG_VERIFYSCRIPT) 
-|| headerIsEntry(h, RPMTAG_SANITYCHECK)) located in /lib/verify.c is true, it will call
-rpmpsmStage function(rpmVerifyScript->rpmpsmScriptStage->rpmpsmStage) and occur segment
-fault because of null point(rpmtsGetRdb(ts) == NULL and rpmtsGetRdb(ts)->db_txn).
-So we open rpmdb to avoid bad input when find headerIsEntry true.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-Index: rpm-5.4.14/lib/verify.c
-===================================================================
---- rpm-5.4.14.orig/lib/verify.c	2015-07-22 22:09:59.992895355 +0800
-+++ rpm-5.4.14/lib/verify.c	2015-08-13 10:20:33.752177906 +0800
-@@ -613,6 +613,8 @@
- 	{
- 	    FD_t fdo = fdDup(STDOUT_FILENO);
- 
-+	    rpmtsOpenDB(ts, O_RDONLY);            /*Open the DB to avoid null point input in function rpmpsmStage()*/
-+
- 	    rc = rpmfiSetHeader(fi, h);
- 	    if ((rc = rpmVerifyScript(qva, ts, fi, fdo)) != 0)
- 		ec += rc;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
deleted file mode 100644
index 57fc6ce..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Add the ability to query the packageorigin
-
-Written by jbj at rpm5.org
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/rpmdb/hdrfmt.c
-===================================================================
---- rpm-5.4.14.orig/rpmdb/hdrfmt.c
-+++ rpm-5.4.14/rpmdb/hdrfmt.c
-@@ -2409,8 +2409,10 @@ static int pkgoriginTag(Header h, HE_t h
-     int rc = 1;
- 
-     he->tag = RPMTAG_PACKAGEORIGIN;
--    if (!headerGet(h, he, HEADERGET_NOEXTENSION)
--     && (origin = headerGetOrigin(h)) != NULL)
-+    /* XXX two sources for tag data: what search precedence? */
-+    if (headerGet(h, he, HEADERGET_NOEXTENSION))
-+	rc = 0;
-+    else if ((origin = headerGetOrigin(h)) != NULL)
-     {
- 	he->t = RPM_STRING_TYPE;
- 	he->p.str = xstrdup(origin);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
deleted file mode 100644
index af643b1..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-If we run builds on a filesystem with 64 bit inodes like XFS, we need to
-map the inode numbers to something 32 bit since the cpio header only allows
-for 32 bit inode values. If we don't do this:
-
-#define SET_NUM_FIELD(phys, val, space) \
-        sprintf(space, "%8.8lx", (unsigned long) (val)); \
-        memcpy(phys, space, 8)
-
-from cpio.c will print larger that 8 character values and then truncate the 
-LSBs. This generates cpio files where hardlinked files may have the same
-inode number. The resulting rpms are then corrupted.
-
-There is a separate patch for the crash the identical inode numbers causes
-when extracting the rpm.
-
-Patch taken from http://git.pld-linux.org/?p=packages/rpm.git;a=commitdiff;h=10526c23aac60b7b636e4c93862887dbef8e8f15
-
-RP 2014/6/10
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Index: rpm-5.4.14/build/files.c
-===================================================================
---- rpm-5.4.14.orig/build/files.c
-+++ rpm-5.4.14/build/files.c
-@@ -1328,6 +1328,26 @@ static rpmuint32_t getDigestAlgo(Header
-     return dalgo;
- }
- 
-+static int isHardLink(FileListRec flp, FileListRec tlp)
-+{
-+    return ((S_ISREG(flp->fl_mode) && S_ISREG(tlp->fl_mode)) &&
-+            ((flp->fl_nlink > 1) && (flp->fl_nlink == tlp->fl_nlink)) &&
-+            (flp->fl_ino == tlp->fl_ino) &&
-+            (flp->fl_dev == tlp->fl_dev));
-+}
-+
-+static int seenHardLink(FileList fl, FileListRec flp, ino_t *fileid)
-+{
-+    FileListRec ilp;
-+    for (ilp = fl->fileList; ilp < flp; ilp++) {
-+        if (isHardLink(flp, ilp)) {
-+            *fileid = ilp - fl->fileList;
-+            return 1;
-+        }
-+    }
-+    return 0;
-+}
-+
- /**
-  * Add file entries to header.
-  * @todo Should directories have %doc/%config attributes? (#14531)
-@@ -1374,6 +1394,7 @@ memset(buf, 0, sizeof(buf));	/* XXX valg
- 
-     for (i = 0, flp = fl->fileList; i < fl->fileListRecsUsed; i++, flp++) {
- 	const char *s;
-+	ino_t fileid = flp - fl->fileList;
- 
-  	/* Merge duplicate entries. */
- 	while (i < (fl->fileListRecsUsed - 1) &&
-@@ -1436,6 +1457,13 @@ memset(buf, 0, sizeof(buf));	/* XXX valg
- 	/* Leave room for both dirname and basename NUL's */
- 	dpathlen += (strlen(flp->diskURL) + 2);
- 
-+	/* Excludes and dupes have been filtered out by now. */
-+	if (S_ISREG(flp->fl_mode)) {
-+	    if (flp->fl_nlink == 1 || !seenHardLink(fl, flp, &fileid)) {
-+		fl->totalFileSize += flp->fl_size;
-+	    }
-+	}
-+
- 	/*
- 	 * Make the header, the OLDFILENAMES will get converted to a 
- 	 * compressed file list write before we write the actual package to
-@@ -1518,7 +1546,11 @@ memset(buf, 0, sizeof(buf));	/* XXX valg
- 
- 	/* XXX Hash instead of 64b->32b truncate to prevent aliasing. */
- 	{   ino_t _ino = flp->fl_ino;
-+	/* don't use hash here, as hash collisions which happen on large packages
-+	   cause bus errors in rpmbuild
- 	    ui32 = hashFunctionString(0, &_ino, sizeof(_ino));
-+	*/
-+	    ui32 = fileid + 1;
- 	}
- 	he->tag = RPMTAG_FILEINODES;
- 	he->t = RPM_UINT32_TYPE;
-@@ -1751,39 +1783,6 @@ if (_rpmbuildFlags & 4) {
- 		IOSM_MAP_TYPE | IOSM_MAP_MODE | IOSM_MAP_UID | IOSM_MAP_GID;
- 	if (isSrc)
- 	    fi->fmapflags[i] |= IOSM_FOLLOW_SYMLINKS;
--
--	if (S_ISREG(flp->fl_mode)) {
--	    int bingo = 1;
--	    /* Hard links need be tallied only once. */
--	    if (flp->fl_nlink > 1) {
--		FileListRec jlp = flp + 1;
--		int j = i + 1;
--		for (; (unsigned)j < fi->fc; j++, jlp++) {
--		    /* follow outer loop logic */
--		    while (((jlp - fl->fileList) < (fl->fileListRecsUsed - 1)) &&
--			    !strcmp(jlp->fileURL, jlp[1].fileURL))
--			jlp++;
--		    if (jlp->flags & RPMFILE_EXCLUDE) {
--			j--;
--			/*@innercontinue@*/ continue;
--		    }
--		    if (jlp->flags & RPMFILE_GHOST)
--		        /*@innercontinue@*/ continue;
--		    if (!S_ISREG(jlp->fl_mode))
--			/*@innercontinue@*/ continue;
--		    if (flp->fl_nlink != jlp->fl_nlink)
--			/*@innercontinue@*/ continue;
--		    if (flp->fl_ino != jlp->fl_ino)
--			/*@innercontinue@*/ continue;
--		    if (flp->fl_dev != jlp->fl_dev)
--			/*@innercontinue@*/ continue;
--		    bingo = 0;	/* don't tally hardlink yet. */
--		    /*@innerbreak@*/ break;
--		}
--	    }
--	    if (bingo)
--		fl->totalFileSize += flp->fl_size;
--	}
-     }
- 
-     ui32 = fl->totalFileSize;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
deleted file mode 100644
index 200964f..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Don't add the first line of /etc/rpm/platform to the list of patterns
-to match when computing an arch score, use it just for getting
-information about the platform (cpu/vendor/os). Fixes #3864.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Index: rpm-5.4.14/lib/rpmrc.c
-===================================================================
---- rpm-5.4.14.orig/lib/rpmrc.c
-+++ rpm-5.4.14/lib/rpmrc.c
-@@ -510,6 +510,7 @@ static rpmRC rpmPlatform(const char * pl
- #endif
- 	}
- 
-+#if !defined(RPM_VENDOR_OE) /* Skip the explicit-platform */
- #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
- 	/* do not use vendor and GNU attribution */
- 	p = rpmExpand("%{_host_cpu}-%{_host_os}", NULL);
-@@ -520,7 +521,8 @@ static rpmRC rpmPlatform(const char * pl
- #endif
- 	xx = mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &mi_re, &mi_nre);
- 	p = _free(p);
--	
-+#endif
-+
- 	init_platform++;
-     }
-     rc = (init_platform ? RPMRC_OK : RPMRC_FAIL);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
deleted file mode 100644
index 3b40fea..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-Fix up platform and related sysinfo file loading.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-This ensures that RPM knows the compatible set of package types at all times.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/lib/depends.c
-===================================================================
---- rpm-5.4.14.orig/lib/depends.c
-+++ rpm-5.4.14/lib/depends.c
-@@ -250,7 +250,7 @@ static int rpmtsAddUpgrades(rpmts ts, rp
- 	    he->p.ptr = _free(he->p.ptr);
- 	}
- 
--#if defined(RPM_VENDOR_WINDRIVER)
-+#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_OE)
- 	/*
- 	 * If we're capable of installing multiple colors
- 	 * but at least one of the packages are white (0), we
-@@ -507,7 +507,7 @@ assert(lastx >= 0 && lastx < ts->orderCo
-     return 0;
- }
- 
--#if defined(RPM_VENDOR_WINDRIVER)
-+#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_OE)
- /* Is "compat" compatible w/ arch? */
- int _isCompatibleArch(const char * arch, const char * compat)
- {
-@@ -663,7 +663,7 @@ assert(he->p.str != NULL);
- 
- 	    if (arch == NULL || (parch = rpmteA(p)) == NULL)
- 		continue;
--#if defined(RPM_VENDOR_WINDRIVER)
-+#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_OE)
- 	    /* XXX hackery for alias matching. */
- 	    if (!_isCompatibleArch(arch, parch))
- 		continue;
-@@ -829,6 +829,12 @@ int rpmtsAddEraseElement(rpmts ts, Heade
-     return rc;
- }
- 
-+#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
-+#define _ETC_RPM_SYSINFO        "%{_etcrpm}/sysinfo"
-+#else
-+#define _ETC_RPM_SYSINFO        SYSCONFIGDIR "/sysinfo"
-+#endif
-+
- /*@only@*/ /*@null@*/ /*@unchecked@*/
- static char *sysinfo_path = NULL;
- 
-@@ -1311,7 +1317,7 @@ retry:
- 	sysinfo_path = rpmExpand("%{?_rpmds_sysinfo_path}", NULL);
- 	if (!(sysinfo_path != NULL && *sysinfo_path == '/')) {
- 	    sysinfo_path = _free(sysinfo_path);
--	    sysinfo_path = xstrdup(SYSCONFIGDIR "/sysinfo");
-+	    sysinfo_path = rpmExpand(_ETC_RPM_SYSINFO, NULL);
- 	}
-     }
- 
-Index: rpm-5.4.14/lib/rpmds.c
-===================================================================
---- rpm-5.4.14.orig/lib/rpmds.c
-+++ rpm-5.4.14/lib/rpmds.c
-@@ -1759,7 +1759,7 @@ int rpmdsSysinfo(rpmPRCO PRCO, const cha
- /*@-observertrans @*/
- 	    _sysinfo_path = _free(_sysinfo_path);
- /*@=observertrans @*/
--	    _sysinfo_path = xstrdup(_ETC_RPM_SYSINFO);
-+	    _sysinfo_path = rpmExpand(_ETC_RPM_SYSINFO, NULL);
- 	}
-     }
- /*@=modobserver@*/
-Index: rpm-5.4.14/lib/rpmrc.c
-===================================================================
---- rpm-5.4.14.orig/lib/rpmrc.c
-+++ rpm-5.4.14/lib/rpmrc.c
-@@ -38,7 +38,13 @@
- static const char * configTarget = NULL;
- 
- /*@observer@*/ /*@unchecked@*/
--static const char * platform = SYSCONFIGDIR "/platform";
-+#if defined(RPM_VENDOR_WINDRIVER)
-+#define _ETC_RPM_PLATFORM        "%{_etcrpm}/platform"
-+#else
-+#define _ETC_RPM_PLATFORM        SYSCONFIGDIR "/platform"
-+#endif
-+
-+static const char * _platform = NULL;
- 
- /*@only@*/ /*@relnull@*/ /*@unchecked@*/
- void * platpat = NULL;
-@@ -694,16 +700,17 @@ static void defaultMachine(/*@out@*/ con
-     int rc;
- 
-     while (!gotDefaults) {
--#if defined(RPM_VENDOR_WINDRIVER)
--	const char * _platform = rpmGetPath(__etcrpm, "/platform", NULL);
--#else
--	const char * _platform = platform;
--#endif
-+	if (_platform == NULL) {
-+	    _platform = rpmExpand("%{?_rpmrc_platform_path}", NULL);
-+	    /* XXX may need to validate path existence somewhen. */
-+	    if (!(_platform != NULL && *_platform == '/')) {
-+		_platform = _free(_platform);
-+		_platform = rpmExpand(_ETC_RPM_PLATFORM, NULL);
-+	    }
-+	}
- 	CVOG_t cvog = NULL;
- #if defined(RPM_VENDOR_OPENPKG) /* larger-utsname */
- 	const char *cp;
--#endif
--#if defined(RPM_VENDOR_OPENPKG) /* larger-utsname */
- 	/* utsname fields on some platforms (like HP-UX) are very small
- 	   (just about 8 characters). This is too small for OpenPKG, so cheat! */
- 	rc = uname(&un_real);
-@@ -780,9 +787,7 @@ static void defaultMachine(/*@out@*/ con
- 	if (cp != NULL && cp != _platform)
- 	    cp = _free(cp);
- #endif
--#if defined(RPM_VENDOR_WINDRIVER)
- 	_platform = _free(_platform);
--#endif
- 
- 	if (configTarget && !parseCVOG(configTarget, &cvog) && cvog != NULL) {
- 	    gotDefaults = 1;
-@@ -1101,6 +1106,8 @@ int rpmReadConfigFiles(/*@unused@*/ cons
- 
- #ifdef PREMACROFILES
-     if (rpmReadRC(PREMACROFILES)) return -1;
-+#else
-+    if (rpmReadRC(NULL)) return -1;
- #endif
- 
-     /* Reset umask to its default umask(2) value. */
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
deleted file mode 100644
index b9675c7..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-Fix up platform and related sysinfo file loading (part 2).
-
-We need to ensure that we set the _gnu flag somehow.  We do this by reading
-from the platform file, and setting a new _platform_gnu and related vars.
-
-The default values of _host_cpu, _host_vendor and _host_os are changed to
-reference either the automatically determined _target_... or _platform_...
-values.  The macros file uses the configure time defaults in _platform_...
-versions have not been defined.  This preserves existing behavior, but
-ensures reasonable defaults are always available.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/lib/rpmrc.c
-===================================================================
---- rpm-5.4.14.orig/lib/rpmrc.c
-+++ rpm-5.4.14/lib/rpmrc.c
-@@ -328,10 +328,15 @@ static void setDefaults(void)
- 	/*@modifies rpmGlobalMacroContext, internalState @*/
- {
- 
--#if defined(RPM_VENDOR_WINDRIVER)
-+#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
-     addMacro(NULL, "_usrlibrpm", NULL, __usrlibrpm, RMIL_DEFAULT);
-     addMacro(NULL, "_etcrpm", NULL, __etcrpm, RMIL_DEFAULT);
-     addMacro(NULL, "_vendor", NULL, "%{?_host_vendor}%{!?_host_vendor:wrs}", RMIL_DEFAULT);
-+
-+    addMacro(NULL, "_host_cpu", NULL, "%{?_platform_cpu}%{!?_platform_cpu:%{?_target_cpu}}", RMIL_DEFAULT);
-+    addMacro(NULL, "_host_vendor", NULL, "%{?_platform_vendor}%{!?_platform_cpu:%{?_target_vendor}}", RMIL_DEFAULT);
-+    addMacro(NULL, "_host_os", NULL, "%{?_platform_os}%{!?_platform_os:%{?_target_os}}", RMIL_DEFAULT);
-+    addMacro(NULL, "_host_gnu", NULL, "%{?_platform_gnu}%{!?_platform_gnu:%{?_gnu}}", RMIL_DEFAULT);
- #endif
- 
-     addMacro(NULL, "_usr", NULL, USRPREFIX, RMIL_DEFAULT);
-@@ -487,9 +492,22 @@ static rpmRC rpmPlatform(const char * pl
- 	}
- 
- 	if (!parseCVOG(p, &cvog) && cvog != NULL) {
-+#if defined(RPM_VENDOR_OE)
-+	    char * _gnu = NULL;
-+
-+	    addMacro(NULL, "_platform_cpu", NULL, cvog->cpu, -1);
-+	    addMacro(NULL, "_platform_vendor", NULL, cvog->vendor, -1);
-+	    addMacro(NULL, "_platform_os", NULL, cvog->os, -1);
-+
-+	    if (cvog->gnu && cvog->gnu[0] != '\0')
-+		_gnu = rpmExpand("-", cvog->gnu, NULL);
-+
-+	    addMacro(NULL, "_platform_gnu", NULL, (_gnu ? _gnu : ""), -1);
-+#else
- 	    addMacro(NULL, "_host_cpu", NULL, cvog->cpu, -1);
- 	    addMacro(NULL, "_host_vendor", NULL, cvog->vendor, -1);
- 	    addMacro(NULL, "_host_os", NULL, cvog->os, -1);
-+#endif
- 	}
- 
- #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
-Index: rpm-5.4.14/macros/macros.in
-===================================================================
---- rpm-5.4.14.orig/macros/macros.in
-+++ rpm-5.4.14/macros/macros.in
-@@ -900,9 +900,9 @@ $_arbitrary_tags_tests	Foo:Bar
- %_os			@RPMCANONOS@
- %_gnu			@RPMCANONGNU@
- 
--%_host_platform		%{_host_cpu}-%{_host_vendor}-%{_host_os}%{?_gnu}
--%_build_platform	%{_build_cpu}-%{_build_vendor}-%{_build_os}%{?_gnu}
--%_target_platform	%{_target_cpu}-%{_target_vendor}-%{_target_os}%{?_gnu}
-+%_host_platform		%{_host_cpu}-%{_host_vendor}-%{_host_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}
-+%_build_platform	%{_build_cpu}-%{_build_vendor}-%{_build_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}
-+%_target_platform	%{_target_cpu}-%{_target_vendor}-%{_target_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}
- 
- #==============================================================================
- # ---- configure macros.
-@@ -945,9 +945,10 @@ $_arbitrary_tags_tests	Foo:Bar
- %_build_os		%{_host_os}
- %_host			@host@
- %_host_alias		@host_alias@%{nil}
--%_host_cpu		@host_cpu@
--%_host_vendor		@host_vendor@
--%_host_os		@host_os@
-+%_host_cpu		%{?_platform_cpu}%{!?_platform_cpu:%{_arch}}
-+%_host_vendor		%{?_platform_vendor}%{!?_platform_vendor:%{_vendor}}
-+%_host_os		%{?_platform_os}%{!?_platform_os:%{_os}}
-+%_host_gnu		%{?_platform_gnu}%{!?_platform_gnu:%{_gnu}}
- %_target		%{_host}
- %_target_alias		%{_host_alias}
- %_target_cpu		%{_host_cpu}
-Index: rpm-5.4.14/python/rpmmodule.c
-===================================================================
---- rpm-5.4.14.orig/python/rpmmodule.c
-+++ rpm-5.4.14/python/rpmmodule.c
-@@ -65,8 +65,8 @@ static PyObject * archScore(PyObject * s
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "s", kwlist, &arch))
- 	return NULL;
- 
--#if defined(RPM_VENDOR_WINDRIVER)
--    platform = rpmExpand(arch, "-%{_host_vendor}", "-%{_host_os}%{?_gnu}", NULL);
-+#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
-+    platform = rpmExpand(arch, "-%{_host_vendor}", "-%{_host_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}", NULL);
- #else
-     platform = rpmExpand(arch, "-", "%{_vendor}", "-", "%{_os}", NULL);
- #endif
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch b/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
deleted file mode 100644
index 92ef1dc..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-python/rpmmodules.c: Change the way the python module loads the RPM config
-
-In order to support the RPM_VENDOR_WINDRIVER enhancement of dynamic
-runtime relocation paths, we need to call rpmcliInit instead of 
-rpmReadConfigFiles.  The rpmcliInit will end up calling rpmReadConfigFiles
-after the necessary relocation processing (if enabled).
-
-Code derived from changes suggested by Paul Eggleton.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/python/rpmmodule.c
-===================================================================
---- rpm.orig/python/rpmmodule.c
-+++ rpm/python/rpmmodule.c
-@@ -382,9 +382,8 @@ static int initModule(PyObject *m)
-     /* XXX add --noparentdirs --nolinktos to rpmtsCheck() */
-     global_depFlags = (RPMDEPS_FLAG_NOPARENTDIRS | RPMDEPS_FLAG_NOLINKTOS);
- 
--    /* failure to initialize rpm (crypto and all) is rather fatal too... */
--    if (rpmReadConfigFiles(NULL, NULL) == -1)
--	return 0;
-+    const char *argv[1] = {"rpmmodule", 0};
-+    rpmcliInit(1, argv, NULL);
- 
-     d = PyModule_GetDict(m);
- 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.patch b/meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.patch
deleted file mode 100644
index df6f472..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-rpm/python: The RPM5 API requires a hdrNum to be passed in
-
-The former behavior of passing in -1 as the hdrNum resulting in erase
-operations that did not complete, but also did not error.  Changing to
-using the header instance resolves this problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.15/python/rpmts-py.c
-===================================================================
---- rpm-5.4.15.orig/python/rpmts-py.c
-+++ rpm-5.4.15/python/rpmts-py.c
-@@ -241,12 +241,19 @@ static PyObject *
- rpmts_AddErase(rpmtsObject * s, PyObject * args)
- {
-     Header h;
-+    uint32_t hdrNum;
- 
-     if (!PyArg_ParseTuple(args, "O&:AddErase", hdrFromPyObject, &h))
-         return NULL;
- 
--SPEW((stderr, "*** %s(%p,%p) ts %p\n", __FUNCTION__, s, h, s->ts));
-+    hdrNum = headerGetInstance(h);
-+
-+SPEW((stderr, "*** %s(%p,%p) ts %p hdrNum %ld\n", __FUNCTION__, s, h, s->ts, hdrNum));
-+#ifdef REFERENCE /* this doesn't work, RPM5 requires a unique hdrNum */
-     return PyBool_FromLong(rpmtsAddEraseElement(s->ts, h, -1) == 0);
-+#else
-+    return PyBool_FromLong(rpmtsAddEraseElement(s->ts, h, hdrNum) == 0);
-+#endif
- }
- 
- static int
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch b/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
deleted file mode 100644
index 7a473db..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Fix an issue where the PACKAGEORIGIN is not properly stored.
-
-Restore the rpmtsCallback fdSetOpen call and related code.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/python/rpmts-py.c
-===================================================================
---- rpm.orig/python/rpmts-py.c
-+++ rpm/python/rpmts-py.c
-@@ -672,6 +672,8 @@ rpmtsCallback(const void * hd, const rpm
-     Header h = (Header) hd;
-     struct rpmtsCallbackType_s * cbInfo = data;
-     PyObject * pkgObj = (PyObject *) pkgKey;
-+    PyObject * oh = NULL;
-+    const char * origin = NULL;
-     PyObject * args, * result;
-     static FD_t fd;
- 
-@@ -693,8 +695,16 @@ rpmtsCallback(const void * hd, const rpm
- 	    pkgObj = Py_None;
- 	    Py_INCREF(pkgObj);
- 	}
--    } else
-+    } else {
- 	Py_INCREF(pkgObj);
-+	/* XXX yum has (h, rpmloc) tuple as pkgKey. Extract the path. */
-+	if (!(PyTuple_Check(pkgObj) && PyArg_ParseTuple(pkgObj, "|Os", &oh, &origin)))
-+	    origin = NULL;
-+	/* XXX clean up the path, yum paths start "//..." */
-+	if (origin && origin[0] == '/' && origin[1] == '/')
-+	    origin++;
-+    }
-+
- 
-     PyEval_RestoreThread(cbInfo->_save);
- 
-@@ -723,6 +733,9 @@ SPEW((stderr, "\t%p = fdDup(%d)\n", fd,
- 
- 	fcntl(Fileno(fd), F_SETFD, FD_CLOEXEC);
- 
-+	if (origin != NULL)
-+	    (void) fdSetOpen(fd, origin, 0, 0);
-+
- 	return fd;
-     } else
-     if (what == RPMCALLBACK_INST_CLOSE_FILE) {
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch b/meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch
deleted file mode 100644
index dfb5513..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-rpm-python-module: Change the extension tag from PyCObject to PyInt
-
-Use the tagValue to determine the custom PyInt value to use for the extension
-tag.  Without this, any custom tag extensions will be returned in a format
-that the tagNumFromPyObject and related functions like hdr_subscript will
-failed to process.  Usually the failure is error: expected a string or integer
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.15/python/rpmmodule.c
-===================================================================
---- rpm-5.4.15.orig/python/rpmmodule.c
-+++ rpm-5.4.15/python/rpmmodule.c
-@@ -316,7 +316,7 @@ static void addRpmTags(PyObject *module)
-     {
- 	if (ext->name == NULL || ext->type != HEADER_EXT_TAG)
- 	    continue;
--	PyDict_SetItemString(d, (char *) ext->name, to=PyCObject_FromVoidPtr((void *)ext, NULL));
-+	PyDict_SetItemString(d, (char *) ext->name, to=PyInt_FromLong(tagValue(ext->name)));
- 	Py_XDECREF(to);
-         PyDict_SetItem(dict, to, o=PyString_FromString(ext->name + 7));
- 	Py_XDECREF(o);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch b/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
deleted file mode 100644
index 59fe524..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-macros: Use dyanmic config vs hard coded settings
-
-When the dynamic, runtime relocation is enables we need to make sure that the 
-RPM macro file does not override the dynamic settings.  Fix this by forcing the
-dynamic version to be used in all cases.
-
-Upstream-Status: Inappropriate (OpenEmbedded specific)
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/macros/macros.in
-===================================================================
---- rpm-5.4.14.orig/macros/macros.in
-+++ rpm-5.4.14/macros/macros.in
-@@ -27,11 +27,12 @@
- #==============================================================================
- # ---- filesystem macros.
- #
--%_usr			@usrprefix@
-+%_usr			%{_usrlibrpm}/../..
- %_usrsrc		%{_usr}/src
--%_var			@varprefix@
--%_usrlibrpm		@USRLIBRPM@
--%_etcrpm		@SYSCONFIGDIR@
-+%_var			%{_usr}/../var
-+# The dynamic relocation code sets the following two items
-+#%_usrlibrpm		@USRLIBRPM@
-+#%_etcrpm		@SYSCONFIGDIR@
- 
- %__objext		@objext@
- %__libext		@libext@
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch b/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
deleted file mode 100644
index 526106d..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-lib/rpmts.c: Ensure that we check both providename and filepaths
-
-When looking up a missing dependencies, such as /bin/sh, we need to lookup
-in both the providename and filepaths DB, not just the filepaths DB.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/lib/rpmts.c
-===================================================================
---- rpm-5.4.14.orig/lib/rpmts.c
-+++ rpm-5.4.14/lib/rpmts.c
-@@ -410,8 +410,8 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __
- 	if (sdb == NULL)
- 	    continue;
- 
--	/* Look for a matching Provides: in suggested universe. */
--	rpmtag = (*keyp == '/' ? RPMTAG_FILEPATHS : RPMTAG_PROVIDENAME);
-+	rpmtag = RPMTAG_PROVIDENAME;
-+       do {
- 	mi = rpmmiInit(sdb, rpmtag, keyp, keylen);
- 	while ((h = rpmmiNext(mi)) != NULL) {
- 	    size_t hnamelen;
-@@ -446,6 +446,15 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __
- 	    bhnamelen = hnamelen;
- 	}
- 	mi = rpmmiFree(mi);
-+
-+	if (bh == NULL && *keyp == '/' && rpmtag == RPMTAG_PROVIDENAME) {
-+	   rpmtag = RPMTAG_FILEPATHS;
-+	   continue;
-+        }
-+
-+        break;
-+      } while (1);
-+
-     }
- 
-     /* Is there a suggested resolution? */
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
index 71dae49..66c0cbe 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
@@ -3,26 +3,40 @@ Disable various items that do not cross compile well.
 Upstream-Status: Inappropriate [Configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ configure.ac      |  1 +
+ rpmdb/Makefile.am | 92 ++++++++++++++++++++++---------------------------------
+ 2 files changed, 37 insertions(+), 56 deletions(-)
 
-Index: rpm/rpmdb/Makefile.am
-===================================================================
---- rpm.orig/rpmdb/Makefile.am
-+++ rpm/rpmdb/Makefile.am
-@@ -34,10 +34,10 @@ EXTRA_DIST = \
- 	db3.c sqlite.c db_emu.h librpmdb.vers bdb.sql libsqldb.c \
- 	logio.awk logio.src logio_recover_template logio_template logio.c \
+diff --git a/configure.ac b/configure.ac
+index 0ce9d0e..5cb205b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -123,6 +123,7 @@ AC_PROG_LN_S
+ AC_PROG_MAKE_SET
+ AC_PROG_LIBTOOL
+ AC_PROG_YACC
++AM_PROG_LEX
+ 
+ AC_PATH_PROG(AS, as, as)
+ 
+diff --git a/rpmdb/Makefile.am b/rpmdb/Makefile.am
+index a7aa919..218d735 100644
+--- a/rpmdb/Makefile.am
++++ b/rpmdb/Makefile.am
+@@ -36,8 +36,8 @@ EXTRA_DIST = librpmdb.vers \
  	logio_rec.c logio_auto.c logio_autop.c logio_auto.h \
--	qf.l qf.y qf.inp tqf.l tqf.y tqf.inp grammar.y scanner.l json1.js
-+	tqf.l tqf.y tqf.inp grammar.y scanner.l json1.js
+ 	_rpmhash.C _rpmhash.H
  
--EXTRA_PROGRAMS = qfcalc qfgraph logio tjfn tqf # tbdb
+-EXTRA_PROGRAMS = qfcalc qfgraph logio tjfn tqf tprintf # tbdb
 -noinst_PROGRAMS = json
-+EXTRA_PROGRAMS = qfcalc qfgraph logio # tjfn tqf tbdb
++EXTRA_PROGRAMS = qfcalc qfgraph logio tjfn tqf tprintf tbdb
 +noinst_PROGRAMS = # json
  
  RPMMISC_LDADD_COMMON = \
  	$(top_builddir)/misc/librpmmisc.la \
-@@ -321,54 +321,39 @@ BUILT_SOURCES += .syntastic_c_config
+@@ -326,60 +326,40 @@ BUILT_SOURCES += .syntastic_c_config
  .syntastic_c_config: Makefile
  	@echo $(COMPILE) | tr ' ' '\n' | sed -e '1d' > $@
  
@@ -34,8 +48,10 @@ Index: rpm/rpmdb/Makefile.am
 -YACC =	bison
 -YFLAGS=	-Dapi.pure -t -d -v --report=all
 -
+-EXTRA_DIST += grammar.y scanner.l json1.js
+-EXTRA_DIST += Jgrammar.c Jgrammar.h Jscanner.c
 -BUILT_SOURCES += Jgrammar.c Jgrammar.h Jscanner.c
--Jgrammar.c: grammar.y
+-Jgrammar.c Jgrammar.h: grammar.y
 -	$(YACC) $(YFLAGS) -o $@ $<
 -Jscanner.c: scanner.l
 -	$(LEX) -R -o $@ $<
@@ -44,8 +60,10 @@ Index: rpm/rpmdb/Makefile.am
 -testjson: json1.js json
 -	./json json1.js
 -
+-EXTRA_DIST += qf.l qf.y qf.inp
+-#EXTRA_DIST += Qgrammar.c Qgrammar.h Qscanner.c
 -BUILT_SOURCES += Qgrammar.c Qgrammar.h Qscanner.c
--Qgrammar.c: qf.y
+-Qgrammar.c Qgrammar.h: qf.y
 -	$(YACC) $(YFLAGS) -o $@ $<
 -Qscanner.c: qf.l
 -	$(LEX) -R -o $@ $<
@@ -56,6 +74,8 @@ Index: rpm/rpmdb/Makefile.am
 -	./qfcalc < qf.inp
 -	./qfgraph < qf.inp
 -
+-EXTRA_DIST += tqf.l tqf.y tqf.inp
+-#EXTRA_DIST += Tgrammar.c Tgrammar.h Tscanner.c
 -BUILT_SOURCES += Tgrammar.c Tgrammar.h Tscanner.c
 -Tgrammar.c Tgrammar.h: tqf.y
 -	$(YACC) $(YFLAGS) -o $@ $<
@@ -77,48 +97,40 @@ Index: rpm/rpmdb/Makefile.am
 +#tjfn_SOURCES = tjfn.c
 +#tjfn_LDADD = $(mylibs)
 +#
-+#LFLAGS=	-d -T -v -8 -b --yylineno --reentrant --bison-bridge --perf-report
++#LFLAGS=       -d -T -v -8 -b --yylineno --reentrant --bison-bridge --perf-report
 +#
 +#BUILT_SOURCES += Jgrammar.c Jgrammar.h Jscanner.c
 +#Jgrammar.c Jgrammar.h: grammar.y
-+#	$(YACC) $(YFLAGS) -t -d -v -o $@ $<
++#      $(YACC) $(YFLAGS) -t -d -v -o $@ $<
 +#Jscanner.c: scanner.l
-+#	$(LEX) -R -o $@ $<
++#      $(LEX) -R -o $@ $<
 +#json_SOURCES = Jgrammar.c Jscanner.c json.c
 +#
 +#testjson: json1.js json
-+#	./json json1.js
++#      ./json json1.js
 +#
 +#BUILT_SOURCES += Tgrammar.c Tgrammar.h Tscanner.c
 +#Tgrammar.c Tgrammar.h: tqf.y
-+#	$(YACC) $(YFLAGS) -t -d -v -o $@ $<
++#      $(YACC) $(YFLAGS) -t -d -v -o $@ $<
 +#Tscanner.c Tscanner.h: tqf.l
-+#	$(LEX) --prefix="Tyy" $(LFLAGS) -o $@ $<
-+#tqf_SOURCES =	Tgrammar.c Tscanner.c tgraph.c
-+#tqf_CFLAGS =	$(CFLAGS) -fsanitize=address # -DTSCANNER_MAIN
-+#tqf_LDADD =	../lib/librpm.la \
-+#		./librpmdb.la \
-+#		../popt/libpopt.la
++#      $(LEX) --prefix="Tyy" $(LFLAGS) -o $@ $<
++#tqf_SOURCES = Tgrammar.c Tscanner.c tgraph.c
++#tqf_CFLAGS =  $(CFLAGS) -fsanitize=address # -DTSCANNER_MAIN
++#tqf_LDADD =   ../lib/librpm.la \
++#              ./librpmdb.la \
++#              ../popt/libpopt.la
 +
-+#testdir =	$(abs_top_builddir)/tests
++#testdir =     $(abs_top_builddir)/tests
 +#foo: tqf
-+#	-../libtool --mode=execute \
-+#	    ./tqf \
-+#		--dbpath=$(testdir) \
-+#		-r $(testdir)/fodder/*.rpm \
-+#		   $(testdir)/fodder/fmtmod.qf
- 
- #tbdb_SOURCES = tbdb.c bdb.c
- #tbdb_LDADD = $(mylibs)
-Index: rpm/configure.ac
-===================================================================
---- rpm.orig/configure.ac
-+++ rpm/configure.ac
-@@ -119,6 +119,7 @@ AC_PROG_MAKE_SET
- AC_PROG_LIBTOOL
- AC_PROG_RANLIB
- AC_PROG_YACC
-+AM_PROG_LEX
- 
- AC_PATH_PROG(AS, as, as)
++#      -../libtool --mode=execute \
++#          ./tqf \
++#              --dbpath=$(testdir) \
++#              -r $(testdir)/fodder/*.rpm \
++#                 $(testdir)/fodder/fmtmod.qf
++
  
+ tprintf_SOURCES = tprintf.c
+ tprintf_CFLAGS = $(AM_CPPFLAGS)
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
deleted file mode 100644
index b9a2cbc..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 16dc683aa50be9789d1674734b06a8a955ff22ad Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 26 Nov 2015 01:36:40 -0800
-Subject: [PATCH] lib/rpmfc.c: fix for N32 MIPS64
-
-It is 'N32 MIPS64', not 'N32 MIPS32' as command file shows:
-$ file image/usr/bin/getent
-getent: ELF 32-bit MSB executable, MIPS, N32 MIPS64 [snip]
-
-And "rpm -qp --filecolor" was wrong (it was 1, but should be 4).
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- lib/rpmfc.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/rpmfc.c b/lib/rpmfc.c
-index fde00c7..49779f8 100644
---- a/lib/rpmfc.c
-+++ b/lib/rpmfc.c
-@@ -575,7 +575,7 @@ static struct rpmfcTokens_s rpmfcTokens[] = {
-   { " not stripped",		RPMFC_NOTSTRIPPED },
-   { " archive",			RPMFC_ARCHIVE },
- 
--  { "MIPS, N32 MIPS32",		RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
-+  { "MIPS, N32 MIPS64",		RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
-   { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
-   { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
deleted file mode 100644
index 9364576..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix a typo in the rpmio Makefile.am
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/rpmio/Makefile.am
-===================================================================
---- rpm.orig/rpmio/Makefile.am
-+++ rpm/rpmio/Makefile.am
-@@ -121,7 +121,7 @@ luaLPATHdir =	${pkgsharedir)/lua
- 
- pkgincdir = $(pkgincludedir)$(WITH_PATH_VERSIONED_SUFFIX)
- pkginc_HEADERS = argv.h mire.h rpmzlog.h yarn.h \
--	rpmbf.h rpmcb.h rpmio.h rpmlog.h rpmiotypes.h rpmmacro.h
-+	rpmbf.h rpmcb.h rpmio.h rpmlog.h rpmiotypes.h rpmmacro.h \
- 	rpmpgp.h rpmsw.h rpmutil.h
- noinst_HEADERS = \
- 	ar.h bcon.h bson.h cpio.h crc.h envvar.h fnmatch.h fts.h glob.h iosm.h \
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch b/meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
index d6493c1..d0431cd 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
@@ -4,56 +4,33 @@ This resolves a problem during compilation:
 
 ../../../rpm/syck/lib/gram.y:66:27: error: 'parser' undeclared (first use in this function)
             ((SyckParser *)parser)->root = syck_hdlr_add_node( (SyckParser *)parser, $1 );
-                           ^
+                           ^    
 ../../../rpm/syck/lib/gram.y:66:27: note: each undeclared identifier is reported only once for each function it appears in
 ../../../rpm/syck/lib/syck.c: In function 'syck_parse':
 ../../../rpm/syck/lib/syck.c:516:5: warning: implicit declaration of function 'syckparse' [-Wimplicit-function-declaration]
-     syckparse( p );
-     ^
+     syckparse( p ); 
+     ^    
 
 This patch was generated by reverting the grammer back to a previous
 version.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ syck/lib/Makefile.am | 38 +++++++++++++++++++-------------------
+ syck/lib/bytecode.c  |  9 +++------
+ syck/lib/gram.y      | 10 ++--------
+ syck/lib/implicit.c  |  5 -----
+ syck/lib/syck.c      |  2 +-
+ syck/lib/syck.h      |  6 +++---
+ syck/lib/token.c     | 15 +++++++--------
+ 7 files changed, 35 insertions(+), 50 deletions(-)
 
-Index: rpm/syck/lib/gram.y
-===================================================================
---- rpm.orig/syck/lib/gram.y
-+++ rpm/syck/lib/gram.y
-@@ -9,18 +9,10 @@
- 
- %start doc
- %pure-parser
--%parse-param {void* parser}
--%lex-param {void* parser}
- 
- 
- %{
- 
--#define YYDEBUG 1
--#define YYERROR_VERBOSE 1
--#ifndef YYSTACK_USE_ALLOCA
--#define YYSTACK_USE_ALLOCA 0
--#endif
--
- #include "system.h"
- #include "syck.h"
- #include "debug.h"
-@@ -28,6 +20,9 @@
- void apply_seq_in_map( SyckParser *parser, SyckNode *n )
- 	/*@*/;
- 
-+#define YYPARSE_PARAM   parser
-+#define YYLEX_PARAM     parser
-+
- #define NULL_NODE(parser, node) \
-         SyckNode *node = syck_new_str( "", scalar_plain ); \
-         if ( ((SyckParser *)parser)->taguri_expansion == 1 ) \
-Index: rpm/syck/lib/Makefile.am
-===================================================================
---- rpm.orig/syck/lib/Makefile.am
-+++ rpm/syck/lib/Makefile.am
-@@ -49,25 +49,25 @@ SYCK_SPLINT_SRCS = \
+diff --git a/syck/lib/Makefile.am b/syck/lib/Makefile.am
+index 98edf60..0037095 100644
+--- a/syck/lib/Makefile.am
++++ b/syck/lib/Makefile.am
+@@ -54,25 +54,25 @@ SYCK_SPLINT_SRCS = \
  	token.c \
  	implicit.c
  
@@ -76,7 +53,7 @@ Index: rpm/syck/lib/Makefile.am
 -#	} > _gram.c ;\
 -#	  mv -f _gram.c gram.c; \
 -#	fi
-+gram.c:	gram.y
++gram.c:        gram.y
 +	$(YACC) -d -t -v -p syck -o $@ $<
 +	-@if test -f gram.c; then \
 +	{ echo "/*@-globs -mods -modnomods -moduncon -modunconnomods @*/";\
@@ -98,10 +75,71 @@ Index: rpm/syck/lib/Makefile.am
  
  BUILT_SOURCES = gram.c gram.h
  
-Index: rpm/syck/lib/implicit.c
-===================================================================
---- rpm.orig/syck/lib/implicit.c
-+++ rpm/syck/lib/implicit.c
+diff --git a/syck/lib/bytecode.c b/syck/lib/bytecode.c
+index c47e8ab..3c7af86 100644
+--- a/syck/lib/bytecode.c
++++ b/syck/lib/bytecode.c
+@@ -27,14 +27,11 @@
+ #define YYLINEPTR   parser->lineptr
+ #define YYLINECTPTR parser->linectptr
+ #define YYLINE      parser->linect
+-#define YYFILL(n)   (void) syck_parser_read(parser)
++#define YYFILL(n)   syck_parser_read(parser)
+ 
+-/*@unchecked@*/ /*@null@*/
+ extern SyckParser *syck_parser_ptr;
+ 
+-/*@null@*/
+-char *get_inline( SyckParser *parser )
+-	/*@modifies parser @*/;
++char *get_inline( SyckParser *parser );
+ 
+ /*
+  * Repositions the cursor at `n' offset from the token start.
+@@ -144,7 +141,7 @@ sycklex_bytecode_utf8( YYSTYPE *sycklval, SyckParser *parser )
+     syck_parser_ptr = parser;
+     if ( YYCURSOR == NULL ) 
+     {
+-        (void) syck_parser_read( parser );
++        syck_parser_read( parser );
+     }
+ 
+     if ( parser->force_token != 0 )
+diff --git a/syck/lib/gram.y b/syck/lib/gram.y
+index 7567709..f06758b 100644
+--- a/syck/lib/gram.y
++++ b/syck/lib/gram.y
+@@ -9,24 +9,18 @@
+ 
+ %start doc
+ %pure-parser
+-%parse-param {void* parser}
+-%lex-param {void* parser}
+ 
+ 
+ %{
+ 
+-#define YYDEBUG 1
+-#define YYERROR_VERBOSE 1
+-#ifndef YYSTACK_USE_ALLOCA
+-#define YYSTACK_USE_ALLOCA 0
+-#endif
+-
+ #include "system.h"
+ #include "syck.h"
+ #include "debug.h"
+ 
+ void apply_seq_in_map( SyckParser *parser, SyckNode *n )
+ 	/*@*/;
++#define YYPARSE_PARAM   parser
++#define YYLEX_PARAM     parser
+ 
+ #define NULL_NODE(parser, node) \
+         SyckNode *node = syck_new_str( "", scalar_plain ); \
+diff --git a/syck/lib/implicit.c b/syck/lib/implicit.c
+index 5ed9e06..8360e85 100644
+--- a/syck/lib/implicit.c
++++ b/syck/lib/implicit.c
 @@ -19,11 +19,6 @@
  #define YYLIMIT     limit
  #define YYFILL(n)
@@ -114,20 +152,11 @@ Index: rpm/syck/lib/implicit.c
  void
  try_tag_implicit( SyckNode *n, int taguri )
  {
-@@ -3000,8 +2995,4 @@ yy270:	++YYCURSOR;
- 
- }
- 
--#ifdef  __clang__
--#pragma clang diagnostic pop
--#endif
--
- /*@=noret@*/
-Index: rpm/syck/lib/syck.c
-===================================================================
---- rpm.orig/syck/lib/syck.c
-+++ rpm/syck/lib/syck.c
-@@ -519,7 +519,7 @@ syck_parse( SyckParser *p )
+diff --git a/syck/lib/syck.c b/syck/lib/syck.c
+index e6d6c06..23aba86 100644
+--- a/syck/lib/syck.c
++++ b/syck/lib/syck.c
+@@ -508,7 +508,7 @@ syck_parse( SyckParser *p )
  }
  
  void
@@ -136,10 +165,10 @@ Index: rpm/syck/lib/syck.c
  {
      printf( "Error at [Line %d, Col %ld]: %s\n", 
          p->linect,
-Index: rpm/syck/lib/syck.h
-===================================================================
---- rpm.orig/syck/lib/syck.h
-+++ rpm/syck/lib/syck.h
+diff --git a/syck/lib/syck.h b/syck/lib/syck.h
+index 99c8fbb..04be1d9 100644
+--- a/syck/lib/syck.h
++++ b/syck/lib/syck.h
 @@ -175,7 +175,7 @@ typedef struct _syck_str SyckIoStr;
  typedef struct _syck_level SyckLevel;
  
@@ -149,7 +178,7 @@ Index: rpm/syck/lib/syck.h
  typedef SyckNode * (*SyckBadAnchorHandler)(SyckParser *p, char *);
  typedef long (*SyckIoFileRead)(char *, SyckIoFile *, long, long); 
  typedef long (*SyckIoStrRead)(char *, SyckIoStr *, long, long);
-@@ -546,7 +546,7 @@ long syck_parser_readlen( SyckParser *p,
+@@ -546,7 +546,7 @@ long syck_parser_readlen( SyckParser *p, long )
  SYMID syck_parse( SyckParser *p )
  	/*@globals fileSystem @*/
  	/*@modifies p, fileSystem @*/;
@@ -165,13 +194,13 @@ Index: rpm/syck/lib/syck.h
 -void syckerror( void *, const char *msg )
 +void syckerror( char *msg )
  	/*@*/;
- /* XXX union YYSTYPE *sycklval has issues on Mac OS X. */
- int sycklex( void *_sycklval, SyckParser *parser )
-Index: rpm/syck/lib/token.c
-===================================================================
---- rpm.orig/syck/lib/token.c
-+++ rpm/syck/lib/token.c
-@@ -270,11 +270,11 @@ sycklex( void * _sycklval, SyckParser *p
+ int syckparse( void * )
+ 	/*@globals fileSystem @*/
+diff --git a/syck/lib/token.c b/syck/lib/token.c
+index 6d2ae5a..f8977b5 100644
+--- a/syck/lib/token.c
++++ b/syck/lib/token.c
+@@ -271,11 +271,11 @@ sycklex( void *_sycklval, SyckParser *parser )
          return sycklex_yaml_utf8( sycklval, parser );
  
          case syck_yaml_utf16:
@@ -185,7 +214,7 @@ Index: rpm/syck/lib/token.c
          break;
  
          case syck_bytecode_utf8:
-@@ -2739,15 +2739,14 @@ syckwrap(void)
+@@ -2823,15 +2823,14 @@ syckwrap(void)
  }
  
  void 
@@ -206,876 +235,6 @@ Index: rpm/syck/lib/token.c
 +    (syck_parser_ptr->error_handler)(syck_parser_ptr, msg);
  }
  
-Index: rpm/syck/lib/bytecode.c
-===================================================================
---- rpm.orig/syck/lib/bytecode.c
-+++ rpm/syck/lib/bytecode.c
-@@ -1,10 +1,10 @@
--/* Generated by re2c 0.9.12 on Tue Mar 14 00:14:53 2006 */
-+/* Generated by re2c 0.13.5 on Tue Feb 23 12:04:00 2016 */
- #line 1 "bytecode.re"
- /*
-  * bytecode.re
-  *
-  * $Author: why $
-- * $Date: 2005-09-20 08:21:06 +0300 (Tue, 20 Sep 2005) $
-+ * $Date: 2005/09/20 05:21:06 $
-  *
-  * Copyright (C) 2003 why the lucky stiff
-  */
-@@ -27,14 +27,11 @@
- #define YYLINEPTR   parser->lineptr
- #define YYLINECTPTR parser->linectptr
- #define YYLINE      parser->linect
--#define YYFILL(n)   (void) syck_parser_read(parser)
-+#define YYFILL(n)   syck_parser_read(parser)
- 
--/*@unchecked@*/ /*@null@*/
- extern SyckParser *syck_parser_ptr;
- 
--/*@null@*/
--char *get_inline( SyckParser *parser )
--	/*@modifies parser @*/;
-+char *get_inline( SyckParser *parser );
- 
- /*
-  * Repositions the cursor at `n' offset from the token start.
-@@ -137,14 +134,12 @@ char *get_inline( SyckParser *parser )
-  */
- int
- sycklex_bytecode_utf8( YYSTYPE *sycklval, SyckParser *parser )
--	/*@globals syck_parser_ptr @*/
--	/*@modifies sycklval, parser, syck_parser_ptr @*/
- {
-     SyckLevel *lvl;
-     syck_parser_ptr = parser;
-     if ( YYCURSOR == NULL ) 
-     {
--        (void) syck_parser_read( parser );
-+        syck_parser_read( parser );
-     }
- 
-     if ( parser->force_token != 0 )
-@@ -171,42 +166,37 @@ sycklex_bytecode_utf8( YYSTYPE *sycklval
- #line 165 "<stdout>"
- {
- 	YYCTYPE yych;
--	unsigned int yyaccept = 0;
--	goto yy0;
--	/*@notreached@*/
--	++YYCURSOR;
--yy0:
--	if((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
-+
-+	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
- 	yych = *YYCURSOR;
--	switch(yych){
-+	switch (yych) {
- 	case 0x00:	goto yy2;
- 	case 'D':	goto yy3;
- 	default:	goto yy5;
- 	}
--yy2:	YYCURSOR = YYMARKER;
--	switch(yyaccept){
--	case 0:	goto yy4;
--	}
--yy3:	yyaccept = 0;
-+yy2:
-+	YYCURSOR = YYMARKER;
-+	goto yy4;
-+yy3:
- 	yych = *(YYMARKER = ++YYCURSOR);
--	switch(yych){
--	case 0x0A:	goto yy6;
--	case 0x0D:	goto yy8;
-+	switch (yych) {
-+	case '\n':	goto yy6;
-+	case '\r':	goto yy8;
- 	default:	goto yy4;
- 	}
- yy4:
- #line 199 "bytecode.re"
--{   YYPOS(0);
-+	{   YYPOS(0);
-             goto Document;
-         }
--#line 195 "<stdout>"
--yy5:	yych = *++YYCURSOR;
-+#line 191 "<stdout>"
-+yy5:
-+	yych = *++YYCURSOR;
- 	goto yy4;
--yy6:	++YYCURSOR;
--	goto yy7;
--yy7:
-+yy6:
-+	++YYCURSOR;
- #line 186 "bytecode.re"
--{   if ( lvl->status == syck_lvl_header )
-+	{   if ( lvl->status == syck_lvl_header )
-             {
-                 CHK_NL(YYCURSOR);
-                 goto Directive;
-@@ -218,10 +208,11 @@ yy7:
-                 return 0;
-             }
-         }
--#line 214 "<stdout>"
--yy8:	++YYCURSOR;
--	switch((yych = *YYCURSOR)) {
--	case 0x0A:	goto yy6;
-+#line 210 "<stdout>"
-+yy8:
-+	++YYCURSOR;
-+	switch ((yych = *YYCURSOR)) {
-+	case '\n':	goto yy6;
- 	default:	goto yy2;
- 	}
- }
-@@ -239,19 +230,15 @@ Document:
-         YYTOKEN = YYCURSOR;
- 
- 
--#line 235 "<stdout>"
-+#line 232 "<stdout>"
- {
- 	YYCTYPE yych;
--	goto yy9;
--	/*@notreached@*/
--	++YYCURSOR;
--yy9:
--	if((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
-+	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
- 	yych = *YYCURSOR;
--	switch(yych){
-+	switch (yych) {
- 	case 0x00:	goto yy30;
--	case 0x0A:	goto yy27;
--	case 0x0D:	goto yy29;
-+	case '\n':	goto yy27;
-+	case '\r':	goto yy29;
- 	case 'A':	goto yy19;
- 	case 'D':	goto yy12;
- 	case 'E':	goto yy16;
-@@ -264,71 +251,73 @@ yy9:
- 	case 'c':	goto yy25;
- 	default:	goto yy11;
- 	}
--yy11:yy12:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy41;
--	case 0x0D:	goto yy44;
-+yy11:
-+yy12:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy41;
-+	case '\r':	goto yy44;
- 	default:	goto yy11;
- 	}
--yy13:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy41;
--	case 0x0D:	goto yy43;
-+yy13:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy41;
-+	case '\r':	goto yy43;
- 	default:	goto yy11;
- 	}
--yy14:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy38;
--	case 0x0D:	goto yy40;
-+yy14:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy38;
-+	case '\r':	goto yy40;
- 	default:	goto yy11;
- 	}
--yy15:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy35;
--	case 0x0D:	goto yy37;
-+yy15:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy35;
-+	case '\r':	goto yy37;
- 	default:	goto yy11;
- 	}
--yy16:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy32;
--	case 0x0D:	goto yy34;
-+yy16:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy32;
-+	case '\r':	goto yy34;
- 	default:	goto yy11;
- 	}
--yy17:	++YYCURSOR;
--	goto yy18;
--yy18:
-+yy17:
-+	++YYCURSOR;
- #line 288 "bytecode.re"
--{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_str); 
-+	{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_str); 
-             goto Scalar;
-         }
--#line 296 "<stdout>"
--yy19:	++YYCURSOR;
--	goto yy20;
--yy20:
-+#line 295 "<stdout>"
-+yy19:
-+	++YYCURSOR;
- #line 292 "bytecode.re"
--{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_open);
-+	{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_open);
-             sycklval->name = get_inline( parser );
-             syck_hdlr_remove_anchor( parser, sycklval->name );
-             CHK_NL(YYCURSOR);
-             return YAML_ANCHOR;
-         }
--#line 307 "<stdout>"
--yy21:	++YYCURSOR;
--	goto yy22;
--yy22:
-+#line 305 "<stdout>"
-+yy21:
-+	++YYCURSOR;
- #line 299 "bytecode.re"
--{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_str);
-+	{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_str);
-             sycklval->name = get_inline( parser );
-             POP_LEVEL();
-             if ( *( YYCURSOR - 1 ) == '\n' ) YYCURSOR--;
-             return YAML_ALIAS;
-         }
--#line 318 "<stdout>"
--yy23:	++YYCURSOR;
--	goto yy24;
--yy24:
-+#line 315 "<stdout>"
-+yy23:
-+	++YYCURSOR;
- #line 306 "bytecode.re"
--{   char *qstr;
-+	{   char *qstr;
-             ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_open);
-             qstr = get_inline( parser );
-             CHK_NL(YYCURSOR);
-@@ -387,18 +376,16 @@ yy24:
-             sycklval->name = qstr;
-             return YAML_TAGURI;
-         }
--#line 382 "<stdout>"
--yy25:	++YYCURSOR;
--	goto yy26;
--yy26:
-+#line 378 "<stdout>"
-+yy25:
-+	++YYCURSOR;
- #line 366 "bytecode.re"
--{   goto Comment; }
--#line 388 "<stdout>"
--yy27:	++YYCURSOR;
--	goto yy28;
--yy28:
-+	{   goto Comment; }
-+#line 383 "<stdout>"
-+yy27:
-+	++YYCURSOR;
- #line 368 "bytecode.re"
--{   CHK_NL(YYCURSOR);
-+	{   CHK_NL(YYCURSOR);
-             if ( lvl->status == syck_lvl_seq )
-             {
-                 return YAML_INDENT; 
-@@ -410,26 +397,25 @@ yy28:
-             }
-             goto Document;
-         }
--#line 405 "<stdout>"
--yy29:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy27;
-+#line 399 "<stdout>"
-+yy29:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy27;
- 	default:	goto yy11;
- 	}
--yy30:	++YYCURSOR;
--	goto yy31;
--yy31:
-+yy30:
-+	++YYCURSOR;
- #line 381 "bytecode.re"
--{   ENSURE_YAML_IEND(lvl, -1);
-+	{   ENSURE_YAML_IEND(lvl, -1);
-             YYPOS(0);
-             return 0;
-         }
--#line 419 "<stdout>"
--yy32:	++YYCURSOR;
--	goto yy33;
--yy33:
-+#line 413 "<stdout>"
-+yy32:
-+	++YYCURSOR;
- #line 252 "bytecode.re"
--{   if ( lvl->status == syck_lvl_seq && lvl->ncount == 0 )
-+	{   if ( lvl->status == syck_lvl_seq && lvl->ncount == 0 )
-             {
-                 lvl->ncount++;
-                 YYPOS(0);
-@@ -464,17 +450,17 @@ yy33:
-             CHK_NL(YYCURSOR);
-             return YAML_IEND;
-         }
--#line 459 "<stdout>"
--yy34:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy32;
-+#line 452 "<stdout>"
-+yy34:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy32;
- 	default:	goto yy11;
- 	}
--yy35:	++YYCURSOR;
--	goto yy36;
--yy36:
-+yy35:
-+	++YYCURSOR;
- #line 237 "bytecode.re"
--{   int complex = 0;
-+	{   int complex = 0;
-             if ( lvl->ncount % 2 == 0 && ( lvl->status == syck_lvl_map || lvl->status == syck_lvl_seq ) )
-             {
-                 complex = 1;
-@@ -488,17 +474,17 @@ yy36:
-             }
-             return YAML_IOPEN;
-         }
--#line 483 "<stdout>"
--yy37:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy35;
-+#line 476 "<stdout>"
-+yy37:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy35;
- 	default:	goto yy11;
- 	}
--yy38:	++YYCURSOR;
--	goto yy39;
--yy39:
-+yy38:
-+	++YYCURSOR;
- #line 222 "bytecode.re"
--{   int complex = 0;
-+	{   int complex = 0;
-             if ( lvl->ncount % 2 == 0 && ( lvl->status == syck_lvl_map || lvl->status == syck_lvl_seq ) )
-             {
-                 complex = 1;
-@@ -512,29 +498,31 @@ yy39:
-             }
-             return YAML_IOPEN;
-         }
--#line 507 "<stdout>"
--yy40:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy38;
-+#line 500 "<stdout>"
-+yy40:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy38;
- 	default:	goto yy11;
- 	}
--yy41:	++YYCURSOR;
--	goto yy42;
--yy42:
-+yy41:
-+	++YYCURSOR;
- #line 217 "bytecode.re"
--{   ENSURE_YAML_IEND(lvl, -1);
-+	{   ENSURE_YAML_IEND(lvl, -1);
-                 YYPOS(0);
-                 return 0;
-             }
--#line 521 "<stdout>"
--yy43:	yych = *++YYCURSOR;
--	switch(yych){
--	case 0x0A:	goto yy41;
-+#line 514 "<stdout>"
-+yy43:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
-+	case '\n':	goto yy41;
- 	default:	goto yy11;
- 	}
--yy44:	++YYCURSOR;
--	switch((yych = *YYCURSOR)) {
--	case 0x0A:	goto yy41;
-+yy44:
-+	++YYCURSOR;
-+	switch ((yych = *YYCURSOR)) {
-+	case '\n':	goto yy41;
- 	default:	goto yy11;
- 	}
- }
-@@ -548,28 +536,22 @@ Directive:
-         YYTOKEN = YYCURSOR;
- 
- 
--#line 543 "<stdout>"
-+#line 538 "<stdout>"
- {
- 	YYCTYPE yych;
--	unsigned int yyaccept = 0;
--	goto yy45;
--	/*@notreached@*/
--	++YYCURSOR;
--yy45:
--	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
-+	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
- 	yych = *YYCURSOR;
--	switch(yych){
-+	switch (yych) {
- 	case 0x00:	goto yy47;
- 	case 'V':	goto yy48;
- 	default:	goto yy50;
- 	}
--yy47:	YYCURSOR = YYMARKER;
--	switch(yyaccept){
--	case 0:	goto yy49;
--	}
--yy48:	yyaccept = 0;
-+yy47:
-+	YYCURSOR = YYMARKER;
-+	goto yy49;
-+yy48:
- 	yych = *(YYMARKER = ++YYCURSOR);
--	switch(yych){
-+	switch (yych) {
- 	case '.':
- 	case '/':
- 	case '0':
-@@ -619,7 +601,8 @@ yy48:	yyaccept = 0;
- 	case '\\':
- 	case ']':
- 	case '^':
--	case '_':	case 'a':
-+	case '_':
-+	case 'a':
- 	case 'b':
- 	case 'c':
- 	case 'd':
-@@ -649,17 +632,18 @@ yy48:	yyaccept = 0;
- 	}
- yy49:
- #line 399 "bytecode.re"
--{   YYCURSOR = YYTOKEN;
-+	{   YYCURSOR = YYTOKEN;
-                return YAML_DOCSEP;
-            }
--#line 646 "<stdout>"
--yy50:	yych = *++YYCURSOR;
-+#line 637 "<stdout>"
-+yy50:
-+	yych = *++YYCURSOR;
- 	goto yy49;
--yy51:	++YYCURSOR;
--	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
-+yy51:
-+	++YYCURSOR;
-+	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
- 	yych = *YYCURSOR;
--	goto yy52;
--yy52:	switch(yych){
-+	switch (yych) {
- 	case '.':
- 	case '/':
- 	case '0':
-@@ -671,7 +655,8 @@ yy52:	switch(yych){
- 	case '6':
- 	case '7':
- 	case '8':
--	case '9':	case ';':
-+	case '9':
-+	case ';':
- 	case '<':
- 	case '=':
- 	case '>':
-@@ -707,7 +692,8 @@ yy52:	switch(yych){
- 	case '\\':
- 	case ']':
- 	case '^':
--	case '_':	case 'a':
-+	case '_':
-+	case 'a':
- 	case 'b':
- 	case 'c':
- 	case 'd':
-@@ -736,8 +722,9 @@ yy52:	switch(yych){
- 	case ':':	goto yy53;
- 	default:	goto yy47;
- 	}
--yy53:	yych = *++YYCURSOR;
--	switch(yych){
-+yy53:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
- 	case '.':
- 	case '/':
- 	case '0':
-@@ -787,7 +774,8 @@ yy53:	yych = *++YYCURSOR;
- 	case '\\':
- 	case ']':
- 	case '^':
--	case '_':	case 'a':
-+	case '_':
-+	case 'a':
- 	case 'b':
- 	case 'c':
- 	case 'd':
-@@ -815,13 +803,13 @@ yy53:	yych = *++YYCURSOR;
- 	case 'z':	goto yy54;
- 	default:	goto yy47;
- 	}
--yy54:	++YYCURSOR;
--	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
-+yy54:
-+	++YYCURSOR;
-+	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
- 	yych = *YYCURSOR;
--	goto yy55;
--yy55:	switch(yych){
--	case 0x0A:	goto yy56;
--	case 0x0D:	goto yy58;
-+	switch (yych) {
-+	case '\n':	goto yy56;
-+	case '\r':	goto yy58;
- 	case '.':
- 	case '/':
- 	case '0':
-@@ -871,7 +859,8 @@ yy55:	switch(yych){
- 	case '\\':
- 	case ']':
- 	case '^':
--	case '_':	case 'a':
-+	case '_':
-+	case 'a':
- 	case 'b':
- 	case 'c':
- 	case 'd':
-@@ -899,16 +888,16 @@ yy55:	switch(yych){
- 	case 'z':	goto yy54;
- 	default:	goto yy47;
- 	}
--yy56:	++YYCURSOR;
--	goto yy57;
--yy57:
-+yy56:
-+	++YYCURSOR;
- #line 396 "bytecode.re"
--{   CHK_NL(YYCURSOR);
-+	{   CHK_NL(YYCURSOR);
-                goto Directive; }
--#line 899 "<stdout>"
--yy58:	++YYCURSOR;
--	switch((yych = *YYCURSOR)) {
--	case 0x0A:	goto yy56;
-+#line 895 "<stdout>"
-+yy58:
-+	++YYCURSOR;
-+	switch ((yych = *YYCURSOR)) {
-+	case '\n':	goto yy56;
- 	default:	goto yy47;
- 	}
- }
-@@ -922,40 +911,40 @@ Comment:
-         YYTOKEN = YYCURSOR;
- 
- 
--#line 916 "<stdout>"
-+#line 913 "<stdout>"
- {
- 	YYCTYPE yych;
--	goto yy59;
--	/*@notreached@*/
--	++YYCURSOR;
--yy59:
--	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
-+	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
- 	yych = *YYCURSOR;
--	switch(yych){
-+	switch (yych) {
- 	case 0x00:	goto yy61;
--	case 0x0A:	goto yy62;
--	case 0x0D:	goto yy64;
-+	case '\n':	goto yy62;
-+	case '\r':	goto yy64;
- 	default:	goto yy66;
- 	}
--yy61:yy62:	++YYCURSOR;
--	goto yy63;
-+yy61:
-+yy62:
-+	++YYCURSOR;
- yy63:
- #line 412 "bytecode.re"
--{   CHK_NL(YYCURSOR);
-+	{   CHK_NL(YYCURSOR);
-                 goto Document; }
--#line 936 "<stdout>"
--yy64:	++YYCURSOR;
--	switch((yych = *YYCURSOR)) {
--	case 0x0A:	goto yy67;
-+#line 931 "<stdout>"
-+yy64:
-+	++YYCURSOR;
-+	switch ((yych = *YYCURSOR)) {
-+	case '\n':	goto yy67;
- 	default:	goto yy65;
- 	}
- yy65:
- #line 415 "bytecode.re"
--{   goto Comment; }
--#line 945 "<stdout>"
--yy66:	yych = *++YYCURSOR;
-+	{   goto Comment; }
-+#line 941 "<stdout>"
-+yy66:
-+	yych = *++YYCURSOR;
- 	goto yy65;
--yy67:	++YYCURSOR;
-+yy67:
-+	++YYCURSOR;
- 	yych = *YYCURSOR;
- 	goto yy63;
- }
-@@ -977,23 +966,20 @@ Scalar2:
-     tok = YYCURSOR;
- 
- 
--#line 970 "<stdout>"
-+#line 968 "<stdout>"
- {
- 	YYCTYPE yych;
--	goto yy68;
--	/*@notreached@*/
--	++YYCURSOR;
--yy68:
--	if((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
-+	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
- 	yych = *YYCURSOR;
--	switch(yych){
-+	switch (yych) {
- 	case 0x00:	goto yy74;
--	case 0x0A:	goto yy70;
--	case 0x0D:	goto yy72;
-+	case '\n':	goto yy70;
-+	case '\r':	goto yy72;
- 	default:	goto yy76;
- 	}
--yy70:	++YYCURSOR;
--	switch((yych = *YYCURSOR)) {
-+yy70:
-+	++YYCURSOR;
-+	switch ((yych = *YYCURSOR)) {
- 	case 'C':	goto yy78;
- 	case 'N':	goto yy80;
- 	case 'Z':	goto yy83;
-@@ -1001,50 +987,51 @@ yy70:	++YYCURSOR;
- 	}
- yy71:
- #line 461 "bytecode.re"
--{   YYCURSOR = tok;
-+	{   YYCURSOR = tok;
-             goto ScalarEnd; 
-         }
--#line 996 "<stdout>"
--yy72:	++YYCURSOR;
--	switch((yych = *YYCURSOR)) {
--	case 0x0A:	goto yy77;
-+#line 992 "<stdout>"
-+yy72:
-+	++YYCURSOR;
-+	switch ((yych = *YYCURSOR)) {
-+	case '\n':	goto yy77;
- 	default:	goto yy73;
- 	}
- yy73:
- #line 469 "bytecode.re"
--{   CAT(str, cap, idx, tok[0]);
-+	{   CAT(str, cap, idx, tok[0]);
-             goto Scalar2; 
-         }
--#line 1007 "<stdout>"
--yy74:	++YYCURSOR;
--	goto yy75;
--yy75:
-+#line 1004 "<stdout>"
-+yy74:
-+	++YYCURSOR;
- #line 465 "bytecode.re"
--{   YYCURSOR = tok;
-+	{   YYCURSOR = tok;
-             goto ScalarEnd;
-         }
--#line 1015 "<stdout>"
--yy76:	yych = *++YYCURSOR;
-+#line 1011 "<stdout>"
-+yy76:
-+	yych = *++YYCURSOR;
- 	goto yy73;
--yy77:	yych = *++YYCURSOR;
--	switch(yych){
-+yy77:
-+	yych = *++YYCURSOR;
-+	switch (yych) {
- 	case 'C':	goto yy78;
- 	case 'N':	goto yy80;
- 	case 'Z':	goto yy83;
- 	default:	goto yy71;
- 	}
--yy78:	++YYCURSOR;
--	goto yy79;
--yy79:
-+yy78:
-+	++YYCURSOR;
- #line 435 "bytecode.re"
--{   CHK_NL(tok+1);
-+	{   CHK_NL(tok+1);
-             goto Scalar2; }
--#line 1031 "<stdout>"
--yy80:	++YYCURSOR;
--	if(YYLIMIT == YYCURSOR) YYFILL(1);
-+#line 1028 "<stdout>"
-+yy80:
-+	++YYCURSOR;
-+	if (YYLIMIT <= YYCURSOR) YYFILL(1);
- 	yych = *YYCURSOR;
--	goto yy81;
--yy81:	switch(yych){
-+	switch (yych) {
- 	case '0':
- 	case '1':
- 	case '2':
-@@ -1059,7 +1046,7 @@ yy81:	switch(yych){
- 	}
- yy82:
- #line 438 "bytecode.re"
--{   CHK_NL(tok+1);
-+	{   CHK_NL(tok+1);
-             if ( tok + 2 < YYCURSOR )
-             {
-                 char *count = tok + 2;
-@@ -1076,16 +1063,15 @@ yy82:
-             }
-             goto Scalar2;
-         }
--#line 1068 "<stdout>"
--yy83:	++YYCURSOR;
--	goto yy84;
--yy84:
-+#line 1065 "<stdout>"
-+yy83:
-+	++YYCURSOR;
- #line 456 "bytecode.re"
--{   CHK_NL(tok+1);
-+	{   CHK_NL(tok+1);
-             CAT(str, cap, idx, '\0');
-             goto Scalar2; 
-         }
--#line 1077 "<stdout>"
-+#line 1073 "<stdout>"
- }
- #line 473 "bytecode.re"
- 
-@@ -1122,50 +1108,48 @@ Inline:
-         tok = YYCURSOR;
- 
- 
--#line 1114 "<stdout>"
-+#line 1110 "<stdout>"
- {
- 	YYCTYPE yych;
--	goto yy85;
--	/*@notreached@*/
--	++YYCURSOR;
--yy85:
--	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
-+	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
- 	yych = *YYCURSOR;
--	switch(yych){
-+	switch (yych) {
- 	case 0x00:	goto yy91;
--	case 0x0A:	goto yy87;
--	case 0x0D:	goto yy89;
-+	case '\n':	goto yy87;
-+	case '\r':	goto yy89;
- 	default:	goto yy93;
- 	}
--yy87:	++YYCURSOR;
--	goto yy88;
-+yy87:
-+	++YYCURSOR;
- yy88:
- #line 508 "bytecode.re"
--{   CHK_NL(YYCURSOR);
-+	{   CHK_NL(YYCURSOR);
-                 return str; }
--#line 1134 "<stdout>"
--yy89:	++YYCURSOR;
--	switch((yych = *YYCURSOR)) {
--	case 0x0A:	goto yy94;
-+#line 1127 "<stdout>"
-+yy89:
-+	++YYCURSOR;
-+	switch ((yych = *YYCURSOR)) {
-+	case '\n':	goto yy94;
- 	default:	goto yy90;
- 	}
- yy90:
- #line 515 "bytecode.re"
--{   CAT(str, cap, idx, tok[0]);
-+	{   CAT(str, cap, idx, tok[0]);
-                 goto Inline; 
-             }
--#line 1145 "<stdout>"
--yy91:	++YYCURSOR;
--	goto yy92;
--yy92:
-+#line 1139 "<stdout>"
-+yy91:
-+	++YYCURSOR;
- #line 511 "bytecode.re"
--{   YYCURSOR = tok;
-+	{   YYCURSOR = tok;
-                 return str;
-             }
--#line 1153 "<stdout>"
--yy93:	yych = *++YYCURSOR;
-+#line 1146 "<stdout>"
-+yy93:
-+	yych = *++YYCURSOR;
- 	goto yy90;
--yy94:	++YYCURSOR;
-+yy94:
-+	++YYCURSOR;
- 	yych = *YYCURSOR;
- 	goto yy88;
- }
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
deleted file mode 100644
index 5fb40b6..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-fix a endian incompatible error in generating rpm tag
-
-A flaw was found in the way rpm generating arbitrary tags, which leads to a
-incorrect query result, this issue is introduced by a incompatible endianess
-when the generating process is executed on different architectures.
-
-This patch resolves it by taking the byte order that host uses.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
----
- tagname.c |   16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-Index: rpm-5.4.14/rpmdb/tagname.c
-===================================================================
---- rpm-5.4.14.orig/rpmdb/tagname.c
-+++ rpm-5.4.14/rpmdb/tagname.c
-@@ -3,6 +3,19 @@
-  */
- 
- #include "system.h"
-+#include <endian.h>
-+
-+/* Don't redefine this macro if it already exists */
-+#ifndef le32toh
-+#ifdef __USE_BSD
-+#include <byteswap.h>
-+#if __BYTE_ORDER == __LITTLE_ENDIAN
-+#define le32toh(x) (x)
-+#else
-+#define le32toh(x) __bswap_32(x)
-+#endif
-+#endif /* __USE_BSD */
-+#endif /* le32toh */
- 
- #include <rpmio_internal.h>	/* XXX DIGEST_CTX, xtolower, xstrcasecmp */
- #include <rpmmacro.h>
-@@ -152,7 +165,10 @@ static rpmTag _tagGenerate(const char *s
-     xx = rpmDigestUpdate(ctx, s, nb);
-     xx = rpmDigestFinal(ctx, &digest, &digestlen, 0);
-     if (digest && digestlen > 4) {
-+	/* The tag is stored in a uniform byte order for cross-endian compatibility.
-+	   Swap to the host uses. */
- 	memcpy(&tag, digest + (digestlen - 4), 4);
-+	tag = le32toh(tag);
- 	tag = (rpmTag) (tag & 0x3fffffff);
- 	tag = (rpmTag) (tag | 0x40000000);
-     }
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch b/meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch
deleted file mode 100644
index 9eb675b..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-rpmdb/tagname.c: Add the 0x54aafb71 (filenames) type to rpmTagGetType
-
-There is already a workaround in the _tagName function to show that the
-special 'filenames' item is value.  This adds a similar patch to the
-_tagType to return the proper type, otherwise it comes back as a simple
-RPM_STRING_ARRAY_TYPE which limits the response to the first element.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.15/rpmdb/tagname.c
-===================================================================
---- rpm-5.4.15.orig/rpmdb/tagname.c
-+++ rpm-5.4.15/rpmdb/tagname.c
-@@ -353,6 +353,9 @@ static unsigned int _tagType(rpmTag tag)
-     case RPMDBI_RECNO:
-     case RPMDBI_HEAP:
- 	break;
-+    /* XXX make sure that h.['filenames'] in python "works". */
-+    case 0x54aafb71:
-+	return (RPM_STRING_ARRAY_TYPE + RPM_ARRAY_RETURN_TYPE);
-     default:
- 	if (_rpmTags.byValue == NULL)
- 	    break;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
deleted file mode 100644
index 72d3509..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Source: None
-Upstream-Status: Submitted [RPM5 maintainer]
-Author: Khem Raj <raj.khem@gmail.com>
-Date: 2011-03-03
-Description:
-This patch fixes build issue found when compiling rpm-native on ubuntu
-11.04-alpha. Problem is that linker does not get correct set of dependent
-libraries when linking mtree binary which results in undefined symbols
-in librpmio.so. This patch adds correct flags to mtree_LDADD to account
-for rpmio deps
-
-Index: rpm-5.4.14/tools/Makefile.am
-===================================================================
---- rpm-5.4.14.orig/tools/Makefile.am
-+++ rpm-5.4.14/tools/Makefile.am
-@@ -186,7 +186,7 @@ grep_LDADD =		$(RPMIO_LDADD_COMMON)
- 
- mtree_SOURCES =		rpmmtree.c
- mtree_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
--mtree_LDADD =		$(RPM_LDADD_COMMON)
-+mtree_LDADD =		$(RPMIO_LDADD_COMMON)
- 
- rpmrepo_SOURCES =	rpmrepo.c
- rpmrepo_CPPFLAGS =	$(AM_CPPFLAGS) -I$(top_srcdir)/scripts -I$(top_builddir)/scripts $(CPPFLAGS)
diff --git a/meta/recipes-devtools/rpm/rpm/rpmatch.patch b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
deleted file mode 100644
index 9bbf580..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpmatch.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Create a compatable macro if rpmatch() is not provided by the C library.
-
-This uses an existing configure check.
-
-This is needed for uclibc since it does not have the above function
-implemented.
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Updated to rpm 5.4.15+.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/system.h
-===================================================================
---- rpm.orig/system.h
-+++ rpm/system.h
-@@ -358,6 +358,14 @@ extern int _tolower(int) __THROW	/*@*/;
- #include <libgen.h>
- #endif
- 
-+#ifndef HAVE_RPMATCH
-+#define rpmatch(line) \
-+	( (line == NULL)? -1 : \
-+	  (*line == 'y' || *line == 'Y')? 1 : \
-+	  (*line == 'n' || *line == 'N')? 0 : \
-+	  -1 )
-+#endif
-+
- /* -- Retrofit glibc __progname */
- #if defined __GLIBC__ && __GLIBC__ >= 2
- #if __GLIBC_MINOR__ >= 1
diff --git a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
deleted file mode 100644
index b2437a8..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e8bae261615e19ff8a28683765c9539cfb22a086 Mon Sep 17 00:00:00 2001
-From: Joe Slater <jslater@windriver.com>
-Date: Thu, 17 Jul 2014 18:14:54 -0700
-Subject: [PATCH 1/9] rpm: compile rpmqv.c instead of rpmqv.cc
-
-Some versions of gcc, 4.4.5 for example, will put a reference to __gxx_personality_v0
-into rpm.o and rpmbuild.o.  This means we must link with g++, and the Makefile we
-generate does not.
-
-So, go back to using rpmqv.c (which is currently identical to rpmqv.cc).
-
-Upstream-Status: Inappropriate [other]
-
-   When linking with g++ is really necessary, the upstream package will do that.
-
-Also instead of symlinking files in two places, which can and does race in
-parallel builds, simply refer to the file's full location [RB]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- Makefile.am | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 1dade0a..55f8669 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -201,15 +201,13 @@ rpm_SOURCES =		build.c
- rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
- rpm_LDADD =		rpm.o $(myLDADD)
- rpm.o:	$(top_srcdir)/rpmqv.c
--	ln -sf $< rpmqv.cc
--	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c rpmqv.cc
-+	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $^
- 
- rpmbuild_SOURCES =	build.c
- rpmbuild_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
- rpmbuild_LDADD =	rpmbuild.o $(myLDADD)
- rpmbuild.o:	$(top_srcdir)/rpmqv.c
--	ln -sf $< rpmqv.cc
--	$(COMPILE) -DIAM_RPMBT -o $@ -c rpmqv.cc
-+	$(COMPILE) -DIAM_RPMBT -o $@ -c $^
- 
- .syntastic_c_config: Makefile
- 	@echo $(COMPILE) | tr ' ' '\n' | sed -e '1d' > $@
--- 
-2.7.0
-
diff --git a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
deleted file mode 100644
index dc7b048..0000000
--- a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Define the x* wrappers for uclibc as well
-
-Upstream-Status: Submitted [RPM5 maintainer]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: rpm/rpmio/rpmio.h
-===================================================================
---- rpm.orig/rpmio/rpmio.h
-+++ rpm/rpmio/rpmio.h
-@@ -23,7 +23,8 @@
-  */
- /*@{*/
- #if !defined(__LCLINT__) && !defined(__UCLIBC__) && defined(__GLIBC__) && \
--	(__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2))
-+	(__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2)) && \
-+	!defined(__UCLIBC__)
- #define USE_COOKIE_SEEK_POINTER 1
- typedef _IO_off64_t 	_libio_off_t;
- typedef _libio_off_t *	_libio_pos_t;
-Index: rpm/system.h
-===================================================================
---- rpm.orig/system.h
-+++ rpm/system.h
-@@ -489,7 +489,7 @@ extern void muntrace (void)
- #endif /* defined(__LCLINT__) */
- 
- /* Memory allocation via macro defs to get meaningful locations from mtrace() */
--#if defined(__GNUC__)
-+#if defined(__GNUC__) || defined(__UCLIBC__)
- #define	xmalloc(_size) 		(malloc(_size) ? : vmefail(_size))
- #define	xcalloc(_nmemb, _size)	(calloc((_nmemb), (_size)) ? : vmefail(_size))
- #define	xrealloc(_ptr, _size)	(realloc((_ptr), (_size)) ? : vmefail(_size))
-Index: rpm/lib/librpm.vers
-===================================================================
---- rpm.orig/lib/librpm.vers
-+++ rpm/lib/librpm.vers
-@@ -406,6 +406,10 @@ LIBRPM_0
-     specedit;
-     strict_erasures;
-     XrpmtsiInit;
-+    xmalloc;
-+    xrealloc;
-+    xcalloc;
-+    xstrdup;
-   local:
-     *;
- };
-Index: rpm/rpmio/librpmio.vers
-===================================================================
---- rpm.orig/rpmio/librpmio.vers
-+++ rpm/rpmio/librpmio.vers
-@@ -1455,6 +1455,10 @@ LIBRPMIO_0
-     _mongoc_write_result_init;
-     _mongoc_write_result_merge;
-     _mongoc_write_result_merge_legacy;
-+    xmalloc;
-+    xrealloc;
-+    xcalloc;
-+    xstrdup;
-   local:
-     *;
- };
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.17.bb
similarity index 80%
rename from meta/recipes-devtools/rpm/rpm_5.4.16.bb
rename to meta/recipes-devtools/rpm/rpm_5.4.17.bb
index 17c5818..bd34ab5 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.17.bb
@@ -37,7 +37,7 @@ supplied by the RPM Package Manager libraries."
 HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
-LIC_FILES_CHKSUM += "file://rpmio/mongo.c;begin=5;end=18;md5=d8327ba2c71664c059143e6d333b8901"
+LIC_FILES_CHKSUM += "file://rpmio/mongoc.c;begin=5;end=18;md5=f6e9bbf85d19f4a9489a7d75d190531a"
 
 # We must have gettext-native, we need gettextize, which may not be provided
 DEPENDS = "libpcre attr acl ossp-uuid file byacc-native gettext-native"
@@ -46,105 +46,53 @@ DEPENDS_append_class-native = " file-replacement-native"
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
 
-# There is no official 5.4.16 release yet, so start w/ 5.4.15 and patch it
-# based on CVS
-S = "${WORKDIR}/rpm-5.4.15"
-
-SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.15-0.20140824.src.rpm;name=srpm;extract=rpm-5.4.15.tar.gz \
-	   http://downloads.yoctoproject.org/releases/rpm5/rpm-5.4.15-to-5.4.16-20160225.patch.gz;name=rpm-patch \
-	   http://downloads.yoctoproject.org/releases/rpm5/syck-5.4.15-to-5.4.16-20160225.patch.gz;name=syck-patch \
-	   http://downloads.yoctoproject.org/releases/rpm5/beecrypt-5.4.15-to-5.4.16-20160225.patch.gz;name=beecrypt-patch \
-	   http://downloads.yoctoproject.org/releases/rpm5/lua-5.4.15-to-5.4.16-20160225.patch.gz;name=lua-patch \
+SRC_URI = "http://rpm5.org/files/rpm/rpm-5.4/rpm-5.4.17-0.20160512.src.rpm;name=srpm;extract=rpm-5.4.17.tar.gz \
 	   file://perfile_rpmdeps.sh \
 	   file://pythondeps.sh \
 "
 
-SRC_URI[srpm.md5sum] = "d53782842ac11b3100a43fb2958c9bc0"
-SRC_URI[srpm.sha256sum] = "d4ae5e9ed5df8ab9931b660f491418d20ab5c4d72eb17ed9055b80b71ef6c4ee"
-
-SRC_URI[rpm-patch.md5sum] = "8b7deb1c9574d3d47ed8ba8c690fd8bf"
-SRC_URI[rpm-patch.sha256sum] = "1c1983d001b04eaa23eb2c8d9598b9d0899acb0a89f54a2d4c4e974086fd17a5"
-
-SRC_URI[syck-patch.md5sum] = "f31d7a32105a364688354419ec3559e4"
-SRC_URI[syck-patch.sha256sum] = "4dd1d04489206d8b5d1970f2a8d143a002f2895cefbe15d73459785096545e8a"
-
-SRC_URI[beecrypt-patch.md5sum] = "9e71ee3ccb0a52985a071dd250279132"
-SRC_URI[beecrypt-patch.sha256sum] ="df7c0708a7fab9bdf6d46194519b42e736f99cb0599dcc1c3c1bf1b228705cde"
+SRC_URI[srpm.md5sum] = "8ec21b1e800f697e7879c4d54a94c2a0"
+SRC_URI[srpm.sha256sum] = "f528c951a5d754dcc054be36b8301bcca5b7efa483dafaee69a320d87e25bfda"
 
-SRC_URI[lua-patch.md5sum] = "ca10d03d83b1fc1c31a0b50819534cd7"
-SRC_URI[lua-patch.sha256sum] = "6bde435cc827a7d4b2520e8f3e1c9bd2ca74375de0a4402aa99ef4d48eab9a7e"
+#SRC_URI[rpm-patch.md5sum] = "8b7deb1c9574d3d47ed8ba8c690fd8bf"
+#SRC_URI[rpm-patch.sha256sum] = "1c1983d001b04eaa23eb2c8d9598b9d0899acb0a89f54a2d4c4e974086fd17a5"
+#
+#SRC_URI[syck-patch.md5sum] = "f31d7a32105a364688354419ec3559e4"
+#SRC_URI[syck-patch.sha256sum] = "4dd1d04489206d8b5d1970f2a8d143a002f2895cefbe15d73459785096545e8a"
+#
+#SRC_URI[beecrypt-patch.md5sum] = "9e71ee3ccb0a52985a071dd250279132"
+#SRC_URI[beecrypt-patch.sha256sum] ="df7c0708a7fab9bdf6d46194519b42e736f99cb0599dcc1c3c1bf1b228705cde"
+#
+#SRC_URI[lua-patch.md5sum] = "ca10d03d83b1fc1c31a0b50819534cd7"
+#SRC_URI[lua-patch.sha256sum] = "6bde435cc827a7d4b2520e8f3e1c9bd2ca74375de0a4402aa99ef4d48eab9a7e"
 
 # Bug fixes
 SRC_URI += " \
-	   file://header-include-fix.patch \
-	   file://rpm-libsql-fix.patch \
-	   file://rpm-platform.patch \
-	   file://rpm-platform2.patch \
-	   file://rpm-tools-mtree-LDFLAGS.patch \
-	   file://rpm-canonarch.patch \
-	   file://rpm-no-loopmsg.patch \
-	   file://rpm-resolvedep.patch \
-	   file://rpm-packageorigin.patch \
-	   file://uclibc-support.patch \
-	   file://rpmatch.patch \
-	   file://makefile-am-exec-hook.patch \
-	   file://python-rpm-rpmsense.patch \
-	   file://debugedit-segv.patch \
-	   file://debugedit-valid-file-to-fix-segment-fault.patch \
-	   file://rpm-platform-file-fix.patch \
-	   file://rpm-lsb-compatibility.patch \
-	   file://rpm-tag-generate-endian-conversion-fix.patch \
-	   file://rpm-hardlink-segfault-fix.patch \
-	   file://rpm-payload-use-hashed-inode.patch \
-	   file://rpm-fix-logio-cp.patch \
-	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
-	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
-	   file://0001-define-EM_AARCH64.patch \
-	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
-	   file://rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch \
-	   file://rpm-mongodb-sasl.patch \
-	   file://rpm-fix-parseEmbedded.patch \
-	   file://rpm-rpmio-headers.patch \
-	   file://rpm-python-restore-origin.patch \
-	   file://rpm-keccak-sse-intrin.patch \
-	   file://rpm-atomic-ops.patch \
-	   file://rpm-gnu-atomic.patch \
-	   file://rpm-tagname-type.patch \
-	   file://rpm-python-tagname.patch \
-	   file://rpm-python-AddErase.patch \
 	   file://rpm-rpmpgp-popt.patch \
-	   file://rpm-fix-lua-tests-compilation-failure.patch \
 	   file://rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch \
-	   file://0001-Disable-__sync_add_and_fetch_8-on-nios2.patch \
 	   file://gcc6-stdlib.patch \
 	   file://0001-system.h-query.c-support-nosignature.patch \
 	   file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch \
-	   file://0001-macros-add-_gpg_sign_cmd_extra_args.patch \
 "
 
 # OE specific changes
 SRC_URI += " \
-	   file://rpm-log-auto-rm.patch \
-	   file://rpm-db-reduce.patch \
-	   file://rpm-autogen.patch \
-	   file://rpm-showrc.patch \
-	   file://rpm-fileclass.patch \
-	   file://rpm-scriptletexechelper.patch \
-	   file://rpmdeps-oecore.patch \
-	   file://rpm-no-perl-urpm.patch \
+           file://rpm-log-auto-rm.patch \
+           file://rpm-db-reduce.patch \
+           file://rpm-autogen.patch \
+           file://rpm-showrc.patch \
+           file://rpm-fileclass.patch \
+           file://rpm-scriptletexechelper.patch \
+           file://rpmdeps-oecore.patch \
+           file://rpm-no-perl-urpm.patch \
 	   file://rpm-macros.patch \
 	   file://rpm-lua.patch \
 	   file://rpm-ossp-uuid.patch \
 	   file://rpm-uuid-include.patch \
 	   file://rpm-pkgconfigdeps.patch \
 	   file://no-ldflags-in-pkgconfig.patch \
-	   file://dbconvert.patch \
-	   file://rpm-db_buffer_small.patch \
-	   file://rpm-py-init.patch \
-	   file://rpm-reloc-macros.patch \
 	   file://rpm-db5-or-db6.patch \
 	   file://rpm-db60.patch \
-	   file://rpmqv_cc_b_gone.patch \
 	   file://rpm-realpath.patch \
 	   file://rpm-check-rootpath-reasonableness.patch \
 	   file://rpm-macros.in-disable-external-key-server.patch \
@@ -153,10 +101,11 @@ SRC_URI += " \
 	   file://popt-disable-auto-stack-protector.patch \
 	   file://rpm-syck-fix-gram.patch \
 	   file://rpm-rpmdb-grammar.patch \
-	   file://rpm-disable-blaketest.patch \
 	   file://rpm-autogen-force.patch \
 	   file://rpmdb-prevent-race-in-tmpdir-creation.patch \
 	   file://rpmdb-more-verbose-error-logging-in-rpmTempFile.patch \
+	   file://0001-Fix-a-build-error.patch \
+	   file://Fix-a-fPIC-build-problem.patch \
 "
 
 SRC_URI_append_libc-musl = "\
@@ -169,7 +118,7 @@ SRC_URI_append_libc-musl = "\
 
 UPSTREAM_CHECK_REGEX = "rpm-(?P<pver>(\d+[\.\-_]*)+)-.*$"
 
-inherit autotools gettext pkgconfig python-dir
+inherit autotools gettext python-dir
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
@@ -400,6 +349,7 @@ FILES_${PN}-libs = "${libdir}/librpm-*.so \
 		${libdir}/librpmio-*.so \
 		${libdir}/librpmmisc-*.so \
 		${libdir}/librpmbuild-*.so \
+		${libdir}/rpm/bin/dbconvert \
 		"
 
 FILES_${PN}-build = "${prefix}/src/rpm \
@@ -486,7 +436,7 @@ PROVIDES += "python-rpm"
 FILES_perl-module-rpm = "${libdir}/perl/*/* \
 		"
 
-RDEPENDS_${PN}-dev += "bash"
+RDEPENDS_${PN}-dev += "bash pkgconfig"
 
 FILES_${PN}-dev = "${includedir}/rpm \
 		${libdir}/librpm.la \
@@ -627,19 +577,20 @@ def multilib_rpmmacros(d):
     localdata.delVar('TOOLCHAIN_OPTIONS')
 
     # Set 'localdata' values to be consistent with 'd' values.
-    distromacrodirVal = d.getVar('distromacrodir')
-    workdirVal = d.getVar('WORKDIR')
-    dval = d.getVar('D')
+    distromacrodirVal = d.getVar('distromacrodir', True)
+    workdirVal = d.getVar('WORKDIR', True)
+    dval = d.getVar('D', True)
 
     ret = gen_arch_macro(localdata)
 
-    variants = d.getVar("MULTILIB_VARIANTS") or ""
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
     for item in variants.split():
         # Load overrides from 'd' to avoid having to reset the value...
         localdata = d.createCopy()
         overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", item + "-")
+        bb.data.update_data(localdata)
         localdata.setVar('WORKDIR', workdirVal)
         localdata.setVar('distromacrodir', distromacrodirVal)
         localdata.setVar('D', dval)
@@ -656,17 +607,17 @@ def gen_arch_macro(d):
     val += "\n"
     val += "# Toolchain configuration\n"
     val += "%TOOLCHAIN_OPTIONS  %{nil}\n"
-    val += "%__ar               ${@d.getVar('AR').replace('$','%')}\n"
-    val += "%__as               ${@d.getVar('AS').replace('$','%')}\n"
-    val += "%__cc               ${@d.getVar('CC').replace('$','%')}\n"
-    val += "%__cpp              ${@d.getVar('CPP').replace('$','%')}\n"
-    val += "%__cxx              ${@d.getVar('CXX').replace('$','%')}\n"
-    val += "%__ld               ${@d.getVar('LD').replace('$','%')}\n"
-    val += "%__nm               ${@d.getVar('NM').replace('$','%')}\n"
-    val += "%__objcopy          ${@d.getVar('OBJCOPY').replace('$','%')}\n"
-    val += "%__objdump          ${@d.getVar('OBJDUMP').replace('$','%')}\n"
-    val += "%__ranlib           ${@d.getVar('RANLIB').replace('$','%')}\n"
-    val += "%__strip            ${@d.getVar('STRIP').replace('$','%')}\n"
+    val += "%__ar               ${@d.getVar('AR', True).replace('$','%')}\n"
+    val += "%__as               ${@d.getVar('AS', True).replace('$','%')}\n"
+    val += "%__cc               ${@d.getVar('CC', True).replace('$','%')}\n"
+    val += "%__cpp              ${@d.getVar('CPP', True).replace('$','%')}\n"
+    val += "%__cxx              ${@d.getVar('CXX', True).replace('$','%')}\n"
+    val += "%__ld               ${@d.getVar('LD', True).replace('$','%')}\n"
+    val += "%__nm               ${@d.getVar('NM', True).replace('$','%')}\n"
+    val += "%__objcopy          ${@d.getVar('OBJCOPY', True).replace('$','%')}\n"
+    val += "%__objdump          ${@d.getVar('OBJDUMP', True).replace('$','%')}\n"
+    val += "%__ranlib           ${@d.getVar('RANLIB', True).replace('$','%')}\n"
+    val += "%__strip            ${@d.getVar('STRIP', True).replace('$','%')}\n"
     val += "EOF\n"
     val += "\n"
     return d.expand(val)
@@ -674,30 +625,30 @@ def gen_arch_macro(d):
 
 add_native_wrapper() {
         create_wrapper ${D}/${bindir}/rpm \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpm2cpio \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpmbuild \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpmconstant \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
 	for rpm_binary in ${D}/${libdir}/rpm/bin/rpm* ${D}/${libdir}/rpm/bin/debugedit; do
         	create_wrapper $rpm_binary \
-			RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
-			RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
-			RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
+			RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+			RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+			RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 	done
 }
 
-- 
2.7.4




