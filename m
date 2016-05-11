Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94C2F606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 21:27:05 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id i2so9317672oib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2gZ4wjONatepUAIxaCvVM45FV++7gfqYXusYdKR8F1c=;
	b=opiLTH6xU/nwfy6BV8h3ZHV3B5s6X/iaktoxHBqWEYo+zAeIyA18T/WNw0/s62V00u
	BvjJ8Wvd7Qxm4lEViRaJOdVyJ8ayPzZ8l/SkxsqJ64X9mIRPIPXROa98bHuepj87bqeZ
	2+W0DKnVKGCAov7Fq8AqL9djm+nMFNXxYnFv6UnT9HYtpevXHLi1vPGpIDEzDd2fzFF0
	kmFPqLwC8uWZaLopa8Ow96IQ37VlA2NCFxkdDtQV0iJoCs9NDQODjUejcxKZD1kG2A5y
	/hwHWQsLKLXN/0Q1T2V5IxhcSIKps7pTcn2rluUhbgkLPEC5RcWYm10GafjoUGpXelPH
	nuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2gZ4wjONatepUAIxaCvVM45FV++7gfqYXusYdKR8F1c=;
	b=KUHtZCe1nstl4plEEb9FvKxHZ814Meijs91I5j42fDe2HwbI1Bsjra+Ewx/isksPtb
	XPfpMGCkf4N1NIBPVhij4A73jLICDYP2NMarWgRL3Y7V8/oB9rPpmcYfrRqqoaNtUb1B
	mH9bunMa3FDk8j3u3HBTeyYeRkj/0Kg6sQ2HQVSVL409EVv/2ItAqwtI/ECxL8+e6euR
	O3vLS9GGfJaUOgqI4x+0R6apRmuGoFTaJOi6FvqnIBnk2hLnppDPdNzol5GFd8CIW1xl
	+CS1mZ5BIxbzZVr+C5HiPMKUExZgs8LLIRs4/nmHYLUT/nImqTD6py0IoTeGtQZsPhxq
	iI+w==
X-Gm-Message-State: AOPr4FWlx3Ntt5l3l39QvRXV/nQSS/yraxlAcoAntgqLxiDYiN2Nq1ZsSLOAqRF0kSs7LJnC1Q932qE2zUH5rw==
MIME-Version: 1.0
X-Received: by 10.157.37.45 with SMTP id k42mr3586426otb.119.1463002025777;
	Wed, 11 May 2016 14:27:05 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 11 May 2016 14:27:05 -0700 (PDT)
In-Reply-To: <1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
Date: Wed, 11 May 2016 17:27:05 -0400
Message-ID: <CADkTA4P6hCQBMgNXZZY80OTSH2vuxjw0h27fgNvN8p22u8riAQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/42] linux-yocto: Fix build on ppc with gcc-6
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
X-List-Received-Date: Wed, 11 May 2016 21:27:06 -0000
Content-Type: multipart/alternative; boundary=001a11352e460d62ff053297b494

--001a11352e460d62ff053297b494
Content-Type: text/plain; charset=UTF-8

On Wed, May 11, 2016 at 1:35 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>


These shouldn't be carried out of tree. So can you drop the linux-yocto
changes from the
series, and I'll look at getting them integrated later.

Bruce


> ---
>  ...ace-Fix-out-of-bounds-array-access-warnin.patch | 50
> ++++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  4 +-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>
> diff --git
> a/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
> b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
> new file mode 100644
> index 0000000..05315ed
> --- /dev/null
> +++
> b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
> @@ -0,0 +1,50 @@
> +From 32acc1d9a5738b02e8815047af8886978aa40ead Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 25 Apr 2016 05:47:01 +0000
> +Subject: [PATCH V2] powerpc/ptrace: Fix out of bounds array access warning
> +
> +gcc-6 correctly warns about a out of bounds access
> +
> +arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an offset
> greater than size of 'u64[32][1] {aka long long unsigned int[32][1]}'
> [-Warray-bounds]
> +        offsetof(struct thread_fp_state, fpr[32][0]));
> +                        ^
> +
> +check the end of array instead of beginning of next element to fix this
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Cc: Kees Cook <keescook@chromium.org>
> +Cc: Michael Ellerman <mpe@ellerman.id.au>
> +Cc: Segher Boessenkool <segher@kernel.crashing.org>
> +---
> +Changes from v1 to v2:
> +
> +- Check for fpr[32] instead of fpr[31][1]
> +
> + arch/powerpc/kernel/ptrace.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
> +index 737c0d0..b38fd08 100644
> +--- a/arch/powerpc/kernel/ptrace.c
> ++++ b/arch/powerpc/kernel/ptrace.c
> +@@ -376,7 +376,7 @@ static int fpr_get(struct task_struct *target, const
> struct user_regset *regset,
> +
> + #else
> +       BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
> +-                   offsetof(struct thread_fp_state, fpr[32][0]));
> ++                   offsetof(struct thread_fp_state, fpr[32]));
> +
> +       return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
> +                                  &target->thread.fp_state, 0, -1);
> +@@ -404,7 +404,7 @@ static int fpr_set(struct task_struct *target, const
> struct user_regset *regset,
> +       return 0;
> + #else
> +       BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
> +-                   offsetof(struct thread_fp_state, fpr[32][0]));
> ++                   offsetof(struct thread_fp_state, fpr[32]));
> +
> +       return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> +                                 &target->thread.fp_state, 0, -1);
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index b74903e..fbb592a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -22,7 +22,9 @@ SRCREV_machine ?=
> "b18090556c1d1b449233cd555c27a04d38272d6d"
>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>
>  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
> -           git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
> "
> +           git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
> \
> +
>  file://0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch \
> +"
>
>  LINUX_VERSION ?= "4.4.3"
>
> --
> 2.8.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11352e460d62ff053297b494
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 11, 2016 at 1:35 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br></blo=
ckquote><div><br></div><div><br></div><div>These shouldn&#39;t be carried o=
ut of tree. So can you drop the linux-yocto changes from the</div><div>seri=
es, and I&#39;ll look at getting them integrated later.</div><div><br></div=
><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0...ace-Fix-out-of-bounds-array-access-warnin.patch | 50 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A02 files changed, 53 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-powerpc=
-ptrace-Fix-out-of-bounds-array-access-warnin.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-=
out-of-bounds-array-access-warnin.patch b/meta/recipes-kernel/linux/linux-y=
octo/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch<br>
new file mode 100644<br>
index 0000000..05315ed<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-=
bounds-array-access-warnin.patch<br>
@@ -0,0 +1,50 @@<br>
+From 32acc1d9a5738b02e8815047af8886978aa40ead Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Mon, 25 Apr 2016 05:47:01 +0000<br>
+Subject: [PATCH V2] powerpc/ptrace: Fix out of bounds array access warning=
<br>
+<br>
+gcc-6 correctly warns about a out of bounds access<br>
+<br>
+arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an offset g=
reater than size of &#39;u64[32][1] {aka long long unsigned int[32][1]}&#39=
; [-Warray-bounds]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 offsetof(struct thread_fp_state, fpr[32][0]));=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
+<br>
+check the end of array instead of beginning of next element to fix this<br=
>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+Cc: Kees Cook &lt;<a href=3D"mailto:keescook@chromium.org">keescook@chromi=
um.org</a>&gt;<br>
+Cc: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerma=
n.id.au</a>&gt;<br>
+Cc: Segher Boessenkool &lt;<a href=3D"mailto:segher@kernel.crashing.org">s=
egher@kernel.crashing.org</a>&gt;<br>
+---<br>
+Changes from v1 to v2:<br>
+<br>
+- Check for fpr[32] instead of fpr[31][1]<br>
+<br>
+ arch/powerpc/kernel/ptrace.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c<b=
r>
+index 737c0d0..b38fd08 100644<br>
+--- a/arch/powerpc/kernel/ptrace.c<br>
++++ b/arch/powerpc/kernel/ptrace.c<br>
+@@ -376,7 +376,7 @@ static int fpr_get(struct task_struct *target, const s=
truct user_regset *regset,<br>
+<br>
+ #else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON(offsetof(struct thread_fp_state, f=
pscr) !=3D<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offs=
etof(struct thread_fp_state, fpr[32][0]));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offs=
etof(struct thread_fp_state, fpr[32]));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return user_regset_copyout(&amp;pos, &amp;count=
, &amp;kbuf, &amp;ubuf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;target-&gt;thread.fp_sta=
te, 0, -1);<br>
+@@ -404,7 +404,7 @@ static int fpr_set(struct task_struct *target, const s=
truct user_regset *regset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ #else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON(offsetof(struct thread_fp_state, f=
pscr) !=3D<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offs=
etof(struct thread_fp_state, fpr[32][0]));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offs=
etof(struct thread_fp_state, fpr[32]));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return user_regset_copyin(&amp;pos, &amp;count,=
 &amp;kbuf, &amp;ubuf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;target-&gt;thread.fp_stat=
e, 0, -1);<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_4.4.bb</a><br>
index b74903e..fbb592a 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
@@ -22,7 +22,9 @@ SRCREV_machine ?=3D &quot;b18090556c1d1b449233cd555c27a04=
d38272d6d&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8&quot;=
<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.4.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto-4.4.git;name=3Dmachine;branch=
=3D${KBRANCH}</a>; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsu=
ffix=3D${KMETA}</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsu=
ffix=3D${KMETA}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-powerpc-ptrace-Fix-ou=
t-of-bounds-array-access-warnin.patch \<br>
+&quot;<br>
<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.4.3&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11352e460d62ff053297b494--
