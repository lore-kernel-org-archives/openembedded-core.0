Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE45C789F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 03:16:53 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v9-v6so11070706plp.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 19:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RdbxnXB5lq4ROxDabdB65r1q+eGUthnqZMbdn8RRQVw=;
	b=T9lpX0vdXfAGNWmvCwQtlrJqgzFFPjhCRHI2aJlrhte2+NEocgxqI8MDgAYhQkiufK
	/fKBmFGAX86+e12Gp3j+LRlPkmEkdAPQxwquzSgv24D2f/FJIAeJ8rdA5eePSan1fUAX
	lhglJ7K6FU4HJYUN/2/YhHTohg9ml5t/zYlYi7WGlrU2vkexed/sIl7H5RiF1Tgz9MYH
	bc5i7QCaOnau0Vfm1ef/3rth1kloc7VhmRUgbqZM0AbqUasXuwXhGRpjN8FrpBKXUtRS
	3br+ci0a9ueCaeKFV0EiNF1QKP5Bj6lhb7wAHMp9w19tRKaiYqi3PhuLAJEQJT3Lvxg+
	fNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RdbxnXB5lq4ROxDabdB65r1q+eGUthnqZMbdn8RRQVw=;
	b=r1rWiwwohNJYAQzL/gsuv4kvpVtDYV5g5N5Q7c0lacrDWNCAM8x50Z4IsbyAGmS6Q2
	Kf5Q7/yTLFZS05d2zr4L1mgOdpmVOSdWFwlzN2Qdz3AoE4VNWNMSdhkKUBkSNB9SwGEF
	ima638yg2jZKfxgn4cedKENP1cwTAkyZ+R33Phz3UMPkfup1qAtVGgVkmvjg5nZ/igc0
	+eNO5La5iLBAuQahvSwu27OVuHMUYfIx2C5GkPdAZZ4EnO3Ows8jZfrJ8Dj3o+X5RJ+J
	G5/MwnFg/dwp0S3w0j2cy/e1zD+XuaH5rqX5Ew+I7ai7Jch1g8Gd0+5vbT+sRY2bTJx3
	PFew==
X-Gm-Message-State: APf1xPDXgflUkOBp4SWUNEJVFtX6wBjPQzY3Z/q0PIU9hH7B3ru57zMQ
	bx6Pt0zd2keAxZxB59G8fat3pYBsuRZTfo9wuuc=
X-Google-Smtp-Source: AG47ELukk2LMz2T7pHAZ3ZFPKXN3a+hsYfSF4ag+BsM6EbqplfpHaNW2+wwuj9seFjLROfEmNfTImRF2/zFk5SJGP48=
X-Received: by 2002:a17:902:9009:: with SMTP id
	a9-v6mr14941291plp.272.1520306215034; 
	Mon, 05 Mar 2018 19:16:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Mon, 5 Mar 2018 19:16:24 -0800 (PST)
In-Reply-To: <1520268635-5466-2-git-send-email-kamensky@cisco.com>
References: <1520268635-5466-1-git-send-email-kamensky@cisco.com>
	<1520268635-5466-2-git-send-email-kamensky@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Mar 2018 19:16:24 -0800
Message-ID: <CAMKF1sp3vtuQp7iLZH3J2t7sbQdt01HXRZbhzcgoG0B07Mdj5Q@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemtap: bring in PR22551 fix that addresses build against 4.15 kernel issue
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
X-List-Received-Date: Tue, 06 Mar 2018 03:16:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 8:50 AM, Victor Kamensky <kamensky@cisco.com> wrote:
> With 4.15 kernel systemtap needs update to address systemtap module
> compilation issues. It is fixed in later version of systemtap by
> PR22551.
>


LGTM

> Upstream-Status: Backport
>
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>  ...-by-updating-the-use-of-timers-for-the-4..patch | 273 +++++++++++++++++++++
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |   1 +
>  2 files changed, 274 insertions(+)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch b/meta/recipes-kernel/systemtap/systemtap/0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch
> new file mode 100644
> index 0000000..da30f8c
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap/0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch
> @@ -0,0 +1,273 @@
> +From fbb26e17a4c026f05a497fc5d584516bad3b6950 Mon Sep 17 00:00:00 2001
> +From: David Smith <dsmith@redhat.com>
> +Date: Wed, 6 Dec 2017 14:37:42 -0600
> +Subject: [PATCH] Fix PR22551 by updating the use of timers for the 4.15
> + kernel.
> +
> +* runtime/linux/timer_compatibility.h: New file.
> +* runtime/time.c: Update timer callback function parameter type. Update
> +  timer initialization.
> +* runtime/transport/relay_v2.c: Ditto.
> +* runtime/transport/transport.c: Ditto.
> +* tapset-timers.cxx (timer_derived_probe_group::emit_module_decls):
> +  Ditto. Handle old and new timer callback interface.
> +* runtime/linux/runtime.h: Include timer_compatibility.h instead of timer.h.
> +* tapset/linux/scsi.stp: Ditto.
> +---
> + runtime/linux/runtime.h             |  2 +-
> + runtime/linux/timer_compatibility.h | 76 +++++++++++++++++++++++++++++++++++++
> + runtime/time.c                      |  7 ++--
> + runtime/transport/relay_v2.c        |  8 ++--
> + runtime/transport/transport.c       | 13 +++----
> + tapset-timers.cxx                   | 14 +++++--
> + tapset/linux/scsi.stp               |  2 +-
> + 7 files changed, 100 insertions(+), 22 deletions(-)
> + create mode 100644 runtime/linux/timer_compatibility.h
> +
> +diff --git a/runtime/linux/runtime.h b/runtime/linux/runtime.h
> +index 9c585a2..df9b74c 100644
> +--- a/runtime/linux/runtime.h
> ++++ b/runtime/linux/runtime.h
> +@@ -34,7 +34,7 @@
> + #include <linux/compat.h>
> + #include <linux/sched.h>
> + #include <linux/mm.h>
> +-#include <linux/timer.h>
> ++#include "timer_compatibility.h"
> + #include <linux/delay.h>
> + #include <linux/profile.h>
> + #include <linux/rcupdate.h>
> +diff --git a/runtime/linux/timer_compatibility.h b/runtime/linux/timer_compatibility.h
> +new file mode 100644
> +index 0000000..ac03de9
> +--- /dev/null
> ++++ b/runtime/linux/timer_compatibility.h
> +@@ -0,0 +1,76 @@
> ++/*
> ++ * linux/timer.h compatibility defines and inlines
> ++ * Copyright (C) 2017 Red Hat Inc.
> ++ *
> ++ * This file is part of systemtap, and is free software.  You can
> ++ * redistribute it and/or modify it under the terms of the GNU General
> ++ * Public License (GPL); either version 2, or (at your option) any
> ++ * later version.
> ++ */
> ++
> ++#ifndef _TIMER_COMPATIBILITY_H_
> ++#define _TIMER_COMPATIBILITY_H_
> ++
> ++#include <linux/timer.h>
> ++
> ++/*
> ++ * Starting with the 4.15 kernel, the timer interface
> ++ * changed. Originally, you'd do something like:
> ++ *
> ++ *   static void timer_func(unsigned long val);
> ++ *
> ++ *   init_timer(&timer);
> ++ *   timer.expires = jiffies + STP_RELAY_TIMER_INTERVAL;
> ++ *   timer.function = timer_func;
> ++ *   timer.data = 0;
> ++ *   add_timer(&timer);
> ++ *
> ++ * The 'data' parameter would get passed to the callback
> ++ * function. Starting with 4.15, you'd do something like this:
> ++ *
> ++ *   static void timer_func(struct timer_list *val);
> ++ *
> ++ *   timer_setup(&timer, timer_func, 0);
> ++ *   timer.expires = jiffies + STP_RELAY_TIMER_INTERVAL;
> ++ *   add_timer(&timer);
> ++ *
> ++ * With the new code, the timer that caused the callback gets passed
> ++ * to the timer callback function. The 'data' field has been removed.
> ++ *
> ++ * So, we're going to use the new interface. To hide the differences
> ++ * between the callback function parameter type, we'll define a new
> ++ * type, 'stp_timer_callback_parameter_t'.
> ++ *
> ++ * If code needs to figure out the difference between the old and new
> ++ * interface, it should test the TIMER_TRACE_FLAGMASK define (which
> ++ * only exists in the new interface).
> ++ */
> ++
> ++#if defined(TIMER_TRACE_FLAGMASK)
> ++/* This is the >= 4.15 kernel interface. */
> ++
> ++typedef struct timer_list * stp_timer_callback_parameter_t;
> ++
> ++#else
> ++/* This is the < 4.15 kernel interface. */
> ++
> ++typedef unsigned long stp_timer_callback_parameter_t;
> ++
> ++/**
> ++ * timer_setup - prepare a timer for first use
> ++ * @timer: the timer in question
> ++ * @callback: the function to call when timer expires
> ++ * @flags: any TIMER_* flags (note that anything other than 0 is an
> ++ *       error, since this compatibility function can't support any
> ++ *       of the TIMER_* flags)
> ++ */
> ++#define timer_setup(timer, callback, flags)                   \
> ++      {                                                       \
> ++              init_timer((timer));                            \
> ++              (timer)->function = callback;                   \
> ++              (timer)->data = 0;                              \
> ++              BUILD_BUG_ON_ZERO((flags) != 0);                \
> ++      }
> ++#endif
> ++
> ++#endif /* _TIMER_COMPATIBILITY_H_ */
> +diff --git a/runtime/time.c b/runtime/time.c
> +index 2e666d5..91ceafa 100644
> +--- a/runtime/time.c
> ++++ b/runtime/time.c
> +@@ -168,10 +168,10 @@ __stp_time_smp_callback(void *val)
> +
> + /* The timer callback is in a softIRQ -- interrupts enabled. */
> + static void
> +-__stp_time_timer_callback(unsigned long val)
> ++__stp_time_timer_callback(stp_timer_callback_parameter_t unused)
> + {
> +     stp_time_t *time =__stp_time_local_update();
> +-    (void) val;
> ++    (void) unused;
> +
> +     /* PR6481: make sure IRQs are enabled before resetting the timer
> +        (IRQs are disabled and then reenabled in
> +@@ -200,9 +200,8 @@ __stp_init_time(void *info)
> +     time->freq = __stp_get_freq();
> +     __stp_time_local_update();
> +
> +-    init_timer(&time->timer);
> ++    timer_setup(&time->timer, __stp_time_timer_callback, 0);
> +     time->timer.expires = jiffies + STP_TIME_SYNC_INTERVAL;
> +-    time->timer.function = __stp_time_timer_callback;
> +
> + #ifndef STAPCONF_ADD_TIMER_ON
> +     add_timer(&time->timer);
> +diff --git a/runtime/transport/relay_v2.c b/runtime/transport/relay_v2.c
> +index f81d75d..135951a 100644
> +--- a/runtime/transport/relay_v2.c
> ++++ b/runtime/transport/relay_v2.c
> +@@ -30,7 +30,7 @@
> + #include <linux/debugfs.h>
> + #include <linux/mm.h>
> + #include <linux/relay.h>
> +-#include <linux/timer.h>
> ++#include "../linux/timer_compatibility.h"
> + #include "../uidgid_compatibility.h"
> + #include "relay_compat.h"
> +
> +@@ -120,7 +120,7 @@ static void __stp_relay_wakeup_readers(struct rchan_buf *buf)
> +               wake_up_interruptible(&buf->read_wait);
> + }
> +
> +-static void __stp_relay_wakeup_timer(unsigned long val)
> ++static void __stp_relay_wakeup_timer(stp_timer_callback_parameter_t unused)
> + {
> + #ifdef STP_BULKMODE
> +       int i;
> +@@ -151,10 +151,8 @@ static void __stp_relay_wakeup_timer(unsigned long val)
> + static void __stp_relay_timer_init(void)
> + {
> +       atomic_set(&_stp_relay_data.wakeup, 0);
> +-      init_timer(&_stp_relay_data.timer);
> ++      timer_setup(&_stp_relay_data.timer, __stp_relay_wakeup_timer, 0);
> +       _stp_relay_data.timer.expires = jiffies + STP_RELAY_TIMER_INTERVAL;
> +-      _stp_relay_data.timer.function = __stp_relay_wakeup_timer;
> +-      _stp_relay_data.timer.data = 0;
> +       add_timer(&_stp_relay_data.timer);
> +       smp_mb();
> + }
> +diff --git a/runtime/transport/transport.c b/runtime/transport/transport.c
> +index 3400f22..320fd18 100644
> +--- a/runtime/transport/transport.c
> ++++ b/runtime/transport/transport.c
> +@@ -311,7 +311,7 @@ static void _stp_detach(void)
> + }
> +
> +
> +-static void _stp_ctl_work_callback(unsigned long val);
> ++static void _stp_ctl_work_callback(stp_timer_callback_parameter_t unused);
> +
> + /*
> +  * Called when stapio opens the control channel.
> +@@ -320,13 +320,12 @@ static void _stp_attach(void)
> + {
> +       dbug_trans(1, "attach\n");
> +       _stp_pid = current->pid;
> +-  if (_stp_namespaces_pid < 1)
> +-    _stp_namespaces_pid = _stp_pid;
> ++      if (_stp_namespaces_pid < 1)
> ++              _stp_namespaces_pid = _stp_pid;
> +       _stp_transport_data_fs_overwrite(0);
> +-      init_timer(&_stp_ctl_work_timer);
> ++
> ++      timer_setup(&_stp_ctl_work_timer, _stp_ctl_work_callback, 0);
> +       _stp_ctl_work_timer.expires = jiffies + STP_CTL_TIMER_INTERVAL;
> +-      _stp_ctl_work_timer.function = _stp_ctl_work_callback;
> +-      _stp_ctl_work_timer.data= 0;
> +       add_timer(&_stp_ctl_work_timer);
> + }
> +
> +@@ -341,7 +340,7 @@ static void _stp_attach(void)
> +  *    notified. Reschedules itself if someone is still attached
> +  *    to the cmd channel.
> +  */
> +-static void _stp_ctl_work_callback(unsigned long val)
> ++static void _stp_ctl_work_callback(stp_timer_callback_parameter_t unused)
> + {
> +       int do_io = 0;
> +       unsigned long flags;
> +diff --git a/tapset-timers.cxx b/tapset-timers.cxx
> +index 1a40bcd..0ab4d69 100644
> +--- a/tapset-timers.cxx
> ++++ b/tapset-timers.cxx
> +@@ -122,9 +122,13 @@ timer_derived_probe_group::emit_module_decls (systemtap_session& s)
> +   s.op->newline(-1) << "};";
> +   s.op->newline();
> +
> +-  s.op->newline() << "static void enter_timer_probe (unsigned long val) {";
> ++  s.op->newline() << "static void enter_timer_probe (stp_timer_callback_parameter_t val) {";
> ++  s.op->newline() << "#if defined(TIMER_TRACE_FLAGMASK)";
> ++  s.op->newline(1) << "struct stap_timer_probe* stp = container_of(val, struct stap_timer_probe, timer_list);";
> ++  s.op->newline(-1) << "#else";
> +   s.op->newline(1) << "struct stap_timer_probe* stp = & stap_timer_probes [val];";
> +-  s.op->newline() << "if ((atomic_read (session_state()) == STAP_SESSION_STARTING) ||";
> ++  s.op->newline(-1) << "#endif";
> ++  s.op->newline(1) << "if ((atomic_read (session_state()) == STAP_SESSION_STARTING) ||";
> +   s.op->newline() << "    (atomic_read (session_state()) == STAP_SESSION_RUNNING))";
> +   s.op->newline(1) << "mod_timer (& stp->timer_list, jiffies + ";
> +   emit_interval (s.op);
> +@@ -148,9 +152,11 @@ timer_derived_probe_group::emit_module_init (systemtap_session& s)
> +   s.op->newline() << "for (i=0; i<" << probes.size() << "; i++) {";
> +   s.op->newline(1) << "struct stap_timer_probe* stp = & stap_timer_probes [i];";
> +   s.op->newline() << "probe_point = stp->probe->pp;";
> +-  s.op->newline() << "init_timer (& stp->timer_list);";
> +-  s.op->newline() << "stp->timer_list.function = & enter_timer_probe;";
> ++
> ++  s.op->newline() << "timer_setup (& stp->timer_list, enter_timer_probe, 0);";
> ++  s.op->newline() << "#if !defined(TIMER_TRACE_FLAGMASK)";
> +   s.op->newline() << "stp->timer_list.data = i;"; // NB: important!
> ++  s.op->newline() << "#endif";
> +   // copy timer renew calculations from above :-(
> +   s.op->newline() << "stp->timer_list.expires = jiffies + ";
> +   emit_interval (s.op);
> +diff --git a/tapset/linux/scsi.stp b/tapset/linux/scsi.stp
> +index 44f686c..3577942 100644
> +--- a/tapset/linux/scsi.stp
> ++++ b/tapset/linux/scsi.stp
> +@@ -14,7 +14,7 @@
> + #include <scsi/scsi_cmnd.h>
> + #include <scsi/scsi_device.h>
> + #include <scsi/scsi_host.h>
> +-#include <linux/timer.h>
> ++#include "linux/timer_compatibility.h"
> + #include <linux/blkdev.h>
> + %}
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index d122359..f51bd28 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -13,6 +13,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
>             file://0001-Install-python-modules-to-correct-library-dir.patch \
>             file://0001-buildrun-remove-quotes-around-I-include-line.patch \
>             file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
> +           file://0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch \
>             "
>
>  COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

