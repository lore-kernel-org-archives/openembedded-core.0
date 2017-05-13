Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 57EED65CC7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 15:45:52 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id k74so11636795qke.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a/INjnY09DHU5bvIjNyfwbSGLlm7+Wtpk8dBOr7nDXE=;
	b=vSTP6D1jV/sUpryEAfWqR/nmtxkB5ciqF7JPzjPq+LK+4jCNJx8zxxoXQAFEWn2OXH
	erCAm/PylhDGWX781qArFxbKsM5zLYi6A6QUB74Lf+jqAtERNQ6JPNLsabIqDkj1BXWn
	xo7K4MVY6gqVSkwHbp8WSSSrjiVDNXX2zbf+uc/ym4skV6YkRlXM41Y70kEVSrj+wB2S
	q4e7TAZHeTA0hV3BBh6zuDN8VRNbyUymY1m8+tKYxzW4ROulAT0B3A64nzgjDRdWGvKi
	ECDfWRZqr2roVEy/68hVAaIzWOP0mS7T24wxV3VtuaATXpnFzfHs+07Tg4IOWhh+TGKS
	5j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a/INjnY09DHU5bvIjNyfwbSGLlm7+Wtpk8dBOr7nDXE=;
	b=DA2kjrjr8PbI0XGI9xFBiIsCUhR6jZBV/Ihf+EtKhosppPse4QhpG5lvQg5P611FpP
	n6R/TbAJj7bYY5DseCNjorqwr/8DaehrFE8oZRuPzqc4gIu10kdxxCWlFo4xfJJmG4Vf
	BUzeg0F9RICzYIpR0gmYynv4oXr5/XUsdbMBOmhzIwtDnpihQRNYuShRzPNnkNgs7fCH
	Fdy5Pt2y78oRQXuy6Faxm0ZRMYCJ7Yh7ybDT81pFGfSK1quaxB6Yv4hdXZFD3A+B4igS
	N9Y9+d1ewpNU1CmGSBqpPcsz4zhfU3VO1CZmbHBn0UMX4n5ZS/UXrswewUibw+NaA17P
	XX5w==
X-Gm-Message-State: AODbwcBr+0urI3OmAFj0kSCldF0Ll/iR98wm5oQhjIEoJ5d+MNWcWSuk
	ZLjOowqykYoa1XluT3SNot3k+9iMQQ==
X-Received: by 10.55.180.197 with SMTP id d188mr9131041qkf.318.1494690353343; 
	Sat, 13 May 2017 08:45:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Sat, 13 May 2017 08:45:52 -0700 (PDT)
In-Reply-To: <20170513025932.26254-7-raj.khem@gmail.com>
References: <20170513025932.26254-1-raj.khem@gmail.com>
	<20170513025932.26254-7-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 13 May 2017 11:45:52 -0400
Message-ID: <CADkTA4NJ2-w=k6t-rux=DOoydOQwz7NM5pYG7DDB0ZNcsFRY+Q@mail.gmail.com>
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
X-List-Received-Date: Sat, 13 May 2017 15:45:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c06f3368f70c6054f69b77f"

--94eb2c06f3368f70c6054f69b77f
Content-Type: text/plain; charset="UTF-8"

I already have this queued, I'm just not sending any kernel pull requests
while
the release is finalizing.

So please, do not queue or merge this change.

Bruce

On Fri, May 12, 2017 at 10:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ve-up-on-gcc-ilog2-constant-optimizations.patch | 134
> +++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   2 +
>  2 files changed, 136 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-
> gcc-ilog2-constant-optimizations.patch
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-
> gcc-ilog2-constant-optimizations.patch b/meta/recipes-kernel/linux/
> linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch
> new file mode 100644
> index 0000000000..35c4484f20
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-
> gcc-ilog2-constant-optimizations.patch
> @@ -0,0 +1,134 @@
> +From 273bf720b7acb5f808337fe57c5f400422a30051 Mon Sep 17 00:00:00 2001
> +From: Linus Torvalds <torvalds@linux-foundation.org>
> +Date: Thu, 2 Mar 2017 12:17:22 -0800
> +Subject: [PATCH] give up on gcc ilog2() constant optimizations
> +
> +commit 474c90156c8dcc2fa815e6716cc9394d7930cb9c upstream.
> +
> +gcc-7 has an "optimization" pass that completely screws up, and
> +generates the code expansion for the (impossible) case of calling
> +ilog2() with a zero constant, even when the code gcc compiles does not
> +actually have a zero constant.
> +
> +And we try to generate a compile-time error for anybody doing ilog2() on
> +a constant where that doesn't make sense (be it zero or negative).  So
> +now gcc7 will fail the build due to our sanity checking, because it
> +created that constant-zero case that didn't actually exist in the source
> +code.
> +
> +There's a whole long discussion on the kernel mailing about how to work
> +around this gcc bug.  The gcc people themselevs have discussed their
> +"feature" in
> +
> +   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=72785
> +
> +but it's all water under the bridge, because while it looked at one
> +point like it would be solved by the time gcc7 was released, that was
> +not to be.
> +
> +So now we have to deal with this compiler braindamage.
> +
> +And the only simple approach seems to be to just delete the code that
> +tries to warn about bad uses of ilog2().
> +
> +So now "ilog2()" will just return 0 not just for the value 1, but for
> +any non-positive value too.
> +
> +It's not like I can recall anybody having ever actually tried to use
> +this function on any invalid value, but maybe the sanity check just
> +meant that such code never made it out in public.
> +
> +Reported-by: Laura Abbott <labbott@redhat.com>
> +Cc: John Stultz <john.stultz@linaro.org>,
> +Cc: Thomas Gleixner <tglx@linutronix.de>
> +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> +Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> +Cc: Jiri Slaby <jslaby@suse.cz>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Backport
> +
> + include/linux/log2.h       | 13 ++-----------
> + tools/include/linux/log2.h | 13 ++-----------
> + 2 files changed, 4 insertions(+), 22 deletions(-)
> +
> +diff --git a/include/linux/log2.h b/include/linux/log2.h
> +index fd7ff3d91e6a..f38fae23bdac 100644
> +--- a/include/linux/log2.h
> ++++ b/include/linux/log2.h
> +@@ -16,12 +16,6 @@
> + #include <linux/bitops.h>
> +
> + /*
> +- * deal with unrepresentable constant logarithms
> +- */
> +-extern __attribute__((const, noreturn))
> +-int ____ilog2_NaN(void);
> +-
> +-/*
> +  * non-constant log of base 2 calculators
> +  * - the arch may override these in asm/bitops.h if they can be
> implemented
> +  *   more efficiently than using fls() and fls64()
> +@@ -85,7 +79,7 @@ unsigned long __rounddown_pow_of_two(unsigned long n)
> + #define ilog2(n)                              \
> + (                                             \
> +       __builtin_constant_p(n) ? (             \
> +-              (n) < 1 ? ____ilog2_NaN() :     \
> ++              (n) < 2 ? 0 :                   \
> +               (n) & (1ULL << 63) ? 63 :       \
> +               (n) & (1ULL << 62) ? 62 :       \
> +               (n) & (1ULL << 61) ? 61 :       \
> +@@ -148,10 +142,7 @@ unsigned long __rounddown_pow_of_two(unsigned long
> n)
> +               (n) & (1ULL <<  4) ?  4 :       \
> +               (n) & (1ULL <<  3) ?  3 :       \
> +               (n) & (1ULL <<  2) ?  2 :       \
> +-              (n) & (1ULL <<  1) ?  1 :       \
> +-              (n) & (1ULL <<  0) ?  0 :       \
> +-              ____ilog2_NaN()                 \
> +-                                 ) :          \
> ++              1 ) :                           \
> +       (sizeof(n) <= 4) ?                      \
> +       __ilog2_u32(n) :                        \
> +       __ilog2_u64(n)                          \
> +diff --git a/tools/include/linux/log2.h b/tools/include/linux/log2.h
> +index 41446668ccce..d5677d39c1e4 100644
> +--- a/tools/include/linux/log2.h
> ++++ b/tools/include/linux/log2.h
> +@@ -13,12 +13,6 @@
> + #define _TOOLS_LINUX_LOG2_H
> +
> + /*
> +- * deal with unrepresentable constant logarithms
> +- */
> +-extern __attribute__((const, noreturn))
> +-int ____ilog2_NaN(void);
> +-
> +-/*
> +  * non-constant log of base 2 calculators
> +  * - the arch may override these in asm/bitops.h if they can be
> implemented
> +  *   more efficiently than using fls() and fls64()
> +@@ -78,7 +72,7 @@ unsigned long __rounddown_pow_of_two(unsigned long n)
> + #define ilog2(n)                              \
> + (                                             \
> +       __builtin_constant_p(n) ? (             \
> +-              (n) < 1 ? ____ilog2_NaN() :     \
> ++              (n) < 2 ? 0 :                   \
> +               (n) & (1ULL << 63) ? 63 :       \
> +               (n) & (1ULL << 62) ? 62 :       \
> +               (n) & (1ULL << 61) ? 61 :       \
> +@@ -141,10 +135,7 @@ unsigned long __rounddown_pow_of_two(unsigned long
> n)
> +               (n) & (1ULL <<  4) ?  4 :       \
> +               (n) & (1ULL <<  3) ?  3 :       \
> +               (n) & (1ULL <<  2) ?  2 :       \
> +-              (n) & (1ULL <<  1) ?  1 :       \
> +-              (n) & (1ULL <<  0) ?  0 :       \
> +-              ____ilog2_NaN()                 \
> +-                                 ) :          \
> ++              1 ) :                           \
> +       (sizeof(n) <= 4) ?                      \
> +       __ilog2_u32(n) :                        \
> +       __ilog2_u64(n)                          \
> +--
> +2.12.2
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> index bf7f266ee6..f90d5159d5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> @@ -24,6 +24,8 @@ SRCREV_meta ?= "7140ddb86e4b01529185e6d4a60600
> 1ad152b8f3"
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=
> machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
>
> +SRC_URI += "file://0001-give-up-on-gcc-ilog2-constant-optimizations.
> patch"
> +
>  LINUX_VERSION ?= "4.1.38"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> --
> 2.13.0
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

--94eb2c06f3368f70c6054f69b77f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I already have this queued, I&#39;m just not sending any k=
ernel pull requests while<div>the release is finalizing.</div><div><br></di=
v><div>So please, do not queue or merge this change.</div><div><br></div><d=
iv>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Fri, May 12, 2017 at 10:59 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ve-up-on-gcc-ilog2-<wbr>constant-optimizations.patch | 134 +++++++=
++++++++++++++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A02 files changed, 136 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>linux-yocto/0001-gi=
ve-up-on-<wbr>gcc-ilog2-constant-<wbr>optimizations.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-give-up-on-<wb=
r>gcc-ilog2-constant-<wbr>optimizations.patch b/meta/recipes-kernel/linux/<=
wbr>linux-yocto/0001-give-up-on-<wbr>gcc-ilog2-constant-<wbr>optimizations.=
patch<br>
new file mode 100644<br>
index 0000000000..35c4484f20<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-give-up-on-<wbr>gcc-i=
log2-constant-<wbr>optimizations.patch<br>
@@ -0,0 +1,134 @@<br>
+From 273bf720b7acb5f808337fe57c5f40<wbr>0422a30051 Mon Sep 17 00:00:00 200=
1<br>
+From: Linus Torvalds &lt;<a href=3D"mailto:torvalds@linux-foundation.org">=
torvalds@linux-foundation.org</a><wbr>&gt;<br>
+Date: Thu, 2 Mar 2017 12:17:22 -0800<br>
+Subject: [PATCH] give up on gcc ilog2() constant optimizations<br>
+<br>
+commit 474c90156c8dcc2fa815e6716cc939<wbr>4d7930cb9c upstream.<br>
+<br>
+gcc-7 has an &quot;optimization&quot; pass that completely screws up, and<=
br>
+generates the code expansion for the (impossible) case of calling<br>
+ilog2() with a zero constant, even when the code gcc compiles does not<br>
+actually have a zero constant.<br>
+<br>
+And we try to generate a compile-time error for anybody doing ilog2() on<b=
r>
+a constant where that doesn&#39;t make sense (be it zero or negative).=C2=
=A0 So<br>
+now gcc7 will fail the build due to our sanity checking, because it<br>
+created that constant-zero case that didn&#39;t actually exist in the sour=
ce<br>
+code.<br>
+<br>
+There&#39;s a whole long discussion on the kernel mailing about how to wor=
k<br>
+around this gcc bug.=C2=A0 The gcc people themselevs have discussed their<=
br>
+&quot;feature&quot; in<br>
+<br>
+=C2=A0 =C2=A0<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D727=
85" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/<wbr>=
show_bug.cgi?id=3D72785</a><br>
+<br>
+but it&#39;s all water under the bridge, because while it looked at one<br=
>
+point like it would be solved by the time gcc7 was released, that was<br>
+not to be.<br>
+<br>
+So now we have to deal with this compiler braindamage.<br>
+<br>
+And the only simple approach seems to be to just delete the code that<br>
+tries to warn about bad uses of ilog2().<br>
+<br>
+So now &quot;ilog2()&quot; will just return 0 not just for the value 1, bu=
t for<br>
+any non-positive value too.<br>
+<br>
+It&#39;s not like I can recall anybody having ever actually tried to use<b=
r>
+this function on any invalid value, but maybe the sanity check just<br>
+meant that such code never made it out in public.<br>
+<br>
+Reported-by: Laura Abbott &lt;<a href=3D"mailto:labbott@redhat.com">labbot=
t@redhat.com</a>&gt;<br>
+Cc: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org">john.stultz@=
linaro.org</a>&gt;,<br>
+Cc: Thomas Gleixner &lt;<a href=3D"mailto:tglx@linutronix.de">tglx@linutro=
nix.de</a>&gt;<br>
+Cc: Ard Biesheuvel &lt;<a href=3D"mailto:ard.biesheuvel@linaro.org">ard.bi=
esheuvel@linaro.org</a>&gt;<br>
+Signed-off-by: Linus Torvalds &lt;<a href=3D"mailto:torvalds@linux-foundat=
ion.org">torvalds@linux-foundation.org</a><wbr>&gt;<br>
+Cc: Jiri Slaby &lt;<a href=3D"mailto:jslaby@suse.cz">jslaby@suse.cz</a>&gt=
;<br>
+Signed-off-by: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfounda=
tion.org">gregkh@linuxfoundation.org</a>&gt;<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+---<br>
+Upstream-Status: Backport<br>
+<br>
+ include/linux/log2.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++-----------<br>
+ tools/include/linux/log2.h | 13 ++-----------<br>
+ 2 files changed, 4 insertions(+), 22 deletions(-)<br>
+<br>
+diff --git a/include/linux/log2.h b/include/linux/log2.h<br>
+index fd7ff3d91e6a..f38fae23bdac 100644<br>
+--- a/include/linux/log2.h<br>
++++ b/include/linux/log2.h<br>
+@@ -16,12 +16,6 @@<br>
+ #include &lt;linux/bitops.h&gt;<br>
+<br>
+ /*<br>
+- * deal with unrepresentable constant logarithms<br>
+- */<br>
+-extern __attribute__((const, noreturn))<br>
+-int ____ilog2_NaN(void);<br>
+-<br>
+-/*<br>
+=C2=A0 * non-constant log of base 2 calculators<br>
+=C2=A0 * - the arch may override these in asm/bitops.h if they can be impl=
emented<br>
+=C2=A0 *=C2=A0 =C2=A0more efficiently than using fls() and fls64()<br>
+@@ -85,7 +79,7 @@ unsigned long __rounddown_pow_of_two(<wbr>unsigned long =
n)<br>
+ #define ilog2(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+ (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__builtin_constant_p(n) ? (=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &lt; 1 ? ____ilog2_N=
aN() :=C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &lt; 2 ? 0 :=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt; 63) ? 63 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt; 62) ? 62 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt; 61) ? 61 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+@@ -148,10 +142,7 @@ unsigned long __rounddown_pow_of_two(<wbr>unsigned lo=
ng n)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt;=C2=A0 4) ?=C2=A0 4 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt;=C2=A0 3) ?=C2=A0 3 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt;=C2=A0 2) ?=C2=A0 2 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &amp; (1ULL &lt;&lt;=
=C2=A0 1) ?=C2=A0 1 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &amp; (1ULL &lt;&lt;=
=C2=A0 0) ?=C2=A0 0 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ____ilog2_NaN()=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0) :=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ) :=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(sizeof(n) &lt;=3D 4) ?=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__ilog2_u32(n) :=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__ilog2_u64(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+diff --git a/tools/include/linux/log2.h b/tools/include/linux/log2.h<br>
+index 41446668ccce..d5677d39c1e4 100644<br>
+--- a/tools/include/linux/log2.h<br>
++++ b/tools/include/linux/log2.h<br>
+@@ -13,12 +13,6 @@<br>
+ #define _TOOLS_LINUX_LOG2_H<br>
+<br>
+ /*<br>
+- * deal with unrepresentable constant logarithms<br>
+- */<br>
+-extern __attribute__((const, noreturn))<br>
+-int ____ilog2_NaN(void);<br>
+-<br>
+-/*<br>
+=C2=A0 * non-constant log of base 2 calculators<br>
+=C2=A0 * - the arch may override these in asm/bitops.h if they can be impl=
emented<br>
+=C2=A0 *=C2=A0 =C2=A0more efficiently than using fls() and fls64()<br>
+@@ -78,7 +72,7 @@ unsigned long __rounddown_pow_of_two(<wbr>unsigned long =
n)<br>
+ #define ilog2(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+ (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__builtin_constant_p(n) ? (=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &lt; 1 ? ____ilog2_N=
aN() :=C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &lt; 2 ? 0 :=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt; 63) ? 63 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt; 62) ? 62 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt; 61) ? 61 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+@@ -141,10 +135,7 @@ unsigned long __rounddown_pow_of_two(<wbr>unsigned lo=
ng n)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt;=C2=A0 4) ?=C2=A0 4 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt;=C2=A0 3) ?=C2=A0 3 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(n) &amp; (1ULL &lt=
;&lt;=C2=A0 2) ?=C2=A0 2 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &amp; (1ULL &lt;&lt;=
=C2=A0 1) ?=C2=A0 1 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (n) &amp; (1ULL &lt;&lt;=
=C2=A0 0) ?=C2=A0 0 :=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ____ilog2_NaN()=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0) :=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ) :=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(sizeof(n) &lt;=3D 4) ?=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__ilog2_u32(n) :=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__ilog2_u64(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+--<br>
+2.12.2<br>
+<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.1.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.1.bb</a><br>
index bf7f266ee6..f90d5159d5 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.1.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.1.bb</a><br>
@@ -24,6 +24,8 @@ SRCREV_meta ?=3D &quot;<wbr>7140ddb86e4b01529185e6d4a6060=
0<wbr>1ad152b8f3&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.1.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/<wbr>linux-yocto-4.1.git;name=3D<wbr>machi=
ne;branch=3D${KBRANCH}</a>; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.1;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto-=
4.1;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
<br>
+SRC_URI +=3D &quot;file://0001-give-up-on-gcc-<wbr>ilog2-constant-optimiza=
tions.<wbr>patch&quot;<br>
+<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.1.38&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c06f3368f70c6054f69b77f--
