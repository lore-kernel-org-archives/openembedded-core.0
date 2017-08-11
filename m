Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90D2F6011B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 01:16:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7B1G74k029209
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Aug 2017 18:16:07 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 10 Aug 2017 18:16:06 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1501840728.git.dengke.du@windriver.com>
	<ae1b815e43dd44f4d3ac4d1edd9e4dc50874d346.1501840728.git.dengke.du@windriver.com>
	<CAJTo0LYXVUb66qtnS3=TsdRm1bhZd1_KskU8zr-UNFt0SHCwZg@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <20b7ad82-4ad1-86cc-2c56-3d27af1ec570@windriver.com>
Date: Fri, 11 Aug 2017 09:15:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYXVUb66qtnS3=TsdRm1bhZd1_KskU8zr-UNFt0SHCwZg@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] ltp: upgrade to upstream latest commit on 20170804
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
X-List-Received-Date: Fri, 11 Aug 2017 01:16:07 -0000
Content-Type: multipart/alternative;
	boundary="------------2E152C57EB1A6E78DF0598E4"
Content-Language: en-US

--------------2E152C57EB1A6E78DF0598E4
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

OK, I have send the fix when building with musl for the upstream:

     https://github.com/linux-test-project/ltp/pull/194

still waitting.


On 2017年08月10日 04:47, Burton, Ross wrote:
> Breaks with musl:
>
> http://errors.yoctoproject.org/Errors/Details/150199/
>
> Ross
>
> On 4 August 2017 at 11:00, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     drop 4 patches because the upstream already contains them:
>
>         0001-dirtyc0w-Include-stdint.h.patch
>         0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>         0037-faccessat-and-fchmodat-Fix-build-warnings.patch
>         0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
>
>     drop the do_compile_prepend function, because the upstream already fix
>     the parallel make race, we can check it here:
>
>     https://github.com/linux-test-project/ltp/commit/3f385652efe811fe7491474f8513baf44cf0a12d
>     <https://github.com/linux-test-project/ltp/commit/3f385652efe811fe7491474f8513baf44cf0a12d>
>
>     Signed-off-by: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     ---
>      .../ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch   | 34 ------
>      ...TH_MAX-undeclared-when-building-with-musl.patch | 31 -----
>      ...faccessat-and-fchmodat-Fix-build-warnings.patch | 68 -----------
>      ...d_key02-update-to-test-fix-for-nonempty-N.patch | 136
>     ---------------------
>      meta/recipes-extended/ltp/ltp_20170516.bb
>     <http://ltp_20170516.bb>         |  14 +--
>      5 files changed, 1 insertion(+), 282 deletions(-)
>      delete mode 100644
>     meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
>      delete mode 100644
>     meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>      delete mode 100644
>     meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
>      delete mode 100644
>     meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
>
>     diff --git
>     a/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
>     b/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
>     deleted file mode 100644
>     index 5c73be4..0000000
>     ---
>     a/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
>     +++ /dev/null
>     @@ -1,34 +0,0 @@
>     -From 1b30d8dac1a37dc0abbb3b545db2824d6489e23f Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Fri, 9 Jun 2017 09:32:13 -0700
>     -Subject: [PATCH] dirtyc0w: Include stdint.h
>     -
>     -uintptr_t is defined in stdint.h
>     -
>     -Fixes
>     -| dirtyc0w_child.c:76:15: error: 'uintptr_t' undeclared (first
>     use in this function); did you mean 'intptr_t'?
>     -|    lseek(mfd, (uintptr_t) map, SEEK_SET);
>     -|                ^~~~~~~~~
>     -
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>     -Upstream-Status: Submitted
>     -
>     - testcases/kernel/security/dirtyc0w/dirtyc0w_child.c | 1 +
>     - 1 file changed, 1 insertion(+)
>     -
>     -diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
>     b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
>     -index 5328a9bc4..49abdd6ba 100644
>     ---- a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
>     -+++ b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
>     -@@ -23,6 +23,7 @@
>     - #include <sys/stat.h>
>     - #include <string.h>
>     - #include <stdlib.h>
>     -+#include <stdint.h>
>     - #include <pwd.h>
>     -
>     - #include "tst_safe_pthread.h"
>     ---
>     -2.13.1
>     -
>     diff --git
>     a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>     b/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>     deleted file mode 100644
>     index 020ddfe..0000000
>     ---
>     a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>     +++ /dev/null
>     @@ -1,31 +0,0 @@
>     -From b906ec2fe4711a727e198cd9259287c042eef8e2 Mon Sep 17 00:00:00
>     2001
>     -From: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     -Date: Thu, 9 Feb 2017 16:41:12 +0800
>     -Subject: [PATCH] fix PATH_MAX undeclared when building with musl
>     -
>     -fix PATH_MAX undeclared when building with musl.
>     -
>     -Upstream-Status: Submitted
>     [https://github.com/linux-test-project/ltp/pull/176
>     <https://github.com/linux-test-project/ltp/pull/176>]
>     -
>     -Signed-off-by: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     ----
>     - include/tst_test.h | 3 +++
>     - 1 file changed, 3 insertions(+)
>     -
>     -diff --git a/include/tst_test.h b/include/tst_test.h
>     -index 335c82684..4dfa1511b 100644
>     ---- a/include/tst_test.h
>     -+++ b/include/tst_test.h
>     -@@ -23,6 +23,9 @@
>     - #endif /* __TEST_H__ */
>     -
>     - #include <unistd.h>
>     -+#ifndef __GLIBC__
>     -+#include <limits.h>
>     -+#endif
>     -
>     - #include "tst_common.h"
>     - #include "tst_res_flags.h"
>     ---
>     -2.11.0
>     -
>     diff --git
>     a/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
>     b/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
>     deleted file mode 100644
>     index 99497d6..0000000
>     ---
>     a/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
>     +++ /dev/null
>     @@ -1,68 +0,0 @@
>     -From 4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647 Mon Sep 17 00:00:00
>     2001
>     -From: Naresh Kamboju <naresh.kamboju@linaro.org
>     <mailto:naresh.kamboju@linaro.org>>
>     -Date: Mon, 19 Jun 2017 19:01:21 +0530
>     -Subject: [PATCH 1/7] faccessat and fchmodat: Fix build warnings
>     -MIME-Version: 1.0
>     -Content-Type: text/plain; charset=UTF-8
>     -Content-Transfer-Encoding: 8bit
>     -
>     -Fixing below build warnings.
>     -
>     -ltp-full-20170516/testcases/kernel/syscalls/faccessat$ make
>     -In file included from ../../../../include/old/test.h:51:0,
>     -                 from faccessat01.c:44:
>     -faccessat01.c: In function ‘setup’:
>     -../../../../include/old/old_safe_file_ops.h:55:27:
>     -warning: format not a string literal and no format arguments
>     [-Wformat-security]
>     -                   (path), (fmt), ## __VA_ARGS__)
>     -                           ^
>     -faccessat01.c:132:2: note: in expansion of macro ‘SAFE_FILE_PRINTF’
>     -  SAFE_FILE_PRINTF(cleanup, testfile, testfile);
>     -  ^
>     -../../../../include/old/old_safe_file_ops.h:55:27:
>     -warning: format not a string literal and no format arguments
>     [-Wformat-security]
>     -                   (path), (fmt), ## __VA_ARGS__)
>     -                           ^
>     -faccessat01.c:133:2: note: in expansion of macro ‘SAFE_FILE_PRINTF’
>     -  SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
>     -
>     -Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org
>     <mailto:naresh.kamboju@linaro.org>>
>     -Upstream-Status: Accepted
>     [https://github.com/linux-test-project/ltp/commit/4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647
>     <https://github.com/linux-test-project/ltp/commit/4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647>]
>     ----
>     - testcases/kernel/syscalls/faccessat/faccessat01.c | 4 ++--
>     - testcases/kernel/syscalls/fchmodat/fchmodat01.c   | 4 ++--
>     - 2 files changed, 4 insertions(+), 4 deletions(-)
>     -
>     -diff --git a/testcases/kernel/syscalls/faccessat/faccessat01.c
>     b/testcases/kernel/syscalls/faccessat/faccessat01.c
>     -index 622dfd3b0..def7fa755 100644
>     ---- a/testcases/kernel/syscalls/faccessat/faccessat01.c
>     -+++ b/testcases/kernel/syscalls/faccessat/faccessat01.c
>     -@@ -129,8 +129,8 @@ void setup(void)
>     -       fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
>     -       fds[1] = fds[4] = fds[0];
>     -
>     --      SAFE_FILE_PRINTF(cleanup, testfile, testfile);
>     --      SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
>     -+      SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);
>     -+      SAFE_FILE_PRINTF(cleanup, testfile2, "%s", testfile2);
>     -
>     -       fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR,
>     0600);
>     -
>     -diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
>     b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
>     -index 6bf66d8b8..7856ed3fa 100644
>     ---- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
>     -+++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
>     -@@ -127,8 +127,8 @@ void setup(void)
>     -       fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
>     -       fds[1] = fds[4] = fds[0];
>     -
>     --      SAFE_FILE_PRINTF(cleanup, testfile, testfile);
>     --      SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
>     -+      SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);
>     -+      SAFE_FILE_PRINTF(cleanup, testfile2, "%s", testfile2);
>     -
>     -       fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR,
>     0600);
>     -       fds[3] = 100;
>     ---
>     -2.13.0
>     -
>     diff --git
>     a/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
>     b/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
>     deleted file mode 100644
>     index 3759e1f..0000000
>     ---
>     a/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
>     +++ /dev/null
>     @@ -1,136 +0,0 @@
>     -From 25045624e941ee76a13febd36187e23c6c435507 Mon Sep 17 00:00:00
>     2001
>     -From: Eric Biggers <ebiggers@google.com <mailto:ebiggers@google.com>>
>     -Date: Mon, 12 Jun 2017 11:55:21 -0700
>     -Subject: [PATCH 01/39] syscalls/add_key02: update to test fix for
>     nonempty
>     - NULL payload
>     -
>     -add_key02 was supposed to be a "Basic test for the add_key()
>     syscall",
>     -but it actually happened to test the obscure case of passing a NULL
>     -payload with nonzero length.  This case was mishandled by the kernel,
>     -which either returned EINVAL or crashed with a NULL pointer
>     dereference,
>     -depending on the key type.  (The former applied to the test, as
>     it used
>     -the "user" key type.)  The expected behavior in this case is that the
>     -syscall fail with EFAULT.
>     -
>     -Update the test to expect the fixed behavior from v4.12-rc5, and make
>     -the test more thorough by testing additional key types, including
>     ones
>     -that caused a NULL pointer dereference in unfixed kernels.
>     -
>     -Signed-off-by: Eric Biggers <ebiggers@google.com
>     <mailto:ebiggers@google.com>>
>     -Upstream-Status: Accepted
>     [https://github.com/linux-test-project/ltp/commit/25045624e941ee76a13febd36187e23c6c435507
>     <https://github.com/linux-test-project/ltp/commit/25045624e941ee76a13febd36187e23c6c435507>]
>     ----
>     - testcases/kernel/syscalls/add_key/add_key02.c | 69
>     ++++++++++++++++++++-------
>     - 1 file changed, 51 insertions(+), 18 deletions(-)
>     -
>     -diff --git a/testcases/kernel/syscalls/add_key/add_key02.c
>     b/testcases/kernel/syscalls/add_key/add_key02.c
>     -index 866800d6f..2e3308dcd 100644
>     ---- a/testcases/kernel/syscalls/add_key/add_key02.c
>     -+++ b/testcases/kernel/syscalls/add_key/add_key02.c
>     -@@ -1,5 +1,6 @@
>     -
>     /******************************************************************************
>     -  * Copyright (c) Crackerjack Project., 2007                  *
>     -+ * Copyright (c) 2017 Google, Inc.                     *
>     -  *                   *
>     -  * This program is free software;  you can redistribute it
>     and/or modify      *
>     -  * it under the terms of the GNU General Public License as
>     published by       *
>     -@@ -18,10 +19,17 @@
>     - 
>     ******************************************************************************/
>     -
>     - /*
>     -- * Basic test for the add_key() syscall.
>     -+ * Test that the add_key() syscall correctly handles a NULL
>     payload with nonzero
>     -+ * length.  Specifically, it should fail with EFAULT rather than
>     oopsing the
>     -+ * kernel with a NULL pointer dereference or failing with
>     EINVAL, as it did
>     -+ * before (depending on the key type).  This is a regression
>     test for commit
>     -+ * 5649645d725c ("KEYS: fix dereferencing NULL payload with
>     nonzero length").
>     -  *
>     -- * History:   Porting from Crackerjack to LTP is done by
>     -- *          Manas Kumar Nayak maknayak@in.ibm.com
>     <mailto:maknayak@in.ibm.com>>
>     -+ * Note that none of the key types that exhibited the NULL
>     pointer dereference
>     -+ * are guaranteed to be built into the kernel, so we just test
>     as many as we
>     -+ * can, in the hope of catching one.  We also test with the
>     "user" key type for
>     -+ * good measure, although it was one of the types that failed
>     with EINVAL rather
>     -+ * than dereferencing NULL.
>     -  */
>     -
>     - #include "config.h"
>     -@@ -33,36 +41,61 @@
>     -
>     - #ifdef HAVE_LINUX_KEYCTL_H
>     - struct tcase {
>     --      char *type;
>     --      char *desc;
>     --      void *payload;
>     --      int plen;
>     --      int exp_errno;
>     -+      const char *type;
>     -+      size_t plen;
>     - } tcases[] = {
>     --      {"user", "firstkey", NULL, 1, EINVAL}
>     -+      /*
>     -+       * The payload length we test for each key type needs to
>     pass initial
>     -+       * validation but is otherwise arbitrary.  Note: the
>     "rxrpc_s" key type
>     -+       * requires a payload of exactly 8 bytes.
>     -+       */
>     -+      { "asymmetric",         64 },
>     -+      { "cifs.idmap",         64 },
>     -+      { "cifs.spnego",        64 },
>     -+      { "pkcs7_test",         64 },
>     -+      { "rxrpc",              64 },
>     -+      { "rxrpc_s",             8 },
>     -+      { "user",               64 },
>     - };
>     - #endif /* HAVE_LINUX_KEYCTL_H */
>     -
>     - static void verify_add_key(unsigned int i)
>     - {
>     - #ifdef HAVE_LINUX_KEYCTL_H
>     --      TEST(tst_syscall(__NR_add_key, tcases[i].type, tcases[i].desc,
>     --                       tcases[i].payload, tcases[i].plen,
>     --                       KEY_SPEC_USER_KEYRING));
>     -+      TEST(tst_syscall(__NR_add_key, tcases[i].type, "abc:def",
>     -+                       NULL, tcases[i].plen,
>     KEY_SPEC_PROCESS_KEYRING));
>     -
>     -       if (TEST_RETURN != -1) {
>     --              tst_res(TFAIL, "add_key() passed unexpectedly");
>     -+              tst_res(TFAIL,
>     -+                      "add_key() with key type '%s' unexpectedly
>     succeeded",
>     -+                      tcases[i].type);
>     -               return;
>     -       }
>     -
>     --      if (TEST_ERRNO == tcases[i].exp_errno) {
>     --              tst_res(TPASS | TTERRNO, "add_key() failed
>     expectedly");
>     -+      if (TEST_ERRNO == EFAULT) {
>     -+              tst_res(TPASS, "received expected EFAULT with key
>     type '%s'",
>     -+                      tcases[i].type);
>     -               return;
>     -       }
>     -
>     --      tst_res(TFAIL | TTERRNO,
>     --              "add_key() failed unexpectedly, expected %s",
>     --              tst_strerrno(tcases[i].exp_errno));
>     -+      if (TEST_ERRNO == ENODEV) {
>     -+              tst_res(TCONF, "kernel doesn't support key type '%s'",
>     -+                      tcases[i].type);
>     -+              return;
>     -+      }
>     -+
>     -+      /*
>     -+       * It's possible for the "asymmetric" key type to be
>     supported, but with
>     -+       * no asymmetric key parsers registered.  In that case,
>     attempting to
>     -+       * add a key of type asymmetric will fail with EBADMSG.
>     -+       */
>     -+      if (TEST_ERRNO == EBADMSG && !strcmp(tcases[i].type,
>     "asymmetric")) {
>     -+              tst_res(TCONF, "no asymmetric key parsers are
>     registered");
>     -+              return;
>     -+      }
>     -+
>     -+      tst_res(TFAIL | TTERRNO, "unexpected error with key type
>     '%s'",
>     -+              tcases[i].type);
>     - #else
>     -       tst_brk(TCONF, "linux/keyctl.h was missing upon
>     compilation.");
>     - #endif /* HAVE_LINUX_KEYCTL_H */
>     ---
>     -2.13.0
>     -
>     diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb
>     <http://ltp_20170516.bb>
>     b/meta/recipes-extended/ltp/ltp_20170516.bb <http://ltp_20170516.bb>
>     index 86b8012..46c9741 100644
>     --- a/meta/recipes-extended/ltp/ltp_20170516.bb
>     <http://ltp_20170516.bb>
>     +++ b/meta/recipes-extended/ltp/ltp_20170516.bb
>     <http://ltp_20170516.bb>
>     @@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
>      EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>      CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>      CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
>     -SRCREV = "6c6c6ca40afb3611e52486f670085762ff451e91"
>     +SRCREV = "18916a2e6d8c997b7b29dcfa9550d5a15b22ed22"
>
>      SRC_URI = "git://github.com/linux-test-project/ltp.git
>     <http://github.com/linux-test-project/ltp.git> \
>                 file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
>     @@ -29,7 +29,6 @@ SRC_URI =
>     "git://github.com/linux-test-project/ltp.git
>     <http://github.com/linux-test-project/ltp.git> \
>                 file://0003-Add-knob-to-control-tirpc-support.patch \
>                
>     file://0004-build-Add-option-to-select-libc-implementation.patch \
>                
>     file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
>     \
>     -         
>      file://0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch \
>                
>     file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch \
>                
>     file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
>                
>     file://0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
>     \
>     @@ -49,9 +48,6 @@ SRC_URI =
>     "git://github.com/linux-test-project/ltp.git
>     <http://github.com/linux-test-project/ltp.git> \
>                 file://0034-periodic_output.patch \
>                 file://0035-fix-test_proc_kill-hang.patch \
>                
>     file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
>     \
>     -           file://0001-dirtyc0w-Include-stdint.h.patch \
>     -         
>      file://0037-faccessat-and-fchmodat-Fix-build-warnings.patch \
>     -         
>      file://0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
>     \
>                 "
>
>      S = "${WORKDIR}/git"
>     @@ -69,14 +65,6 @@ EXTRA_OECONF = "
>     --with-power-management-testsuite --with-realtime-testsuite "
>      # ltp network/rpc test cases ftbfs when libtirpc is found
>      EXTRA_OECONF += " --without-tirpc "
>
>     -# The makefiles make excessive use of make -C and several include
>     testcases.mk <http://testcases.mk>
>     -# which triggers a build of the syscall header. To reproduce,
>     build ltp,
>     -# then delete the header, then "make -j XX" and watch regen.sh
>     run multiple
>     -# times. Its easier to generate this once here instead.
>     -do_compile_prepend () {
>     -       ( make -C ${B}/testcases/kernel
>     include/linux_syscall_numbers.h )
>     -}
>     -
>      do_install(){
>          install -d ${D}/opt/ltp/
>          oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------2E152C57EB1A6E78DF0598E4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>OK, I have send the fix when building with musl for the upstream:</p>
    <p>    <a class="moz-txt-link-freetext" href="https://github.com/linux-test-project/ltp/pull/194">https://github.com/linux-test-project/ltp/pull/194</a></p>
    <p>still waitting.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017年08月10日 04:47, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYXVUb66qtnS3=TsdRm1bhZd1_KskU8zr-UNFt0SHCwZg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Breaks with musl:
        <div><br>
        </div>
        <div><a
            href="http://errors.yoctoproject.org/Errors/Details/150199/"
            moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Details/150199/</a><br>
        </div>
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 4 August 2017 at 11:00, Dengke Du <span
            dir="ltr">&lt;<a href="mailto:dengke.du@windriver.com"
              target="_blank" moz-do-not-send="true">dengke.du@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">drop 4
            patches because the upstream already contains them:<br>
            <br>
                0001-dirtyc0w-Include-stdint.<wbr>h.patch<br>
                0006-fix-PATH_MAX-undeclared-<wbr>when-building-with-musl.patch<br>
                0037-faccessat-and-fchmodat-<wbr>Fix-build-warnings.patch<br>
                0038-syscalls-add_key02-<wbr>update-to-test-fix-for-<wbr>nonempty-N.patch<br>
            <br>
            drop the do_compile_prepend function, because the upstream
            already fix<br>
            the parallel make race, we can check it here:<br>
            <br>
                <a
href="https://github.com/linux-test-project/ltp/commit/3f385652efe811fe7491474f8513baf44cf0a12d"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/linux-test-<wbr>project/ltp/commit/<wbr>3f385652efe811fe7491474f8513ba<wbr>f44cf0a12d</a><br>
            <br>
            Signed-off-by: Dengke Du &lt;<a
              href="mailto:dengke.du@windriver.com"
              moz-do-not-send="true">dengke.du@windriver.com</a>&gt;<br>
            ---<br>
             .../ltp/ltp/0001-dirtyc0w-<wbr>Include-stdint.h.patch   | 
            34 ------<br>
             ...TH_MAX-undeclared-when-<wbr>building-with-musl.patch | 
            31 -----<br>
             ...faccessat-and-fchmodat-Fix-<wbr>build-warnings.patch | 
            68 -----------<br>
             ...d_key02-update-to-test-fix-<wbr>for-nonempty-N.patch |
            136 ---------------------<br>
             meta/recipes-extended/ltp/<a href="http://ltp_20170516.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">ltp_<wbr>20170516.bb</a> 
                    |  14 +--<br>
             5 files changed, 1 insertion(+), 282 deletions(-)<br>
             delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0001-dirtyc0w-Include-stdint.<wbr>h.patch<br>
             delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0006-fix-PATH_MAX-undeclared-<wbr>when-building-with-musl.patch<br>
             delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0037-faccessat-and-fchmodat-<wbr>Fix-build-warnings.patch<br>
             delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0038-syscalls-add_key02-<wbr>update-to-test-fix-for-<wbr>nonempty-N.patch<br>
            <br>
            diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0001-dirtyc0w-Include-<wbr>stdint.h.patch
            b/meta/recipes-extended/ltp/<wbr>ltp/0001-dirtyc0w-Include-<wbr>stdint.h.patch<br>
            deleted file mode 100644<br>
            index 5c73be4..0000000<br>
            --- a/meta/recipes-extended/ltp/<wbr>ltp/0001-dirtyc0w-Include-<wbr>stdint.h.patch<br>
            +++ /dev/null<br>
            @@ -1,34 +0,0 @@<br>
            -From 1b30d8dac1a37dc0abbb3b545db282<wbr>4d6489e23f Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com"
              moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
            -Date: Fri, 9 Jun 2017 09:32:13 -0700<br>
            -Subject: [PATCH] dirtyc0w: Include stdint.h<br>
            -<br>
            -uintptr_t is defined in stdint.h<br>
            -<br>
            -Fixes<br>
            -| dirtyc0w_child.c:76:15: error: 'uintptr_t' undeclared
            (first use in this function); did you mean 'intptr_t'?<br>
            -|    lseek(mfd, (uintptr_t) map, SEEK_SET);<br>
            -|                ^~~~~~~~~<br>
            -<br>
            -Signed-off-by: Khem Raj &lt;<a
              href="mailto:raj.khem@gmail.com" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
            -Upstream-Status: Submitted<br>
            -<br>
            - testcases/kernel/security/<wbr>dirtyc0w/dirtyc0w_child.c |
            1 +<br>
            - 1 file changed, 1 insertion(+)<br>
            -<br>
            -diff --git a/testcases/kernel/security/<wbr>dirtyc0w/dirtyc0w_child.c
            b/testcases/kernel/security/<wbr>dirtyc0w/dirtyc0w_child.c<br>
            -index 5328a9bc4..49abdd6ba 100644<br>
            ---- a/testcases/kernel/security/<wbr>dirtyc0w/dirtyc0w_child.c<br>
            -+++ b/testcases/kernel/security/<wbr>dirtyc0w/dirtyc0w_child.c<br>
            -@@ -23,6 +23,7 @@<br>
            - #include &lt;sys/stat.h&gt;<br>
            - #include &lt;string.h&gt;<br>
            - #include &lt;stdlib.h&gt;<br>
            -+#include &lt;stdint.h&gt;<br>
            - #include &lt;pwd.h&gt;<br>
            -<br>
            - #include "tst_safe_pthread.h"<br>
            ---<br>
            -2.13.1<br>
            -<br>
            diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0006-fix-PATH_MAX-<wbr>undeclared-when-building-with-<wbr>musl.patch
            b/meta/recipes-extended/ltp/<wbr>ltp/0006-fix-PATH_MAX-<wbr>undeclared-when-building-with-<wbr>musl.patch<br>
            deleted file mode 100644<br>
            index 020ddfe..0000000<br>
            --- a/meta/recipes-extended/ltp/<wbr>ltp/0006-fix-PATH_MAX-<wbr>undeclared-when-building-with-<wbr>musl.patch<br>
            +++ /dev/null<br>
            @@ -1,31 +0,0 @@<br>
            -From b906ec2fe4711a727e198cd9259287<wbr>c042eef8e2 Mon Sep
            17 00:00:00 2001<br>
            -From: Dengke Du &lt;<a
              href="mailto:dengke.du@windriver.com"
              moz-do-not-send="true">dengke.du@windriver.com</a>&gt;<br>
            -Date: Thu, 9 Feb 2017 16:41:12 +0800<br>
            -Subject: [PATCH] fix PATH_MAX undeclared when building with
            musl<br>
            -<br>
            -fix PATH_MAX undeclared when building with musl.<br>
            -<br>
            -Upstream-Status: Submitted [<a
              href="https://github.com/linux-test-project/ltp/pull/176"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/linux-<wbr>test-project/ltp/pull/176</a>]<br>
            -<br>
            -Signed-off-by: Dengke Du &lt;<a
              href="mailto:dengke.du@windriver.com"
              moz-do-not-send="true">dengke.du@windriver.com</a>&gt;<br>
            ----<br>
            - include/tst_test.h | 3 +++<br>
            - 1 file changed, 3 insertions(+)<br>
            -<br>
            -diff --git a/include/tst_test.h b/include/tst_test.h<br>
            -index 335c82684..4dfa1511b 100644<br>
            ---- a/include/tst_test.h<br>
            -+++ b/include/tst_test.h<br>
            -@@ -23,6 +23,9 @@<br>
            - #endif /* __TEST_H__ */<br>
            -<br>
            - #include &lt;unistd.h&gt;<br>
            -+#ifndef __GLIBC__<br>
            -+#include &lt;limits.h&gt;<br>
            -+#endif<br>
            -<br>
            - #include "tst_common.h"<br>
            - #include "tst_res_flags.h"<br>
            ---<br>
            -2.11.0<br>
            -<br>
            diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0037-faccessat-and-<wbr>fchmodat-Fix-build-warnings.<wbr>patch
            b/meta/recipes-extended/ltp/<wbr>ltp/0037-faccessat-and-<wbr>fchmodat-Fix-build-warnings.<wbr>patch<br>
            deleted file mode 100644<br>
            index 99497d6..0000000<br>
            --- a/meta/recipes-extended/ltp/<wbr>ltp/0037-faccessat-and-<wbr>fchmodat-Fix-build-warnings.<wbr>patch<br>
            +++ /dev/null<br>
            @@ -1,68 +0,0 @@<br>
            -From 4141bdb441f7576a2e73abeb2a0fb1<wbr>c7b8bd8647 Mon Sep
            17 00:00:00 2001<br>
            -From: Naresh Kamboju &lt;<a
              href="mailto:naresh.kamboju@linaro.org"
              moz-do-not-send="true">naresh.kamboju@linaro.org</a>&gt;<br>
            -Date: Mon, 19 Jun 2017 19:01:21 +0530<br>
            -Subject: [PATCH 1/7] faccessat and fchmodat: Fix build
            warnings<br>
            -MIME-Version: 1.0<br>
            -Content-Type: text/plain; charset=UTF-8<br>
            -Content-Transfer-Encoding: 8bit<br>
            -<br>
            -Fixing below build warnings.<br>
            -<br>
            -ltp-full-20170516/testcases/<wbr>kernel/syscalls/faccessat$
            make<br>
            -In file included from ../../../../include/old/test.<wbr>h:51:0,<br>
            -                 from faccessat01.c:44:<br>
            -faccessat01.c: In function ‘setup’:<br>
            -../../../../include/old/old_<wbr>safe_file_ops.h:55:27:<br>
            -warning: format not a string literal and no format
            arguments [-Wformat-security]<br>
            -                   (path), (fmt), ## __VA_ARGS__)<br>
            -                           ^<br>
            -faccessat01.c:132:2: note: in expansion of macro
            ‘SAFE_FILE_PRINTF’<br>
            -  SAFE_FILE_PRINTF(cleanup, testfile, testfile);<br>
            -  ^<br>
            -../../../../include/old/old_<wbr>safe_file_ops.h:55:27:<br>
            -warning: format not a string literal and no format
            arguments [-Wformat-security]<br>
            -                   (path), (fmt), ## __VA_ARGS__)<br>
            -                           ^<br>
            -faccessat01.c:133:2: note: in expansion of macro
            ‘SAFE_FILE_PRINTF’<br>
            -  SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);<br>
            -<br>
            -Signed-off-by: Naresh Kamboju &lt;<a
              href="mailto:naresh.kamboju@linaro.org"
              moz-do-not-send="true">naresh.kamboju@linaro.org</a>&gt;<br>
            -Upstream-Status: Accepted [<a
href="https://github.com/linux-test-project/ltp/commit/4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/linux-<wbr>test-project/ltp/commit/<wbr>4141bdb441f7576a2e73abeb2a0fb1<wbr>c7b8bd8647</a>]<br>
            ----<br>
            - testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c | 4
            ++--<br>
            - testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c   | 4
            ++--<br>
            - 2 files changed, 4 insertions(+), 4 deletions(-)<br>
            -<br>
            -diff --git a/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c
            b/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
            -index 622dfd3b0..def7fa755 100644<br>
            ---- a/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
            -+++ b/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
            -@@ -129,8 +129,8 @@ void setup(void)<br>
            -       fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);<br>
            -       fds[1] = fds[4] = fds[0];<br>
            -<br>
            --      SAFE_FILE_PRINTF(cleanup, testfile, testfile);<br>
            --      SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);<br>
            -+      SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);<br>
            -+      SAFE_FILE_PRINTF(cleanup, testfile2, "%s",
            testfile2);<br>
            -<br>
            -       fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT |
            O_RDWR, 0600);<br>
            -<br>
            -diff --git a/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c
            b/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
            -index 6bf66d8b8..7856ed3fa 100644<br>
            ---- a/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
            -+++ b/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
            -@@ -127,8 +127,8 @@ void setup(void)<br>
            -       fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);<br>
            -       fds[1] = fds[4] = fds[0];<br>
            -<br>
            --      SAFE_FILE_PRINTF(cleanup, testfile, testfile);<br>
            --      SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);<br>
            -+      SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);<br>
            -+      SAFE_FILE_PRINTF(cleanup, testfile2, "%s",
            testfile2);<br>
            -<br>
            -       fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT |
            O_RDWR, 0600);<br>
            -       fds[3] = 100;<br>
            ---<br>
            -2.13.0<br>
            -<br>
            diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0038-syscalls-add_key02-<wbr>update-to-test-fix-for-<wbr>nonempty-N.patch
            b/meta/recipes-extended/ltp/<wbr>ltp/0038-syscalls-add_key02-<wbr>update-to-test-fix-for-<wbr>nonempty-N.patch<br>
            deleted file mode 100644<br>
            index 3759e1f..0000000<br>
            --- a/meta/recipes-extended/ltp/<wbr>ltp/0038-syscalls-add_key02-<wbr>update-to-test-fix-for-<wbr>nonempty-N.patch<br>
            +++ /dev/null<br>
            @@ -1,136 +0,0 @@<br>
            -From 25045624e941ee76a13febd36187e2<wbr>3c6c435507 Mon Sep
            17 00:00:00 2001<br>
            -From: Eric Biggers &lt;<a href="mailto:ebiggers@google.com"
              moz-do-not-send="true">ebiggers@google.com</a>&gt;<br>
            -Date: Mon, 12 Jun 2017 11:55:21 -0700<br>
            -Subject: [PATCH 01/39] syscalls/add_key02: update to test
            fix for nonempty<br>
            - NULL payload<br>
            -<br>
            -add_key02 was supposed to be a "Basic test for the
            add_key() syscall",<br>
            -but it actually happened to test the obscure case of
            passing a NULL<br>
            -payload with nonzero length.  This case was mishandled by
            the kernel,<br>
            -which either returned EINVAL or crashed with a NULL pointer
            dereference,<br>
            -depending on the key type.  (The former applied to the
            test, as it used<br>
            -the "user" key type.)  The expected behavior in this case
            is that the<br>
            -syscall fail with EFAULT.<br>
            -<br>
            -Update the test to expect the fixed behavior from
            v4.12-rc5, and make<br>
            -the test more thorough by testing additional key types,
            including ones<br>
            -that caused a NULL pointer dereference in unfixed kernels.<br>
            -<br>
            -Signed-off-by: Eric Biggers &lt;<a
              href="mailto:ebiggers@google.com" moz-do-not-send="true">ebiggers@google.com</a>&gt;<br>
            -Upstream-Status: Accepted [<a
href="https://github.com/linux-test-project/ltp/commit/25045624e941ee76a13febd36187e23c6c435507"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/linux-<wbr>test-project/ltp/commit/<wbr>25045624e941ee76a13febd36187e2<wbr>3c6c435507</a>]<br>
            ----<br>
            - testcases/kernel/syscalls/add_<wbr>key/add_key02.c | 69
            ++++++++++++++++++++-------<br>
            - 1 file changed, 51 insertions(+), 18 deletions(-)<br>
            -<br>
            -diff --git a/testcases/kernel/syscalls/<wbr>add_key/add_key02.c
            b/testcases/kernel/syscalls/<wbr>add_key/add_key02.c<br>
            -index 866800d6f..2e3308dcd 100644<br>
            ---- a/testcases/kernel/syscalls/<wbr>add_key/add_key02.c<br>
            -+++ b/testcases/kernel/syscalls/<wbr>add_key/add_key02.c<br>
            -@@ -1,5 +1,6 @@<br>
            - /*****************************<wbr>******************************<wbr>*******************<br>
            -  * Copyright (c) Crackerjack Project., 2007               
                             *<br>
            -+ * Copyright (c) 2017 Google, Inc.                       
                                *<br>
            -  *                                                       
                              *<br>
            -  * This program is free software;  you can redistribute it
            and/or modify      *<br>
            -  * it under the terms of the GNU General Public License as
            published by       *<br>
            -@@ -18,10 +19,17 @@<br>
            -  ******************************<wbr>******************************<wbr>******************/<br>
            -<br>
            - /*<br>
            -- * Basic test for the add_key() syscall.<br>
            -+ * Test that the add_key() syscall correctly handles a
            NULL payload with nonzero<br>
            -+ * length.  Specifically, it should fail with EFAULT
            rather than oopsing the<br>
            -+ * kernel with a NULL pointer dereference or failing with
            EINVAL, as it did<br>
            -+ * before (depending on the key type).  This is a
            regression test for commit<br>
            -+ * 5649645d725c ("KEYS: fix dereferencing NULL payload
            with nonzero length").<br>
            -  *<br>
            -- * History:   Porting from Crackerjack to LTP is done by<br>
            -- *          Manas Kumar Nayak <a
              href="mailto:maknayak@in.ibm.com" moz-do-not-send="true">maknayak@in.ibm.com</a>&gt;<br>
            -+ * Note that none of the key types that exhibited the NULL
            pointer dereference<br>
            -+ * are guaranteed to be built into the kernel, so we just
            test as many as we<br>
            -+ * can, in the hope of catching one.  We also test with
            the "user" key type for<br>
            -+ * good measure, although it was one of the types that
            failed with EINVAL rather<br>
            -+ * than dereferencing NULL.<br>
            -  */<br>
            -<br>
            - #include "config.h"<br>
            -@@ -33,36 +41,61 @@<br>
            -<br>
            - #ifdef HAVE_LINUX_KEYCTL_H<br>
            - struct tcase {<br>
            --      char *type;<br>
            --      char *desc;<br>
            --      void *payload;<br>
            --      int plen;<br>
            --      int exp_errno;<br>
            -+      const char *type;<br>
            -+      size_t plen;<br>
            - } tcases[] = {<br>
            --      {"user", "firstkey", NULL, 1, EINVAL}<br>
            -+      /*<br>
            -+       * The payload length we test for each key type
            needs to pass initial<br>
            -+       * validation but is otherwise arbitrary.  Note: the
            "rxrpc_s" key type<br>
            -+       * requires a payload of exactly 8 bytes.<br>
            -+       */<br>
            -+      { "asymmetric",         64 },<br>
            -+      { "cifs.idmap",         64 },<br>
            -+      { "cifs.spnego",        64 },<br>
            -+      { "pkcs7_test",         64 },<br>
            -+      { "rxrpc",              64 },<br>
            -+      { "rxrpc_s",             8 },<br>
            -+      { "user",               64 },<br>
            - };<br>
            - #endif /* HAVE_LINUX_KEYCTL_H */<br>
            -<br>
            - static void verify_add_key(unsigned int i)<br>
            - {<br>
            - #ifdef HAVE_LINUX_KEYCTL_H<br>
            --      TEST(tst_syscall(__NR_add_key, tcases[i].type,
            tcases[i].desc,<br>
            --                       tcases[i].payload, tcases[i].plen,<br>
            --                       KEY_SPEC_USER_KEYRING));<br>
            -+      TEST(tst_syscall(__NR_add_key, tcases[i].type,
            "abc:def",<br>
            -+                       NULL, tcases[i].plen,
            KEY_SPEC_PROCESS_KEYRING));<br>
            -<br>
            -       if (TEST_RETURN != -1) {<br>
            --              tst_res(TFAIL, "add_key() passed
            unexpectedly");<br>
            -+              tst_res(TFAIL,<br>
            -+                      "add_key() with key type '%s'
            unexpectedly succeeded",<br>
            -+                      tcases[i].type);<br>
            -               return;<br>
            -       }<br>
            -<br>
            --      if (TEST_ERRNO == tcases[i].exp_errno) {<br>
            --              tst_res(TPASS | TTERRNO, "add_key() failed
            expectedly");<br>
            -+      if (TEST_ERRNO == EFAULT) {<br>
            -+              tst_res(TPASS, "received expected EFAULT
            with key type '%s'",<br>
            -+                      tcases[i].type);<br>
            -               return;<br>
            -       }<br>
            -<br>
            --      tst_res(TFAIL | TTERRNO,<br>
            --              "add_key() failed unexpectedly, expected
            %s",<br>
            --              tst_strerrno(tcases[i].exp_<wbr>errno));<br>
            -+      if (TEST_ERRNO == ENODEV) {<br>
            -+              tst_res(TCONF, "kernel doesn't support key
            type '%s'",<br>
            -+                      tcases[i].type);<br>
            -+              return;<br>
            -+      }<br>
            -+<br>
            -+      /*<br>
            -+       * It's possible for the "asymmetric" key type to be
            supported, but with<br>
            -+       * no asymmetric key parsers registered.  In that
            case, attempting to<br>
            -+       * add a key of type asymmetric will fail with
            EBADMSG.<br>
            -+       */<br>
            -+      if (TEST_ERRNO == EBADMSG &amp;&amp;
            !strcmp(tcases[i].type, "asymmetric")) {<br>
            -+              tst_res(TCONF, "no asymmetric key parsers
            are registered");<br>
            -+              return;<br>
            -+      }<br>
            -+<br>
            -+      tst_res(TFAIL | TTERRNO, "unexpected error with key
            type '%s'",<br>
            -+              tcases[i].type);<br>
            - #else<br>
            -       tst_brk(TCONF, "linux/keyctl.h was missing upon
            compilation.");<br>
            - #endif /* HAVE_LINUX_KEYCTL_H */<br>
            ---<br>
            -2.13.0<br>
            -<br>
            diff --git a/meta/recipes-extended/ltp/<a
              href="http://ltp_20170516.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">lt<wbr>p_20170516.bb</a>
            b/meta/recipes-extended/ltp/<a href="http://ltp_20170516.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">lt<wbr>p_20170516.bb</a><br>
            index 86b8012..46c9741 100644<br>
            --- a/meta/recipes-extended/ltp/<a
              href="http://ltp_20170516.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">lt<wbr>p_20170516.bb</a><br>
            +++ b/meta/recipes-extended/ltp/<a
              href="http://ltp_20170516.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">lt<wbr>p_20170516.bb</a><br>
            @@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "<br>
             EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "<br>
             CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"<br>
             CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"<br>
            -SRCREV = "<wbr>6c6c6ca40afb3611e52486f6700857<wbr>62ff451e91"<br>
            +SRCREV = "<wbr>18916a2e6d8c997b7b29dcfa9550d5<wbr>a15b22ed22"<br>
            <br>
             SRC_URI = "git://<a
              href="http://github.com/linux-test-project/ltp.git"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/linux-test-<wbr>project/ltp.git</a>
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0001-add-_GNU_SOURCE">file://0001-add-_GNU_SOURCE</a>-<wbr>to-pec_listener.c.patch
            \<br>
            @@ -29,7 +29,6 @@ SRC_URI = "git://<a
              href="http://github.com/linux-test-project/ltp.git"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/linux-test-<wbr>project/ltp.git</a>
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0003-Add-knob-to">file://0003-Add-knob-to</a>-<wbr>control-tirpc-support.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0004-build-Add-option">file://0004-build-Add-option</a>-<wbr>to-select-libc-implementation.<wbr>patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0005-kernel">file://0005-kernel</a>-<wbr>controllers-Link-with-libfts-<wbr>explicitly-on-mu.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://0006-fix-PATH_MAX">file://0006-fix-PATH_MAX</a>-<wbr>undeclared-when-building-with-<wbr>musl.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0007-fix-__WORDSIZE">file://0007-fix-__WORDSIZE</a>-<wbr>undeclared-when-building-with-<wbr>musl.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0008-Check-if-__GLIBC_">file://0008-Check-if-__GLIBC_</a><wbr>PREREQ-is-defined-before-<wbr>using-it.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0009-fix-redefinition">file://0009-fix-redefinition</a>-<wbr>of-struct-msgbuf-error-<wbr>building-wit.patch
            \<br>
            @@ -49,9 +48,6 @@ SRC_URI = "git://<a
              href="http://github.com/linux-test-project/ltp.git"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/linux-test-<wbr>project/ltp.git</a>
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0034-periodic_output">file://0034-periodic_output</a>.<wbr>patch \<br>
                        <a class="moz-txt-link-freetext" href="file://0035-fix-test_proc_">file://0035-fix-test_proc_</a><wbr>kill-hang.patch \<br>
                        <a class="moz-txt-link-freetext" href="file://0036-testcases-network">file://0036-testcases-network</a>-<wbr>nfsv4-acl-acl1.c-Security-fix-<wbr>on-s.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://0001-dirtyc0w-Include">file://0001-dirtyc0w-Include</a>-<wbr>stdint.h.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://0037-faccessat-and">file://0037-faccessat-and</a>-<wbr>fchmodat-Fix-build-warnings.<wbr>patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://0038-syscalls-add_">file://0038-syscalls-add_</a><wbr>key02-update-to-test-fix-for-<wbr>nonempty-N.patch
            \<br>
                        "<br>
            <br>
             S = "${WORKDIR}/git"<br>
            @@ -69,14 +65,6 @@ EXTRA_OECONF = " --with-power-management-<wbr>testsuite
            --with-realtime-testsuite "<br>
             # ltp network/rpc test cases ftbfs when libtirpc is found<br>
             EXTRA_OECONF += " --without-tirpc "<br>
            <br>
            -# The makefiles make excessive use of make -C and several
            include <a href="http://testcases.mk" rel="noreferrer"
              target="_blank" moz-do-not-send="true">testcases.mk</a><br>
            -# which triggers a build of the syscall header. To
            reproduce, build ltp,<br>
            -# then delete the header, then "make -j XX" and watch
            regen.sh run multiple<br>
            -# times. Its easier to generate this once here instead.<br>
            -do_compile_prepend () {<br>
            -       ( make -C ${B}/testcases/kernel
            include/linux_syscall_numbers.<wbr>h )<br>
            -}<br>
            -<br>
             do_install(){<br>
                 install -d ${D}/opt/ltp/<br>
                 oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.7.4<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------2E152C57EB1A6E78DF0598E4--
