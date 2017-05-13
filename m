Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9844D605B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 16:16:55 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id k74so11705894qke.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sb1NNeX/aZa+KLMmyLJa4Gu+GQOoSK50r2LurHmyJ68=;
	b=uLauOEiVUiQCfeYHftYmQjgUxu//pRz/OLs417hjSIYPFbyq5xdCrYtYnrmXSDX1oQ
	14fzkWHSepbzvsc2db5bVXl51C0p74GH0YxLnbbwXRdXcAz0gS0Oi2mrb3IZjU0Sfimj
	MuYpc1tfaZ6nm3DcnnstsGt/Ylt66Zn/rGPhnFRX/y1Rkj4hQK345JchEHgU1KNnvtJi
	eWAqqI6cEJfGwplRyI3rRJnv+b9UM9F0HFUN0UREVbvZhPNgie13kj23lWNl/Uir31E6
	nTlljQwWtb/2gWwj/IyQN3fH+ixW4sajRIfAcRmS1KpyuToVZnUsq5HwaJUxc9lCyGr/
	CWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sb1NNeX/aZa+KLMmyLJa4Gu+GQOoSK50r2LurHmyJ68=;
	b=fUCvH7iPeLdyfW/kJ8x4BT5F2htbhp358swsIvF0mA9I+Z4Zbj4DgOf/yGC25WhTBu
	dRRH7jmqB1hCMV8Mxo09U0sfjNB4PhpgrjbiS4vt+svJy30DBi9mB1akF7zEBs4mCbAh
	uOmWFOihTRjCO+vQVKpW2tMbrkNJNjtnHHKrnzf/dushe7UW011XBQVVRx1C3d0iNLvP
	T/7RrXpR50Sb64tfKhZ7/hWWYXzkZ0SCDeEwZbZCxFhVRT7eJgVx9NsrjZe09JSYI9Aq
	NEfwyLyXmCQuexutaFkql8W1/rj0z+XAQ+Us/O5am7V4ePzXf9PzKUfpyucTtMxEFIny
	Ox0Q==
X-Gm-Message-State: AODbwcCm6X65p9Mn1/A2yDBsfihFI3+IqkReF1FkSWNPHO0fxnGMoZw3
	faZkN/TwwlaWiprucF9HSppvJn7UgQ==
X-Received: by 10.55.180.197 with SMTP id d188mr9242963qkf.318.1494692216490; 
	Sat, 13 May 2017 09:16:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Sat, 13 May 2017 09:16:55 -0700 (PDT)
In-Reply-To: <CAMKF1srXRodzzUUx5=XOJCGPA_rUFDxYPQu0mDKXgMuePCpqPA@mail.gmail.com>
References: <20170513025932.26254-1-raj.khem@gmail.com>
	<20170513025932.26254-7-raj.khem@gmail.com>
	<CADkTA4NJ2-w=k6t-rux=DOoydOQwz7NM5pYG7DDB0ZNcsFRY+Q@mail.gmail.com>
	<CAMKF1srXRodzzUUx5=XOJCGPA_rUFDxYPQu0mDKXgMuePCpqPA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 13 May 2017 12:16:55 -0400
Message-ID: <CADkTA4P2Bdj_cqAOrSCrYVafEvbKxW-uw1GOVegEigE8pkhyaQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] linux-yocto_4.1.bb: Fix build with gcc7
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
X-List-Received-Date: Sat, 13 May 2017 16:16:55 -0000
X-Groupsio-MsgNum: 97219
Content-Type: multipart/mixed; boundary="94eb2c06f3369da1df054f6a269c"

--94eb2c06f3369da1df054f6a269c
Content-Type: multipart/alternative; boundary="94eb2c06f3369da1d9054f6a269a"

--94eb2c06f3369da1d9054f6a269a
Content-Type: text/plain; charset="UTF-8"

On Sat, May 13, 2017 at 12:10 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, May 13, 2017 at 8:45 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > I already have this queued, I'm just not sending any kernel pull requests
> > while
> > the release is finalizing.
>
> its already done yesterday :) so you are free to send
>

oh! I hadn't noticed. I was heads down working on some features. I'll update
and send my queue tonight.

I attached the patch to show it exists :D

Cheers,

Bruce


>
> >
> > So please, do not queue or merge this change.
> >
>
> sure
>
> > Bruce
> >
> > On Fri, May 12, 2017 at 10:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  ...ve-up-on-gcc-ilog2-constant-optimizations.patch | 134
> >> +++++++++++++++++++++
> >>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   2 +
> >>  2 files changed, 136 insertions(+)
> >>  create mode 100644
> >> meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-
> gcc-ilog2-constant-optimizations.patch
> >>
> >> diff --git
> >> a/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-
> gcc-ilog2-constant-optimizations.patch
> >> b/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-
> gcc-ilog2-constant-optimizations.patch
> >> new file mode 100644
> >> index 0000000000..35c4484f20
> >> --- /dev/null
> >> +++
> >> b/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-
> gcc-ilog2-constant-optimizations.patch
> >> @@ -0,0 +1,134 @@
> >> +From 273bf720b7acb5f808337fe57c5f400422a30051 Mon Sep 17 00:00:00 2001
> >> +From: Linus Torvalds <torvalds@linux-foundation.org>
> >> +Date: Thu, 2 Mar 2017 12:17:22 -0800
> >> +Subject: [PATCH] give up on gcc ilog2() constant optimizations
> >> +
> >> +commit 474c90156c8dcc2fa815e6716cc9394d7930cb9c upstream.
> >> +
> >> +gcc-7 has an "optimization" pass that completely screws up, and
> >> +generates the code expansion for the (impossible) case of calling
> >> +ilog2() with a zero constant, even when the code gcc compiles does not
> >> +actually have a zero constant.
> >> +
> >> +And we try to generate a compile-time error for anybody doing ilog2()
> on
> >> +a constant where that doesn't make sense (be it zero or negative).  So
> >> +now gcc7 will fail the build due to our sanity checking, because it
> >> +created that constant-zero case that didn't actually exist in the
> source
> >> +code.
> >> +
> >> +There's a whole long discussion on the kernel mailing about how to work
> >> +around this gcc bug.  The gcc people themselevs have discussed their
> >> +"feature" in
> >> +
> >> +   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=72785
> >> +
> >> +but it's all water under the bridge, because while it looked at one
> >> +point like it would be solved by the time gcc7 was released, that was
> >> +not to be.
> >> +
> >> +So now we have to deal with this compiler braindamage.
> >> +
> >> +And the only simple approach seems to be to just delete the code that
> >> +tries to warn about bad uses of ilog2().
> >> +
> >> +So now "ilog2()" will just return 0 not just for the value 1, but for
> >> +any non-positive value too.
> >> +
> >> +It's not like I can recall anybody having ever actually tried to use
> >> +this function on any invalid value, but maybe the sanity check just
> >> +meant that such code never made it out in public.
> >> +
> >> +Reported-by: Laura Abbott <labbott@redhat.com>
> >> +Cc: John Stultz <john.stultz@linaro.org>,
> >> +Cc: Thomas Gleixner <tglx@linutronix.de>
> >> +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> >> +Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> >> +Cc: Jiri Slaby <jslaby@suse.cz>
> >> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> +Upstream-Status: Backport
> >> +
> >> + include/linux/log2.h       | 13 ++-----------
> >> + tools/include/linux/log2.h | 13 ++-----------
> >> + 2 files changed, 4 insertions(+), 22 deletions(-)
> >> +
> >> +diff --git a/include/linux/log2.h b/include/linux/log2.h
> >> +index fd7ff3d91e6a..f38fae23bdac 100644
> >> +--- a/include/linux/log2.h
> >> ++++ b/include/linux/log2.h
> >> +@@ -16,12 +16,6 @@
> >> + #include <linux/bitops.h>
> >> +
> >> + /*
> >> +- * deal with unrepresentable constant logarithms
> >> +- */
> >> +-extern __attribute__((const, noreturn))
> >> +-int ____ilog2_NaN(void);
> >> +-
> >> +-/*
> >> +  * non-constant log of base 2 calculators
> >> +  * - the arch may override these in asm/bitops.h if they can be
> >> implemented
> >> +  *   more efficiently than using fls() and fls64()
> >> +@@ -85,7 +79,7 @@ unsigned long __rounddown_pow_of_two(unsigned long
> n)
> >> + #define ilog2(n)                              \
> >> + (                                             \
> >> +       __builtin_constant_p(n) ? (             \
> >> +-              (n) < 1 ? ____ilog2_NaN() :     \
> >> ++              (n) < 2 ? 0 :                   \
> >> +               (n) & (1ULL << 63) ? 63 :       \
> >> +               (n) & (1ULL << 62) ? 62 :       \
> >> +               (n) & (1ULL << 61) ? 61 :       \
> >> +@@ -148,10 +142,7 @@ unsigned long __rounddown_pow_of_two(unsigned
> long
> >> n)
> >> +               (n) & (1ULL <<  4) ?  4 :       \
> >> +               (n) & (1ULL <<  3) ?  3 :       \
> >> +               (n) & (1ULL <<  2) ?  2 :       \
> >> +-              (n) & (1ULL <<  1) ?  1 :       \
> >> +-              (n) & (1ULL <<  0) ?  0 :       \
> >> +-              ____ilog2_NaN()                 \
> >> +-                                 ) :          \
> >> ++              1 ) :                           \
> >> +       (sizeof(n) <= 4) ?                      \
> >> +       __ilog2_u32(n) :                        \
> >> +       __ilog2_u64(n)                          \
> >> +diff --git a/tools/include/linux/log2.h b/tools/include/linux/log2.h
> >> +index 41446668ccce..d5677d39c1e4 100644
> >> +--- a/tools/include/linux/log2.h
> >> ++++ b/tools/include/linux/log2.h
> >> +@@ -13,12 +13,6 @@
> >> + #define _TOOLS_LINUX_LOG2_H
> >> +
> >> + /*
> >> +- * deal with unrepresentable constant logarithms
> >> +- */
> >> +-extern __attribute__((const, noreturn))
> >> +-int ____ilog2_NaN(void);
> >> +-
> >> +-/*
> >> +  * non-constant log of base 2 calculators
> >> +  * - the arch may override these in asm/bitops.h if they can be
> >> implemented
> >> +  *   more efficiently than using fls() and fls64()
> >> +@@ -78,7 +72,7 @@ unsigned long __rounddown_pow_of_two(unsigned long
> n)
> >> + #define ilog2(n)                              \
> >> + (                                             \
> >> +       __builtin_constant_p(n) ? (             \
> >> +-              (n) < 1 ? ____ilog2_NaN() :     \
> >> ++              (n) < 2 ? 0 :                   \
> >> +               (n) & (1ULL << 63) ? 63 :       \
> >> +               (n) & (1ULL << 62) ? 62 :       \
> >> +               (n) & (1ULL << 61) ? 61 :       \
> >> +@@ -141,10 +135,7 @@ unsigned long __rounddown_pow_of_two(unsigned
> long
> >> n)
> >> +               (n) & (1ULL <<  4) ?  4 :       \
> >> +               (n) & (1ULL <<  3) ?  3 :       \
> >> +               (n) & (1ULL <<  2) ?  2 :       \
> >> +-              (n) & (1ULL <<  1) ?  1 :       \
> >> +-              (n) & (1ULL <<  0) ?  0 :       \
> >> +-              ____ilog2_NaN()                 \
> >> +-                                 ) :          \
> >> ++              1 ) :                           \
> >> +       (sizeof(n) <= 4) ?                      \
> >> +       __ilog2_u32(n) :                        \
> >> +       __ilog2_u64(n)                          \
> >> +--
> >> +2.12.2
> >> +
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> >> b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> >> index bf7f266ee6..f90d5159d5 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> >> @@ -24,6 +24,8 @@ SRCREV_meta ?=
> >> "7140ddb86e4b01529185e6d4a606001ad152b8f3"
> >>  SRC_URI =
> >> "git://git.yoctoproject.org/linux-yocto-4.1.git;name=
> machine;branch=${KBRANCH};
> >> \
> >>
> >> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
> >>
> >> +SRC_URI +=
> >> "file://0001-give-up-on-gcc-ilog2-constant-optimizations.patch"
> >> +
> >>  LINUX_VERSION ?= "4.1.38"
> >>
> >>  PV = "${LINUX_VERSION}+git${SRCPV}"
> >> --
> >> 2.13.0
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

--94eb2c06f3369da1d9054f6a269a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, May 13, 2017 at 12:10 PM, Khem Raj <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sat, =
May 13, 2017 at 8:45 AM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt; I already have this queued, I&#39;m just not sending any kernel pull r=
equests<br>
&gt; while<br>
&gt; the release is finalizing.<br>
<br>
</span>its already done yesterday :) so you are free to send<br></blockquot=
e><div><br></div><div>oh! I hadn&#39;t noticed. I was heads down working on=
 some features. I&#39;ll update</div><div>and send my queue tonight.=C2=A0<=
/div><div><br></div><div>I attached the patch to show it exists :D</div><di=
v><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt;<br>
&gt; So please, do not queue or merge this change.<br>
&gt;<br>
<br>
</span>sure<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Bruce<br>
&gt;<br>
&gt; On Fri, May 12, 2017 at 10:59 PM, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...ve-up-on-gcc-ilog2-<wbr>constant-optimizations.patch | 13=
4<br>
&gt;&gt; +++++++++++++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;&gt;=C2=A0 2 files changed, 136 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644<br>
&gt;&gt; meta/recipes-kernel/linux/<wbr>linux-yocto/0001-give-up-on-<wbr>gc=
c-ilog2-constant-<wbr>optimizations.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-give-up-on-<wbr>=
gcc-ilog2-constant-<wbr>optimizations.patch<br>
&gt;&gt; b/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-give-up-on-<wbr>=
gcc-ilog2-constant-<wbr>optimizations.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..35c4484f20<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-give-up-on-<wbr>=
gcc-ilog2-constant-<wbr>optimizations.patch<br>
&gt;&gt; @@ -0,0 +1,134 @@<br>
&gt;&gt; +From 273bf720b7acb5f808337fe57c5f40<wbr>0422a30051 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; +From: Linus Torvalds &lt;<a href=3D"mailto:torvalds@linux-foundat=
ion.org">torvalds@linux-foundation.org</a><wbr>&gt;<br>
&gt;&gt; +Date: Thu, 2 Mar 2017 12:17:22 -0800<br>
&gt;&gt; +Subject: [PATCH] give up on gcc ilog2() constant optimizations<br=
>
&gt;&gt; +<br>
&gt;&gt; +commit 474c90156c8dcc2fa815e6716cc939<wbr>4d7930cb9c upstream.<br=
>
&gt;&gt; +<br>
&gt;&gt; +gcc-7 has an &quot;optimization&quot; pass that completely screws=
 up, and<br>
&gt;&gt; +generates the code expansion for the (impossible) case of calling=
<br>
&gt;&gt; +ilog2() with a zero constant, even when the code gcc compiles doe=
s not<br>
&gt;&gt; +actually have a zero constant.<br>
&gt;&gt; +<br>
&gt;&gt; +And we try to generate a compile-time error for anybody doing ilo=
g2() on<br>
&gt;&gt; +a constant where that doesn&#39;t make sense (be it zero or negat=
ive).=C2=A0 So<br>
&gt;&gt; +now gcc7 will fail the build due to our sanity checking, because =
it<br>
&gt;&gt; +created that constant-zero case that didn&#39;t actually exist in=
 the source<br>
&gt;&gt; +code.<br>
&gt;&gt; +<br>
&gt;&gt; +There&#39;s a whole long discussion on the kernel mailing about h=
ow to work<br>
&gt;&gt; +around this gcc bug.=C2=A0 The gcc people themselevs have discuss=
ed their<br>
&gt;&gt; +&quot;feature&quot; in<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D72785" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzi=
lla/<wbr>show_bug.cgi?id=3D72785</a><br>
&gt;&gt; +<br>
&gt;&gt; +but it&#39;s all water under the bridge, because while it looked =
at one<br>
&gt;&gt; +point like it would be solved by the time gcc7 was released, that=
 was<br>
&gt;&gt; +not to be.<br>
&gt;&gt; +<br>
&gt;&gt; +So now we have to deal with this compiler braindamage.<br>
&gt;&gt; +<br>
&gt;&gt; +And the only simple approach seems to be to just delete the code =
that<br>
&gt;&gt; +tries to warn about bad uses of ilog2().<br>
&gt;&gt; +<br>
&gt;&gt; +So now &quot;ilog2()&quot; will just return 0 not just for the va=
lue 1, but for<br>
&gt;&gt; +any non-positive value too.<br>
&gt;&gt; +<br>
&gt;&gt; +It&#39;s not like I can recall anybody having ever actually tried=
 to use<br>
&gt;&gt; +this function on any invalid value, but maybe the sanity check ju=
st<br>
&gt;&gt; +meant that such code never made it out in public.<br>
&gt;&gt; +<br>
&gt;&gt; +Reported-by: Laura Abbott &lt;<a href=3D"mailto:labbott@redhat.co=
m">labbott@redhat.com</a>&gt;<br>
&gt;&gt; +Cc: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org">joh=
n.stultz@linaro.org</a>&gt;,<br>
&gt;&gt; +Cc: Thomas Gleixner &lt;<a href=3D"mailto:tglx@linutronix.de">tgl=
x@linutronix.de</a>&gt;<br>
&gt;&gt; +Cc: Ard Biesheuvel &lt;<a href=3D"mailto:ard.biesheuvel@linaro.or=
g">ard.biesheuvel@linaro.org</a>&gt;<br>
&gt;&gt; +Signed-off-by: Linus Torvalds &lt;<a href=3D"mailto:torvalds@linu=
x-foundation.org">torvalds@linux-foundation.org</a><wbr>&gt;<br>
&gt;&gt; +Cc: Jiri Slaby &lt;<a href=3D"mailto:jslaby@suse.cz">jslaby@suse.=
cz</a>&gt;<br>
&gt;&gt; +Signed-off-by: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@li=
nuxfoundation.org">gregkh@linuxfoundation.org</a>&gt;<br>
&gt;&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; +Upstream-Status: Backport<br>
&gt;&gt; +<br>
&gt;&gt; + include/linux/log2.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++----------=
-<br>
&gt;&gt; + tools/include/linux/log2.h | 13 ++-----------<br>
&gt;&gt; + 2 files changed, 4 insertions(+), 22 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/include/linux/log2.h b/include/linux/log2.h<br>
&gt;&gt; +index fd7ff3d91e6a..f38fae23bdac 100644<br>
&gt;&gt; +--- a/include/linux/log2.h<br>
&gt;&gt; ++++ b/include/linux/log2.h<br>
&gt;&gt; +@@ -16,12 +16,6 @@<br>
&gt;&gt; + #include &lt;linux/bitops.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; + /*<br>
&gt;&gt; +- * deal with unrepresentable constant logarithms<br>
&gt;&gt; +- */<br>
&gt;&gt; +-extern __attribute__((const, noreturn))<br>
&gt;&gt; +-int ____ilog2_NaN(void);<br>
&gt;&gt; +-<br>
&gt;&gt; +-/*<br>
&gt;&gt; +=C2=A0 * non-constant log of base 2 calculators<br>
&gt;&gt; +=C2=A0 * - the arch may override these in asm/bitops.h if they ca=
n be<br>
&gt;&gt; implemented<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0more efficiently than using fls() and fls64(=
)<br>
&gt;&gt; +@@ -85,7 +79,7 @@ unsigned long __rounddown_pow_of_two(<wbr>unsig=
ned long n)<br>
&gt;&gt; + #define ilog2(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; + (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__builtin_constant_p(n) ? (=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &lt; 1 ? __=
__ilog2_NaN() :=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &lt; 2 ? 0 =
:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt; 63) ? 63 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt; 62) ? 62 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt; 61) ? 61 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +@@ -148,10 +142,7 @@ unsigned long __rounddown_pow_of_two(<wbr>un=
signed long<br>
&gt;&gt; n)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt;=C2=A0 4) ?=C2=A0 4 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt;=C2=A0 3) ?=C2=A0 3 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt;=C2=A0 2) ?=C2=A0 2 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &amp; (1ULL=
 &lt;&lt;=C2=A0 1) ?=C2=A0 1 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &amp; (1ULL=
 &lt;&lt;=C2=A0 0) ?=C2=A0 0 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ____ilog2_NaN()=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0) :=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ) :=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(sizeof(n) &lt;=3D 4) ?=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__ilog2_u32(n) :=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__ilog2_u64(n)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +diff --git a/tools/include/linux/log2.h b/tools/include/linux/log=
2.h<br>
&gt;&gt; +index 41446668ccce..d5677d39c1e4 100644<br>
&gt;&gt; +--- a/tools/include/linux/log2.h<br>
&gt;&gt; ++++ b/tools/include/linux/log2.h<br>
&gt;&gt; +@@ -13,12 +13,6 @@<br>
&gt;&gt; + #define _TOOLS_LINUX_LOG2_H<br>
&gt;&gt; +<br>
&gt;&gt; + /*<br>
&gt;&gt; +- * deal with unrepresentable constant logarithms<br>
&gt;&gt; +- */<br>
&gt;&gt; +-extern __attribute__((const, noreturn))<br>
&gt;&gt; +-int ____ilog2_NaN(void);<br>
&gt;&gt; +-<br>
&gt;&gt; +-/*<br>
&gt;&gt; +=C2=A0 * non-constant log of base 2 calculators<br>
&gt;&gt; +=C2=A0 * - the arch may override these in asm/bitops.h if they ca=
n be<br>
&gt;&gt; implemented<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0more efficiently than using fls() and fls64(=
)<br>
&gt;&gt; +@@ -78,7 +72,7 @@ unsigned long __rounddown_pow_of_two(<wbr>unsig=
ned long n)<br>
&gt;&gt; + #define ilog2(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; + (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__builtin_constant_p(n) ? (=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &lt; 1 ? __=
__ilog2_NaN() :=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &lt; 2 ? 0 =
:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt; 63) ? 63 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt; 62) ? 62 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt; 61) ? 61 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +@@ -141,10 +135,7 @@ unsigned long __rounddown_pow_of_two(<wbr>un=
signed long<br>
&gt;&gt; n)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt;=C2=A0 4) ?=C2=A0 4 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt;=C2=A0 3) ?=C2=A0 3 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; =
(1ULL &lt;&lt;=C2=A0 2) ?=C2=A0 2 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &amp; (1ULL=
 &lt;&lt;=C2=A0 1) ?=C2=A0 1 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &amp; (1ULL=
 &lt;&lt;=C2=A0 0) ?=C2=A0 0 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ____ilog2_NaN()=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0) :=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ) :=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(sizeof(n) &lt;=3D 4) ?=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__ilog2_u32(n) :=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__ilog2_u64(n)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +--<br>
&gt;&gt; +2.12.2<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yoc=
to_4.1.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.1.bb</a>=
<br>
&gt;&gt; b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.1.bb</a><br>
&gt;&gt; index bf7f266ee6..f90d5159d5 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.1.bb</a><br>
&gt;&gt; @@ -24,6 +24,8 @@ SRCREV_meta ?=3D<br>
&gt;&gt; &quot;<wbr>7140ddb86e4b01529185e6d4a60600<wbr>1ad152b8f3&quot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D<br>
&gt;&gt; &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto-4.1=
.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/<wbr>linux-yocto-4.1.git;name=3D<wbr>machine;branch=
=3D${KBRANCH}</a>;<br>
&gt;&gt; \<br>
&gt;&gt;<br>
&gt;&gt; git://<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;ty=
pe=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.1;destsuffix=3D${KMETA}" rel=3D"nor=
eferrer" target=3D"_blank">git.yoctoproject.org/<wbr>yocto-kernel-cache;typ=
e=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto-4.1;<wbr>destsuffix=3D${KMETA}</a=
>&quot;<br>
&gt;&gt;<br>
&gt;&gt; +SRC_URI +=3D<br>
&gt;&gt; &quot;file://0001-give-up-on-gcc-<wbr>ilog2-constant-optimizations=
.<wbr>patch&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 LINUX_VERSION ?=3D &quot;4.1.38&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.13.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at<br>
&gt; its end&quot;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--94eb2c06f3369da1d9054f6a269a--

--94eb2c06f3369da1df054f6a269c
Content-Type: application/octet-stream; 
	name="0001-linux-yocto-4.1-fix-gcc7-compilation.patch"
Content-Disposition: attachment; 
	filename="0001-linux-yocto-4.1-fix-gcc7-compilation.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j2nh1h250

RnJvbSA5OGFhMjMzNGIyNWJhZGQwODBkMmI2Y2JmODc2ODNmODRlZGU4NjAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogTW9uLCAxMCBBcHIgMjAxNyAxODoxNDowOSAtMDQwMApTdWJqZWN0OiBb
UEFUQ0hdIGxpbnV4LXlvY3RvLzQuMTogZml4IGdjYzcgY29tcGlsYXRpb24KClBvcnRpbmcgdGhl
IG1haW5saW5lIGNvbW1pdCwgdG8gZml4IGdjYzcgYnVpbGRzOgoKICA0NzRjOTAxNTZjIFtnaXZl
IHVwIG9uIGdjYyBpbG9nMigpIGNvbnN0YW50IG9wdGltaXphdGlvbnNdCgpTaWduZWQtb2ZmLWJ5
OiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJpdmVyLmNvbT4KLS0tCiBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzQuMS5iYiAgIHwgIDQgKystLQog
bWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by10aW55XzQuMS5iYiB8ICA0ICsr
LS0KIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNC4xLmJiICAgICAgfCAx
OCArKysrKysrKystLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9s
aW51eC15b2N0by1ydF80LjEuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlv
Y3RvLXJ0XzQuMS5iYgppbmRleCAyMWNjNjM1YmY0ZjguLjlmYzE4NmNkYjA2MiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1ydF80LjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1ydF80LjEuYmIKQEAgLTExLDgg
KzExLDggQEAgcHl0aG9uICgpIHsKICAgICAgICAgcmFpc2UgYmIucGFyc2UuU2tpcFBhY2thZ2Uo
IlNldCBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9rZXJuZWwgdG8gbGludXgteW9jdG8tcnQg
dG8gZW5hYmxlIGl0IikKIH0KIAotU1JDUkVWX21hY2hpbmUgPz0gImY3OTNjNzFkNTEyNzdiZGIx
NGQ2ODU0YzhjYmNjMDliNGY1OTM2YjQiCi1TUkNSRVZfbWV0YSA/PSAiNzE0MGRkYjg2ZTRiMDE1
MjkxODVlNmQ0YTYwNjAwMWFkMTUyYjhmMyIKK1NSQ1JFVl9tYWNoaW5lID89ICJlYzBiZmFkYWVh
YzI0Y2M2M2ZhMDU1MjFjNjYwOGI3OWIyNmE1ZTVkIgorU1JDUkVWX21ldGEgPz0gImE4NjdlZGFi
NDE1ZjBkZGMxYTBkOGRhNmRkYjQzYzhhZmE5NjExZGQiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
LnlvY3RvcHJvamVjdC5vcmcvbGludXgteW9jdG8tNC4xLmdpdDticmFuY2g9JHtLQlJBTkNIfTtu
YW1lPW1hY2hpbmUgXAogICAgICAgICAgICBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0
by1rZXJuZWwtY2FjaGU7dHlwZT1rbWV0YTtuYW1lPW1ldGE7YnJhbmNoPXlvY3RvLTQuMTtkZXN0
c3VmZml4PSR7S01FVEF9IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9s
aW51eC15b2N0by10aW55XzQuMS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgt
eW9jdG8tdGlueV80LjEuYmIKaW5kZXggY2U4YWVhNjI4YjJjLi44ZDlkOTQwNDEwZWUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tdGlueV80LjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by10aW55XzQuMS5iYgpA
QCAtOSw4ICs5LDggQEAgTElOVVhfVkVSU0lPTiA/PSAiNC4xLjM4IgogS01FVEEgPSAia2VybmVs
LW1ldGEiCiBLQ09ORl9CU1BfQVVESVRfTEVWRUwgPSAiMiIKIAotU1JDUkVWX21hY2hpbmUgPz0g
IjJjZTU2ZDEzMGRkZmY2N2Y0M2VjODU3Y2M1MWNkMzQ3NjY2YTAwNzgiCi1TUkNSRVZfbWV0YSA/
PSAiNzE0MGRkYjg2ZTRiMDE1MjkxODVlNmQ0YTYwNjAwMWFkMTUyYjhmMyIKK1NSQ1JFVl9tYWNo
aW5lID89ICIzOThkMTc4NWM2YmRlMDA4NWI5OWYwMGYzNDZlMTk5YTE1ZmJkY2VmIgorU1JDUkVW
X21ldGEgPz0gImE4NjdlZGFiNDE1ZjBkZGMxYTBkOGRhNmRkYjQzYzhhZmE5NjExZGQiCiAKIFBW
ID0gIiR7TElOVVhfVkVSU0lPTn0rZ2l0JHtTUkNQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNC4xLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5l
bC9saW51eC9saW51eC15b2N0b180LjEuYmIKaW5kZXggYmY3ZjI2NmVlNmYyLi5lMDE0MDI2YmI5
ZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNC4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNC4xLmJiCkBA
IC0xMSwxNSArMTEsMTUgQEAgS0JSQU5DSF9xZW11eDg2ICA/PSAic3RhbmRhcmQvYmFzZSIKIEtC
UkFOQ0hfcWVtdXg4Ni02NCA/PSAic3RhbmRhcmQvYmFzZSIKIEtCUkFOQ0hfcWVtdW1pcHM2NCA/
PSAic3RhbmRhcmQvbXRpLW1hbHRhNjQiCiAKLVNSQ1JFVl9tYWNoaW5lX3FlbXVhcm0gPz0gIjRk
MmM5NWU3OGNkYzdkMzEyYjdhYjIzMWNlOTBkY2UzMTdmNDVkZjkiCi1TUkNSRVZfbWFjaGluZV9x
ZW11YXJtNjQgPz0gIjJjZTU2ZDEzMGRkZmY2N2Y0M2VjODU3Y2M1MWNkMzQ3NjY2YTAwNzgiCi1T
UkNSRVZfbWFjaGluZV9xZW11bWlwcyA/PSAiODE0NTRmOTUxNjYwNTZhMjUzYzg5NTA5ODBlMDI1
ZWUyNDNkODA3NCIKLVNSQ1JFVl9tYWNoaW5lX3FlbXVwcGMgPz0gIjQyYzQxZTYwNmI3MGZkNzNh
MjAyZjQxNDZjMDQ4MGY1NjI0YjBhMGUiCi1TUkNSRVZfbWFjaGluZV9xZW11eDg2ID89ICIyY2U1
NmQxMzBkZGZmNjdmNDNlYzg1N2NjNTFjZDM0NzY2NmEwMDc4IgotU1JDUkVWX21hY2hpbmVfcWVt
dXg4Ni02NCA/PSAiMmNlNTZkMTMwZGRmZjY3ZjQzZWM4NTdjYzUxY2QzNDc2NjZhMDA3OCIKLVNS
Q1JFVl9tYWNoaW5lX3FlbXVtaXBzNjQgPz0gIjhhNDgxMDA1ZGE0MWY4MmQyYTQwYmY4Y2I0MDMz
NDU0NzE2MGFiNWIiCi1TUkNSRVZfbWFjaGluZSA/PSAiMmNlNTZkMTMwZGRmZjY3ZjQzZWM4NTdj
YzUxY2QzNDc2NjZhMDA3OCIKLVNSQ1JFVl9tZXRhID89ICI3MTQwZGRiODZlNGIwMTUyOTE4NWU2
ZDRhNjA2MDAxYWQxNTJiOGYzIgorU1JDUkVWX21hY2hpbmVfcWVtdWFybSA/PSAiM2IwZmQyNDc5
N2NiMTFhYWU1NDAxMGIxYmJjMDlkZDJhZThhMTA4ZSIKK1NSQ1JFVl9tYWNoaW5lX3FlbXVhcm02
NCA/PSAiMzk4ZDE3ODVjNmJkZTAwODViOTlmMDBmMzQ2ZTE5OWExNWZiZGNlZiIKK1NSQ1JFVl9t
YWNoaW5lX3FlbXVtaXBzID89ICI3NDIwNTE2ZmY1NDVmOGFiM2UyNDcxY2YwOGJmODUxNzQ0MjY0
YTZhIgorU1JDUkVWX21hY2hpbmVfcWVtdXBwYyA/PSAiNjk1MmY1YTcwYmM4YTg0YTRjNGQ5MjZj
ZGVjOTNlN2EzOTg3OGYzMiIKK1NSQ1JFVl9tYWNoaW5lX3FlbXV4ODYgPz0gIjM5OGQxNzg1YzZi
ZGUwMDg1Yjk5ZjAwZjM0NmUxOTlhMTVmYmRjZWYiCitTUkNSRVZfbWFjaGluZV9xZW11eDg2LTY0
ID89ICIzOThkMTc4NWM2YmRlMDA4NWI5OWYwMGYzNDZlMTk5YTE1ZmJkY2VmIgorU1JDUkVWX21h
Y2hpbmVfcWVtdW1pcHM2NCA/PSAiNTk3Mjc1Mzg3NzQ4NjAzODFmNDJiY2ZiNmVjMDVmZTIxZmFj
ZDMxOSIKK1NSQ1JFVl9tYWNoaW5lID89ICIzOThkMTc4NWM2YmRlMDA4NWI5OWYwMGYzNDZlMTk5
YTE1ZmJkY2VmIgorU1JDUkVWX21ldGEgPz0gImE4NjdlZGFiNDE1ZjBkZGMxYTBkOGRhNmRkYjQz
YzhhZmE5NjExZGQiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbGlu
dXgteW9jdG8tNC4xLmdpdDtuYW1lPW1hY2hpbmU7YnJhbmNoPSR7S0JSQU5DSH07IFwKICAgICAg
ICAgICAgZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcveW9jdG8ta2VybmVsLWNhY2hlO3R5cGU9
a21ldGE7bmFtZT1tZXRhO2JyYW5jaD15b2N0by00LjE7ZGVzdHN1ZmZpeD0ke0tNRVRBfSIKLS0g
CjIuNS4wCgo=

--94eb2c06f3369da1df054f6a269c--
