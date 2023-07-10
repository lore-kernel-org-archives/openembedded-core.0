Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EE6EB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 15:03:20 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.42122.1689001395776475036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 08:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=GBdmyU9Z;
 spf=pass (domain: mvista.com, ip: 209.85.167.54, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso6512629e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689001394; x=1691593394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4a+n0Cid+qnQ6IrGJ2fOQiLu3zSqm18vJ22uwc9YdCM=;
        b=GBdmyU9Z6U1m2LSDapyRN236u4sawClhDjKJ08DjlDyJUfvFhyN+2tiaE/5uSBTkaI
         Ts+5TvDKQnl53YJQEP2MXhW4svdBQ83hHX82I8yWWCLx/OIHFz12eYnnpIml0JjWqQx0
         Ode7pQRwdvBHAtNOMLRlF3M6tMa1nz4xbaRqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689001394; x=1691593394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4a+n0Cid+qnQ6IrGJ2fOQiLu3zSqm18vJ22uwc9YdCM=;
        b=DjFSRXJ4rSSt279MsNbqg6W1Scn2R0XmCuUZnNwAet8q8p7wUoQr9cqU88rQ0+F+Bf
         cAn5DaKjdazuCN+ZGfR/s+NOAmFnVK02qDuFi/RF3kxWiHE+5Wa2feLynJobyNIGJrpZ
         cqsU4/RgBxT24Pjz/g0q9sO90RDGSk2mMRuw/ol+QshMUJ3Et0EMhC9iETLXoMQVhXey
         XtnNiUQFzPZuZ3C1LHJy6O6Mcr8QDZnzjiOS7Vf0nmyoDAgn9c10mw+rbSi0xbwoHZlK
         d741fP0DPEgVMvYp/j+78vVN6RJaK8mL3/srdFCc2PIagDAtxcKxGIKAZuHwApYlHYb1
         MsGg==
X-Gm-Message-State: ABy/qLZAvKQ2nn+uIKHyf1KwTAele2HsB2sjYxF9l6zAB/dGXaXU8G6W
	cBh0/vElMjlZ7qGPvldCNb71tvCtc00UcvV5YdUFQSApl3RZwoQL
X-Google-Smtp-Source: APBJJlGb8vTBVxPsqt4eRvikFehyn2McNqgwwVqK62qKjABNqsYWS0QV0GokeElj6NC3FOBxAYHwsgSdJXeo4JBZ6F8=
X-Received: by 2002:a19:5601:0:b0:4f8:6e6e:3f42 with SMTP id
 k1-20020a195601000000b004f86e6e3f42mr10782834lfb.14.1689001393055; Mon, 10
 Jul 2023 08:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230710052832.185187-1-vkumbhar@mvista.com> <CAOSpxdb+wf9j7K4rmXSFHY_heS07-va5d2J_nACE3cAnHeEOBw@mail.gmail.com>
In-Reply-To: <CAOSpxdb+wf9j7K4rmXSFHY_heS07-va5d2J_nACE3cAnHeEOBw@mail.gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Mon, 10 Jul 2023 20:33:01 +0530
Message-ID: <CAPun1rGQkUNZEvUucDSAaziTZOMwOW4BgSywcvR7OvJQA=32=Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] curl: fix CVE-2023-28320 siglongjmp
 race condition may lead to crash
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000f79ea0600234870"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 15:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184082

--0000000000000f79ea0600234870
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As it is a followup patch I have added it as fol1.

If you want this as pre1, I will send v2 again.

Kind regards,
Vivek

On Mon, Jul 10, 2023 at 8:01=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Sun, Jul 9, 2023 at 7:28=E2=80=AFPM vkumbhar <vkumbhar@mvista.com> wro=
te:
> >
> > Introduced by:
> https://github.com/curl/curl/commit/3c49b405de4fbf1fd7127f91908261268640e=
54f
> (curl-7_9_8)
> > Fixed by:
> https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa=
5f2
> (curl-8_1_0)
> > Follow-up:
> https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0e=
dc3
> (curl-8_1_0)
> > https://curl.se/docs/CVE-2023-28320.html
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >  .../curl/curl/CVE-2023-28320-fol1.patch       | 197 ++++++++++++++++++
> >  .../curl/curl/CVE-2023-28320-pre1.patch       | 197 ++++++++++++++++++
> >  .../curl/curl/CVE-2023-28320.patch            |  86 ++++++++
> >  meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
> >  4 files changed, 482 insertions(+)
> >  create mode 100644
> meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> >  create mode 100644
> meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patch
> >
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> > new file mode 100644
> > index 0000000000..eaa6fdc327
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> > @@ -0,0 +1,197 @@
> > +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Tue, 16 May 2023 23:40:42 +0200
> > +Subject: [PATCH] hostip: include easy_lock.h before using
> > + GLOBAL_INIT_IS_THREADSAFE
> > +
> > +Since that header file is the only place that define can be defined.
> > +
> > +Reported-by: Marc Deslauriers
> > +
> > +Follow-up to 13718030ad4b3209
> > +
> > +Closes #11121
> > +
> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0e=
dc3
> ]
> > +CVE: CVE-2023-28320
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + lib/easy_lock.h | 109 +++++++++++++++++++++++++++++++++++++++++++++++=
+
> > + lib/hostip.c    |  10 ++---
> > + lib/hostip.h    |   9 ----
> > + 3 files changed, 113 insertions(+), 15 deletions(-)
> > + create mode 100644 lib/easy_lock.h
> > +
> > +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
> > +new file mode 100644
> > +index 0000000..6399a39
> > +--- /dev/null
> > ++++ b/lib/easy_lock.h
> > +@@ -0,0 +1,109 @@
> > ++#ifndef HEADER_CURL_EASY_LOCK_H
> > ++#define HEADER_CURL_EASY_LOCK_H
> >
> ++/**********************************************************************=
*****
> > ++ *                                  _   _ ____  _
> > ++ *  Project                     ___| | | |  _ \| |
> > ++ *                             / __| | | | |_) | |
> > ++ *                            | (__| |_| |  _ <| |___
> > ++ *                             \___|\___/|_| \_\_____|
> > ++ *
> > ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> > ++ *
> > ++ * This software is licensed as described in the file COPYING, which
> > ++ * you should have received as part of this distribution. The terms
> > ++ * are also available at https://curl.se/docs/copyright.html.
> > ++ *
> > ++ * You may opt to use, copy, modify, merge, publish, distribute and/o=
r
> sell
> > ++ * copies of the Software, and permit persons to whom the Software is
> > ++ * furnished to do so, under the terms of the COPYING file.
> > ++ *
> > ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY
> OF ANY
> > ++ * KIND, either express or implied.
> > ++ *
> > ++ * SPDX-License-Identifier: curl
> > ++ *
> > ++
> *************************************************************************=
**/
> > ++
> > ++#include "curl_setup.h"
> > ++
> > ++#define GLOBAL_INIT_IS_THREADSAFE
> > ++
> > ++#if defined(_WIN32_WINNT) && _WIN32_WINNT >=3D 0x600
> > ++
> > ++#ifdef __MINGW32__
> > ++#ifndef __MINGW64_VERSION_MAJOR
> > ++#if (__MINGW32_MAJOR_VERSION < 5) || \
> > ++    (__MINGW32_MAJOR_VERSION =3D=3D 5 && __MINGW32_MINOR_VERSION =3D=
=3D 0)
> > ++/* mingw >=3D 5.0.1 defines SRWLOCK, and slightly different from MS
> define */
> > ++typedef PVOID SRWLOCK, *PSRWLOCK;
> > ++#endif
> > ++#endif
> > ++#ifndef SRWLOCK_INIT
> > ++#define SRWLOCK_INIT NULL
> > ++#endif
> > ++#endif /* __MINGW32__ */
> > ++
> > ++#define curl_simple_lock SRWLOCK
> > ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT
> > ++
> > ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)
> > ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)
> > ++
> > ++#elif defined(HAVE_ATOMIC) && defined(HAVE_STDATOMIC_H)
> > ++#include <stdatomic.h>
> > ++#if defined(HAVE_SCHED_YIELD)
> > ++#include <sched.h>
> > ++#endif
> > ++
> > ++#define curl_simple_lock atomic_int
> > ++#define CURL_SIMPLE_LOCK_INIT 0
> > ++
> > ++/* a clang-thing */
> > ++#ifndef __has_builtin
> > ++#define __has_builtin(x) 0
> > ++#endif
> > ++
> > ++#ifndef __INTEL_COMPILER
> > ++/* The Intel compiler tries to look like GCC *and* clang *and* lies i=
n
> its
> > ++   __has_builtin() function, so override it. */
> > ++
> > ++/* if GCC on i386/x86_64 or if the built-in is present */
> > ++#if ( (defined(__GNUC__) && !defined(__clang__)) &&     \
> > ++      (defined(__i386__) || defined(__x86_64__))) ||    \
> > ++  __has_builtin(__builtin_ia32_pause)
> > ++#define HAVE_BUILTIN_IA32_PAUSE
> > ++#endif
> > ++
> > ++#endif
> > ++
> > ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)
> > ++{
> > ++  for(;;) {
> > ++    if(!atomic_exchange_explicit(lock, true, memory_order_acquire))
> > ++      break;
> > ++    /* Reduce cache coherency traffic */
> > ++    while(atomic_load_explicit(lock, memory_order_relaxed)) {
> > ++      /* Reduce load (not mandatory) */
> > ++#ifdef HAVE_BUILTIN_IA32_PAUSE
> > ++      __builtin_ia32_pause();
> > ++#elif defined(__aarch64__)
> > ++      __asm__ volatile("yield" ::: "memory");
> > ++#elif defined(HAVE_SCHED_YIELD)
> > ++      sched_yield();
> > ++#endif
> > ++    }
> > ++  }
> > ++}
> > ++
> > ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)
> > ++{
> > ++  atomic_store_explicit(lock, false, memory_order_release);
> > ++}
> > ++
> > ++#else
> > ++
> > ++#undef  GLOBAL_INIT_IS_THREADSAFE
> > ++
> > ++#endif
> > ++
> > ++#endif /* HEADER_CURL_EASY_LOCK_H */
> > +diff --git a/lib/hostip.c b/lib/hostip.c
> > +index 5231a74..d5bf881 100644
> > +--- a/lib/hostip.c
> > ++++ b/lib/hostip.c
> > +@@ -68,6 +68,8 @@
> > + #include "curl_memory.h"
> > + #include "memdebug.h"
> > +
> > ++#include "easy_lock.h"
> > ++
> > + #if defined(CURLRES_SYNCH) &&                   \
> > +   defined(HAVE_ALARM) &&                        \
> > +   defined(SIGALRM) &&                           \
> > +@@ -77,10 +79,6 @@
> > + #define USE_ALARM_TIMEOUT
> > + #endif
> > +
> > +-#ifdef USE_ALARM_TIMEOUT
> > +-#include "easy_lock.h"
> > +-#endif
> > +-
> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number
> + zero */
> > +
> > + /*
> > +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
> > + /* Beware this is a global and unique instance. This is used to store
> the
> > +    return address that we can jump back to from inside a signal
> handler. This
> > +    is not thread-safe stuff. */
> > +-sigjmp_buf curl_jmpenv;
> > +-curl_simple_lock curl_jmpenv_lock;
> > ++static sigjmp_buf curl_jmpenv;
> > ++static curl_simple_lock curl_jmpenv_lock;
> > + #endif
> > +
> > + /* lookup address, returns entry if found and not stale */
> > +diff --git a/lib/hostip.h b/lib/hostip.h
> > +index baf1e58..d7f73d9 100644
> > +--- a/lib/hostip.h
> > ++++ b/lib/hostip.h
> > +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data,
> Curl_addrinfo *addr,
> > + #define CURL_INADDR_NONE INADDR_NONE
> > + #endif
> > +
> > +-#ifdef HAVE_SIGSETJMP
> > +-/* Forward-declaration of variable defined in hostip.c. Beware this
> > +- * is a global and unique instance. This is used to store the return
> > +- * address that we can jump back to from inside a signal handler.
> > +- * This is not thread-safe stuff.
> > +- */
> > +-extern sigjmp_buf curl_jmpenv;
> > +-#endif
> > +-
> > + /*
> > +  * Function provided by the resolver backend to set DNS servers to us=
e.
> > +  */
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
> b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
> > new file mode 100644
> > index 0000000000..eaa6fdc327
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
> > @@ -0,0 +1,197 @@
> > +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Tue, 16 May 2023 23:40:42 +0200
> > +Subject: [PATCH] hostip: include easy_lock.h before using
> > + GLOBAL_INIT_IS_THREADSAFE
> > +
> > +Since that header file is the only place that define can be defined.
> > +
> > +Reported-by: Marc Deslauriers
> > +
> > +Follow-up to 13718030ad4b3209
> > +
> > +Closes #11121
> > +
> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0e=
dc3
> ]
> > +CVE: CVE-2023-28320
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + lib/easy_lock.h | 109 +++++++++++++++++++++++++++++++++++++++++++++++=
+
> > + lib/hostip.c    |  10 ++---
> > + lib/hostip.h    |   9 ----
> > + 3 files changed, 113 insertions(+), 15 deletions(-)
> > + create mode 100644 lib/easy_lock.h
> > +
> > +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
> > +new file mode 100644
> > +index 0000000..6399a39
> > +--- /dev/null
> > ++++ b/lib/easy_lock.h
> > +@@ -0,0 +1,109 @@
> > ++#ifndef HEADER_CURL_EASY_LOCK_H
> > ++#define HEADER_CURL_EASY_LOCK_H
> >
> ++/**********************************************************************=
*****
> > ++ *                                  _   _ ____  _
> > ++ *  Project                     ___| | | |  _ \| |
> > ++ *                             / __| | | | |_) | |
> > ++ *                            | (__| |_| |  _ <| |___
> > ++ *                             \___|\___/|_| \_\_____|
> > ++ *
> > ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> > ++ *
> > ++ * This software is licensed as described in the file COPYING, which
> > ++ * you should have received as part of this distribution. The terms
> > ++ * are also available at https://curl.se/docs/copyright.html.
> > ++ *
> > ++ * You may opt to use, copy, modify, merge, publish, distribute and/o=
r
> sell
> > ++ * copies of the Software, and permit persons to whom the Software is
> > ++ * furnished to do so, under the terms of the COPYING file.
> > ++ *
> > ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY
> OF ANY
> > ++ * KIND, either express or implied.
> > ++ *
> > ++ * SPDX-License-Identifier: curl
> > ++ *
> > ++
> *************************************************************************=
**/
> > ++
> > ++#include "curl_setup.h"
> > ++
> > ++#define GLOBAL_INIT_IS_THREADSAFE
> > ++
> > ++#if defined(_WIN32_WINNT) && _WIN32_WINNT >=3D 0x600
> > ++
> > ++#ifdef __MINGW32__
> > ++#ifndef __MINGW64_VERSION_MAJOR
> > ++#if (__MINGW32_MAJOR_VERSION < 5) || \
> > ++    (__MINGW32_MAJOR_VERSION =3D=3D 5 && __MINGW32_MINOR_VERSION =3D=
=3D 0)
> > ++/* mingw >=3D 5.0.1 defines SRWLOCK, and slightly different from MS
> define */
> > ++typedef PVOID SRWLOCK, *PSRWLOCK;
> > ++#endif
> > ++#endif
> > ++#ifndef SRWLOCK_INIT
> > ++#define SRWLOCK_INIT NULL
> > ++#endif
> > ++#endif /* __MINGW32__ */
> > ++
> > ++#define curl_simple_lock SRWLOCK
> > ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT
> > ++
> > ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)
> > ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)
> > ++
> > ++#elif defined(HAVE_ATOMIC) && defined(HAVE_STDATOMIC_H)
> > ++#include <stdatomic.h>
> > ++#if defined(HAVE_SCHED_YIELD)
> > ++#include <sched.h>
> > ++#endif
> > ++
> > ++#define curl_simple_lock atomic_int
> > ++#define CURL_SIMPLE_LOCK_INIT 0
> > ++
> > ++/* a clang-thing */
> > ++#ifndef __has_builtin
> > ++#define __has_builtin(x) 0
> > ++#endif
> > ++
> > ++#ifndef __INTEL_COMPILER
> > ++/* The Intel compiler tries to look like GCC *and* clang *and* lies i=
n
> its
> > ++   __has_builtin() function, so override it. */
> > ++
> > ++/* if GCC on i386/x86_64 or if the built-in is present */
> > ++#if ( (defined(__GNUC__) && !defined(__clang__)) &&     \
> > ++      (defined(__i386__) || defined(__x86_64__))) ||    \
> > ++  __has_builtin(__builtin_ia32_pause)
> > ++#define HAVE_BUILTIN_IA32_PAUSE
> > ++#endif
> > ++
> > ++#endif
> > ++
> > ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)
> > ++{
> > ++  for(;;) {
> > ++    if(!atomic_exchange_explicit(lock, true, memory_order_acquire))
> > ++      break;
> > ++    /* Reduce cache coherency traffic */
> > ++    while(atomic_load_explicit(lock, memory_order_relaxed)) {
> > ++      /* Reduce load (not mandatory) */
> > ++#ifdef HAVE_BUILTIN_IA32_PAUSE
> > ++      __builtin_ia32_pause();
> > ++#elif defined(__aarch64__)
> > ++      __asm__ volatile("yield" ::: "memory");
> > ++#elif defined(HAVE_SCHED_YIELD)
> > ++      sched_yield();
> > ++#endif
> > ++    }
> > ++  }
> > ++}
> > ++
> > ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)
> > ++{
> > ++  atomic_store_explicit(lock, false, memory_order_release);
> > ++}
> > ++
> > ++#else
> > ++
> > ++#undef  GLOBAL_INIT_IS_THREADSAFE
> > ++
> > ++#endif
> > ++
> > ++#endif /* HEADER_CURL_EASY_LOCK_H */
> > +diff --git a/lib/hostip.c b/lib/hostip.c
> > +index 5231a74..d5bf881 100644
> > +--- a/lib/hostip.c
> > ++++ b/lib/hostip.c
> > +@@ -68,6 +68,8 @@
> > + #include "curl_memory.h"
> > + #include "memdebug.h"
> > +
> > ++#include "easy_lock.h"
> > ++
> > + #if defined(CURLRES_SYNCH) &&                   \
> > +   defined(HAVE_ALARM) &&                        \
> > +   defined(SIGALRM) &&                           \
> > +@@ -77,10 +79,6 @@
> > + #define USE_ALARM_TIMEOUT
> > + #endif
> > +
> > +-#ifdef USE_ALARM_TIMEOUT
> > +-#include "easy_lock.h"
> > +-#endif
> > +-
> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number
> + zero */
> > +
> > + /*
> > +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
> > + /* Beware this is a global and unique instance. This is used to store
> the
> > +    return address that we can jump back to from inside a signal
> handler. This
> > +    is not thread-safe stuff. */
> > +-sigjmp_buf curl_jmpenv;
> > +-curl_simple_lock curl_jmpenv_lock;
> > ++static sigjmp_buf curl_jmpenv;
> > ++static curl_simple_lock curl_jmpenv_lock;
> > + #endif
> > +
> > + /* lookup address, returns entry if found and not stale */
> > +diff --git a/lib/hostip.h b/lib/hostip.h
> > +index baf1e58..d7f73d9 100644
> > +--- a/lib/hostip.h
> > ++++ b/lib/hostip.h
> > +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data,
> Curl_addrinfo *addr,
> > + #define CURL_INADDR_NONE INADDR_NONE
> > + #endif
> > +
> > +-#ifdef HAVE_SIGSETJMP
> > +-/* Forward-declaration of variable defined in hostip.c. Beware this
> > +- * is a global and unique instance. This is used to store the return
> > +- * address that we can jump back to from inside a signal handler.
> > +- * This is not thread-safe stuff.
> > +- */
> > +-extern sigjmp_buf curl_jmpenv;
> > +-#endif
> > +-
> > + /*
> > +  * Function provided by the resolver backend to set DNS servers to us=
e.
> > +  */
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.patch
> b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
> > new file mode 100644
> > index 0000000000..0c9b67440a
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
> > @@ -0,0 +1,86 @@
> > +From 13718030ad4b3209a7583b4f27f683cd3a6fa5f2 Mon Sep 17 00:00:00 2001
> > +From: Harry Sintonen <sintonen@iki.fi>
> > +Date: Tue, 25 Apr 2023 09:22:26 +0200
> > +Subject: [PATCH] hostip: add locks around use of global buffer for
> alarm()
> > +
> > +When building with the sync name resolver and timeout ability we now
> > +require thread-safety to be present to enable it.
> > +
> > +Closes #11030
> > +
> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa=
5f2
> ]
> > +CVE: CVE-2023-28320
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + lib/hostip.c | 19 +++++++++++++++----
> > + 1 file changed, 15 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/lib/hostip.c b/lib/hostip.c
> > +index f5bb634..5231a74 100644
> > +--- a/lib/hostip.c
> > ++++ b/lib/hostip.c
> > +@@ -68,12 +68,19 @@
> > + #include "curl_memory.h"
> > + #include "memdebug.h"
> > +
> > +-#if defined(CURLRES_SYNCH) && \
> > +-    defined(HAVE_ALARM) && defined(SIGALRM) && defined(HAVE_SIGSETJMP=
)
> > ++#if defined(CURLRES_SYNCH) &&                   \
> > ++  defined(HAVE_ALARM) &&                        \
> > ++  defined(SIGALRM) &&                           \
> > ++  defined(HAVE_SIGSETJMP) &&                    \
> > ++  defined(GLOBAL_INIT_IS_THREADSAFE)
> > + /* alarm-based timeouts can only be used with all the dependencies
> satisfied */
> > + #define USE_ALARM_TIMEOUT
> > + #endif
> > +
> > ++#ifdef USE_ALARM_TIMEOUT
> > ++#include "easy_lock.h"
> > ++#endif
> > ++
> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number
> + zero */
> > +
> > + /*
> > +@@ -248,11 +255,12 @@ void Curl_hostcache_prune(struct Curl_easy *data=
)
> > +     Curl_share_unlock(data, CURL_LOCK_DATA_DNS);
> > + }
> > +
> > +-#ifdef HAVE_SIGSETJMP
> > ++#ifdef USE_ALARM_TIMEOUT
> > + /* Beware this is a global and unique instance. This is used to store
> the
> > +    return address that we can jump back to from inside a signal
> handler. This
> > +    is not thread-safe stuff. */
> > + sigjmp_buf curl_jmpenv;
> > ++curl_simple_lock curl_jmpenv_lock;
> > + #endif
> > +
> > + /* lookup address, returns entry if found and not stale */
> > +@@ -614,7 +622,6 @@ enum resolve_t Curl_resolv(struct connectdata *con=
n,
> > + static
> > + RETSIGTYPE alarmfunc(int sig)
> > + {
> > +-  /* this is for "-ansi -Wall -pedantic" to stop complaining!   (rabe=
)
> */
> > +   (void)sig;
> > +   siglongjmp(curl_jmpenv, 1);
> > + }
> > +@@ -695,6 +702,8 @@ enum resolve_t Curl_resolv_timeout(struct
> connectdata *conn,
> > +      This should be the last thing we do before calling Curl_resolv()=
,
> > +      as otherwise we'd have to worry about variables that get modifie=
d
> > +      before we invoke Curl_resolv() (and thus use "volatile"). */
> > ++  curl_simple_lock_lock(&curl_jmpenv_lock);
> > ++
> > +   if(sigsetjmp(curl_jmpenv, 1)) {
> > +     /* this is coming from a siglongjmp() after an alarm signal */
> > +     failf(data, "name lookup timed out");
> > +@@ -763,6 +772,8 @@ clean_up:
> > + #endif
> > + #endif /* HAVE_SIGACTION */
> > +
> > ++  curl_simple_lock_unlock(&curl_jmpenv_lock);
> > ++
> > +   /* switch back the alarm() to either zero or to what it was before
> minus
> > +      the time we spent until now! */
> > +   if(prev_alarm) {
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-support/curl/curl_7.69.1.bb
> b/meta/recipes-support/curl/curl_7.69.1.bb
> > index 13ec117099..ce81df0f05 100644
> > --- a/meta/recipes-support/curl/curl_7.69.1.bb
> > +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> > @@ -50,6 +50,8 @@ SRC_URI =3D "
> https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> >             file://CVE-2023-27535-pre1.patch \
> >             file://CVE-2023-27535.patch \
> >             file://CVE-2023-27536.patch \
>
> Shouldn't you be adding CVE-2023-28320-pre1.patch here?
>
> Steve
>
> > +           file://CVE-2023-28320.patch \
> > +           file://CVE-2023-28320-fol1.patch \
> >  "
> >
> >  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184058):
> https://lists.openembedded.org/g/openembedded-core/message/184058
> > Mute This Topic: https://lists.openembedded.org/mt/100053064/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000000f79ea0600234870
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As it is a followup patch=C2=A0I have added it as fol1.<di=
v><br></div><div>If you want this as pre1, I will send v2 again.</div><div>=
<br></div><div>Kind=C2=A0regards,</div><div>Vivek</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 10, 2023=
 at 8:01=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Sun, Jul 9, 2023 at 7:28=E2=80=AFPM v=
kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" target=3D"_blank">vkumbh=
ar@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Introduced by: <a href=3D"https://github.com/curl/curl/commit/3c49b405=
de4fbf1fd7127f91908261268640e54f" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/curl/curl/commit/3c49b405de4fbf1fd7127f91908261268640e54f</a=
> (curl-7_9_8)<br>
&gt; Fixed by: <a href=3D"https://github.com/curl/curl/commit/13718030ad4b3=
209a7583b4f27f683cd3a6fa5f2" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa5f2</a> (cu=
rl-8_1_0)<br>
&gt; Follow-up: <a href=3D"https://github.com/curl/curl/commit/f446258f0269=
a62289cca0210157cb8558d0edc3" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0edc3</a> (c=
url-8_1_0)<br>
&gt; <a href=3D"https://curl.se/docs/CVE-2023-28320.html" rel=3D"noreferrer=
" target=3D"_blank">https://curl.se/docs/CVE-2023-28320.html</a><br>
&gt;<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-28320-fol1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 197 ++++++++++++++++++<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-28320-pre1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 197 ++++++++++++++++++<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-28320.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 86 ++++++++<br>
&gt;=C2=A0 meta/recipes-support/curl/<a href=3D"http://curl_7.69.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 4 files changed, 482 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320=
-fol1.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320=
-pre1.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch =
b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..eaa6fdc327<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch<br>
&gt; @@ -0,0 +1,197 @@<br>
&gt; +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D=
"_blank">daniel@haxx.se</a>&gt;<br>
&gt; +Date: Tue, 16 May 2023 23:40:42 +0200<br>
&gt; +Subject: [PATCH] hostip: include easy_lock.h before using<br>
&gt; + GLOBAL_INIT_IS_THREADSAFE<br>
&gt; +<br>
&gt; +Since that header file is the only place that define can be defined.<=
br>
&gt; +<br>
&gt; +Reported-by: Marc Deslauriers<br>
&gt; +<br>
&gt; +Follow-up to 13718030ad4b3209<br>
&gt; +<br>
&gt; +Closes #11121<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/f446258f0269a62289cca0210157cb8558d0edc3" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb=
8558d0edc3</a>]<br>
&gt; +CVE: CVE-2023-28320<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/easy_lock.h | 109 ++++++++++++++++++++++++++++++++++++++++++++++=
++<br>
&gt; + lib/hostip.c=C2=A0 =C2=A0 |=C2=A0 10 ++---<br>
&gt; + lib/hostip.h=C2=A0 =C2=A0 |=C2=A0 =C2=A09 ----<br>
&gt; + 3 files changed, 113 insertions(+), 15 deletions(-)<br>
&gt; + create mode 100644 lib/easy_lock.h<br>
&gt; +<br>
&gt; +diff --git a/lib/easy_lock.h b/lib/easy_lock.h<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..6399a39<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/lib/easy_lock.h<br>
&gt; +@@ -0,0 +1,109 @@<br>
&gt; ++#ifndef HEADER_CURL_EASY_LOCK_H<br>
&gt; ++#define HEADER_CURL_EASY_LOCK_H<br>
&gt; ++/*******************************************************************=
********<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=C2=A0 =C2=A0_ ____=
=C2=A0 _<br>
&gt; ++ *=C2=A0 Project=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0___| | | |=C2=A0 _ \| |<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ __| | | | |_) | |<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (__| |_| |=C2=A0 _ &lt;| |___<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\___|\___/|_| \_\_____|<br>
&gt; ++ *<br>
&gt; ++ * Copyright (C) Daniel Stenberg, &lt;<a href=3D"mailto:daniel@haxx.=
se" target=3D"_blank">daniel@haxx.se</a>&gt;, et al.<br>
&gt; ++ *<br>
&gt; ++ * This software is licensed as described in the file COPYING, which=
<br>
&gt; ++ * you should have received as part of this distribution. The terms<=
br>
&gt; ++ * are also available at <a href=3D"https://curl.se/docs/copyright.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://curl.se/docs/copyright.ht=
ml</a>.<br>
&gt; ++ *<br>
&gt; ++ * You may opt to use, copy, modify, merge, publish, distribute and/=
or sell<br>
&gt; ++ * copies of the Software, and permit persons to whom the Software i=
s<br>
&gt; ++ * furnished to do so, under the terms of the COPYING file.<br>
&gt; ++ *<br>
&gt; ++ * This software is distributed on an &quot;AS IS&quot; basis, WITHO=
UT WARRANTY OF ANY<br>
&gt; ++ * KIND, either express or implied.<br>
&gt; ++ *<br>
&gt; ++ * SPDX-License-Identifier: curl<br>
&gt; ++ *<br>
&gt; ++ *******************************************************************=
********/<br>
&gt; ++<br>
&gt; ++#include &quot;curl_setup.h&quot;<br>
&gt; ++<br>
&gt; ++#define GLOBAL_INIT_IS_THREADSAFE<br>
&gt; ++<br>
&gt; ++#if defined(_WIN32_WINNT) &amp;&amp; _WIN32_WINNT &gt;=3D 0x600<br>
&gt; ++<br>
&gt; ++#ifdef __MINGW32__<br>
&gt; ++#ifndef __MINGW64_VERSION_MAJOR<br>
&gt; ++#if (__MINGW32_MAJOR_VERSION &lt; 5) || \<br>
&gt; ++=C2=A0 =C2=A0 (__MINGW32_MAJOR_VERSION =3D=3D 5 &amp;&amp; __MINGW32=
_MINOR_VERSION =3D=3D 0)<br>
&gt; ++/* mingw &gt;=3D 5.0.1 defines SRWLOCK, and slightly different from =
MS define */<br>
&gt; ++typedef PVOID SRWLOCK, *PSRWLOCK;<br>
&gt; ++#endif<br>
&gt; ++#endif<br>
&gt; ++#ifndef SRWLOCK_INIT<br>
&gt; ++#define SRWLOCK_INIT NULL<br>
&gt; ++#endif<br>
&gt; ++#endif /* __MINGW32__ */<br>
&gt; ++<br>
&gt; ++#define curl_simple_lock SRWLOCK<br>
&gt; ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT<br>
&gt; ++<br>
&gt; ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)<br>
&gt; ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)<br>
&gt; ++<br>
&gt; ++#elif defined(HAVE_ATOMIC) &amp;&amp; defined(HAVE_STDATOMIC_H)<br>
&gt; ++#include &lt;stdatomic.h&gt;<br>
&gt; ++#if defined(HAVE_SCHED_YIELD)<br>
&gt; ++#include &lt;sched.h&gt;<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#define curl_simple_lock atomic_int<br>
&gt; ++#define CURL_SIMPLE_LOCK_INIT 0<br>
&gt; ++<br>
&gt; ++/* a clang-thing */<br>
&gt; ++#ifndef __has_builtin<br>
&gt; ++#define __has_builtin(x) 0<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#ifndef __INTEL_COMPILER<br>
&gt; ++/* The Intel compiler tries to look like GCC *and* clang *and* lies =
in its<br>
&gt; ++=C2=A0 =C2=A0__has_builtin() function, so override it. */<br>
&gt; ++<br>
&gt; ++/* if GCC on i386/x86_64 or if the built-in is present */<br>
&gt; ++#if ( (defined(__GNUC__) &amp;&amp; !defined(__clang__)) &amp;&amp;=
=C2=A0 =C2=A0 =C2=A0\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 (defined(__i386__) || defined(__x86_64__))) ||=
=C2=A0 =C2=A0 \<br>
&gt; ++=C2=A0 __has_builtin(__builtin_ia32_pause)<br>
&gt; ++#define HAVE_BUILTIN_IA32_PAUSE<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)<br>
&gt; ++{<br>
&gt; ++=C2=A0 for(;;) {<br>
&gt; ++=C2=A0 =C2=A0 if(!atomic_exchange_explicit(lock, true, memory_order_=
acquire))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 /* Reduce cache coherency traffic */<br>
&gt; ++=C2=A0 =C2=A0 while(atomic_load_explicit(lock, memory_order_relaxed)=
) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Reduce load (not mandatory) */<br>
&gt; ++#ifdef HAVE_BUILTIN_IA32_PAUSE<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 __builtin_ia32_pause();<br>
&gt; ++#elif defined(__aarch64__)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 __asm__ volatile(&quot;yield&quot; ::: &quot;me=
mory&quot;);<br>
&gt; ++#elif defined(HAVE_SCHED_YIELD)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sched_yield();<br>
&gt; ++#endif<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)<b=
r>
&gt; ++{<br>
&gt; ++=C2=A0 atomic_store_explicit(lock, false, memory_order_release);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++#else<br>
&gt; ++<br>
&gt; ++#undef=C2=A0 GLOBAL_INIT_IS_THREADSAFE<br>
&gt; ++<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#endif /* HEADER_CURL_EASY_LOCK_H */<br>
&gt; +diff --git a/lib/hostip.c b/lib/hostip.c<br>
&gt; +index 5231a74..d5bf881 100644<br>
&gt; +--- a/lib/hostip.c<br>
&gt; ++++ b/lib/hostip.c<br>
&gt; +@@ -68,6 +68,8 @@<br>
&gt; + #include &quot;curl_memory.h&quot;<br>
&gt; + #include &quot;memdebug.h&quot;<br>
&gt; +<br>
&gt; ++#include &quot;easy_lock.h&quot;<br>
&gt; ++<br>
&gt; + #if defined(CURLRES_SYNCH) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0defined(HAVE_ALARM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0defined(SIGALRM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +@@ -77,10 +79,6 @@<br>
&gt; + #define USE_ALARM_TIMEOUT<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +-#ifdef USE_ALARM_TIMEOUT<br>
&gt; +-#include &quot;easy_lock.h&quot;<br>
&gt; +-#endif<br>
&gt; +-<br>
&gt; + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port numbe=
r + zero */<br>
&gt; +<br>
&gt; + /*<br>
&gt; +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)=
<br>
&gt; + /* Beware this is a global and unique instance. This is used to stor=
e the<br>
&gt; +=C2=A0 =C2=A0 return address that we can jump back to from inside a s=
ignal handler. This<br>
&gt; +=C2=A0 =C2=A0 is not thread-safe stuff. */<br>
&gt; +-sigjmp_buf curl_jmpenv;<br>
&gt; +-curl_simple_lock curl_jmpenv_lock;<br>
&gt; ++static sigjmp_buf curl_jmpenv;<br>
&gt; ++static curl_simple_lock curl_jmpenv_lock;<br>
&gt; + #endif<br>
&gt; +<br>
&gt; + /* lookup address, returns entry if found and not stale */<br>
&gt; +diff --git a/lib/hostip.h b/lib/hostip.h<br>
&gt; +index baf1e58..d7f73d9 100644<br>
&gt; +--- a/lib/hostip.h<br>
&gt; ++++ b/lib/hostip.h<br>
&gt; +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data, Curl_add=
rinfo *addr,<br>
&gt; + #define CURL_INADDR_NONE INADDR_NONE<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +-#ifdef HAVE_SIGSETJMP<br>
&gt; +-/* Forward-declaration of variable defined in hostip.c. Beware this<=
br>
&gt; +- * is a global and unique instance. This is used to store the return=
<br>
&gt; +- * address that we can jump back to from inside a signal handler.<br=
>
&gt; +- * This is not thread-safe stuff.<br>
&gt; +- */<br>
&gt; +-extern sigjmp_buf curl_jmpenv;<br>
&gt; +-#endif<br>
&gt; +-<br>
&gt; + /*<br>
&gt; +=C2=A0 * Function provided by the resolver backend to set DNS servers=
 to use.<br>
&gt; +=C2=A0 */<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch =
b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..eaa6fdc327<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch<br>
&gt; @@ -0,0 +1,197 @@<br>
&gt; +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D=
"_blank">daniel@haxx.se</a>&gt;<br>
&gt; +Date: Tue, 16 May 2023 23:40:42 +0200<br>
&gt; +Subject: [PATCH] hostip: include easy_lock.h before using<br>
&gt; + GLOBAL_INIT_IS_THREADSAFE<br>
&gt; +<br>
&gt; +Since that header file is the only place that define can be defined.<=
br>
&gt; +<br>
&gt; +Reported-by: Marc Deslauriers<br>
&gt; +<br>
&gt; +Follow-up to 13718030ad4b3209<br>
&gt; +<br>
&gt; +Closes #11121<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/f446258f0269a62289cca0210157cb8558d0edc3" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb=
8558d0edc3</a>]<br>
&gt; +CVE: CVE-2023-28320<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/easy_lock.h | 109 ++++++++++++++++++++++++++++++++++++++++++++++=
++<br>
&gt; + lib/hostip.c=C2=A0 =C2=A0 |=C2=A0 10 ++---<br>
&gt; + lib/hostip.h=C2=A0 =C2=A0 |=C2=A0 =C2=A09 ----<br>
&gt; + 3 files changed, 113 insertions(+), 15 deletions(-)<br>
&gt; + create mode 100644 lib/easy_lock.h<br>
&gt; +<br>
&gt; +diff --git a/lib/easy_lock.h b/lib/easy_lock.h<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..6399a39<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/lib/easy_lock.h<br>
&gt; +@@ -0,0 +1,109 @@<br>
&gt; ++#ifndef HEADER_CURL_EASY_LOCK_H<br>
&gt; ++#define HEADER_CURL_EASY_LOCK_H<br>
&gt; ++/*******************************************************************=
********<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=C2=A0 =C2=A0_ ____=
=C2=A0 _<br>
&gt; ++ *=C2=A0 Project=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0___| | | |=C2=A0 _ \| |<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ __| | | | |_) | |<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (__| |_| |=C2=A0 _ &lt;| |___<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\___|\___/|_| \_\_____|<br>
&gt; ++ *<br>
&gt; ++ * Copyright (C) Daniel Stenberg, &lt;<a href=3D"mailto:daniel@haxx.=
se" target=3D"_blank">daniel@haxx.se</a>&gt;, et al.<br>
&gt; ++ *<br>
&gt; ++ * This software is licensed as described in the file COPYING, which=
<br>
&gt; ++ * you should have received as part of this distribution. The terms<=
br>
&gt; ++ * are also available at <a href=3D"https://curl.se/docs/copyright.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://curl.se/docs/copyright.ht=
ml</a>.<br>
&gt; ++ *<br>
&gt; ++ * You may opt to use, copy, modify, merge, publish, distribute and/=
or sell<br>
&gt; ++ * copies of the Software, and permit persons to whom the Software i=
s<br>
&gt; ++ * furnished to do so, under the terms of the COPYING file.<br>
&gt; ++ *<br>
&gt; ++ * This software is distributed on an &quot;AS IS&quot; basis, WITHO=
UT WARRANTY OF ANY<br>
&gt; ++ * KIND, either express or implied.<br>
&gt; ++ *<br>
&gt; ++ * SPDX-License-Identifier: curl<br>
&gt; ++ *<br>
&gt; ++ *******************************************************************=
********/<br>
&gt; ++<br>
&gt; ++#include &quot;curl_setup.h&quot;<br>
&gt; ++<br>
&gt; ++#define GLOBAL_INIT_IS_THREADSAFE<br>
&gt; ++<br>
&gt; ++#if defined(_WIN32_WINNT) &amp;&amp; _WIN32_WINNT &gt;=3D 0x600<br>
&gt; ++<br>
&gt; ++#ifdef __MINGW32__<br>
&gt; ++#ifndef __MINGW64_VERSION_MAJOR<br>
&gt; ++#if (__MINGW32_MAJOR_VERSION &lt; 5) || \<br>
&gt; ++=C2=A0 =C2=A0 (__MINGW32_MAJOR_VERSION =3D=3D 5 &amp;&amp; __MINGW32=
_MINOR_VERSION =3D=3D 0)<br>
&gt; ++/* mingw &gt;=3D 5.0.1 defines SRWLOCK, and slightly different from =
MS define */<br>
&gt; ++typedef PVOID SRWLOCK, *PSRWLOCK;<br>
&gt; ++#endif<br>
&gt; ++#endif<br>
&gt; ++#ifndef SRWLOCK_INIT<br>
&gt; ++#define SRWLOCK_INIT NULL<br>
&gt; ++#endif<br>
&gt; ++#endif /* __MINGW32__ */<br>
&gt; ++<br>
&gt; ++#define curl_simple_lock SRWLOCK<br>
&gt; ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT<br>
&gt; ++<br>
&gt; ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)<br>
&gt; ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)<br>
&gt; ++<br>
&gt; ++#elif defined(HAVE_ATOMIC) &amp;&amp; defined(HAVE_STDATOMIC_H)<br>
&gt; ++#include &lt;stdatomic.h&gt;<br>
&gt; ++#if defined(HAVE_SCHED_YIELD)<br>
&gt; ++#include &lt;sched.h&gt;<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#define curl_simple_lock atomic_int<br>
&gt; ++#define CURL_SIMPLE_LOCK_INIT 0<br>
&gt; ++<br>
&gt; ++/* a clang-thing */<br>
&gt; ++#ifndef __has_builtin<br>
&gt; ++#define __has_builtin(x) 0<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#ifndef __INTEL_COMPILER<br>
&gt; ++/* The Intel compiler tries to look like GCC *and* clang *and* lies =
in its<br>
&gt; ++=C2=A0 =C2=A0__has_builtin() function, so override it. */<br>
&gt; ++<br>
&gt; ++/* if GCC on i386/x86_64 or if the built-in is present */<br>
&gt; ++#if ( (defined(__GNUC__) &amp;&amp; !defined(__clang__)) &amp;&amp;=
=C2=A0 =C2=A0 =C2=A0\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 (defined(__i386__) || defined(__x86_64__))) ||=
=C2=A0 =C2=A0 \<br>
&gt; ++=C2=A0 __has_builtin(__builtin_ia32_pause)<br>
&gt; ++#define HAVE_BUILTIN_IA32_PAUSE<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)<br>
&gt; ++{<br>
&gt; ++=C2=A0 for(;;) {<br>
&gt; ++=C2=A0 =C2=A0 if(!atomic_exchange_explicit(lock, true, memory_order_=
acquire))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 /* Reduce cache coherency traffic */<br>
&gt; ++=C2=A0 =C2=A0 while(atomic_load_explicit(lock, memory_order_relaxed)=
) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Reduce load (not mandatory) */<br>
&gt; ++#ifdef HAVE_BUILTIN_IA32_PAUSE<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 __builtin_ia32_pause();<br>
&gt; ++#elif defined(__aarch64__)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 __asm__ volatile(&quot;yield&quot; ::: &quot;me=
mory&quot;);<br>
&gt; ++#elif defined(HAVE_SCHED_YIELD)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sched_yield();<br>
&gt; ++#endif<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)<b=
r>
&gt; ++{<br>
&gt; ++=C2=A0 atomic_store_explicit(lock, false, memory_order_release);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++#else<br>
&gt; ++<br>
&gt; ++#undef=C2=A0 GLOBAL_INIT_IS_THREADSAFE<br>
&gt; ++<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#endif /* HEADER_CURL_EASY_LOCK_H */<br>
&gt; +diff --git a/lib/hostip.c b/lib/hostip.c<br>
&gt; +index 5231a74..d5bf881 100644<br>
&gt; +--- a/lib/hostip.c<br>
&gt; ++++ b/lib/hostip.c<br>
&gt; +@@ -68,6 +68,8 @@<br>
&gt; + #include &quot;curl_memory.h&quot;<br>
&gt; + #include &quot;memdebug.h&quot;<br>
&gt; +<br>
&gt; ++#include &quot;easy_lock.h&quot;<br>
&gt; ++<br>
&gt; + #if defined(CURLRES_SYNCH) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0defined(HAVE_ALARM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0defined(SIGALRM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +@@ -77,10 +79,6 @@<br>
&gt; + #define USE_ALARM_TIMEOUT<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +-#ifdef USE_ALARM_TIMEOUT<br>
&gt; +-#include &quot;easy_lock.h&quot;<br>
&gt; +-#endif<br>
&gt; +-<br>
&gt; + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port numbe=
r + zero */<br>
&gt; +<br>
&gt; + /*<br>
&gt; +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)=
<br>
&gt; + /* Beware this is a global and unique instance. This is used to stor=
e the<br>
&gt; +=C2=A0 =C2=A0 return address that we can jump back to from inside a s=
ignal handler. This<br>
&gt; +=C2=A0 =C2=A0 is not thread-safe stuff. */<br>
&gt; +-sigjmp_buf curl_jmpenv;<br>
&gt; +-curl_simple_lock curl_jmpenv_lock;<br>
&gt; ++static sigjmp_buf curl_jmpenv;<br>
&gt; ++static curl_simple_lock curl_jmpenv_lock;<br>
&gt; + #endif<br>
&gt; +<br>
&gt; + /* lookup address, returns entry if found and not stale */<br>
&gt; +diff --git a/lib/hostip.h b/lib/hostip.h<br>
&gt; +index baf1e58..d7f73d9 100644<br>
&gt; +--- a/lib/hostip.h<br>
&gt; ++++ b/lib/hostip.h<br>
&gt; +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data, Curl_add=
rinfo *addr,<br>
&gt; + #define CURL_INADDR_NONE INADDR_NONE<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +-#ifdef HAVE_SIGSETJMP<br>
&gt; +-/* Forward-declaration of variable defined in hostip.c. Beware this<=
br>
&gt; +- * is a global and unique instance. This is used to store the return=
<br>
&gt; +- * address that we can jump back to from inside a signal handler.<br=
>
&gt; +- * This is not thread-safe stuff.<br>
&gt; +- */<br>
&gt; +-extern sigjmp_buf curl_jmpenv;<br>
&gt; +-#endif<br>
&gt; +-<br>
&gt; + /*<br>
&gt; +=C2=A0 * Function provided by the resolver backend to set DNS servers=
 to use.<br>
&gt; +=C2=A0 */<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.patch b/met=
a/recipes-support/curl/curl/CVE-2023-28320.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0c9b67440a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch<br>
&gt; @@ -0,0 +1,86 @@<br>
&gt; +From 13718030ad4b3209a7583b4f27f683cd3a6fa5f2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Harry Sintonen &lt;<a href=3D"mailto:sintonen@iki.fi" target=3D=
"_blank">sintonen@iki.fi</a>&gt;<br>
&gt; +Date: Tue, 25 Apr 2023 09:22:26 +0200<br>
&gt; +Subject: [PATCH] hostip: add locks around use of global buffer for al=
arm()<br>
&gt; +<br>
&gt; +When building with the sync name resolver and timeout ability we now<=
br>
&gt; +require thread-safety to be present to enable it.<br>
&gt; +<br>
&gt; +Closes #11030<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/13718030ad4b3209a7583b4f27f683cd3a6fa5f2" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683=
cd3a6fa5f2</a>]<br>
&gt; +CVE: CVE-2023-28320<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/hostip.c | 19 +++++++++++++++----<br>
&gt; + 1 file changed, 15 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/hostip.c b/lib/hostip.c<br>
&gt; +index f5bb634..5231a74 100644<br>
&gt; +--- a/lib/hostip.c<br>
&gt; ++++ b/lib/hostip.c<br>
&gt; +@@ -68,12 +68,19 @@<br>
&gt; + #include &quot;curl_memory.h&quot;<br>
&gt; + #include &quot;memdebug.h&quot;<br>
&gt; +<br>
&gt; +-#if defined(CURLRES_SYNCH) &amp;&amp; \<br>
&gt; +-=C2=A0 =C2=A0 defined(HAVE_ALARM) &amp;&amp; defined(SIGALRM) &amp;&=
amp; defined(HAVE_SIGSETJMP)<br>
&gt; ++#if defined(CURLRES_SYNCH) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; ++=C2=A0 defined(HAVE_ALARM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; ++=C2=A0 defined(SIGALRM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; ++=C2=A0 defined(HAVE_SIGSETJMP) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; ++=C2=A0 defined(GLOBAL_INIT_IS_THREADSAFE)<br>
&gt; + /* alarm-based timeouts can only be used with all the dependencies s=
atisfied */<br>
&gt; + #define USE_ALARM_TIMEOUT<br>
&gt; + #endif<br>
&gt; +<br>
&gt; ++#ifdef USE_ALARM_TIMEOUT<br>
&gt; ++#include &quot;easy_lock.h&quot;<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port numbe=
r + zero */<br>
&gt; +<br>
&gt; + /*<br>
&gt; +@@ -248,11 +255,12 @@ void Curl_hostcache_prune(struct Curl_easy *dat=
a)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Curl_share_unlock(data, CURL_LOCK_DATA_DNS);<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#ifdef HAVE_SIGSETJMP<br>
&gt; ++#ifdef USE_ALARM_TIMEOUT<br>
&gt; + /* Beware this is a global and unique instance. This is used to stor=
e the<br>
&gt; +=C2=A0 =C2=A0 return address that we can jump back to from inside a s=
ignal handler. This<br>
&gt; +=C2=A0 =C2=A0 is not thread-safe stuff. */<br>
&gt; + sigjmp_buf curl_jmpenv;<br>
&gt; ++curl_simple_lock curl_jmpenv_lock;<br>
&gt; + #endif<br>
&gt; +<br>
&gt; + /* lookup address, returns entry if found and not stale */<br>
&gt; +@@ -614,7 +622,6 @@ enum resolve_t Curl_resolv(struct connectdata *co=
nn,<br>
&gt; + static<br>
&gt; + RETSIGTYPE alarmfunc(int sig)<br>
&gt; + {<br>
&gt; +-=C2=A0 /* this is for &quot;-ansi -Wall -pedantic&quot; to stop comp=
laining!=C2=A0 =C2=A0(rabe) */<br>
&gt; +=C2=A0 =C2=A0(void)sig;<br>
&gt; +=C2=A0 =C2=A0siglongjmp(curl_jmpenv, 1);<br>
&gt; + }<br>
&gt; +@@ -695,6 +702,8 @@ enum resolve_t Curl_resolv_timeout(struct connect=
data *conn,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 This should be the last thing we do before calli=
ng Curl_resolv(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 as otherwise we&#39;d have to worry about variab=
les that get modified<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 before we invoke Curl_resolv() (and thus use &qu=
ot;volatile&quot;). */<br>
&gt; ++=C2=A0 curl_simple_lock_lock(&amp;curl_jmpenv_lock);<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0if(sigsetjmp(curl_jmpenv, 1)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* this is coming from a siglongjmp() after an al=
arm signal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0failf(data, &quot;name lookup timed out&quot;);<b=
r>
&gt; +@@ -763,6 +772,8 @@ clean_up:<br>
&gt; + #endif<br>
&gt; + #endif /* HAVE_SIGACTION */<br>
&gt; +<br>
&gt; ++=C2=A0 curl_simple_lock_unlock(&amp;curl_jmpenv_lock);<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0/* switch back the alarm() to either zero or to what it =
was before minus<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the time we spent until now! */<br>
&gt; +=C2=A0 =C2=A0if(prev_alarm) {<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.69.1.b=
b" rel=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a> b/meta/recipes-s=
upport/curl/<a href=3D"http://curl_7.69.1.bb" rel=3D"noreferrer" target=3D"=
_blank">curl_7.69.1.bb</a><br>
&gt; index 13ec117099..ce81df0f05 100644<br>
&gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.69.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a><br>
&gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.69.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a><br>
&gt; @@ -50,6 +50,8 @@ SRC_URI =3D &quot;<a href=3D"https://curl.haxx.se/do=
wnload/curl-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https:/=
/curl.haxx.se/download/curl-${PV}.tar.bz2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27535-p=
re1.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27535.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27536.p=
atch \<br>
<br>
Shouldn&#39;t you be adding CVE-2023-28320-pre1.patch here?<br>
<br>
Steve<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-28320.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-28320-fol1.p=
atch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;ec5fc263f898a3dfef08e805f1ecca42&quot;=
<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184058): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184058" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/184058</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10005306=
4/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100053064/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000000f79ea0600234870--

