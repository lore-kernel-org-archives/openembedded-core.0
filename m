Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD37C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 21:18:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8016.1660598293224869801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 14:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CgW2nDyc;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id j26so2131639wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 14:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=R3a4VwaxXpwrqZi20cWIvYj/o+MfMqB10QIeNCuDWGw=;
        b=CgW2nDycfRueSEL5asybVuslm5EmglDSvcdP6f/S4boIZmdMteq1c7vVNUWQs/nkhy
         nbxizkWLWnOCNeH1pfZmHmMVjM30Sv9uwBsfJ6tLc2hLdJbzHL4ke23627nn3PpwJD6X
         Wg9ES3i2ZVMsnW7wLm/9xUv7rL+r72R5TNIrAenXXFVtKJs2BuVBWo9wgQ2GXEcL1zeO
         CqdmTIv3NDzCzipKRwXgCu4ZUUjWGTBzAgnhyWL/cGMc+MJR9Etne9pT/yRsZmzldqL0
         Bs0Se9iwJezOD+8WyINj4CjPAAZfY1aSSbU4d30H1WXlPNR/97o6IRbK6xHZgzhc3nWt
         MInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=R3a4VwaxXpwrqZi20cWIvYj/o+MfMqB10QIeNCuDWGw=;
        b=zhbF1Nh1h0aAK/hHJ6T3bud56mm83PMl/E57XRCUJXusY8Umf1fRjTNWnW9GNo72mU
         B7iBJH43bcmV1/mJENIxNqCcWrBUPTPRhh895jf5CDDAwejBOoioGr6oJihYewd5AcM5
         yyCBxd7tZpKFDHmFTycw+YMhPCWyhAdrn7RVIsNoGbRHXUZviP1zl6NzP56EMhaX89km
         fn9aTjjfJaBf58it4LVQzf5Ll3nQXtMZmT6N3BnuKcKKnxo/4qT/jbuzNTUpBIy5l2MC
         74mCl7zm8WOnrZhzr/11ToKTPrEGvQd8NuWy3XdjCanPtpfuZRCjNFi6st1L8tB+J88S
         7LLQ==
X-Gm-Message-State: ACgBeo1ymRsVDGe3+cEvHnBfCuMSchTZEKf4qkSAriGgskhYjxOlJDYT
	ewe2BbtBMLDwZAuKEypyovGNwsYsuyAdXyuJ1JAl1wsgAU8=
X-Google-Smtp-Source: 
 AA6agR6fqSzOmBXQXhD6REuBB59iTYCNvhoRfBfq+3cGbn27prCsEKFjf3GRD3c7/Jwq4u/VFLdw8wrm9IRhTnAhn/s=
X-Received: by 2002:a7b:cc0d:0:b0:3a5:1eae:3948 with SMTP id
 f13-20020a7bcc0d000000b003a51eae3948mr11318149wmh.32.1660598291249; Mon, 15
 Aug 2022 14:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220812192725.2600254-1-raj.khem@gmail.com>
 <20220813123848.3647980-1-Martin.Jansa@gmail.com>
In-Reply-To: <20220813123848.3647980-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Aug 2022 23:17:20 +0200
Message-ID: 
 <CA+chaQeKBq8cbnGB35Dg6aOx4DMkmSAOByw==SG8y_DKahm9rA@mail.gmail.com>
Subject: Re: [PATCH 2/2] glibc: apply proposed patch from upstream instead of
 revert
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000043c21205e64e2bb8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 21:18:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169413

--00000000000043c21205e64e2bb8
Content-Type: text/plain; charset="UTF-8"

Another version was proposed upstream
https://sourceware.org/bugzilla/attachment.cgi?id=14283

lets wait a bit more on this one.

On Sat, Aug 13, 2022 at 2:39 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...lement-a-useful-version-of-_startup_.patch | 128 ------------------
>  .../glibc/glibc/0025-startup-Force-O2.patch   |  28 ++++
>  meta/recipes-core/glibc/glibc_2.36.bb         |   2 +-
>  3 files changed, 29 insertions(+), 129 deletions(-)
>  delete mode 100644
> meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
>  create mode 100644
> meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> b/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> deleted file mode 100644
> index 1982598339..0000000000
> ---
> a/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -From 18b04419d5984f5c6c89fab5e72fcdd1942491cb Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 7 Aug 2022 12:51:48 +0200
> -Subject: [PATCH] Revert "Linux: Implement a useful version of
> _startup_fatal"
> -
> -This reverts commit a2a6bce7d7e52c1c34369a7da62c501cc350bc31.
> -
> -Upstream-Status: Inappropriate [temporary work around]
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
> - sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
> - sysdeps/unix/sysv/linux/startup.h      | 39 --------------------------
> - 3 files changed, 19 insertions(+), 65 deletions(-)
> - delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
> - delete mode 100644 sysdeps/unix/sysv/linux/startup.h
> -
> -diff --git a/sysdeps/unix/sysv/linux/i386/startup.h
> b/sysdeps/unix/sysv/linux/i386/startup.h
> -index 213805d7d2..67c9310f3a 100644
> ---- a/sysdeps/unix/sysv/linux/i386/startup.h
> -+++ b/sysdeps/unix/sysv/linux/i386/startup.h
> -@@ -1,5 +1,5 @@
> - /* Linux/i386 definitions of functions used by static libc main startup.
> --   Copyright (C) 2022 Free Software Foundation, Inc.
> -+   Copyright (C) 2017-2022 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> -
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -16,7 +16,22 @@
> -    License along with the GNU C Library; if not, see
> -    <https://www.gnu.org/licenses/>.  */
> -
> --/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
> --#define I386_USE_SYSENTER 0
> -+#if BUILD_PIE_DEFAULT
> -+/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE.  */
> -+# define I386_USE_SYSENTER 0
> -
> --#include_next <startup.h>
> -+# include <sysdep.h>
> -+# include <abort-instr.h>
> -+
> -+__attribute__ ((__noreturn__))
> -+static inline void
> -+_startup_fatal (const char *message __attribute__ ((unused)))
> -+{
> -+  /* This is only called very early during startup in static PIE.
> -+     FIXME: How can it be improved?  */
> -+  ABORT_INSTRUCTION;
> -+  __builtin_unreachable ();
> -+}
> -+#else
> -+# include_next <startup.h>
> -+#endif
> -diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h
> b/sysdeps/unix/sysv/linux/ia64/startup.h
> -deleted file mode 100644
> -index 77f29f15a2..0000000000
> ---- a/sysdeps/unix/sysv/linux/ia64/startup.h
> -+++ /dev/null
> -@@ -1,22 +0,0 @@
> --/* Linux/ia64 definitions of functions used by static libc main startup.
> --   Copyright (C) 2022 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, see
> --   <https://www.gnu.org/licenses/>.  */
> --
> --/* This code is used before the TCB is set up.  */
> --#define IA64_USE_NEW_STUB 0
> --
> --#include_next <startup.h>
> -diff --git a/sysdeps/unix/sysv/linux/startup.h
> b/sysdeps/unix/sysv/linux/startup.h
> -deleted file mode 100644
> -index 39859b404a..0000000000
> ---- a/sysdeps/unix/sysv/linux/startup.h
> -+++ /dev/null
> -@@ -1,39 +0,0 @@
> --/* Linux definitions of functions used by static libc main startup.
> --   Copyright (C) 2017-2022 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, see
> --   <https://www.gnu.org/licenses/>.  */
> --
> --#ifdef SHARED
> --# include_next <startup.h>
> --#else
> --# include <sysdep.h>
> --
> --/* Avoid a run-time invocation of strlen.  */
> --#define _startup_fatal(message)                                         \
> --  do                                                                    \
> --    {                                                                   \
> --      size_t __message_length = __builtin_strlen (message);             \
> --      if (! __builtin_constant_p (__message_length))                    \
> --        {                                                               \
> --          extern void _startup_fatal_not_constant (void);               \
> --          _startup_fatal_not_constant ();                               \
> --        }                                                               \
> --      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),           \
> --                             __message_length);                         \
> --      INTERNAL_SYSCALL_CALL (exit_group, 127);                          \
> --    }                                                                   \
> --  while (0)
> --#endif  /* !SHARED */
> diff --git a/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
> b/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
> new file mode 100644
> index 0000000000..1f3426295a
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
> @@ -0,0 +1,28 @@
> +From 5e635e5dc7d1b21a78f38109d4f43a03bec865c8 Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Sun, 7 Aug 2022 12:51:48 +0200
> +Subject: [PATCH] startup: Force -O2
> +
> +Upstream-Status: Submitted [
> https://sourceware.org/bugzilla/show_bug.cgi?id=29249]
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + sysdeps/unix/sysv/linux/startup.h | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/sysdeps/unix/sysv/linux/startup.h
> b/sysdeps/unix/sysv/linux/startup.h
> +index 39859b404a..e1fc1b682d 100644
> +--- a/sysdeps/unix/sysv/linux/startup.h
> ++++ b/sysdeps/unix/sysv/linux/startup.h
> +@@ -21,6 +21,11 @@
> + #else
> + # include <sysdep.h>
> +
> ++# if !defined __OPTIMIZE__ || __OPTIMIZE__ < 2
> ++/* Force to fold strlen.  */
> ++#  pragma GCC optimize(2)
> ++# endif
> ++
> + /* Avoid a run-time invocation of strlen.  */
> + #define _startup_fatal(message)                                         \
> +   do                                                                    \
> diff --git a/meta/recipes-core/glibc/glibc_2.36.bb
> b/meta/recipes-core/glibc/glibc_2.36.bb
> index 6ccb392f09..1cfa8101ef 100644
> --- a/meta/recipes-core/glibc/glibc_2.36.bb
> +++ b/meta/recipes-core/glibc/glibc_2.36.bb
> @@ -50,7 +50,7 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>
> file://0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
>
> file://0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>
> file://0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
> -
>  file://0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
> +           file://0025-startup-Force-O2.patch \
>  "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.37.2
>
>

--00000000000043c21205e64e2bb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Another version was proposed upstream<div><a href=3D"https=
://sourceware.org/bugzilla/attachment.cgi?id=3D14283">https://sourceware.or=
g/bugzilla/attachment.cgi?id=3D14283</a><br></div><div><br></div><div>lets =
wait a bit more on this one.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 13, 2022 at 2:39 PM Martin Ja=
nsa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sig=
ned-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0...lement-a-useful-version-of-_startup_.patch | 128 -----------------=
-<br>
=C2=A0.../glibc/glibc/0025-startup-Force-O2.patch=C2=A0 =C2=A0|=C2=A0 28 ++=
++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A03 files changed, 29 insertions(+), 129 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/glibc/glibc/0025-Revert-Linux-Im=
plement-a-useful-version-of-_startup_.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0025-startup-Force-O=
2.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-us=
eful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0025-Revert=
-Linux-Implement-a-useful-version-of-_startup_.patch<br>
deleted file mode 100644<br>
index 1982598339..0000000000<br>
--- a/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-ve=
rsion-of-_startup_.patch<br>
+++ /dev/null<br>
@@ -1,128 +0,0 @@<br>
-From 18b04419d5984f5c6c89fab5e72fcdd1942491cb Mon Sep 17 00:00:00 2001<br>
-From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
-Date: Sun, 7 Aug 2022 12:51:48 +0200<br>
-Subject: [PATCH] Revert &quot;Linux: Implement a useful version of _startu=
p_fatal&quot;<br>
-<br>
-This reverts commit a2a6bce7d7e52c1c34369a7da62c501cc350bc31.<br>
-<br>
-Upstream-Status: Inappropriate [temporary work around]<br>
-<br>
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
----<br>
- sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---<br>
- sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------<br>
- sysdeps/unix/sysv/linux/startup.h=C2=A0 =C2=A0 =C2=A0 | 39 --------------=
------------<br>
- 3 files changed, 19 insertions(+), 65 deletions(-)<br>
- delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h<br>
- delete mode 100644 sysdeps/unix/sysv/linux/startup.h<br>
-<br>
-diff --git a/sysdeps/unix/sysv/linux/i386/startup.h b/sysdeps/unix/sysv/li=
nux/i386/startup.h<br>
-index 213805d7d2..67c9310f3a 100644<br>
---- a/sysdeps/unix/sysv/linux/i386/startup.h<br>
-+++ b/sysdeps/unix/sysv/linux/i386/startup.h<br>
-@@ -1,5 +1,5 @@<br>
- /* Linux/i386 definitions of functions used by static libc main startup.<=
br>
--=C2=A0 =C2=A0Copyright (C) 2022 Free Software Foundation, Inc.<br>
-+=C2=A0 =C2=A0Copyright (C) 2017-2022 Free Software Foundation, Inc.<br>
-=C2=A0 =C2=A0 This file is part of the GNU C Library.<br>
- <br>
-=C2=A0 =C2=A0 The GNU C Library is free software; you can redistribute it =
and/or<br>
-@@ -16,7 +16,22 @@<br>
-=C2=A0 =C2=A0 License along with the GNU C Library; if not, see<br>
-=C2=A0 =C2=A0 &lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
- <br>
--/* Can&#39;t use &quot;call *%gs:SYSINFO_OFFSET&quot; during startup.=C2=
=A0 */<br>
--#define I386_USE_SYSENTER 0<br>
-+#if BUILD_PIE_DEFAULT<br>
-+/* Can&#39;t use &quot;call *%gs:SYSINFO_OFFSET&quot; during statup in st=
atic PIE.=C2=A0 */<br>
-+# define I386_USE_SYSENTER 0<br>
- <br>
--#include_next &lt;startup.h&gt;<br>
-+# include &lt;sysdep.h&gt;<br>
-+# include &lt;abort-instr.h&gt;<br>
-+<br>
-+__attribute__ ((__noreturn__))<br>
-+static inline void<br>
-+_startup_fatal (const char *message __attribute__ ((unused)))<br>
-+{<br>
-+=C2=A0 /* This is only called very early during startup in static PIE.<br=
>
-+=C2=A0 =C2=A0 =C2=A0FIXME: How can it be improved?=C2=A0 */<br>
-+=C2=A0 ABORT_INSTRUCTION;<br>
-+=C2=A0 __builtin_unreachable ();<br>
-+}<br>
-+#else<br>
-+# include_next &lt;startup.h&gt;<br>
-+#endif<br>
-diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h b/sysdeps/unix/sysv/li=
nux/ia64/startup.h<br>
-deleted file mode 100644<br>
-index 77f29f15a2..0000000000<br>
---- a/sysdeps/unix/sysv/linux/ia64/startup.h<br>
-+++ /dev/null<br>
-@@ -1,22 +0,0 @@<br>
--/* Linux/ia64 definitions of functions used by static libc main startup.<=
br>
--=C2=A0 =C2=A0Copyright (C) 2022 Free Software Foundation, Inc.<br>
--=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
--<br>
--=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or<br>
--=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<b=
r>
--=C2=A0 =C2=A0License as published by the Free Software Foundation; either=
<br>
--=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later ve=
rsion.<br>
--<br>
--=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will be=
 useful,<br>
--=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
--=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the GNU<br>
--=C2=A0 =C2=A0Lesser General Public License for more details.<br>
--<br>
--=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General Pu=
blic<br>
--=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
--=C2=A0 =C2=A0&lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
--<br>
--/* This code is used before the TCB is set up.=C2=A0 */<br>
--#define IA64_USE_NEW_STUB 0<br>
--<br>
--#include_next &lt;startup.h&gt;<br>
-diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/s=
tartup.h<br>
-deleted file mode 100644<br>
-index 39859b404a..0000000000<br>
---- a/sysdeps/unix/sysv/linux/startup.h<br>
-+++ /dev/null<br>
-@@ -1,39 +0,0 @@<br>
--/* Linux definitions of functions used by static libc main startup.<br>
--=C2=A0 =C2=A0Copyright (C) 2017-2022 Free Software Foundation, Inc.<br>
--=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
--<br>
--=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or<br>
--=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<b=
r>
--=C2=A0 =C2=A0License as published by the Free Software Foundation; either=
<br>
--=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later ve=
rsion.<br>
--<br>
--=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will be=
 useful,<br>
--=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
--=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the GNU<br>
--=C2=A0 =C2=A0Lesser General Public License for more details.<br>
--<br>
--=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General Pu=
blic<br>
--=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
--=C2=A0 =C2=A0&lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
--<br>
--#ifdef SHARED<br>
--# include_next &lt;startup.h&gt;<br>
--#else<br>
--# include &lt;sysdep.h&gt;<br>
--<br>
--/* Avoid a run-time invocation of strlen.=C2=A0 */<br>
--#define _startup_fatal(message)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
--=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 size_t __message_length =3D __builtin_strlen (messag=
e);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 if (! __builtin_constant_p (__message_length))=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extern void _startup_fatal_not_constan=
t (void);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _startup_fatal_not_constant ();=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (messag=
e),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__message_length);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 INTERNAL_SYSCALL_CALL (exit_group, 127);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
--=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 while (0)<br>
--#endif=C2=A0 /* !SHARED */<br>
diff --git a/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch b/me=
ta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch<br>
new file mode 100644<br>
index 0000000000..1f3426295a<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch<br>
@@ -0,0 +1,28 @@<br>
+From 5e635e5dc7d1b21a78f38109d4f43a03bec865c8 Mon Sep 17 00:00:00 2001<br>
+From: &quot;H.J. Lu&quot; &lt;<a href=3D"mailto:hjl.tools@gmail.com" targe=
t=3D"_blank">hjl.tools@gmail.com</a>&gt;<br>
+Date: Sun, 7 Aug 2022 12:51:48 +0200<br>
+Subject: [PATCH] startup: Force -O2<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D29249" rel=3D"noreferrer" target=3D"_blank">https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D29249</a>]<br>
+<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+---<br>
+ sysdeps/unix/sysv/linux/startup.h | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
+<br>
+diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/s=
tartup.h<br>
+index 39859b404a..e1fc1b682d 100644<br>
+--- a/sysdeps/unix/sysv/linux/startup.h<br>
++++ b/sysdeps/unix/sysv/linux/startup.h<br>
+@@ -21,6 +21,11 @@<br>
+ #else<br>
+ # include &lt;sysdep.h&gt;<br>
+ <br>
++# if !defined __OPTIMIZE__ || __OPTIMIZE__ &lt; 2<br>
++/* Force to fold strlen.=C2=A0 */<br>
++#=C2=A0 pragma GCC optimize(2)<br>
++# endif<br>
++<br>
+ /* Avoid a run-time invocation of strlen.=C2=A0 */<br>
+ #define _startup_fatal(message)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.36.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.36.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.36.bb</a><br>
index 6ccb392f09..1cfa8101ef 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a><br>
@@ -50,7 +50,7 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCBR=
ANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0022-tzselect.ksh-Use-bin-=
sh-default-shell-interpreter.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-fix-create-thread-fai=
led-in-unprivileged-process-BZ-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-Avoid-hardcoded-build=
-time-paths-in-the-output-binar.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0025-Revert-Linux-Implemen=
t-a-useful-version-of-_startup_.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0025-startup-Force-O2.patc=
h \<br>
=C2=A0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
-- <br>
2.37.2<br>
<br>
</blockquote></div>

--00000000000043c21205e64e2bb8--

