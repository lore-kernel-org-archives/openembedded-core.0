Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C11C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 07:29:39 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web09.28969.1635146978028258375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 00:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dsD4hhkz;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id s201so2536575vke.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w0YbTdTW1K7jgwKCkHTBsNIDel/QEa9/o4cGXwGrGLM=;
        b=dsD4hhkzjv3UXWwKHn9U3cRJ7/hz0ZVcoCuN/dHMF6ptRLndZCO3ewJoNwQwc6jGP1
         XPN8b93ymO725uEdckpDLQYVCq/tXmR9UTGEGXwOwVbVcfoZ1wnS+1rD272HXpPCxa0k
         QSYMJor/fuAMDhWO98uhV5IW56VLLPypfYvBgvi/M2URSFwPT2AjmqhNYtCw2UrY3y3y
         rxvniPG89O+N9ICTVLRL2B0Gn/8BQA9JJ+uTpHbaOx9K/jRGjskBNgBlu4xbcCHKOB52
         03oYRrqnFKV49uncn/am02GYxkJM9au5/nEQEPFfwJcruDR2ltp3oHEIfvVJezAaVDcS
         Pw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w0YbTdTW1K7jgwKCkHTBsNIDel/QEa9/o4cGXwGrGLM=;
        b=fMtOFa1XycSshd1r6gzGT6D5MAt+CHWj2xhd6r9TfWXZKqrAyWsamVL5cG5DLk0yZW
         SlmVCcpyVcl1xuZ9LCdEC19FbXVWnwzbAXmzGFAEgeJRcBmVQiKD+nYQTYhV8qx62cyG
         BwK4qAzEgTJEJ2HVLxhPJ4EADdO3iWo64w5VRC8aF77TE6pUmdL23vDBcyucfOis6NJw
         T/FDdD0DgJwwjXigk5LFltHjeU6RturrWOecSk79YJsAK3gNEumFF3CajLPpps/sfItr
         bhrGoji6gvaE4bfA+4HXZiQlqxffpc+fOB2tcf/mB141CnLcwDpCc1epRLY5zt1LunrA
         wsKw==
X-Gm-Message-State: AOAM530/TlJ11rQ2Fbd4U7UPYm0wEgxsAoE3HoExZXcmC99wkNqGLhSp
	jDto0kHOAyIaM44KobR3Ed2IMNMX8tptZbQi/fcLR+4YfEw=
X-Google-Smtp-Source: 
 ABdhPJxAha90yyH+8ium3HrPH8EERbbdTehW9DZ9D7/PwdUNT6v+QQLYVUhKj3WcVhzF0l6CnxZQyQy44Pz6y7K8NSM=
X-Received: by 2002:a1f:784b:: with SMTP id t72mr11523459vkc.15.1635146976668;
 Mon, 25 Oct 2021 00:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211017025114.36578-1-pgowda.cve@gmail.com>
 <CAMKF1sq+QZvOjC5j=2VhbsPKssBsi2Nap-5ZJ8YtJ+N+NMOjBw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq+QZvOjC5j=2VhbsPKssBsi2Nap-5ZJ8YtJ+N+NMOjBw@mail.gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Mon, 25 Oct 2021 12:59:26 +0530
Message-ID: 
 <CALY4985PBJmQc0oJvAwGwVhb7z=TtfqKLAKpMPW-sboBvtHUNg@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest
 version
To: Khem Raj <raj.khem@gmail.com>
Cc: anuj.mittal@intel.com, openembedded-core@lists.openembedded.org,
	Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 07:29:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157333

Hi,

Thanks for the comments.

Gentle ping on this patch.

Thanks,
Pgowda

On Sun, Oct 17, 2021 at 10:35 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This looks good to me
>
> On Sat, Oct 16, 2021 at 7:51 PM Pgowda <pgowda.cve@gmail.com> wrote:
>>
>> glibc-2.33 release version of Feb 2021 is used in Hardknott branch.
>> There are many bug fixes in the latest glibc-2.33 version. The patch
>> takes the latest glibc-2.33 version commit.
>> Regression tested on X86-64 without any new issues.
>>
>> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
>> ---
>>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>>  .../glibc/glibc/0001-CVE-2021-38604.patch     |  40 ----
>>  ...-private-futex-optimization-BZ-27304.patch |  49 -----
>>  .../glibc/glibc/0002-CVE-2021-38604.patch     | 147 --------------
>>  ...-ISA-support-for-x86-64-level-marker.patch | 116 -----------
>>  ...ork-around-GCC-PR-98512-in-rawmemchr.patch |  58 ------
>>  ...-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch | 185 ------------------
>>  .../glibc/glibc/CVE-2021-27318-revert.patch   | 174 ++++++++++++++++
>>  .../glibc/glibc/CVE-2021-27645.patch          |  51 -----
>>  .../glibc/glibc/CVE-2021-33574_1.patch        |  76 -------
>>  .../glibc/glibc/CVE-2021-33574_2.patch        |  61 ------
>>  .../glibc/glibc/CVE-2021-35942.patch          |  44 -----
>>  meta/recipes-core/glibc/glibc_2.33.bb         |  10 -
>>  13 files changed, 175 insertions(+), 838 deletions(-)
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
>>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-27318-revert.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
>> index 3a95173175..4d69187961 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,6 +1,6 @@
>>  SRCBRANCH ?= "release/2.33/master"
>>  PV = "2.33"
>> -SRCREV_glibc ?= "9826b03b747b841f5fc6de2054bf1ef3f5c4bdf3"
>> +SRCREV_glibc ?= "6090cf1330faf2deb17285758f327cb23b89ebf1"
>>  SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
>>
>>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>> diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
>> deleted file mode 100644
>> index 8a52ac957c..0000000000
>> --- a/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
>> +++ /dev/null
>> @@ -1,40 +0,0 @@
>> -From b805aebd42364fe696e417808a700fdb9800c9e8 Mon Sep 17 00:00:00 2001
>> -From: Nikita Popov <npv1310@gmail.com>
>> -Date: Mon, 9 Aug 2021 20:17:34 +0530
>> -Subject: [PATCH] librt: fix NULL pointer dereference (bug 28213)
>> -
>> -Helper thread frees copied attribute on NOTIFY_REMOVED message
>> -received from the OS kernel.  Unfortunately, it fails to check whether
>> -copied attribute actually exists (data.attr != NULL).  This worked
>> -earlier because free() checks passed pointer before actually
>> -attempting to release corresponding memory.  But
>> -__pthread_attr_destroy assumes pointer is not NULL.
>> -
>> -So passing NULL pointer to __pthread_attr_destroy will result in
>> -segmentation fault.  This scenario is possible if
>> -notification->sigev_notify_attributes == NULL (which means default
>> -thread attributes should be used).
>> -
>> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=b805aebd42364fe696e417808a700fdb9800c9e8]
>> -CVE: CVE-2021-38604
>> -
>> -Signed-off-by: Nikita Popov <npv1310@gmail.com>
>> -Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
>> -Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ----
>> - sysdeps/unix/sysv/linux/mq_notify.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
>> -index 6f46d29d1d..1714e1cc5f 100644
>> ---- a/sysdeps/unix/sysv/linux/mq_notify.c
>> -+++ b/sysdeps/unix/sysv/linux/mq_notify.c
>> -@@ -132,7 +132,7 @@ helper_thread (void *arg)
>> -              to wait until it is done with it.  */
>> -           (void) __pthread_barrier_wait (&notify_barrier);
>> -       }
>> --      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
>> -+      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED && data.attr != NULL)
>> -       {
>> -         /* The only state we keep is the copy of the thread attributes.  */
>> -         pthread_attr_destroy (data.attr);
>> diff --git a/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch b/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
>> deleted file mode 100644
>> index 39fde5b785..0000000000
>> --- a/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
>> +++ /dev/null
>> @@ -1,49 +0,0 @@
>> -From c4ad832276f4dadfa40904109b26a521468f66bc Mon Sep 17 00:00:00 2001
>> -From: Florian Weimer <fweimer@redhat.com>
>> -Date: Thu, 4 Feb 2021 15:00:20 +0100
>> -Subject: [PATCH] nptl: Remove private futex optimization [BZ #27304]
>> -
>> -It is effectively used, unexcept for pthread_cond_destroy, where we do
>> -not want it; see bug 27304.  The internal locks do not support a
>> -process-shared mode.
>> -
>> -This fixes commit dc6cfdc934db9997c33728082d63552b9eee4563 ("nptl:
>> -Move pthread_cond_destroy implementation into libc").
>> -
>> -Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
>> -
>> -Upstream-Status: Backport [https://sourceware.org/bugzilla/show_bug.cgi?id=27304]
>> -Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ----
>> - sysdeps/nptl/lowlevellock-futex.h | 14 +-------------
>> - 1 file changed, 1 insertion(+), 13 deletions(-)
>> -
>> -diff --git a/sysdeps/nptl/lowlevellock-futex.h b/sysdeps/nptl/lowlevellock-futex.h
>> -index ecb729da6b..ca96397a4a 100644
>> ---- a/sysdeps/nptl/lowlevellock-futex.h
>> -+++ b/sysdeps/nptl/lowlevellock-futex.h
>> -@@ -50,20 +50,8 @@
>> - #define LLL_SHARED    FUTEX_PRIVATE_FLAG
>> -
>> - #ifndef __ASSEMBLER__
>> --
>> --# if IS_IN (libc) || IS_IN (rtld)
>> --/* In libc.so or ld.so all futexes are private.  */
>> --#  define __lll_private_flag(fl, private)                     \
>> --  ({                                                          \
>> --    /* Prevent warnings in callers of this macro.  */         \
>> --    int __lll_private_flag_priv __attribute__ ((unused));     \
>> --    __lll_private_flag_priv = (private);                      \
>> --    ((fl) | FUTEX_PRIVATE_FLAG);                              \
>> --  })
>> --# else
>> --#  define __lll_private_flag(fl, private) \
>> -+# define __lll_private_flag(fl, private) \
>> -   (((fl) | FUTEX_PRIVATE_FLAG) ^ (private))
>> --# endif
>> -
>> - # define lll_futex_syscall(nargs, futexp, op, ...)                      \
>> -   ({                                                                    \
>> ---
>> -2.27.0
>> -
>> diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
>> deleted file mode 100644
>> index b654cdfecb..0000000000
>> --- a/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
>> +++ /dev/null
>> @@ -1,147 +0,0 @@
>> -From 4cc79c217744743077bf7a0ec5e0a4318f1e6641 Mon Sep 17 00:00:00 2001
>> -From: Nikita Popov <npv1310@gmail.com>
>> -Date: Thu, 12 Aug 2021 16:09:50 +0530
>> -Subject: [PATCH] librt: add test (bug 28213)
>> -
>> -This test implements following logic:
>> -1) Create POSIX message queue.
>> -   Register a notification with mq_notify (using NULL attributes).
>> -   Then immediately unregister the notification with mq_notify.
>> -   Helper thread in a vulnerable version of glibc
>> -   should cause NULL pointer dereference after these steps.
>> -2) Once again, register the same notification.
>> -   Try to send a dummy message.
>> -   Test is considered successfulif the dummy message
>> -   is successfully received by the callback function.
>> -
>> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=4cc79c217744743077bf7a0ec5e0a4318f1e6641]
>> -CVE: CVE-2021-38604
>> -
>> -Signed-off-by: Nikita Popov <npv1310@gmail.com>
>> -Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
>> -Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ----
>> - rt/Makefile      |   1 +
>> - rt/tst-bz28213.c | 101 +++++++++++++++++++++++++++++++++++++++++++++++
>> - 2 files changed, 102 insertions(+)
>> - create mode 100644 rt/tst-bz28213.c
>> -
>> -diff --git a/rt/Makefile b/rt/Makefile
>> -index 7b374f2073..c87d95793a 100644
>> ---- a/rt/Makefile
>> -+++ b/rt/Makefile
>> -@@ -44,6 +44,7 @@ tests := tst-shm tst-timer tst-timer2 \
>> -        tst-aio7 tst-aio8 tst-aio9 tst-aio10 \
>> -        tst-mqueue1 tst-mqueue2 tst-mqueue3 tst-mqueue4 \
>> -        tst-mqueue5 tst-mqueue6 tst-mqueue7 tst-mqueue8 tst-mqueue9 \
>> -+       tst-bz28213 \
>> -        tst-timer3 tst-timer4 tst-timer5 \
>> -        tst-cpuclock2 tst-cputimer1 tst-cputimer2 tst-cputimer3 \
>> -        tst-shm-cancel
>> -diff --git a/rt/tst-bz28213.c b/rt/tst-bz28213.c
>> -new file mode 100644
>> -index 0000000000..0c096b5a0a
>> ---- /dev/null
>> -+++ b/rt/tst-bz28213.c
>> -@@ -0,0 +1,101 @@
>> -+/* Bug 28213: test for NULL pointer dereference in mq_notify.
>> -+   Copyright (C) The GNU Toolchain Authors.
>> -+   This file is part of the GNU C Library.
>> -+
>> -+   The GNU C Library is free software; you can redistribute it and/or
>> -+   modify it under the terms of the GNU Lesser General Public
>> -+   License as published by the Free Software Foundation; either
>> -+   version 2.1 of the License, or (at your option) any later version.
>> -+
>> -+   The GNU C Library is distributed in the hope that it will be useful,
>> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -+   Lesser General Public License for more details.
>> -+
>> -+   You should have received a copy of the GNU Lesser General Public
>> -+   License along with the GNU C Library; if not, see
>> -+   <https://www.gnu.org/licenses/>.  */
>> -+
>> -+#include <errno.h>
>> -+#include <sys/types.h>
>> -+#include <sys/stat.h>
>> -+#include <fcntl.h>
>> -+#include <unistd.h>
>> -+#include <mqueue.h>
>> -+#include <signal.h>
>> -+#include <stdlib.h>
>> -+#include <string.h>
>> -+#include <support/check.h>
>> -+
>> -+static mqd_t m = -1;
>> -+static const char msg[] = "hello";
>> -+
>> -+static void
>> -+check_bz28213_cb (union sigval sv)
>> -+{
>> -+  char buf[sizeof (msg)];
>> -+
>> -+  (void) sv;
>> -+
>> -+  TEST_VERIFY_EXIT ((size_t) mq_receive (m, buf, sizeof (buf), NULL)
>> -+                  == sizeof (buf));
>> -+  TEST_VERIFY_EXIT (memcmp (buf, msg, sizeof (buf)) == 0);
>> -+
>> -+  exit (0);
>> -+}
>> -+
>> -+static void
>> -+check_bz28213 (void)
>> -+{
>> -+  struct sigevent sev;
>> -+
>> -+  memset (&sev, '\0', sizeof (sev));
>> -+  sev.sigev_notify = SIGEV_THREAD;
>> -+  sev.sigev_notify_function = check_bz28213_cb;
>> -+
>> -+  /* Step 1: Register & unregister notifier.
>> -+     Helper thread should receive NOTIFY_REMOVED notification.
>> -+     In a vulnerable version of glibc, NULL pointer dereference follows. */
>> -+  TEST_VERIFY_EXIT (mq_notify (m, &sev) == 0);
>> -+  TEST_VERIFY_EXIT (mq_notify (m, NULL) == 0);
>> -+
>> -+  /* Step 2: Once again, register notification.
>> -+     Try to send one message.
>> -+     Test is considered successful, if the callback does exit (0). */
>> -+  TEST_VERIFY_EXIT (mq_notify (m, &sev) == 0);
>> -+  TEST_VERIFY_EXIT (mq_send (m, msg, sizeof (msg), 1) == 0);
>> -+
>> -+  /* Wait... */
>> -+  pause ();
>> -+}
>> -+
>> -+static int
>> -+do_test (void)
>> -+{
>> -+  static const char m_name[] = "/bz28213_queue";
>> -+  struct mq_attr m_attr;
>> -+
>> -+  memset (&m_attr, '\0', sizeof (m_attr));
>> -+  m_attr.mq_maxmsg = 1;
>> -+  m_attr.mq_msgsize = sizeof (msg);
>> -+
>> -+  m = mq_open (m_name,
>> -+               O_RDWR | O_CREAT | O_EXCL,
>> -+               0600,
>> -+               &m_attr);
>> -+
>> -+  if (m < 0)
>> -+    {
>> -+      if (errno == ENOSYS)
>> -+        FAIL_UNSUPPORTED ("POSIX message queues are not implemented\n");
>> -+      FAIL_EXIT1 ("Failed to create POSIX message queue: %m\n");
>> -+    }
>> -+
>> -+  TEST_VERIFY_EXIT (mq_unlink (m_name) == 0);
>> -+
>> -+  check_bz28213 ();
>> -+
>> -+  return 0;
>> -+}
>> -+
>> -+#include <support/test-driver.c>
>> diff --git a/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch b/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
>> deleted file mode 100644
>> index 3cb60b2e55..0000000000
>> --- a/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
>> +++ /dev/null
>> @@ -1,116 +0,0 @@
>> -From b1971f6f1331d738d1d6b376b4741668a7546125 Mon Sep 17 00:00:00 2001
>> -From: "H.J. Lu" <hjl.tools@gmail.com>
>> -Date: Tue, 2 Feb 2021 13:45:58 -0800
>> -Subject: [PATCH] x86: Require full ISA support for x86-64 level marker [BZ #27318]
>> -
>> -Since -march=sandybridge enables ISAs in x86-64 ISA level v3, the v3
>> -marker is set on libc.so.  We couldn't set the needed ISA marker to v2
>> -since this libc won't run on all v2 machines.  Technically, the v3 marker
>> -is correct.  But the resulting libc.so won't run on Sandy Brigde, which
>> -is a v2 machine, even when libc is compiled with -march=sandybridge:
>> -
>> -$ ./elf/ld.so ./libc.so
>> -./libc.so: (p) CPU ISA level is lower than required: needed: 7; got: 3
>> -
>> -Instead, we require full ISA support for x86-64 level marker and disable
>> -x86-64 level marker for -march=sandybridge which enables ISAs between v2
>> -and v3.
>> -
>> -Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2021-February/122297.html]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> -
>> - sysdeps/x86/configure    |  7 ++++++-
>> - sysdeps/x86/configure.ac |  2 +-
>> - sysdeps/x86/isa-level.c  | 21 ++++++++++++++++++++-
>> - 3 files changed, 27 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/sysdeps/x86/configure b/sysdeps/x86/configure
>> -index 5e32dc62b3..5b20646843 100644
>> ---- a/sysdeps/x86/configure
>> -+++ b/sysdeps/x86/configure
>> -@@ -133,7 +133,12 @@ if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -nostartfiles -nostdlib -r -o conftest c
>> -   $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
>> -   test $ac_status = 0; }; }; then
>> -   count=`LC_ALL=C $READELF -n conftest | grep NT_GNU_PROPERTY_TYPE_0 | wc -l`
>> --  if test "$count" = 1; then
>> -+  if test "$count" = 1 && { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -DINCLUDE_X86_ISA_LEVEL -S -o conftest.s $srcdir/sysdeps/x86/isa-level.c'
>> -+  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
>> -+  (eval $ac_try) 2>&5
>> -+  ac_status=$?
>> -+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
>> -+  test $ac_status = 0; }; }; then
>> -     libc_cv_include_x86_isa_level=yes
>> -   fi
>> - fi
>> -diff --git a/sysdeps/x86/configure.ac b/sysdeps/x86/configure.ac
>> -index f94088f377..54ecd33d2c 100644
>> ---- a/sysdeps/x86/configure.ac
>> -+++ b/sysdeps/x86/configure.ac
>> -@@ -100,7 +100,7 @@ EOF
>> - libc_cv_include_x86_isa_level=no
>> - if AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -nostartfiles -nostdlib -r -o conftest conftest1.S conftest2.S); then
>> -   count=`LC_ALL=C $READELF -n conftest | grep NT_GNU_PROPERTY_TYPE_0 | wc -l`
>> --  if test "$count" = 1; then
>> -+  if test "$count" = 1 && AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -DINCLUDE_X86_ISA_LEVEL -S -o conftest.s $srcdir/sysdeps/x86/isa-level.c); then
>> -     libc_cv_include_x86_isa_level=yes
>> -   fi
>> - fi
>> -diff --git a/sysdeps/x86/isa-level.c b/sysdeps/x86/isa-level.c
>> -index aaf524cb56..7f83449061 100644
>> ---- a/sysdeps/x86/isa-level.c
>> -+++ b/sysdeps/x86/isa-level.c
>> -@@ -25,12 +25,17 @@
>> -    License along with the GNU C Library; if not, see
>> -    <https://www.gnu.org/licenses/>.  */
>> -
>> --#include <elf.h>
>> -+#ifdef _LIBC
>> -+# include <elf.h>
>> -+#endif
>> -
>> - /* ELF program property for x86 ISA level.  */
>> - #ifdef INCLUDE_X86_ISA_LEVEL
>> - # if defined __x86_64__ || defined __FXSR__ || !defined _SOFT_FLOAT \
>> -      || defined  __MMX__ || defined __SSE__ || defined __SSE2__
>> -+#  if !defined __SSE__ || !defined __SSE2__
>> -+#   error "Missing ISAs for x86-64 ISA level baseline"
>> -+#  endif
>> - #  define ISA_BASELINE        GNU_PROPERTY_X86_ISA_1_BASELINE
>> - # else
>> - #  define ISA_BASELINE        0
>> -@@ -40,6 +45,11 @@
>> -      || (defined __x86_64__ && defined __LAHF_SAHF__) \
>> -      || defined __POPCNT__ || defined __SSE3__ \
>> -      || defined __SSSE3__ || defined __SSE4_1__ || defined __SSE4_2__
>> -+#  if !defined __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 \
>> -+     || !defined __POPCNT__ || !defined __SSE3__ \
>> -+     || !defined __SSSE3__ || !defined __SSE4_1__ || !defined __SSE4_2__
>> -+#   error "Missing ISAs for x86-64 ISA level v2"
>> -+#  endif
>> - #  define ISA_V2      GNU_PROPERTY_X86_ISA_1_V2
>> - # else
>> - #  define ISA_V2      0
>> -@@ -48,6 +58,10 @@
>> - # if defined __AVX__ || defined __AVX2__ || defined __F16C__ \
>> -      || defined __FMA__ || defined __LZCNT__ || defined __MOVBE__ \
>> -      || defined __XSAVE__
>> -+# if !defined __AVX__ || !defined __AVX2__ || !defined __F16C__ \
>> -+     || !defined __FMA__ || !defined __LZCNT__
>> -+#   error "Missing ISAs for x86-64 ISA level v3"
>> -+#  endif
>> - #  define ISA_V3      GNU_PROPERTY_X86_ISA_1_V3
>> - # else
>> - #  define ISA_V3      0
>> -@@ -55,6 +69,11 @@
>> -
>> - # if defined __AVX512F__ || defined __AVX512BW__ || defined __AVX512CD__ \
>> -      || defined __AVX512DQ__ || defined __AVX512VL__
>> -+#  if !defined __AVX512F__ || !defined __AVX512BW__ \
>> -+      || !defined __AVX512CD__ || !defined __AVX512DQ__ \
>> -+      || !defined __AVX512VL__
>> -+#   error "Missing ISAs for x86-64 ISA level v4"
>> -+#  endif
>> - #  define ISA_V4      GNU_PROPERTY_X86_ISA_1_V4
>> - # else
>> - #  define ISA_V4      0
>> diff --git a/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch b/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
>> deleted file mode 100644
>> index e904b28a05..0000000000
>> --- a/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
>> +++ /dev/null
>> @@ -1,58 +0,0 @@
>> -From 044e603b698093cf48f6e6229e0b66acf05227e4 Mon Sep 17 00:00:00 2001
>> -From: Florian Weimer <fweimer@redhat.com>
>> -Date: Fri, 19 Feb 2021 13:29:00 +0100
>> -Subject: [PATCH] string: Work around GCC PR 98512 in rawmemchr
>> -
>> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=044e603b698093cf48f6e6229e0b66acf05227e4]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - string/rawmemchr.c | 26 +++++++++++++++-----------
>> - 1 file changed, 15 insertions(+), 11 deletions(-)
>> -
>> -diff --git a/string/rawmemchr.c b/string/rawmemchr.c
>> -index 59bbeeaa42..b8523118e5 100644
>> ---- a/string/rawmemchr.c
>> -+++ b/string/rawmemchr.c
>> -@@ -22,24 +22,28 @@
>> - # define RAWMEMCHR __rawmemchr
>> - #endif
>> -
>> --/* Find the first occurrence of C in S.  */
>> --void *
>> --RAWMEMCHR (const void *s, int c)
>> --{
>> --  DIAG_PUSH_NEEDS_COMMENT;
>> -+/* The pragmata should be nested inside RAWMEMCHR below, but that
>> -+   triggers GCC PR 98512.  */
>> -+DIAG_PUSH_NEEDS_COMMENT;
>> - #if __GNUC_PREREQ (7, 0)
>> --  /* GCC 8 warns about the size passed to memchr being larger than
>> --     PTRDIFF_MAX; the use of SIZE_MAX is deliberate here.  */
>> --  DIAG_IGNORE_NEEDS_COMMENT (8, "-Wstringop-overflow=");
>> -+/* GCC 8 warns about the size passed to memchr being larger than
>> -+   PTRDIFF_MAX; the use of SIZE_MAX is deliberate here.  */
>> -+DIAG_IGNORE_NEEDS_COMMENT (8, "-Wstringop-overflow=");
>> - #endif
>> - #if __GNUC_PREREQ (11, 0)
>> --  /* Likewise GCC 11, with a different warning option.  */
>> --  DIAG_IGNORE_NEEDS_COMMENT (11, "-Wstringop-overread");
>> -+/* Likewise GCC 11, with a different warning option.  */
>> -+DIAG_IGNORE_NEEDS_COMMENT (11, "-Wstringop-overread");
>> - #endif
>> -+
>> -+/* Find the first occurrence of C in S.  */
>> -+void *
>> -+RAWMEMCHR (const void *s, int c)
>> -+{
>> -   if (c != '\0')
>> -     return memchr (s, c, (size_t)-1);
>> --  DIAG_POP_NEEDS_COMMENT;
>> -   return (char *)s + strlen (s);
>> - }
>> - libc_hidden_def (__rawmemchr)
>> - weak_alias (__rawmemchr, rawmemchr)
>> -+
>> -+DIAG_POP_NEEDS_COMMENT;
>> ---
>> -2.30.1
>> -
>> diff --git a/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch b/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
>> deleted file mode 100644
>> index 3a004e227f..0000000000
>> --- a/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
>> +++ /dev/null
>> @@ -1,185 +0,0 @@
>> -From 750b00a1ddae220403fd892a6fd4e0791ffd154a Mon Sep 17 00:00:00 2001
>> -From: "H.J. Lu" <hjl.tools@gmail.com>
>> -Date: Fri, 18 Sep 2020 07:55:14 -0700
>> -Subject: [PATCH] x86: Handle _SC_LEVEL1_ICACHE_LINESIZE [BZ #27444]
>> -
>> -    x86: Move x86 processor cache info to cpu_features
>> -
>> -missed _SC_LEVEL1_ICACHE_LINESIZE.
>> -
>> -1. Add level1_icache_linesize to struct cpu_features.
>> -2. Initialize level1_icache_linesize by calling handle_intel,
>> -handle_zhaoxin and handle_amd with _SC_LEVEL1_ICACHE_LINESIZE.
>> -3. Return level1_icache_linesize for _SC_LEVEL1_ICACHE_LINESIZE.
>> -
>> -Upstream-Status: Backport [https://sourceware.org/bugzilla/show_bug.cgi?id=27444]
>> -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> ----
>> - sysdeps/x86/Makefile                          |  8 +++
>> - sysdeps/x86/cacheinfo.c                       |  3 +
>> - sysdeps/x86/dl-cacheinfo.h                    |  6 ++
>> - sysdeps/x86/include/cpu-features.h            |  2 +
>> - .../x86/tst-sysconf-cache-linesize-static.c   |  1 +
>> - sysdeps/x86/tst-sysconf-cache-linesize.c      | 57 +++++++++++++++++++
>> - 6 files changed, 77 insertions(+)
>> - create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize-static.c
>> - create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize.c
>> -
>> -diff --git a/sysdeps/x86/Makefile b/sysdeps/x86/Makefile
>> -index dd82674342..d231263051 100644
>> ---- a/sysdeps/x86/Makefile
>> -+++ b/sysdeps/x86/Makefile
>> -@@ -208,3 +208,11 @@ $(objpfx)check-cet.out: $(..)sysdeps/x86/check-cet.awk \
>> - generated += check-cet.out
>> - endif
>> - endif
>> -+
>> -+ifeq ($(subdir),posix)
>> -+tests += \
>> -+  tst-sysconf-cache-linesize \
>> -+  tst-sysconf-cache-linesize-static
>> -+tests-static += \
>> -+  tst-sysconf-cache-linesize-static
>> -+endif
>> -diff --git a/sysdeps/x86/cacheinfo.c b/sysdeps/x86/cacheinfo.c
>> -index 7b8df45e3b..5ea4723ca6 100644
>> ---- a/sysdeps/x86/cacheinfo.c
>> -+++ b/sysdeps/x86/cacheinfo.c
>> -@@ -32,6 +32,9 @@ __cache_sysconf (int name)
>> -     case _SC_LEVEL1_ICACHE_SIZE:
>> -       return cpu_features->level1_icache_size;
>> -
>> -+    case _SC_LEVEL1_ICACHE_LINESIZE:
>> -+      return cpu_features->level1_icache_linesize;
>> -+
>> -     case _SC_LEVEL1_DCACHE_SIZE:
>> -       return cpu_features->level1_dcache_size;
>> -
>> -diff --git a/sysdeps/x86/dl-cacheinfo.h b/sysdeps/x86/dl-cacheinfo.h
>> -index a31fa0783a..7cd00b92f1 100644
>> ---- a/sysdeps/x86/dl-cacheinfo.h
>> -+++ b/sysdeps/x86/dl-cacheinfo.h
>> -@@ -707,6 +707,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
>> -   long int core;
>> -   unsigned int threads = 0;
>> -   unsigned long int level1_icache_size = -1;
>> -+  unsigned long int level1_icache_linesize = -1;
>> -   unsigned long int level1_dcache_size = -1;
>> -   unsigned long int level1_dcache_assoc = -1;
>> -   unsigned long int level1_dcache_linesize = -1;
>> -@@ -726,6 +727,8 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
>> -
>> -       level1_icache_size
>> -       = handle_intel (_SC_LEVEL1_ICACHE_SIZE, cpu_features);
>> -+      level1_icache_linesize
>> -+      = handle_intel (_SC_LEVEL1_ICACHE_LINESIZE, cpu_features);
>> -       level1_dcache_size = data;
>> -       level1_dcache_assoc
>> -       = handle_intel (_SC_LEVEL1_DCACHE_ASSOC, cpu_features);
>> -@@ -753,6 +756,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
>> -       shared = handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);
>> -
>> -       level1_icache_size = handle_zhaoxin (_SC_LEVEL1_ICACHE_SIZE);
>> -+      level1_icache_linesize = handle_zhaoxin (_SC_LEVEL1_ICACHE_LINESIZE);
>> -       level1_dcache_size = data;
>> -       level1_dcache_assoc = handle_zhaoxin (_SC_LEVEL1_DCACHE_ASSOC);
>> -       level1_dcache_linesize = handle_zhaoxin (_SC_LEVEL1_DCACHE_LINESIZE);
>> -@@ -772,6 +776,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
>> -       shared = handle_amd (_SC_LEVEL3_CACHE_SIZE);
>> -
>> -       level1_icache_size = handle_amd (_SC_LEVEL1_ICACHE_SIZE);
>> -+      level1_icache_linesize = handle_amd (_SC_LEVEL1_ICACHE_LINESIZE);
>> -       level1_dcache_size = data;
>> -       level1_dcache_assoc = handle_amd (_SC_LEVEL1_DCACHE_ASSOC);
>> -       level1_dcache_linesize = handle_amd (_SC_LEVEL1_DCACHE_LINESIZE);
>> -@@ -833,6 +838,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
>> -     }
>> -
>> -   cpu_features->level1_icache_size = level1_icache_size;
>> -+  cpu_features->level1_icache_linesize = level1_icache_linesize;
>> -   cpu_features->level1_dcache_size = level1_dcache_size;
>> -   cpu_features->level1_dcache_assoc = level1_dcache_assoc;
>> -   cpu_features->level1_dcache_linesize = level1_dcache_linesize;
>> -diff --git a/sysdeps/x86/include/cpu-features.h b/sysdeps/x86/include/cpu-features.h
>> -index 624736b40e..39a3f4f311 100644
>> ---- a/sysdeps/x86/include/cpu-features.h
>> -+++ b/sysdeps/x86/include/cpu-features.h
>> -@@ -874,6 +874,8 @@ struct cpu_features
>> -   unsigned long int rep_stosb_threshold;
>> -   /* _SC_LEVEL1_ICACHE_SIZE.  */
>> -   unsigned long int level1_icache_size;
>> -+  /* _SC_LEVEL1_ICACHE_LINESIZE.  */
>> -+  unsigned long int level1_icache_linesize;
>> -   /* _SC_LEVEL1_DCACHE_SIZE.  */
>> -   unsigned long int level1_dcache_size;
>> -   /* _SC_LEVEL1_DCACHE_ASSOC.  */
>> -diff --git a/sysdeps/x86/tst-sysconf-cache-linesize-static.c b/sysdeps/x86/tst-sysconf-cache-linesize-static.c
>> -new file mode 100644
>> -index 0000000000..152ae68821
>> ---- /dev/null
>> -+++ b/sysdeps/x86/tst-sysconf-cache-linesize-static.c
>> -@@ -0,0 +1 @@
>> -+#include "tst-sysconf-cache-linesize.c"
>> -diff --git a/sysdeps/x86/tst-sysconf-cache-linesize.c b/sysdeps/x86/tst-sysconf-cache-linesize.c
>> -new file mode 100644
>> -index 0000000000..642dbde5d2
>> ---- /dev/null
>> -+++ b/sysdeps/x86/tst-sysconf-cache-linesize.c
>> -@@ -0,0 +1,57 @@
>> -+/* Test system cache line sizes.
>> -+   Copyright (C) 2021 Free Software Foundation, Inc.
>> -+   This file is part of the GNU C Library.
>> -+
>> -+   The GNU C Library is free software; you can redistribute it and/or
>> -+   modify it under the terms of the GNU Lesser General Public
>> -+   License as published by the Free Software Foundation; either
>> -+   version 2.1 of the License, or (at your option) any later version.
>> -+
>> -+   The GNU C Library is distributed in the hope that it will be useful,
>> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -+   Lesser General Public License for more details.
>> -+
>> -+   You should have received a copy of the GNU Lesser General Public
>> -+   License along with the GNU C Library; if not, see
>> -+   <https://www.gnu.org/licenses/>.  */
>> -+
>> -+#include <stdio.h>
>> -+#include <stdlib.h>
>> -+#include <unistd.h>
>> -+#include <array_length.h>
>> -+
>> -+static struct
>> -+{
>> -+  const char *name;
>> -+  int _SC_val;
>> -+} sc_options[] =
>> -+  {
>> -+#define N(name) { "_SC_"#name, _SC_##name }
>> -+    N (LEVEL1_ICACHE_LINESIZE),
>> -+    N (LEVEL1_DCACHE_LINESIZE),
>> -+    N (LEVEL2_CACHE_LINESIZE)
>> -+  };
>> -+
>> -+static int
>> -+do_test (void)
>> -+{
>> -+  int result = EXIT_SUCCESS;
>> -+
>> -+  for (int i = 0; i < array_length (sc_options); ++i)
>> -+    {
>> -+      long int scret = sysconf (sc_options[i]._SC_val);
>> -+      if (scret < 0)
>> -+      {
>> -+        printf ("sysconf (%s) returned < 0 (%ld)\n",
>> -+                sc_options[i].name, scret);
>> -+        result = EXIT_FAILURE;
>> -+      }
>> -+      else
>> -+      printf ("sysconf (%s): %ld\n", sc_options[i].name, scret);
>> -+    }
>> -+
>> -+  return result;
>> -+}
>> -+
>> -+#include <support/test-driver.c>
>> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-27318-revert.patch b/meta/recipes-core/glibc/glibc/CVE-2021-27318-revert.patch
>> new file mode 100644
>> index 0000000000..2f08a90dd0
>> --- /dev/null
>> +++ b/meta/recipes-core/glibc/glibc/CVE-2021-27318-revert.patch
>> @@ -0,0 +1,174 @@
>> +Since the full ISA set used in an ELF binary is unknown to compiler,
>> +an x86-64 ISA level marker indicates the minimum, not maximum, ISA set
>> +required to run such an ELF binary.  We never guarantee a library with
>> +an x86-64 ISA level v3 marker doesn't contain other ISAs beyond x86-64
>> +ISA level v3, like AVX VNNI.  We check the x86-64 ISA level marker for
>> +the minimum ISA set.  Since -march=sandybridge enables only some ISAs
>> +in x86-64 ISA level v3, we should set the needed ISA marker to v2.
>> +Otherwise, libc is compiled with -march=sandybridge will fail to run on
>> +Sandy Bridge:
>> +
>> +$ ./elf/ld.so ./libc.so
>> +./libc.so: (p) CPU ISA level is lower than required: needed: 7; got: 3
>> +
>> +Set the minimum, instead of maximum, x86-64 ISA level marker should have
>> +no impact on the b-hwcaps directory assignment logic in ldconfig nor
>> +ld.so.
>> +
>> +(cherry picked from commit 339bf918ea4830fb35614632e96f3aab3237adce)
>> +---
>> + config.h.in              |  6 ++++++
>> + sysdeps/x86/configure    | 28 ++++++++++++++++++++++++++++
>> + sysdeps/x86/configure.ac | 16 ++++++++++++++++
>> + sysdeps/x86/isa-level.c  | 25 ++++++++++++++-----------
>> + 4 files changed, 64 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/config.h.in b/config.h.in
>> +--- a/config.h.in      2021-10-16 03:28:49.447573081 -0700
>> ++++ b/config.h.in      2021-10-16 03:29:38.626741181 -0700
>> +@@ -275,4 +275,10 @@
>> + /* Define if x86 ISA level should be included in shared libraries.  */
>> + #undef INCLUDE_X86_ISA_LEVEL
>> +
>> ++/* Define if -msahf is enabled by default on x86.  */
>> ++#undef HAVE_X86_LAHF_SAHF
>> ++
>> ++/* Define if -mmovbe is enabled by default on x86.  */
>> ++#undef HAVE_X86_MOVBE
>> ++
>> + #endif
>> +diff --git a/sysdeps/x86/configure b/sysdeps/x86/configure
>> +--- a/sysdeps/x86/configure    2021-10-16 03:28:49.587570713 -0700
>> ++++ b/sysdeps/x86/configure    2021-10-16 03:29:39.330729277 -0700
>> +@@ -126,6 +126,8 @@ cat > conftest2.S <<EOF
>> + 4:
>> + EOF
>> + libc_cv_include_x86_isa_level=no
>> ++libc_cv_have_x86_lahf_sahf=no
>> ++libc_cv_have_x86_movbe=no
>> + if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -nostartfiles -nostdlib -r -o conftest conftest1.S conftest2.S'
>> +   { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
>> +   (eval $ac_try) 2>&5
>> +@@ -135,6 +137,24 @@ if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS
>> +   count=`LC_ALL=C $READELF -n conftest | grep NT_GNU_PROPERTY_TYPE_0 | wc -l`
>> +   if test "$count" = 1; then
>> +     libc_cv_include_x86_isa_level=yes
>> ++    cat > conftest.c <<EOF
>> ++EOF
>> ++    if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -fverbose-asm -S -o - conftest.c'
>> ++  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
>> ++  (eval $ac_try) 2>&5
>> ++  ac_status=$?
>> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
>> ++  test $ac_status = 0; }; } | grep -q "\-msahf"; then
>> ++      libc_cv_have_x86_lahf_sahf=yes
>> ++    fi
>> ++    if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -fverbose-asm -S -o - conftest.c'
>> ++  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
>> ++  (eval $ac_try) 2>&5
>> ++  ac_status=$?
>> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
>> ++  test $ac_status = 0; }; } | grep -q "\-mmovbe"; then
>> ++      libc_cv_have_x86_movbe=yes
>> ++    fi
>> +   fi
>> + fi
>> + rm -f conftest*
>> +@@ -145,5 +165,13 @@ if test $libc_cv_include_x86_isa_level =
>> +   $as_echo "#define INCLUDE_X86_ISA_LEVEL 1" >>confdefs.h
>> +
>> + fi
>> ++if test $libc_cv_have_x86_lahf_sahf = yes; then
>> ++  $as_echo "#define HAVE_X86_LAHF_SAHF 1" >>confdefs.h
>> ++
>> ++fi
>> ++if test $libc_cv_have_x86_movbe = yes; then
>> ++  $as_echo "#define HAVE_X86_MOVBE 1" >>confdefs.h
>> ++
>> ++fi
>> + config_vars="$config_vars
>> + enable-x86-isa-level = $libc_cv_include_x86_isa_level"
>> +diff --git a/sysdeps/x86/configure.ac b/sysdeps/x86/configure.ac
>> +--- a/sysdeps/x86/configure.ac 2021-10-16 03:28:49.587570713 -0700
>> ++++ b/sysdeps/x86/configure.ac 2021-10-16 03:29:40.038717306 -0700
>> +@@ -98,14 +98,30 @@ cat > conftest2.S <<EOF
>> + 4:
>> + EOF
>> + libc_cv_include_x86_isa_level=no
>> ++libc_cv_have_x86_lahf_sahf=no
>> ++libc_cv_have_x86_movbe=no
>> + if AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -nostartfiles -nostdlib -r -o conftest conftest1.S conftest2.S); then
>> +   count=`LC_ALL=C $READELF -n conftest | grep NT_GNU_PROPERTY_TYPE_0 | wc -l`
>> +   if test "$count" = 1; then
>> +     libc_cv_include_x86_isa_level=yes
>> ++    cat > conftest.c <<EOF
>> ++EOF
>> ++    if AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -fverbose-asm -S -o - conftest.c) | grep -q "\-msahf"; then
>> ++      libc_cv_have_x86_lahf_sahf=yes
>> ++    fi
>> ++    if AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -fverbose-asm -S -o - conftest.c) | grep -q "\-mmovbe"; then
>> ++      libc_cv_have_x86_movbe=yes
>> ++    fi
>> +   fi
>> + fi
>> + rm -f conftest*])
>> + if test $libc_cv_include_x86_isa_level = yes; then
>> +   AC_DEFINE(INCLUDE_X86_ISA_LEVEL)
>> + fi
>> ++if test $libc_cv_have_x86_lahf_sahf = yes; then
>> ++  AC_DEFINE(HAVE_X86_LAHF_SAHF)
>> ++fi
>> ++if test $libc_cv_have_x86_movbe = yes; then
>> ++  AC_DEFINE(HAVE_X86_MOVBE)
>> ++fi
>> + LIBC_CONFIG_VAR([enable-x86-isa-level], [$libc_cv_include_x86_isa_level])
>> +diff --git a/sysdeps/x86/isa-level.c b/sysdeps/x86/isa-level.c
>> +--- a/sysdeps/x86/isa-level.c  2021-10-16 03:28:49.587570713 -0700
>> ++++ b/sysdeps/x86/isa-level.c  2021-10-16 03:29:40.766704997 -0700
>> +@@ -29,32 +29,35 @@
>> +
>> + /* ELF program property for x86 ISA level.  */
>> + #ifdef INCLUDE_X86_ISA_LEVEL
>> +-# if defined __x86_64__ || defined __FXSR__ || !defined _SOFT_FLOAT \
>> +-     || defined  __MMX__ || defined __SSE__ || defined __SSE2__
>> ++# if defined __SSE__ && defined __SSE2__
>> ++/* NB: ISAs, excluding MMX, in x86-64 ISA level baseline are used.  */
>> + #  define ISA_BASELINE        GNU_PROPERTY_X86_ISA_1_BASELINE
>> + # else
>> + #  define ISA_BASELINE        0
>> + # endif
>> +
>> +-# if defined __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 \
>> +-     || (defined __x86_64__ && defined __LAHF_SAHF__) \
>> +-     || defined __POPCNT__ || defined __SSE3__ \
>> +-     || defined __SSSE3__ || defined __SSE4_1__ || defined __SSE4_2__
>> ++# if ISA_BASELINE && defined __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 \
>> ++     && defined HAVE_X86_LAHF_SAHF && defined __POPCNT__ \
>> ++     && defined __SSE3__ && defined __SSSE3__ && defined __SSE4_1__ \
>> ++     && defined __SSE4_2__
>> ++/* NB: ISAs in x86-64 ISA level v2 are used.  */
>> + #  define ISA_V2      GNU_PROPERTY_X86_ISA_1_V2
>> + # else
>> + #  define ISA_V2      0
>> + # endif
>> +
>> +-# if defined __AVX__ || defined __AVX2__ || defined __F16C__ \
>> +-     || defined __FMA__ || defined __LZCNT__ || defined __MOVBE__ \
>> +-     || defined __XSAVE__
>> ++# if ISA_V2 && defined __AVX__ && defined __AVX2__ && defined __F16C__ \
>> ++     && defined __FMA__ && defined __LZCNT__ && defined HAVE_X86_MOVBE
>> ++/* NB: ISAs in x86-64 ISA level v3 are used.  */
>> + #  define ISA_V3      GNU_PROPERTY_X86_ISA_1_V3
>> + # else
>> + #  define ISA_V3      0
>> + # endif
>> +
>> +-# if defined __AVX512F__ || defined __AVX512BW__ || defined __AVX512CD__ \
>> +-     || defined __AVX512DQ__ || defined __AVX512VL__
>> ++# if ISA_V3 && defined __AVX512F__ && defined __AVX512BW__ \
>> ++     && defined __AVX512CD__ && defined __AVX512DQ__ \
>> ++     && defined __AVX512VL__
>> ++/* NB: ISAs in x86-64 ISA level v4 are used.  */
>> + #  define ISA_V4      GNU_PROPERTY_X86_ISA_1_V4
>> + # else
>> + #  define ISA_V4      0
>> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
>> deleted file mode 100644
>> index 26c5c0d2a9..0000000000
>> --- a/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -From dca565886b5e8bd7966e15f0ca42ee5cff686673 Mon Sep 17 00:00:00 2001
>> -From: DJ Delorie <dj@redhat.com>
>> -Date: Thu, 25 Feb 2021 16:08:21 -0500
>> -Subject: [PATCH] nscd: Fix double free in netgroupcache [BZ #27462]
>> -
>> -In commit 745664bd798ec8fd50438605948eea594179fba1 a use-after-free
>> -was fixed, but this led to an occasional double-free.  This patch
>> -tracks the "live" allocation better.
>> -
>> -Tested manually by a third party.
>> -
>> -Related: RHBZ 1927877
>> -
>> -Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
>> -Reviewed-by: Carlos O'Donell <carlos@redhat.com>
>> -
>> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=dca565886b5e8bd7966e15f0ca42ee5cff686673]
>> -
>> -CVE: CVE-2021-27645
>> -
>> -Reviewed-by: Carlos O'Donell <carlos@redhat.com>
>> -Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
>> ----
>> - nscd/netgroupcache.c | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/nscd/netgroupcache.c b/nscd/netgroupcache.c
>> -index dba6ceec1b..ad2daddafd 100644
>> ---- a/nscd/netgroupcache.c
>> -+++ b/nscd/netgroupcache.c
>> -@@ -248,7 +248,7 @@ addgetnetgrentX (struct database_dyn *db, int fd, request_header *req,
>> -                                            : NULL);
>> -                                   ndomain = (ndomain ? newbuf + ndomaindiff
>> -                                              : NULL);
>> --                                  buffer = newbuf;
>> -+                                  *tofreep = buffer = newbuf;
>> -                                 }
>> -
>> -                               nhost = memcpy (buffer + bufused,
>> -@@ -319,7 +319,7 @@ addgetnetgrentX (struct database_dyn *db, int fd, request_header *req,
>> -                   else if (status == NSS_STATUS_TRYAGAIN && e == ERANGE)
>> -                     {
>> -                       buflen *= 2;
>> --                      buffer = xrealloc (buffer, buflen);
>> -+                      *tofreep = buffer = xrealloc (buffer, buflen);
>> -                     }
>> -                   else if (status == NSS_STATUS_RETURN
>> -                            || status == NSS_STATUS_NOTFOUND
>> ---
>> -2.27.0
>> -
>> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
>> deleted file mode 100644
>> index 21f07ac303..0000000000
>> --- a/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
>> +++ /dev/null
>> @@ -1,76 +0,0 @@
>> -From 709674ec86c3c6da4f0995897f6b0205c16d049d Mon Sep 17 00:00:00 2001
>> -From: Andreas Schwab <schwab@linux-m68k.org>
>> -Date: Thu, 27 May 2021 12:49:47 +0200
>> -Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896)
>> -
>> -Make a deep copy of the pthread attribute object to remove a potential
>> -use-after-free issue.
>> -
>> -Upstream-Status: Backport
>> -[https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb]
>> -
>> -CVE:
>> -CVE-2021-33574
>> -
>> -Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
>> -Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
>> ----
>> - NEWS                                |  4 ++++
>> - sysdeps/unix/sysv/linux/mq_notify.c | 15 ++++++++++-----
>> - 2 files changed, 14 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/NEWS b/NEWS
>> -index 71f5d20324..017d656433 100644
>> ---- a/NEWS
>> -+++ b/NEWS
>> -@@ -118,6 +118,10 @@ Security related changes:
>> -   CVE-2019-25013: A buffer overflow has been fixed in the iconv function when
>> -   invoked with EUC-KR input containing invalid multibyte input sequences.
>> -
>> -+  CVE-2021-33574: The mq_notify function has a potential use-after-free
>> -+  issue when using a notification type of SIGEV_THREAD and a thread
>> -+  attribute with a non-default affinity mask.
>> -+
>> - The following bugs are resolved with this release:
>> -
>> -   [10635] libc: realpath portability patches
>> -diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
>> -index cc575a0cdd..f7ddfe5a6c 100644
>> ---- a/sysdeps/unix/sysv/linux/mq_notify.c
>> -+++ b/sysdeps/unix/sysv/linux/mq_notify.c
>> -@@ -133,8 +133,11 @@ helper_thread (void *arg)
>> -           (void) __pthread_barrier_wait (&notify_barrier);
>> -       }
>> -       else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
>> --      /* The only state we keep is the copy of the thread attributes.  */
>> --      free (data.attr);
>> -+      {
>> -+        /* The only state we keep is the copy of the thread attributes.  */
>> -+        pthread_attr_destroy (data.attr);
>> -+        free (data.attr);
>> -+      }
>> -     }
>> -   return NULL;
>> - }
>> -@@ -255,8 +258,7 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
>> -       if (data.attr == NULL)
>> -       return -1;
>> -
>> --      memcpy (data.attr, notification->sigev_notify_attributes,
>> --            sizeof (pthread_attr_t));
>> -+      __pthread_attr_copy (data.attr, notification->sigev_notify_attributes);
>> -     }
>> -
>> -   /* Construct the new request.  */
>> -@@ -270,7 +272,10 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
>> -
>> -   /* If it failed, free the allocated memory.  */
>> -   if (__glibc_unlikely (retval != 0))
>> --    free (data.attr);
>> -+    {
>> -+      pthread_attr_destroy (data.attr);
>> -+      free (data.attr);
>> -+    }
>> -
>> -   return retval;
>> - }
>> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
>> deleted file mode 100644
>> index befccd7ac7..0000000000
>> --- a/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -From 217b6dc298156bdb0d6aea9ea93e7e394a5ff091 Mon Sep 17 00:00:00 2001
>> -From: Florian Weimer <fweimer@redhat.com>
>> -Date: Tue, 1 Jun 2021 17:51:41 +0200
>> -Subject: [PATCH] Fix use of __pthread_attr_copy in mq_notify (bug 27896)
>> -
>> -__pthread_attr_copy can fail and does not initialize the attribute
>> -structure in that case.
>> -
>> -If __pthread_attr_copy is never called and there is no allocated
>> -attribute, pthread_attr_destroy should not be called, otherwise
>> -there is a null pointer dereference in rt/tst-mqueue6.
>> -
>> -Fixes commit 42d359350510506b87101cf77202fefcbfc790cb
>> -("Use __pthread_attr_copy in mq_notify (bug 27896)").
>> -
>> -Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
>> -
>> -Upstream-Status: Backport
>> -[https://sourceware.org/git/?p=glibc.git;a=commit;h=217b6dc298156bdb0d6aea9ea93e7e394a5ff091]
>> -
>> -CVE:
>> -CVE-2021-33574
>> -
>> -Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
>> -Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
>> ----
>> - sysdeps/unix/sysv/linux/mq_notify.c | 11 +++++++++--
>> - 1 file changed, 9 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
>> -index f7ddfe5a6c..6f46d29d1d 100644
>> ---- a/sysdeps/unix/sysv/linux/mq_notify.c
>> -+++ b/sysdeps/unix/sysv/linux/mq_notify.c
>> -@@ -258,7 +258,14 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
>> -       if (data.attr == NULL)
>> -       return -1;
>> -
>> --      __pthread_attr_copy (data.attr, notification->sigev_notify_attributes);
>> -+      int ret = __pthread_attr_copy (data.attr,
>> -+                                   notification->sigev_notify_attributes);
>> -+      if (ret != 0)
>> -+      {
>> -+        free (data.attr);
>> -+        __set_errno (ret);
>> -+        return -1;
>> -+      }
>> -     }
>> -
>> -   /* Construct the new request.  */
>> -@@ -271,7 +278,7 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
>> -   int retval = INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
>> -
>> -   /* If it failed, free the allocated memory.  */
>> --  if (__glibc_unlikely (retval != 0))
>> -+  if (retval != 0 && data.attr != NULL)
>> -     {
>> -       pthread_attr_destroy (data.attr);
>> -       free (data.attr);
>> ---
>> -2.27.0
>> -
>> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
>> deleted file mode 100644
>> index 5cae1bc91c..0000000000
>> --- a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
>> -From: Andreas Schwab <schwab@linux-m68k.org>
>> -Date: Fri, 25 Jun 2021 15:02:47 +0200
>> -Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
>> - 28011)
>> -
>> -Use strtoul instead of atoi so that overflow can be detected.
>> -
>> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
>> -CVE: CVE-2021-35942
>> -Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ----
>> - posix/wordexp-test.c | 1 +
>> - posix/wordexp.c      | 2 +-
>> - 2 files changed, 2 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
>> -index f93a546d7e..9df02dbbb3 100644
>> ---- a/posix/wordexp-test.c
>> -+++ b/posix/wordexp-test.c
>> -@@ -183,6 +183,7 @@ struct test_case_struct
>> -     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
>> -     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
>> -     { 0, NULL, "", 0, 0, { NULL, }, IFS },
>> -+    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
>> -
>> -     /* Flags not already covered (testit() has special handling for these) */
>> -     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
>> -diff --git a/posix/wordexp.c b/posix/wordexp.c
>> -index bcbe96e48d..1f3b09f721 100644
>> ---- a/posix/wordexp.c
>> -+++ b/posix/wordexp.c
>> -@@ -1399,7 +1399,7 @@ envsubst:
>> -   /* Is it a numeric parameter? */
>> -   else if (isdigit (env[0]))
>> -     {
>> --      int n = atoi (env);
>> -+      unsigned long n = strtoul (env, NULL, 10);
>> -
>> -       if (n >= __libc_argc)
>> -       /* Substitute NULL. */
>> ---
>> -2.17.1
>> -
>> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
>> index 57a60cb9d8..ad5e2b8eb1 100644
>> --- a/meta/recipes-core/glibc/glibc_2.33.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
>> @@ -56,16 +56,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>>             file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
>>             file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
>>             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
>> -           file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
>> -           file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch \
>> -           file://0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch \
>> -           file://CVE-2021-27645.patch \
>> -           file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
>> -           file://CVE-2021-33574_1.patch \
>> -           file://CVE-2021-33574_2.patch \
>> -           file://CVE-2021-35942.patch \
>> -           file://0001-CVE-2021-38604.patch \
>> -           file://0002-CVE-2021-38604.patch \
>>             "
>>  S = "${WORKDIR}/git"
>>  B = "${WORKDIR}/build-${TARGET_SYS}"
>> --
>> 2.31.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157024): https://lists.openembedded.org/g/openembedded-core/message/157024
>> Mute This Topic: https://lists.openembedded.org/mt/86384691/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

