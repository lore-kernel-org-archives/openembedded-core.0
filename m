Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5355A71AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 20:47:38 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m88so2708675iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 13:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IVs1kJuN8vsCbZG4GYV01NBcUKM/qI2XRkDbg7qMljE=;
	b=AgXcmqn0uSKSvm6ffU+pnZxMXbtvNxG5aRIHAZGytxuTqfSA5G+PSQvKAHPdkEg2Md
	fQM7+HV4jxZKbnzYjh8KZ4zlaHuPH2XuXROX5D8yLhdi+PS2dVcrTbtS+BprgIlUZoqO
	52nJkltX+U2i5CDrRaup9cnb0hZawhRIyTjPnvuaViDe1U8Wfs4osIH5AWWjWcPB7weI
	Q5STp673fwZVAlxJoX2xTInHFYDhRZHZ/4+8X6m5+evvq/YKgt5MJXpyC2Irs1L8+8+H
	J6DAQwZ3j7dxKVfPWdjKAbWv959kQKWPowgzYKcRvs1fRWl2fVA70VEwm19sHypGrgtF
	4QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IVs1kJuN8vsCbZG4GYV01NBcUKM/qI2XRkDbg7qMljE=;
	b=uWek/9FuAYC1KQ46rQJ38gI8qWoBE5L0CFpzPWDHq4EDZk6TXuzy47iU5vNlYj/tCK
	vee0PrajcxCCfDbedA77TnyxHo7m5B9Z6eFJ5S5/qU00EuRUxlKetE3WtG8bTXp8PTE4
	gywptrSv/w+BKjxm+ZQT7TO40R4+AfX6xq1PAJK2TUrCDGJtZLmwd1B5emx4Ha/tFRAk
	RRkHXLaZVJl0qqYKgWJP+n8olm0ncpZMmp+Gy/SGWoUF9WJG1QmtLKoFJ4WPWHsDQR7g
	IpdULhe1k86U+6heP5t+7C3t0poJv1uzCTY283ssggro+Stuvt3yUqYHJpGv0ihw1i2F
	n+yg==
X-Gm-Message-State: AIVw111IjK4lww1bApZ0RT/ODdNfPo8wz927h3e+Xf4h3+yWwY+AzlMk
	q97kirMyEtb4Ov6LqTz6YJ7SXFPsXzkQ
X-Received: by 10.107.171.69 with SMTP id u66mr8161440ioe.231.1502311660284;
	Wed, 09 Aug 2017 13:47:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Wed, 9 Aug 2017 13:47:19 -0700 (PDT)
In-Reply-To: <ae1b815e43dd44f4d3ac4d1edd9e4dc50874d346.1501840728.git.dengke.du@windriver.com>
References: <cover.1501840728.git.dengke.du@windriver.com>
	<ae1b815e43dd44f4d3ac4d1edd9e4dc50874d346.1501840728.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Aug 2017 21:47:19 +0100
Message-ID: <CAJTo0LYXVUb66qtnS3=TsdRm1bhZd1_KskU8zr-UNFt0SHCwZg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
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
X-List-Received-Date: Wed, 09 Aug 2017 20:47:39 -0000
Content-Type: multipart/alternative; boundary="94eb2c05b4bada875d0556583041"

--94eb2c05b4bada875d0556583041
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Breaks with musl:

http://errors.yoctoproject.org/Errors/Details/150199/

Ross

On 4 August 2017 at 11:00, Dengke Du <dengke.du@windriver.com> wrote:

> drop 4 patches because the upstream already contains them:
>
>     0001-dirtyc0w-Include-stdint.h.patch
>     0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>     0037-faccessat-and-fchmodat-Fix-build-warnings.patch
>     0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
>
> drop the do_compile_prepend function, because the upstream already fix
> the parallel make race, we can check it here:
>
>     https://github.com/linux-test-project/ltp/commit/
> 3f385652efe811fe7491474f8513baf44cf0a12d
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  .../ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch   |  34 ------
>  ...TH_MAX-undeclared-when-building-with-musl.patch |  31 -----
>  ...faccessat-and-fchmodat-Fix-build-warnings.patch |  68 -----------
>  ...d_key02-update-to-test-fix-for-nonempty-N.patch | 136
> ---------------------
>  meta/recipes-extended/ltp/ltp_20170516.bb          |  14 +--
>  5 files changed, 1 insertion(+), 282 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0001-dirtyc0w-Include-stdint.h.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0037-faccessat-and-fchmodat-Fix-build-warnings.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02=
-
> update-to-test-fix-for-nonempty-N.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h=
.patch
> b/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
> deleted file mode 100644
> index 5c73be4..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 1b30d8dac1a37dc0abbb3b545db2824d6489e23f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 9 Jun 2017 09:32:13 -0700
> -Subject: [PATCH] dirtyc0w: Include stdint.h
> -
> -uintptr_t is defined in stdint.h
> -
> -Fixes
> -| dirtyc0w_child.c:76:15: error: 'uintptr_t' undeclared (first use in
> this function); did you mean 'intptr_t'?
> -|    lseek(mfd, (uintptr_t) map, SEEK_SET);
> -|                ^~~~~~~~~
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted
> -
> - testcases/kernel/security/dirtyc0w/dirtyc0w_child.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
> b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
> -index 5328a9bc4..49abdd6ba 100644
> ---- a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
> -+++ b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
> -@@ -23,6 +23,7 @@
> - #include <sys/stat.h>
> - #include <string.h>
> - #include <stdlib.h>
> -+#include <stdint.h>
> - #include <pwd.h>
> -
> - #include "tst_safe_pthread.h"
> ---
> -2.13.1
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-
> undeclared-when-building-with-musl.patch b/meta/recipes-extended/ltp/
> ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
> deleted file mode 100644
> index 020ddfe..0000000
> --- a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-
> undeclared-when-building-with-musl.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From b906ec2fe4711a727e198cd9259287c042eef8e2 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Thu, 9 Feb 2017 16:41:12 +0800
> -Subject: [PATCH] fix PATH_MAX undeclared when building with musl
> -
> -fix PATH_MAX undeclared when building with musl.
> -
> -Upstream-Status: Submitted [https://github.com/linux-
> test-project/ltp/pull/176]
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - include/tst_test.h | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/include/tst_test.h b/include/tst_test.h
> -index 335c82684..4dfa1511b 100644
> ---- a/include/tst_test.h
> -+++ b/include/tst_test.h
> -@@ -23,6 +23,9 @@
> - #endif /* __TEST_H__ */
> -
> - #include <unistd.h>
> -+#ifndef __GLIBC__
> -+#include <limits.h>
> -+#endif
> -
> - #include "tst_common.h"
> - #include "tst_res_flags.h"
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0037-faccessat-and-
> fchmodat-Fix-build-warnings.patch b/meta/recipes-extended/ltp/
> ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
> deleted file mode 100644
> index 99497d6..0000000
> --- a/meta/recipes-extended/ltp/ltp/0037-faccessat-and-
> fchmodat-Fix-build-warnings.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647 Mon Sep 17 00:00:00 2001
> -From: Naresh Kamboju <naresh.kamboju@linaro.org>
> -Date: Mon, 19 Jun 2017 19:01:21 +0530
> -Subject: [PATCH 1/7] faccessat and fchmodat: Fix build warnings
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Fixing below build warnings.
> -
> -ltp-full-20170516/testcases/kernel/syscalls/faccessat$ make
> -In file included from ../../../../include/old/test.h:51:0,
> -                 from faccessat01.c:44:
> -faccessat01.c: In function =E2=80=98setup=E2=80=99:
> -../../../../include/old/old_safe_file_ops.h:55:27:
> -warning: format not a string literal and no format arguments
> [-Wformat-security]
> -                   (path), (fmt), ## __VA_ARGS__)
> -                           ^
> -faccessat01.c:132:2: note: in expansion of macro =E2=80=98SAFE_FILE_PRIN=
TF=E2=80=99
> -  SAFE_FILE_PRINTF(cleanup, testfile, testfile);
> -  ^
> -../../../../include/old/old_safe_file_ops.h:55:27:
> -warning: format not a string literal and no format arguments
> [-Wformat-security]
> -                   (path), (fmt), ## __VA_ARGS__)
> -                           ^
> -faccessat01.c:133:2: note: in expansion of macro =E2=80=98SAFE_FILE_PRIN=
TF=E2=80=99
> -  SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
> -
> -Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> -Upstream-Status: Accepted [https://github.com/linux-
> test-project/ltp/commit/4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647]
> ----
> - testcases/kernel/syscalls/faccessat/faccessat01.c | 4 ++--
> - testcases/kernel/syscalls/fchmodat/fchmodat01.c   | 4 ++--
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/testcases/kernel/syscalls/faccessat/faccessat01.c
> b/testcases/kernel/syscalls/faccessat/faccessat01.c
> -index 622dfd3b0..def7fa755 100644
> ---- a/testcases/kernel/syscalls/faccessat/faccessat01.c
> -+++ b/testcases/kernel/syscalls/faccessat/faccessat01.c
> -@@ -129,8 +129,8 @@ void setup(void)
> -       fds[0] =3D SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
> -       fds[1] =3D fds[4] =3D fds[0];
> -
> --      SAFE_FILE_PRINTF(cleanup, testfile, testfile);
> --      SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
> -+      SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);
> -+      SAFE_FILE_PRINTF(cleanup, testfile2, "%s", testfile2);
> -
> -       fds[2] =3D SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
> -
> -diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
> b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
> -index 6bf66d8b8..7856ed3fa 100644
> ---- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
> -+++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
> -@@ -127,8 +127,8 @@ void setup(void)
> -       fds[0] =3D SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
> -       fds[1] =3D fds[4] =3D fds[0];
> -
> --      SAFE_FILE_PRINTF(cleanup, testfile, testfile);
> --      SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
> -+      SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);
> -+      SAFE_FILE_PRINTF(cleanup, testfile2, "%s", testfile2);
> -
> -       fds[2] =3D SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
> -       fds[3] =3D 100;
> ---
> -2.13.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-
> update-to-test-fix-for-nonempty-N.patch b/meta/recipes-extended/ltp/
> ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
> deleted file mode 100644
> index 3759e1f..0000000
> --- a/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-
> update-to-test-fix-for-nonempty-N.patch
> +++ /dev/null
> @@ -1,136 +0,0 @@
> -From 25045624e941ee76a13febd36187e23c6c435507 Mon Sep 17 00:00:00 2001
> -From: Eric Biggers <ebiggers@google.com>
> -Date: Mon, 12 Jun 2017 11:55:21 -0700
> -Subject: [PATCH 01/39] syscalls/add_key02: update to test fix for nonemp=
ty
> - NULL payload
> -
> -add_key02 was supposed to be a "Basic test for the add_key() syscall",
> -but it actually happened to test the obscure case of passing a NULL
> -payload with nonzero length.  This case was mishandled by the kernel,
> -which either returned EINVAL or crashed with a NULL pointer dereference,
> -depending on the key type.  (The former applied to the test, as it used
> -the "user" key type.)  The expected behavior in this case is that the
> -syscall fail with EFAULT.
> -
> -Update the test to expect the fixed behavior from v4.12-rc5, and make
> -the test more thorough by testing additional key types, including ones
> -that caused a NULL pointer dereference in unfixed kernels.
> -
> -Signed-off-by: Eric Biggers <ebiggers@google.com>
> -Upstream-Status: Accepted [https://github.com/linux-
> test-project/ltp/commit/25045624e941ee76a13febd36187e23c6c435507]
> ----
> - testcases/kernel/syscalls/add_key/add_key02.c | 69
> ++++++++++++++++++++-------
> - 1 file changed, 51 insertions(+), 18 deletions(-)
> -
> -diff --git a/testcases/kernel/syscalls/add_key/add_key02.c
> b/testcases/kernel/syscalls/add_key/add_key02.c
> -index 866800d6f..2e3308dcd 100644
> ---- a/testcases/kernel/syscalls/add_key/add_key02.c
> -+++ b/testcases/kernel/syscalls/add_key/add_key02.c
> -@@ -1,5 +1,6 @@
> - /***********************************************************
> *******************
> -  * Copyright (c) Crackerjack Project., 2007
>    *
> -+ * Copyright (c) 2017 Google, Inc.
>       *
> -  *
>     *
> -  * This program is free software;  you can redistribute it and/or
> modify      *
> -  * it under the terms of the GNU General Public License as published by
>      *
> -@@ -18,10 +19,17 @@
> -  ************************************************************
> ******************/
> -
> - /*
> -- * Basic test for the add_key() syscall.
> -+ * Test that the add_key() syscall correctly handles a NULL payload wit=
h
> nonzero
> -+ * length.  Specifically, it should fail with EFAULT rather than oopsin=
g
> the
> -+ * kernel with a NULL pointer dereference or failing with EINVAL, as it
> did
> -+ * before (depending on the key type).  This is a regression test for
> commit
> -+ * 5649645d725c ("KEYS: fix dereferencing NULL payload with nonzero
> length").
> -  *
> -- * History:   Porting from Crackerjack to LTP is done by
> -- *          Manas Kumar Nayak maknayak@in.ibm.com>
> -+ * Note that none of the key types that exhibited the NULL pointer
> dereference
> -+ * are guaranteed to be built into the kernel, so we just test as many
> as we
> -+ * can, in the hope of catching one.  We also test with the "user" key
> type for
> -+ * good measure, although it was one of the types that failed with
> EINVAL rather
> -+ * than dereferencing NULL.
> -  */
> -
> - #include "config.h"
> -@@ -33,36 +41,61 @@
> -
> - #ifdef HAVE_LINUX_KEYCTL_H
> - struct tcase {
> --      char *type;
> --      char *desc;
> --      void *payload;
> --      int plen;
> --      int exp_errno;
> -+      const char *type;
> -+      size_t plen;
> - } tcases[] =3D {
> --      {"user", "firstkey", NULL, 1, EINVAL}
> -+      /*
> -+       * The payload length we test for each key type needs to pass
> initial
> -+       * validation but is otherwise arbitrary.  Note: the "rxrpc_s" ke=
y
> type
> -+       * requires a payload of exactly 8 bytes.
> -+       */
> -+      { "asymmetric",         64 },
> -+      { "cifs.idmap",         64 },
> -+      { "cifs.spnego",        64 },
> -+      { "pkcs7_test",         64 },
> -+      { "rxrpc",              64 },
> -+      { "rxrpc_s",             8 },
> -+      { "user",               64 },
> - };
> - #endif /* HAVE_LINUX_KEYCTL_H */
> -
> - static void verify_add_key(unsigned int i)
> - {
> - #ifdef HAVE_LINUX_KEYCTL_H
> --      TEST(tst_syscall(__NR_add_key, tcases[i].type, tcases[i].desc,
> --                       tcases[i].payload, tcases[i].plen,
> --                       KEY_SPEC_USER_KEYRING));
> -+      TEST(tst_syscall(__NR_add_key, tcases[i].type, "abc:def",
> -+                       NULL, tcases[i].plen, KEY_SPEC_PROCESS_KEYRING))=
;
> -
> -       if (TEST_RETURN !=3D -1) {
> --              tst_res(TFAIL, "add_key() passed unexpectedly");
> -+              tst_res(TFAIL,
> -+                      "add_key() with key type '%s' unexpectedly
> succeeded",
> -+                      tcases[i].type);
> -               return;
> -       }
> -
> --      if (TEST_ERRNO =3D=3D tcases[i].exp_errno) {
> --              tst_res(TPASS | TTERRNO, "add_key() failed expectedly");
> -+      if (TEST_ERRNO =3D=3D EFAULT) {
> -+              tst_res(TPASS, "received expected EFAULT with key type
> '%s'",
> -+                      tcases[i].type);
> -               return;
> -       }
> -
> --      tst_res(TFAIL | TTERRNO,
> --              "add_key() failed unexpectedly, expected %s",
> --              tst_strerrno(tcases[i].exp_errno));
> -+      if (TEST_ERRNO =3D=3D ENODEV) {
> -+              tst_res(TCONF, "kernel doesn't support key type '%s'",
> -+                      tcases[i].type);
> -+              return;
> -+      }
> -+
> -+      /*
> -+       * It's possible for the "asymmetric" key type to be supported,
> but with
> -+       * no asymmetric key parsers registered.  In that case, attemptin=
g
> to
> -+       * add a key of type asymmetric will fail with EBADMSG.
> -+       */
> -+      if (TEST_ERRNO =3D=3D EBADMSG && !strcmp(tcases[i].type,
> "asymmetric")) {
> -+              tst_res(TCONF, "no asymmetric key parsers are registered"=
);
> -+              return;
> -+      }
> -+
> -+      tst_res(TFAIL | TTERRNO, "unexpected error with key type '%s'",
> -+              tcases[i].type);
> - #else
> -       tst_brk(TCONF, "linux/keyctl.h was missing upon compilation.");
> - #endif /* HAVE_LINUX_KEYCTL_H */
> ---
> -2.13.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb
> b/meta/recipes-extended/ltp/ltp_20170516.bb
> index 86b8012..46c9741 100644
> --- a/meta/recipes-extended/ltp/ltp_20170516.bb
> +++ b/meta/recipes-extended/ltp/ltp_20170516.bb
> @@ -21,7 +21,7 @@ DEPENDS_append_libc-musl =3D " fts "
>  EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
>  CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
> -SRCREV =3D "6c6c6ca40afb3611e52486f670085762ff451e91"
> +SRCREV =3D "18916a2e6d8c997b7b29dcfa9550d5a15b22ed22"
>
>  SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
>             file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
> @@ -29,7 +29,6 @@ SRC_URI =3D "git://github.com/linux-test-project/ltp.gi=
t \
>             file://0003-Add-knob-to-control-tirpc-support.patch \
>             file://0004-build-Add-option-to-select-libc-implementation.pa=
tch
> \
>             file://0005-kernel-controllers-Link-with-libfts-explicitly-on=
-mu.patch
> \
> -           file://0006-fix-PATH_MAX-undeclared-when-building-with-musl.p=
atch
> \
>             file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl=
.patch
> \
>             file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-i=
t.patch
> \
>             file://0009-fix-redefinition-of-struct-msgbuf-error-building-=
wit.patch
> \
> @@ -49,9 +48,6 @@ SRC_URI =3D "git://github.com/linux-test-project/ltp.gi=
t \
>             file://0034-periodic_output.patch \
>             file://0035-fix-test_proc_kill-hang.patch \
>             file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-o=
n-s.patch
> \
> -           file://0001-dirtyc0w-Include-stdint.h.patch \
> -           file://0037-faccessat-and-fchmodat-Fix-build-warnings.patch \
> -           file://0038-syscalls-add_key02-update-to-test-fix-for-nonempt=
y-N.patch
> \
>             "
>
>  S =3D "${WORKDIR}/git"
> @@ -69,14 +65,6 @@ EXTRA_OECONF =3D " --with-power-management-testsuite
> --with-realtime-testsuite "
>  # ltp network/rpc test cases ftbfs when libtirpc is found
>  EXTRA_OECONF +=3D " --without-tirpc "
>
> -# The makefiles make excessive use of make -C and several include
> testcases.mk
> -# which triggers a build of the syscall header. To reproduce, build ltp,
> -# then delete the header, then "make -j XX" and watch regen.sh run
> multiple
> -# times. Its easier to generate this once here instead.
> -do_compile_prepend () {
> -       ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
> -}
> -
>  do_install(){
>      install -d ${D}/opt/ltp/
>      oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05b4bada875d0556583041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Breaks with musl:<div><br></div><div><a href=3D"http://err=
ors.yoctoproject.org/Errors/Details/150199/">http://errors.yoctoproject.org=
/Errors/Details/150199/</a><br></div><div><br></div><div>Ross</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 4 August 2017 at=
 11:00, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto:dengke.du@windriv=
er.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">drop 4 patches because the upstream already =
contains them:<br>
<br>
=C2=A0 =C2=A0 0001-dirtyc0w-Include-stdint.<wbr>h.patch<br>
=C2=A0 =C2=A0 0006-fix-PATH_MAX-undeclared-<wbr>when-building-with-musl.pat=
ch<br>
=C2=A0 =C2=A0 0037-faccessat-and-fchmodat-<wbr>Fix-build-warnings.patch<br>
=C2=A0 =C2=A0 0038-syscalls-add_key02-<wbr>update-to-test-fix-for-<wbr>none=
mpty-N.patch<br>
<br>
drop the do_compile_prepend function, because the upstream already fix<br>
the parallel make race, we can check it here:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/linux-test-project/ltp/commit/3=
f385652efe811fe7491474f8513baf44cf0a12d" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/linux-test-<wbr>project/ltp/commit/<wbr>3f385652efe81=
1fe7491474f8513ba<wbr>f44cf0a12d</a><br>
<br>
Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">den=
gke.du@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../ltp/ltp/0001-dirtyc0w-<wbr>Include-stdint.h.patch=C2=A0 =C2=A0|=
=C2=A0 34 ------<br>
=C2=A0...TH_MAX-undeclared-when-<wbr>building-with-musl.patch |=C2=A0 31 --=
---<br>
=C2=A0...faccessat-and-fchmodat-Fix-<wbr>build-warnings.patch |=C2=A0 68 --=
---------<br>
=C2=A0...d_key02-update-to-test-fix-<wbr>for-nonempty-N.patch | 136 -------=
--------------<br>
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20170516.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_<wbr>20170516.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 +--<br>
=C2=A05 files changed, 1 insertion(+), 282 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0001-dirtyc0w-I=
nclude-stdint.<wbr>h.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0006-fix-PATH_M=
AX-undeclared-<wbr>when-building-with-musl.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0037-faccessat-=
and-fchmodat-<wbr>Fix-build-warnings.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0038-syscalls-a=
dd_key02-<wbr>update-to-test-fix-for-<wbr>nonempty-N.patch<br>
<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0001-dirtyc0w-Include-<wbr>=
stdint.h.patch b/meta/recipes-extended/ltp/<wbr>ltp/0001-dirtyc0w-Include-<=
wbr>stdint.h.patch<br>
deleted file mode 100644<br>
index 5c73be4..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0001-dirtyc0w-Include-<wbr>stdint.=
h.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From 1b30d8dac1a37dc0abbb3b545db282<wbr>4d6489e23f Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Fri, 9 Jun 2017 09:32:13 -0700<br>
-Subject: [PATCH] dirtyc0w: Include stdint.h<br>
-<br>
-uintptr_t is defined in stdint.h<br>
-<br>
-Fixes<br>
-| dirtyc0w_child.c:76:15: error: &#39;uintptr_t&#39; undeclared (first use=
 in this function); did you mean &#39;intptr_t&#39;?<br>
-|=C2=A0 =C2=A0 lseek(mfd, (uintptr_t) map, SEEK_SET);<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Submitted<br>
-<br>
- testcases/kernel/security/<wbr>dirtyc0w/dirtyc0w_child.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/testcases/kernel/security/<wbr>dirtyc0w/dirtyc0w_child.c b/te=
stcases/kernel/security/<wbr>dirtyc0w/dirtyc0w_child.c<br>
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
- #include &quot;tst_safe_pthread.h&quot;<br>
---<br>
-2.13.1<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0006-fix-PATH_MAX-<wbr>unde=
clared-when-building-with-<wbr>musl.patch b/meta/recipes-extended/ltp/<wbr>=
ltp/0006-fix-PATH_MAX-<wbr>undeclared-when-building-with-<wbr>musl.patch<br=
>
deleted file mode 100644<br>
index 020ddfe..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0006-fix-PATH_MAX-<wbr>undeclared-=
when-building-with-<wbr>musl.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From b906ec2fe4711a727e198cd9259287<wbr>c042eef8e2 Mon Sep 17 00:00:00 200=
1<br>
-From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
-Date: Thu, 9 Feb 2017 16:41:12 +0800<br>
-Subject: [PATCH] fix PATH_MAX undeclared when building with musl<br>
-<br>
-fix PATH_MAX undeclared when building with musl.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/linux-test-proje=
ct/ltp/pull/176" rel=3D"noreferrer" target=3D"_blank">https://github.com/li=
nux-<wbr>test-project/ltp/pull/176</a>]<br>
-<br>
-Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
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
- #include &quot;tst_common.h&quot;<br>
- #include &quot;tst_res_flags.h&quot;<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0037-faccessat-and-<wbr>fch=
modat-Fix-build-warnings.<wbr>patch b/meta/recipes-extended/ltp/<wbr>ltp/00=
37-faccessat-and-<wbr>fchmodat-Fix-build-warnings.<wbr>patch<br>
deleted file mode 100644<br>
index 99497d6..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0037-faccessat-and-<wbr>fchmodat-F=
ix-build-warnings.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-From 4141bdb441f7576a2e73abeb2a0fb1<wbr>c7b8bd8647 Mon Sep 17 00:00:00 200=
1<br>
-From: Naresh Kamboju &lt;<a href=3D"mailto:naresh.kamboju@linaro.org">nare=
sh.kamboju@linaro.org</a>&gt;<br>
-Date: Mon, 19 Jun 2017 19:01:21 +0530<br>
-Subject: [PATCH 1/7] faccessat and fchmodat: Fix build warnings<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Fixing below build warnings.<br>
-<br>
-ltp-full-20170516/testcases/<wbr>kernel/syscalls/faccessat$ make<br>
-In file included from ../../../../include/old/test.<wbr>h:51:0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from faccess=
at01.c:44:<br>
-faccessat01.c: In function =E2=80=98setup=E2=80=99:<br>
-../../../../include/old/old_<wbr>safe_file_ops.h:55:27:<br>
-warning: format not a string literal and no format arguments [-Wformat-sec=
urity]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(path=
), (fmt), ## __VA_ARGS__)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^<br>
-faccessat01.c:132:2: note: in expansion of macro =E2=80=98SAFE_FILE_PRINTF=
=E2=80=99<br>
-=C2=A0 SAFE_FILE_PRINTF(cleanup, testfile, testfile);<br>
-=C2=A0 ^<br>
-../../../../include/old/old_<wbr>safe_file_ops.h:55:27:<br>
-warning: format not a string literal and no format arguments [-Wformat-sec=
urity]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(path=
), (fmt), ## __VA_ARGS__)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^<br>
-faccessat01.c:133:2: note: in expansion of macro =E2=80=98SAFE_FILE_PRINTF=
=E2=80=99<br>
-=C2=A0 SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);<br>
-<br>
-Signed-off-by: Naresh Kamboju &lt;<a href=3D"mailto:naresh.kamboju@linaro.=
org">naresh.kamboju@linaro.org</a>&gt;<br>
-Upstream-Status: Accepted [<a href=3D"https://github.com/linux-test-projec=
t/ltp/commit/4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/linux-<wbr>test-project/ltp/commit/<wbr=
>4141bdb441f7576a2e73abeb2a0fb1<wbr>c7b8bd8647</a>]<br>
----<br>
- testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c | 4 ++--<br>
- testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c=C2=A0 =C2=A0| 4 ++--=
<br>
- 2 files changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c b/test=
cases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
-index 622dfd3b0..def7fa755 100644<br>
---- a/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
-@@ -129,8 +129,8 @@ void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fds[0] =3D SAFE_OPEN(cleanup, pathname, O_DIREC=
TORY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fds[1] =3D fds[4] =3D fds[0];<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile, testfile);<br>
--=C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);<br>
-+=C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile, &quot;%s&quot;, =
testfile);<br>
-+=C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile2, &quot;%s&quot;,=
 testfile2);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fds[2] =3D SAFE_OPEN(cleanup, testfile3, O_CREA=
T | O_RDWR, 0600);<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c b/testca=
ses/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
-index 6bf66d8b8..7856ed3fa 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
-@@ -127,8 +127,8 @@ void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fds[0] =3D SAFE_OPEN(cleanup, pathname, O_DIREC=
TORY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fds[1] =3D fds[4] =3D fds[0];<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile, testfile);<br>
--=C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);<br>
-+=C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile, &quot;%s&quot;, =
testfile);<br>
-+=C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile2, &quot;%s&quot;,=
 testfile2);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fds[2] =3D SAFE_OPEN(cleanup, testfile3, O_CREA=
T | O_RDWR, 0600);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fds[3] =3D 100;<br>
---<br>
-2.13.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0038-syscalls-add_key02-<wb=
r>update-to-test-fix-for-<wbr>nonempty-N.patch b/meta/recipes-extended/ltp/=
<wbr>ltp/0038-syscalls-add_key02-<wbr>update-to-test-fix-for-<wbr>nonempty-=
N.patch<br>
deleted file mode 100644<br>
index 3759e1f..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0038-syscalls-add_key02-<wbr>updat=
e-to-test-fix-for-<wbr>nonempty-N.patch<br>
+++ /dev/null<br>
@@ -1,136 +0,0 @@<br>
-From 25045624e941ee76a13febd36187e2<wbr>3c6c435507 Mon Sep 17 00:00:00 200=
1<br>
-From: Eric Biggers &lt;<a href=3D"mailto:ebiggers@google.com">ebiggers@goo=
gle.com</a>&gt;<br>
-Date: Mon, 12 Jun 2017 11:55:21 -0700<br>
-Subject: [PATCH 01/39] syscalls/add_key02: update to test fix for nonempty=
<br>
- NULL payload<br>
-<br>
-add_key02 was supposed to be a &quot;Basic test for the add_key() syscall&=
quot;,<br>
-but it actually happened to test the obscure case of passing a NULL<br>
-payload with nonzero length.=C2=A0 This case was mishandled by the kernel,=
<br>
-which either returned EINVAL or crashed with a NULL pointer dereference,<b=
r>
-depending on the key type.=C2=A0 (The former applied to the test, as it us=
ed<br>
-the &quot;user&quot; key type.)=C2=A0 The expected behavior in this case i=
s that the<br>
-syscall fail with EFAULT.<br>
-<br>
-Update the test to expect the fixed behavior from v4.12-rc5, and make<br>
-the test more thorough by testing additional key types, including ones<br>
-that caused a NULL pointer dereference in unfixed kernels.<br>
-<br>
-Signed-off-by: Eric Biggers &lt;<a href=3D"mailto:ebiggers@google.com">ebi=
ggers@google.com</a>&gt;<br>
-Upstream-Status: Accepted [<a href=3D"https://github.com/linux-test-projec=
t/ltp/commit/25045624e941ee76a13febd36187e23c6c435507" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/linux-<wbr>test-project/ltp/commit/<wbr=
>25045624e941ee76a13febd36187e2<wbr>3c6c435507</a>]<br>
----<br>
- testcases/kernel/syscalls/add_<wbr>key/add_key02.c | 69 +++++++++++++++++=
+++-------<br>
- 1 file changed, 51 insertions(+), 18 deletions(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>add_key/add_key02.c b/testcase=
s/kernel/syscalls/<wbr>add_key/add_key02.c<br>
-index 866800d6f..2e3308dcd 100644<br>
---- a/testcases/kernel/syscalls/<wbr>add_key/add_key02.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>add_key/add_key02.c<br>
-@@ -1,5 +1,6 @@<br>
- /*****************************<wbr>******************************<wbr>***=
****************<br>
-=C2=A0 * Copyright (c) Crackerjack Project., 2007=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0*<br>
-+ * Copyright (c) 2017 Google, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 * This program is free software;=C2=A0 you can redistribute it and/=
or modify=C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 * it under the terms of the GNU General Public License as published=
 by=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
-@@ -18,10 +19,17 @@<br>
-=C2=A0 ******************************<wbr>******************************<w=
br>******************/<br>
-<br>
- /*<br>
-- * Basic test for the add_key() syscall.<br>
-+ * Test that the add_key() syscall correctly handles a NULL payload with =
nonzero<br>
-+ * length.=C2=A0 Specifically, it should fail with EFAULT rather than oop=
sing the<br>
-+ * kernel with a NULL pointer dereference or failing with EINVAL, as it d=
id<br>
-+ * before (depending on the key type).=C2=A0 This is a regression test fo=
r commit<br>
-+ * 5649645d725c (&quot;KEYS: fix dereferencing NULL payload with nonzero =
length&quot;).<br>
-=C2=A0 *<br>
-- * History:=C2=A0 =C2=A0Porting from Crackerjack to LTP is done by<br>
-- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Manas Kumar Nayak <a href=3D"mailto:=
maknayak@in.ibm.com">maknayak@in.ibm.com</a>&gt;<br>
-+ * Note that none of the key types that exhibited the NULL pointer derefe=
rence<br>
-+ * are guaranteed to be built into the kernel, so we just test as many as=
 we<br>
-+ * can, in the hope of catching one.=C2=A0 We also test with the &quot;us=
er&quot; key type for<br>
-+ * good measure, although it was one of the types that failed with EINVAL=
 rather<br>
-+ * than dereferencing NULL.<br>
-=C2=A0 */<br>
-<br>
- #include &quot;config.h&quot;<br>
-@@ -33,36 +41,61 @@<br>
-<br>
- #ifdef HAVE_LINUX_KEYCTL_H<br>
- struct tcase {<br>
--=C2=A0 =C2=A0 =C2=A0 char *type;<br>
--=C2=A0 =C2=A0 =C2=A0 char *desc;<br>
--=C2=A0 =C2=A0 =C2=A0 void *payload;<br>
--=C2=A0 =C2=A0 =C2=A0 int plen;<br>
--=C2=A0 =C2=A0 =C2=A0 int exp_errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 const char *type;<br>
-+=C2=A0 =C2=A0 =C2=A0 size_t plen;<br>
- } tcases[] =3D {<br>
--=C2=A0 =C2=A0 =C2=A0 {&quot;user&quot;, &quot;firstkey&quot;, NULL, 1, EI=
NVAL}<br>
-+=C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* The payload length we test for each key type=
 needs to pass initial<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* validation but is otherwise arbitrary.=C2=A0=
 Note: the &quot;rxrpc_s&quot; key type<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* requires a payload of exactly 8 bytes.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 { &quot;asymmetric&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A064 },<br>
-+=C2=A0 =C2=A0 =C2=A0 { &quot;cifs.idmap&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A064 },<br>
-+=C2=A0 =C2=A0 =C2=A0 { &quot;cifs.spnego&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 64 },<br>
-+=C2=A0 =C2=A0 =C2=A0 { &quot;pkcs7_test&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A064 },<br>
-+=C2=A0 =C2=A0 =C2=A0 { &quot;rxrpc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 64 },<br>
-+=C2=A0 =C2=A0 =C2=A0 { &quot;rxrpc_s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A08 },<br>
-+=C2=A0 =C2=A0 =C2=A0 { &quot;user&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A064 },<br>
- };<br>
- #endif /* HAVE_LINUX_KEYCTL_H */<br>
-<br>
- static void verify_add_key(unsigned int i)<br>
- {<br>
- #ifdef HAVE_LINUX_KEYCTL_H<br>
--=C2=A0 =C2=A0 =C2=A0 TEST(tst_syscall(__NR_add_key, tcases[i].type, tcase=
s[i].desc,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tcases[i].payload, tcases[i].plen,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0KEY_SPEC_USER_KEYRING));<br>
-+=C2=A0 =C2=A0 =C2=A0 TEST(tst_syscall(__NR_add_key, tcases[i].type, &quot=
;abc:def&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NULL, tcases[i].plen, KEY_SPEC_PROCESS_KEYRING));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TEST_RETURN !=3D -1) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quot;add=
_key() passed unexpectedly&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;add_key() with key type &#39;%s&#39; unexpectedly succeeded&quot;=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tcases[i].type);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if (TEST_ERRNO =3D=3D tcases[i].exp_errno) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS | TTERRNO,=
 &quot;add_key() failed expectedly&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (TEST_ERRNO =3D=3D EFAULT) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;rec=
eived expected EFAULT with key type &#39;%s&#39;&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tcases[i].type);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTERRNO,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;add_key() failed u=
nexpectedly, expected %s&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_strerrno(tcases[i].e=
xp_<wbr>errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 if (TEST_ERRNO =3D=3D ENODEV) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF, &quot;ker=
nel doesn&#39;t support key type &#39;%s&#39;&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tcases[i].type);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* It&#39;s possible for the &quot;asymmetric&q=
uot; key type to be supported, but with<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* no asymmetric key parsers registered.=C2=A0 =
In that case, attempting to<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* add a key of type asymmetric will fail with =
EBADMSG.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 if (TEST_ERRNO =3D=3D EBADMSG &amp;&amp; !strcmp(tca=
ses[i].type, &quot;asymmetric&quot;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF, &quot;no =
asymmetric key parsers are registered&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTERRNO, &quot;unexpected error with=
 key type &#39;%s&#39;&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcases[i].type);<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;linux/keyctl.h was missing=
 upon compilation.&quot;);<br>
- #endif /* HAVE_LINUX_KEYCTL_H */<br>
---<br>
-2.13.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170516.bb" r=
el=3D"noreferrer" target=3D"_blank">lt<wbr>p_20170516.bb</a> b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20170516.bb" rel=3D"noreferrer" target=
=3D"_blank">lt<wbr>p_20170516.bb</a><br>
index 86b8012..46c9741 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170516.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20170516.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170516.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20170516.bb</a><br>
@@ -21,7 +21,7 @@ DEPENDS_append_libc-musl =3D &quot; fts &quot;<br>
=C2=A0EXTRA_OEMAKE_append_libc-musl =3D &quot; LIBC=3Dmusl &quot;<br>
=C2=A0CFLAGS_append_powerpc64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;<b=
r>
=C2=A0CFLAGS_append_mipsarchn64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;=
<br>
-SRCREV =3D &quot;<wbr>6c6c6ca40afb3611e52486f6700857<wbr>62ff451e91&quot;<=
br>
+SRCREV =3D &quot;<wbr>18916a2e6d8c997b7b29dcfa9550d5<wbr>a15b22ed22&quot;<=
br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-test-proje=
ct/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/linux-test-<wbr=
>project/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-add-_GNU_SOURCE-<wbr>=
to-pec_listener.c.patch \<br>
@@ -29,7 +29,6 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/linu=
x-test-project/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/lin=
ux-test-<wbr>project/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Add-knob-to-<wbr>cont=
rol-tirpc-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-build-Add-option-<wbr=
>to-select-libc-implementation.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-kernel-<wbr>controlle=
rs-Link-with-libfts-<wbr>explicitly-on-mu.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-fix-PATH_MAX-<wbr>und=
eclared-when-building-with-<wbr>musl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-fix-__WORDSIZE-<wbr>u=
ndeclared-when-building-with-<wbr>musl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-Check-if-__GLIBC_<wbr=
>PREREQ-is-defined-before-<wbr>using-it.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0009-fix-redefinition-<wbr=
>of-struct-msgbuf-error-<wbr>building-wit.patch \<br>
@@ -49,9 +48,6 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/linu=
x-test-project/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/lin=
ux-test-<wbr>project/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0034-periodic_output.<wbr>=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0035-fix-test_proc_<wbr>ki=
ll-hang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0036-testcases-network-<wb=
r>nfsv4-acl-acl1.c-Security-fix-<wbr>on-s.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dirtyc0w-Include-<wbr=
>stdint.h.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0037-faccessat-and-<wbr>fc=
hmodat-Fix-build-warnings.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0038-syscalls-add_<wbr>key=
02-update-to-test-fix-for-<wbr>nonempty-N.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -69,14 +65,6 @@ EXTRA_OECONF =3D &quot; --with-power-management-<wbr>tes=
tsuite --with-realtime-testsuite &quot;<br>
=C2=A0# ltp network/rpc test cases ftbfs when libtirpc is found<br>
=C2=A0EXTRA_OECONF +=3D &quot; --without-tirpc &quot;<br>
<br>
-# The makefiles make excessive use of make -C and several include <a href=
=3D"http://testcases.mk" rel=3D"noreferrer" target=3D"_blank">testcases.mk<=
/a><br>
-# which triggers a build of the syscall header. To reproduce, build ltp,<b=
r>
-# then delete the header, then &quot;make -j XX&quot; and watch regen.sh r=
un multiple<br>
-# times. Its easier to generate this once here instead.<br>
-do_compile_prepend () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0( make -C ${B}/testcases/kernel include/linux_s=
yscall_numbers.<wbr>h )<br>
-}<br>
-<br>
=C2=A0do_install(){<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}/opt/ltp/<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c05b4bada875d0556583041--
