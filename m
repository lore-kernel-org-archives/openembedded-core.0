Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7510377F85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 19:04:43 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id p144so10172450ywp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6a1M99Ldo9lxucg2uvfP+4P5LknMUcm7w6lvCWfb5Qg=;
	b=pT16oxYjGuiI297wP8kF70iQSGWJdmLwUbhgV7WH0oaqTBrMJ00/izHjySvHpMlpev
	M3kQuRrQ4ywoQ9k3Bu1bcW4TTFT4ALUfOp1i1BsftMMPWLyr9ATjczTHEq8MkIonzUTn
	7/ucdDRrz7GNiWcgvQ8+umt1uOmkePPJmhhGvMUM+FDC8X5x00vmPueTkB63sa1CgkOE
	OjWypY70Q9rZVnx1+RBIPwQqxzKFV6GjlVoNa13BD2HuWzfgE1fc2dtoKu+jHrBWsYZr
	ZeH/2uOWiV8oCS1RNxVHGh1rMgnOjVHldaByLh/sDbD87wC+LxhQVZY8zs5st/AJodsH
	wZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6a1M99Ldo9lxucg2uvfP+4P5LknMUcm7w6lvCWfb5Qg=;
	b=AkW+qATxBrh67Gd2/9fZZoDcyNMhvDfmTLV0UnjWrvExfZMBCPCPWNiuDwggXjP/G7
	imxvoqAB9v1OzpVFi1c2ylnCl5JR+6YYiPgpbhfczo6s8yDOoAGWuCFmGvbIQk6B0Yom
	G3E4Ibfi4m39j3IMQKCmjVJL8+Knksq/kvUSE+bfcY/rRFuO2yPGhuycf8ktFdAE8rSS
	PN+0bVXDbw3UsLeuCsGgafyktepWK7XNSW8xKn4SaRJo0mc5UE4iGV/0d4AnfV+hwf21
	OyOt0IDNUvfpIdxy/dDHJ4qbyPpApTawo2ijQq7kj3wEQs1QHpGQE68fqUpEA3/hfI4U
	tFQg==
X-Gm-Message-State: AODbwcBlqgTTpnUsvdgiF9f9zq8oWp5XDj9ycztx8sm8ZUexOtpR8rD3
	BFgUNCgtLJZocL/3SbMSyU8QVTqngA==
X-Received: by 10.129.80.193 with SMTP id e184mr4264002ywb.44.1496775884238;
	Tue, 06 Jun 2017 12:04:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Tue, 6 Jun 2017 12:04:43 -0700 (PDT)
In-Reply-To: <1496696005-28913-1-git-send-email-ross.burton@intel.com>
References: <1496696005-28913-1-git-send-email-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Jun 2017 21:04:43 +0200
Message-ID: <CA+chaQfM0Kvu-LXN7yXxx8xoYe1P9Le5em6ref3VPALZ2xbcOQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: fix build failure on MIPS
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
X-List-Received-Date: Tue, 06 Jun 2017 19:04:44 -0000
Content-Type: multipart/alternative; boundary="001a1147e4e2e381cd05514f4a22"

--001a1147e4e2e381cd05514f4a22
Content-Type: text/plain; charset="UTF-8"

Do you also have a fix for armv5t build issue with this new libunwind
version?

http://errors.yoctoproject.org/Errors/Details/143838/

On Mon, Jun 5, 2017 at 10:53 PM, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../libunwind/libunwind/fix-mips.patch             | 134
> +++++++++++++++++++++
>  meta/recipes-support/libunwind/libunwind_1.2.bb    |   1 +
>  2 files changed, 135 insertions(+)
>  create mode 100644 meta/recipes-support/libunwind/libunwind/fix-mips.
> patch
>
> diff --git a/meta/recipes-support/libunwind/libunwind/fix-mips.patch
> b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
> new file mode 100644
> index 0000000..0022237
> --- /dev/null
> +++ b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
> @@ -0,0 +1,134 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 5f354cb7b9c84dae006f0ebd8ad7a78d7e2aad0c Mon Sep 17 00:00:00 2001
> +From: Dave Watson <davejwatson@fb.com>
> +Date: Wed, 25 Jan 2017 16:18:02 -0800
> +Subject: [PATCH] mips/tilegx: Add missing unwind_i.h header file
> +
> +reported-by: John Knight <John.Knight@belkin.com>
> +---
> + src/Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 5d874755..7de4c425 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -280,7 +280,7 @@ libunwind_hppa_la_SOURCES_hppa =
> $(libunwind_la_SOURCES_hppa_common)       \
> +       hppa/Gresume.c hppa/Gstep.c
> +
> + # The list of files that go info libunwind and libunwind-mips:
> +-noinst_HEADERS += mips/init.h mips/offsets.h
> ++noinst_HEADERS += mips/init.h mips/offsets.h mips/unwind_i.h
> + libunwind_la_SOURCES_mips_common = $(libunwind_la_SOURCES_common)
>    \
> +       mips/is_fpreg.c mips/regname.c
> +
> +@@ -299,7 +299,7 @@ libunwind_mips_la_SOURCES_mips =
> $(libunwind_la_SOURCES_mips_common)           \
> +       mips/Gis_signal_frame.c mips/Gregs.c mips/Gresume.c mips/Gstep.c
> +
> + # The list of files that go info libunwind and libunwind-tilegx:
> +-noinst_HEADERS += tilegx/init.h tilegx/offsets.h
> ++noinst_HEADERS += tilegx/init.h tilegx/offsets.h tilegx/unwind_i.h
> + libunwind_la_SOURCES_tilegx_common = $(libunwind_la_SOURCES_common)
>    \
> +       tilegx/is_fpreg.c tilegx/regname.c
> +
> +diff --git a/src/mips/unwind_i.h b/src/mips/unwind_i.h
> +new file mode 100644
> +index 0000000..3382dcf
> +--- /dev/null
> ++++ b/src/mips/unwind_i.h
> +@@ -0,0 +1,43 @@
> ++/* libunwind - a platform-independent unwind library
> ++   Copyright (C) 2008 CodeSourcery
> ++
> ++This file is part of libunwind.
> ++
> ++Permission is hereby granted, free of charge, to any person obtaining
> ++a copy of this software and associated documentation files (the
> ++"Software"), to deal in the Software without restriction, including
> ++without limitation the rights to use, copy, modify, merge, publish,
> ++distribute, sublicense, and/or sell copies of the Software, and to
> ++permit persons to whom the Software is furnished to do so, subject to
> ++the following conditions:
> ++
> ++The above copyright notice and this permission notice shall be
> ++included in all copies or substantial portions of the Software.
> ++
> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> ++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> ++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> ++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> ++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> ++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
> ++
> ++#ifndef unwind_i_h
> ++#define unwind_i_h
> ++
> ++#include <stdint.h>
> ++
> ++#include <libunwind-mips.h>
> ++
> ++#include "libunwind_i.h"
> ++
> ++#define mips_lock                       UNW_OBJ(lock)
> ++#define mips_local_resume               UNW_OBJ(local_resume)
> ++#define mips_local_addr_space_init      UNW_OBJ(local_addr_space_init)
> ++
> ++extern int mips_local_resume (unw_addr_space_t as, unw_cursor_t *cursor,
> ++                             void *arg);
> ++
> ++extern void mips_local_addr_space_init (void);
> ++
> ++#endif /* unwind_i_h */
> +diff --git a/src/tilegx/unwind_i.h b/src/tilegx/unwind_i.h
> +new file mode 100644
> +index 0000000..aac7be3
> +--- /dev/null
> ++++ b/src/tilegx/unwind_i.h
> +@@ -0,0 +1,44 @@
> ++/* libunwind - a platform-independent unwind library
> ++   Copyright (C) 2008 CodeSourcery
> ++
> ++This file is part of libunwind.
> ++
> ++Permission is hereby granted, free of charge, to any person obtaining
> ++a copy of this software and associated documentation files (the
> ++"Software"), to deal in the Software without restriction, including
> ++without limitation the rights to use, copy, modify, merge, publish,
> ++distribute, sublicense, and/or sell copies of the Software, and to
> ++permit persons to whom the Software is furnished to do so, subject to
> ++the following conditions:
> ++
> ++The above copyright notice and this permission notice shall be
> ++included in all copies or substantial portions of the Software.
> ++
> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> ++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> ++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> ++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> ++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> ++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
> ++
> ++#ifndef unwind_i_h
> ++#define unwind_i_h
> ++
> ++#include <memory.h>
> ++#include <stdint.h>
> ++
> ++#include <libunwind-tilegx.h>
> ++
> ++#include "libunwind_i.h"
> ++
> ++#define tilegx_local_resume            UNW_OBJ(local_resume)
> ++#define tilegx_local_addr_space_init   UNW_OBJ(local_addr_space_init)
> ++
> ++extern int tilegx_local_resume (unw_addr_space_t as,
> ++                                unw_cursor_t *cursor,
> ++                                void *arg);
> ++
> ++extern void tilegx_local_addr_space_init (void);
> ++
> ++#endif /* unwind_i_h */
> diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb
> b/meta/recipes-support/libunwind/libunwind_1.2.bb
> index a398d33..e598e40 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.2.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
> @@ -11,6 +11,7 @@ SRC_URI = "http://download.savannah.
> nongnu.org/releases/libunwind/libunwind-${PV
>             file://0001-add-knobs-to-disable-enable-tests.patch \
>             file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
> \
>             file://libunwind-1.1-x32.patch \
> +           file://fix-mips.patch \
>             "
>
>  SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147e4e2e381cd05514f4a22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do you also have a fix for armv5t build issue with this ne=
w libunwind version?<div><br></div><div><a href=3D"http://errors.yoctoproje=
ct.org/Errors/Details/143838/">http://errors.yoctoproject.org/Errors/Detail=
s/143838/</a><br></div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Mon, Jun 5, 2017 at 10:53 PM, Ross Burton <span dir=3D"ltr">=
&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-o=
ff-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton=
@intel.com</a>&gt;<br>
---<br>
=C2=A0.../libunwind/libunwind/fix-<wbr>mips.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 134 +++++++++++++++++++++<br>
=C2=A0meta/recipes-support/<wbr>libunwind/<a href=3D"http://libunwind_1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">libunwind_1.2.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 135 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/<wbr>libunwind/libunwind/fix-=
mips.<wbr>patch<br>
<br>
diff --git a/meta/recipes-support/<wbr>libunwind/libunwind/fix-mips.<wbr>pa=
tch b/meta/recipes-support/<wbr>libunwind/libunwind/fix-mips.<wbr>patch<br>
new file mode 100644<br>
index 0000000..0022237<br>
--- /dev/null<br>
+++ b/meta/recipes-support/<wbr>libunwind/libunwind/fix-mips.<wbr>patch<br>
@@ -0,0 +1,134 @@<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
+<br>
+From 5f354cb7b9c84dae006f0ebd8ad7a7<wbr>8d7e2aad0c Mon Sep 17 00:00:00 200=
1<br>
+From: Dave Watson &lt;<a href=3D"mailto:davejwatson@fb.com">davejwatson@fb=
.com</a>&gt;<br>
+Date: Wed, 25 Jan 2017 16:18:02 -0800<br>
+Subject: [PATCH] mips/tilegx: Add missing unwind_i.h header file<br>
+<br>
+reported-by: John Knight &lt;<a href=3D"mailto:John.Knight@belkin.com">Joh=
n.Knight@belkin.com</a>&gt;<br>
+---<br>
+ src/Makefile.am | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/Makefile.am b/src/Makefile.am<br>
+index 5d874755..7de4c425 100644<br>
+--- a/src/Makefile.am<br>
++++ b/src/Makefile.am<br>
+@@ -280,7 +280,7 @@ libunwind_hppa_la_SOURCES_hppa =3D $(libunwind_la_SOUR=
CES_hppa_<wbr>common)=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hppa/Gresume.c hppa/Gstep.c<br>
+<br>
+ # The list of files that go info libunwind and libunwind-mips:<br>
+-noinst_HEADERS +=3D mips/init.h mips/offsets.h<br>
++noinst_HEADERS +=3D mips/init.h mips/offsets.h mips/unwind_i.h<br>
+ libunwind_la_SOURCES_mips_<wbr>common =3D $(libunwind_la_SOURCES_common)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mips/is_fpreg.c mips/regname.c<br>
+<br>
+@@ -299,7 +299,7 @@ libunwind_mips_la_SOURCES_mips =3D $(libunwind_la_SOUR=
CES_mips_<wbr>common)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mips/Gis_signal_frame.c mips/Gregs.c mips/Gresu=
me.c mips/Gstep.c<br>
+<br>
+ # The list of files that go info libunwind and libunwind-tilegx:<br>
+-noinst_HEADERS +=3D tilegx/init.h tilegx/offsets.h<br>
++noinst_HEADERS +=3D tilegx/init.h tilegx/offsets.h tilegx/unwind_i.h<br>
+ libunwind_la_SOURCES_tilegx_<wbr>common =3D $(libunwind_la_SOURCES_common=
)=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tilegx/is_fpreg.c tilegx/regname.c<br>
+<br>
+diff --git a/src/mips/unwind_i.h b/src/mips/unwind_i.h<br>
+new file mode 100644<br>
+index 0000000..3382dcf<br>
+--- /dev/null<br>
++++ b/src/mips/unwind_i.h<br>
+@@ -0,0 +1,43 @@<br>
++/* libunwind - a platform-independent unwind library<br>
++=C2=A0 =C2=A0Copyright (C) 2008 CodeSourcery<br>
++<br>
++This file is part of libunwind.<br>
++<br>
++Permission is hereby granted, free of charge, to any person obtaining<br>
++a copy of this software and associated documentation files (the<br>
++&quot;Software&quot;), to deal in the Software without restriction, inclu=
ding<br>
++without limitation the rights to use, copy, modify, merge, publish,<br>
++distribute, sublicense, and/or sell copies of the Software, and to<br>
++permit persons to whom the Software is furnished to do so, subject to<br>
++the following conditions:<br>
++<br>
++The above copyright notice and this permission notice shall be<br>
++included in all copies or substantial portions of the Software.<br>
++<br>
++THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND,=
<br>
++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<br>
++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE<br=
>
++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION<br=
>
++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION<br>
++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.=C2=A0 */<=
br>
++<br>
++#ifndef unwind_i_h<br>
++#define unwind_i_h<br>
++<br>
++#include &lt;stdint.h&gt;<br>
++<br>
++#include &lt;libunwind-mips.h&gt;<br>
++<br>
++#include &quot;libunwind_i.h&quot;<br>
++<br>
++#define mips_lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0UNW_OBJ(lock)<br>
++#define mips_local_resume=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0UNW_OBJ(local_resume)<br>
++#define mips_local_addr_space_init=C2=A0 =C2=A0 =C2=A0 UNW_OBJ(local_addr=
_space_init)<br>
++<br>
++extern int mips_local_resume (unw_addr_space_t as, unw_cursor_t *cursor,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *arg);<br>
++<br>
++extern void mips_local_addr_space_init (void);<br>
++<br>
++#endif /* unwind_i_h */<br>
+diff --git a/src/tilegx/unwind_i.h b/src/tilegx/unwind_i.h<br>
+new file mode 100644<br>
+index 0000000..aac7be3<br>
+--- /dev/null<br>
++++ b/src/tilegx/unwind_i.h<br>
+@@ -0,0 +1,44 @@<br>
++/* libunwind - a platform-independent unwind library<br>
++=C2=A0 =C2=A0Copyright (C) 2008 CodeSourcery<br>
++<br>
++This file is part of libunwind.<br>
++<br>
++Permission is hereby granted, free of charge, to any person obtaining<br>
++a copy of this software and associated documentation files (the<br>
++&quot;Software&quot;), to deal in the Software without restriction, inclu=
ding<br>
++without limitation the rights to use, copy, modify, merge, publish,<br>
++distribute, sublicense, and/or sell copies of the Software, and to<br>
++permit persons to whom the Software is furnished to do so, subject to<br>
++the following conditions:<br>
++<br>
++The above copyright notice and this permission notice shall be<br>
++included in all copies or substantial portions of the Software.<br>
++<br>
++THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND,=
<br>
++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<br>
++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE<br=
>
++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION<br=
>
++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION<br>
++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.=C2=A0 */<=
br>
++<br>
++#ifndef unwind_i_h<br>
++#define unwind_i_h<br>
++<br>
++#include &lt;memory.h&gt;<br>
++#include &lt;stdint.h&gt;<br>
++<br>
++#include &lt;libunwind-tilegx.h&gt;<br>
++<br>
++#include &quot;libunwind_i.h&quot;<br>
++<br>
++#define tilegx_local_resume=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNW_=
OBJ(local_resume)<br>
++#define tilegx_local_addr_space_init=C2=A0 =C2=A0UNW_OBJ(local_addr_space=
_init)<br>
++<br>
++extern int tilegx_local_resume (unw_addr_space_t as,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unw_cursor_t *cursor,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *arg);<br>
++<br>
++extern void tilegx_local_addr_space_init (void);<br>
++<br>
++#endif /* unwind_i_h */<br>
diff --git a/meta/recipes-support/<wbr>libunwind/<a href=3D"http://libunwin=
d_1.2.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.2.bb</a> b/meta/=
recipes-support/<wbr>libunwind/<a href=3D"http://libunwind_1.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libunwind_1.2.bb</a><br>
index a398d33..e598e40 100644<br>
--- a/meta/recipes-support/<wbr>libunwind/<a href=3D"http://libunwind_1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">libunwind_1.2.bb</a><br>
+++ b/meta/recipes-support/<wbr>libunwind/<a href=3D"http://libunwind_1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">libunwind_1.2.bb</a><br>
@@ -11,6 +11,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.savannah.non=
gnu.org/releases/libunwind/libunwind-${PV" rel=3D"noreferrer" target=3D"_bl=
ank">http://download.savannah.<wbr>nongnu.org/releases/libunwind/<wbr>libun=
wind-${PV</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-add-knobs-to-<wbr>dis=
able-enable-tests.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ppc32-Consider-<wbr>u=
context-mismatches-between-<wbr>glibc-and.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libunwind-1.1-x32.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-mips.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://musl-header-conflict.<wbr>=
patch&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
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

--001a1147e4e2e381cd05514f4a22--
