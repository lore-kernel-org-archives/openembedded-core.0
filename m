Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 49D9078CCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:33:09 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v17-v6so8473621qkb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=022mpEA49Z9108FdGH5UP/4hoqMT+nWRBnmCwPCZbyc=;
	b=Cuei1ysTcMsXq3liKC9PQSi6JLW5eH9Hq8YEXVGl5iQ7hIikmCWEJA4XNvNyQakkAA
	zY0J1y8123ZvNbjdX2PoSptleYP5CXIEJMcepo+NOjr+2g6MRUx0ns7hVsSTw1cLRjNZ
	+IMAP9fdRwL3V/g7P+tLmDY1xEOIHNhc7W+/V0OX34t910KOLJQNrG94UfkQys6mMzVp
	umA5ec5PEbVqzpr+2KNFCNzNDAjQIuXCubqpSwbIxl72+VJiby1n5XLQjwCH/+w49/nR
	X62HPcGGJK4JWlk/lQy6p4qMoLE9Ka+hakPDxoAys/vmXTBa4qe8/hxzNou2ZtNhCydT
	oolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=022mpEA49Z9108FdGH5UP/4hoqMT+nWRBnmCwPCZbyc=;
	b=JKzZcbHhT4lr8yAIYKVwjFXh30XMx1sbrWmUTHjSrMVQZI8arHK4w148rAJTWsueu+
	w8d9NybMt4Ai9K6jW8YinrV+nlEu5GShtrfxpLL7mE2dDEbssdr9DbKuuieBqMs97XQx
	1/58fCh4zFXlxr+SNZw7OC+XBvolXLpT3Ofs1XKkPfWFtq1SjrDezsEScw4oT134BOFv
	8ZgBDMvS6osrI1bkqiQ/XivIeW+SRdfoMWlAkYkF9DL0ExEXPSEpwGVL0FXcMJy50jYj
	IGRyA9uq3zSfdzAj+Kd23riX9jMMIV9asUk4z6Okefipz/u/NsLC3myMbw7/rAhMG/S5
	wdFQ==
X-Gm-Message-State: AOUpUlF0ccvaC6X+Ucjit371RjcK5tGSGUDOhXC/4xOhPETaM+iyYg4m
	U1qM9IxtikWZGdWjPJG4CRERESmDwHKqGK0quyM=
X-Google-Smtp-Source: AAOMgpejTaSIilVBBr+nvRPx9T+QJmTi2PavV6LbGJ6UZTAuQY640svkUi57yGW8XMFCZH1oPubT3srDMFDmnP92ueE=
X-Received: by 2002:a37:4a94:: with SMTP id
	x142-v6mr16660295qka.110.1532975589761; 
	Mon, 30 Jul 2018 11:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <1532937321-4077-1-git-send-email-christopher.w.clark@gmail.com>
	<CAJTo0LbCA4OfxodE0ac60VHYwHm8fCRgQqWjJmQ_svVjeHc-dA@mail.gmail.com>
In-Reply-To: <CAJTo0LbCA4OfxodE0ac60VHYwHm8fCRgQqWjJmQ_svVjeHc-dA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jul 2018 11:32:59 -0700
Message-ID: <CAMKF1sqGb4x0u7OCqyHQKx0WPCypoWX+ZqzuyTCWhAZKsrACFA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] binutils : enable x86_64-pep for producing EFI binaries on x86-64
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
X-List-Received-Date: Mon, 30 Jul 2018 18:33:09 -0000
Content-Type: multipart/alternative; boundary="0000000000007a28f605723bb1c3"

--0000000000007a28f605723bb1c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We can and many toolchains do that especially in embedded targets but it
will cause more compile time to build binutils and size will grow a lot and
since we do not use universal binutils which can be shared across
architectures we will not benefit from this although it does mean our
binutils will be able to inspect objects of many different kinds weather
that=E2=80=99s valuable or not I can=E2=80=99t say much it=E2=80=99s not my=
 usecase at least

On Mon, Jul 30, 2018 at 4:29 AM Burton, Ross <ross.burton@intel.com> wrote:

> Is just passing --enable-targets=3Dall not an option?
>
> Ross
>
> On 30 July 2018 at 08:55, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> > Add x86_64-pep emulation support to the set enabled for x86_64 targets
> > to enable the linker to produce Portable Executables for EFI binaries.
> >
> > Enables building the x86-64 EFI variant of the Xen hypervisor for
> > the OpenXT Project.
> >
> > Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > ---
> > Changes in v6: added required "Upstream-Status" field to patch header.
> >
> > Changes in v5: Apply a patch to extend the set of emulations for x86-64=
,
> > instead of supplying the "enable-targets" flag via the recipe.
> >
> > Reasoning: this looks like the least invasive way to add the needed
> emulation
> > only when required. It will add the extra support to any builds that ha=
ve
> > x86-64 target enabled and not modify others.
> >
> > binutils uses autoconf and the AC_ARG_ENABLE macro for handling the
> > "--enable-targets" option to the generated configure script. It doesn't
> allow
> > for repeating the parameter with additional arguments to extend the lis=
t:
> > it's a one-shot flag. That seems to be standard practice for autoconf.
> >
> > binutils source contains config files that map from the target
> identifiers
> > to lists of emulations to enable. This patch extends some of those list=
s.
> >
> > Tested with x86-64 build to produce Xen EFI.
> >
> >  meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
> >  .../0016-add-i386pep-emulation-for-x86_64.patch    | 41
> ++++++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x8=
6_64.patch
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc
> b/meta/recipes-devtools/binutils/binutils-2.31.inc
> > index ec9e9c3..02d5bca 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.31.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
> > @@ -35,6 +35,7 @@ SRC_URI =3D "\
> >
>  file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
> >       file://0014-Detect-64-bit-MIPS-targets.patch \
> >       file://0015-sync-with-OE-libtool-changes.patch \
> > +     file://0016-add-i386pep-emulation-for-x86_64.patch \
> >  "
> >  S  =3D "${WORKDIR}/git"
> >
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-=
x86_64.patch
> b/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-=
x86_64.patch
> > new file mode 100644
> > index 0000000..9f20784
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-=
x86_64.patch
> > @@ -0,0 +1,41 @@
> > +binutils : enable x86_64-pep for producing EFI binaries on x86-64
> > +
> > +Add x86_64-pep emulation support to the set enabled for x86_64 targets
> > +to enable the linker to produce Portable Executables for EFI binaries.
> > +
> > +Enables building the x86-64 EFI variant of the Xen hypervisor for
> > +the OpenXT Project.
> > +
> > +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > +
> > +Upstream-Status: Inappropriate [OE configuration specific]
> > +---
> > +diff --git a/bfd/config.bfd b/bfd/config.bfd
> > +index c882421..dc705b6 100644
> > +--- a/bfd/config.bfd
> > ++++ b/bfd/config.bfd
> > +@@ -688,7 +688,7 @@ case "${targ}" in
> > +     ;;
> > +   x86_64-*-linux-*)
> > +     targ_defvec=3Dx86_64_elf64_vec
> > +-    targ_selvecs=3D"i386_elf32_vec iamcu_elf32_vec x86_64_elf32_vec
> i386_pei_vec x86_64_pei_vec l1om_elf64_vec k1om_elf64_vec"
> > ++    targ_selvecs=3D"i386_elf32_vec iamcu_elf32_vec x86_64_elf32_vec
> i386_pei_vec x86_64_pei_vec l1om_elf64_vec k1om_elf64_vec x86_64_pe_vec
> x86_64_pe_be_vec i386_pe_vec"
> > +     want64=3Dtrue
> > +     ;;
> > +   x86_64-*-nacl*)
> > +diff --git a/ld/configure.tgt b/ld/configure.tgt
> > +index a1db7ad..65a984a 100644
> > +--- a/ld/configure.tgt
> > ++++ b/ld/configure.tgt
> > +@@ -253,8 +253,9 @@ x86_64-*-linux-gnux32)     targ_emul=3Delf32_x86_6=
4
> > +                       tdir_elf_iamcu=3D`echo ${targ_alias} | sed -e
> 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'`
> > +                       tdir_elf_i386=3D`echo ${targ_alias} | sed -e
> 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'` ;;
> > + x86_64-*-linux-*)     targ_emul=3Delf_x86_64
> > +-                      targ_extra_emuls=3D"elf32_x86_64 elf_i386
> elf_iamcu elf_l1om elf_k1om"
> > +-                      targ_extra_libpath=3D"elf_i386 elf32_x86_64
> elf_l1om elf_k1om"
> > ++                      targ_extra_emuls=3D"elf32_x86_64 elf_i386
> elf_iamcu elf_l1om elf_k1om i386pe i386pep"
> > ++                      targ_extra_libpath=3D"elf_i386 elf32_x86_64
> elf_l1om elf_k1om i386pep"
> > ++                      targ_extra_ofiles=3D"deffilep.o pep-dll.o pe-dl=
l.o"
> > +                       tdir_elf_i386=3D`echo ${targ_alias} | sed -e
> 's/x86_64/i386/'` ;;
> > + i[3-7]86-*-redox*)    targ_emul=3Delf_i386
> > +                       targ_extra_emuls=3Delf_x86_64 ;;
> > --
> > 2.7.4
> >
>

--0000000000007a28f605723bb1c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">We can and many toolchains do that especially in emb=
edded targets but it will cause more compile time to build binutils and siz=
e will grow a lot and since we do not use universal binutils which can be s=
hared across architectures we will not benefit from this although it does m=
ean our binutils will be able to inspect objects of many different kinds we=
ather that=E2=80=99s valuable or not I can=E2=80=99t say much it=E2=80=99s =
not my usecase at least=C2=A0</div></div><div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Mon, Jul 30, 2018 at 4:29 AM Burton, Ross &lt;<a href=
=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Is just passing --enable-targets=3Dall =
not an option?<br>
<br>
Ross<br>
<br>
On 30 July 2018 at 08:55, Christopher Clark<br>
&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">chri=
stopher.w.clark@gmail.com</a>&gt; wrote:<br>
&gt; Add x86_64-pep emulation support to the set enabled for x86_64 targets=
<br>
&gt; to enable the linker to produce Portable Executables for EFI binaries.=
<br>
&gt;<br>
&gt; Enables building the x86-64 EFI variant of the Xen hypervisor for<br>
&gt; the OpenXT Project.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.cla=
rk6@baesystems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>=
&gt;<br>
&gt; ---<br>
&gt; Changes in v6: added required &quot;Upstream-Status&quot; field to pat=
ch header.<br>
&gt;<br>
&gt; Changes in v5: Apply a patch to extend the set of emulations for x86-6=
4,<br>
&gt; instead of supplying the &quot;enable-targets&quot; flag via the recip=
e.<br>
&gt;<br>
&gt; Reasoning: this looks like the least invasive way to add the needed em=
ulation<br>
&gt; only when required. It will add the extra support to any builds that h=
ave<br>
&gt; x86-64 target enabled and not modify others.<br>
&gt;<br>
&gt; binutils uses autoconf and the AC_ARG_ENABLE macro for handling the<br=
>
&gt; &quot;--enable-targets&quot; option to the generated configure script.=
 It doesn&#39;t allow<br>
&gt; for repeating the parameter with additional arguments to extend the li=
st:<br>
&gt; it&#39;s a one-shot flag. That seems to be standard practice for autoc=
onf.<br>
&gt;<br>
&gt; binutils source contains config files that map from the target identif=
iers<br>
&gt; to lists of emulations to enable. This patch extends some of those lis=
ts.<br>
&gt;<br>
&gt; Tested with x86-64 build to produce Xen EFI.<br>
&gt;<br>
&gt;=C2=A0 meta/recipes-devtools/binutils/binutils-2.31.inc=C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt;=C2=A0 .../0016-add-i386pep-emulation-for-x86_64.patch=C2=A0 =C2=A0 | 4=
1 ++++++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 42 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-=
add-i386pep-emulation-for-x86_64.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.31.inc<br>
&gt; index ec9e9c3..02d5bca 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils-2.31.inc<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils-2.31.inc<br>
&gt; @@ -35,6 +35,7 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-fix-the-incorrect-assembling-for=
-ppc-wait-mnemonic.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0014-Detect-64-bit-MIPS-targets.patch=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-sync-with-OE-libtool-changes.pat=
ch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0file://0016-add-i386pep-emulation-for-x86_64.patc=
h \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-=
emulation-for-x86_64.patch b/meta/recipes-devtools/binutils/binutils/0016-a=
dd-i386pep-emulation-for-x86_64.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..9f20784<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulati=
on-for-x86_64.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +binutils : enable x86_64-pep for producing EFI binaries on x86-64<br>
&gt; +<br>
&gt; +Add x86_64-pep emulation support to the set enabled for x86_64 target=
s<br>
&gt; +to enable the linker to produce Portable Executables for EFI binaries=
.<br>
&gt; +<br>
&gt; +Enables building the x86-64 EFI variant of the Xen hypervisor for<br>
&gt; +the OpenXT Project.<br>
&gt; +<br>
&gt; +Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.cl=
ark6@baesystems.com" target=3D"_blank">christopher.clark6@baesystems.com</a=
>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE configuration specific]<br>
&gt; +---<br>
&gt; +diff --git a/bfd/config.bfd b/bfd/config.bfd<br>
&gt; +index c882421..dc705b6 100644<br>
&gt; +--- a/bfd/config.bfd<br>
&gt; ++++ b/bfd/config.bfd<br>
&gt; +@@ -688,7 +688,7 @@ case &quot;${targ}&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0x86_64-*-linux-*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0targ_defvec=3Dx86_64_elf64_vec<br>
&gt; +-=C2=A0 =C2=A0 targ_selvecs=3D&quot;i386_elf32_vec iamcu_elf32_vec x8=
6_64_elf32_vec i386_pei_vec x86_64_pei_vec l1om_elf64_vec k1om_elf64_vec&qu=
ot;<br>
&gt; ++=C2=A0 =C2=A0 targ_selvecs=3D&quot;i386_elf32_vec iamcu_elf32_vec x8=
6_64_elf32_vec i386_pei_vec x86_64_pei_vec l1om_elf64_vec k1om_elf64_vec x8=
6_64_pe_vec x86_64_pe_be_vec i386_pe_vec&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0want64=3Dtrue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0x86_64-*-nacl*)<br>
&gt; +diff --git a/ld/configure.tgt b/ld/configure.tgt<br>
&gt; +index a1db7ad..65a984a 100644<br>
&gt; +--- a/ld/configure.tgt<br>
&gt; ++++ b/ld/configure.tgt<br>
&gt; +@@ -253,8 +253,9 @@ x86_64-*-linux-gnux32)=C2=A0 =C2=A0 =C2=A0targ_em=
ul=3Delf32_x86_64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tdir_elf_iamcu=3D`echo ${targ_alias} | sed -e &#39;s/x86_64/i=
386/&#39; -e &#39;s/-linux-gnux32/-linux-gnu/&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tdir_elf_i386=3D`echo ${targ_alias} | sed -e &#39;s/x86_64/i3=
86/&#39; -e &#39;s/-linux-gnux32/-linux-gnu/&#39;` ;;<br>
&gt; + x86_64-*-linux-*)=C2=A0 =C2=A0 =C2=A0targ_emul=3Delf_x86_64<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_emuls=3D&quot;elf32_x86_64 elf_i386 elf_iamcu elf_l1o=
m elf_k1om&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_libpath=3D&quot;elf_i386 elf32_x86_64 elf_l1om elf_k1=
om&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_emuls=3D&quot;elf32_x86_64 elf_i386 elf_iamcu elf_l1o=
m elf_k1om i386pe i386pep&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_libpath=3D&quot;elf_i386 elf32_x86_64 elf_l1om elf_k1=
om i386pep&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_ofiles=3D&quot;deffilep.o pep-dll.o pe-dll.o&quot;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tdir_elf_i386=3D`echo ${targ_alias} | sed -e &#39;s/x86_64/i3=
86/&#39;` ;;<br>
&gt; + i[3-7]86-*-redox*)=C2=A0 =C2=A0 targ_emul=3Delf_i386<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0targ_extra_emuls=3Delf_x86_64 ;;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</blockquote></div></div>

--0000000000007a28f605723bb1c3--
