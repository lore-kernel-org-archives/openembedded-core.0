Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.10252.1602157993557768469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 04:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T5YBy/+A;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id r1so1853356vsi.12
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 04:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jbii+A+zDEmY0DzIe3tklDFcexmNzbvW2Aztp9GMS7k=;
        b=T5YBy/+Aw81DENcBJhYFi6TdTu7P1Cp0FX9QzRPn17UrYwDvTzkQyQpnyKRPC5OUXv
         JfxOaRfrWzffOw7MJtREtj++InUA5M3PV7jCKvRtyBADvfM3fauuc4el9KqOZ8trv2fr
         lwd1moLNEwBkN40u60F3RAVXPITd6NBYWkEsK5Y1hIQSdCVM+K9HSfb901hbiJirNTim
         5/3PAzgCf6z0ypZlGI9Dp7Vyq7rYwSXFITVbWHJTUsDDQZ3PWgOV60RWbHl7MClOTpZX
         gT7nqUjKyEbp3UHeeLcOVowbdJ/kFOdy/G6N1rRR/I3N2aBvFO4V4X6UOCoUHtby97y+
         Hhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jbii+A+zDEmY0DzIe3tklDFcexmNzbvW2Aztp9GMS7k=;
        b=BZgbfP02h1vxUNNWjw32YjTWB+FRzaMsFoWpwqGlznAo3fQpx26qCI5gYcT2LxvZ+6
         FxSS5waWgzlJe+UupuD2UIEJqDJoDQfjDsZWCfrnszqQK6lJherTDG4WIJqZ8lYZfHWN
         FgBcqC+0g5Urr/hapXSClvubLLeMJKAGZxRnHIeHvvWY2p0Of3s0cXtc1S+pydg/f7kV
         RlZbnsxx9cebMWrjv/9IFIzdbvF899gWsLikNiwhqTKw06X2FTKAi9XTt4NY3HP9686g
         sdp/V0RV6tzUQW8s5RxJB6dPq1wc6Gpo5EmbzVDzaOn3cpWiw0S9Mv0JmLCK19HZJ5KU
         lDlg==
X-Gm-Message-State: AOAM533W0vQEnrITWx6t0xtRzHbmAVmeVx2BrqC+W5uouFsSeAbIjRGD
	a6AibZUKFWjuJQAqDxIqpvUXzh7esnGvYj/Q1gg=
X-Google-Smtp-Source: ABdhPJy/Q46EfJZP/pULhcHDurdpkwdy3WmV7hEaZCRwHN7g6fbiXXvQIKx5mogmaBeT0SM1B0zgkverWF9SuSrAk/c=
X-Received: by 2002:a67:dd91:: with SMTP id i17mr4354264vsk.41.1602157992598;
 Thu, 08 Oct 2020 04:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201007203838.19096-1-kamensky@cisco.com> <20201007203838.19096-2-kamensky@cisco.com>
 <CAAnfSTs-Dk42iUJU=akr7wpEYZwc9xxCB-hAJMcZpeV6FuvyuA@mail.gmail.com>
In-Reply-To: <CAAnfSTs-Dk42iUJU=akr7wpEYZwc9xxCB-hAJMcZpeV6FuvyuA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 8 Oct 2020 13:53:01 +0200
Message-ID: <CANNYZj9Ggm94_2wOsP3Q=AT2iZVyyiE-Keh3AOHjo5EX1EFEtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
To: "Victor Kamensky (kamensky)" <kamensky@cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="00000000000005e0c805b1277a7d"

--00000000000005e0c805b1277a7d
Content-Type: text/plain; charset="UTF-8"

Thanks - I note that Upstream-Status is missing, are you planning to
approach qemu upstream with this?

Alex

On Thu, 8 Oct 2020 at 09:30, Ross Burton <ross@burtonini.com> wrote:

> Excellent work to identify a relatively simple way to dramatically
> improve performance. Nice one!
>
> Ross
>
> On Wed, 7 Oct 2020 at 21:39, Victor Kamensky via
> lists.openembedded.org <kamensky=cisco.com@lists.openembedded.org>
> wrote:
> >
> > In Yocto Project PR 13992 it was reported that qemumips
> > in autobuilder runs almost twice slower then qemumips64 and
> > some times hit time out.
> >
> > Upon investigations of qemu-system with perf, gdb, and
> > SystemTap and comparing qemumips and qemumips64 machines
> > behavior it was noticed that qemu soft mmu code behaves
> > quite different and in case if qemumips tlbwr instruction
> > called 16 times more oftern. It happens that in qemumips64
> > case qemu runs with cpu type that contains 64 TLB, but in case
> > of qemumips qemu runs with cpu type that contains only
> > 16 TLBs.
> >
> > The idea of proposed qemu patch is to introduce fictitious
> > 34Kf-64tlb cpu type that defined exactly as 34Kf but has
> > 64 TLBs, instead of original 16 TLBs.
> >
> > Testing of core-image-full-cmdline:do_testimage with
> > 34Kf-64tlb shows 40% or so test execution real time
> > improvement.
> >
> > Note for future porters of the patch: easiest way to update
> > the patch and be in sync with 34Kf definition is to copy
> > 34Kf machine definition and apply the following changes to
> > it (just change 15 to 63 of CP0C1_MMU bits value)
> >
> > [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c
> > 2c2
> > <         .name = "34Kf",
> > >         .name = "34Kf-64tlb",
> > 6c6
> > <         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 <<
> CP0C1_MMU) |
> > >         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 <<
> CP0C1_MMU) |
> >
> > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
> >
> > Upstream Status: Inappropriate
> >
> > Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc                |   1 +
> >  ...Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118
> +++++++++++++++++++++
> >  2 files changed, 119 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> > index bbb9038961..6c0edcb706 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -31,6 +31,7 @@ SRC_URI = "
> https://download.qemu.org/${BPN}-${PV}.tar.xz \
> >             file://0001-qemu-Do-not-include-file-if-not-exists.patch \
> >             file://find_datadir.patch \
> >             file://usb-fix-setup_len-init.patch \
> > +
>  file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch \
> >             "
> >  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > diff --git
> a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> > new file mode 100644
> > index 0000000000..b6312e1543
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> > @@ -0,0 +1,118 @@
> > +From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 2001
> > +From: Victor Kamensky <kamensky@cisco.com>
> > +Date: Wed, 7 Oct 2020 10:19:42 -0700
> > +Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf but
> with
> > + 64 TLBs
> > +
> > +In Yocto Project CI runs it was observed that test run
> > +of 32 bit mips image takes almost twice longer than 64 bit
> > +mips image with the same logical load and CI execution
> > +hits timeout.
> > +
> > +See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
> > +
> > +Yocto project uses 34Kf cpu type to run 32 bit mips image,
> > +and MIPS64R2-generic cpu type to run 64 bit mips64 image.
> > +
> > +Upon qemu behavior differences investigation between mips
> > +and mips64 two prominent observations came up: under
> > +logically similar load (same definition and configuration
> > +of user-land image) in case of mips get_physical_address
> > +function is called almost twice more often, meaning
> > +twice more memory accesses involved in this case. Also
> > +number of tlbwr instruction executed (r4k_helper_tlbwr
> > +qemu function) almost 16 time bigger in mips case than in
> > +mips64.
> > +
> > +It turns out that 34Kf cpu has 16 TLBs, but in case of
> > +MIPS64R2-generic it is 64 TLBs. So that explains why
> > +some many more tlbwr had to be execute by kernel TLB refill
> > +handler in case of 32 bit misp.
> > +
> > +The idea of the fix is to come up with new 34Kf-64tlb fictitious
> > +cpu type, that would behave exactly as 34Kf but it would
> > +contain 64 TLBs to reduce TLB trashing. After all, adding
> > +more TLBs to soft mmu is easy.
> > +
> > +Experiment with some significant non-trvial load in Yocto
> > +environment by running do_testimage load shows that 34Kf-64tlb
> > +cpu performs 40% or so better than original 34Kf cpu wrt test
> > +execution real time.
> > +
> > +It is not ideal to have cpu type that does not exist in the
> > +wild but given performance gains it seems to be justified.
> > +
> > +Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> > +---
> > + target/mips/translate_init.inc.c | 55
> ++++++++++++++++++++++++++++++++++++++++
> > + 1 file changed, 55 insertions(+)
> > +
> > +diff --git a/target/mips/translate_init.inc.c
> b/target/mips/translate_init.inc.c
> > +index 637caccd89..b73ab48231 100644
> > +--- a/target/mips/translate_init.inc.c
> > ++++ b/target/mips/translate_init.inc.c
> > +@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =
> > +         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
> > +         .mmu_type = MMU_TYPE_R4000,
> > +     },
> > ++    /*
> > ++     * Verbatim copy of "34Kf" cpu, only bumped up number of TLB
> entries
> > ++     * from 16 to 64 (see CP0_Config0 value at CP0C1_MMU bits) to
> improve
> > ++     * performance by reducing number of TLB refill exceptions and
> > ++     * eliminating need to run all corresponding TLB refill handling
> > ++     * instructions.
> > ++     */
> > ++    {
> > ++        .name = "34Kf-64tlb",
> > ++        .CP0_PRid = 0x00019500,
> > ++        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> > ++                       (MMU_TYPE_R4000 << CP0C0_MT),
> > ++        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 <<
> CP0C1_MMU) |
> > ++                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 <<
> CP0C1_IA) |
> > ++                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 <<
> CP0C1_DA) |
> > ++                       (1 << CP0C1_CA),
> > ++        .CP0_Config2 = MIPS_CONFIG2,
> > ++        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 <<
> CP0C3_MT) |
> > ++                       (1 << CP0C3_DSPP),
> > ++        .CP0_LLAddr_rw_bitmask = 0,
> > ++        .CP0_LLAddr_shift = 0,
> > ++        .SYNCI_Step = 32,
> > ++        .CCRes = 2,
> > ++        .CP0_Status_rw_bitmask = 0x3778FF1F,
> > ++        .CP0_TCStatus_rw_bitmask = (0 << CP0TCSt_TCU3) | (0 <<
> CP0TCSt_TCU2) |
> > ++                    (1 << CP0TCSt_TCU1) | (1 << CP0TCSt_TCU0) |
> > ++                    (0 << CP0TCSt_TMX) | (1 << CP0TCSt_DT) |
> > ++                    (1 << CP0TCSt_DA) | (1 << CP0TCSt_A) |
> > ++                    (0x3 << CP0TCSt_TKSU) | (1 << CP0TCSt_IXMT) |
> > ++                    (0xff << CP0TCSt_TASID),
> > ++        .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
> > ++                    (1 << FCR0_D) | (1 << FCR0_S) | (0x95 <<
> FCR0_PRID),
> > ++        .CP1_fcr31 = 0,
> > ++        .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
> > ++        .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
> > ++        .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
> > ++        .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
> > ++                    (0x3fe << CP0SRSC0_SRS2) | (0x3fe <<
> CP0SRSC0_SRS1),
> > ++        .CP0_SRSConf1_rw_bitmask = 0x3fffffff,
> > ++        .CP0_SRSConf1 = (1U << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SRS6) |
> > ++                    (0x3fe << CP0SRSC1_SRS5) | (0x3fe <<
> CP0SRSC1_SRS4),
> > ++        .CP0_SRSConf2_rw_bitmask = 0x3fffffff,
> > ++        .CP0_SRSConf2 = (1U << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SRS9) |
> > ++                    (0x3fe << CP0SRSC2_SRS8) | (0x3fe <<
> CP0SRSC2_SRS7),
> > ++        .CP0_SRSConf3_rw_bitmask = 0x3fffffff,
> > ++        .CP0_SRSConf3 = (1U << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SRS12)
> |
> > ++                    (0x3fe << CP0SRSC3_SRS11) | (0x3fe <<
> CP0SRSC3_SRS10),
> > ++        .CP0_SRSConf4_rw_bitmask = 0x3fffffff,
> > ++        .CP0_SRSConf4 = (0x3fe << CP0SRSC4_SRS15) |
> > ++                    (0x3fe << CP0SRSC4_SRS14) | (0x3fe <<
> CP0SRSC4_SRS13),
> > ++        .SEGBITS = 32,
> > ++        .PABITS = 32,
> > ++        .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
> > ++        .mmu_type = MMU_TYPE_R4000,
> > ++    },
> > +     {
> > +         .name = "74Kf",
> > +         .CP0_PRid = 0x00019700,
> > +--
> > +2.14.5
> > +
> > --
> > 2.14.5
> >
> >
> >
> >
>
> 
>
>

--00000000000005e0c805b1277a7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks - I note that Upstream-Status is missing, are =
you planning to approach qemu upstream with this?</div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 8 Oct 2020 at 09:30, Ross Burton &lt;<a href=3D"ma=
ilto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Excellent work to identify a rel=
atively simple way to dramatically<br>
improve performance. Nice one!<br>
<br>
Ross<br>
<br>
On Wed, 7 Oct 2020 at 21:39, Victor Kamensky via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a> &lt;kamensky=3D<a href=3D"mailto:cisco.com@=
lists.openembedded.org" target=3D"_blank">cisco.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; In Yocto Project PR 13992 it was reported that qemumips<br>
&gt; in autobuilder runs almost twice slower then qemumips64 and<br>
&gt; some times hit time out.<br>
&gt;<br>
&gt; Upon investigations of qemu-system with perf, gdb, and<br>
&gt; SystemTap and comparing qemumips and qemumips64 machines<br>
&gt; behavior it was noticed that qemu soft mmu code behaves<br>
&gt; quite different and in case if qemumips tlbwr instruction<br>
&gt; called 16 times more oftern. It happens that in qemumips64<br>
&gt; case qemu runs with cpu type that contains 64 TLB, but in case<br>
&gt; of qemumips qemu runs with cpu type that contains only<br>
&gt; 16 TLBs.<br>
&gt;<br>
&gt; The idea of proposed qemu patch is to introduce fictitious<br>
&gt; 34Kf-64tlb cpu type that defined exactly as 34Kf but has<br>
&gt; 64 TLBs, instead of original 16 TLBs.<br>
&gt;<br>
&gt; Testing of core-image-full-cmdline:do_testimage with<br>
&gt; 34Kf-64tlb shows 40% or so test execution real time<br>
&gt; improvement.<br>
&gt;<br>
&gt; Note for future porters of the patch: easiest way to update<br>
&gt; the patch and be in sync with 34Kf definition is to copy<br>
&gt; 34Kf machine definition and apply the following changes to<br>
&gt; it (just change 15 to 63 of CP0C1_MMU bits value)<br>
&gt;<br>
&gt; [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c<br>
&gt; 2c2<br>
&gt; &lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;34Kf&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;34Kf-64tlb&quot=
;,<br>
&gt; 6c6<br>
&gt; &lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.CP0_Config1 =3D MIPS_CONFIG1 |=
 (1 &lt;&lt; CP0C1_FP) | (15 &lt;&lt; CP0C1_MMU) |<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.CP0_Config1 =3D MIPS_CONFIG1 |=
 (1 &lt;&lt; CP0C1_FP) | (63 &lt;&lt; CP0C1_MMU) |<br>
&gt;<br>
&gt; Fixes <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
13992" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D13992</a><br>
&gt;<br>
&gt; Upstream Status: Inappropriate<br>
&gt;<br>
&gt; Signed-off-by: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.c=
om" target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 ...Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++=
+++++++++++++++<br>
&gt;=C2=A0 2 files changed, 119 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-ad=
d-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devto=
ols/qemu/qemu.inc<br>
&gt; index bbb9038961..6c0edcb706 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; @@ -31,6 +31,7 @@ SRC_URI =3D &quot;<a href=3D"https://download.qemu.=
org/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://download.qemu.org/${BPN}-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-qemu-Do-no=
t-include-file-if-not-exists.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://find_datadir.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://usb-fix-setup_l=
en-init.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mips-add-34Kf-6=
4tlb-fictitious-cpu-type-like-34Kf-bu.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)=
\.tar&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb=
-fictitious-cpu-type-like-34Kf-bu.patch b/meta/recipes-devtools/qemu/qemu/0=
001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b6312e1543<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictit=
ious-cpu-type-like-34Kf-bu.patch<br>
&gt; @@ -0,0 +1,118 @@<br>
&gt; +From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.com" targ=
et=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; +Date: Wed, 7 Oct 2020 10:19:42 -0700<br>
&gt; +Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf =
but with<br>
&gt; + 64 TLBs<br>
&gt; +<br>
&gt; +In Yocto Project CI runs it was observed that test run<br>
&gt; +of 32 bit mips image takes almost twice longer than 64 bit<br>
&gt; +mips image with the same logical load and CI execution<br>
&gt; +hits timeout.<br>
&gt; +<br>
&gt; +See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1=
3992" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D13992</a><br>
&gt; +<br>
&gt; +Yocto project uses 34Kf cpu type to run 32 bit mips image,<br>
&gt; +and MIPS64R2-generic cpu type to run 64 bit mips64 image.<br>
&gt; +<br>
&gt; +Upon qemu behavior differences investigation between mips<br>
&gt; +and mips64 two prominent observations came up: under<br>
&gt; +logically similar load (same definition and configuration<br>
&gt; +of user-land image) in case of mips get_physical_address<br>
&gt; +function is called almost twice more often, meaning<br>
&gt; +twice more memory accesses involved in this case. Also<br>
&gt; +number of tlbwr instruction executed (r4k_helper_tlbwr<br>
&gt; +qemu function) almost 16 time bigger in mips case than in<br>
&gt; +mips64.<br>
&gt; +<br>
&gt; +It turns out that 34Kf cpu has 16 TLBs, but in case of<br>
&gt; +MIPS64R2-generic it is 64 TLBs. So that explains why<br>
&gt; +some many more tlbwr had to be execute by kernel TLB refill<br>
&gt; +handler in case of 32 bit misp.<br>
&gt; +<br>
&gt; +The idea of the fix is to come up with new 34Kf-64tlb fictitious<br>
&gt; +cpu type, that would behave exactly as 34Kf but it would<br>
&gt; +contain 64 TLBs to reduce TLB trashing. After all, adding<br>
&gt; +more TLBs to soft mmu is easy.<br>
&gt; +<br>
&gt; +Experiment with some significant non-trvial load in Yocto<br>
&gt; +environment by running do_testimage load shows that 34Kf-64tlb<br>
&gt; +cpu performs 40% or so better than original 34Kf cpu wrt test<br>
&gt; +execution real time.<br>
&gt; +<br>
&gt; +It is not ideal to have cpu type that does not exist in the<br>
&gt; +wild but given performance gains it seems to be justified.<br>
&gt; +<br>
&gt; +Signed-off-by: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.=
com" target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; +---<br>
&gt; + target/mips/translate_init.inc.c | 55 +++++++++++++++++++++++++++++=
+++++++++++<br>
&gt; + 1 file changed, 55 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/target/mips/translate_init.inc.c b/target/mips/translat=
e_init.inc.c<br>
&gt; +index 637caccd89..b73ab48231 100644<br>
&gt; +--- a/target/mips/translate_init.inc.c<br>
&gt; ++++ b/target/mips/translate_init.inc.c<br>
&gt; +@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.insn_flags =3D CPU_MIPS32R2 | ASE=
_MIPS16 | ASE_DSP | ASE_MT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mmu_type =3D MMU_TYPE_R4000,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* Verbatim copy of &quot;34Kf&quot; cpu, only b=
umped up number of TLB entries<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* from 16 to 64 (see CP0_Config0 value at CP0C1=
_MMU bits) to improve<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* performance by reducing number of TLB refill =
exceptions and<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* eliminating need to run all corresponding TLB=
 refill handling<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* instructions.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;34Kf-64tlb&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_PRid =3D 0x00019500,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 &l=
t;&lt; CP0C0_AR) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(MMU_TYPE_R4000 &lt;&lt; CP0C0_MT),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config1 =3D MIPS_CONFIG1 | (1 &lt;=
&lt; CP0C1_FP) | (63 &lt;&lt; CP0C1_MMU) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(0 &lt;&lt; CP0C1_IS) | (3 &lt;&lt; CP0C1_IL) | (1 &lt;&l=
t; CP0C1_IA) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(0 &lt;&lt; CP0C1_DS) | (3 &lt;&lt; CP0C1_DL) | (1 &lt;&l=
t; CP0C1_DA) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 &lt;&lt; CP0C1_CA),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config2 =3D MIPS_CONFIG2,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config3 =3D MIPS_CONFIG3 | (1 &lt;=
&lt; CP0C3_VInt) | (1 &lt;&lt; CP0C3_MT) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 &lt;&lt; CP0C3_DSPP),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_LLAddr_rw_bitmask =3D 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_LLAddr_shift =3D 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .SYNCI_Step =3D 32,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CCRes =3D 2,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Status_rw_bitmask =3D 0x3778FF1F,<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_TCStatus_rw_bitmask =3D (0 &lt;&lt=
; CP0TCSt_TCU3) | (0 &lt;&lt; CP0TCSt_TCU2) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1 &lt;&lt; CP0TCSt_TCU1) | (1 &lt;&lt; CP0TCSt_TCU0) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0 &lt;&lt; CP0TCSt_TMX) | (1 &lt;&lt; CP0TCSt_DT) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1 &lt;&lt; CP0TCSt_DA) | (1 &lt;&lt; CP0TCSt_A) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x3 &lt;&lt; CP0TCSt_TKSU) | (1 &lt;&lt; CP0TCSt_IXMT) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0xff &lt;&lt; CP0TCSt_TASID),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP1_fcr0 =3D (1 &lt;&lt; FCR0_F64) | (=
1 &lt;&lt; FCR0_L) | (1 &lt;&lt; FCR0_W) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1 &lt;&lt; FCR0_D) | (1 &lt;&lt; FCR0_S) | (0x95 &lt;&lt; FCR0_PRID),=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP1_fcr31 =3D 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP1_fcr31_rw_bitmask =3D 0xFF83FFFF,<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSCtl =3D (0xf &lt;&lt; CP0SRSCtl=
_HSS),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf0_rw_bitmask =3D 0x3fffffff=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf0 =3D (1U &lt;&lt; CP0SRSC0=
_M) | (0x3fe &lt;&lt; CP0SRSC0_SRS3) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x3fe &lt;&lt; CP0SRSC0_SRS2) | (0x3fe &lt;&lt; CP0SRSC0_SRS1),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf1_rw_bitmask =3D 0x3fffffff=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf1 =3D (1U &lt;&lt; CP0SRSC1=
_M) | (0x3fe &lt;&lt; CP0SRSC1_SRS6) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x3fe &lt;&lt; CP0SRSC1_SRS5) | (0x3fe &lt;&lt; CP0SRSC1_SRS4),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf2_rw_bitmask =3D 0x3fffffff=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf2 =3D (1U &lt;&lt; CP0SRSC2=
_M) | (0x3fe &lt;&lt; CP0SRSC2_SRS9) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x3fe &lt;&lt; CP0SRSC2_SRS8) | (0x3fe &lt;&lt; CP0SRSC2_SRS7),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf3_rw_bitmask =3D 0x3fffffff=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf3 =3D (1U &lt;&lt; CP0SRSC3=
_M) | (0x3fe &lt;&lt; CP0SRSC3_SRS12) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x3fe &lt;&lt; CP0SRSC3_SRS11) | (0x3fe &lt;&lt; CP0SRSC3_SRS10),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf4_rw_bitmask =3D 0x3fffffff=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf4 =3D (0x3fe &lt;&lt; CP0SR=
SC4_SRS15) |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x3fe &lt;&lt; CP0SRSC4_SRS14) | (0x3fe &lt;&lt; CP0SRSC4_SRS13),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .SEGBITS =3D 32,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .PABITS =3D 32,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS=
16 | ASE_DSP | ASE_MT,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mmu_type =3D MMU_TYPE_R4000,<br>
&gt; ++=C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;74Kf&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.CP0_PRid =3D 0x00019700,<br>
&gt; +--<br>
&gt; +2.14.5<br>
&gt; +<br>
&gt; --<br>
&gt; 2.14.5<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000005e0c805b1277a7d--
