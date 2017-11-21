Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id BFC9478842
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 23:05:40 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m11so8324500iti.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 15:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=49s8aPkszchcZL6DrWdD5dmGp8L1yUE4LunNWs/b/YI=;
	b=MZ3NFJ79Fo0IKOioQD4xqukcPfnuYjvFCJCIRb3+CiZzZFVkvsv5bPVY1Us9h1HluS
	ya4xRvSbc9srECQ3n7yaZPik7AMpXZAbWE/xV3jGbjJCu2tCH5v/VQ8c3C4E5uppFA8k
	Gk5Xa/3X2cPtWs5nVjmovNP51BS7+EEuGtrCIpij4yCT6DnVachOMrPMi4vONr4Stcej
	Ab/w787SkqDVziFqTl1BhzYNfKi7Tpkx/yb/cAIUXA+gbFtzad0KRpwaFivPRxMijyEB
	ZYV7hzPC4yorvInS87x1qYJFpoMBleEwRlOxQn5uPkA9DKDaoN7jx1Z5sK/eEzTE1eMk
	3/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=49s8aPkszchcZL6DrWdD5dmGp8L1yUE4LunNWs/b/YI=;
	b=LEA9CJBtNruKMed7L9WnJGztme6NT28GKt/CsfjlJDj/X3mZaDf6oagXEUhQE/ZdZW
	SadKEwHmrsMG6Nd3IHsT6CIYetLQYlBnW32lxc+YdARL2+yW1cexwW5wcGNzuPalZfZA
	u/A9baDeOo53oohBLwKJevVY116H0oUTsQTllo5qFgxLrY1/CWs3bp5quyt3G7imgyhw
	u9GFVkuSbNFwj+Re32MyB4PzXPr1pIgnYDYhgmEMI1GYPLKzVtthThVEF8AzGQxoj5Gs
	AdfnLtKo0SL0usLeS/m5eRtlHfdSM5a3VC9AQwRC2BnVEvdH2Ws1ocB0ZdxdctFgzMVt
	2tog==
X-Gm-Message-State: AJaThX4rguxD3GqwQgPn+Cxy8rNyIKU02WeEJDrI53o0FnFSeAfRbcXg
	d9suEnNQEMh07ujTdmRYYXxRw/J5YJc3UXSk6afkfw==
X-Google-Smtp-Source: AGs4zMaxiSDMSWlE8Cf0M9E5uDA5eXCblmxpYDB2z7fz2rBI6UOmIHtZpskKCe9hwa0anzHgFZLQoUG30u0nCK/3sBw=
X-Received: by 10.36.147.198 with SMTP id y189mr4277665itd.6.1511305541837;
	Tue, 21 Nov 2017 15:05:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Tue, 21 Nov 2017 15:05:21 -0800 (PST)
In-Reply-To: <1511163855-163322-1-git-send-email-zhixiong.chi@windriver.com>
References: <1511163855-163322-1-git-send-email-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Nov 2017 23:05:21 +0000
Message-ID: <CAJTo0LY=Wii9Ys1R1Ny3U3X1T-J=MgVCXXDA7d4HH6n5vLtqcw@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: malloc: Add missing arena lock in malloc_info
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
X-List-Received-Date: Tue, 21 Nov 2017 23:05:40 -0000
Content-Type: multipart/alternative; boundary="94eb2c089e14f7fd3c055e863d5d"

--94eb2c089e14f7fd3c055e863d5d
Content-Type: text/plain; charset="UTF-8"

What glibc release is this in?  We've an upgrade patch pending that bumps
it to 77f921dac17c5fa99bd9e926d926c327982895f7.

Ross

On 20 November 2017 at 07:44, Zhixiong Chi <zhixiong.chi@windriver.com>
wrote:

> There are the multiple process crashes seen while using malloc_info.
> Obtain the size information while the arena lock is acquired, and only
> print it later.
>
> Backport patch from https://sourceware.org/git/gitweb.cgi?p=glibc.git;
> h=7a9368a1174cb15b9f1d6342e0e10dd90dae238d
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  ...loc-add-missing-arena-lock-in-malloc-info.patch | 172
> +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.26.bb              |   1 +
>  2 files changed, 173 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/
> 0029-malloc-add-missing-arena-lock-in-malloc-info.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0029-malloc-add-missing-
> arena-lock-in-malloc-info.patch b/meta/recipes-core/glibc/
> glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch
> new file mode 100644
> index 0000000..e12400d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0029-malloc-add-missing-
> arena-lock-in-malloc-info.patch
> @@ -0,0 +1,172 @@
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Wed, 15 Nov 2017 11:39:01 +0100
> +Subject: [PATCH] malloc: Add missing arena lock in malloc_info [BZ #22408]
> +
> +Obtain the size information while the arena lock is acquired, and only
> +print it later.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +Index: git/malloc/Makefile
> +===================================================================
> +--- git.orig/malloc/Makefile   2017-09-04 17:34:06.758018978 +0800
> ++++ git/malloc/Makefile        2017-11-20 14:57:43.440337572 +0800
> +@@ -34,6 +34,7 @@
> +        tst-interpose-nothread \
> +        tst-interpose-thread \
> +        tst-alloc_buffer \
> ++       tst-malloc_info \
> +
> + tests-static := \
> +        tst-interpose-static-nothread \
> +@@ -242,3 +243,5 @@
> + $(objpfx)tst-dynarray-fail-mem.out: $(objpfx)tst-dynarray-fail.out
> +       $(common-objpfx)malloc/mtrace $(objpfx)tst-dynarray-fail.mtrace >
> $@; \
> +       $(evaluate-test)
> ++
> ++$(objpfx)tst-malloc_info: $(shared-thread-library)
> +Index: git/malloc/malloc.c
> +===================================================================
> +--- git.orig/malloc/malloc.c   2017-09-04 17:34:06.758018978 +0800
> ++++ git/malloc/malloc.c        2017-11-20 15:01:02.412338959 +0800
> +@@ -5547,6 +5547,15 @@
> +         avail += sizes[NFASTBINS - 1 + i].total;
> +       }
> +
> ++      size_t heap_size = 0;
> ++      size_t heap_mprotect_size = 0;
> ++      if (ar_ptr != &main_arena)
> ++      {
> ++        heap_info *heap = heap_for_ptr (top (ar_ptr));
> ++        heap_size = heap->size;
> ++        heap_mprotect_size = heap->mprotect_size;
> ++      }
> ++
> +       __libc_lock_unlock (ar_ptr->mutex);
> +
> +       total_nfastblocks += nfastblocks;
> +@@ -5580,13 +5589,12 @@
> +
> +       if (ar_ptr != &main_arena)
> +       {
> +-        heap_info *heap = heap_for_ptr (top (ar_ptr));
> +         fprintf (fp,
> +                  "<aspace type=\"total\" size=\"%zu\"/>\n"
> +                  "<aspace type=\"mprotect\" size=\"%zu\"/>\n",
> +-                 heap->size, heap->mprotect_size);
> +-        total_aspace += heap->size;
> +-        total_aspace_mprotect += heap->mprotect_size;
> ++                 heap_size, heap_mprotect_size);
> ++        total_aspace += heap_size;
> ++        total_aspace_mprotect += heap_mprotect_size;
> +       }
> +       else
> +       {
> +Index: git/malloc/tst-malloc_info.c
> +===================================================================
> +--- /dev/null  1970-01-01 00:00:00.000000000 +0000
> ++++ git/malloc/tst-malloc_info.c       2017-11-20 15:02:03.208339383 +0800
> +@@ -0,0 +1,101 @@
> ++/* Smoke test for malloc_info.
> ++   Copyright (C) 2017 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++/* The purpose of this test is to provide a quick way to run
> ++   malloc_info in a multi-threaded process.  */
> ++
> ++#include <array_length.h>
> ++#include <malloc.h>
> ++#include <stdlib.h>
> ++#include <support/support.h>
> ++#include <support/xthread.h>
> ++
> ++/* This barrier is used to have the main thread wait until the helper
> ++   threads have performed their allocations.  */
> ++static pthread_barrier_t barrier;
> ++
> ++enum
> ++  {
> ++    /* Number of threads performing allocations.  */
> ++    thread_count  = 4,
> ++
> ++    /* Amount of memory allocation per thread.  This should be large
> ++       enough to cause the allocation of multiple heaps per arena.  */
> ++    per_thread_allocations
> ++      = sizeof (void *) == 4 ? 16 * 1024 * 1024 : 128 * 1024 * 1024,
> ++  };
> ++
> ++static void *
> ++allocation_thread_function (void *closure)
> ++{
> ++  struct list
> ++  {
> ++    struct list *next;
> ++    long dummy[4];
> ++  };
> ++
> ++  struct list *head = NULL;
> ++  size_t allocated = 0;
> ++  while (allocated < per_thread_allocations)
> ++    {
> ++      struct list *new_head = xmalloc (sizeof (*new_head));
> ++      allocated += sizeof (*new_head);
> ++      new_head->next = head;
> ++      head = new_head;
> ++    }
> ++
> ++  xpthread_barrier_wait (&barrier);
> ++
> ++  /* Main thread prints first statistics here.  */
> ++
> ++  xpthread_barrier_wait (&barrier);
> ++
> ++  while (head != NULL)
> ++    {
> ++      struct list *next_head = head->next;
> ++      free (head);
> ++      head = next_head;
> ++    }
> ++
> ++  return NULL;
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  xpthread_barrier_init (&barrier, NULL, thread_count + 1);
> ++
> ++  pthread_t threads[thread_count];
> ++  for (size_t i = 0; i < array_length (threads); ++i)
> ++    threads[i] = xpthread_create (NULL, allocation_thread_function,
> NULL);
> ++
> ++  xpthread_barrier_wait (&barrier);
> ++  puts ("info: After allocation:");
> ++  malloc_info (0, stdout);
> ++
> ++  xpthread_barrier_wait (&barrier);
> ++  for (size_t i = 0; i < array_length (threads); ++i)
> ++    xpthread_join (threads[i]);
> ++
> ++  puts ("\ninfo: After deallocation:");
> ++  malloc_info (0, stdout);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb
> b/meta/recipes-core/glibc/glibc_2.26.bb
> index 135ec4f..05d1e2c 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> @@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc
> \
>             file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
> \
>             file://0027-glibc-reset-dl-load-write-lock-after-forking.patch
> \
>             file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
> +           file://0029-malloc-add-missing-arena-lock-in-malloc-info.patch
> \
>  "
>
>  NATIVESDKFIXES ?= ""
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c089e14f7fd3c055e863d5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What glibc release is this in?=C2=A0 We&#39;ve an upgrade =
patch pending that bumps it to=C2=A077f921dac17c5fa99bd9e926d926c327982895f=
7.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On 20 November 2017 at 07:44, Zhixiong Chi <span dir=
=3D"ltr">&lt;<a href=3D"mailto:zhixiong.chi@windriver.com" target=3D"_blank=
">zhixiong.chi@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">There are the multiple process crashes seen while using malloc_in=
fo.<br>
Obtain the size information while the arena lock is acquired, and only<br>
print it later.<br>
<br>
Backport patch from <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dgl=
ibc.git" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/git/<w=
br>gitweb.cgi?p=3Dglibc.git</a>;<br>
h=3D<wbr>7a9368a1174cb15b9f1d6342e0e10d<wbr>d90dae238d<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0...loc-add-missing-arena-lock-<wbr>in-malloc-info.patch | 172 +++++++=
++++++++++++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_<wbr>2.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 173 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0029-malloc-add=
-missing-arena-<wbr>lock-in-malloc-info.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/<wbr>glibc/0029-malloc-add-missing-<wb=
r>arena-lock-in-malloc-info.<wbr>patch b/meta/recipes-core/glibc/<wbr>glibc=
/0029-malloc-add-missing-<wbr>arena-lock-in-malloc-info.<wbr>patch<br>
new file mode 100644<br>
index 0000000..e12400d<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/<wbr>glibc/0029-malloc-add-missing-<wbr>arena=
-lock-in-malloc-info.<wbr>patch<br>
@@ -0,0 +1,172 @@<br>
+From: Florian Weimer &lt;<a href=3D"mailto:fweimer@redhat.com">fweimer@red=
hat.com</a>&gt;<br>
+Date: Wed, 15 Nov 2017 11:39:01 +0100<br>
+Subject: [PATCH] malloc: Add missing arena lock in malloc_info [BZ #22408]=
<br>
+<br>
+Obtain the size information while the arena lock is acquired, and only<br>
+print it later.<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.c=
om">zhixiong.chi@windriver.com</a>&gt;<br>
+<br>
+Index: git/malloc/Makefile<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- git.orig/malloc/Makefile=C2=A0 =C2=A02017-09-04 17:34:06.758018978 +08=
00<br>
++++ git/malloc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 2017-11-20 14:57:43.440=
337572 +0800<br>
+@@ -34,6 +34,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst-interpose-nothread \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst-interpose-thread \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst-alloc_buffer \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0tst-malloc_info \<br>
+<br>
+ tests-static :=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst-interpose-static-nothread \<br>
+@@ -242,3 +243,5 @@<br>
+ $(objpfx)tst-dynarray-fail-<wbr>mem.out: $(objpfx)tst-dynarray-fail.out<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(common-objpfx)malloc/mtrace $(objpfx)tst-dyna=
rray-fail.<wbr>mtrace &gt; $@; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(evaluate-test)<br>
++<br>
++$(objpfx)tst-malloc_info: $(shared-thread-library)<br>
+Index: git/malloc/malloc.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- git.orig/malloc/malloc.c=C2=A0 =C2=A02017-09-04 17:34:06.758018978 +08=
00<br>
++++ git/malloc/malloc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2017-11-20 15:01:02.412=
338959 +0800<br>
+@@ -5547,6 +5547,15 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avail +=3D sizes[NFASTBINS - 1 + i].tota=
l;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 size_t heap_size =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t heap_mprotect_size =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 if (ar_ptr !=3D &amp;main_arena)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 heap_info *heap =3D heap_for_ptr (top (ar_ptr=
));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 heap_size =3D heap-&gt;size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 heap_mprotect_size =3D heap-&gt;mprotect_size=
;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__libc_lock_unlock (ar_ptr-&gt;mutex);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0total_nfastblocks +=3D nfastblocks;<br>
+@@ -5580,13 +5589,12 @@<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ar_ptr !=3D &amp;main_arena)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 heap_info *heap =3D heap_for_ptr (top (ar_ptr=
));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (fp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;a=
space type=3D\&quot;total\&quot; size=3D\&quot;%zu\&quot;/&gt;\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;a=
space type=3D\&quot;mprotect\&quot; size=3D\&quot;%zu\&quot;/&gt;\n&quot;,<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0heap-&gt;si=
ze, heap-&gt;mprotect_size);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_aspace +=3D heap-&gt;size;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_aspace_mprotect +=3D heap-&gt;mprotect_=
size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0heap_size, =
heap_mprotect_size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_aspace +=3D heap_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_aspace_mprotect +=3D heap_mprotect_size=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+Index: git/malloc/tst-malloc_info.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null=C2=A0 1970-01-01 00:00:00.000000000 +0000<br>
++++ git/malloc/tst-malloc_info.c=C2=A0 =C2=A0 =C2=A0 =C2=A02017-11-20 15:0=
2:03.208339383 +0800<br>
+@@ -0,0 +1,101 @@<br>
++/* Smoke test for malloc_info.<br>
++=C2=A0 =C2=A0Copyright (C) 2017 Free Software Foundation, Inc.<br>
++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or<br>
++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<b=
r>
++=C2=A0 =C2=A0License as published by the Free Software Foundation; either=
<br>
++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later ve=
rsion.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will be=
 useful,<br>
++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the GNU<br>
++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
++<br>
++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General Pu=
blic<br>
++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"noreferr=
er" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;<wbr>.=C2=A0 */<b=
r>
++<br>
++/* The purpose of this test is to provide a quick way to run<br>
++=C2=A0 =C2=A0malloc_info in a multi-threaded process.=C2=A0 */<br>
++<br>
++#include &lt;array_length.h&gt;<br>
++#include &lt;malloc.h&gt;<br>
++#include &lt;stdlib.h&gt;<br>
++#include &lt;support/support.h&gt;<br>
++#include &lt;support/xthread.h&gt;<br>
++<br>
++/* This barrier is used to have the main thread wait until the helper<br>
++=C2=A0 =C2=A0threads have performed their allocations.=C2=A0 */<br>
++static pthread_barrier_t barrier;<br>
++<br>
++enum<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 /* Number of threads performing allocations.=C2=A0 */<br>
++=C2=A0 =C2=A0 thread_count=C2=A0 =3D 4,<br>
++<br>
++=C2=A0 =C2=A0 /* Amount of memory allocation per thread.=C2=A0 This shoul=
d be large<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0enough to cause the allocation of multiple hea=
ps per arena.=C2=A0 */<br>
++=C2=A0 =C2=A0 per_thread_allocations<br>
++=C2=A0 =C2=A0 =C2=A0 =3D sizeof (void *) =3D=3D 4 ? 16 * 1024 * 1024 : 12=
8 * 1024 * 1024,<br>
++=C2=A0 };<br>
++<br>
++static void *<br>
++allocation_thread_function (void *closure)<br>
++{<br>
++=C2=A0 struct list<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 struct list *next;<br>
++=C2=A0 =C2=A0 long dummy[4];<br>
++=C2=A0 };<br>
++<br>
++=C2=A0 struct list *head =3D NULL;<br>
++=C2=A0 size_t allocated =3D 0;<br>
++=C2=A0 while (allocated &lt; per_thread_allocations)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 struct list *new_head =3D xmalloc (sizeof (*new_head=
));<br>
++=C2=A0 =C2=A0 =C2=A0 allocated +=3D sizeof (*new_head);<br>
++=C2=A0 =C2=A0 =C2=A0 new_head-&gt;next =3D head;<br>
++=C2=A0 =C2=A0 =C2=A0 head =3D new_head;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 xpthread_barrier_wait (&amp;barrier);<br>
++<br>
++=C2=A0 /* Main thread prints first statistics here.=C2=A0 */<br>
++<br>
++=C2=A0 xpthread_barrier_wait (&amp;barrier);<br>
++<br>
++=C2=A0 while (head !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 struct list *next_head =3D head-&gt;next;<br>
++=C2=A0 =C2=A0 =C2=A0 free (head);<br>
++=C2=A0 =C2=A0 =C2=A0 head =3D next_head;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 return NULL;<br>
++}<br>
++<br>
++static int<br>
++do_test (void)<br>
++{<br>
++=C2=A0 xpthread_barrier_init (&amp;barrier, NULL, thread_count + 1);<br>
++<br>
++=C2=A0 pthread_t threads[thread_count];<br>
++=C2=A0 for (size_t i =3D 0; i &lt; array_length (threads); ++i)<br>
++=C2=A0 =C2=A0 threads[i] =3D xpthread_create (NULL, allocation_thread_fun=
ction, NULL);<br>
++<br>
++=C2=A0 xpthread_barrier_wait (&amp;barrier);<br>
++=C2=A0 puts (&quot;info: After allocation:&quot;);<br>
++=C2=A0 malloc_info (0, stdout);<br>
++<br>
++=C2=A0 xpthread_barrier_wait (&amp;barrier);<br>
++=C2=A0 for (size_t i =3D 0; i &lt; array_length (threads); ++i)<br>
++=C2=A0 =C2=A0 xpthread_join (threads[i]);<br>
++<br>
++=C2=A0 puts (&quot;\ninfo: After deallocation:&quot;);<br>
++=C2=A0 malloc_info (0, stdout);<br>
++<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++#include &lt;support/test-driver.c&gt;<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=
=3D"noreferrer" target=3D"_blank">glib<wbr>c_2.26.bb</a> b/meta/recipes-cor=
e/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noreferrer" target=3D"_blan=
k">glib<wbr>c_2.26.bb</a><br>
index 135ec4f..05d1e2c 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glib<wbr>c_2.26.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glib<wbr>c_2.26.bb</a><br>
@@ -43,6 +43,7 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${<wbr>SRCBRA=
NCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0026-assert-Suppress-<wbr>=
pedantic-warning-caused-by-<wbr>statement.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-glibc-reset-dl-<wbr>l=
oad-write-lock-after-forking.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0028-Bug-4578-add-ld.<wbr>=
so-lock-while-fork.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0029-malloc-add-<wbr>missi=
ng-arena-lock-in-malloc-<wbr>info.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0NATIVESDKFIXES ?=3D &quot;&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--94eb2c089e14f7fd3c055e863d5d--
