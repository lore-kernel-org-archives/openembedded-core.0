Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5C996FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 12:21:46 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id e22so11897346oib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=UoP9cUmw0zpjLQLFRu0XeMplYqju+lpyosDQ2tPW78g=;
	b=WqPmUJ/EgnRClh6GF0BYh2LrnoBNmAIoFJplBcDKIjgSOzonFOKiJriiZ+6t5wA95R
	mny5aFa26T3OeSlDhCnh4nyJrHHMX5wdYJoRTl9Wcwxh0LzPJZA7WhGcYb1U/zDCfZl9
	xTLg13lyTjHT2ecyODOxN1Uh8s5mSwQaQZdL1XQRws5Y5fJyHfW9R3Pw+YBCUNaWp1K/
	g9zqD+I+2fzIk7rdWLFiByVIV0zmUGRQo9Ep7mrDRWiPCKOqdVTZKA0MpnbcQSbrhvxR
	I13goxCJ9Zsb4AdfPFrB+ndR0gApMtYgxMP/9iu83MrvVrjmi4t8/zsToXelpAertHlO
	leBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=UoP9cUmw0zpjLQLFRu0XeMplYqju+lpyosDQ2tPW78g=;
	b=R1jroxVQN1dzBlpjEjNui7QGcvzMj8+0j6q2M/HC1ExT3GTPd0UPzq9qVReaf3Orfj
	6aijbEhQf7k1DM0ACVSY+yGkrm8ATH7lTG8heeopS56wnPQECqXsGxqNJf2zb0CKUuiA
	aTcrmCiXBnLppZwV/YBQZ8drEZoqQpTijY8xm+jB64AsZXmMPuRbt823clYuqO284cfU
	e20yNK+cv1fqS/thxl3TEi1w4k8Bw9YD7wEdufMdd29LAc1xbJmdoMXfiTBjbSTKHWGB
	JoHCDRhNhp6f5Pim3CRSTXkBWvCOP+yg9UlfZv5r5lzIZ97j5wZ1cx6hP0Mns6ah0iQ1
	01lA==
X-Gm-Message-State: AD7BkJJhMREnH0TZYLBpZ2T29mZQNJ1jexiEVu7ZTvs1H2VC/n98qke/mwn9wyjYMx6VBzNSEDSMJZcc/AtgOg==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr20053347oib.96.1458649306854; Tue,
	22 Mar 2016 05:21:46 -0700 (PDT)
Received: by 10.157.8.248 with HTTP; Tue, 22 Mar 2016 05:21:46 -0700 (PDT)
In-Reply-To: <fe57bd778472c15f247fbf20491221bdadad8b37.1458638728.git.hongxu.jia@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
	<fe57bd778472c15f247fbf20491221bdadad8b37.1458638728.git.hongxu.jia@windriver.com>
Date: Tue, 22 Mar 2016 08:21:46 -0400
Message-ID: <CADkTA4PbOMTOAEyA3GSPFiiiimOaQKB-Sv_TCtsGBmbiET-yCw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
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
X-List-Received-Date: Tue, 22 Mar 2016 12:21:47 -0000
Content-Type: multipart/alternative; boundary=001a113d5edcc99dc3052ea241e6

--001a113d5edcc99dc3052ea241e6
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> Since CFLAGS CPPFLAGS CXXFLAGS has been unset, variable DEBUG_FLAGS could
> not been passed to compiler, so we explicitly add DEBUG_FLAGS to CC to
> replace build path with target path.
>

Can you be more explicit here ? What is typically contained in DEBUG_FLAGS
? The
kernel builds its own compiler line and flags, so anything you are setting
from this
environment, should not be leaking into the kernel build.

.. which leaves me wondering, what exactly is in DEBUG_FLAGS, and how is it
actually fixing the QA issue ?

Bruce


>
> [YOCTO #7058]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index c3eab50..d357ccf 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -207,7 +207,7 @@ kernel_do_compile() {
>                 copy_initramfs
>
> use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>         fi
> -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}
> CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> $use_alternate_initrd
> +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}
> CC="${KERNEL_CC} ${DEBUG_FLAGS}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> $use_alternate_initrd
>         if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}";
> then
>                 gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
> "${KERNEL_OUTPUT}"
>         fi
> @@ -216,7 +216,7 @@ kernel_do_compile() {
>  do_compile_kernelmodules() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>         if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
> -               oe_runmake -C ${B} ${PARALLEL_MAKE} modules
> CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> +               oe_runmake -C ${B} ${PARALLEL_MAKE} modules
> CC="${KERNEL_CC} ${DEBUG_FLAGS}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>
>                 # Module.symvers gets updated during the
>                 # building of the kernel modules. We need to
> --
> 1.9.1
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

--001a113d5edcc99dc3052ea241e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Since CFLAGS=
 CPPFLAGS CXXFLAGS has been unset, variable DEBUG_FLAGS could<br>
not been passed to compiler, so we explicitly add DEBUG_FLAGS to CC to<br>
replace build path with target path.<br></blockquote><div><br></div><div>Ca=
n you be more explicit here ? What is typically contained in DEBUG_FLAGS ? =
The</div><div>kernel builds its own compiler line and flags, so anything yo=
u are setting from this</div><div>environment, should not be leaking into t=
he kernel build.</div><div><br></div><div>.. which leaves me wondering, wha=
t exactly is in DEBUG_FLAGS, and how is it</div><div>actually fixing the QA=
 issue ?</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
[YOCTO #7058]<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index c3eab50..d357ccf 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -207,7 +207,7 @@ kernel_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_initramfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_alternate_initr=
d=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNE=
L_ALT_IMAGETYPE} CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot=
; ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNE=
L_ALT_IMAGETYPE} CC=3D&quot;${KERNEL_CC} ${DEBUG_FLAGS}&quot; LD=3D&quot;${=
KERNEL_LD}&quot; ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;${KERNEL_IMAGETYPE_FOR_MAKE}.gz&q=
uot; =3D &quot;${KERNEL_IMAGETYPE}&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gzip -9c &lt; &quot=
;${KERNEL_IMAGETYPE_FOR_MAKE}&quot; &gt; &quot;${KERNEL_OUTPUT}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
@@ -216,7 +216,7 @@ kernel_do_compile() {<br>
=C2=A0do_compile_kernelmodules() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39=
; ${B}/.config); then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${B} =
${PARALLEL_MAKE} modules CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_=
LD}&quot; ${KERNEL_EXTRA_ARGS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${B} =
${PARALLEL_MAKE} modules CC=3D&quot;${KERNEL_CC} ${DEBUG_FLAGS}&quot; LD=3D=
&quot;${KERNEL_LD}&quot; ${KERNEL_EXTRA_ARGS}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Module.symvers ge=
ts updated during the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # building of the k=
ernel modules. We need to<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--001a113d5edcc99dc3052ea241e6--
