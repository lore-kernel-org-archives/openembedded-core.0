Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.24263.1629727232277383296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 07:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DOnfNCJ/;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id z2so38181773lft.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VuCkXBxW1dxjvz/ppcM3cZl9SNGNHduYeWtg3u1bL/c=;
        b=DOnfNCJ/UUpwtCWSiiRtAIhxRO1blXlwX5iOjdfBs9dd5s45rVHyBkgPTG8gdt5Agw
         zGUDDYejODacXRMiqOwDtwnrnAiGW5gtWdK7KUXUGuzAya06jxPBf+olJTmc0zaOHemh
         NqKngba3Lmpd+i4D1aClmBXhK5YBM/2He+qrr0SSuoasypQzpIqOMFXzKApOBbwDyye2
         sAUvT7H4u6OLoppIgE+5sLW44fFnhbPpqhB7aOEworpyKvo/yT8IIWxMzSj1FpRLTDuP
         /o4EMBSvFe7f1ui6MLulUFIOFIRLsyJkbmLNdsIR68Ud2GcChSnmbNPuUhSWh60lGwVv
         x/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VuCkXBxW1dxjvz/ppcM3cZl9SNGNHduYeWtg3u1bL/c=;
        b=rWE9veLPWsWZwSi4M+6mX8inQca35T7DAAZ2SLVWCA6yo4sTmr4xDHl4fGmxjKg3R6
         HCewbeG/NuAu+SC0TnJcA5hkDurG8xYyQOcx4wnD/CQQKNRiyOCdhcV4rA4hjBPjqDeE
         HEAB3lCGEmZSSz+WmhtPIAGy7BahtleDV7XkCeo896ADU/mrjo9D1uPhh5TEwsdQhnfy
         IjgHkWVsL4O5vNjbMHCJEdOyBlk/0OeN87YJC8fzK91jaqP6shsZWXIBvsvuwOnz551w
         6jGi7gmp3sgJPwnjX7wWDo2NrtnBRZrTbCo6YeyT2M5X/okn5l0XoF7+Hko2zT8dVUZZ
         bhYg==
X-Gm-Message-State: AOAM532dq+lboILXGszyly9DuIHvQhaEjC393l1MGmbImf2Xcgl9lmm8
	IkNm5GqsPU2fz+ZUu79vsqomxl4d6iPAg5CPvLU=
X-Google-Smtp-Source: ABdhPJx0ZMERoaAU6nFvb0iX7UhiIBSi3umQMWSLKccMGhg/c92Q/SobaTZD2gLapCRyJSS/jIV0qo15gW22i6d0QQ4=
X-Received: by 2002:a05:6512:3455:: with SMTP id j21mr25737443lfr.8.1629727230243;
 Mon, 23 Aug 2021 07:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210818154207.8663-1-vinay.m.engg@gmail.com> <390b071504638cca0b49d7d3f57ab94ce45e833e.camel@intel.com>
In-Reply-To: <390b071504638cca0b49d7d3f57ab94ce45e833e.camel@intel.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 23 Aug 2021 19:30:18 +0530
Message-ID: <CANUMPcVbqW3SwHZMO3X+Kwrfk=8cdcvTP7579G=BEwv4KMn5PQ@mail.gmail.com>
Subject: Re: [hardknott][PATCH] glibc: Fix CVE-2021-38604
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, "ernstp@gmail.com" <ernstp@gmail.com>, 
	"Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>, 
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,

Sent v2 patch with fix for hunk offsets.
Confirmed with below log.do_patch for both glibc and nativesdk-glibc.

glibc
======================================
$tail -f -n 9
/ala-lpggp31/vinay/cve/b2/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc/2.33-r0/temp/log.do_patch
NOTE: Applying patch 'CVE-2021-35942.patch'
(../hardknott-new/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch)
NOTE: Applying patch '0001-CVE-2021-38604.patch'
(../hardknott-new/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch)
NOTE: Applying patch '0002-CVE-2021-38604.patch'
(../hardknott-new/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch)
DEBUG: Python function patch_do_patch finished
DEBUG: Executing shell function do_fix_readlib_c
DEBUG: Shell function do_fix_readlib_c finished
DEBUG: Python function do_patch finished
DEBUG: Executing python function do_qa_patch
DEBUG: Python function do_qa_patch finished

nativesdk-glibc
======================================
$tail -f -n 9  /ala-lpggp31/vinay/cve/b2/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-glibc/2.33-r0/temp/log.do_patch
NOTE: Applying patch 'CVE-2021-35942.patch'
(../hardknott-new/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch)
NOTE: Applying patch '0001-CVE-2021-38604.patch'
(../hardknott-new/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch)
NOTE: Applying patch '0002-CVE-2021-38604.patch'
(../hardknott-new/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch)
DEBUG: Python function patch_do_patch finished
DEBUG: Executing shell function do_fix_readlib_c
DEBUG: Shell function do_fix_readlib_c finished
DEBUG: Python function do_patch finished
DEBUG: Executing python function do_qa_patch
DEBUG: Python function do_qa_patch finished

Regards,
Vinay

On Mon, Aug 23, 2021 at 1:16 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> This is giving warnings for nativesdk-glibc:
>
> Applying patch 0001-CVE-2021-38604.patch
> patching file sysdeps/unix/sysv/linux/mq_notify.c
> Hunk #1 succeeded at 132 with fuzz 1 (offset 1 line).
>
>
> Applying patch 0002-CVE-2021-38604.patch
> patching file rt/Makefile
> Hunk #1 succeeded at 44 with fuzz 1 (offset -30 lines).
> patching file rt/tst-bz28213.c
>
>
> The context lines in the patches can be updated with devtool:
>
>     devtool modify nativesdk-glibc
>     devtool finish --force-patch-refresh nativesdk-glibc <layer_path>
>
> Thanks,
>
> Anuj
>
> On Wed, 2021-08-18 at 08:42 -0700, Vinay Kumar wrote:
> > Source: https://sourceware.org/git/glibc.git
> > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28213
> >
> > Backported upstream commits b805aebd42364fe696e417808a700fdb9800c9e8
> > and 4cc79c217744743077bf7a0ec5e0a4318f1e6641
> > to glibc-2.33 source.
> >
> > Upstream-Status: Backport
> > [https://sourceware.org/git/?p=glibc.git;a=commit;h=b805aebd42364fe696e417808a700fdb9800c9e8
> > ]
> > Upstream-Status: Backport
> > [https://sourceware.org/git/?p=glibc.git;a=commit;h=4cc79c217744743077bf7a0ec5e0a4318f1e6641
> > ]
> >
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > ---
> >  .../glibc/glibc/0001-CVE-2021-38604.patch     |  43 +++++
> >  .../glibc/glibc/0002-CVE-2021-38604.patch     | 150 ++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.33.bb         |   2 +
> >  3 files changed, 195 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-
> > 38604.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-
> > 38604.patch
> >
> > diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
> > b/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
> > new file mode 100644
> > index 0000000000..1e94049004
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
> > @@ -0,0 +1,43 @@
> > +From b805aebd42364fe696e417808a700fdb9800c9e8 Mon Sep 17 00:00:00 2001
> > +From: Nikita Popov <npv1310@gmail.com>
> > +Date: Mon, 9 Aug 2021 20:17:34 +0530
> > +Subject: [PATCH] librt: fix NULL pointer dereference (bug 28213)
> > +
> > +Helper thread frees copied attribute on NOTIFY_REMOVED message
> > +received from the OS kernel.  Unfortunately, it fails to check whether
> > +copied attribute actually exists (data.attr != NULL).  This worked
> > +earlier because free() checks passed pointer before actually
> > +attempting to release corresponding memory.  But
> > +__pthread_attr_destroy assumes pointer is not NULL.
> > +
> > +So passing NULL pointer to __pthread_attr_destroy will result in
> > +segmentation fault.  This scenario is possible if
> > +notification->sigev_notify_attributes == NULL (which means default
> > +thread attributes should be used).
> > +
> > +Upstream-Status: Backport
> > [https://sourceware.org/git/?p=glibc.git;a=commit;h=b805aebd42364fe696e417808a700fdb9800c9e8
> > ]
> > +CVE: CVE-2021-38604
> > +
> > +Signed-off-by: Nikita Popov <npv1310@gmail.com>
> > +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > +---
> > + sysdeps/unix/sysv/linux/mq_notify.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/sysdeps/unix/sysv/linux/mq_notify.c
> > b/sysdeps/unix/sysv/linux/mq_notify.c
> > +index 9799dcdaa4..eccae2e4c6 100644
> > +--- a/sysdeps/unix/sysv/linux/mq_notify.c
> > ++++ b/sysdeps/unix/sysv/linux/mq_notify.c
> > +@@ -131,7 +131,7 @@ helper_thread (void *arg)
> > +              to wait until it is done with it.  */
> > +           (void) __pthread_barrier_wait (&notify_barrier);
> > +       }
> > +-      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
> > ++      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED &&
> > data.attr != NULL)
> > +       {
> > +         /* The only state we keep is the copy of the thread
> > attributes.  */
> > +         __pthread_attr_destroy (data.attr);
> > +--
> > +2.31.1
> > +
> > diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
> > b/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
> > new file mode 100644
> > index 0000000000..9f71fecddb
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
> > @@ -0,0 +1,150 @@
> > +From 4cc79c217744743077bf7a0ec5e0a4318f1e6641 Mon Sep 17 00:00:00 2001
> > +From: Nikita Popov <npv1310@gmail.com>
> > +Date: Thu, 12 Aug 2021 16:09:50 +0530
> > +Subject: [PATCH] librt: add test (bug 28213)
> > +
> > +This test implements following logic:
> > +1) Create POSIX message queue.
> > +   Register a notification with mq_notify (using NULL attributes).
> > +   Then immediately unregister the notification with mq_notify.
> > +   Helper thread in a vulnerable version of glibc
> > +   should cause NULL pointer dereference after these steps.
> > +2) Once again, register the same notification.
> > +   Try to send a dummy message.
> > +   Test is considered successfulif the dummy message
> > +   is successfully received by the callback function.
> > +
> > +Upstream-Status: Backport
> > [https://sourceware.org/git/?p=glibc.git;a=commit;h=4cc79c217744743077bf7a0ec5e0a4318f1e6641
> > ]
> > +CVE: CVE-2021-38604
> > +
> > +Signed-off-by: Nikita Popov <npv1310@gmail.com>
> > +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > +---
> > + rt/Makefile      |   1 +
> > + rt/tst-bz28213.c | 101
> > +++++++++++++++++++++++++++++++++++++++++++++++
> > + 2 files changed, 102 insertions(+)
> > + create mode 100644 rt/tst-bz28213.c
> > +
> > +diff --git a/rt/Makefile b/rt/Makefile
> > +index 113cea03a5..910e775995 100644
> > +--- a/rt/Makefile
> > ++++ b/rt/Makefile
> > +@@ -74,6 +74,7 @@ tests := tst-shm tst-timer tst-timer2 \
> > +        tst-aio7 tst-aio8 tst-aio9 tst-aio10 \
> > +        tst-mqueue1 tst-mqueue2 tst-mqueue3 tst-mqueue4 \
> > +        tst-mqueue5 tst-mqueue6 tst-mqueue7 tst-mqueue8 tst-mqueue9 \
> > ++       tst-bz28213 \
> > +        tst-timer3 tst-timer4 tst-timer5 \
> > +        tst-cpuclock2 tst-cputimer1 tst-cputimer2 tst-cputimer3 \
> > +        tst-shm-cancel \
> > +diff --git a/rt/tst-bz28213.c b/rt/tst-bz28213.c
> > +new file mode 100644
> > +index 0000000000..0c096b5a0a
> > +--- /dev/null
> > ++++ b/rt/tst-bz28213.c
> > +@@ -0,0 +1,101 @@
> > ++/* Bug 28213: test for NULL pointer dereference in mq_notify.
> > ++   Copyright (C) The GNU Toolchain Authors.
> > ++   This file is part of the GNU C Library.
> > ++
> > ++   The GNU C Library is free software; you can redistribute it and/or
> > ++   modify it under the terms of the GNU Lesser General Public
> > ++   License as published by the Free Software Foundation; either
> > ++   version 2.1 of the License, or (at your option) any later version.
> > ++
> > ++   The GNU C Library is distributed in the hope that it will be
> > useful,
> > ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > ++   Lesser General Public License for more details.
> > ++
> > ++   You should have received a copy of the GNU Lesser General Public
> > ++   License along with the GNU C Library; if not, see
> > ++   <https://www.gnu.org/licenses/>.  */
> > ++
> > ++#include <errno.h>
> > ++#include <sys/types.h>
> > ++#include <sys/stat.h>
> > ++#include <fcntl.h>
> > ++#include <unistd.h>
> > ++#include <mqueue.h>
> > ++#include <signal.h>
> > ++#include <stdlib.h>
> > ++#include <string.h>
> > ++#include <support/check.h>
> > ++
> > ++static mqd_t m = -1;
> > ++static const char msg[] = "hello";
> > ++
> > ++static void
> > ++check_bz28213_cb (union sigval sv)
> > ++{
> > ++  char buf[sizeof (msg)];
> > ++
> > ++  (void) sv;
> > ++
> > ++  TEST_VERIFY_EXIT ((size_t) mq_receive (m, buf, sizeof (buf), NULL)
> > ++                  == sizeof (buf));
> > ++  TEST_VERIFY_EXIT (memcmp (buf, msg, sizeof (buf)) == 0);
> > ++
> > ++  exit (0);
> > ++}
> > ++
> > ++static void
> > ++check_bz28213 (void)
> > ++{
> > ++  struct sigevent sev;
> > ++
> > ++  memset (&sev, '\0', sizeof (sev));
> > ++  sev.sigev_notify = SIGEV_THREAD;
> > ++  sev.sigev_notify_function = check_bz28213_cb;
> > ++
> > ++  /* Step 1: Register & unregister notifier.
> > ++     Helper thread should receive NOTIFY_REMOVED notification.
> > ++     In a vulnerable version of glibc, NULL pointer dereference
> > follows. */
> > ++  TEST_VERIFY_EXIT (mq_notify (m, &sev) == 0);
> > ++  TEST_VERIFY_EXIT (mq_notify (m, NULL) == 0);
> > ++
> > ++  /* Step 2: Once again, register notification.
> > ++     Try to send one message.
> > ++     Test is considered successful, if the callback does exit (0). */
> > ++  TEST_VERIFY_EXIT (mq_notify (m, &sev) == 0);
> > ++  TEST_VERIFY_EXIT (mq_send (m, msg, sizeof (msg), 1) == 0);
> > ++
> > ++  /* Wait... */
> > ++  pause ();
> > ++}
> > ++
> > ++static int
> > ++do_test (void)
> > ++{
> > ++  static const char m_name[] = "/bz28213_queue";
> > ++  struct mq_attr m_attr;
> > ++
> > ++  memset (&m_attr, '\0', sizeof (m_attr));
> > ++  m_attr.mq_maxmsg = 1;
> > ++  m_attr.mq_msgsize = sizeof (msg);
> > ++
> > ++  m = mq_open (m_name,
> > ++               O_RDWR | O_CREAT | O_EXCL,
> > ++               0600,
> > ++               &m_attr);
> > ++
> > ++  if (m < 0)
> > ++    {
> > ++      if (errno == ENOSYS)
> > ++        FAIL_UNSUPPORTED ("POSIX message queues are not
> > implemented\n");
> > ++      FAIL_EXIT1 ("Failed to create POSIX message queue: %m\n");
> > ++    }
> > ++
> > ++  TEST_VERIFY_EXIT (mq_unlink (m_name) == 0);
> > ++
> > ++  check_bz28213 ();
> > ++
> > ++  return 0;
> > ++}
> > ++
> > ++#include <support/test-driver.c>
> > +--
> > +2.31.1
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-
> > core/glibc/glibc_2.33.bb
> > index 7f516d2bbe..57a60cb9d8 100644
> > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > @@ -64,6 +64,8 @@ SRC_URI =
> > "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> >             file://CVE-2021-33574_1.patch \
> >             file://CVE-2021-33574_2.patch \
> >             file://CVE-2021-35942.patch \
> > +           file://0001-CVE-2021-38604.patch \
> > +           file://0002-CVE-2021-38604.patch \
> >             "
> >  S = "${WORKDIR}/git"
> >  B = "${WORKDIR}/build-${TARGET_SYS}"
>
