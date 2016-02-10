Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 493A673198
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:41 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id b35so1746080qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6hRlJ+csY3VwZJA5uAZd0T+N3VT82fsXOIYvU42z54U=;
	b=LzfZoFaein/5looAc80wMVeWhw7Yjbn56idNej+oIm9uiS214YeAIutwlWmWBppStd
	FPGlt0jRjULvbbXL5MtWkAOzSKaaPBhMaRRtj3eLLPqUVlf1/fIS4Ahd8eKuAJlFBbN0
	j/+JGHAtqzkHFPm4iKDMMwIp5SM6HzNnc+wUdXEShzV2OGAGV7PDrX7mDe2vYvNOh1+3
	R1Kf7cN8wr6LE6b72wRSwzpKTnCRCqUZEXe+fBYuCfFRcvJosp+SGbxKDEOKhiv7s16v
	twayh0PjCE3wRi99x7zTdyDIkZRjyqbmmq7TJTxXpU+AemXpbMsJCx1LOPyZF2q3B7dT
	NmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6hRlJ+csY3VwZJA5uAZd0T+N3VT82fsXOIYvU42z54U=;
	b=IpI1JPn7A1xsmS5q9MJQ4iySrw4yQJEQJtVF1dFOPJzp7gZnpQ7+ynAYX/htN0DVQP
	Lca1LY1/OqwsY8hhVKLaSssMirLdhT0KwDFZTsySiRSF9nOJFLN2atp8QfK4AAQgdKgJ
	E5iiPgvuABHnB1UIng8aR0Fla9YOjZ3yODC8Tgf8xh6jae0xNzvbZCpNTQ0FTTZz8cHh
	scTNJJ4LLhLrBo/MNvVXjTz81ounEGFAh108NXfsX53BL6SpXmxHEtrhJgm6RAeq/6as
	RrQErfxenREPYXOYX9iWz3VTum49pWD7SxVh3W5Xz344THpLl6Bedazd0eiZh99xQpQL
	N8Cg==
X-Gm-Message-State: AG10YOS7OJkXzEZHKl8dlZU5dG9C/5zjeYuRQpGP2vd8/dYQ9IFqP/COeKLZm9eTpWPSyg==
X-Received: by 10.140.39.179 with SMTP id v48mr49908602qgv.98.1455126221841;
	Wed, 10 Feb 2016 09:43:41 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:29 +0000
Message-Id: <216ce45325c2608c2f9b1fece5dee005e6ee2ba7.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 2/9] ltp: Upgrade to 20160126 and fix build on musl
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch |  79 -----
 ...tests_noltp.sh-script-so-have-unique-name.patch | 202 -----------
 ...tch => 0001-ltp-Don-t-link-against-libfl.patch} |  11 +-
 ...-control-whether-numa-support-should-be-c.patch |  43 +++
 ...> 0003-Add-knob-to-control-tirpc-support.patch} |  20 +-
 ...-Add-option-to-select-libc-implementation.patch | 147 ++++++++
 ...rollers-Link-with-libfts-explicitly-on-mu.patch |  45 +++
 ...sendfile-Use-off64_t-instead-of-__off64_t.patch |  31 ++
 .../ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch | 394 +++++++++++++++++++++
 ...__GLIBC_PREREQ-is-defined-before-using-it.patch | 279 +++++++++++++++
 .../ltp/0009-Guard-error.h-with-__GLIBC__.patch    | 270 ++++++++++++++
 ...010-replace-__BEGIN_DECLS-and-__END_DECLS.patch |  73 ++++
 .../0011-Rename-sigset-variable-to-sigset1.patch   | 136 +++++++
 ...fsstress.c-Replace-__int64_t-with-int64_t.patch | 351 ++++++++++++++++++
 ...nclude-fcntl.h-for-getting-O_-definitions.patch |  67 ++++
 ...ing-Include-sys-types.h-for-pid_t-definit.patch |  56 +++
 ...015-mincore01-Rename-PAGESIZE-to-pagesize.patch |  64 ++++
 ...Change-header-from-ustat.h-to-sys-ustat.h.patch |  45 +++
 .../0017-replace-sigval_t-with-union-sigval.patch  |  88 +++++
 .../ltp/0018-guard-mallocopt-with-__GLIBC__.patch  |  32 ++
 ...lace-canonicalize_file_name-with-realpath.patch |  32 ++
 ...define-getdents-getdents64-only-for-glibc.patch |  48 +++
 ..._GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch |  71 ++++
 .../ltp/ltp/0022-include-sys-types.h.patch         |  29 ++
 ...-Use-int-instead-of-enum-__ptrace_request.patch |  48 +++
 ...gaction-rt_sigprocmark-Define-_GNU_SOURCE.patch |  68 ++++
 .../ltp/0025-mc_gethost-include-sys-types.h.patch  |  28 ++
 .../ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch  |  29 ++
 ...sconf01-Use-_SC_2_C_VERSION-conditionally.patch |  29 ++
 ...n.h-Use-sighandler_t-instead-of-__sighand.patch |  43 +++
 .../ltp/0029-trace_shed-Fix-build-with-musl.patch  |  32 ++
 ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |  33 ++
 ...ge-size-offset-as-per-page-size-alignmen.patch} |  17 +-
 ...-regen.sh-Include-asm-unistd.h-explicitly.patch |  30 ++
 .../ltp/ltp/add-knob-for-numa.patch                |  39 --
 .../ltp/ltp/make-setregid02-work.patch             |  61 ----
 .../ltp/{ltp_20150903.bb => ltp_20160126.bb}       |  44 ++-
 37 files changed, 2704 insertions(+), 410 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
 rename meta/recipes-extended/ltp/ltp/{ltp-Do-not-link-against-libfl.patch => 0001-ltp-Don-t-link-against-libfl.patch} (76%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
 rename meta/recipes-extended/ltp/ltp/{add-knob-for-tirpc.patch => 0003-Add-knob-to-control-tirpc-support.patch} (54%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
 rename meta/recipes-extended/ltp/ltp/{0001-ltp-vma03-fix-the-alginment-of-page-size.patch => 0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch} (71%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/make-setregid02-work.patch
 rename meta/recipes-extended/ltp/{ltp_20150903.bb => ltp_20160126.bb} (60%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch b/meta/recipes-extended/ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch
deleted file mode 100644
index 9407a34..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 40a2457cb8ec42a05a2f96b0810057efdb2a55f5 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Wed, 16 Sep 2015 13:23:43 +0200
-Subject: [PATCH] Fix compilation for gcc-5.x
-
-The gcc-5.x defaults to -std=gnu11 instead of -std=gnu89 which causes
-semantics for inline functions changes.
-
-GNU89 inline: Same as C99 extern inline.
-
-So the standalone 'inline' causes error such as:
-
-git/testcases/kernel/syscalls/kill/kill10.c:355: undefined reference to `k_sigaction'
-
-Replace inline with static inline to fix this issue.
-
-Ref:
-https://gcc.gnu.org/gcc-5/porting_to.html
-
-Upstream-Status: Backport
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
----
- testcases/kernel/controllers/libcontrollers/libcontrollers.c | 2 +-
- testcases/kernel/controllers/libcontrollers/libcontrollers.h | 2 +-
- testcases/kernel/syscalls/kill/kill10.c                      | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.c b/testcases/kernel/controllers/libcontrollers/libcontrollers.c
-index 844c5bc..75766fc 100644
---- a/testcases/kernel/controllers/libcontrollers/libcontrollers.c
-+++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.c
-@@ -158,7 +158,7 @@ int read_file(char *filepath, int action, unsigned int *value)
-  * Prints error message and returns -1
-  */
- 
--inline void error_function(char *msg1, char *msg2)
-+static inline void error_function(char *msg1, char *msg2)
- {
- 	fprintf(stdout, "ERROR: %s ", msg1);
- 	fprintf(stdout, "%s\n", msg2);
-diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.h b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
-index bd8e2d8..cdde9f9 100644
---- a/testcases/kernel/controllers/libcontrollers/libcontrollers.h
-+++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
-@@ -70,7 +70,7 @@ enum{
- 	GET_TASKS
- };
- 
--inline void error_function(char *msg1, char *msg2);
-+static inline void error_function(char *msg1, char *msg2);
- 
- int read_shares_file(char *filepath);
- 
-diff --git a/testcases/kernel/syscalls/kill/kill10.c b/testcases/kernel/syscalls/kill/kill10.c
-index 982d9da..33dbcd3 100644
---- a/testcases/kernel/syscalls/kill/kill10.c
-+++ b/testcases/kernel/syscalls/kill/kill10.c
-@@ -185,7 +185,7 @@ int child_checklist_total = 0;
- int checklist_cmp(const void *a, const void *b);
- void checklist_reset(int bit);
- 
--inline int k_sigaction(int sig, struct sigaction *sa, struct sigaction *osa);
-+static inline int k_sigaction(int sig, struct sigaction *sa, struct sigaction *osa);
- 
- char *TCID = "kill10";
- int TST_TOTAL = 1;
-@@ -756,7 +756,7 @@ void checklist_reset(int bit)
- 
- }
- 
--inline int k_sigaction(int sig, struct sigaction *sa, struct sigaction *osa)
-+static inline int k_sigaction(int sig, struct sigaction *sa, struct sigaction *osa)
- {
- 	int ret;
- 	if ((ret = sigaction(sig, sa, osa)) == -1) {
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
deleted file mode 100644
index 1b4d232..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-From 9751a6526cffcdf4e3dc2cb33641259a7be00e19 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 7 Dec 2013 18:24:32 +0100
-Subject: [PATCH] Rename runtests_noltp.sh script so have unique name
-
-* they are installed in the same target path
-  /opt/ltp/testcases/bin/runtests_noltp.sh
-  and overwrite each other in non-deterministic way
-  when multiple processes are used in "make install"
-
-  ./temp/log.do_install:install -m 00775
-    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/sysvipc/runtests_noltp.sh"
-    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
-  ./temp/log.do_install:install -m 00775
-    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/utsname/runtests_noltp.sh"
-    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- .../kernel/containers/sysvipc/runipctests_noltp.sh | 31 ++++++++++++++++
- .../kernel/containers/sysvipc/runtests_noltp.sh    | 31 ----------------
- .../kernel/containers/utsname/runtests_noltp.sh    | 41 ----------------------
- .../kernel/containers/utsname/runutstests_noltp.sh | 41 ++++++++++++++++++++++
- 4 files changed, 72 insertions(+), 72 deletions(-)
- create mode 100644 testcases/kernel/containers/sysvipc/runipctests_noltp.sh
- delete mode 100644 testcases/kernel/containers/sysvipc/runtests_noltp.sh
- delete mode 100755 testcases/kernel/containers/utsname/runtests_noltp.sh
- create mode 100755 testcases/kernel/containers/utsname/runutstests_noltp.sh
-
-diff --git a/testcases/kernel/containers/sysvipc/runipctests_noltp.sh b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
-new file mode 100644
-index 0000000..84f398f
---- /dev/null
-+++ b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
-@@ -0,0 +1,31 @@
-+#!/bin/sh
-+################################################################################
-+##                                                                            ##
-+## Copyright (c) International Business Machines  Corp., 2007                 ##
-+##                                                                            ##
-+## This program is free software;  you can redistribute it and#or modify      ##
-+## it under the terms of the GNU General Public License as published by       ##
-+## the Free Software Foundation; either version 2 of the License, or          ##
-+## (at your option) any later version.                                        ##
-+##                                                                            ##
-+## This program is distributed in the hope that it will be useful, but        ##
-+## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
-+## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
-+## for more details.                                                          ##
-+##                                                                            ##
-+## You should have received a copy of the GNU General Public License          ##
-+## along with this program;  if not, write to the Free Software               ##
-+## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
-+##                                                                            ##
-+################################################################################
-+
-+exit_code=0
-+echo "sysvipc tests"
-+for type in none clone unshare; do
-+      echo "**sysvipc $type"
-+      ./shmnstest_noltp $type
-+      if [ $? -ne 0 ]; then
-+              exit_code=$?
-+      fi
-+done
-+exit $exit_code
-diff --git a/testcases/kernel/containers/sysvipc/runtests_noltp.sh b/testcases/kernel/containers/sysvipc/runtests_noltp.sh
-deleted file mode 100644
-index 84f398f..0000000
---- a/testcases/kernel/containers/sysvipc/runtests_noltp.sh
-+++ /dev/null
-@@ -1,31 +0,0 @@
--#!/bin/sh
--################################################################################
--##                                                                            ##
--## Copyright (c) International Business Machines  Corp., 2007                 ##
--##                                                                            ##
--## This program is free software;  you can redistribute it and#or modify      ##
--## it under the terms of the GNU General Public License as published by       ##
--## the Free Software Foundation; either version 2 of the License, or          ##
--## (at your option) any later version.                                        ##
--##                                                                            ##
--## This program is distributed in the hope that it will be useful, but        ##
--## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
--## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
--## for more details.                                                          ##
--##                                                                            ##
--## You should have received a copy of the GNU General Public License          ##
--## along with this program;  if not, write to the Free Software               ##
--## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
--##                                                                            ##
--################################################################################
--
--exit_code=0
--echo "sysvipc tests"
--for type in none clone unshare; do
--      echo "**sysvipc $type"
--      ./shmnstest_noltp $type
--      if [ $? -ne 0 ]; then
--              exit_code=$?
--      fi
--done
--exit $exit_code
-diff --git a/testcases/kernel/containers/utsname/runtests_noltp.sh b/testcases/kernel/containers/utsname/runtests_noltp.sh
-deleted file mode 100755
-index 43cb7e2..0000000
---- a/testcases/kernel/containers/utsname/runtests_noltp.sh
-+++ /dev/null
-@@ -1,41 +0,0 @@
--#!/bin/sh
--################################################################################
--##                                                                            ##
--## Copyright (c) International Business Machines  Corp., 2007                 ##
--##                                                                            ##
--## This program is free software;  you can redistribute it and#or modify      ##
--## it under the terms of the GNU General Public License as published by       ##
--## the Free Software Foundation; either version 2 of the License, or          ##
--## (at your option) any later version.                                        ##
--##                                                                            ##
--## This program is distributed in the hope that it will be useful, but        ##
--## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
--## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
--## for more details.                                                          ##
--##                                                                            ##
--## You should have received a copy of the GNU General Public License          ##
--## along with this program;  if not, write to the Free Software               ##
--## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
--##                                                                            ##
--################################################################################
--
--oldhostname=`hostname`
--exit_code=0
--echo "unshare tests"
--for i in `seq 1 5`; do
--	echo "test $i (unshare)"
--	./utstest_noltp unshare $i
--	if [ $? -ne 0 ]; then
--		exit_code=$?
--	fi
--done
--echo "clone tests"
--for i in `seq 1 5`; do
--	echo "test $i (clone)"
--	./utstest_noltp clone $i
--	if [ $? -ne 0 ]; then
--		exit_code=$?
--	fi
--done
--hostname "$oldhostname"
--exit $exit_code
-diff --git a/testcases/kernel/containers/utsname/runutstests_noltp.sh b/testcases/kernel/containers/utsname/runutstests_noltp.sh
-new file mode 100755
-index 0000000..43cb7e2
---- /dev/null
-+++ b/testcases/kernel/containers/utsname/runutstests_noltp.sh
-@@ -0,0 +1,41 @@
-+#!/bin/sh
-+################################################################################
-+##                                                                            ##
-+## Copyright (c) International Business Machines  Corp., 2007                 ##
-+##                                                                            ##
-+## This program is free software;  you can redistribute it and#or modify      ##
-+## it under the terms of the GNU General Public License as published by       ##
-+## the Free Software Foundation; either version 2 of the License, or          ##
-+## (at your option) any later version.                                        ##
-+##                                                                            ##
-+## This program is distributed in the hope that it will be useful, but        ##
-+## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
-+## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
-+## for more details.                                                          ##
-+##                                                                            ##
-+## You should have received a copy of the GNU General Public License          ##
-+## along with this program;  if not, write to the Free Software               ##
-+## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
-+##                                                                            ##
-+################################################################################
-+
-+oldhostname=`hostname`
-+exit_code=0
-+echo "unshare tests"
-+for i in `seq 1 5`; do
-+	echo "test $i (unshare)"
-+	./utstest_noltp unshare $i
-+	if [ $? -ne 0 ]; then
-+		exit_code=$?
-+	fi
-+done
-+echo "clone tests"
-+for i in `seq 1 5`; do
-+	echo "test $i (clone)"
-+	./utstest_noltp clone $i
-+	if [ $? -ne 0 ]; then
-+		exit_code=$?
-+	fi
-+done
-+hostname "$oldhostname"
-+exit $exit_code
--- 
-1.8.4.3
-
diff --git a/meta/recipes-extended/ltp/ltp/ltp-Do-not-link-against-libfl.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
similarity index 76%
rename from meta/recipes-extended/ltp/ltp/ltp-Do-not-link-against-libfl.patch
rename to meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
index 20fd4c3..585b7cb 100644
--- a/meta/recipes-extended/ltp/ltp/ltp-Do-not-link-against-libfl.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
@@ -1,16 +1,15 @@
-From 5bda9c0af56869c6ff2c25d38ea087179c946bc6 Mon Sep 17 00:00:00 2001
+From 14985fccf7428eaa0b45decc22bfd20fd780f621 Mon Sep 17 00:00:00 2001
 From: Chong Lu <Chong.Lu@windriver.com>
 Date: Tue, 11 Mar 2014 14:47:22 +0800
-Subject: [PATCH] ltp: Don't link against libfl
+Subject: [PATCH 01/32] ltp: Don't link against libfl
 
 We have already defined yywrap function in scan.l file. After this, we no longer need to
 link against libfl and so no longer get errors about undefined references to yylex.
 
-Upstream-Status: Pending
-
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- pan/Makefile |    2 +-
+ pan/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pan/Makefile b/pan/Makefile
@@ -27,5 +26,5 @@ index 4cc6466..a4b575b 100644
  LFLAGS			+= -l
  
 -- 
-1.7.9.5
+2.7.0
 
diff --git a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
new file mode 100644
index 0000000..68725dc
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
@@ -0,0 +1,43 @@
+From 867ad5d5d64b9b27ee32148027532db0a00f6433 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Thu, 7 Jan 2016 17:33:26 +0000
+Subject: [PATCH 02/32] Add knob to control whether numa support should be
+ checked
+
+otherwise undeterministic dependency will be generated
+during build depending upong numa being staged or not
+
+signed-off-by: Roy.Li <rongqing.li@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/ltp-numa.m4 | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
+index 60ae07b..ed7078d 100644
+--- a/m4/ltp-numa.m4
++++ b/m4/ltp-numa.m4
+@@ -24,7 +24,13 @@ dnl ----------------------------
+ dnl
+ AC_DEFUN([LTP_CHECK_SYSCALL_NUMA],
+ [dnl
+-AC_CHECK_HEADERS([linux/mempolicy.h numa.h numaif.h],[
++AC_MSG_CHECKING([for numa])
++AC_ARG_WITH(
++	[numa],
++	AC_HELP_STRING([--without-numa],
++	[without numa support]),
++	[],
++	[AC_CHECK_HEADERS([linux/mempolicy.h numa.h numaif.h],[
+ 	LTP_SYSCALL_NUMA_HEADERS=yes
+ 	AC_CHECK_LIB(numa,numa_alloc_onnode,[have_numa_alloc_onnode="yes"])
+ 	if  test "x$have_numa_alloc_onnode" = "xyes"; then
+@@ -48,3 +54,5 @@ if test "x$have_mpol_constants" = "xyes"; then
+ 	AC_DEFINE(HAVE_MPOL_CONSTANTS,1,[define to 1 if you have all constants required to use mbind tests])
+ fi
+ )])
++AC_MSG_RESULT([$with_numa])
++])
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/add-knob-for-tirpc.patch b/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
similarity index 54%
rename from meta/recipes-extended/ltp/ltp/add-knob-for-tirpc.patch
rename to meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
index 36ff4c7..bf1176f 100644
--- a/meta/recipes-extended/ltp/ltp/add-knob-for-tirpc.patch
+++ b/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
@@ -1,14 +1,19 @@
-[PATCH] add knob to control whether tirpc support should be checked
+From b193011da301b3d944e8fddcf4817513c31c5b88 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Thu, 7 Jan 2016 17:36:19 +0000
+Subject: [PATCH 03/32] Add knob to control tirpc support
 
-Upstream-Status: Pending
-
-tirpc support is broken upstream. in the meantime, allow to disable tirpc.
+allow to disable tirpc. Helps to disable it at top level for eg. musl it
+does not yet work.
 
 Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure.ac |    9 +++++++++
+ configure.ac | 9 +++++++++
  1 file changed, 9 insertions(+)
 
+diff --git a/configure.ac b/configure.ac
+index cc50397..9e2936b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -98,6 +98,13 @@ if test "x$with_python" = xyes; then
@@ -25,7 +30,7 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  # END tools knobs
  
  # Testsuites knobs
-@@ -182,7 +189,9 @@ LTP_CHECK_RENAMEAT
+@@ -169,7 +176,9 @@ LTP_CHECK_RENAMEAT2
  LTP_CHECK_FALLOCATE
  LTP_CHECK_SYSCALL_FCNTL
  LTP_CHECK_SYSCALL_PERF_EVENT_OPEN
@@ -35,3 +40,6 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  LTP_CHECK_TEE
  LTP_CHECK_SPLICE
  LTP_CHECK_VMSPLICE
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
new file mode 100644
index 0000000..2de9363
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
@@ -0,0 +1,147 @@
+From 53acddddf1b324e06af886ee4639b774e5c8c8bc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 18:19:03 +0000
+Subject: [PATCH 04/32] build: Add option to select libc implementation
+
+There are more than glibc for C library implementation available on
+linux now a days, uclibc cloaked like glibc but musl e.g. is very
+different and does not implement all GNU extentions
+
+Disable tests specifically not building _yet_ on musl based systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile                                    | 5 +++++
+ testcases/kernel/Makefile                   | 5 ++++-
+ testcases/kernel/sched/Makefile             | 4 +++-
+ testcases/kernel/syscalls/Makefile          | 5 +++++
+ testcases/network/nfsv4/acl/Makefile        | 4 ++++
+ testcases/network/rpc/basic_tests/Makefile  | 5 +++++
+ testcases/realtime/func/pi-tests/Makefile   | 4 ++++
+ testcases/realtime/stress/pi-tests/Makefile | 5 +++++
+ 8 files changed, 35 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 297f8e7..906b280 100644
+--- a/Makefile
++++ b/Makefile
+@@ -49,6 +49,11 @@ SKIP_IDCHECK		?= 0
+ UCLINUX			?= 0
+ export UCLINUX
+ 
++# System C library implementation (glibc,uclibc,musl etc.)
++# default to glibc if not set
++LIBC			?= glibc
++export LIBC
++
+ # CLEAN_TARGETS:	Targets which exist solely in clean.
+ # COMMON_TARGETS:	Targets which exist in all, clean, and install.
+ # INSTALL_TARGETS:	Targets which exist in clean and install (contains
+diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
+index 50a12fa..4f1987f 100644
+--- a/testcases/kernel/Makefile
++++ b/testcases/kernel/Makefile
+@@ -47,13 +47,16 @@ SUBDIRS			+= connectors \
+ 			   logging \
+ 			   mem \
+ 			   numa \
+-			   pty \
+ 			   sched \
+ 			   security \
+ 			   timers \
+ 			   tracing \
+ 			   module \
+ 
++ifneq ($(LIBC),musl)
++SUBDIRS			+= pty
++endif
++
+ ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
+ SUBDIRS			+= power_management
+ endif
+diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Makefile
+index 6245ed0..aa4eb7f 100644
+--- a/testcases/kernel/sched/Makefile
++++ b/testcases/kernel/sched/Makefile
+@@ -23,5 +23,7 @@
+ top_srcdir		?= ../../..
+ 
+ include $(top_srcdir)/include/mk/env_pre.mk
+-
++ifeq ($(LIBC),musl)
++	FILTER_OUT_DIRS += process_stress
++endif
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
+index 8acb395..b749126 100644
+--- a/testcases/kernel/syscalls/Makefile
++++ b/testcases/kernel/syscalls/Makefile
+@@ -28,5 +28,10 @@ ifeq ($(UCLINUX),1)
+ FILTER_OUT_DIRS	+= capget capset chmod chown clone fork getcontext llseek \
+ 		   mincore mprotect nftw profil remap_file_pages sbrk
+ endif
++ifeq ($(LIBC),musl)
++FILTER_OUT_DIRS	+= confstr fmtmsg getcontext ioctl mallopt profil \
++		   rt_sigsuspend setdomainname sethostname sigsuspend \
++		   ustat
++endif
+ 
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+diff --git a/testcases/network/nfsv4/acl/Makefile b/testcases/network/nfsv4/acl/Makefile
+index 8bc78c2..c36cf50 100644
+--- a/testcases/network/nfsv4/acl/Makefile
++++ b/testcases/network/nfsv4/acl/Makefile
+@@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
+ 
+ LDLIBS			+= $(ACL_LIBS)
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS	:= acl1
++endif
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
+index 3160813..9bdf5d0 100644
+--- a/testcases/network/rpc/basic_tests/Makefile
++++ b/testcases/network/rpc/basic_tests/Makefile
+@@ -23,4 +23,9 @@
+ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/env_pre.mk
++
++ifeq ($(LIBC),musl)
++FILTER_OUT_DIRS += rpc01
++endif
++
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+diff --git a/testcases/realtime/func/pi-tests/Makefile b/testcases/realtime/func/pi-tests/Makefile
+index 7a7a57a..5808866 100644
+--- a/testcases/realtime/func/pi-tests/Makefile
++++ b/testcases/realtime/func/pi-tests/Makefile
+@@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
+ include $(abs_srcdir)/../../config.mk
+ 
+ MAKE_TARGETS		:= testpi-0 testpi-1 testpi-2 testpi-4 testpi-5 testpi-6 testpi-7 sbrk_mutex
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS	:= testpi-5 testpi-6 sbrk_mutex
++endif
++
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/realtime/stress/pi-tests/Makefile b/testcases/realtime/stress/pi-tests/Makefile
+index 5edc3b4..aa5987a 100644
+--- a/testcases/realtime/stress/pi-tests/Makefile
++++ b/testcases/realtime/stress/pi-tests/Makefile
+@@ -24,4 +24,9 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/env_pre.mk
+ include $(abs_srcdir)/../../config.mk
++
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS	:= testpi-3
++endif
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch b/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
new file mode 100644
index 0000000..8dab1ed
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
@@ -0,0 +1,45 @@
+From 6e3058521b50d91d4b0569c4d491c5af5ff798b2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 18:22:38 +0000
+Subject: [PATCH 05/32] kernel/controllers: Link with libfts explicitly on musl
+
+musl does not implement fts like glibc and therefore it depends on
+external implementation for all fts APIs
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/controllers/Makefile.inc        | 3 +++
+ testcases/kernel/controllers/cpuset/Makefile.inc | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/testcases/kernel/controllers/Makefile.inc b/testcases/kernel/controllers/Makefile.inc
+index b106283..ef5fc0c 100644
+--- a/testcases/kernel/controllers/Makefile.inc
++++ b/testcases/kernel/controllers/Makefile.inc
+@@ -36,6 +36,9 @@ MAKE_DEPS		:= $(LIB)
+ CPPFLAGS		+= -I$(abs_srcdir)/../$(LIBDIR)
+ 
+ LDFLAGS			+= -L$(abs_builddir)/../$(LIBDIR)
++ifeq ($(LIBC),musl)
++LDLIBS			+= -lfts
++endif
+ 
+ INSTALL_TARGETS		?= *.sh
+ 
+diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
+index 9e002f4..e0fcb9c 100644
+--- a/testcases/kernel/controllers/cpuset/Makefile.inc
++++ b/testcases/kernel/controllers/cpuset/Makefile.inc
+@@ -42,6 +42,9 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
+ LDFLAGS			+= -L$(abs_builddir)/$(LIBCPUSET_DIR) -L$(abs_builddir)/$(LIBCONTROLLERS_DIR)
+ 
+ LDLIBS			+= -lcpu_set -lcontrollers -lltp
++ifeq ($(LIBC),musl)
++LDLIBS			+= -lfts
++endif
+ 
+ INSTALL_TARGETS		?= *.sh
+ 
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch b/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
new file mode 100644
index 0000000..56a48ab
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
@@ -0,0 +1,31 @@
+From fb8b895385a641d74f2186fe5f20a872209692ed Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 18:24:20 +0000
+Subject: [PATCH 06/32] sendfile: Use off64_t instead of __off64_t
+
+__off64_t is specific to glibc where as off64_t is widely available
+Add _GNU_SOURCE for off64_t defines from sys/types.h
+Fixes
+<command-line>:0:7: error: unknown type name 'off64_t'
+sendfile02.c:97:18: note: in expansion of macro 'OFF_T'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/sendfile/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/sendfile/Makefile b/testcases/kernel/syscalls/sendfile/Makefile
+index df7b63f..1bd1b57 100644
+--- a/testcases/kernel/syscalls/sendfile/Makefile
++++ b/testcases/kernel/syscalls/sendfile/Makefile
+@@ -21,6 +21,6 @@ top_srcdir		?= ../../../..
+ include $(top_srcdir)/include/mk/testcases.mk
+ include $(abs_srcdir)/../utils/newer_64.mk
+ 
+-%_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -DOFF_T=__off64_t
++%_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -DOFF_T=off64_t -D_GNU_SOURCE
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch b/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
new file mode 100644
index 0000000..4be906e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
@@ -0,0 +1,394 @@
+From 405c03171e4bf0edd698cb602cf7bd7fe1d0401a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 19:33:53 +0000
+Subject: [PATCH 07/32] replace SIGCLD with SIGCHLD
+
+its defined to use SIGCHLD anyway in
+
+bits/signum.h:#define     SIGCLD          SIGCHLD /* Same as SIGCHLD
+(System V).  */
+
+plus it helps these tests compile with musl which adheres to posix
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/tst_sig.c                                   |  8 ++++----
+ testcases/kernel/connectors/pec/pec_listener.c  |  1 +
+ testcases/kernel/fs/doio/doio.c                 |  4 ++--
+ testcases/kernel/fs/doio/growfiles.c            |  2 +-
+ testcases/kernel/syscalls/fcntl/fcntl11.c       |  8 ++++----
+ testcases/kernel/syscalls/fcntl/fcntl17.c       |  8 ++++----
+ testcases/kernel/syscalls/fcntl/fcntl19.c       |  8 ++++----
+ testcases/kernel/syscalls/fcntl/fcntl20.c       |  8 ++++----
+ testcases/kernel/syscalls/fcntl/fcntl21.c       |  8 ++++----
+ testcases/kernel/syscalls/kill/kill02.c         |  6 +++---
+ testcases/kernel/syscalls/kill/kill12.c         |  8 ++++----
+ testcases/kernel/syscalls/mkdir/mkdir09.c       | 12 ++++++------
+ testcases/kernel/syscalls/sighold/sighold02.c   |  2 +-
+ testcases/network/tcp_cmds/perf_lan/pingpong.c  |  2 +-
+ testcases/network/tcp_cmds/perf_lan/pingpong6.c |  2 +-
+ 15 files changed, 44 insertions(+), 43 deletions(-)
+
+diff --git a/lib/tst_sig.c b/lib/tst_sig.c
+index 3af5ffd..36565e1 100644
+--- a/lib/tst_sig.c
++++ b/lib/tst_sig.c
+@@ -49,7 +49,7 @@
+ 		fork_flag - set to FORK or NOFORK depending upon whether the
+ 			calling program executes a fork() system call.  It
+ 			is normally the case that the calling program treats
+-			SIGCLD as an expected signal if fork() is being used.
++			SIGCHLD as an expected signal if fork() is being used.
+ 
+ 		handler - a pointer to the unexpected signal handler to
+ 			be executed after an unexpected signal has been
+@@ -82,7 +82,7 @@ static void (*tst_setup_signal(int, void (*)(int))) (int);
+ 
+ /****************************************************************************
+  * tst_sig() : set-up to catch unexpected signals.  fork_flag is set to NOFORK
+- *    if SIGCLD is to be an "unexpected signal", otherwise it is set to
++ *    if SIGCHLD is to be an "unexpected signal", otherwise it is set to
+  *    FORK.  cleanup points to a cleanup routine to be executed before
+  *    tst_exit is called (cleanup is set to NULL if no cleanup is desired).
+  *    handler is a pointer to the signal handling routine (if handler is
+@@ -117,7 +117,7 @@ void tst_sig(int fork_flag, void (*handler) (), void (*cleanup) ())
+ 	for (sig = 1; sig < NSIG; sig++) {
+ 		/*
+ 		 * SIGKILL is never unexpected.
+-		 * SIGCLD is only unexpected when
++		 * SIGCHLD is only unexpected when
+ 		 *    no forking is being done.
+ 		 * SIGINFO is used for file quotas and should be expected
+ 		 */
+@@ -205,7 +205,7 @@ void tst_sig(int fork_flag, void (*handler) (), void (*cleanup) ())
+ #endif
+ 			break;
+ 
+-		case SIGCLD:
++		case SIGCHLD:
+ 			if (fork_flag == FORK)
+ 				continue;
+ 
+diff --git a/testcases/kernel/connectors/pec/pec_listener.c b/testcases/kernel/connectors/pec/pec_listener.c
+index a1beb13..002750a 100644
+--- a/testcases/kernel/connectors/pec/pec_listener.c
++++ b/testcases/kernel/connectors/pec/pec_listener.c
+@@ -20,6 +20,7 @@
+ /*                                                                            */
+ /******************************************************************************/
+ 
++#define _GNU_SOURCE
+ #include <sys/socket.h>
+ #include <sys/poll.h>
+ #include <sys/types.h>
+diff --git a/testcases/kernel/fs/doio/doio.c b/testcases/kernel/fs/doio/doio.c
+index 4b0dec5..5f65ef9 100644
+--- a/testcases/kernel/fs/doio/doio.c
++++ b/testcases/kernel/fs/doio/doio.c
+@@ -573,7 +573,7 @@ int main(int argc, char **argv)
+ 		case SIGTSTP:
+ 		case SIGSTOP:
+ 		case SIGCONT:
+-		case SIGCLD:
++		case SIGCHLD:
+ 		case SIGBUS:
+ 		case SIGSEGV:
+ 		case SIGQUIT:
+@@ -615,7 +615,7 @@ int main(int argc, char **argv)
+ 	}
+ 
+ 	sigemptyset(&block_mask);
+-	sigaddset(&block_mask, SIGCLD);
++	sigaddset(&block_mask, SIGCHLD);
+ 	sigprocmask(SIG_BLOCK, &block_mask, &omask);
+ 
+ 	/*
+diff --git a/testcases/kernel/fs/doio/growfiles.c b/testcases/kernel/fs/doio/growfiles.c
+index 09e7f35..bbad230 100644
+--- a/testcases/kernel/fs/doio/growfiles.c
++++ b/testcases/kernel/fs/doio/growfiles.c
+@@ -1640,7 +1640,7 @@ int set_sig(void)
+ #ifdef SIGRESTART
+ 		case SIGRESTART:
+ #endif /* SIGRESTART */
+-		case SIGCLD:
++		case SIGCHLD:
+ 			break;
+ 
+ 		default:
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl11.c b/testcases/kernel/syscalls/fcntl/fcntl11.c
+index fa6ce53..2de2b6c 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl11.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl11.c
+@@ -105,10 +105,10 @@ void setup(void)
+ 	memset(&act, 0, sizeof(act));
+ 	act.sa_handler = catch_child;
+ 	sigemptyset(&act.sa_mask);
+-	sigaddset(&act.sa_mask, SIGCLD);
+-	if ((sigaction(SIGCLD, &act, NULL)) < 0)
++	sigaddset(&act.sa_mask, SIGCHLD);
++	if ((sigaction(SIGCHLD, &act, NULL)) < 0)
+ 		tst_brkm(TBROK | TERRNO, cleanup,
+-			 "sigaction(SIGCLD, ..) failed");
++			 "sigaction(SIGCHLD, ..) failed");
+ }
+ 
+ void do_child(void)
+@@ -227,7 +227,7 @@ void stop_child(void)
+ {
+ 	struct flock fl;
+ 
+-	signal(SIGCLD, SIG_DFL);
++	signal(SIGCHLD, SIG_DFL);
+ 	fl.l_type = STOP;
+ 	parent_put(&fl);
+ 	wait(0);
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl17.c b/testcases/kernel/syscalls/fcntl/fcntl17.c
+index 5b03e39..6598b20 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl17.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl17.c
+@@ -150,9 +150,9 @@ int setup(void)
+ 	memset(&act, 0, sizeof(act));
+ 	act.sa_handler = catch_child;
+ 	sigemptyset(&act.sa_mask);
+-	sigaddset(&act.sa_mask, SIGCLD);
+-	if (sigaction(SIGCLD, &act, NULL) < 0) {
+-		tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d", errno);
++	sigaddset(&act.sa_mask, SIGCHLD);
++	if (sigaction(SIGCHLD, &act, NULL) < 0) {
++		tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d", errno);
+ 		return 1;
+ 	}
+ 	return 0;
+@@ -381,7 +381,7 @@ void stop_children(void)
+ {
+ 	int arg;
+ 
+-	signal(SIGCLD, SIG_DFL);
++	signal(SIGCHLD, SIG_DFL);
+ 	arg = STOP;
+ 	child_free(child_pipe1[1], arg);
+ 	child_free(child_pipe2[1], arg);
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl19.c b/testcases/kernel/syscalls/fcntl/fcntl19.c
+index a542cfc..88c91d6 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl19.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl19.c
+@@ -112,9 +112,9 @@ void setup(void)
+ 	memset(&act, 0, sizeof(act));
+ 	act.sa_handler = catch_child;
+ 	sigemptyset(&act.sa_mask);
+-	sigaddset(&act.sa_mask, SIGCLD);
+-	if ((sigaction(SIGCLD, &act, NULL)) < 0) {
+-		tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d", errno);
++	sigaddset(&act.sa_mask, SIGCHLD);
++	if ((sigaction(SIGCHLD, &act, NULL)) < 0) {
++		tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d", errno);
+ 		fail = 1;
+ 	}
+ }
+@@ -265,7 +265,7 @@ void stop_child(void)
+ {
+ 	struct flock fl;
+ 
+-	signal(SIGCLD, SIG_DFL);
++	signal(SIGCHLD, SIG_DFL);
+ 	fl.l_type = STOP;
+ 	parent_put(&fl);
+ 	wait(0);
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl20.c b/testcases/kernel/syscalls/fcntl/fcntl20.c
+index aa06bab..99fd783 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl20.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl20.c
+@@ -109,9 +109,9 @@ void setup(void)
+ 	memset(&act, 0, sizeof(act));
+ 	act.sa_handler = catch_child;
+ 	sigemptyset(&act.sa_mask);
+-	sigaddset(&act.sa_mask, SIGCLD);
+-	if (sigaction(SIGCLD, &act, NULL) == -1)
+-		tst_brkm(TFAIL | TERRNO, cleanup, "SIGCLD signal setup failed");
++	sigaddset(&act.sa_mask, SIGCHLD);
++	if (sigaction(SIGCHLD, &act, NULL) == -1)
++		tst_brkm(TFAIL | TERRNO, cleanup, "SIGCHLD signal setup failed");
+ }
+ 
+ void cleanup(void)
+@@ -264,7 +264,7 @@ void stop_child(void)
+ {
+ 	struct flock fl;
+ 
+-	signal(SIGCLD, SIG_DFL);
++	signal(SIGCHLD, SIG_DFL);
+ 	fl.l_type = STOP;
+ 	parent_put(&fl);
+ 	wait(0);
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl21.c b/testcases/kernel/syscalls/fcntl/fcntl21.c
+index 5307021..8f1a67c 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl21.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl21.c
+@@ -110,9 +110,9 @@ void setup(void)
+ 	memset(&act, 0, sizeof(act));
+ 	act.sa_handler = catch_child;
+ 	sigemptyset(&act.sa_mask);
+-	sigaddset(&act.sa_mask, SIGCLD);
+-	if ((sigaction(SIGCLD, &act, NULL)) < 0) {
+-		tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d", errno);
++	sigaddset(&act.sa_mask, SIGCHLD);
++	if ((sigaction(SIGCHLD, &act, NULL)) < 0) {
++		tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d", errno);
+ 		fail = 1;
+ 	}
+ }
+@@ -272,7 +272,7 @@ void stop_child(void)
+ {
+ 	struct flock fl;
+ 
+-	signal(SIGCLD, SIG_DFL);
++	signal(SIGCHLD, SIG_DFL);
+ 	fl.l_type = STOP;
+ 	parent_put(&fl);
+ 	wait(0);
+diff --git a/testcases/kernel/syscalls/kill/kill02.c b/testcases/kernel/syscalls/kill/kill02.c
+index 9d6cc68..08360dd 100644
+--- a/testcases/kernel/syscalls/kill/kill02.c
++++ b/testcases/kernel/syscalls/kill/kill02.c
+@@ -701,7 +701,7 @@ void setup(void)
+ 
+ 	/*
+ 	 *  Set to catch unexpected signals.
+-	 *  SIGCLD is set to be ignored because we do not wait for termination status.
++	 *  SIGCHLD is set to be ignored because we do not wait for termination status.
+ 	 *  SIGUSR1 is set to be ignored because this is the signal we are using for
+ 	 *  the test and we are not concerned with the parent getting it.
+ 	 */
+@@ -713,9 +713,9 @@ void setup(void)
+ 			 "signal(SIGUSR1, SIG_IGN) failed");
+ 	}
+ 
+-	if (signal(SIGCLD, SIG_IGN) == SIG_ERR) {
++	if (signal(SIGCHLD, SIG_IGN) == SIG_ERR) {
+ 		tst_brkm(TBROK | TERRNO, NULL,
+-			 "signal(SIGCLD, SIG_IGN) failed");
++			 "signal(SIGCHLD, SIG_IGN) failed");
+ 	}
+ 
+ 	TEST_PAUSE;
+diff --git a/testcases/kernel/syscalls/kill/kill12.c b/testcases/kernel/syscalls/kill/kill12.c
+index 7a47a4a..d7c4147 100644
+--- a/testcases/kernel/syscalls/kill/kill12.c
++++ b/testcases/kernel/syscalls/kill/kill12.c
+@@ -98,7 +98,7 @@ int main(int argc, char **argv)
+ 
+ 	exno = 1;
+ 
+-	if (sigset(SIGCLD, chsig) == SIG_ERR) {
++	if (sigset(SIGCHLD, chsig) == SIG_ERR) {
+ 		fprintf(temp, "\tsigset failed, errno = %d\n", errno);
+ 		fail_exit();
+ 	}
+@@ -128,7 +128,7 @@ int main(int argc, char **argv)
+ 				sleep(1);
+ 
+ 			kill(pid, sig);	/* child should ignroe this sig */
+-			kill(pid, SIGCLD);	/* child should exit */
++			kill(pid, SIGCHLD);	/* child should exit */
+ 
+ #ifdef BCS
+ 			while ((npid = wait(&status)) != pid
+@@ -222,14 +222,14 @@ void do_child(void)
+ 	int exno = 1;
+ 
+ #ifdef UCLINUX
+-	if (sigset(SIGCLD, chsig) == SIG_ERR) {
++	if (sigset(SIGCHLD, chsig) == SIG_ERR) {
+ 		fprintf(temp, "\tsigset failed, errno = %d\n", errno);
+ 		fail_exit();
+ 	}
+ #endif
+ 
+ 	sigset(sig, SIG_IGN);	/* set to ignore signal */
+-	kill(getppid(), SIGCLD);	/* tell parent we are ready */
++	kill(getppid(), SIGCHLD);	/* tell parent we are ready */
+ 	while (!chflag)
+ 		sleep(1);	/* wait for parent */
+ 
+diff --git a/testcases/kernel/syscalls/mkdir/mkdir09.c b/testcases/kernel/syscalls/mkdir/mkdir09.c
+index 41c20e9..07b4fb8 100644
+--- a/testcases/kernel/syscalls/mkdir/mkdir09.c
++++ b/testcases/kernel/syscalls/mkdir/mkdir09.c
+@@ -122,10 +122,10 @@ int main(int argc, char *argv[])
+ 
+ 	}
+ 
+-	/* Set up to catch SIGCLD signal */
+-	if (signal(SIGCLD, chld) == SIG_ERR) {
++	/* Set up to catch SIGCHLD signal */
++	if (signal(SIGCHLD, chld) == SIG_ERR) {
+ 		tst_brkm(TFAIL, cleanup,
+-			 "Error setting up SIGCLD signal, ERRNO = %d", errno);
++			 "Error setting up SIGCHLD signal, ERRNO = %d", errno);
+ 
+ 	}
+ 
+@@ -236,9 +236,9 @@ int runtest(void)
+ 		tst_brkm(TFAIL, cleanup,
+ 			 "Error resetting SIGTERM signal, ERRNO = %d", errno);
+ 	}
+-	if (signal(SIGCLD, SIG_DFL) == SIG_ERR) {
++	if (signal(SIGCHLD, SIG_DFL) == SIG_ERR) {
+ 		tst_brkm(TFAIL, cleanup,
+-			 "Error resetting SIGCLD signal, ERRNO = %d", errno);
++			 "Error resetting SIGCHLD signal, ERRNO = %d", errno);
+ 	}
+ 
+ 	if (test_time) {
+@@ -372,7 +372,7 @@ void term(int sig)
+ 
+ void chld(int sig)
+ {
+-	/* Routine to handle SIGCLD signal. */
++	/* Routine to handle SIGCHLD signal. */
+ 
+ 	sigchld++;
+ 	if (jump) {
+diff --git a/testcases/kernel/syscalls/sighold/sighold02.c b/testcases/kernel/syscalls/sighold/sighold02.c
+index e3076fb..be01874 100644
+--- a/testcases/kernel/syscalls/sighold/sighold02.c
++++ b/testcases/kernel/syscalls/sighold/sighold02.c
+@@ -77,7 +77,7 @@ static int sigs_map[NUMSIGS];
+ static int skip_sig(int sig)
+ {
+ 	switch (sig) {
+-	case SIGCLD:
++	case SIGCHLD:
+ 	case SIGKILL:
+ 	case SIGALRM:
+ 	case SIGSTOP:
+diff --git a/testcases/network/tcp_cmds/perf_lan/pingpong.c b/testcases/network/tcp_cmds/perf_lan/pingpong.c
+index 1196312..5b06798 100644
+--- a/testcases/network/tcp_cmds/perf_lan/pingpong.c
++++ b/testcases/network/tcp_cmds/perf_lan/pingpong.c
+@@ -182,7 +182,7 @@ int main(int argc, char *argv[])
+ 
+ 	/* Setup traps */
+ 	signal(SIGINT, finish);
+-	signal(SIGCLD, finish);
++	signal(SIGCHLD, finish);
+ 
+ 	/* Fork a child process to continue sending packets */
+ 	tst_resm(TINFO, "Create a child process to continue to send packets");
+diff --git a/testcases/network/tcp_cmds/perf_lan/pingpong6.c b/testcases/network/tcp_cmds/perf_lan/pingpong6.c
+index 9747f58..0a0fb1d 100644
+--- a/testcases/network/tcp_cmds/perf_lan/pingpong6.c
++++ b/testcases/network/tcp_cmds/perf_lan/pingpong6.c
+@@ -153,7 +153,7 @@ char *argv[];
+ 
+ 	/* Setup traps */
+ 	signal(SIGINT, finish);
+-	signal(SIGCLD, finish);
++	signal(SIGCHLD, finish);
+ 
+ 	/* Fork a child process to continue sending packets */
+ 	printf("Create a child process to continue to send packets \n");
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
new file mode 100644
index 0000000..59e169e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
@@ -0,0 +1,279 @@
+From 714024e4699b28eed866d775f4c715b0e55b76f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 19:40:08 +0000
+Subject: [PATCH 08/32] Check if __GLIBC_PREREQ is defined before using it
+
+__GLIBC_PREREQ is specific to glibc so it should be checked if it is
+defined or not.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/accept4/accept4_01.c     |  9 ++++++-
+ testcases/kernel/syscalls/getcpu/getcpu01.c        | 31 ++++++++++++++++++++++
+ .../sched_getaffinity/sched_getaffinity01.c        | 26 ++++++++++++++++++
+ 3 files changed, 65 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
+index 6072bfa..2b090cb 100644
+--- a/testcases/kernel/syscalls/accept4/accept4_01.c
++++ b/testcases/kernel/syscalls/accept4/accept4_01.c
+@@ -64,6 +64,7 @@ static void cleanup(void)
+ 	tst_rmdir();
+ }
+ 
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if !(__GLIBC_PREREQ(2, 10))
+ static int
+ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
+@@ -82,7 +83,6 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
+ 	}
+ 	tst_resm(TINFO, "\n");
+ #endif
+-
+ #if USE_SOCKETCALL
+ 	long args[6];
+ 
+@@ -97,6 +97,7 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
+ #endif
+ }
+ #endif
++#endif
+ 
+ static void
+ do_test(int lfd, struct sockaddr_in *conn_addr,
+@@ -119,9 +120,15 @@ do_test(int lfd, struct sockaddr_in *conn_addr,
+ 		die("Connect Error");
+ 
+ 	addrlen = sizeof(struct sockaddr_in);
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if !(__GLIBC_PREREQ(2, 10))
+ 	acceptfd = accept4_01(lfd, (struct sockaddr *)&claddr, &addrlen,
+ 			      closeonexec_flag | nonblock_flag);
++
++#else
++	acceptfd = accept4(lfd, (struct sockaddr *)&claddr, &addrlen,
++			   closeonexec_flag | nonblock_flag);
++#endif
+ #else
+ 	acceptfd = accept4(lfd, (struct sockaddr *)&claddr, &addrlen,
+ 			   closeonexec_flag | nonblock_flag);
+diff --git a/testcases/kernel/syscalls/getcpu/getcpu01.c b/testcases/kernel/syscalls/getcpu/getcpu01.c
+index c927512..6de6362 100644
+--- a/testcases/kernel/syscalls/getcpu/getcpu01.c
++++ b/testcases/kernel/syscalls/getcpu/getcpu01.c
+@@ -62,6 +62,7 @@
+ #include <dirent.h>
+ 
+ #if defined(__i386__) || defined(__x86_64__)
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2,6)
+ #if defined(__x86_64__)
+ #include <utmpx.h>
+@@ -72,13 +73,16 @@ int sys_support = 1;
+ #else
+ int sys_support = 0;
+ #endif
++#endif
+ #else
+ int sys_support = 0;
+ #endif
+ 
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if !(__GLIBC_PREREQ(2, 7))
+ #define CPU_FREE(ptr) free(ptr)
+ #endif
++#endif
+ 
+ void cleanup(void);
+ void setup(void);
+@@ -164,9 +168,11 @@ static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
+ {
+ #if defined(__i386__)
+ 	return syscall(318, cpu_id, node_id, cache_struct);
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #elif __GLIBC_PREREQ(2,6)
+ 	*cpu_id = sched_getcpu();
+ #endif
++#endif
+ 	return 0;
+ }
+ 
+@@ -191,15 +197,20 @@ unsigned int set_cpu_affinity(void)
+ 	cpu_set_t *set;
+ 	size_t size;
+ 	int nrcpus = 1024;
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ realloc:
+ 	set = CPU_ALLOC(nrcpus);
+ #else
+ 	set = malloc(sizeof(cpu_set_t));
+ #endif
++#else
++	set = malloc(sizeof(cpu_set_t));
++#endif
+ 	if (set == NULL) {
+ 		tst_brkm(TFAIL, NULL, "CPU_ALLOC:errno:%d", errno);
+ 	}
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ 	size = CPU_ALLOC_SIZE(nrcpus);
+ 	CPU_ZERO_S(size, set);
+@@ -207,8 +218,13 @@ realloc:
+ 	size = sizeof(cpu_set_t);
+ 	CPU_ZERO(set);
+ #endif
++#else
++	size = sizeof(cpu_set_t);
++	CPU_ZERO(set);
++#endif
+ 	if (sched_getaffinity(0, size, set) < 0) {
+ 		CPU_FREE(set);
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ 		if (errno == EINVAL && nrcpus < (1024 << 8)) {
+ 			nrcpus = nrcpus << 2;
+@@ -220,10 +236,17 @@ realloc:
+ 				 "NR_CPUS of the kernel is more than 1024, so we'd better use a newer glibc(>= 2.7)");
+ 		else
+ #endif
++#else
++		if (errno == EINVAL)
++			tst_resm(TFAIL,
++				 "NR_CPUS of the kernel is more than 1024, so we'd better use a newer glibc(>= 2.7)");
++		else
++#endif
+ 			tst_resm(TFAIL, "sched_getaffinity:errno:%d", errno);
+ 		tst_exit();
+ 	}
+ 	cpu_max = max_cpuid(size, set);
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ 	CPU_ZERO_S(size, set);
+ 	CPU_SET_S(cpu_max, size, set);
+@@ -231,6 +254,10 @@ realloc:
+ 	CPU_ZERO(set);
+ 	CPU_SET(cpu_max, set);
+ #endif
++#else
++	CPU_ZERO(set);
++	CPU_SET(cpu_max, set);
++#endif
+ 	if (sched_setaffinity(0, size, set) < 0) {
+ 		CPU_FREE(set);
+ 		tst_brkm(TFAIL, NULL, "sched_setaffinity:errno:%d", errno);
+@@ -247,11 +274,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
+ {
+ 	unsigned int index, max = 0;
+ 	for (index = 0; index < size * BITS_PER_BYTE; index++)
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ 		if (CPU_ISSET_S(index, size, set))
+ #else
+ 		if (CPU_ISSET(index, set))
+ #endif
++#else
++		if (CPU_ISSET(index, set))
++#endif
+ 			max = index;
+ 	return max;
+ }
+diff --git a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c b/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
+index 9d6a81a..4ed13b2 100644
+--- a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
++++ b/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
+@@ -66,9 +66,11 @@ do { \
+ 	tst_resm((TEST_RETURN == -1 ? TPASS : TFAIL) | TTERRNO, #t); \
+ } while (0)
+ 
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if !(__GLIBC_PREREQ(2, 7))
+ #define CPU_FREE(ptr)	free(ptr)
+ #endif
++#endif
+ 
+ int main(int ac, char **av)
+ {
+@@ -95,14 +97,19 @@ static void do_test(void)
+ 	pid_t unused_pid;
+ 	unsigned len;
+ 
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ realloc:
+ 	mask = CPU_ALLOC(nrcpus);
+ #else
+ 	mask = malloc(sizeof(cpu_set_t));
+ #endif
++#else
++	mask = malloc(sizeof(cpu_set_t));
++#endif
+ 	if (mask == NULL)
+ 		tst_brkm(TFAIL | TTERRNO, cleanup, "fail to get enough memory");
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ 	len = CPU_ALLOC_SIZE(nrcpus);
+ 	CPU_ZERO_S(len, mask);
+@@ -110,10 +117,15 @@ realloc:
+ 	len = sizeof(cpu_set_t);
+ 	CPU_ZERO(mask);
+ #endif
++#else
++	len = sizeof(cpu_set_t);
++	CPU_ZERO(mask);
++#endif
+ 	/* positive test */
+ 	TEST(sched_getaffinity(0, len, mask));
+ 	if (TEST_RETURN == -1) {
+ 		CPU_FREE(mask);
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ 		if (errno == EINVAL && nrcpus < (1024 << 8)) {
+ 			nrcpus = nrcpus << 2;
+@@ -125,17 +137,27 @@ realloc:
+ 				 "newer glibc(>= 2.7)");
+ 		else
+ #endif
++#else
++		if (errno == EINVAL)
++			tst_resm(TFAIL, "NR_CPUS > 1024, we'd better use a "
++				 "newer glibc(>= 2.7)");
++		else
++#endif
+ 			tst_resm(TFAIL | TTERRNO, "fail to get cpu affinity");
+ 		cleanup();
+ 	} else {
+ 		tst_resm(TINFO, "cpusetsize is %d", len);
+ 		tst_resm(TINFO, "mask.__bits[0] = %lu ", mask->__bits[0]);
+ 		for (i = 0; i < num; i++) {
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ 			TEST(CPU_ISSET_S(i, len, mask));
+ #else
+ 			TEST(CPU_ISSET(i, mask));
+ #endif
++#else
++			TEST(CPU_ISSET(i, mask));
++#endif
+ 			if (TEST_RETURN != -1)
+ 				tst_resm(TPASS, "sched_getaffinity() succeed, "
+ 					 "this process %d is running "
+@@ -143,11 +165,15 @@ realloc:
+ 		}
+ 	}
+ 
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2, 7)
+ 	CPU_ZERO_S(len, mask);
+ #else
+ 	CPU_ZERO(mask);
+ #endif
++#else
++	CPU_ZERO(mask);
++#endif
+ 	/* negative tests */
+ 	QUICK_TEST(sched_getaffinity(0, len, (cpu_set_t *) - 1));
+ 	QUICK_TEST(sched_getaffinity(0, 0, mask));
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch b/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
new file mode 100644
index 0000000..e58e5a9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
@@ -0,0 +1,270 @@
+From 4ba19d64e95a874995d0b554b891b5ec35bd9495 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 19:45:35 +0000
+Subject: [PATCH 09/32] Guard error.h with __GLIBC__
+
+error API is specific to glibc so use the guard to make it conditional
+on glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/faccessat/faccessat01.c   | 2 ++
+ testcases/kernel/syscalls/fallocate/fallocate01.c   | 2 ++
+ testcases/kernel/syscalls/fchmodat/fchmodat01.c     | 2 ++
+ testcases/kernel/syscalls/fchownat/fchownat01.c     | 2 ++
+ testcases/kernel/syscalls/fchownat/fchownat02.c     | 2 ++
+ testcases/kernel/syscalls/fstatat/fstatat01.c       | 2 ++
+ testcases/kernel/syscalls/futimesat/futimesat01.c   | 2 ++
+ testcases/kernel/syscalls/linkat/linkat01.c         | 2 ++
+ testcases/kernel/syscalls/linkat/linkat02.c         | 2 ++
+ testcases/kernel/syscalls/mkdirat/mkdirat01.c       | 2 ++
+ testcases/kernel/syscalls/mknodat/mknodat01.c       | 2 ++
+ testcases/kernel/syscalls/mknodat/mknodat02.c       | 2 ++
+ testcases/kernel/syscalls/openat/openat01.c         | 2 ++
+ testcases/kernel/syscalls/readlinkat/readlinkat01.c | 2 ++
+ testcases/kernel/syscalls/renameat/renameat01.c     | 2 ++
+ testcases/kernel/syscalls/symlinkat/symlinkat01.c   | 2 ++
+ testcases/kernel/syscalls/unlinkat/unlinkat01.c     | 2 ++
+ 17 files changed, 34 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/faccessat/faccessat01.c b/testcases/kernel/syscalls/faccessat/faccessat01.c
+index 7f0e87a..c72dcf0 100644
+--- a/testcases/kernel/syscalls/faccessat/faccessat01.c
++++ b/testcases/kernel/syscalls/faccessat/faccessat01.c
+@@ -37,7 +37,9 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/fallocate/fallocate01.c b/testcases/kernel/syscalls/fallocate/fallocate01.c
+index e72b123..643c0e2 100644
+--- a/testcases/kernel/syscalls/fallocate/fallocate01.c
++++ b/testcases/kernel/syscalls/fallocate/fallocate01.c
+@@ -96,7 +96,9 @@
+ #include <fcntl.h>
+ #include <sys/syscall.h>
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <inttypes.h>
+ #include <sys/utsname.h>
+ 
+diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
+index 19e9ad5..ae6d807 100644
+--- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
++++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
+@@ -37,7 +37,9 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/fchownat/fchownat01.c b/testcases/kernel/syscalls/fchownat/fchownat01.c
+index b361253..a5218af 100644
+--- a/testcases/kernel/syscalls/fchownat/fchownat01.c
++++ b/testcases/kernel/syscalls/fchownat/fchownat01.c
+@@ -28,7 +28,9 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/fchownat/fchownat02.c b/testcases/kernel/syscalls/fchownat/fchownat02.c
+index 6b0304c..8d2863f 100644
+--- a/testcases/kernel/syscalls/fchownat/fchownat02.c
++++ b/testcases/kernel/syscalls/fchownat/fchownat02.c
+@@ -26,7 +26,9 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/fstatat/fstatat01.c b/testcases/kernel/syscalls/fstatat/fstatat01.c
+index 61531c6..e99fbd2 100644
+--- a/testcases/kernel/syscalls/fstatat/fstatat01.c
++++ b/testcases/kernel/syscalls/fstatat/fstatat01.c
+@@ -48,7 +48,9 @@
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/futimesat/futimesat01.c b/testcases/kernel/syscalls/futimesat/futimesat01.c
+index ae8d4fe..316dd78 100644
+--- a/testcases/kernel/syscalls/futimesat/futimesat01.c
++++ b/testcases/kernel/syscalls/futimesat/futimesat01.c
+@@ -37,7 +37,9 @@
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/linkat/linkat01.c b/testcases/kernel/syscalls/linkat/linkat01.c
+index fc0687b..83cbfe7 100644
+--- a/testcases/kernel/syscalls/linkat/linkat01.c
++++ b/testcases/kernel/syscalls/linkat/linkat01.c
+@@ -49,7 +49,9 @@
+ #include <sys/time.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/linkat/linkat02.c b/testcases/kernel/syscalls/linkat/linkat02.c
+index e9a752a..8d7e431 100644
+--- a/testcases/kernel/syscalls/linkat/linkat02.c
++++ b/testcases/kernel/syscalls/linkat/linkat02.c
+@@ -23,7 +23,9 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/mkdirat/mkdirat01.c b/testcases/kernel/syscalls/mkdirat/mkdirat01.c
+index 7e15947..1dbc038 100644
+--- a/testcases/kernel/syscalls/mkdirat/mkdirat01.c
++++ b/testcases/kernel/syscalls/mkdirat/mkdirat01.c
+@@ -30,7 +30,9 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/mknodat/mknodat01.c b/testcases/kernel/syscalls/mknodat/mknodat01.c
+index 26e5538..f034f05 100644
+--- a/testcases/kernel/syscalls/mknodat/mknodat01.c
++++ b/testcases/kernel/syscalls/mknodat/mknodat01.c
+@@ -29,7 +29,9 @@
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #include <sys/stat.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/mknodat/mknodat02.c b/testcases/kernel/syscalls/mknodat/mknodat02.c
+index f6368fa..7d0f7c0 100644
+--- a/testcases/kernel/syscalls/mknodat/mknodat02.c
++++ b/testcases/kernel/syscalls/mknodat/mknodat02.c
+@@ -29,7 +29,9 @@
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #include <sys/stat.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/openat/openat01.c b/testcases/kernel/syscalls/openat/openat01.c
+index 85f9a91..4ee0117 100644
+--- a/testcases/kernel/syscalls/openat/openat01.c
++++ b/testcases/kernel/syscalls/openat/openat01.c
+@@ -29,7 +29,9 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/readlinkat/readlinkat01.c b/testcases/kernel/syscalls/readlinkat/readlinkat01.c
+index 97a49e8..b162853 100644
+--- a/testcases/kernel/syscalls/readlinkat/readlinkat01.c
++++ b/testcases/kernel/syscalls/readlinkat/readlinkat01.c
+@@ -29,7 +29,9 @@
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/renameat/renameat01.c b/testcases/kernel/syscalls/renameat/renameat01.c
+index f4cd51b..105a05b 100644
+--- a/testcases/kernel/syscalls/renameat/renameat01.c
++++ b/testcases/kernel/syscalls/renameat/renameat01.c
+@@ -42,7 +42,9 @@
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/symlinkat/symlinkat01.c b/testcases/kernel/syscalls/symlinkat/symlinkat01.c
+index 5c238d8..cb7a7e8 100644
+--- a/testcases/kernel/syscalls/symlinkat/symlinkat01.c
++++ b/testcases/kernel/syscalls/symlinkat/symlinkat01.c
+@@ -37,7 +37,9 @@
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/testcases/kernel/syscalls/unlinkat/unlinkat01.c b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
+index 31fe4e7..26f6d9a 100644
+--- a/testcases/kernel/syscalls/unlinkat/unlinkat01.c
++++ b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
+@@ -37,7 +37,9 @@
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch b/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
new file mode 100644
index 0000000..5b0c444
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
@@ -0,0 +1,73 @@
+From 0130f4146ced320aadb01b22e36b13d269a8ebba Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 19:48:14 +0000
+Subject: [PATCH 10/32] replace __BEGIN_DECLS and __END_DECLS
+
+They are not portable across libc implementations
+therefore replace them with expanded macros
+
+Include <asm-generic/types.h> to get __s32 definitions
+its not a generally available typedef
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/epoll2/include/epoll.h | 8 ++++++--
+ utils/sctp/include/netinet/sctp.h                | 9 +++++++--
+ 2 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/epoll2/include/epoll.h b/testcases/kernel/syscalls/epoll2/include/epoll.h
+index be599c7..8cc5e7e 100644
+--- a/testcases/kernel/syscalls/epoll2/include/epoll.h
++++ b/testcases/kernel/syscalls/epoll2/include/epoll.h
+@@ -85,7 +85,9 @@ struct epoll_event
+ } EPOLL_PACKED;
+ 
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* Creates an epoll instance.  Returns an fd for the new instance.
+    The "size" parameter is a hint specifying the number of file
+@@ -114,6 +116,8 @@ extern int epoll_ctl (int __epfd, int __op, int __fd,
+ extern int epoll_wait (int __epfd, struct epoll_event *__events,
+ 		       int __maxevents, int __timeout) __THROW;
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* sys/epoll.h */
+diff --git a/utils/sctp/include/netinet/sctp.h b/utils/sctp/include/netinet/sctp.h
+index 51f5bfb..c61aef3 100644
+--- a/utils/sctp/include/netinet/sctp.h
++++ b/utils/sctp/include/netinet/sctp.h
+@@ -35,9 +35,12 @@
+ 
+ #include <stdint.h>
+ #include <linux/types.h>
++#include <asm-generic/types.h>
+ #include <sys/socket.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ typedef __s32 sctp_assoc_t;
+ 
+@@ -862,6 +865,8 @@ int sctp_recvmsg(int s, void *msg, size_t len, struct sockaddr *from,
+ /* Return the address length for an address family. */
+ int sctp_getaddrlen(sa_family_t family);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* __linux_sctp_h__ */
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
new file mode 100644
index 0000000..945280c
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
@@ -0,0 +1,136 @@
+From aff0e2a8f011fa80b472355355a7e8cdacd50189 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 19:53:30 +0000
+Subject: [PATCH 11/32] Rename sigset variable to sigset1
+
+sigset API from signal.h is shadowed by this name conflict
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/mem/shmt/shmt04.c                    | 10 +++++-----
+ testcases/kernel/mem/shmt/shmt06.c                    | 10 +++++-----
+ testcases/kernel/syscalls/sigprocmask/sigprocmask01.c | 10 +++++-----
+ 3 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/testcases/kernel/mem/shmt/shmt04.c b/testcases/kernel/mem/shmt/shmt04.c
+index 7203e9e..fce87d6 100644
+--- a/testcases/kernel/mem/shmt/shmt04.c
++++ b/testcases/kernel/mem/shmt/shmt04.c
+@@ -56,7 +56,7 @@ int TST_TOTAL = 2;		/* Total number of test cases. */
+ /**************/
+ 
+ key_t key;
+-sigset_t sigset;
++sigset_t sigset1;
+ 
+ #define  SIZE  16*1024
+ 
+@@ -71,9 +71,9 @@ int main(void)
+ 
+ 	key = (key_t) getpid();
+ 
+-	sigemptyset(&sigset);
+-	sigaddset(&sigset, SIGUSR1);
+-	sigprocmask(SIG_BLOCK, &sigset, NULL);
++	sigemptyset(&sigset1);
++	sigaddset(&sigset1, SIGUSR1);
++	sigprocmask(SIG_BLOCK, &sigset1, NULL);
+ 
+ 	pid = fork();
+ 	switch (pid) {
+@@ -148,7 +148,7 @@ int child(void)
+ 	char *cp;
+ 	int sig;
+ 
+-	sigwait(&sigset, &sig);
++	sigwait(&sigset1, &sig);
+ 	chld_pid = getpid();
+ /*--------------------------------------------------------*/
+ 
+diff --git a/testcases/kernel/mem/shmt/shmt06.c b/testcases/kernel/mem/shmt/shmt06.c
+index a3c9ca3..77b0fc9 100644
+--- a/testcases/kernel/mem/shmt/shmt06.c
++++ b/testcases/kernel/mem/shmt/shmt06.c
+@@ -57,7 +57,7 @@ int TST_TOTAL = 2;		/* Total number of test cases. */
+ /**************/
+ 
+ key_t key;
+-sigset_t sigset;
++sigset_t sigset1;
+ 
+ int child();
+ static int rm_shm(int);
+@@ -70,9 +70,9 @@ int main(void)
+ 
+ 	key = (key_t) getpid();
+ 
+-	sigemptyset(&sigset);
+-	sigaddset(&sigset, SIGUSR1);
+-	sigprocmask(SIG_BLOCK, &sigset, NULL);
++	sigemptyset(&sigset1);
++	sigaddset(&sigset1, SIGUSR1);
++	sigprocmask(SIG_BLOCK, &sigset1, NULL);
+ 
+ 	pid = fork();
+ 	switch (pid) {
+@@ -147,7 +147,7 @@ int child(void)
+ 	char *cp;
+ 	int sig;
+ 
+-	sigwait(&sigset, &sig);
++	sigwait(&sigset1, &sig);
+ 	chld_pid = getpid();
+ 
+ 	if ((shmid = shmget(key, SIZE, 0)) < 0) {
+diff --git a/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c b/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
+index 20fca52..6fb1d57 100644
+--- a/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
++++ b/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
+@@ -91,7 +91,7 @@ int TST_TOTAL = 1;
+ int sig_catch = 0;		/* variable to blocked/unblocked signals */
+ 
+ struct sigaction sa_new;	/* struct to hold signal info */
+-sigset_t sigset;		/* signal set to hold signal lists */
++sigset_t sigset1;		/* signal set to hold signal lists */
+ sigset_t sigset2;
+ 
+ int main(int ac, char **av)
+@@ -112,7 +112,7 @@ int main(int ac, char **av)
+ 		 * so that, signal will not be delivered to
+ 		 * the test process.
+ 		 */
+-		TEST(sigprocmask(SIG_BLOCK, &sigset, 0));
++		TEST(sigprocmask(SIG_BLOCK, &sigset1, 0));
+ 
+ 		/* Get the process id of test process */
+ 		my_pid = getpid();
+@@ -165,7 +165,7 @@ int main(int ac, char **av)
+ 				 */
+ 				errno = 0;
+ 				if (sigprocmask(SIG_UNBLOCK,
+-						&sigset, 0) == -1) {
++						&sigset1, 0) == -1) {
+ 					tst_brkm(TFAIL, cleanup,
+ 						 "sigprocmask() failed "
+ 						 "to unblock signal, "
+@@ -212,7 +212,7 @@ void setup(void)
+ 	 * Initialise the signal sets with the list that
+ 	 * excludes/includes  all system-defined signals.
+ 	 */
+-	if (sigemptyset(&sigset) == -1) {
++	if (sigemptyset(&sigset1) == -1) {
+ 		tst_brkm(TFAIL, cleanup,
+ 			 "sigemptyset() failed, errno=%d : %s",
+ 			 errno, strerror(errno));
+@@ -235,7 +235,7 @@ void setup(void)
+ 	 * Add specified signal (SIGINT) to the signal set
+ 	 * which excludes system-defined signals.
+ 	 */
+-	if (sigaddset(&sigset, SIGINT) == -1) {
++	if (sigaddset(&sigset1, SIGINT) == -1) {
+ 		tst_brkm(TFAIL, cleanup,
+ 			 "sigaddset() failed, errno=%d : %s",
+ 			 errno, strerror(errno));
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch b/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
new file mode 100644
index 0000000..e1532c1
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
@@ -0,0 +1,351 @@
+From 54e098a366a1d773c4d7d4124f2f5aab976681c3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 19:58:08 +0000
+Subject: [PATCH 12/32] fsstress.c: Replace __int64_t with int64_t
+
+int64_t is defined in ISO C99
+include limits.h to get defintions of PATH_MAX
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/fs/fsstress/fsstress.c       | 31 +++++++++---------
+ testcases/network/nfs/nfs_fsstress/fsstress.c | 47 ++++++++++++++-------------
+ 2 files changed, 40 insertions(+), 38 deletions(-)
+
+diff --git a/testcases/kernel/fs/fsstress/fsstress.c b/testcases/kernel/fs/fsstress/fsstress.c
+index 2f89903..89f0b19 100644
+--- a/testcases/kernel/fs/fsstress/fsstress.c
++++ b/testcases/kernel/fs/fsstress/fsstress.c
+@@ -36,6 +36,7 @@
+ #ifdef HAVE_SYS_PRCTL_H
+ # include <sys/prctl.h>
+ #endif
++#include <limits.h>
+ 
+ #define XFS_ERRTAG_MAX		17
+ 
+@@ -1572,7 +1573,7 @@ void bulkstat_f(int opno, long r)
+ 	__u64 last;
+ 	__s32 nent;
+ 	xfs_bstat_t *t;
+-	__int64_t total;
++	int64_t total;
+ 	xfs_fsop_bulkreq_t bsr;
+ 
+ 	last = 0;
+@@ -1764,14 +1765,14 @@ int setdirect(int fd)
+ 
+ void dread_f(int opno, long r)
+ {
+-	__int64_t align;
++	int64_t align;
+ 	char *buf = NULL;
+ 	struct dioattr diob;
+ 	int e;
+ 	pathname_t f;
+ 	int fd;
+ 	size_t len;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -1835,8 +1836,8 @@ void dread_f(int opno, long r)
+ 		return;
+ 	}
+ #endif
+-	align = (__int64_t) diob.d_miniosz;
+-	lr = ((__int64_t) random() << 32) + random();
++	align = (int64_t) diob.d_miniosz;
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % stb.st_size);
+ 	off -= (off % align);
+ 	lseek64(fd, off, SEEK_SET);
+@@ -1865,14 +1866,14 @@ void dread_f(int opno, long r)
+ 
+ void dwrite_f(int opno, long r)
+ {
+-	__int64_t align;
++	int64_t align;
+ 	char *buf = NULL;
+ 	struct dioattr diob;
+ 	int e;
+ 	pathname_t f;
+ 	int fd;
+ 	size_t len;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -1925,8 +1926,8 @@ void dwrite_f(int opno, long r)
+ 		return;
+ 	}
+ #endif
+-	align = (__int64_t) diob.d_miniosz;
+-	lr = ((__int64_t) random() << 32) + random();
++	align = (int64_t) diob.d_miniosz;
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off -= (off % align);
+ 	lseek64(fd, off, SEEK_SET);
+@@ -2224,7 +2225,7 @@ void read_f(int opno, long r)
+ 	pathname_t f;
+ 	int fd;
+ 	size_t len;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -2262,7 +2263,7 @@ void read_f(int opno, long r)
+ 		close(fd);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % stb.st_size);
+ 	lseek64(fd, off, SEEK_SET);
+ 	len = (random() % (getpagesize() * 32)) + 1;
+@@ -2509,7 +2510,7 @@ void truncate_f(int opno, long r)
+ {
+ 	int e;
+ 	pathname_t f;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -2530,7 +2531,7 @@ void truncate_f(int opno, long r)
+ 		free_pathname(&f);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE);
+ 	off %= maxfsize;
+ 	e = truncate64_path(&f, off) < 0 ? errno : 0;
+@@ -2626,7 +2627,7 @@ void write_f(int opno, long r)
+ 	pathname_t f;
+ 	int fd;
+ 	size_t len;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -2656,7 +2657,7 @@ void write_f(int opno, long r)
+ 		close(fd);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off %= maxfsize;
+ 	lseek64(fd, off, SEEK_SET);
+diff --git a/testcases/network/nfs/nfs_fsstress/fsstress.c b/testcases/network/nfs/nfs_fsstress/fsstress.c
+index ac91262..a34c416 100644
+--- a/testcases/network/nfs/nfs_fsstress/fsstress.c
++++ b/testcases/network/nfs/nfs_fsstress/fsstress.c
+@@ -31,6 +31,7 @@
+  */
+ 
+ #include "global.h"
++#include <limits.h>
+ 
+ #define XFS_ERRTAG_MAX		17
+ 
+@@ -1368,7 +1369,7 @@ void allocsp_f(int opno, long r)
+ 	pathname_t f;
+ 	int fd;
+ 	struct flock64 fl;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -1398,7 +1399,7 @@ void allocsp_f(int opno, long r)
+ 		close(fd);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off %= maxfsize;
+ 	fl.l_whence = SEEK_SET;
+@@ -1519,7 +1520,7 @@ void bulkstat_f(int opno, long r)
+ 	__uint64_t last;
+ 	int nent;
+ 	xfs_bstat_t *t;
+-	__int64_t total;
++	int64_t total;
+ 	xfs_fsop_bulkreq_t bsr;
+ 
+ 	last = 0;
+@@ -1708,14 +1709,14 @@ int setdirect(int fd)
+ 
+ void dread_f(int opno, long r)
+ {
+-	__int64_t align;
++	int64_t align;
+ 	char *buf;
+ 	struct dioattr diob;
+ 	int e;
+ 	pathname_t f;
+ 	int fd;
+ 	size_t len;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -1775,8 +1776,8 @@ void dread_f(int opno, long r)
+ 		return;
+ 	}
+ #endif
+-	align = (__int64_t) diob.d_miniosz;
+-	lr = ((__int64_t) random() << 32) + random();
++	align = (int64_t) diob.d_miniosz;
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % stb.st_size);
+ 	off -= (off % align);
+ 	lseek64(fd, off, SEEK_SET);
+@@ -1798,14 +1799,14 @@ void dread_f(int opno, long r)
+ 
+ void dwrite_f(int opno, long r)
+ {
+-	__int64_t align;
++	int64_t align;
+ 	char *buf;
+ 	struct dioattr diob;
+ 	int e;
+ 	pathname_t f;
+ 	int fd;
+ 	size_t len;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -1854,8 +1855,8 @@ void dwrite_f(int opno, long r)
+ 		return;
+ 	}
+ #endif
+-	align = (__int64_t) diob.d_miniosz;
+-	lr = ((__int64_t) random() << 32) + random();
++	align = (int64_t) diob.d_miniosz;
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off -= (off % align);
+ 	lseek64(fd, off, SEEK_SET);
+@@ -1917,7 +1918,7 @@ void freesp_f(int opno, long r)
+ 	pathname_t f;
+ 	int fd;
+ 	struct flock64 fl;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -1947,7 +1948,7 @@ void freesp_f(int opno, long r)
+ 		close(fd);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off %= maxfsize;
+ 	fl.l_whence = SEEK_SET;
+@@ -2145,7 +2146,7 @@ void read_f(int opno, long r)
+ 	pathname_t f;
+ 	int fd;
+ 	size_t len;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -2183,7 +2184,7 @@ void read_f(int opno, long r)
+ 		close(fd);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % stb.st_size);
+ 	lseek64(fd, off, SEEK_SET);
+ 	len = (random() % (getpagesize() * 32)) + 1;
+@@ -2281,7 +2282,7 @@ void resvsp_f(int opno, long r)
+ 	pathname_t f;
+ 	int fd;
+ 	struct flock64 fl;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -2311,7 +2312,7 @@ void resvsp_f(int opno, long r)
+ 		close(fd);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off %= maxfsize;
+ 	fl.l_whence = SEEK_SET;
+@@ -2428,7 +2429,7 @@ void truncate_f(int opno, long r)
+ {
+ 	int e;
+ 	pathname_t f;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -2449,7 +2450,7 @@ void truncate_f(int opno, long r)
+ 		free_pathname(&f);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off %= maxfsize;
+ 	e = truncate64_path(&f, off) < 0 ? errno : 0;
+@@ -2491,7 +2492,7 @@ void unresvsp_f(int opno, long r)
+ 	pathname_t f;
+ 	int fd;
+ 	struct flock64 fl;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -2521,7 +2522,7 @@ void unresvsp_f(int opno, long r)
+ 		close(fd);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off %= maxfsize;
+ 	fl.l_whence = SEEK_SET;
+@@ -2543,7 +2544,7 @@ void write_f(int opno, long r)
+ 	pathname_t f;
+ 	int fd;
+ 	size_t len;
+-	__int64_t lr;
++	int64_t lr;
+ 	off64_t off;
+ 	struct stat64 stb;
+ 	int v;
+@@ -2573,7 +2574,7 @@ void write_f(int opno, long r)
+ 		close(fd);
+ 		return;
+ 	}
+-	lr = ((__int64_t) random() << 32) + random();
++	lr = ((int64_t) random() << 32) + random();
+ 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
+ 	off %= maxfsize;
+ 	lseek64(fd, off, SEEK_SET);
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch b/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
new file mode 100644
index 0000000..4266e4f
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
@@ -0,0 +1,67 @@
+From 1ef8c32317064438ec3b37a114f5d82957f4e0c6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 20:05:54 +0000
+Subject: [PATCH 13/32] include fcntl.h for getting O_* definitions
+
+musl exposes this issue, with glibc fcntl.h is included via some other
+header and this problem remained latent
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/ipc/ipc_stress/shmem_test_03.c   | 1 +
+ testcases/kernel/syscalls/mq_notify/mq_notify01.c | 1 +
+ testcases/network/tcp_cmds/sendfile/testsf_c.c    | 1 +
+ testcases/network/tcp_cmds/sendfile/testsf_s.c    | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/testcases/kernel/ipc/ipc_stress/shmem_test_03.c b/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
+index c1b11fd..8be156f 100644
+--- a/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
++++ b/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
+@@ -72,6 +72,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <limits.h>
++#include <fcntl.h>
+ #include <sys/file.h>
+ #include <sys/ipc.h>
+ #include <sys/mman.h>
+diff --git a/testcases/kernel/syscalls/mq_notify/mq_notify01.c b/testcases/kernel/syscalls/mq_notify/mq_notify01.c
+index 4728c70..5c7846c 100644
+--- a/testcases/kernel/syscalls/mq_notify/mq_notify01.c
++++ b/testcases/kernel/syscalls/mq_notify/mq_notify01.c
+@@ -41,6 +41,7 @@
+ #include <mqueue.h>
+ #include <signal.h>
+ #include <stdlib.h>
++#include <fcntl.h>
+ 
+ #include "../utils/include_j_h.h"
+ 
+diff --git a/testcases/network/tcp_cmds/sendfile/testsf_c.c b/testcases/network/tcp_cmds/sendfile/testsf_c.c
+index 449784f..38d3274 100644
+--- a/testcases/network/tcp_cmds/sendfile/testsf_c.c
++++ b/testcases/network/tcp_cmds/sendfile/testsf_c.c
+@@ -9,6 +9,7 @@
+ #include <sys/types.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <fcntl.h>
+ #include <sys/file.h>
+ #include <arpa/inet.h>
+ #include <netinet/in.h>
+diff --git a/testcases/network/tcp_cmds/sendfile/testsf_s.c b/testcases/network/tcp_cmds/sendfile/testsf_s.c
+index 17e98ad..bce8dd1 100644
+--- a/testcases/network/tcp_cmds/sendfile/testsf_s.c
++++ b/testcases/network/tcp_cmds/sendfile/testsf_s.c
+@@ -6,6 +6,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #include <sys/file.h>
+ #include <errno.h>
+ #include <sys/signal.h>
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch b/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
new file mode 100644
index 0000000..84d81e9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
@@ -0,0 +1,56 @@
+From d63fefa86dac437c47b9ebbea0a82a1240aaba2c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 20:09:56 +0000
+Subject: [PATCH 14/32] hyperthreading: Include sys/types.h for pid_t
+ definition
+
+If sys/types.h is not included then it will not define pid_t_needed
+and therefore typedef wont be included and we get errors about pid_t
+being not known
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h  | 1 +
+ testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h   | 1 +
+ testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
+index 1ec9794..9084aa7 100644
+--- a/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
++++ b/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
+@@ -3,6 +3,7 @@
+ #define _HTUTILS_H_
+ 
+ #include <stdlib.h>
++#include <sys/types.h>
+ 
+ int is_cmdline_para(const char *para);
+ 
+diff --git a/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
+index 1ec9794..c03a124 100644
+--- a/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
++++ b/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
+@@ -2,6 +2,7 @@
+ #ifndef _HTUTILS_H_
+ #define _HTUTILS_H_
+ 
++#include <sys/types.h>
+ #include <stdlib.h>
+ 
+ int is_cmdline_para(const char *para);
+diff --git a/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
+index 2977ad0..6b484e1 100644
+--- a/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
++++ b/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
+@@ -3,6 +3,7 @@
+ #define _HTUTILS_H_
+ 
+ #include <stdlib.h>
++#include <sys/types.h>
+ 
+ int is_cmdline_para(const char *para);
+ 
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch b/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
new file mode 100644
index 0000000..963536f
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
@@ -0,0 +1,64 @@
+From f091839532f3afe0a58e8ba0b45615c899a43a47 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 20:12:09 +0000
+Subject: [PATCH 15/32] mincore01: Rename PAGESIZE to pagesize
+
+PAGESIZE conflicts with system headers on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/mincore/mincore01.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/mincore/mincore01.c b/testcases/kernel/syscalls/mincore/mincore01.c
+index 97a3d95..fa426d1 100644
+--- a/testcases/kernel/syscalls/mincore/mincore01.c
++++ b/testcases/kernel/syscalls/mincore/mincore01.c
+@@ -45,7 +45,7 @@
+ #include "test.h"
+ #include "safe_macros.h"
+ 
+-static int PAGESIZE;
++static int pagesize;
+ static rlim_t STACK_LIMIT = 10485760;
+ 
+ static void cleanup(void);
+@@ -146,7 +146,7 @@ static void setup4(struct test_case_t *tc)
+ 	}
+ 
+ 	tc->addr = global_pointer;
+-	tc->len = as_lim.rlim_cur - (rlim_t)global_pointer + PAGESIZE;
++	tc->len = as_lim.rlim_cur - (rlim_t)global_pointer + pagesize;
+ 	tc->vector = global_vec;
+ 
+ 	/*
+@@ -161,7 +161,7 @@ static void setup(void)
+ 	char *buf;
+ 	int fd;
+ 
+-	PAGESIZE = getpagesize();
++	pagesize = getpagesize();
+ 
+ 	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+ 
+@@ -170,7 +170,7 @@ static void setup(void)
+ 	TEST_PAUSE;
+ 
+ 	/* global_pointer will point to a mmapped area of global_len bytes */
+-	global_len = PAGESIZE * 2;
++	global_len = pagesize * 2;
+ 
+ 	buf = SAFE_MALLOC(cleanup, global_len);
+ 	memset(buf, 42, global_len);
+@@ -186,7 +186,7 @@ static void setup(void)
+ 				   PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+ 
+ 	global_vec = SAFE_MALLOC(cleanup,
+-				 (global_len + PAGESIZE - 1) / PAGESIZE);
++				 (global_len + pagesize - 1) / pagesize);
+ 
+ 	SAFE_CLOSE(cleanup, fd);
+ }
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch b/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
new file mode 100644
index 0000000..1b5b93a
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
@@ -0,0 +1,45 @@
+From 2b9be924bbad8a1f84ae553fdd1aa8391aa8d2f4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 20:15:07 +0000
+Subject: [PATCH 16/32] ustat: Change header from ustat.h to sys/ustat.h
+
+makes it portable for musl, on glibc ustat.h is just including
+sys/ustat.h too
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/ustat/ustat01.c | 2 +-
+ testcases/kernel/syscalls/ustat/ustat02.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/ustat/ustat01.c b/testcases/kernel/syscalls/ustat/ustat01.c
+index 01b7688..494647b 100644
+--- a/testcases/kernel/syscalls/ustat/ustat01.c
++++ b/testcases/kernel/syscalls/ustat/ustat01.c
+@@ -20,8 +20,8 @@
+  */
+ 
+ #include <unistd.h>
+-#include <ustat.h>
+ #include <errno.h>
++#include <sys/ustat.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include "test.h"
+diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
+index 4e66236..edada31 100644
+--- a/testcases/kernel/syscalls/ustat/ustat02.c
++++ b/testcases/kernel/syscalls/ustat/ustat02.c
+@@ -21,8 +21,8 @@
+  */
+ 
+ #include <unistd.h>
+-#include <ustat.h>
+ #include <errno.h>
++#include <sys/ustat.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include "test.h"
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch b/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
new file mode 100644
index 0000000..ed25802
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
@@ -0,0 +1,88 @@
+From c882bcd18820b44a685f0d5edd7aaff77a88c912 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 20:17:55 +0000
+Subject: [PATCH 17/32] replace sigval_t with union sigval
+
+This makes it compatible across musl and glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c | 2 +-
+ testcases/kernel/syscalls/timer_gettime/timer_gettime01.c       | 2 +-
+ testcases/kernel/timers/timer_create/timer_create02.c           | 4 ++--
+ testcases/kernel/timers/timer_create/timer_create03.c           | 4 ++--
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c b/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
+index d186c1f..bc03544 100644
+--- a/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
++++ b/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
+@@ -54,7 +54,7 @@ int main(int ac, char **av)
+ 
+ 	setup();
+ 
+-	ev.sigev_value = (sigval_t) 0;
++	ev.sigev_value = (union sigval) 0;
+ 	ev.sigev_signo = SIGALRM;
+ 	ev.sigev_notify = SIGEV_SIGNAL;
+ 	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
+diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
+index b583aee..9371a6a 100644
+--- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
++++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
+@@ -55,7 +55,7 @@ int main(int ac, char **av)
+ 
+ 	setup();
+ 
+-	ev.sigev_value = (sigval_t) 0;
++	ev.sigev_value = (union sigval) 0;
+ 	ev.sigev_signo = SIGALRM;
+ 	ev.sigev_notify = SIGEV_SIGNAL;
+ 	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
+diff --git a/testcases/kernel/timers/timer_create/timer_create02.c b/testcases/kernel/timers/timer_create/timer_create02.c
+index 7f528ed..1127400 100644
+--- a/testcases/kernel/timers/timer_create/timer_create02.c
++++ b/testcases/kernel/timers/timer_create/timer_create02.c
+@@ -142,7 +142,7 @@ void setup_test(int option)
+ {
+ 	switch (option) {
+ 	case 0:
+-		evp.sigev_value = (sigval_t) 0;
++		evp.sigev_value = (union sigval) 0;
+ 		evp.sigev_signo = SIGALRM;
+ 		evp.sigev_notify = SIGEV_SIGNAL;
+ 		evp_ptr = &evp;
+@@ -151,7 +151,7 @@ void setup_test(int option)
+ 		evp_ptr = NULL;
+ 		break;
+ 	case 2:
+-		evp.sigev_value = (sigval_t) 0;
++		evp.sigev_value = (union sigval) 0;
+ 		evp.sigev_signo = SIGALRM;	/* any will do */
+ 		evp.sigev_notify = SIGEV_NONE;
+ 		evp_ptr = &evp;
+diff --git a/testcases/kernel/timers/timer_create/timer_create03.c b/testcases/kernel/timers/timer_create/timer_create03.c
+index 291fcfa..8b01bf7 100644
+--- a/testcases/kernel/timers/timer_create/timer_create03.c
++++ b/testcases/kernel/timers/timer_create/timer_create03.c
+@@ -129,7 +129,7 @@ void setup_test(int option)
+ {
+ 	switch (option) {
+ 	case 0:
+-		evp.sigev_value = (sigval_t) 0;
++		evp.sigev_value = (union sigval) 0;
+ 		evp.sigev_signo = SIGALRM;
+ 		evp.sigev_notify = SIGEV_SIGNAL;
+ 		evp_ptr = &evp;
+@@ -138,7 +138,7 @@ void setup_test(int option)
+ 		evp_ptr = NULL;
+ 		break;
+ 	case 2:
+-		evp.sigev_value = (sigval_t) 0;
++		evp.sigev_value = (union sigval) 0;
+ 		evp.sigev_signo = SIGALRM;	/* any will do */
+ 		evp.sigev_notify = SIGEV_NONE;
+ 		evp_ptr = &evp;
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch b/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
new file mode 100644
index 0000000..5198fe9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
@@ -0,0 +1,32 @@
+From f42b060e80c9f40627c712d4d56d45221bd7d9fa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 06:51:20 +0000
+Subject: [PATCH 18/32] guard mallocopt() with __GLIBC__
+
+mallocopt is not available on non glibc implementations
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/utils/benchmark/ebizzy-0.3/ebizzy.c b/utils/benchmark/ebizzy-0.3/ebizzy.c
+index 5bb8eff..934d951 100644
+--- a/utils/benchmark/ebizzy-0.3/ebizzy.c
++++ b/utils/benchmark/ebizzy-0.3/ebizzy.c
+@@ -215,10 +215,10 @@ static void read_options(int argc, char *argv[])
+ 			"\"never mmap\" option specified\n");
+ 		usage();
+ 	}
+-
++#ifdef __GLIBC__
+ 	if (never_mmap)
+ 		mallopt(M_MMAP_MAX, 0);
+-
++#endif
+ 	if (chunk_size < record_size) {
+ 		fprintf(stderr, "Chunk size %u smaller than record size %u\n",
+ 			chunk_size, record_size);
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch b/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
new file mode 100644
index 0000000..0a4c5f0
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
@@ -0,0 +1,32 @@
+From 721e94985b9cff3e2724af7ea5be7d005bc12dec Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 06:55:27 +0000
+Subject: [PATCH 19/32] tomoyo: Replace canonicalize_file_name() with
+ realpath()
+
+canonicalize_file_name() API is specific to glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
+index da4af0f..5c1a3ca 100644
+--- a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
++++ b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
+@@ -274,9 +274,9 @@ int main(int argc, char *argv[])
+ 	/* Test mount(). */
+ 	{
+ 		static char buf[4096];
+-		char *dev_ram_path = canonicalize_file_name("/dev/ram0");
++		char *dev_ram_path = realpath("/dev/ram0", NULL);
+ 		if (!dev_ram_path)
+-			dev_ram_path = canonicalize_file_name("/dev/ram");
++			dev_ram_path = realpath("/dev/ram", NULL);
+ 		if (!dev_ram_path) {
+ 			dev_ram_path = "/dev/ram0";
+ 			mknod(dev_ram_path, S_IFBLK, MKDEV(1, 0));
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch b/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
new file mode 100644
index 0000000..0e4e458
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
@@ -0,0 +1,48 @@
+From aa3568e6ac28f377e75ce16b11e3c7738a373e53 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 06:57:04 +0000
+Subject: [PATCH 20/32] getdents: define getdents/getdents64 only for glibc
+
+getdents/getdents64 are implemented in musl and when we define static
+functions with same name, it errors out.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/getdents/getdents.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
+index abea655..db63d89 100644
+--- a/testcases/kernel/syscalls/getdents/getdents.h
++++ b/testcases/kernel/syscalls/getdents/getdents.h
+@@ -34,12 +34,13 @@ struct linux_dirent {
+ 	char            d_name[];
+ };
+ 
++#ifdef __GLIBC__
+ static inline int
+ getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
+ {
+ 	return ltp_syscall(__NR_getdents, fd, dirp, size);
+ }
+-
++#endif
+ struct linux_dirent64 {
+ 	uint64_t	d_ino;
+ 	int64_t		d_off;
+@@ -48,10 +49,11 @@ struct linux_dirent64 {
+ 	char		d_name[];
+ };
+ 
++#ifdef __GLIBC__
+ static inline int
+ getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
+ {
+ 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
+ }
+-
++#endif
+ #endif /* GETDENTS_H */
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
new file mode 100644
index 0000000..c8cbe58
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
@@ -0,0 +1,71 @@
+From b216435bb362df10c45f544b78d8c884eaa901fd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:01:02 +0000
+Subject: [PATCH 21/32] Define _GNU_SOURCE for MREMAP_MAYMOVE definition
+
+musl guards MREMAP_MAYMOVE with _GNU_SOURCE unlike glibc which uses
+__USE_GNU
+
+Fixes errors like
+error: 'MREMAP_MAYMOVE' undeclared (first use in this function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/mremap/mremap01.c | 4 +++-
+ testcases/kernel/syscalls/mremap/mremap02.c | 2 ++
+ testcases/kernel/syscalls/mremap/mremap03.c | 2 ++
+ 3 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/mremap/mremap01.c b/testcases/kernel/syscalls/mremap/mremap01.c
+index d63d1e4..24ca174 100644
+--- a/testcases/kernel/syscalls/mremap/mremap01.c
++++ b/testcases/kernel/syscalls/mremap/mremap01.c
+@@ -76,10 +76,12 @@
+  */
+ #include <unistd.h>
+ #include <errno.h>
++#include <fcntl.h>
++#define _GNU_SOURCE
+ #define __USE_GNU
+ #include <sys/mman.h>
+ #undef __USE_GNU
+-#include <fcntl.h>
++#undef _GNU_SOURCE
+ 
+ #include "test.h"
+ 
+diff --git a/testcases/kernel/syscalls/mremap/mremap02.c b/testcases/kernel/syscalls/mremap/mremap02.c
+index 5a51b9a..a530a6b 100644
+--- a/testcases/kernel/syscalls/mremap/mremap02.c
++++ b/testcases/kernel/syscalls/mremap/mremap02.c
+@@ -75,9 +75,11 @@
+ #include <errno.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#define _GNU_SOURCE
+ #define __USE_GNU
+ #include <sys/mman.h>
+ #undef __USE_GNU
++#undef _GNU_SOURCE
+ 
+ #include "test.h"
+ 
+diff --git a/testcases/kernel/syscalls/mremap/mremap03.c b/testcases/kernel/syscalls/mremap/mremap03.c
+index 12e3829..9b39f8b 100644
+--- a/testcases/kernel/syscalls/mremap/mremap03.c
++++ b/testcases/kernel/syscalls/mremap/mremap03.c
+@@ -76,9 +76,11 @@
+ #include <errno.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#define _GNU_SOURCE
+ #define __USE_GNU
+ #include <sys/mman.h>
+ #undef __USE_GNU
++#undef _GNU_SOURCE
+ 
+ #include "test.h"
+ 
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch b/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
new file mode 100644
index 0000000..413b44a
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
@@ -0,0 +1,29 @@
+From 7ac6fd51991ac61d1d7594f601d87842060ee284 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:06:11 +0000
+Subject: [PATCH 22/32] include sys/types.h
+
+Fixes
+
+error: unknown type name 'uint'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/ipc/ipc_stress/shmem_test_04.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/ipc/ipc_stress/shmem_test_04.c b/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
+index 72c2e60..e7e5f61 100644
+--- a/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
++++ b/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
+@@ -65,6 +65,7 @@
+ #include <signal.h>
+ #include <stdint.h>
+ #include <sys/mman.h>
++#include <sys/types.h>
+ 
+ #ifdef _LINUX_
+ typedef unsigned long ulong_t;
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch b/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
new file mode 100644
index 0000000..4680c03
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
@@ -0,0 +1,48 @@
+From 560347f77236616a635b4a997a0596b8da4d0799 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:08:25 +0000
+Subject: [PATCH 23/32] ptrace:  Use int instead of enum __ptrace_request
+
+__ptrace_request is only available with glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/ptrace/ptrace03.c           | 4 ++++
+ testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/ptrace/ptrace03.c b/testcases/kernel/syscalls/ptrace/ptrace03.c
+index a4028fc..f1880cd 100644
+--- a/testcases/kernel/syscalls/ptrace/ptrace03.c
++++ b/testcases/kernel/syscalls/ptrace/ptrace03.c
+@@ -102,7 +102,11 @@ static pid_t unused_pid;
+ static pid_t zero_pid;
+ 
+ struct test_case_t {
++#ifdef __GLIBC__
+ 	enum __ptrace_request request;
++#else
++	int request;
++#endif
+ 	pid_t *pid;
+ 	int exp_errno;
+ } test_cases[] = {
+diff --git a/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h b/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
+index ae538e9..85aa89d 100644
+--- a/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
++++ b/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
+@@ -130,7 +130,11 @@ static char *strings[] = {
+ 	SPT(KILL)
+ 	SPT(SINGLESTEP)
+ };
++#ifdef __GLIBC__
+ static inline char *strptrace(enum __ptrace_request request)
++#else
++static inline char *strptrace(int request)
++#endif
+ {
+ 	return strings[request];
+ }
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch b/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
new file mode 100644
index 0000000..03c67a5
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
@@ -0,0 +1,68 @@
+From e01e9862c248dc90a8ec6f2d06f8469d7a50cd8e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:14:58 +0000
+Subject: [PATCH 24/32] rt_sigaction/rt_sigprocmark: Define _GNU_SOURCE
+
+Fixes musl build failure e.g.
+error: 'SA_NOMASK' undeclared here (not in a function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c     | 1 +
+ testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c     | 2 +-
+ testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c     | 1 +
+ testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c | 1 +
+ 4 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c
+index 5cf89cc..bdcb91a 100644
+--- a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c
++++ b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c
+@@ -28,6 +28,7 @@
+ /*		sigset_t type.                       			      */
+ /******************************************************************************/
+ 
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+diff --git a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c
+index a1da743..8a27a0f 100644
+--- a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c
++++ b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c
+@@ -23,7 +23,7 @@
+ /* Description: This tests the rt_sigaction() syscall                         */
+ /*		rt_sigaction Expected EFAULT error check                      */
+ /******************************************************************************/
+-
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+diff --git a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c
+index 175d220..e7627cd 100644
+--- a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c
++++ b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c
+@@ -24,6 +24,7 @@
+ /*		rt_sigaction Expected EINVAL error check                      */
+ /******************************************************************************/
+ 
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+diff --git a/testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c b/testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c
+index 74e5a61..75c57fc 100644
+--- a/testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c
++++ b/testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c
+@@ -39,6 +39,7 @@
+ /*		    sigsetsize should indicate the size of a sigset_t type.   */
+ /******************************************************************************/
+ 
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <signal.h>
+ #include <errno.h>
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch b/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
new file mode 100644
index 0000000..aad3cb0
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
@@ -0,0 +1,28 @@
+From 9d14edfc12eefac900dd54729a88b3ccf91c1c43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:18:15 +0000
+Subject: [PATCH 25/32] mc_gethost: include sys/types.h
+
+Fix build on musl
+error: unknown type name 'u_char'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/network/multicast/mc_gethost/mc_gethost.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
+index 5b9a790..c799e2a 100644
+--- a/testcases/network/multicast/mc_gethost/mc_gethost.c
++++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
+@@ -6,6 +6,7 @@
+ 
+ #include <sys/param.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <arpa/nameser.h>
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch b/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
new file mode 100644
index 0000000..58b8ed4
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
@@ -0,0 +1,29 @@
+From 0133a2b29d6f48d8e2bba6a3be581cdfa91311a6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:21:05 +0000
+Subject: [PATCH 26/32] crash01: Define _GNU_SOURCE
+
+Fixes musl build errors like
+error: 'SA_NOMASK' undeclared (first use in this function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/misc/crash/crash01.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/misc/crash/crash01.c b/testcases/misc/crash/crash01.c
+index 0574521..08a02e7 100644
+--- a/testcases/misc/crash/crash01.c
++++ b/testcases/misc/crash/crash01.c
+@@ -49,7 +49,7 @@ stress test at the same time you run other tests, like a multi-user
+ benchmark.
+ 
+ */
+-
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch b/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
new file mode 100644
index 0000000..b47d097
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
@@ -0,0 +1,29 @@
+From 4a74b275acc8158850f2500928a1467c3482c986 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:23:11 +0000
+Subject: [PATCH 27/32] sysconf01: Use _SC_2_C_VERSION conditionally
+
+_SC_2_C_VERSION is not available on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/sysconf/sysconf01.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/sysconf/sysconf01.c b/testcases/kernel/syscalls/sysconf/sysconf01.c
+index 8542e77..e806943 100644
+--- a/testcases/kernel/syscalls/sysconf/sysconf01.c
++++ b/testcases/kernel/syscalls/sysconf/sysconf01.c
+@@ -102,7 +102,9 @@ int main(void)
+ 	test_sysconf(_SC_ATEXIT_MAX);
+ 	test_sysconf(_SC_2_C_BIND);
+ 	test_sysconf(_SC_2_C_DEV);
++#ifdef __GLIBC__
+ 	test_sysconf(_SC_2_C_VERSION);
++#endif
+ 	/* 21 - 25 */
+ 	test_sysconf(_SC_2_CHAR_TERM);
+ 	test_sysconf(_SC_2_FORT_DEV);
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
new file mode 100644
index 0000000..fc82ff9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
@@ -0,0 +1,43 @@
+From 94557fb7e1293c61145c959b8c5ffecf4a2b1069 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:24:44 +0000
+Subject: [PATCH 28/32] rt_sigaction.h: Use sighandler_t instead of
+ __sighandler_t
+
+When _GNU_SOURCE is used then both typedefs are same and using
+sighandler_t makes it work on musl too
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/lapi/rt_sigaction.h                      | 2 +-
+ testcases/kernel/syscalls/rt_sigsuspend/Makefile | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/include/lapi/rt_sigaction.h b/include/lapi/rt_sigaction.h
+index 3a5a763..870918c 100644
+--- a/include/lapi/rt_sigaction.h
++++ b/include/lapi/rt_sigaction.h
+@@ -34,7 +34,7 @@
+ #define INVAL_SA_PTR ((void *)-1)
+ 
+ struct kernel_sigaction {
+-	__sighandler_t k_sa_handler;
++	sighandler_t k_sa_handler;
+ 	unsigned long sa_flags;
+ 	void (*sa_restorer) (void);
+ 	sigset_t sa_mask;
+diff --git a/testcases/kernel/syscalls/rt_sigsuspend/Makefile b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
+index 37bc3a9..2ca7f7c 100644
+--- a/testcases/kernel/syscalls/rt_sigsuspend/Makefile
++++ b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
+@@ -19,4 +19,7 @@
+ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
++
++CFLAGS	+= -D_GNU_SOURCE
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch b/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
new file mode 100644
index 0000000..f7ece9e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
@@ -0,0 +1,32 @@
+From 2f8a57f66a94210d34dd0361659a8297cf3d813f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:29:24 +0000
+Subject: [PATCH 29/32] trace_shed: Fix build with musl
+
+Errors on musl are
+
+trace_sched.c:425:16: error: invalid operands to binary & (have
+'thread_sched_t * {aka struct <anonymous> *}' and 'int')
+      thrd_ndx, WEXITSTATUS(status));
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/sched/tool/trace_sched.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/sched/tool/trace_sched.c b/testcases/kernel/sched/tool/trace_sched.c
+index 7815686..30dca5f 100644
+--- a/testcases/kernel/sched/tool/trace_sched.c
++++ b/testcases/kernel/sched/tool/trace_sched.c
+@@ -422,7 +422,7 @@ int main(int argc,		/* number of input parameters.                        */
+ 			if (status == (thread_sched_t *) - 1) {
+ 				fprintf(stderr,
+ 					"thread [%d] - process exited with errors %d\n",
+-					thrd_ndx, WEXITSTATUS(status));
++					thrd_ndx, WEXITSTATUS((int)status));
+ 				exit(-1);
+ 			} else {
+ 				exp_prio[thrd_ndx] = status->exp_prio;
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
new file mode 100644
index 0000000..d2d6d76
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
@@ -0,0 +1,33 @@
+From 77c95dacffe90382a1f131c801ac569120d95949 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:32:24 +0000
+Subject: [PATCH 30/32] lib: Use PTHREAD_MUTEX_RECURSIVE in place of
+ PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP for non-glibc
+
+e.g. musl does not implement the _NP mutex types
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/tst_res.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/tst_res.c b/lib/tst_res.c
+index 5c1c58c..3244b5e 100644
+--- a/lib/tst_res.c
++++ b/lib/tst_res.c
+@@ -104,8 +104,11 @@ int TEST_ERRNO;
+ 	assert(strlen(buf) > 0);		\
+ } while (0)
+ 
++#ifdef __GLIBC__
+ static pthread_mutex_t tmutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
+-
++#else
++static pthread_mutex_t tmutex = {  PTHREAD_MUTEX_RECURSIVE };
++#endif
+ /*
+  * Define local function prototypes.
+  */
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch b/meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
similarity index 71%
rename from meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch
rename to meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
index 905eafb..473ca4c 100644
--- a/meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch
+++ b/meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
@@ -1,7 +1,7 @@
-From 243881d71d2d49027c3dc15fe27ebe7f4ee68700 Mon Sep 17 00:00:00 2001
-From: Chuang Dong <Chuang.Dong@windriver.com>
-Date: Wed, 10 Jun 2015 09:51:09 +0800
-Subject: [PATCH] ltp: vma03 fix the alginment of page size
+From 293ff1da06748ed4c69be6ece262d42e562e7298 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:36:19 +0000
+Subject: [PATCH 31/32] vma03: fix page size offset as per page size alignment
 
 the offset the param of mmap2() doesn't align the page size, but,
 this param allow must be a multiple of the page size as returned
@@ -9,18 +9,17 @@ by sysconf(_SC_PAGE_SIZE).meanwhile offset * 4096 must be a
 multiple of the system page size, so modify the input param of offset
 pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
 
-Upstream-Status: Submitted
-
 Signed-off-by: Chuang Dong <Chuang.Dong@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  testcases/kernel/mem/vma/vma03.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/testcases/kernel/mem/vma/vma03.c b/testcases/kernel/mem/vma/vma03.c
-index 6af9960..b86d7ce 100644
+index ad8a7b4..a539233 100644
 --- a/testcases/kernel/mem/vma/vma03.c
 +++ b/testcases/kernel/mem/vma/vma03.c
-@@ -89,7 +89,7 @@ int main(int argc, char *argv[])
+@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
  		if (fd == -1)
  			tst_brkm(TBROK | TERRNO, NULL, "open %s", TESTFILE);
  
@@ -30,5 +29,5 @@ index 6af9960..b86d7ce 100644
  			    fd, pgoff);
  		if (map == MAP_FAILED)
 -- 
-1.8.5.2.233.g932f7e4
+2.7.0
 
diff --git a/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch b/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
new file mode 100644
index 0000000..5c6bf91
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
@@ -0,0 +1,30 @@
+From 4f1905ff09c730091674818bd1b48ee221347101 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 08:30:29 +0000
+Subject: [PATCH 32/32] regen.sh: Include asm/unistd.h explicitly
+
+on musl this is not included indirectly and it results in errors like
+testcases/kernel/include/linux_syscall_numbers.h:1035:25: error:
+'__NR_SYSCALL_BASE' undeclared (first use in this function)
+|  #  define __NR_readdir (__NR_SYSCALL_BASE+ 89)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/include/regen.sh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/include/regen.sh b/testcases/kernel/include/regen.sh
+index f93f49b..ee790af 100755
+--- a/testcases/kernel/include/regen.sh
++++ b/testcases/kernel/include/regen.sh
+@@ -32,6 +32,7 @@ cat << EOF > "${output_pid}"
+ 
+ #include <errno.h>
+ #include <sys/syscall.h>
++#include <asm/unistd.h>
+ #include "cleanup.c"
+ 
+ #define ltp_syscall(NR, ...) ({ \\
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch b/meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch
deleted file mode 100644
index 064f00a..0000000
--- a/meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-[PATCH] add knob to control whether numa support should be checked
-
-Upstream-Status: Pending
-
-otherwise the random dependency will be generated
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- configure.ac                                       |   10 +-
-diff --git a/configure.ac b/configure.ac
-index 9f397e7..1357256 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -142,6 +142,12 @@ else
-     AC_SUBST([WITH_REALTIME_TESTSUITE],["no"])
- fi
- 
-+AC_ARG_WITH([numa],
-+  AC_HELP_STRING([--without-numa],
-+    [without the numa support]),
-+  [],[with_numa=yes],
-+)
-+
- AC_CONFIG_SUBDIRS([utils/ffsb-6.0-rc2])
- 
- # END testsuites knobs
-@@ -159,7 +165,9 @@ LTP_CHECK_SIGNAL
- LTP_CHECK_SYSCALL_EVENTFD
- LTP_CHECK_SYSCALL_KEYCTL
- LTP_CHECK_SYSCALL_MODIFY_LDT
-+if test "x$with_numa" = xyes; then
- LTP_CHECK_SYSCALL_NUMA
-+fi
- LTP_CHECK_SYSCALL_QUOTACTL
- LTP_CHECK_SYSCALL_SIGNALFD
- LTP_CHECK_SYSCALL_UNSHARE
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/ltp/ltp/make-setregid02-work.patch b/meta/recipes-extended/ltp/ltp/make-setregid02-work.patch
deleted file mode 100644
index 4836010..0000000
--- a/meta/recipes-extended/ltp/ltp/make-setregid02-work.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-[PATCH] make setregid02 work
-
-Upstream-Status: Inappropriate [configuration]
-
-there is no "nobody" group in oe-core, the user "nobody" belongs to
-"nogroup" group, so replace nobody with nogroup to make the test pass
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- testcases/kernel/syscalls/setregid/setregid02.c | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/setregid/setregid02.c b/testcases/kernel/syscalls/setregid/setregid02.c
-index 8058627..866bee4 100644
---- a/testcases/kernel/syscalls/setregid/setregid02.c
-+++ b/testcases/kernel/syscalls/setregid/setregid02.c
-@@ -41,7 +41,7 @@ static gid_t neg_one = -1;
- 
- static struct passwd *ltpuser;
- 
--static struct group nobody, root, bin;
-+static struct group nogroup, root, bin;
- 
- /*
-  * The following structure contains all test data.  Each structure in the array
-@@ -57,17 +57,17 @@ struct test_data_t {
- 	char *test_msg;
- } test_data[] = {
- 	{
--	&neg_one, &root.gr_gid, EPERM, &nobody, &nobody,
-+	&neg_one, &root.gr_gid, EPERM, &nogroup, &nogroup,
- 		    "After setregid(-1, root),"}, {
--	&neg_one, &bin.gr_gid, EPERM, &nobody, &nobody,
-+	&neg_one, &bin.gr_gid, EPERM, &nogroup, &nogroup,
- 		    "After setregid(-1, bin)"}, {
--	&root.gr_gid, &neg_one, EPERM, &nobody, &nobody,
-+	&root.gr_gid, &neg_one, EPERM, &nogroup, &nogroup,
- 		    "After setregid(root,-1),"}, {
--	&bin.gr_gid, &neg_one, EPERM, &nobody, &nobody,
-+	&bin.gr_gid, &neg_one, EPERM, &nogroup, &nogroup,
- 		    "After setregid(bin, -1),"}, {
--	&root.gr_gid, &bin.gr_gid, EPERM, &nobody, &nobody,
-+	&root.gr_gid, &bin.gr_gid, EPERM, &nogroup, &nogroup,
- 		    "After setregid(root, bin)"}, {
--	&bin.gr_gid, &root.gr_gid, EPERM, &nobody, &nobody,
-+	&bin.gr_gid, &root.gr_gid, EPERM, &nogroup, &nogroup,
- 		    "After setregid(bin, root),"}
- };
- 
-@@ -165,7 +165,7 @@ static void setup(void)
- } while (0)
- 
- 	GET_GID(root);
--	GET_GID(nobody);
-+	GET_GID(nogroup);
- 	GET_GID(bin);
- 
- 	TEST_PAUSE;
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/ltp/ltp_20150903.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
similarity index 60%
rename from meta/recipes-extended/ltp/ltp_20150903.bb
rename to meta/recipes-extended/ltp/ltp_20160126.bb
index f018dae..e3cd45d 100644
--- a/meta/recipes-extended/ltp/ltp_20150903.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -20,16 +20,44 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "attr libaio libcap acl openssl zip-native"
-SRCREV = "d19755a1deddd0268d7c29991afddab497da1823"
+DEPENDS_append_libc-musl = " fts "
+EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
+
+SRCREV = "fce797676b14f50406718e7ef640b50da66c9b36"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-    file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
-    file://ltp-Do-not-link-against-libfl.patch \
-    file://make-setregid02-work.patch \
-    file://add-knob-for-numa.patch \
-    file://add-knob-for-tirpc.patch \
-    file://0001-ltp-vma03-fix-the-alginment-of-page-size.patch \
-    file://0001-Fix-compilation-for-gcc-5.x.patch \
+           file://0001-ltp-Don-t-link-against-libfl.patch \
+           file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch \
+           file://0003-Add-knob-to-control-tirpc-support.patch \
+           file://0004-build-Add-option-to-select-libc-implementation.patch \
+           file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
+           file://0006-sendfile-Use-off64_t-instead-of-__off64_t.patch \
+           file://0007-replace-SIGCLD-with-SIGCHLD.patch \
+           file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
+           file://0009-Guard-error.h-with-__GLIBC__.patch \
+           file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
+           file://0011-Rename-sigset-variable-to-sigset1.patch \
+           file://0012-fsstress.c-Replace-__int64_t-with-int64_t.patch \
+           file://0013-include-fcntl.h-for-getting-O_-definitions.patch \
+           file://0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch \
+           file://0015-mincore01-Rename-PAGESIZE-to-pagesize.patch \
+           file://0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch \
+           file://0017-replace-sigval_t-with-union-sigval.patch \
+           file://0018-guard-mallocopt-with-__GLIBC__.patch \
+           file://0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch \
+           file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
+           file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
+           file://0022-include-sys-types.h.patch \
+           file://0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch \
+           file://0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch \
+           file://0025-mc_gethost-include-sys-types.h.patch \
+           file://0026-crash01-Define-_GNU_SOURCE.patch \
+           file://0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch \
+           file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch \
+           file://0029-trace_shed-Fix-build-with-musl.patch \
+           file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch \
+           file://0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch \
+           file://0032-regen.sh-Include-asm-unistd.h-explicitly.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.1


