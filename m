Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id A05F16AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:49:38 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id e22so13035846oib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=bQ4DoPB4vhf4nPMPegCWe0iFgdaSYK13RNaF8OrGOFc=;
	b=wjGjvCoC2QqR7TM2/UiliodZDWYCfWZAi4Kveh4OT20Lsnsv0n3SK8hFyKU1OMWeAx
	x3lnQUZHA6v+cF0unNfTh3iHbGL4cH0RM73ACpSRwTuPx3SXbHglJPp4y+P3RC/5zWnd
	Grm86+5A2o6P1zuQH+ACU7a/zLMJ+JxWtn8/OmgN3+i97yumenPPzfXueTr1u3+ion2O
	gaGLjAiTxhwMbI1ubOtAGIftf3PS9mm/ZQQuGR9BuVlHg4r2VrcLpDz672SId6IC4s7+
	U+VkqSJUBvnnJmR61MK7Uc0i3GsePZ+QpVM41O6TlLm8M1DZ4be9zkmxaMPufb8MVksZ
	IjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=bQ4DoPB4vhf4nPMPegCWe0iFgdaSYK13RNaF8OrGOFc=;
	b=K5hKiPoqEw3Ir2wEMWAykjUtXWWEnZGcrdQ02KEFLHhLRNcJdoOHpM6eksrs9zxroq
	S+R5sIHy39R2AnlmGRLp3XKi/HPamXVCYpGGGLBHoZFCu7zHi3/3FBMfKM8DPJUviNtZ
	DMQ/R/0sZkk4AyHnwDnjQCs+3ew5kdAXiJ7WFnjNEECb+R34l1qfNwb7nLkhQTvGUU+f
	inNf/mzl9qR+ZbwLtFJjTA4lArgVAk2ZIhUcBp7witM6GHmrqbjYKIAtefZrsalCsGx8
	QlApEwJm8E5AWgEJUoQwp7laCq7IGrNwW85j0UX0yGrNBBcoZvI3YP+yy5t+CmbIUezp
	Qcdw==
X-Gm-Message-State: AD7BkJJ1w9sI1vdUyn44QQA80bQPiBkmM4FqjYZWX4dM1A02jKV38Vw2ifmvskMQViwgiCkE5BZC6kVTg9ssQg==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr20926502oib.96.1458665378919; Tue,
	22 Mar 2016 09:49:38 -0700 (PDT)
Received: by 10.157.8.248 with HTTP; Tue, 22 Mar 2016 09:49:38 -0700 (PDT)
In-Reply-To: <56F17064.6040507@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
	<fe57bd778472c15f247fbf20491221bdadad8b37.1458638728.git.hongxu.jia@windriver.com>
	<CADkTA4PbOMTOAEyA3GSPFiiiimOaQKB-Sv_TCtsGBmbiET-yCw@mail.gmail.com>
	<56F17064.6040507@windriver.com>
Date: Tue, 22 Mar 2016 12:49:38 -0400
Message-ID: <CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/16] kernel.bbclass: fix buildpath QA issue
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
X-List-Received-Date: Tue, 22 Mar 2016 16:49:39 -0000
Content-Type: multipart/alternative; boundary=001a113d5edcc1ba7f052ea5ff90

--001a113d5edcc1ba7f052ea5ff90
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 22, 2016 at 12:18 PM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 3/22/16 7:21 AM, Bruce Ashfield wrote:
> >
> >
> > On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia <hongxu.jia@windriver.com
> > <mailto:hongxu.jia@windriver.com>> wrote:
> >
> >     Since CFLAGS CPPFLAGS CXXFLAGS has been unset, variable DEBUG_FLAGS
> could
> >     not been passed to compiler, so we explicitly add DEBUG_FLAGS to CC
> to
> >     replace build path with target path.
> >
> >
> > Can you be more explicit here ? What is typically contained in
> DEBUG_FLAGS ? The
> > kernel builds its own compiler line and flags, so anything you are
> setting from this
> > environment, should not be leaking into the kernel build.
> >
> > .. which leaves me wondering, what exactly is in DEBUG_FLAGS, and how is
> it
> > actually fixing the QA issue ?
>
> The specific debug flag in question is being added to remap the on-disk
> path to
> the path we want the items to look like from a debugging point of view.
>
> The typical format of DEBUG_FLAGS is something like:
>
> DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
>
> This was recently updated to include the remapping:
>
>  DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
>                  -fdebug-prefix-map=${WORKDIR}=/usr/src/debug \
>                  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>                  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>
> The idea is the WORKDIR is replaced with '/usr/src/debug' inside of the
> binary
> and any debug symbol references.  This makes it much easier for the system
> to
> work with supplied debug sources/symbols.
>
> I'm not sure you want to use DEBUG_FLAGS since anything can be put in
> there....
>
> Application space code should always use the DEBUG_FLAGS, or I think it's
> likely
> a bug.
>
> The kernel though should probably define it's own flag(s).  Most likely
> you'll
> want something simple like:
>
> -fdebug-prefix-map=${WORKDIR}=/usr/src/debug
>


I can see that.

What outputs of the kernel build need this remapping ? The userspace parts ?
Something else ?

The point is that we patch the kernel build, or make a specific Kconfig
option, or
something similar to that, versus leaking our build flags into the kernel
build or
"bad things can happen".

So I'm sure the solution in the build is the same, but passing flags via a
general
mechanism like I saw in the patch is generally not a good idea.

Bruce


>
> Then all of the internal references to WORKDIR will be replaced with
> '/usr/src/debug' which cross gdb can 'map' or on-target will actually look
> in
> that location.  (A corresponding '-dbg' package should be provided with the
> matching compilation sources at the local specified.)
>
> --Mark
>
> > Bruce
> >
> >
> >
> >     [YOCTO #7058]
> >
> >     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>>
> >     ---
> >      meta/classes/kernel.bbclass | 4 ++--
> >      1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >     diff --git a/meta/classes/kernel.bbclass
> b/meta/classes/kernel.bbclass
> >     index c3eab50..d357ccf 100644
> >     --- a/meta/classes/kernel.bbclass
> >     +++ b/meta/classes/kernel.bbclass
> >     @@ -207,7 +207,7 @@ kernel_do_compile() {
> >                     copy_initramfs
> >
> >
>  use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
> >             fi
> >     -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE}
> ${KERNEL_ALT_IMAGETYPE}
> >     CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> $use_alternate_initrd
> >     +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE}
> ${KERNEL_ALT_IMAGETYPE}
> >     CC="${KERNEL_CC} ${DEBUG_FLAGS}" LD="${KERNEL_LD}"
> ${KERNEL_EXTRA_ARGS}
> >     $use_alternate_initrd
> >             if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =
> "${KERNEL_IMAGETYPE}"; then
> >                     gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
> "${KERNEL_OUTPUT}"
> >             fi
> >     @@ -216,7 +216,7 @@ kernel_do_compile() {
> >      do_compile_kernelmodules() {
> >             unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >             if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
> >     -               oe_runmake -C ${B} ${PARALLEL_MAKE} modules
> >     CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> >     +               oe_runmake -C ${B} ${PARALLEL_MAKE} modules
> CC="${KERNEL_CC}
> >     ${DEBUG_FLAGS}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> >
> >                     # Module.symvers gets updated during the
> >                     # building of the kernel modules. We need to
> >     --
> >     1.9.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its
> > end"
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113d5edcc1ba7f052ea5ff90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 22, 2016 at 12:18 PM, Mark Hatle <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 3/22/16 7:21 AM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia &lt;<a href=3D"mailto:hong=
xu.jia@windriver.com">hongxu.jia@windriver.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:hongxu.jia@windri=
ver.com">hongxu.jia@windriver.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Since CFLAGS CPPFLAGS CXXFLAGS has been unset, vari=
able DEBUG_FLAGS could<br>
&gt;=C2=A0 =C2=A0 =C2=A0not been passed to compiler, so we explicitly add D=
EBUG_FLAGS to CC to<br>
&gt;=C2=A0 =C2=A0 =C2=A0replace build path with target path.<br>
&gt;<br>
&gt;<br>
&gt; Can you be more explicit here ? What is typically contained in DEBUG_F=
LAGS ? The<br>
&gt; kernel builds its own compiler line and flags, so anything you are set=
ting from this<br>
&gt; environment, should not be leaking into the kernel build.<br>
&gt;<br>
&gt; .. which leaves me wondering, what exactly is in DEBUG_FLAGS, and how =
is it<br>
&gt; actually fixing the QA issue ?<br>
<br>
</span>The specific debug flag in question is being added to remap the on-d=
isk path to<br>
the path we want the items to look like from a debugging point of view.<br>
<br>
The typical format of DEBUG_FLAGS is something like:<br>
<br>
DEBUG_FLAGS ?=3D &quot;-g -feliminate-unused-debug-types&quot;<br>
<br>
This was recently updated to include the remapping:<br>
<br>
=C2=A0DEBUG_FLAGS ?=3D &quot;-g -feliminate-unused-debug-types \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefi=
x-map=3D${WORKDIR}=3D/usr/src/debug \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefi=
x-map=3D${STAGING_DIR_NATIVE}=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefi=
x-map=3D${STAGING_DIR_HOST}=3D \<br>
<br>
The idea is the WORKDIR is replaced with &#39;/usr/src/debug&#39; inside of=
 the binary<br>
and any debug symbol references.=C2=A0 This makes it much easier for the sy=
stem to<br>
work with supplied debug sources/symbols.<br>
<br>
I&#39;m not sure you want to use DEBUG_FLAGS since anything can be put in t=
here....<br>
<br>
Application space code should always use the DEBUG_FLAGS, or I think it&#39=
;s likely<br>
a bug.<br>
<br>
The kernel though should probably define it&#39;s own flag(s).=C2=A0 Most l=
ikely you&#39;ll<br>
want something simple like:<br>
<br>
-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug<br></blockquote><div><br><=
br></div><div>I can see that.<br><br></div><div>What outputs of the kernel =
build need this remapping ? The userspace parts ?<br></div><div>Something e=
lse ?<br><br></div><div>The point is that we patch the kernel build, or mak=
e a specific Kconfig option, or<br></div><div>something similar to that, ve=
rsus leaking our build flags into the kernel build or<br></div><div>&quot;b=
ad things can happen&quot;.<br><br></div><div>So I&#39;m sure the solution =
in the build is the same, but passing flags via a general<br></div><div>mec=
hanism like I saw in the patch is generally not a good idea.<br><br></div><=
div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Then all of the internal references to WORKDIR will be replaced with<br>
&#39;/usr/src/debug&#39; which cross gdb can &#39;map&#39; or on-target wil=
l actually look in<br>
that location.=C2=A0 (A corresponding &#39;-dbg&#39; package should be prov=
ided with the<br>
matching compilation sources at the local specified.)<br>
<br>
--Mark<br>
<span class=3D""><br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[YOCTO #7058]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hon=
gxu.jia@windriver.com">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.com</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/classes/kernel.bbclass | 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/kernel.bbclass b/meta/cla=
sses/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index c3eab50..d357ccf 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -207,7 +207,7 @@ kernel_do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0copy_initramfs<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${=
B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${KERNEL_IMA=
GETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_L=
D}&quot; ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${KERNEL_IMA=
GETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC} ${DEBUG_FLAGS}&quot; LD=3D&=
quot;${KERNEL_LD}&quot; ${KERNEL_EXTRA_ARGS}<br>
&gt;=C2=A0 =C2=A0 =C2=A0$use_alternate_initrd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${KERNEL_=
IMAGETYPE_FOR_MAKE}.gz&quot; =3D &quot;${KERNEL_IMAGETYPE}&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0gzip -9c &lt; &quot;${KERNEL_IMAGETYPE_FOR_MAKE}&quot; &gt; &quot;${K=
ERNEL_OUTPUT}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -216,7 +216,7 @@ kernel_do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_compile_kernelmodules() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS C=
XXFLAGS LDFLAGS MACHINE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (grep -q -i -e &#39;=
^CONFIG_MODULES=3Dy$&#39; ${B}/.config); then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0oe_runmake -C ${B} ${PARALLEL_MAKE} modules<br>
&gt;=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_L=
D}&quot; ${KERNEL_EXTRA_ARGS}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC=3D&quot;${KERNEL_CC}<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0${DEBUG_FLAGS}&quot; LD=3D&quot;${KERNEL_LD}&quot; =
${KERNEL_EXTRA_ARGS}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# Module.symvers gets updated during the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# building of the kernel modules. We need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A01.9.1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org">Openembedded-core@lists.openembedded.org</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedd=
ed-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a=
>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"=
http://lists.openembedded.org/mailman/listinfo/openembedded-core" rel=3D"no=
referrer" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/=
openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its<br>
&gt; end&quot;<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a113d5edcc1ba7f052ea5ff90--
