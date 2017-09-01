Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id A1D8160722
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 23:55:09 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id p2so3497683ite.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 16:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sLVgRQj2Xyry+cC6OZLjOZ2afyd+0AhN3iXH6O/8ENo=;
	b=Kud8VZ734Xi05sCbmEEu+u5+raBuQrlxjd6mRpei/cKczAFCvRNXXCkC4ojz83pIDb
	FTb4cafl5RgDmw7NaTvJXTvYX4G5XhR5o0Wkpj1I6tx8VPlds02PSWO0XLCbLa/p0ddm
	x1ixB3D33pXyQhQoyxg4J9m9H+R/9mg7E12r+SIKVlUMBvd1RtNKsQCpL2KtvEQ6l/sc
	vnhKi60RTZ4Fo90NnJqQ3cCX+2SSrHI5BjmU4KlqTS/RZYcpCMRjyDbW9/vi0aQSM35Y
	u3qh4qgmQjSjTwnv4PXJMlCooii2iy1swMFXocMc8VCt4/pCeFc/5bdfO+jO0DZpPGxa
	hdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sLVgRQj2Xyry+cC6OZLjOZ2afyd+0AhN3iXH6O/8ENo=;
	b=M7HGfsSWVRtbGJrebVytAnDxp26qewgTxZZGm6YtlPSajvi8ei3So4lmbbuN89BGnJ
	IE0qhHisLrl8LCehqZg+YCkMpQ2gzWO/m86HXB6it9mZdu+Y74fPhkFV8W2FWroQYMzE
	FOFmHidpKdYthhWwN6aadJ+PeaDOA5eJgSCRQzTNZ+ddO+Hb9bAWKLt25NYjOTgF5siz
	+TRur8kU4U9rm4W+nDo2Tu+rJR770eHRtq2DbXu7hr6uhe/Q3Cb3YTLpokjOiwJ6Cjxn
	eyuNwpFtx/RPfgY9kK4gURbA+5LboQa5E57+galnMSami3FzzNae4czN2LsBuyTAzlap
	UW2g==
X-Gm-Message-State: AHPjjUgsv9vL52hW1x7rDYr30aTL4iHjF0MPrtRZp4PXFxzipnIHkn7U
	yGxy2IlSWUVRuaQSKbQ2GNOlw8cOFD9I
X-Google-Smtp-Source: ADKCNb7XoRdNIkD2e8lMpkJvc5ZzmWxi5OFomEDt4yoD6JOPDiG/u50sNdddVJvD4/w8I2GCBUMM27n/lct6L3Ti8aE=
X-Received: by 10.36.224.205 with SMTP id c196mr1314671ith.18.1504310110818;
	Fri, 01 Sep 2017 16:55:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Fri, 1 Sep 2017 16:54:50 -0700 (PDT)
In-Reply-To: <1502421401-112341-1-git-send-email-zhixiong.chi@windriver.com>
References: <1502421401-112341-1-git-send-email-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 2 Sep 2017 00:54:50 +0100
Message-ID: <CAJTo0LZWYJ_iTdRU0kFgtU5NuXWM0FO_8yJLuRt+E6x-pz5FKg@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add ld.so locks in _libc_fork
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
X-List-Received-Date: Fri, 01 Sep 2017 23:55:09 -0000
Content-Type: multipart/alternative; boundary="94eb2c19df86c997c60558297d8f"

--94eb2c19df86c997c60558297d8f
Content-Type: text/plain; charset="UTF-8"

Can you rebase this to current master, which has glibc 2.26?

Ross

On 11 August 2017 at 04:16, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:

> The patch in this Bugzilla entry was requested by a customer:
>   https://sourceware.org/bugzilla/show_bug.cgi?id=4578
>   https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
>
> If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
> RT_DELETE at the time another thread calls fork(), then the child exit code
> from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case)
> re-initializes
> dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
> subsequently requires ld.so functionality before calling exec(), then the
> assertion will fire.
>
> The patch acquires dl_load_lock on entry to fork() and releases it on exit
> from the parent path.  The child path is initialized as currently done.
> This is essentially pthreads_atfork, but forced to be first because the
> acquisition of dl_load_lock must happen before malloc_atfork is active
> to avoid a deadlock.
>
> The __libc_fork() code reset dl_load_lock, but it also needed to reset
> dl_load_write_lock.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../0001-Bug-4578-add-ld.so-lock-while-fork.patch  | 57
> ++++++++++++++++++++++
>  ...bc-reset-dl-load-write-lock-after-forking.patch | 37 ++++++++++++++
>  meta/recipes-core/glibc/glibc_2.25.90.bb           |  2 +
>  3 files changed, 96 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/
> 0001-Bug-4578-add-ld.so-lock-while-fork.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/
> 0001-glibc-reset-dl-load-write-lock-after-forking.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-Bug-4578-add-ld.so-lock-while-fork.patch
> b/meta/recipes-core/glibc/glibc/0001-Bug-4578-add-ld.so-
> lock-while-fork.patch
> new file mode 100644
> index 0000000..ab82866
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-Bug-4578-add-ld.so-
> lock-while-fork.patch
> @@ -0,0 +1,57 @@
> +The patch in this Bugzilla entry was requested by a customer:
> +  https://sourceware.org/bugzilla/show_bug.cgi?id=4578
> +
> +If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
> +RT_DELETE at the time another thread calls fork(), then the child exit
> code
> +from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case)
> re-initializes
> +dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
> +subsequently requires ld.so functionality before calling exec(), then the
> +assertion will fire.
> +
> +The patch acquires dl_load_lock on entry to fork() and releases it on exit
> +from the parent path.  The child path is initialized as currently done.
> +This is essentially pthreads_atfork, but forced to be first because the
> +acquisition of dl_load_lock must happen before malloc_atfork is active
> +to avoid a deadlock.
> +The patch has not yet been integrated upstream.
> +
> +Upstream-Status: Pending [ Not Author See bugzilla]
> +
> +Signed-off-by: Raghunath Lolur <Raghunath.Lolur@kpit.com>
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +Index: git/sysdeps/nptl/fork.c
> +===================================================================
> +--- git.orig/sysdeps/nptl/fork.c       2017-08-03 16:02:15.674704080
> +0800
> ++++ git/sysdeps/nptl/fork.c    2017-08-04 18:15:02.463362015 +0800
> +@@ -25,6 +25,7 @@
> + #include <tls.h>
> + #include <hp-timing.h>
> + #include <ldsodefs.h>
> ++#include <libc-lock.h>
> + #include <stdio-lock.h>
> + #include <atomic.h>
> + #include <nptl/pthreadP.h>
> +@@ -60,6 +61,10 @@
> +      but our current fork implementation is not.  */
> +   bool multiple_threads = THREAD_GETMEM (THREAD_SELF,
> header.multiple_threads);
> +
> ++  /* grab ld.so lock BEFORE switching to malloc_atfork */
> ++  __rtld_lock_lock_recursive (GL(dl_load_lock));
> ++  __rtld_lock_lock_recursive (GL(dl_load_write_lock));
> ++
> +   /* Run all the registered preparation handlers.  In reverse order.
> +      While doing this we build up a list of all the entries.  */
> +   struct fork_handler *runp;
> +@@ -258,6 +263,10 @@
> +
> +         allp = allp->next;
> +       }
> ++
> ++      /* unlock ld.so last, because we locked it first */
> ++      __rtld_lock_unlock_recursive (GL(dl_load_write_lock));
> ++      __rtld_lock_unlock_recursive (GL(dl_load_lock));
> +     }
> +
> +   return pid;
> diff --git a/meta/recipes-core/glibc/glibc/0001-glibc-reset-dl-
> load-write-lock-after-forking.patch b/meta/recipes-core/glibc/
> glibc/0001-glibc-reset-dl-load-write-lock-after-forking.patch
> new file mode 100644
> index 0000000..777b253
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-glibc-reset-dl-
> load-write-lock-after-forking.patch
> @@ -0,0 +1,37 @@
> +From a6bb73d1cfd20a73fbbe6076008376fb87879d1b Mon Sep 17 00:00:00 2001
> +From: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Date: Thu, 18 Aug 2016 17:59:13 +0800
> +Subject: [PATCH] reset dl_load_write_lock after forking
> +
> +The patch in this Bugzilla entry was requested by a customer:
> +
> +  https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
> +
> +The __libc_fork() code reset dl_load_lock, but it also needed to reset
> +dl_load_write_lock.  The patch has not yet been integrated upstream.
> +
> +Upstream-Status: Pending [ Not Author See bugzilla]
> +
> +Signed-off-by: Damodar Sonone <damodar.sonone@kpit.com>
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +---
> + sysdeps/nptl/fork.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
> +index 2b9ae4b..3d0b8da 100644
> +--- a/sysdeps/nptl/fork.c
> ++++ b/sysdeps/nptl/fork.c
> +@@ -174,8 +174,9 @@ __libc_fork (void)
> +       /* Reset locks in the I/O code.  */
> +       _IO_list_resetlock ();
> +
> +-      /* Reset the lock the dynamic loader uses to protect its data.  */
> ++      /* Reset the locks the dynamic loader uses to protect its data.  */
> +       __rtld_lock_initialize (GL(dl_load_lock));
> ++      __rtld_lock_initialize (GL(dl_load_write_lock));
> +
> +       /* Run the handlers registered for the child.  */
> +       while (allp != NULL)
> +--
> +1.9.1
> diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb
> b/meta/recipes-core/glibc/glibc_2.25.90.bb
> index caf1ff4..1335407 100644
> --- a/meta/recipes-core/glibc/glibc_2.25.90.bb
> +++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
> @@ -41,6 +41,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc
> \
>             file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> \
>             file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
> +           file://0001-glibc-reset-dl-load-write-lock-after-forking.patch
> \
> +           file://0001-Bug-4578-add-ld.so-lock-while-fork.patch \
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

--94eb2c19df86c997c60558297d8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you rebase this to current master, which has glibc 2.2=
6?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On 11 August 2017 at 04:16, Zhixiong Chi <span dir=3D"=
ltr">&lt;<a href=3D"mailto:zhixiong.chi@windriver.com" target=3D"_blank">zh=
ixiong.chi@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">The patch in this Bugzilla entry was requested by a customer:<br>
=C2=A0 <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D4578" r=
el=3D"noreferrer" target=3D"_blank">https://sourceware.org/<wbr>bugzilla/sh=
ow_bug.cgi?id=3D4578</a><br>
=C2=A0 <a href=3D"https://www.sourceware.org/bugzilla/show_bug.cgi?id=3D192=
82" rel=3D"noreferrer" target=3D"_blank">https://www.sourceware.org/<wbr>bu=
gzilla/show_bug.cgi?id=3D19282</a><br>
<br>
If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or<=
br>
RT_DELETE at the time another thread calls fork(), then the child exit code=
<br>
from fork (in nptl/sysdeps/unix/sysv/linux/<wbr>fork.c in our case) re-init=
ializes<br>
dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child<br=
>
subsequently requires ld.so functionality before calling exec(), then the<b=
r>
assertion will fire.<br>
<br>
The patch acquires dl_load_lock on entry to fork() and releases it on exit<=
br>
from the parent path.=C2=A0 The child path is initialized as currently done=
.<br>
This is essentially pthreads_atfork, but forced to be first because the<br>
acquisition of dl_load_lock must happen before malloc_atfork is active<br>
to avoid a deadlock.<br>
<br>
The __libc_fork() code reset dl_load_lock, but it also needed to reset<br>
dl_load_write_lock.<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Bug-4578-add-ld.so-<wbr>lock-while-fork.patch=C2=A0 | 57 +++=
+++++++++++++++++++<br>
=C2=A0...bc-reset-dl-load-write-<wbr>lock-after-forking.patch | 37 ++++++++=
++++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glibc_<wbr>2.25.90.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A03 files changed, 96 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0001-Bug-4578-a=
dd-ld.so-lock-<wbr>while-fork.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0001-glibc-rese=
t-dl-load-<wbr>write-lock-after-forking.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/<wbr>glibc/0001-Bug-4578-add-ld.so-<wb=
r>lock-while-fork.patch b/meta/recipes-core/glibc/<wbr>glibc/0001-Bug-4578-=
add-ld.so-<wbr>lock-while-fork.patch<br>
new file mode 100644<br>
index 0000000..ab82866<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/<wbr>glibc/0001-Bug-4578-add-ld.so-<wbr>lock-=
while-fork.patch<br>
@@ -0,0 +1,57 @@<br>
+The patch in this Bugzilla entry was requested by a customer:<br>
+=C2=A0 <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D4578" =
rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/<wbr>bugzilla/s=
how_bug.cgi?id=3D4578</a><br>
+<br>
+If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or=
<br>
+RT_DELETE at the time another thread calls fork(), then the child exit cod=
e<br>
+from fork (in nptl/sysdeps/unix/sysv/linux/<wbr>fork.c in our case) re-ini=
tializes<br>
+dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child<b=
r>
+subsequently requires ld.so functionality before calling exec(), then the<=
br>
+assertion will fire.<br>
+<br>
+The patch acquires dl_load_lock on entry to fork() and releases it on exit=
<br>
+from the parent path.=C2=A0 The child path is initialized as currently don=
e.<br>
+This is essentially pthreads_atfork, but forced to be first because the<br=
>
+acquisition of dl_load_lock must happen before malloc_atfork is active<br>
+to avoid a deadlock.<br>
+The patch has not yet been integrated upstream.<br>
+<br>
+Upstream-Status: Pending [ Not Author See bugzilla]<br>
+<br>
+Signed-off-by: Raghunath Lolur &lt;<a href=3D"mailto:Raghunath.Lolur@kpit.=
com">Raghunath.Lolur@kpit.com</a>&gt;<br>
+Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver=
.com">yuanjie.huang@windriver.com</a>&gt;<br>
+Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.c=
om">zhixiong.chi@windriver.com</a>&gt;<br>
+<br>
+Index: git/sysdeps/nptl/fork.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- git.orig/sysdeps/nptl/fork.c=C2=A0 =C2=A0 =C2=A0 =C2=A02017-08-03 16:0=
2:<a href=3D"tel:15.674704080" value=3D"+15674704080">15.674704080</a> +080=
0<br>
++++ git/sysdeps/nptl/fork.c=C2=A0 =C2=A0 2017-08-04 18:15:02.463362015 +08=
00<br>
+@@ -25,6 +25,7 @@<br>
+ #include &lt;tls.h&gt;<br>
+ #include &lt;hp-timing.h&gt;<br>
+ #include &lt;ldsodefs.h&gt;<br>
++#include &lt;libc-lock.h&gt;<br>
+ #include &lt;stdio-lock.h&gt;<br>
+ #include &lt;atomic.h&gt;<br>
+ #include &lt;nptl/pthreadP.h&gt;<br>
+@@ -60,6 +61,10 @@<br>
+=C2=A0 =C2=A0 =C2=A0 but our current fork implementation is not.=C2=A0 */<=
br>
+=C2=A0 =C2=A0bool multiple_threads =3D THREAD_GETMEM (THREAD_SELF, header.=
multiple_threads);<br>
+<br>
++=C2=A0 /* grab ld.so lock BEFORE switching to malloc_atfork */<br>
++=C2=A0 __rtld_lock_lock_recursive (GL(dl_load_lock));<br>
++=C2=A0 __rtld_lock_lock_recursive (GL(dl_load_write_lock));<br>
++<br>
+=C2=A0 =C2=A0/* Run all the registered preparation handlers.=C2=A0 In reve=
rse order.<br>
+=C2=A0 =C2=A0 =C2=A0 While doing this we build up a list of all the entrie=
s.=C2=A0 */<br>
+=C2=A0 =C2=A0struct fork_handler *runp;<br>
+@@ -258,6 +263,10 @@<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allp =3D allp-&gt;next;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* unlock ld.so last, because we locked it first */<=
br>
++=C2=A0 =C2=A0 =C2=A0 __rtld_lock_unlock_recursive (GL(dl_load_write_lock)=
);<br>
++=C2=A0 =C2=A0 =C2=A0 __rtld_lock_unlock_recursive (GL(dl_load_lock));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0return pid;<br>
diff --git a/meta/recipes-core/glibc/<wbr>glibc/0001-glibc-reset-dl-<wbr>lo=
ad-write-lock-after-forking.<wbr>patch b/meta/recipes-core/glibc/<wbr>glibc=
/0001-glibc-reset-dl-<wbr>load-write-lock-after-forking.<wbr>patch<br>
new file mode 100644<br>
index 0000000..777b253<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/<wbr>glibc/0001-glibc-reset-dl-<wbr>load-writ=
e-lock-after-forking.<wbr>patch<br>
@@ -0,0 +1,37 @@<br>
+From a6bb73d1cfd20a73fbbe6076008376<wbr>fb87879d1b Mon Sep 17 00:00:00 200=
1<br>
+From: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.com">yua=
njie.huang@windriver.com</a>&gt;<br>
+Date: Thu, 18 Aug 2016 17:59:13 +0800<br>
+Subject: [PATCH] reset dl_load_write_lock after forking<br>
+<br>
+The patch in this Bugzilla entry was requested by a customer:<br>
+<br>
+=C2=A0 <a href=3D"https://www.sourceware.org/bugzilla/show_bug.cgi?id=3D19=
282" rel=3D"noreferrer" target=3D"_blank">https://www.sourceware.org/<wbr>b=
ugzilla/show_bug.cgi?id=3D19282</a><br>
+<br>
+The __libc_fork() code reset dl_load_lock, but it also needed to reset<br>
+dl_load_write_lock.=C2=A0 The patch has not yet been integrated upstream.<=
br>
+<br>
+Upstream-Status: Pending [ Not Author See bugzilla]<br>
+<br>
+Signed-off-by: Damodar Sonone &lt;<a href=3D"mailto:damodar.sonone@kpit.co=
m">damodar.sonone@kpit.com</a>&gt;<br>
+Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver=
.com">yuanjie.huang@windriver.com</a>&gt;<br>
+---<br>
+ sysdeps/nptl/fork.c | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c<br>
+index 2b9ae4b..3d0b8da 100644<br>
+--- a/sysdeps/nptl/fork.c<br>
++++ b/sysdeps/nptl/fork.c<br>
+@@ -174,8 +174,9 @@ __libc_fork (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reset locks in the I/O code.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_IO_list_resetlock ();<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Reset the lock the dynamic loader uses to protect=
 its data.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 /* Reset the locks the dynamic loader uses to protec=
t its data.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__rtld_lock_initialize (GL(dl_load_lock));<br>
++=C2=A0 =C2=A0 =C2=A0 __rtld_lock_initialize (GL(dl_load_write_lock));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Run the handlers registered for the child.=
=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (allp !=3D NULL)<br>
+--<br>
+1.9.1<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" re=
l=3D"noreferrer" target=3D"_blank">glib<wbr>c_2.25.90.bb</a> b/meta/recipes=
-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"noreferrer" target=
=3D"_blank">glib<wbr>c_2.25.90.bb</a><br>
index caf1ff4..1335407 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glib<wbr>c_2.25.90.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glib<wbr>c_2.25.90.bb</a><br>
@@ -41,6 +41,8 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${<wbr>SRCBRA=
NCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-Define-DUMMY_<wbr>LOC=
ALE_T-if-not-defined.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-elf-dl-deps.c-<wbr>Ma=
ke-_dl_build_local_scope-<wbr>breadth-fir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0025-locale-fix-hard-<wbr>=
coded-reference-to-gcc-E.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-glibc-reset-dl-<wbr>l=
oad-write-lock-after-forking.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Bug-4578-add-ld.<wbr>=
so-lock-while-fork.patch \<br>
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

--94eb2c19df86c997c60558297d8f--
