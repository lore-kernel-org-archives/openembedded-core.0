Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.644.1600123356741844425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 15:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bTSPzmb4;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id t16so1145613edw.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 15:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6uUJHYp5evG4PJQBLadMSeP2exhW2BolNjZOfq5cOfs=;
        b=bTSPzmb4KOZ+YMIPkG58z2krF4Prjp4/bqx5+3G82hPfiVS8zAn3RavyREwApuCd6N
         V8NSEJLI8cbqhspp6GEpzVZyOLnBHeqZhILP0F7xVYnjTJRG9jWg9Pkpl28fgaL6r5X8
         yzMdgiN3HwmriNCTYoub4hN7slrDy2AaxFmHtLxLP0HCGo5PDG5/L04DIPpfzkK8RKWP
         wLlzY4rJXKlcIvBzP5FtdoIAiTJHtge0j6nu2kxdjRUq9Opo3tzZtmSkHLUGE5V90x2b
         lLusTqQ6wQmdbWwqzhaV6Vw+OYwvhw0BOgV2kMSNluNJjktazp2YHrXlIcl0n3Sr5vQl
         HDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6uUJHYp5evG4PJQBLadMSeP2exhW2BolNjZOfq5cOfs=;
        b=i3IaOMV9nsvAI9SckFkjkL+UI4hK00vAJv0o0nZa2q4mBd8ePVKtVP3wvW522Qi9nV
         XBykBDapsBxNPhIgwwljYA8GpSZkX4KIZXF9OllczGvrM18+x97Pc+wXnAYKc8/oKMj3
         a3n91F2mvUaEcwVi+gRGxZPmK1gg2JjDhQEyCT3FDPW0QNNG8htYcWUdHdqIbY9SpX7c
         slUeJrW3k89SbICyJIJz/Tg01n8/+nFrIogKfTPIHCBLs5TUJd/Ds5bwJb0FtD7XyRWg
         sS0OiV+lzmy/KMkCYr1JBX1gotOf62OjTrwWdmclWVaJkGzvPbfTn7DinfEHCGWyOP1I
         oNIg==
X-Gm-Message-State: AOAM530vqrsBmQ0l136HnWqBEcnfXlo7ho9+7a7jpRHo73l49qzE1g6P
	Dgg3c2AxZAxoVjleSmCBA8HZbduNQ9mjRDpQIoE=
X-Google-Smtp-Source: ABdhPJxEKFcc9XVBaADSTQGSKWJc5mHZQygONS8+8BAniIJz28uSHawUt8K1XZ00/7W+i6wQL3+0H6zX0AlhZUK81yw=
X-Received: by 2002:a05:6402:16c9:: with SMTP id r9mr18998312edx.27.1600123354998;
 Mon, 14 Sep 2020 15:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200914075222.22226-1-sno@NetBSD.org> <CADkTA4PZBd-1O8tNPzFSj=2sD9o8z3kWDrP=vXM4d8rWSM+tnw@mail.gmail.com>
 <CA+chaQeDVYaXeeZgxvbk60R4Ewq2SOpsf565=wOQrLpxL4Z19w@mail.gmail.com>
In-Reply-To: <CA+chaQeDVYaXeeZgxvbk60R4Ewq2SOpsf565=wOQrLpxL4Z19w@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 14 Sep 2020 18:41:04 -0400
Message-ID: <CADkTA4OvH9wNrU0ft5L1Vbik6+k_0rp+wc3Jy-D97a5Q39r8+Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] lttng-modules: backport patch to fix build for linux-5.4.62+
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Jens Rehsack <rehsack@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jens Rehsack <sno@netbsd.org>
Content-Type: text/plain; charset="UTF-8"

For my 5.4 and 5.8 and 5.9 builds of linux-yocto, I went ahead and
backported the 10 changes that are on the tip of the 2.12 branch,
since they are all bug fixes and support changes, they were safe to
grab.

My builds across the versions worked with that, and I sent that
variant in my series a few minutes ago.

Bruce

On Mon, Sep 14, 2020 at 4:46 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Is this exact backport from lttng-modules repo?
>
> I came across this issue in https://github.com/agherzan/meta-raspberrypi/pull/722
> and
> https://github.com/lttng/lttng-modules/commit/817e02f9e256b8f2cbb9e3125eb061757b83bd4a
> +
> https://github.com/lttng/lttng-modules/commit/b6af46d166c48c9e59600a60b5a2a7ead10f179a
> look a bit different than this one (and are more correct with fixed kernel ranges as not every > 5.4.62 kernel had this change).
>
> On Mon, Sep 14, 2020 at 10:11 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> In my latest round of linux-yocto reference updates, I ran into these
>> same issues, but I needed to pull in more of the fixes on the 2.12
>> branch than just this to get things building against 5.8.9.
>>
>> I didn't need to tweak any of the patches for v5.4.64+ here.
>>
>> I have 10 backported patches and confirmed my 5.8.9 and 5.4.65 both
>> build with the changes.
>>
>> I can submit that patch along with my reference kernel bumps later today.
>>
>> Bruce
>>
>>
>> On Mon, Sep 14, 2020 at 3:52 AM Jens Rehsack <rehsack@gmail.com> wrote:
>> >
>> > From: Jens Rehsack <sno@netbsd.org>
>> >
>> > Backport patch from lttng-modules/stable-2.12
>> >     87b2aff fix: writeback: Fix sync livelock due to b_dirty_time processing (v5.9)
>> >
>> > with minor modfication to catch
>> >     6623c19042b6 writeback: Fix sync livelock due to b_dirty_time processing
>> >
>> > from linux/stable-5.4 v5.4.62+
>> >
>> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> > ---
>> >  ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 ++++++++++++++++++
>> >  .../lttng/lttng-modules_2.12.2.bb             |   1 +
>> >  2 files changed, 118 insertions(+)
>> >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
>> >
>> > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
>> > new file mode 100644
>> > index 0000000000..96a1c486ef
>> > --- /dev/null
>> > +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
>> > @@ -0,0 +1,117 @@
>> > +From 87b2affc3eb06f3fb2d0923f18af37713eb6814b Mon Sep 17 00:00:00 2001
>> > +From: Michael Jeanson <mjeanson@efficios.com>
>> > +Date: Mon, 31 Aug 2020 14:16:01 -0400
>> > +Subject: [PATCH] fix: writeback: Fix sync livelock due to b_dirty_time
>> > + processing (v5.9)
>> > +
>> > +See upstream commit:
>> > +
>> > +  commit f9cae926f35e8230330f28c7b743ad088611a8de
>> > +  Author: Jan Kara <jack@suse.cz>
>> > +  Date:   Fri May 29 16:08:58 2020 +0200
>> > +
>> > +    writeback: Fix sync livelock due to b_dirty_time processing
>> > +
>> > +    When we are processing writeback for sync(2), move_expired_inodes()
>> > +    didn't set any inode expiry value (older_than_this). This can result in
>> > +    writeback never completing if there's steady stream of inodes added to
>> > +    b_dirty_time list as writeback rechecks dirty lists after each writeback
>> > +    round whether there's more work to be done. Fix the problem by using
>> > +    sync(2) start time is inode expiry value when processing b_dirty_time
>> > +    list similarly as for ordinarily dirtied inodes. This requires some
>> > +    refactoring of older_than_this handling which simplifies the code
>> > +    noticeably as a bonus.
>> > +
>> > +Change-Id: I8b894b13ccc14d9b8983ee4c2810a927c319560b
>> > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
>> > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>> > +---
>> > + .../events/lttng-module/writeback.h           | 39 ++++++++++++-------
>> > + 1 file changed, 26 insertions(+), 13 deletions(-)
>> > +
>> > +Upstream Status: Backport
>> > +
>> > +diff --git a/instrumentation/events/lttng-module/writeback.h b/instrumentation/events/lttng-module/writeback.h
>> > +index ece67ad..e9018dd 100644
>> > +--- a/instrumentation/events/lttng-module/writeback.h
>> > ++++ b/instrumentation/events/lttng-module/writeback.h
>> > +@@ -384,34 +384,48 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balance_dirty_wait, writeback_wbc_balanc
>> > + #endif
>> > + LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeback_wbc_writepage)
>> > +
>> > +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
>> > ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0)) || (LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,62))
>> > ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
>> > ++      TP_PROTO(struct bdi_writeback *wb,
>> > ++               struct wb_writeback_work *work,
>> > ++               unsigned long dirtied_before,
>> > ++               int moved),
>> > ++      TP_ARGS(wb, work, dirtied_before, moved),
>> > ++      TP_FIELDS(
>> > ++              ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
>> > ++              ctf_integer(unsigned long, older, dirtied_before)
>> > ++              ctf_integer(int, moved, moved)
>> > ++      )
>> > ++)
>> > ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
>> > + LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
>> > +       TP_PROTO(struct bdi_writeback *wb,
>> > +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
>> > +                struct wb_writeback_work *work,
>> > +-#else
>> > +-               unsigned long *older_than_this,
>> > +-#endif
>> > +                int moved),
>> > +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
>> > +       TP_ARGS(wb, work, moved),
>> > +-#else
>> > ++      TP_FIELDS(
>> > ++              ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
>> > ++              ctf_integer(int, moved, moved)
>> > ++      )
>> > ++)
>> > ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
>> > ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
>> > ++      TP_PROTO(struct bdi_writeback *wb,
>> > ++               unsigned long *older_than_this,
>> > ++               int moved),
>> > +       TP_ARGS(wb, older_than_this, moved),
>> > +-#endif
>> > +       TP_FIELDS(
>> > +               ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
>> > +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
>> > +-#else
>> > +               ctf_integer(unsigned long, older,
>> > +                       older_than_this ? *older_than_this : 0)
>> > +               ctf_integer(long, age,
>> > +                       older_than_this ?
>> > +                               (jiffies - *older_than_this) * 1000 / HZ
>> > +                               : -1)
>> > +-#endif
>> > +               ctf_integer(int, moved, moved)
>> > +       )
>> > + )
>> > ++#endif
>> > +
>> > + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,8,0))
>> > + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
>> > +@@ -460,7 +474,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
>> > +               ctf_integer(unsigned long, dirty_limit, global_dirty_limit)
>> > +       )
>> > + )
>> > +-#else
>> > ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
>> > + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
>> > +
>> > +       writeback_global_dirty_state,
>> > +@@ -485,7 +499,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
>> > +       )
>> > + )
>> > + #endif
>> > +-#endif
>> > +
>> > + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
>> > +
>> > +--
>> > +2.17.1
>> > +
>> > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
>> > index 0e1a209ce8..f58b3bf0d7 100644
>> > --- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
>> > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
>> > @@ -10,6 +10,7 @@ include lttng-platforms.inc
>> >
>> >  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>> >             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>> > +           file://0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch \
>> >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>> >             "
>> >
>> > --
>> > 2.17.1
>> >
>> >
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
