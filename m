Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 050C460721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 21:36:50 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id t140so6174291oie.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=F1jop2YjvPop5tKzjUuPHd28LtEMQYJWVILtdLsAmXo=;
	b=IoxWHYRWjfYVWBmm7fade8WTNbl6BwYf2HNs3snrA+XzKKzOhq+rUKY5b49QoVRKf9
	x9Dw0AFXWoJNdRghuiIYi4mYl0mZyf/gSilxdodDnX34aoMkUVzEiZXbDCbPsAR2knLh
	4WKqBj7yElo2RCkyvlPVA+xvpq4+xnUxJrb3uVJRhFKyoQZKAn1vLvmjaNMtL79sPxDW
	MjtNhEq6vFsAgrvTQdSrVYdVRI+f92uF3BF85sA/DQLBW8l4t3d+xxgF0irvUJ6fysjc
	/4qYSliypRqk1Po0sGtOEKDanz5GxwES4A/z5s/+a5W6RBP6FPrz/HbO5c1XFFyEuFEP
	/adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=F1jop2YjvPop5tKzjUuPHd28LtEMQYJWVILtdLsAmXo=;
	b=elii8SF+varH35QNXKFlc5dHAvfuOEwaQsKK4E+4JnKU9L9XBlDc7BKkA9S2oD6VJq
	ABRSm5x4ruWbQG8qYfWjTkzn2zN9EJ3NBxddThKFziDo709j41gYl12GvIeEwgIjdIcB
	ep3UhL/BHJDcos/0fc1clqmM1onngNYuQlAkGCU8UKO6mZ+IU0jBosEKfPCc0Vdicjbc
	+8wQT4R+bRDVJ92kK7PZRrqXRKc3dN5X9YFZmbOu8LtFyBQOLMZ7cKo3VNm5x2idSP8t
	B0zibYsiVIjE81CqRnunGtyj61NtMarUa6czwGZ+T6zHlbKI4utbR8bMkZD6R2A5h0k3
	fQ/g==
X-Gm-Message-State: AOPr4FVZegxXqidaPVgpnaD6Ya4peB7t7BDba9FZ45JazIt2k+Z+tO9Ac/bEcpM2tCli82rHjiiDAZgDOYm6uA==
MIME-Version: 1.0
X-Received: by 10.202.49.1 with SMTP id x1mr3015073oix.106.1463002611121; Wed,
	11 May 2016 14:36:51 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 11 May 2016 14:36:51 -0700 (PDT)
In-Reply-To: <CAMKF1srqdFXR4jD12MFL1rwco2aCyKYwh7dwKnNbC6xnu6ON0Q@mail.gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
	<CADkTA4P6hCQBMgNXZZY80OTSH2vuxjw0h27fgNvN8p22u8riAQ@mail.gmail.com>
	<CAMKF1srqdFXR4jD12MFL1rwco2aCyKYwh7dwKnNbC6xnu6ON0Q@mail.gmail.com>
Date: Wed, 11 May 2016 17:36:51 -0400
Message-ID: <CADkTA4O+yfpCXFzpqWcE1sC0TKD6TH2Xfbt7xiA3ncxBkYikTg@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 May 2016 21:36:51 -0000
Content-Type: multipart/alternative; boundary=001a113cd5caf10c47053297d67f

--001a113cd5caf10c47053297d67f
Content-Type: text/plain; charset=UTF-8

On Wed, May 11, 2016 at 5:30 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 11, 2016 at 2:27 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> >
> > On Wed, May 11, 2016 at 1:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> >
> >
> > These shouldn't be carried out of tree. So can you drop the linux-yocto
> > changes from the
> > series, and I'll look at getting them integrated later.
>
> I could but, this series switches to using gcc6 which will start to fail.
>

I can coordinate the fix. We just don't carry patches like this for linux
yocto. As you
can see, your series will no longer apply with the consolidated pull
requests that
I just sent.

Bruce


>
> >
> > Bruce
> >
> >>
> >> ---
> >>  ...ace-Fix-out-of-bounds-array-access-warnin.patch | 50
> >> ++++++++++++++++++++++
> >>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  4 +-
> >>  2 files changed, 53 insertions(+), 1 deletion(-)
> >>  create mode 100644
> >>
> meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
> >>
> >> diff --git
> >>
> a/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
> >>
> b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
> >> new file mode 100644
> >> index 0000000..05315ed
> >> --- /dev/null
> >> +++
> >>
> b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
> >> @@ -0,0 +1,50 @@
> >> +From 32acc1d9a5738b02e8815047af8886978aa40ead Mon Sep 17 00:00:00 2001
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Mon, 25 Apr 2016 05:47:01 +0000
> >> +Subject: [PATCH V2] powerpc/ptrace: Fix out of bounds array access
> >> warning
> >> +
> >> +gcc-6 correctly warns about a out of bounds access
> >> +
> >> +arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an
> offset
> >> greater than size of 'u64[32][1] {aka long long unsigned int[32][1]}'
> >> [-Warray-bounds]
> >> +        offsetof(struct thread_fp_state, fpr[32][0]));
> >> +                        ^
> >> +
> >> +check the end of array instead of beginning of next element to fix this
> >> +
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +Cc: Kees Cook <keescook@chromium.org>
> >> +Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> +Cc: Segher Boessenkool <segher@kernel.crashing.org>
> >> +---
> >> +Changes from v1 to v2:
> >> +
> >> +- Check for fpr[32] instead of fpr[31][1]
> >> +
> >> + arch/powerpc/kernel/ptrace.c | 4 ++--
> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/arch/powerpc/kernel/ptrace.c
> b/arch/powerpc/kernel/ptrace.c
> >> +index 737c0d0..b38fd08 100644
> >> +--- a/arch/powerpc/kernel/ptrace.c
> >> ++++ b/arch/powerpc/kernel/ptrace.c
> >> +@@ -376,7 +376,7 @@ static int fpr_get(struct task_struct *target,
> const
> >> struct user_regset *regset,
> >> +
> >> + #else
> >> +       BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
> >> +-                   offsetof(struct thread_fp_state, fpr[32][0]));
> >> ++                   offsetof(struct thread_fp_state, fpr[32]));
> >> +
> >> +       return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
> >> +                                  &target->thread.fp_state, 0, -1);
> >> +@@ -404,7 +404,7 @@ static int fpr_set(struct task_struct *target,
> const
> >> struct user_regset *regset,
> >> +       return 0;
> >> + #else
> >> +       BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
> >> +-                   offsetof(struct thread_fp_state, fpr[32][0]));
> >> ++                   offsetof(struct thread_fp_state, fpr[32]));
> >> +
> >> +       return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> >> +                                 &target->thread.fp_state, 0, -1);
> >> +--
> >> +1.9.1
> >> +
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> >> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> >> index b74903e..fbb592a 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> >> @@ -22,7 +22,9 @@ SRCREV_machine ?=
> >> "b18090556c1d1b449233cd555c27a04d38272d6d"
> >>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
> >>
> >>  SRC_URI =
> >> "git://
> git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH};
> >> \
> >> -
> >> git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
> "
> >> +
> >> git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
> >> \
> >> +
> >> file://0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch \
> >> +"
> >>
> >>  LINUX_VERSION ?= "4.4.3"
> >>
> >> --
> >> 2.8.2
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at
> > its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113cd5caf10c47053297d67f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 11, 2016 at 5:30 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, M=
ay 11, 2016 at 2:27 PM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Wed, May 11, 2016 at 1:35 PM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; These shouldn&#39;t be carried out of tree. So can you drop the linux-=
yocto<br>
&gt; changes from the<br>
&gt; series, and I&#39;ll look at getting them integrated later.<br>
<br>
</span>I could but, this series switches to using gcc6 which will start to =
fail.<br></blockquote><div><br></div><div>I can coordinate the fix. We just=
 don&#39;t carry patches like this for linux yocto. As you</div><div>can se=
e, your series will no longer apply with the consolidated pull requests tha=
t</div><div>I just sent.</div><div><br></div><div>Bruce</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...ace-Fix-out-of-bounds-array-access-warnin.patch | 50<br>
&gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 2 files changed, 53 insertions(+), 1 deletion(-)<br>
&gt;&gt;=C2=A0 create mode 100644<br>
&gt;&gt; meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-=
of-bounds-array-access-warnin.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-ou=
t-of-bounds-array-access-warnin.patch<br>
&gt;&gt; b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-ou=
t-of-bounds-array-access-warnin.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..05315ed<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-ou=
t-of-bounds-array-access-warnin.patch<br>
&gt;&gt; @@ -0,0 +1,50 @@<br>
&gt;&gt; +From 32acc1d9a5738b02e8815047af8886978aa40ead Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Mon, 25 Apr 2016 05:47:01 +0000<br>
&gt;&gt; +Subject: [PATCH V2] powerpc/ptrace: Fix out of bounds array acces=
s<br>
&gt;&gt; warning<br>
&gt;&gt; +<br>
&gt;&gt; +gcc-6 correctly warns about a out of bounds access<br>
&gt;&gt; +<br>
&gt;&gt; +arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an=
 offset<br>
&gt;&gt; greater than size of &#39;u64[32][1] {aka long long unsigned int[3=
2][1]}&#39;<br>
&gt;&gt; [-Warray-bounds]<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 offsetof(struct thread_fp_state, fpr[=
32][0]));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^<br>
&gt;&gt; +<br>
&gt;&gt; +check the end of array instead of beginning of next element to fi=
x this<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +Cc: Kees Cook &lt;<a href=3D"mailto:keescook@chromium.org">keesco=
ok@chromium.org</a>&gt;<br>
&gt;&gt; +Cc: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au">mp=
e@ellerman.id.au</a>&gt;<br>
&gt;&gt; +Cc: Segher Boessenkool &lt;<a href=3D"mailto:segher@kernel.crashi=
ng.org">segher@kernel.crashing.org</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; +Changes from v1 to v2:<br>
&gt;&gt; +<br>
&gt;&gt; +- Check for fpr[32] instead of fpr[31][1]<br>
&gt;&gt; +<br>
&gt;&gt; + arch/powerpc/kernel/ptrace.c | 4 ++--<br>
&gt;&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/p=
trace.c<br>
&gt;&gt; +index 737c0d0..b38fd08 100644<br>
&gt;&gt; +--- a/arch/powerpc/kernel/ptrace.c<br>
&gt;&gt; ++++ b/arch/powerpc/kernel/ptrace.c<br>
&gt;&gt; +@@ -376,7 +376,7 @@ static int fpr_get(struct task_struct *target=
, const<br>
&gt;&gt; struct user_regset *regset,<br>
&gt;&gt; +<br>
&gt;&gt; + #else<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON(offsetof(struct thread_fp=
_state, fpscr) !=3D<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0offsetof(struct thread_fp_state, fpr[32][0]));<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0offsetof(struct thread_fp_state, fpr[32]));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return user_regset_copyout(&amp;pos, &=
amp;count, &amp;kbuf, &amp;ubuf,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;target-&gt;thr=
ead.fp_state, 0, -1);<br>
&gt;&gt; +@@ -404,7 +404,7 @@ static int fpr_set(struct task_struct *target=
, const<br>
&gt;&gt; struct user_regset *regset,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; + #else<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON(offsetof(struct thread_fp=
_state, fpscr) !=3D<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0offsetof(struct thread_fp_state, fpr[32][0]));<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0offsetof(struct thread_fp_state, fpr[32]));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return user_regset_copyin(&amp;pos, &a=
mp;count, &amp;kbuf, &amp;ubuf,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;target-&gt;thre=
ad.fp_state, 0, -1);<br>
&gt;&gt; +--<br>
&gt;&gt; +1.9.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yoc=
to_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; index b74903e..fbb592a 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; @@ -22,7 +22,9 @@ SRCREV_machine ?=3D<br>
&gt;&gt; &quot;b18090556c1d1b449233cd555c27a04d38272d6d&quot;<br>
&gt;&gt;=C2=A0 SRCREV_meta ?=3D &quot;9ab4787fe2aea2ae0fcc31a5e067eaba19ef6=
4c8&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D<br>
&gt;&gt; &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto-4.4=
.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/linux-yocto-4.4.git;name=3Dmachine;branch=3D${KBRAN=
CH}</a>;<br>
&gt;&gt; \<br>
&gt;&gt; -<br>
&gt;&gt; git://<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;ty=
pe=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D${KMETA}" rel=3D"nor=
eferrer" target=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dk=
meta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D${KMETA}</a>&quot;<br>
&gt;&gt; +<br>
&gt;&gt; git://<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;ty=
pe=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D${KMETA}" rel=3D"nor=
eferrer" target=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dk=
meta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D${KMETA}</a><br>
&gt;&gt; \<br>
&gt;&gt; +<br>
&gt;&gt; file://0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.p=
atch \<br>
&gt;&gt; +&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 LINUX_VERSION ?=3D &quot;4.4.3&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.8.2<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at<br>
&gt; its end&quot;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113cd5caf10c47053297d67f--
