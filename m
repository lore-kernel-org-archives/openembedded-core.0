Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.11290.1600169933971939391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 04:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ebQFOhpD;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gr14so4597560ejb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 04:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0dtD/evPO7gWKbh/BqZcFxlsxp+YDH9x4qZKknJMl1E=;
        b=ebQFOhpDCOuqEB50WaIJp4CVpTyg1NLhn+erPAVvsgAbDOOMZn3hvtOy65LbTDFBNn
         kX4sUmv/LtwhjKlM5jS4Yvkn5DD4NuZf3IeuXT6FF/KqqSE6mHyhEYWQKSzx5/GL+Ayp
         7eNF/F3MVmkzZPBMhuBQcMlxrCy3gVrmKdDN+irYqSSkdHy4yDhUsQiN6yxkMIm92yxQ
         5/dWdq3ikysuyaq0FlFhQOOdTK9c42ANDBHu9T/9eL12vjK6UtzgdCF8FzWvYcfHdhLN
         wq6UOEM/O8yy5ffH0wBVc/Zg8I3w1UfxcuZl+74ZGoNJPk0zGnX1SCdD+xKeLcfQVkM6
         +J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0dtD/evPO7gWKbh/BqZcFxlsxp+YDH9x4qZKknJMl1E=;
        b=FJXTRMmfLKekJ3gTKaSUu6SrD/TQDO4VrYvAatje83mt/QJO5UaVndIz6PWQ1lQuHR
         F5HZAiS0p0+he6eki76xjdwgKvEXS44v+XuUJ1PCbdX2nxzSPD2hOK8V9jztZEhUsamA
         eu4wXe2eJarYWSBCpirR5detHHaKNrNn+fI/HHjMupatfLESN94LmxGPmqEr65RbANWQ
         ebWwAUWo40id5oyKWg/OOikl8Rq6gCV/f2HATzJngkK+1zm3MNLwEZLGPy5POlK408WP
         FjNWByV0gHkiQfFL+gRLytgte4SxhThqdOJ+pXeMlnpUgXy900ndxPXtkf6Z6a4GGtjd
         DLsA==
X-Gm-Message-State: AOAM532lbW0NpcRdcYp/pOxHVMQid7t5PYxqo6a5OLPWvQaQDgm1vEE9
	48f+3SiMdKXax1/ViBaI3WpQeoNfciIgP097TCI=
X-Google-Smtp-Source: ABdhPJwe6d3wTJ2KRKpXXusABTs2NJdqNa99EfAuZ9o/atUAzR2yCKKTgjZU8XPJf+56vef67fXf4b2cDYqxR+DNhkw=
X-Received: by 2002:a17:906:f747:: with SMTP id jp7mr18538584ejb.22.1600169932065;
 Tue, 15 Sep 2020 04:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
 <ced4f4ad5252bcc989f40b54341c0d7a5835bfce.1600122415.git.bruce.ashfield@gmail.com>
 <CADkTA4ON+Fh=SKKNy7EGKjjgwDzv4oCek1ufv+gf7kGRUaqj_A@mail.gmail.com> <3D4997B5-7890-447E-BC90-482B7FBF6553@gmail.com>
In-Reply-To: <3D4997B5-7890-447E-BC90-482B7FBF6553@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Sep 2020 07:37:19 -0400
Message-ID: <CADkTA4PTLUeFa+mO-s13iNVn-Efh=JbOG_57Bm=kFEi9Lw+fow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+ builds
To: Jens Rehsack <rehsack@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 1:03 AM Jens Rehsack <rehsack@gmail.com> wrote:
>
>
>
> > Am 15.09.2020 um 00:35 schrieb Bruce Ashfield <bruce.ashfield@gmail.com>:
> >
> > I squashed the other lttng patch to create this, and it looks like the
> > author is messed up and some kind of strange encoding on one of the
>
> No worries about that :)
>
> > embedded patches.
> >
> > git send email complained on the way out.
> >
> > Bruce
> >
> > On Mon, Sep 14, 2020 at 6:34 PM <bruce.ashfield@gmail.com> wrote:
> >>
> >> From: Jens Rehsack <sno@netbsd.org>
> >>
> >> Backporting the 10 patches since the lttng 2.12.2 release. We'll drop
> >> them once .3 is released, but for now, we need the fixes to build
> >> against the latest 5.4, 5.8 and 5.9 kernels.
> >>
> >> We also bump the devupstream SRCREV to pickup the same changes.
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> ---
> >> ...ndency-issue-when-building-in-tree-w.patch |  54 ++
> >> ...ce.h-into-the-mmu-sub-directory-v5.9.patch |  41 +
> >> ...Make-kvm_mmu_page-definition-and-acc.patch |  39 +
> >> ...he-length-of-per-inode-prealloc-list.patch |  84 ++
> >> ...e-via-a-block-bitmap-read-is-prefetc.patch |  63 ++
> >> ...al-of-smp_-read_barrier_depends-v5.9.patch | 391 ++++++++
> >> ...teback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch |  59 ++
> >> ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 +++
> >> ...es-for-ext4_discard_preallocations-a.patch |  52 +
> >> .../0010-Fix-system-call-filter-table.patch   | 918 ++++++++++++++++++
> >> .../lttng/lttng-modules_2.12.2.bb             |  12 +-
> >> 11 files changed, 1829 insertions(+), 1 deletion(-)

<snip>

> >> + instrumentation/events/lttng-module/writeback.h | 16 +++++++++++++++-
> >> + 1 file changed, 15 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/instrumentation/events/lttng-module/writeback.h b/instrumentation/events/lttng-module/writeback.h
> >> +index affb4eb..ece67ad 100644
> >> +--- a/instrumentation/events/lttng-module/writeback.h
> >> ++++ b/instrumentation/events/lttng-module/writeback.h
> >> +@@ -46,7 +46,21 @@ static inline struct backing_dev_info *lttng_inode_to_bdi(struct inode *inode)
> >> +
> >> + #endif
> >> +
> >> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,0,0))
> >> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0))
>
> This one is needed for 5.4.62+, too.

Yah, I realize that it should be .. but yet, my build against 5.4.65
worked fine without that version check.

I was going to crawl -stable today and figure out which commit fixed
it in the kernel tree, since I can't see how else it was fixed.

Bruce

>
> >> ++#define show_inode_state(state)                                       \
> >> ++      __print_flags(state, "|",                               \
> >> ++              {I_DIRTY_SYNC,          "I_DIRTY_SYNC"},        \
> >> ++              {I_DIRTY_DATASYNC,      "I_DIRTY_DATASYNC"},    \
> >> ++              {I_DIRTY_PAGES,         "I_DIRTY_PAGES"},       \
> >> ++              {I_NEW,                 "I_NEW"},               \
> >> ++              {I_WILL_FREE,           "I_WILL_FREE"},         \
> >> ++              {I_FREEING,             "I_FREEING"},           \
> >> ++              {I_CLEAR,               "I_CLEAR"},             \
> >> ++              {I_SYNC,                "I_SYNC"},              \
> >> ++              {I_DIRTY_TIME,          "I_DIRTY_TIME"},        \
> >> ++              {I_REFERENCED,          "I_REFERENCED"}         \
> >> ++      )
> >> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,0,0))
> >> + #define show_inode_state(state)                                       \
> >> +       __print_flags(state, "|",                               \
> >> +               {I_DIRTY_SYNC,          "I_DIRTY_SYNC"},        \
> >> +--
> >> +2.19.1
> >> +
> >> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch b/meta/recipes-kernel/lttng/lttng-modules/0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> >> new file mode 100644
> >> index 0000000000..7a0d9a38b8
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/lttng/lttng-modules/0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> >> @@ -0,0 +1,117 @@
> >> +From 87b2affc3eb06f3fb2d0923f18af37713eb6814b Mon Sep 17 00:00:00 2001
> >> +From: Michael Jeanson <mjeanson@efficios.com>
> >> +Date: Mon, 31 Aug 2020 14:16:01 -0400
> >> +Subject: [PATCH 08/10] fix: writeback: Fix sync livelock due to b_dirty_time
> >> + processing (v5.9)
> >> +
> >> +See upstream commit:
> >> +
> >> +  commit f9cae926f35e8230330f28c7b743ad088611a8de
> >> +  Author: Jan Kara <jack@suse.cz>
> >> +  Date:   Fri May 29 16:08:58 2020 +0200
> >> +
> >> +    writeback: Fix sync livelock due to b_dirty_time processing
> >> +
> >> +    When we are processing writeback for sync(2), move_expired_inodes()
> >> +    didn't set any inode expiry value (older_than_this). This can result in
> >> +    writeback never completing if there's steady stream of inodes added to
> >> +    b_dirty_time list as writeback rechecks dirty lists after each writeback
> >> +    round whether there's more work to be done. Fix the problem by using
> >> +    sync(2) start time is inode expiry value when processing b_dirty_time
> >> +    list similarly as for ordinarily dirtied inodes. This requires some
> >> +    refactoring of older_than_this handling which simplifies the code
> >> +    noticeably as a bonus.
> >> +
> >> +Upstream-Status: Backport
> >> +
> >> +Change-Id: I8b894b13ccc14d9b8983ee4c2810a927c319560b
> >> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> >> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> >> +---
> >> + .../events/lttng-module/writeback.h           | 39 ++++++++++++-------
> >> + 1 file changed, 26 insertions(+), 13 deletions(-)
> >> +
> >> +diff --git a/instrumentation/events/lttng-module/writeback.h b/instrumentation/events/lttng-module/writeback.h
> >> +index ece67ad..e9018dd 100644
> >> +--- a/instrumentation/events/lttng-module/writeback.h
> >> ++++ b/instrumentation/events/lttng-module/writeback.h
> >> +@@ -384,34 +384,48 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balance_dirty_wait, writeback_wbc_balanc
> >> + #endif
> >> + LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeback_wbc_writepage)
> >> +
> >> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> >> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0))
> >> ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> >> ++      TP_PROTO(struct bdi_writeback *wb,
> >> ++               struct wb_writeback_work *work,
> >> ++               unsigned long dirtied_before,
> >> ++               int moved),
> >> ++      TP_ARGS(wb, work, dirtied_before, moved),
> >> ++      TP_FIELDS(
> >> ++              ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> >> ++              ctf_integer(unsigned long, older, dirtied_before)
> >> ++              ctf_integer(int, moved, moved)
> >> ++      )
> >> ++)
> >> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> >> + LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> >> +       TP_PROTO(struct bdi_writeback *wb,
> >> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> >> +                struct wb_writeback_work *work,
> >> +-#else
> >> +-               unsigned long *older_than_this,
> >> +-#endif
> >> +                int moved),
> >> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> >> +       TP_ARGS(wb, work, moved),
> >> +-#else
> >> ++      TP_FIELDS(
> >> ++              ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> >> ++              ctf_integer(int, moved, moved)
> >> ++      )
> >> ++)
> >> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> >> ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> >> ++      TP_PROTO(struct bdi_writeback *wb,
> >> ++               unsigned long *older_than_this,
> >> ++               int moved),
> >> +       TP_ARGS(wb, older_than_this, moved),
> >> +-#endif
> >> +       TP_FIELDS(
> >> +               ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> >> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> >> +-#else
> >> +               ctf_integer(unsigned long, older,
> >> +                       older_than_this ? *older_than_this : 0)
> >> +               ctf_integer(long, age,
> >> +                       older_than_this ?
> >> +                               (jiffies - *older_than_this) * 1000 / HZ
> >> +                               : -1)
> >> +-#endif
> >> +               ctf_integer(int, moved, moved)
> >> +       )
> >> + )
> >> ++#endif
> >> +
> >> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,8,0))
> >> + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> >> +@@ -460,7 +474,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> >> +               ctf_integer(unsigned long, dirty_limit, global_dirty_limit)
> >> +       )
> >> + )
> >> +-#else
> >> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> >> + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> >> +
> >> +       writeback_global_dirty_state,
> >> +@@ -485,7 +499,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> >> +       )
> >> + )
> >> + #endif
> >> +-#endif
> >> +
> >> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> >> +
> >> +--
> >> +2.19.1
> >> +
> >> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-fix-version-ranges-for-ext4_discard_preallocations-a.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-fix-version-ranges-for-ext4_discard_preallocations-a.patch
> >> new file mode 100644
> >> index 0000000000..346e1d63ad
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/lttng/lttng-modules/0009-fix-version-ranges-for-ext4_discard_preallocations-a.patch
> >> @@ -0,0 +1,52 @@
> >> +From b74b25f349e92d7b5bdc8684e406d6a889f13773 Mon Sep 17 00:00:00 2001
> >> +From: Michael Jeanson <mjeanson@efficios.com>
> >> +Date: Fri, 4 Sep 2020 11:52:51 -0400
> >> +Subject: [PATCH 09/10] fix: version ranges for ext4_discard_preallocations and
> >> + writeback_queue_io
> >> +
> >> +Upstream-Status: Backport
> >> +
> >> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> >> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> >> +Change-Id: Id4fa53cb2e713cbda651e1a75deed91013115592
> >> +---
> >> + instrumentation/events/lttng-module/ext4.h      | 3 ++-
> >> + instrumentation/events/lttng-module/writeback.h | 8 +++++++-
> >> + 2 files changed, 9 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/instrumentation/events/lttng-module/ext4.h b/instrumentation/events/lttng-module/ext4.h
> >> +index 4476abb..b172c8d 100644
> >> +--- a/instrumentation/events/lttng-module/ext4.h
> >> ++++ b/instrumentation/events/lttng-module/ext4.h
> >> +@@ -460,7 +460,8 @@ LTTNG_TRACEPOINT_EVENT(ext4_mb_release_group_pa,
> >> + )
> >> + #endif
> >> +
> >> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0))
> >> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0) || \
> >> ++      LTTNG_KERNEL_RANGE(5,8,6, 5,9,0))
> >> + LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
> >> +       TP_PROTO(struct inode *inode, unsigned int len, unsigned int needed),
> >> +
> >> +diff --git a/instrumentation/events/lttng-module/writeback.h b/instrumentation/events/lttng-module/writeback.h
> >> +index e9018dd..09637d7 100644
> >> +--- a/instrumentation/events/lttng-module/writeback.h
> >> ++++ b/instrumentation/events/lttng-module/writeback.h
> >> +@@ -384,7 +384,13 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balance_dirty_wait, writeback_wbc_balanc
> >> + #endif
> >> + LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeback_wbc_writepage)
> >> +
> >> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0))
> >> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0) || \
> >> ++      LTTNG_KERNEL_RANGE(5,8,6, 5,9,0) || \
> >> ++      LTTNG_KERNEL_RANGE(5,4,62, 5,5,0) || \
> >> ++      LTTNG_KERNEL_RANGE(4,19,143, 4,20,0) || \
> >> ++      LTTNG_KERNEL_RANGE(4,14,196, 4,15,0) || \
> >> ++      LTTNG_KERNEL_RANGE(4,9,235, 4,10,0) || \
> >> ++      LTTNG_KERNEL_RANGE(4,4,235, 4,5,0))
> >> + LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> >> +       TP_PROTO(struct bdi_writeback *wb,
> >> +                struct wb_writeback_work *work,
> >> +--
> >> +2.19.1
> >> +
> >> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0010-Fix-system-call-filter-table.patch b/meta/recipes-kernel/lttng/lttng-modules/0010-Fix-system-call-filter-table.patch
> >> new file mode 100644
> >> index 0000000000..a16750ddb3
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/lttng/lttng-modules/0010-Fix-system-call-filter-table.patch
> >> @@ -0,0 +1,918 @@
> >> +From ad594e3a953db1b0c3c059fde45b5a5494f6be78 Mon Sep 17 00:00:00 2001
> >> +From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> >> +Date: Tue, 28 Jan 2020 16:02:44 -0500
> >> +Subject: [PATCH 10/10] Fix: system call filter table
> >> +
> >> +The system call filter table has effectively been unused for a long
> >> +time due to system call name prefix mismatch. This means the overhead of
> >> +selective system call tracing was larger than it should have been because
> >> +the event payload preparation would be done for all system calls as soon
> >> +as a single system call is traced.
> >> +
> >> +However, fixing this underlying issue unearths several issues that crept
> >> +unnoticed when the "enabler" concept was introduced (after the original
> >> +implementation of the system call filter table).
> >> +
> >> +Here is a list of the issues which are resolved here:
> >> +
> >> +- Split lttng_syscalls_unregister into an unregister and destroy
> >> +  function, thus awaiting for a grace period (and therefore quiescence
> >> +  of the users) after unregistering the system call tracepoints before
> >> +  freeing the system call filter data structures. This effectively fixes
> >> +  a use-after-free.
> >> +
> >> +- The state for enabling "all" system calls vs enabling specific system
> >> +  calls (and sequences of enable-disable) was incorrect with respect to
> >> +  the "enablers" semantic. This is solved by always tracking the
> >> +  bitmap of enabled system calls, and keeping this bitmap even when
> >> +  enabling all system calls. The sc_filter is now always allocated
> >> +  before system call tracing is registered to tracepoints, which means
> >> +  it does not need to be RCU dereferenced anymore.
> >> +
> >> +Padding fields in the ABI are reserved to select whether to:
> >> +
> >> +- Trace either native or compat system call (or both, which is the
> >> +  behavior currently implemented),
> >> +- Trace either system call entry or exit (or both, which is the
> >> +  behavior currently implemented),
> >> +- Select the system call to trace by name (behavior currently
> >> +  implemented) or by system call number,
> >> +
> >> +Upstream-Status: Backport
> >> +
> >> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> >> +---
> >> + lttng-abi.c      |  43 ++++++
> >> + lttng-abi.h      |  26 ++++
> >> + lttng-events.c   | 112 +++++++++++++--
> >> + lttng-events.h   |  31 ++++-
> >> + lttng-syscalls.c | 348 +++++++++++++++++++++++++----------------------
> >> + 5 files changed, 380 insertions(+), 180 deletions(-)
> >> +
> >> +diff --git a/lttng-abi.c b/lttng-abi.c
> >> +index 64ea99d..b33879d 100644
> >> +--- a/lttng-abi.c
> >> ++++ b/lttng-abi.c
> >> +@@ -1264,6 +1264,46 @@ nomem:
> >> +       return ret;
> >> + }
> >> +
> >> ++static
> >> ++int lttng_abi_validate_event_param(struct lttng_kernel_event *event_param)
> >> ++{
> >> ++      /* Limit ABI to implemented features. */
> >> ++      switch (event_param->instrumentation) {
> >> ++      case LTTNG_KERNEL_SYSCALL:
> >> ++              switch (event_param->u.syscall.entryexit) {
> >> ++              case LTTNG_KERNEL_SYSCALL_ENTRYEXIT:
> >> ++                      break;
> >> ++              default:
> >> ++                      return -EINVAL;
> >> ++              }
> >> ++              switch (event_param->u.syscall.abi) {
> >> ++              case LTTNG_KERNEL_SYSCALL_ABI_ALL:
> >> ++                      break;
> >> ++              default:
> >> ++                      return -EINVAL;
> >> ++              }
> >> ++              switch (event_param->u.syscall.match) {
> >> ++              case LTTNG_SYSCALL_MATCH_NAME:
> >> ++                      break;
> >> ++              default:
> >> ++                      return -EINVAL;
> >> ++              }
> >> ++              break;
> >> ++
> >> ++      case LTTNG_KERNEL_TRACEPOINT:   /* Fallthrough */
> >> ++      case LTTNG_KERNEL_KPROBE:       /* Fallthrough */
> >> ++      case LTTNG_KERNEL_KRETPROBE:    /* Fallthrough */
> >> ++      case LTTNG_KERNEL_NOOP:         /* Fallthrough */
> >> ++      case LTTNG_KERNEL_UPROBE:
> >> ++              break;
> >> ++
> >> ++      case LTTNG_KERNEL_FUNCTION:     /* Fallthrough */
> >> ++      default:
> >> ++              return -EINVAL;
> >> ++      }
> >> ++      return 0;
> >> ++}
> >> ++
> >> + static
> >> + int lttng_abi_create_event(struct file *channel_file,
> >> +                          struct lttng_kernel_event *event_param)
> >> +@@ -1305,6 +1345,9 @@ int lttng_abi_create_event(struct file *channel_file,
> >> +               ret = -EOVERFLOW;
> >> +               goto refcount_error;
> >> +       }
> >> ++      ret = lttng_abi_validate_event_param(event_param);
> >> ++      if (ret)
> >> ++              goto event_error;
> >> +       if (event_param->instrumentation == LTTNG_KERNEL_TRACEPOINT
> >> +                       || event_param->instrumentation == LTTNG_KERNEL_SYSCALL) {
> >> +               struct lttng_enabler *enabler;
> >> +diff --git a/lttng-abi.h b/lttng-abi.h
> >> +index 1d356ab..51d60e5 100644
> >> +--- a/lttng-abi.h
> >> ++++ b/lttng-abi.h
> >> +@@ -90,6 +90,31 @@ struct lttng_kernel_event_callsite {
> >> +       } u;
> >> + } __attribute__((packed));
> >> +
> >> ++enum lttng_kernel_syscall_entryexit {
> >> ++      LTTNG_KERNEL_SYSCALL_ENTRYEXIT = 0,
> >> ++      LTTNG_KERNEL_SYSCALL_ENTRY = 1,         /* Not implemented. */
> >> ++      LTTNG_KERNEL_SYSCALL_EXIT = 2,          /* Not implemented. */
> >> ++};
> >> ++
> >> ++enum lttng_kernel_syscall_abi {
> >> ++      LTTNG_KERNEL_SYSCALL_ABI_ALL = 0,
> >> ++      LTTNG_KERNEL_SYSCALL_ABI_NATIVE = 1,    /* Not implemented. */
> >> ++      LTTNG_KERNEL_SYSCALL_ABI_COMPAT = 2,    /* Not implemented. */
> >> ++};
> >> ++
> >> ++enum lttng_kernel_syscall_match {
> >> ++      LTTNG_SYSCALL_MATCH_NAME = 0,
> >> ++      LTTNG_SYSCALL_MATCH_NR = 1,             /* Not implemented. */
> >> ++};
> >> ++
> >> ++struct lttng_kernel_syscall {
> >> ++      uint8_t entryexit;      /* enum lttng_kernel_syscall_entryexit */
> >> ++      uint8_t abi;            /* enum lttng_kernel_syscall_abi */
> >> ++      uint8_t match;          /* enum lttng_kernel_syscall_match */
> >> ++      uint8_t padding;
> >> ++      uint32_t nr;            /* For LTTNG_SYSCALL_MATCH_NR */
> >> ++} __attribute__((packed));
> >> ++
> >> + /*
> >> +  * For syscall tracing, name = "*" means "enable all".
> >> +  */
> >> +@@ -106,6 +131,7 @@ struct lttng_kernel_event {
> >> +               struct lttng_kernel_kprobe kprobe;
> >> +               struct lttng_kernel_function_tracer ftrace;
> >> +               struct lttng_kernel_uprobe uprobe;
> >> ++              struct lttng_kernel_syscall syscall;
> >> +               char padding[LTTNG_KERNEL_EVENT_PADDING2];
> >> +       } u;
> >> + } __attribute__((packed));
> >> +diff --git a/lttng-events.c b/lttng-events.c
> >> +index d719294..4c0b04a 100644
> >> +--- a/lttng-events.c
> >> ++++ b/lttng-events.c
> >> +@@ -201,6 +201,10 @@ void lttng_session_destroy(struct lttng_session *session)
> >> +               WARN_ON(ret);
> >> +       }
> >> +       synchronize_trace();    /* Wait for in-flight events to complete */
> >> ++      list_for_each_entry(chan, &session->chan, list) {
> >> ++              ret = lttng_syscalls_destroy(chan);
> >> ++              WARN_ON(ret);
> >> ++      }
> >> +       list_for_each_entry_safe(enabler, tmpenabler,
> >> +                       &session->enablers_head, node)
> >> +               lttng_enabler_destroy(enabler);
> >> +@@ -740,6 +744,28 @@ struct lttng_event *_lttng_event_create(struct lttng_channel *chan,
> >> +               event->enabled = 0;
> >> +               event->registered = 0;
> >> +               event->desc = event_desc;
> >> ++              switch (event_param->u.syscall.entryexit) {
> >> ++              case LTTNG_KERNEL_SYSCALL_ENTRYEXIT:
> >> ++                      ret = -EINVAL;
> >> ++                      goto register_error;
> >> ++              case LTTNG_KERNEL_SYSCALL_ENTRY:
> >> ++                      event->u.syscall.entryexit = LTTNG_SYSCALL_ENTRY;
> >> ++                      break;
> >> ++              case LTTNG_KERNEL_SYSCALL_EXIT:
> >> ++                      event->u.syscall.entryexit = LTTNG_SYSCALL_EXIT;
> >> ++                      break;
> >> ++              }
> >> ++              switch (event_param->u.syscall.abi) {
> >> ++              case LTTNG_KERNEL_SYSCALL_ABI_ALL:
> >> ++                      ret = -EINVAL;
> >> ++                      goto register_error;
> >> ++              case LTTNG_KERNEL_SYSCALL_ABI_NATIVE:
> >> ++                      event->u.syscall.abi = LTTNG_SYSCALL_ABI_NATIVE;
> >> ++                      break;
> >> ++              case LTTNG_KERNEL_SYSCALL_ABI_COMPAT:
> >> ++                      event->u.syscall.abi = LTTNG_SYSCALL_ABI_COMPAT;
> >> ++                      break;
> >> ++              }
> >> +               if (!event->desc) {
> >> +                       ret = -EINVAL;
> >> +                       goto register_error;
> >> +@@ -826,8 +852,7 @@ void register_event(struct lttng_event *event)
> >> +                                                 event);
> >> +               break;
> >> +       case LTTNG_KERNEL_SYSCALL:
> >> +-              ret = lttng_syscall_filter_enable(event->chan,
> >> +-                      desc->name);
> >> ++              ret = lttng_syscall_filter_enable(event->chan, event);
> >> +               break;
> >> +       case LTTNG_KERNEL_KPROBE:
> >> +       case LTTNG_KERNEL_UPROBE:
> >> +@@ -870,8 +895,7 @@ int _lttng_event_unregister(struct lttng_event *event)
> >> +               ret = 0;
> >> +               break;
> >> +       case LTTNG_KERNEL_SYSCALL:
> >> +-              ret = lttng_syscall_filter_disable(event->chan,
> >> +-                      desc->name);
> >> ++              ret = lttng_syscall_filter_disable(event->chan, event);
> >> +               break;
> >> +       case LTTNG_KERNEL_NOOP:
> >> +               ret = 0;
> >> +@@ -1203,39 +1227,87 @@ int lttng_desc_match_enabler(const struct lttng_event_desc *desc,
> >> +               struct lttng_enabler *enabler)
> >> + {
> >> +       const char *desc_name, *enabler_name;
> >> ++      bool compat = false, entry = false;
> >> +
> >> +       enabler_name = enabler->event_param.name;
> >> +       switch (enabler->event_param.instrumentation) {
> >> +       case LTTNG_KERNEL_TRACEPOINT:
> >> +               desc_name = desc->name;
> >> ++              switch (enabler->type) {
> >> ++              case LTTNG_ENABLER_STAR_GLOB:
> >> ++                      return lttng_match_enabler_star_glob(desc_name, enabler_name);
> >> ++              case LTTNG_ENABLER_NAME:
> >> ++                      return lttng_match_enabler_name(desc_name, enabler_name);
> >> ++              default:
> >> ++                      return -EINVAL;
> >> ++              }
> >> +               break;
> >> +       case LTTNG_KERNEL_SYSCALL:
> >> +               desc_name = desc->name;
> >> +-              if (!strncmp(desc_name, "compat_", strlen("compat_")))
> >> ++              if (!strncmp(desc_name, "compat_", strlen("compat_"))) {
> >> +                       desc_name += strlen("compat_");
> >> ++                      compat = true;
> >> ++              }
> >> +               if (!strncmp(desc_name, "syscall_exit_",
> >> +                               strlen("syscall_exit_"))) {
> >> +                       desc_name += strlen("syscall_exit_");
> >> +               } else if (!strncmp(desc_name, "syscall_entry_",
> >> +                               strlen("syscall_entry_"))) {
> >> +                       desc_name += strlen("syscall_entry_");
> >> ++                      entry = true;
> >> +               } else {
> >> +                       WARN_ON_ONCE(1);
> >> +                       return -EINVAL;
> >> +               }
> >> ++              switch (enabler->event_param.u.syscall.entryexit) {
> >> ++              case LTTNG_KERNEL_SYSCALL_ENTRYEXIT:
> >> ++                      break;
> >> ++              case LTTNG_KERNEL_SYSCALL_ENTRY:
> >> ++                      if (!entry)
> >> ++                              return 0;
> >> ++                      break;
> >> ++              case LTTNG_KERNEL_SYSCALL_EXIT:
> >> ++                      if (entry)
> >> ++                              return 0;
> >> ++                      break;
> >> ++              default:
> >> ++                      return -EINVAL;
> >> ++              }
> >> ++              switch (enabler->event_param.u.syscall.abi) {
> >> ++              case LTTNG_KERNEL_SYSCALL_ABI_ALL:
> >> ++                      break;
> >> ++              case LTTNG_KERNEL_SYSCALL_ABI_NATIVE:
> >> ++                      if (compat)
> >> ++                              return 0;
> >> ++                      break;
> >> ++              case LTTNG_KERNEL_SYSCALL_ABI_COMPAT:
> >> ++                      if (!compat)
> >> ++                              return 0;
> >> ++                      break;
> >> ++              default:
> >> ++                      return -EINVAL;
> >> ++              }
> >> ++              switch (enabler->event_param.u.syscall.match) {
> >> ++              case LTTNG_SYSCALL_MATCH_NAME:
> >> ++                      switch (enabler->type) {
> >> ++                      case LTTNG_ENABLER_STAR_GLOB:
> >> ++                              return lttng_match_enabler_star_glob(desc_name, enabler_name);
> >> ++                      case LTTNG_ENABLER_NAME:
> >> ++                              return lttng_match_enabler_name(desc_name, enabler_name);
> >> ++                      default:
> >> ++                              return -EINVAL;
> >> ++                      }
> >> ++                      break;
> >> ++              case LTTNG_SYSCALL_MATCH_NR:
> >> ++                      return -EINVAL; /* Not implemented. */
> >> ++              default:
> >> ++                      return -EINVAL;
> >> ++              }
> >> +               break;
> >> +       default:
> >> +               WARN_ON_ONCE(1);
> >> +               return -EINVAL;
> >> +       }
> >> +-      switch (enabler->type) {
> >> +-      case LTTNG_ENABLER_STAR_GLOB:
> >> +-              return lttng_match_enabler_star_glob(desc_name, enabler_name);
> >> +-      case LTTNG_ENABLER_NAME:
> >> +-              return lttng_match_enabler_name(desc_name, enabler_name);
> >> +-      default:
> >> +-              return -EINVAL;
> >> +-      }
> >> + }
> >> +
> >> + static
> >> +@@ -1361,9 +1433,21 @@ void lttng_create_event_if_missing(struct lttng_enabler *enabler)
> >> + static
> >> + int lttng_enabler_ref_events(struct lttng_enabler *enabler)
> >> + {
> >> +-      struct lttng_session *session = enabler->chan->session;
> >> ++      struct lttng_channel *chan = enabler->chan;
> >> ++      struct lttng_session *session = chan->session;
> >> +       struct lttng_event *event;
> >> +
> >> ++      if (enabler->event_param.instrumentation == LTTNG_KERNEL_SYSCALL &&
> >> ++                      enabler->event_param.u.syscall.entryexit == LTTNG_KERNEL_SYSCALL_ENTRYEXIT &&
> >> ++                      enabler->event_param.u.syscall.abi == LTTNG_KERNEL_SYSCALL_ABI_ALL &&
> >> ++                      enabler->event_param.u.syscall.match == LTTNG_SYSCALL_MATCH_NAME &&
> >> ++                      !strcmp(enabler->event_param.name, "*")) {
> >> ++              if (enabler->enabled)
> >> ++                      WRITE_ONCE(chan->syscall_all, 1);
> >> ++              else
> >> ++                      WRITE_ONCE(chan->syscall_all, 0);
> >> ++      }
> >> ++
> >> +       /* First ensure that probe events are created for this enabler. */
> >> +       lttng_create_event_if_missing(enabler);
> >> +
> >> +diff --git a/lttng-events.h b/lttng-events.h
> >> +index a36a312..d4d9976 100644
> >> +--- a/lttng-events.h
> >> ++++ b/lttng-events.h
> >> +@@ -292,6 +292,16 @@ struct lttng_uprobe_handler {
> >> +       struct list_head node;
> >> + };
> >> +
> >> ++enum lttng_syscall_entryexit {
> >> ++      LTTNG_SYSCALL_ENTRY,
> >> ++      LTTNG_SYSCALL_EXIT,
> >> ++};
> >> ++
> >> ++enum lttng_syscall_abi {
> >> ++      LTTNG_SYSCALL_ABI_NATIVE,
> >> ++      LTTNG_SYSCALL_ABI_COMPAT,
> >> ++};
> >> ++
> >> + /*
> >> +  * lttng_event structure is referred to by the tracing fast path. It must be
> >> +  * kept small.
> >> +@@ -318,6 +328,11 @@ struct lttng_event {
> >> +                       struct inode *inode;
> >> +                       struct list_head head;
> >> +               } uprobe;
> >> ++              struct {
> >> ++                      char *syscall_name;
> >> ++                      enum lttng_syscall_entryexit entryexit;
> >> ++                      enum lttng_syscall_abi abi;
> >> ++              } syscall;
> >> +       } u;
> >> +       struct list_head list;          /* Event list in session */
> >> +       unsigned int metadata_dumped:1;
> >> +@@ -457,10 +472,10 @@ struct lttng_channel {
> >> +       struct lttng_syscall_filter *sc_filter;
> >> +       int header_type;                /* 0: unset, 1: compact, 2: large */
> >> +       enum channel_type channel_type;
> >> ++      int syscall_all;
> >> +       unsigned int metadata_dumped:1,
> >> +               sys_enter_registered:1,
> >> +               sys_exit_registered:1,
> >> +-              syscall_all:1,
> >> +               tstate:1;               /* Transient enable state */
> >> + };
> >> +
> >> +@@ -653,10 +668,11 @@ void lttng_clock_unref(void);
> >> + #if defined(CONFIG_HAVE_SYSCALL_TRACEPOINTS)
> >> + int lttng_syscalls_register(struct lttng_channel *chan, void *filter);
> >> + int lttng_syscalls_unregister(struct lttng_channel *chan);
> >> ++int lttng_syscalls_destroy(struct lttng_channel *chan);
> >> + int lttng_syscall_filter_enable(struct lttng_channel *chan,
> >> +-              const char *name);
> >> ++              struct lttng_event *event);
> >> + int lttng_syscall_filter_disable(struct lttng_channel *chan,
> >> +-              const char *name);
> >> ++              struct lttng_event *event);
> >> + long lttng_channel_syscall_mask(struct lttng_channel *channel,
> >> +               struct lttng_kernel_syscall_mask __user *usyscall_mask);
> >> + #else
> >> +@@ -670,14 +686,19 @@ static inline int lttng_syscalls_unregister(struct lttng_channel *chan)
> >> +       return 0;
> >> + }
> >> +
> >> ++static inline int lttng_syscalls_destroy(struct lttng_channel *chan)
> >> ++{
> >> ++      return 0;
> >> ++}
> >> ++
> >> + static inline int lttng_syscall_filter_enable(struct lttng_channel *chan,
> >> +-              const char *name)
> >> ++              struct lttng_event *event);
> >> + {
> >> +       return -ENOSYS;
> >> + }
> >> +
> >> + static inline int lttng_syscall_filter_disable(struct lttng_channel *chan,
> >> +-              const char *name)
> >> ++              struct lttng_event *event);
> >> + {
> >> +       return -ENOSYS;
> >> + }
> >> +diff --git a/lttng-syscalls.c b/lttng-syscalls.c
> >> +index 97f1ba9..26cead6 100644
> >> +--- a/lttng-syscalls.c
> >> ++++ b/lttng-syscalls.c
> >> +@@ -367,8 +367,10 @@ const struct trace_syscall_entry compat_sc_exit_table[] = {
> >> + #undef CREATE_SYSCALL_TABLE
> >> +
> >> + struct lttng_syscall_filter {
> >> +-      DECLARE_BITMAP(sc, NR_syscalls);
> >> +-      DECLARE_BITMAP(sc_compat, NR_compat_syscalls);
> >> ++      DECLARE_BITMAP(sc_entry, NR_syscalls);
> >> ++      DECLARE_BITMAP(sc_exit, NR_syscalls);
> >> ++      DECLARE_BITMAP(sc_compat_entry, NR_compat_syscalls);
> >> ++      DECLARE_BITMAP(sc_compat_exit, NR_compat_syscalls);
> >> + };
> >> +
> >> + static void syscall_entry_unknown(struct lttng_event *event,
> >> +@@ -391,29 +393,23 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
> >> +       size_t table_len;
> >> +
> >> +       if (unlikely(in_compat_syscall())) {
> >> +-              struct lttng_syscall_filter *filter;
> >> +-
> >> +-              filter = lttng_rcu_dereference(chan->sc_filter);
> >> +-              if (filter) {
> >> +-                      if (id < 0 || id >= NR_compat_syscalls
> >> +-                              || !test_bit(id, filter->sc_compat)) {
> >> +-                              /* System call filtered out. */
> >> +-                              return;
> >> +-                      }
> >> ++              struct lttng_syscall_filter *filter = chan->sc_filter;
> >> ++
> >> ++              if (id < 0 || id >= NR_compat_syscalls
> >> ++                      || (!READ_ONCE(chan->syscall_all) && !test_bit(id, filter->sc_compat_entry))) {
> >> ++                      /* System call filtered out. */
> >> ++                      return;
> >> +               }
> >> +               table = compat_sc_table;
> >> +               table_len = ARRAY_SIZE(compat_sc_table);
> >> +               unknown_event = chan->sc_compat_unknown;
> >> +       } else {
> >> +-              struct lttng_syscall_filter *filter;
> >> +-
> >> +-              filter = lttng_rcu_dereference(chan->sc_filter);
> >> +-              if (filter) {
> >> +-                      if (id < 0 || id >= NR_syscalls
> >> +-                              || !test_bit(id, filter->sc)) {
> >> +-                              /* System call filtered out. */
> >> +-                              return;
> >> +-                      }
> >> ++              struct lttng_syscall_filter *filter = chan->sc_filter;
> >> ++
> >> ++              if (id < 0 || id >= NR_syscalls
> >> ++                      || (!READ_ONCE(chan->syscall_all) && !test_bit(id, filter->sc_entry))) {
> >> ++                      /* System call filtered out. */
> >> ++                      return;
> >> +               }
> >> +               table = sc_table;
> >> +               table_len = ARRAY_SIZE(sc_table);
> >> +@@ -545,29 +541,23 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
> >> +
> >> +       id = syscall_get_nr(current, regs);
> >> +       if (unlikely(in_compat_syscall())) {
> >> +-              struct lttng_syscall_filter *filter;
> >> +-
> >> +-              filter = lttng_rcu_dereference(chan->sc_filter);
> >> +-              if (filter) {
> >> +-                      if (id < 0 || id >= NR_compat_syscalls
> >> +-                              || !test_bit(id, filter->sc_compat)) {
> >> +-                              /* System call filtered out. */
> >> +-                              return;
> >> +-                      }
> >> ++              struct lttng_syscall_filter *filter = chan->sc_filter;
> >> ++
> >> ++              if (id < 0 || id >= NR_compat_syscalls
> >> ++                      || (!READ_ONCE(chan->syscall_all) && !test_bit(id, filter->sc_compat_exit))) {
> >> ++                      /* System call filtered out. */
> >> ++                      return;
> >> +               }
> >> +               table = compat_sc_exit_table;
> >> +               table_len = ARRAY_SIZE(compat_sc_exit_table);
> >> +               unknown_event = chan->compat_sc_exit_unknown;
> >> +       } else {
> >> +-              struct lttng_syscall_filter *filter;
> >> +-
> >> +-              filter = lttng_rcu_dereference(chan->sc_filter);
> >> +-              if (filter) {
> >> +-                      if (id < 0 || id >= NR_syscalls
> >> +-                              || !test_bit(id, filter->sc)) {
> >> +-                              /* System call filtered out. */
> >> +-                              return;
> >> +-                      }
> >> ++              struct lttng_syscall_filter *filter = chan->sc_filter;
> >> ++
> >> ++              if (id < 0 || id >= NR_syscalls
> >> ++                      || (!READ_ONCE(chan->syscall_all) && !test_bit(id, filter->sc_exit))) {
> >> ++                      /* System call filtered out. */
> >> ++                      return;
> >> +               }
> >> +               table = sc_exit_table;
> >> +               table_len = ARRAY_SIZE(sc_exit_table);
> >> +@@ -713,27 +703,23 @@ int fill_table(const struct trace_syscall_entry *table, size_t table_len,
> >> +               memset(&ev, 0, sizeof(ev));
> >> +               switch (type) {
> >> +               case SC_TYPE_ENTRY:
> >> +-                      strncpy(ev.name, SYSCALL_ENTRY_STR,
> >> +-                              LTTNG_KERNEL_SYM_NAME_LEN);
> >> ++                      ev.u.syscall.entryexit = LTTNG_KERNEL_SYSCALL_ENTRY;
> >> ++                      ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_NATIVE;
> >> +                       break;
> >> +               case SC_TYPE_EXIT:
> >> +-                      strncpy(ev.name, SYSCALL_EXIT_STR,
> >> +-                              LTTNG_KERNEL_SYM_NAME_LEN);
> >> ++                      ev.u.syscall.entryexit = LTTNG_KERNEL_SYSCALL_EXIT;
> >> ++                      ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_NATIVE;
> >> +                       break;
> >> +               case SC_TYPE_COMPAT_ENTRY:
> >> +-                      strncpy(ev.name, COMPAT_SYSCALL_ENTRY_STR,
> >> +-                              LTTNG_KERNEL_SYM_NAME_LEN);
> >> ++                      ev.u.syscall.entryexit = LTTNG_KERNEL_SYSCALL_ENTRY;
> >> ++                      ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_COMPAT;
> >> +                       break;
> >> +               case SC_TYPE_COMPAT_EXIT:
> >> +-                      strncpy(ev.name, COMPAT_SYSCALL_EXIT_STR,
> >> +-                              LTTNG_KERNEL_SYM_NAME_LEN);
> >> +-                      break;
> >> +-              default:
> >> +-                      BUG_ON(1);
> >> ++                      ev.u.syscall.entryexit = LTTNG_KERNEL_SYSCALL_EXIT;
> >> ++                      ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_COMPAT;
> >> +                       break;
> >> +               }
> >> +-              strncat(ev.name, desc->name,
> >> +-                      LTTNG_KERNEL_SYM_NAME_LEN - strlen(ev.name) - 1);
> >> ++              strncpy(ev.name, desc->name, LTTNG_KERNEL_SYM_NAME_LEN);
> >> +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] = '\0';
> >> +               ev.instrumentation = LTTNG_KERNEL_SYSCALL;
> >> +               chan_table[i] = _lttng_event_create(chan, &ev, filter,
> >> +@@ -803,6 +789,8 @@ int lttng_syscalls_register(struct lttng_channel *chan, void *filter)
> >> +               strncpy(ev.name, desc->name, LTTNG_KERNEL_SYM_NAME_LEN);
> >> +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] = '\0';
> >> +               ev.instrumentation = LTTNG_KERNEL_SYSCALL;
> >> ++              ev.u.syscall.entryexit = LTTNG_KERNEL_SYSCALL_ENTRY;
> >> ++              ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_NATIVE;
> >> +               chan->sc_unknown = _lttng_event_create(chan, &ev, filter,
> >> +                                               desc,
> >> +                                               ev.instrumentation);
> >> +@@ -820,6 +808,8 @@ int lttng_syscalls_register(struct lttng_channel *chan, void *filter)
> >> +               strncpy(ev.name, desc->name, LTTNG_KERNEL_SYM_NAME_LEN);
> >> +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] = '\0';
> >> +               ev.instrumentation = LTTNG_KERNEL_SYSCALL;
> >> ++              ev.u.syscall.entryexit = LTTNG_KERNEL_SYSCALL_ENTRY;
> >> ++              ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_COMPAT;
> >> +               chan->sc_compat_unknown = _lttng_event_create(chan, &ev, filter,
> >> +                                               desc,
> >> +                                               ev.instrumentation);
> >> +@@ -837,6 +827,8 @@ int lttng_syscalls_register(struct lttng_channel *chan, void *filter)
> >> +               strncpy(ev.name, desc->name, LTTNG_KERNEL_SYM_NAME_LEN);
> >> +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] = '\0';
> >> +               ev.instrumentation = LTTNG_KERNEL_SYSCALL;
> >> ++              ev.u.syscall.entryexit = LTTNG_KERNEL_SYSCALL_EXIT;
> >> ++              ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_COMPAT;
> >> +               chan->compat_sc_exit_unknown = _lttng_event_create(chan, &ev,
> >> +                                               filter, desc,
> >> +                                               ev.instrumentation);
> >> +@@ -854,6 +846,8 @@ int lttng_syscalls_register(struct lttng_channel *chan, void *filter)
> >> +               strncpy(ev.name, desc->name, LTTNG_KERNEL_SYM_NAME_LEN);
> >> +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] = '\0';
> >> +               ev.instrumentation = LTTNG_KERNEL_SYSCALL;
> >> ++              ev.u.syscall.entryexit = LTTNG_KERNEL_SYSCALL_EXIT;
> >> ++              ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_NATIVE;
> >> +               chan->sc_exit_unknown = _lttng_event_create(chan, &ev, filter,
> >> +                                               desc, ev.instrumentation);
> >> +               WARN_ON_ONCE(!chan->sc_exit_unknown);
> >> +@@ -883,6 +877,14 @@ int lttng_syscalls_register(struct lttng_channel *chan, void *filter)
> >> +       if (ret)
> >> +               return ret;
> >> + #endif
> >> ++
> >> ++      if (!chan->sc_filter) {
> >> ++              chan->sc_filter = kzalloc(sizeof(struct lttng_syscall_filter),
> >> ++                              GFP_KERNEL);
> >> ++              if (!chan->sc_filter)
> >> ++                      return -ENOMEM;
> >> ++      }
> >> ++
> >> +       if (!chan->sys_enter_registered) {
> >> +               ret = lttng_wrapper_tracepoint_probe_register("sys_enter",
> >> +                               (void *) syscall_entry_probe, chan);
> >> +@@ -930,7 +932,11 @@ int lttng_syscalls_unregister(struct lttng_channel *chan)
> >> +                       return ret;
> >> +               chan->sys_exit_registered = 0;
> >> +       }
> >> +-      /* lttng_event destroy will be performed by lttng_session_destroy() */
> >> ++      return 0;
> >> ++}
> >> ++
> >> ++int lttng_syscalls_destroy(struct lttng_channel *chan)
> >> ++{
> >> +       kfree(chan->sc_table);
> >> +       kfree(chan->sc_exit_table);
> >> + #ifdef CONFIG_COMPAT
> >> +@@ -993,136 +999,150 @@ uint32_t get_sc_tables_len(void)
> >> +       return ARRAY_SIZE(sc_table) + ARRAY_SIZE(compat_sc_table);
> >> + }
> >> +
> >> +-int lttng_syscall_filter_enable(struct lttng_channel *chan,
> >> +-              const char *name)
> >> ++static
> >> ++const char *get_syscall_name(struct lttng_event *event)
> >> + {
> >> +-      int syscall_nr, compat_syscall_nr, ret;
> >> +-      struct lttng_syscall_filter *filter;
> >> ++      size_t prefix_len = 0;
> >> +
> >> +-      WARN_ON_ONCE(!chan->sc_table);
> >> ++      WARN_ON_ONCE(event->instrumentation != LTTNG_KERNEL_SYSCALL);
> >> +
> >> +-      if (!name) {
> >> +-              /* Enable all system calls by removing filter */
> >> +-              if (chan->sc_filter) {
> >> +-                      filter = chan->sc_filter;
> >> +-                      rcu_assign_pointer(chan->sc_filter, NULL);
> >> +-                      synchronize_trace();
> >> +-                      kfree(filter);
> >> ++      switch (event->u.syscall.entryexit) {
> >> ++      case LTTNG_SYSCALL_ENTRY:
> >> ++              switch (event->u.syscall.abi) {
> >> ++              case LTTNG_SYSCALL_ABI_NATIVE:
> >> ++                      prefix_len = strlen(SYSCALL_ENTRY_STR);
> >> ++                      break;
> >> ++              case LTTNG_SYSCALL_ABI_COMPAT:
> >> ++                      prefix_len = strlen(COMPAT_SYSCALL_ENTRY_STR);
> >> ++                      break;
> >> +               }
> >> +-              chan->syscall_all = 1;
> >> +-              return 0;
> >> +-      }
> >> +-
> >> +-      if (!chan->sc_filter) {
> >> +-              if (chan->syscall_all) {
> >> +-                      /*
> >> +-                       * All syscalls are already enabled.
> >> +-                       */
> >> +-                      return -EEXIST;
> >> ++              break;
> >> ++      case LTTNG_SYSCALL_EXIT:
> >> ++              switch (event->u.syscall.abi) {
> >> ++              case LTTNG_SYSCALL_ABI_NATIVE:
> >> ++                      prefix_len = strlen(SYSCALL_EXIT_STR);
> >> ++                      break;
> >> ++              case LTTNG_SYSCALL_ABI_COMPAT:
> >> ++                      prefix_len = strlen(COMPAT_SYSCALL_EXIT_STR);
> >> ++                      break;
> >> +               }
> >> +-              filter = kzalloc(sizeof(struct lttng_syscall_filter),
> >> +-                              GFP_KERNEL);
> >> +-              if (!filter)
> >> +-                      return -ENOMEM;
> >> +-      } else {
> >> +-              filter = chan->sc_filter;
> >> ++              break;
> >> +       }
> >> +-      syscall_nr = get_syscall_nr(name);
> >> +-      compat_syscall_nr = get_compat_syscall_nr(name);
> >> +-      if (syscall_nr < 0 && compat_syscall_nr < 0) {
> >> +-              ret = -ENOENT;
> >> +-              goto error;
> >> ++      WARN_ON_ONCE(prefix_len == 0);
> >> ++      return event->desc->name + prefix_len;
> >> ++}
> >> ++
> >> ++int lttng_syscall_filter_enable(struct lttng_channel *chan,
> >> ++              struct lttng_event *event)
> >> ++{
> >> ++      struct lttng_syscall_filter *filter = chan->sc_filter;
> >> ++      const char *syscall_name;
> >> ++      unsigned long *bitmap;
> >> ++      int syscall_nr;
> >> ++
> >> ++      WARN_ON_ONCE(!chan->sc_table);
> >> ++
> >> ++      syscall_name = get_syscall_name(event);
> >> ++
> >> ++      switch (event->u.syscall.abi) {
> >> ++      case LTTNG_SYSCALL_ABI_NATIVE:
> >> ++              syscall_nr = get_syscall_nr(syscall_name);
> >> ++              break;
> >> ++      case LTTNG_SYSCALL_ABI_COMPAT:
> >> ++              syscall_nr = get_compat_syscall_nr(syscall_name);
> >> ++              break;
> >> ++      default:
> >> ++              return -EINVAL;
> >> +       }
> >> +-      if (syscall_nr >= 0) {
> >> +-              if (test_bit(syscall_nr, filter->sc)) {
> >> +-                      ret = -EEXIST;
> >> +-                      goto error;
> >> ++      if (syscall_nr < 0)
> >> ++              return -ENOENT;
> >> ++
> >> ++
> >> ++      switch (event->u.syscall.entryexit) {
> >> ++      case LTTNG_SYSCALL_ENTRY:
> >> ++              switch (event->u.syscall.abi) {
> >> ++              case LTTNG_SYSCALL_ABI_NATIVE:
> >> ++                      bitmap = filter->sc_entry;
> >> ++                      break;
> >> ++              case LTTNG_SYSCALL_ABI_COMPAT:
> >> ++                      bitmap = filter->sc_compat_entry;
> >> ++                      break;
> >> +               }
> >> +-              bitmap_set(filter->sc, syscall_nr, 1);
> >> +-      }
> >> +-      if (compat_syscall_nr >= 0) {
> >> +-              if (test_bit(compat_syscall_nr, filter->sc_compat)) {
> >> +-                      ret = -EEXIST;
> >> +-                      goto error;
> >> ++              break;
> >> ++      case LTTNG_SYSCALL_EXIT:
> >> ++              switch (event->u.syscall.abi) {
> >> ++              case LTTNG_SYSCALL_ABI_NATIVE:
> >> ++                      bitmap = filter->sc_exit;
> >> ++                      break;
> >> ++              case LTTNG_SYSCALL_ABI_COMPAT:
> >> ++                      bitmap = filter->sc_compat_exit;
> >> ++                      break;
> >> +               }
> >> +-              bitmap_set(filter->sc_compat, compat_syscall_nr, 1);
> >> ++              break;
> >> ++      default:
> >> ++              return -EINVAL;
> >> +       }
> >> +-      if (!chan->sc_filter)
> >> +-              rcu_assign_pointer(chan->sc_filter, filter);
> >> ++      if (test_bit(syscall_nr, bitmap))
> >> ++              return -EEXIST;
> >> ++      bitmap_set(bitmap, syscall_nr, 1);
> >> +       return 0;
> >> +-
> >> +-error:
> >> +-      if (!chan->sc_filter)
> >> +-              kfree(filter);
> >> +-      return ret;
> >> + }
> >> +
> >> + int lttng_syscall_filter_disable(struct lttng_channel *chan,
> >> +-              const char *name)
> >> ++              struct lttng_event *event)
> >> + {
> >> +-      int syscall_nr, compat_syscall_nr, ret;
> >> +-      struct lttng_syscall_filter *filter;
> >> ++      struct lttng_syscall_filter *filter = chan->sc_filter;
> >> ++      const char *syscall_name;
> >> ++      unsigned long *bitmap;
> >> ++      int syscall_nr;
> >> +
> >> +       WARN_ON_ONCE(!chan->sc_table);
> >> +
> >> +-      if (!chan->sc_filter) {
> >> +-              if (!chan->syscall_all)
> >> +-                      return -EEXIST;
> >> +-              filter = kzalloc(sizeof(struct lttng_syscall_filter),
> >> +-                              GFP_KERNEL);
> >> +-              if (!filter)
> >> +-                      return -ENOMEM;
> >> +-              /* Trace all system calls, then apply disable. */
> >> +-              bitmap_set(filter->sc, 0, NR_syscalls);
> >> +-              bitmap_set(filter->sc_compat, 0, NR_compat_syscalls);
> >> +-      } else {
> >> +-              filter = chan->sc_filter;
> >> ++      syscall_name = get_syscall_name(event);
> >> ++
> >> ++      switch (event->u.syscall.abi) {
> >> ++      case LTTNG_SYSCALL_ABI_NATIVE:
> >> ++              syscall_nr = get_syscall_nr(syscall_name);
> >> ++              break;
> >> ++      case LTTNG_SYSCALL_ABI_COMPAT:
> >> ++              syscall_nr = get_compat_syscall_nr(syscall_name);
> >> ++              break;
> >> ++      default:
> >> ++              return -EINVAL;
> >> +       }
> >> ++      if (syscall_nr < 0)
> >> ++              return -ENOENT;
> >> +
> >> +-      if (!name) {
> >> +-              /* Fail if all syscalls are already disabled. */
> >> +-              if (bitmap_empty(filter->sc, NR_syscalls)
> >> +-                      && bitmap_empty(filter->sc_compat,
> >> +-                              NR_compat_syscalls)) {
> >> +-                      ret = -EEXIST;
> >> +-                      goto error;
> >> +-              }
> >> +
> >> +-              /* Disable all system calls */
> >> +-              bitmap_clear(filter->sc, 0, NR_syscalls);
> >> +-              bitmap_clear(filter->sc_compat, 0, NR_compat_syscalls);
> >> +-              goto apply_filter;
> >> +-      }
> >> +-      syscall_nr = get_syscall_nr(name);
> >> +-      compat_syscall_nr = get_compat_syscall_nr(name);
> >> +-      if (syscall_nr < 0 && compat_syscall_nr < 0) {
> >> +-              ret = -ENOENT;
> >> +-              goto error;
> >> +-      }
> >> +-      if (syscall_nr >= 0) {
> >> +-              if (!test_bit(syscall_nr, filter->sc)) {
> >> +-                      ret = -EEXIST;
> >> +-                      goto error;
> >> ++      switch (event->u.syscall.entryexit) {
> >> ++      case LTTNG_SYSCALL_ENTRY:
> >> ++              switch (event->u.syscall.abi) {
> >> ++              case LTTNG_SYSCALL_ABI_NATIVE:
> >> ++                      bitmap = filter->sc_entry;
> >> ++                      break;
> >> ++              case LTTNG_SYSCALL_ABI_COMPAT:
> >> ++                      bitmap = filter->sc_compat_entry;
> >> ++                      break;
> >> +               }
> >> +-              bitmap_clear(filter->sc, syscall_nr, 1);
> >> +-      }
> >> +-      if (compat_syscall_nr >= 0) {
> >> +-              if (!test_bit(compat_syscall_nr, filter->sc_compat)) {
> >> +-                      ret = -EEXIST;
> >> +-                      goto error;
> >> ++              break;
> >> ++      case LTTNG_SYSCALL_EXIT:
> >> ++              switch (event->u.syscall.abi) {
> >> ++              case LTTNG_SYSCALL_ABI_NATIVE:
> >> ++                      bitmap = filter->sc_exit;
> >> ++                      break;
> >> ++              case LTTNG_SYSCALL_ABI_COMPAT:
> >> ++                      bitmap = filter->sc_compat_exit;
> >> ++                      break;
> >> +               }
> >> +-              bitmap_clear(filter->sc_compat, compat_syscall_nr, 1);
> >> ++              break;
> >> ++      default:
> >> ++              return -EINVAL;
> >> +       }
> >> +-apply_filter:
> >> +-      if (!chan->sc_filter)
> >> +-              rcu_assign_pointer(chan->sc_filter, filter);
> >> +-      chan->syscall_all = 0;
> >> +-      return 0;
> >> ++      if (!test_bit(syscall_nr, bitmap))
> >> ++              return -EEXIST;
> >> ++      bitmap_clear(bitmap, syscall_nr, 1);
> >> +
> >> +-error:
> >> +-      if (!chan->sc_filter)
> >> +-              kfree(filter);
> >> +-      return ret;
> >> ++      return 0;
> >> + }
> >> +
> >> + static
> >> +@@ -1236,6 +1256,9 @@ const struct file_operations lttng_syscall_list_fops = {
> >> +       .release = seq_release,
> >> + };
> >> +
> >> ++/*
> >> ++ * A syscall is enabled if it is traced for either entry or exit.
> >> ++ */
> >> + long lttng_channel_syscall_mask(struct lttng_channel *channel,
> >> +               struct lttng_kernel_syscall_mask __user *usyscall_mask)
> >> + {
> >> +@@ -1262,8 +1285,9 @@ long lttng_channel_syscall_mask(struct lttng_channel *channel,
> >> +               char state;
> >> +
> >> +               if (channel->sc_table) {
> >> +-                      if (filter)
> >> +-                              state = test_bit(bit, filter->sc);
> >> ++                      if (!READ_ONCE(channel->syscall_all) && filter)
> >> ++                              state = test_bit(bit, filter->sc_entry)
> >> ++                                      || test_bit(bit, filter->sc_exit);
> >> +                       else
> >> +                               state = 1;
> >> +               } else {
> >> +@@ -1275,9 +1299,11 @@ long lttng_channel_syscall_mask(struct lttng_channel *channel,
> >> +               char state;
> >> +
> >> +               if (channel->compat_sc_table) {
> >> +-                      if (filter)
> >> ++                      if (!READ_ONCE(channel->syscall_all) && filter)
> >> +                               state = test_bit(bit - ARRAY_SIZE(sc_table),
> >> +-                                              filter->sc_compat);
> >> ++                                              filter->sc_compat_entry)
> >> ++                                      || test_bit(bit - ARRAY_SIZE(sc_table),
> >> ++                                              filter->sc_compat_exit);
> >> +                       else
> >> +                               state = 1;
> >> +               } else {
> >> +--
> >> +2.19.1
> >> +
> >> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> >> index 0e1a209ce8..e36b327a08 100644
> >> --- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> >> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> >> @@ -11,6 +11,16 @@ include lttng-platforms.inc
> >> SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> >>            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
> >>            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> >> +           file://0001-Kconfig-fix-dependency-issue-when-building-in-tree-w.patch \
> >> +           file://0002-fix-Move-mmutrace.h-into-the-mmu-sub-directory-v5.9.patch \
> >> +           file://0003-fix-KVM-x86-mmu-Make-kvm_mmu_page-definition-and-acc.patch \
> >> +           file://0004-fix-ext4-limit-the-length-of-per-inode-prealloc-list.patch \
> >> +           file://0005-fix-ext4-indicate-via-a-block-bitmap-read-is-prefetc.patch \
> >> +           file://0006-fix-removal-of-smp_-read_barrier_depends-v5.9.patch \
> >> +           file://0007-fix-writeback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch \
> >> +           file://0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch \
> >> +           file://0009-fix-version-ranges-for-ext4_discard_preallocations-a.patch \
> >> +           file://0010-Fix-system-call-filter-table.patch \
> >>            "
> >>
> >> SRC_URI[sha256sum] = "df50bc3bd58679705714f17721acf619a8b0cedc694f8a97052aa5099626feca"
> >> @@ -36,7 +46,7 @@ SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.1
> >>            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
> >>            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> >>            "
> >> -SRCREV_class-devupstream = "57ccbfa6a8a79c7b84394c2097efaf7935607aa5"
> >> +SRCREV_class-devupstream = "ad594e3a953db1b0c3c059fde45b5a5494f6be78"
> >> PV_class-devupstream = "2.12.2+git${SRCPV}"
> >> S_class-devupstream = "${WORKDIR}/git"
> >> SRCREV_FORMAT ?= "lttng_git"
> >> --
> >> 2.19.1
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> > 
>
> --
> Jens Rehsack - rehsack@gmail.com
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
