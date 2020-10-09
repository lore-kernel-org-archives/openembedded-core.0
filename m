Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.1746.1602276294287694649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 13:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nzVPAHw4;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id q26so9004274qtb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rAodLvNDRYfDxgz0ISy0C2vObMN9Kg7KkdyBDAc4rpo=;
        b=nzVPAHw4i+nhb8CEXtwpIoaTrvUuEpwYXt4LZc/zBty3gTzJ/Lxs8ZkXrDZZyVKOEz
         bwwqyS+FT/agPV5+igKqsFGzF24bXkmRYt4GRy2O85VKUxAJY9og+VLokqQIyyTfFz1D
         xQTgY2C2sXyoSEhcBpaCJ1U23i7+G/pDAWMaECYNW/+wdZlm2CuNcTbGjJEzpzRXYSh+
         EICjvTSzgi4bwQKMfihmpTYFYpENSjaeskFb+vYYhe8tPnbs+FAHSD7jvNpROEBketrn
         jgTn1p35n4gsAns8KIw7aZwGO1UZmdPdaS499YQe20hOMp62Ts4Jv0ZecDdfQJiUMlfP
         vSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rAodLvNDRYfDxgz0ISy0C2vObMN9Kg7KkdyBDAc4rpo=;
        b=Vf8jbZO8Fos3+iplbOjOzEEWpQgQ7kkXfj6uV2nkJyfqC3LgZAKC6J/UgvhFgFQ0PL
         wopp6lO+ev8geCpnZSQBat6wATM7NqLFqQK0LnNkX+npZZ6RL2dSYGPUs0aqAUdJ52Hu
         e42grxartfEJQkC6KDeD1Ma5i2zuZv3Vw4WEEyvEukbda5ddGjOGUi0xSVu7KRenGUwX
         2MXZVvT1rXRjDLWe5caoznH/+xbE2tAfJ5sfIn+pG1nPAtapqwzOSA0csIaragQMREFl
         jxXs5+li6dUahNULUjQ788X7MNn7kt8mcnbC3XxtBpCRveZRYTCjbaDkAk/ytpgh77dM
         w0xw==
X-Gm-Message-State: AOAM530avVfrFyGupwrASbYRcHDTgwL4x+3IZziW3wIlZtceJpDu2wO/
	RaLIJMW+MiLWK6p4sx/OSN/y5RmKoEk8YCMcvfg=
X-Google-Smtp-Source: ABdhPJxW0y+GJMW0rIN+LcN5E2Jlqvw7Yu6ySBGTXj1f6sKm6Y2lDcx1I6u4n0TfKWceOqXlk5uAJTS2IIKwQ2irFPc=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr15045778qtb.80.1602276293231;
 Fri, 09 Oct 2020 13:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602253014.git.steve@sakoman.com> <182869203b57860695e818b620e40b398ef4e921.1602253014.git.steve@sakoman.com>
 <1d2bfd98-69d7-2f43-7b6b-7ea5c2b2719e@gmail.com> <CAOSpxdZEuXWm0Ed36nVmC4z8q9-Hzdq+ymCW0AkA4b-oDNeBoA@mail.gmail.com>
In-Reply-To: <CAOSpxdZEuXWm0Ed36nVmC4z8q9-Hzdq+ymCW0AkA4b-oDNeBoA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 9 Oct 2020 13:44:42 -0700
Message-ID: <CAMKF1soV7Pgx-1OAjUvxXywd00p7_B4oX3+3QZW6_urcL0hofA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 13/14] qemu: add 34Kf-64tlb fictitious cpu type
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	akuster808 <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004a46f305b143054a"

--0000000000004a46f305b143054a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2020 at 12:28 PM Steve Sakoman <steve@sakoman.com> wrote:

> On Fri, Oct 9, 2020 at 9:23 AM akuster808 <akuster808@gmail.com> wrote:
> >
> > Can we make an  Arch change like this in a stable release?
>
> My vote is yes since it will reduce the number of intermittent
> autobuilder failures and seems very unlikely to have any side effects
> for normal users.
>
> Of course if others object I'm willing to bow to the will of the communi=
ty.
>

I would be fine but let=E2=80=99s soak it in master for few weeks first an=
d then
see what happens

>
> Steve
>
> > On 10/9/20 7:18 AM, Steve Sakoman wrote:
> > > From: Victor Kamensky <kamensky@cisco.com>
> > >
> > > In Yocto Project PR 13992 it was reported that qemumips
> > > in autobuilder runs almost twice slower then qemumips64 and
> > > some times hit time out.
> > >
> > > Upon investigations of qemu-system with perf, gdb, and
> > > SystemTap and comparing qemumips and qemumips64 machines
> > > behavior it was noticed that qemu soft mmu code behaves
> > > quite different and in case if qemumips tlbwr instruction
> > > called 16 times more oftern. It happens that in qemumips64
> > > case qemu runs with cpu type that contains 64 TLB, but in case
> > > of qemumips qemu runs with cpu type that contains only
> > > 16 TLBs.
> > >
> > > The idea of proposed qemu patch is to introduce fictitious
> > > 34Kf-64tlb cpu type that defined exactly as 34Kf but has
> > > 64 TLBs, instead of original 16 TLBs.
> > >
> > > Testing of core-image-full-cmdline:do_testimage with
> > > 34Kf-64tlb shows 40% or so test execution real time
> > > improvement.
> > >
> > > Note for future porters of the patch: easiest way to update
> > > the patch and be in sync with 34Kf definition is to copy
> > > 34Kf machine definition and apply the following changes to
> > > it (just change 15 to 63 of CP0C1_MMU bits value)
> > >
> > > [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c
> > > 2c2
> > > <         .name =3D "34Kf",
> > >>         .name =3D "34Kf-64tlb",
> > > 6c6
> > > <         .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 <<
> CP0C1_MMU) |
> > >>         .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 <<
> CP0C1_MMU) |
> > > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13992
> > >
> > > Upstream Status: Inappropriate
> > >
> > > Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit 4470a04943352224955f17e004962f0f9e1c9b0c)
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/recipes-devtools/qemu/qemu.inc           |   1 +
> > >  ...tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 +++++++++++++++=
+++
> > >  2 files changed, 119 insertions(+)
> > >  create mode 100644
> meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-=
type-like-34Kf-bu.patch
> > >
> > > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> > > index 7ce89c0023..7c21b66a0c 100644
> > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > @@ -48,6 +48,7 @@ SRC_URI =3D "
> https://download.qemu.org/${BPN}-${PV}.tar.xz \
> > >          file://CVE-2020-14364.patch \
> > >          file://CVE-2020-14415.patch \
> > >          file://CVE-2020-16092.patch \
> > > +
> file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch \
> > >          "
> > >  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> > >
> > > diff --git
> a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cp=
u-type-like-34Kf-bu.patch
> b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cp=
u-type-like-34Kf-bu.patch
> > > new file mode 100644
> > > index 0000000000..b6312e1543
> > > --- /dev/null
> > > +++
> b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cp=
u-type-like-34Kf-bu.patch
> > > @@ -0,0 +1,118 @@
> > > +From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 2=
001
> > > +From: Victor Kamensky <kamensky@cisco.com>
> > > +Date: Wed, 7 Oct 2020 10:19:42 -0700
> > > +Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf
> but with
> > > + 64 TLBs
> > > +
> > > +In Yocto Project CI runs it was observed that test run
> > > +of 32 bit mips image takes almost twice longer than 64 bit
> > > +mips image with the same logical load and CI execution
> > > +hits timeout.
> > > +
> > > +See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13992
> > > +
> > > +Yocto project uses 34Kf cpu type to run 32 bit mips image,
> > > +and MIPS64R2-generic cpu type to run 64 bit mips64 image.
> > > +
> > > +Upon qemu behavior differences investigation between mips
> > > +and mips64 two prominent observations came up: under
> > > +logically similar load (same definition and configuration
> > > +of user-land image) in case of mips get_physical_address
> > > +function is called almost twice more often, meaning
> > > +twice more memory accesses involved in this case. Also
> > > +number of tlbwr instruction executed (r4k_helper_tlbwr
> > > +qemu function) almost 16 time bigger in mips case than in
> > > +mips64.
> > > +
> > > +It turns out that 34Kf cpu has 16 TLBs, but in case of
> > > +MIPS64R2-generic it is 64 TLBs. So that explains why
> > > +some many more tlbwr had to be execute by kernel TLB refill
> > > +handler in case of 32 bit misp.
> > > +
> > > +The idea of the fix is to come up with new 34Kf-64tlb fictitious
> > > +cpu type, that would behave exactly as 34Kf but it would
> > > +contain 64 TLBs to reduce TLB trashing. After all, adding
> > > +more TLBs to soft mmu is easy.
> > > +
> > > +Experiment with some significant non-trvial load in Yocto
> > > +environment by running do_testimage load shows that 34Kf-64tlb
> > > +cpu performs 40% or so better than original 34Kf cpu wrt test
> > > +execution real time.
> > > +
> > > +It is not ideal to have cpu type that does not exist in the
> > > +wild but given performance gains it seems to be justified.
> > > +
> > > +Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> > > +---
> > > + target/mips/translate_init.inc.c | 55
> ++++++++++++++++++++++++++++++++++++++++
> > > + 1 file changed, 55 insertions(+)
> > > +
> > > +diff --git a/target/mips/translate_init.inc.c
> b/target/mips/translate_init.inc.c
> > > +index 637caccd89..b73ab48231 100644
> > > +--- a/target/mips/translate_init.inc.c
> > > ++++ b/target/mips/translate_init.inc.c
> > > +@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =3D
> > > +         .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_=
MT,
> > > +         .mmu_type =3D MMU_TYPE_R4000,
> > > +     },
> > > ++    /*
> > > ++     * Verbatim copy of "34Kf" cpu, only bumped up number of TLB
> entries
> > > ++     * from 16 to 64 (see CP0_Config0 value at CP0C1_MMU bits) to
> improve
> > > ++     * performance by reducing number of TLB refill exceptions and
> > > ++     * eliminating need to run all corresponding TLB refill handli=
ng
> > > ++     * instructions.
> > > ++     */
> > > ++    {
> > > ++        .name =3D "34Kf-64tlb",
> > > ++        .CP0_PRid =3D 0x00019500,
> > > ++        .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> > > ++                       (MMU_TYPE_R4000 << CP0C0_MT),
> > > ++        .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 <<
> CP0C1_MMU) |
> > > ++                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 <<
> CP0C1_IA) |
> > > ++                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 <<
> CP0C1_DA) |
> > > ++                       (1 << CP0C1_CA),
> > > ++        .CP0_Config2 =3D MIPS_CONFIG2,
> > > ++        .CP0_Config3 =3D MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 <<
> CP0C3_MT) |
> > > ++                       (1 << CP0C3_DSPP),
> > > ++        .CP0_LLAddr_rw_bitmask =3D 0,
> > > ++        .CP0_LLAddr_shift =3D 0,
> > > ++        .SYNCI_Step =3D 32,
> > > ++        .CCRes =3D 2,
> > > ++        .CP0_Status_rw_bitmask =3D 0x3778FF1F,
> > > ++        .CP0_TCStatus_rw_bitmask =3D (0 << CP0TCSt_TCU3) | (0 <<
> CP0TCSt_TCU2) |
> > > ++                    (1 << CP0TCSt_TCU1) | (1 << CP0TCSt_TCU0) |
> > > ++                    (0 << CP0TCSt_TMX) | (1 << CP0TCSt_DT) |
> > > ++                    (1 << CP0TCSt_DA) | (1 << CP0TCSt_A) |
> > > ++                    (0x3 << CP0TCSt_TKSU) | (1 << CP0TCSt_IXMT) |
> > > ++                    (0xff << CP0TCSt_TASID),
> > > ++        .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0=
_W) |
> > > ++                    (1 << FCR0_D) | (1 << FCR0_S) | (0x95 <<
> FCR0_PRID),
> > > ++        .CP1_fcr31 =3D 0,
> > > ++        .CP1_fcr31_rw_bitmask =3D 0xFF83FFFF,
> > > ++        .CP0_SRSCtl =3D (0xf << CP0SRSCtl_HSS),
> > > ++        .CP0_SRSConf0_rw_bitmask =3D 0x3fffffff,
> > > ++        .CP0_SRSConf0 =3D (1U << CP0SRSC0_M) | (0x3fe <<
> CP0SRSC0_SRS3) |
> > > ++                    (0x3fe << CP0SRSC0_SRS2) | (0x3fe <<
> CP0SRSC0_SRS1),
> > > ++        .CP0_SRSConf1_rw_bitmask =3D 0x3fffffff,
> > > ++        .CP0_SRSConf1 =3D (1U << CP0SRSC1_M) | (0x3fe <<
> CP0SRSC1_SRS6) |
> > > ++                    (0x3fe << CP0SRSC1_SRS5) | (0x3fe <<
> CP0SRSC1_SRS4),
> > > ++        .CP0_SRSConf2_rw_bitmask =3D 0x3fffffff,
> > > ++        .CP0_SRSConf2 =3D (1U << CP0SRSC2_M) | (0x3fe <<
> CP0SRSC2_SRS9) |
> > > ++                    (0x3fe << CP0SRSC2_SRS8) | (0x3fe <<
> CP0SRSC2_SRS7),
> > > ++        .CP0_SRSConf3_rw_bitmask =3D 0x3fffffff,
> > > ++        .CP0_SRSConf3 =3D (1U << CP0SRSC3_M) | (0x3fe <<
> CP0SRSC3_SRS12) |
> > > ++                    (0x3fe << CP0SRSC3_SRS11) | (0x3fe <<
> CP0SRSC3_SRS10),
> > > ++        .CP0_SRSConf4_rw_bitmask =3D 0x3fffffff,
> > > ++        .CP0_SRSConf4 =3D (0x3fe << CP0SRSC4_SRS15) |
> > > ++                    (0x3fe << CP0SRSC4_SRS14) | (0x3fe <<
> CP0SRSC4_SRS13),
> > > ++        .SEGBITS =3D 32,
> > > ++        .PABITS =3D 32,
> > > ++        .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_=
MT,
> > > ++        .mmu_type =3D MMU_TYPE_R4000,
> > > ++    },
> > > +     {
> > > +         .name =3D "74Kf",
> > > +         .CP0_PRid =3D 0x00019700,
> > > +--
> > > +2.14.5
> > > +
> > >
> > >
> > >
> >
>
>=20
>
>

--0000000000004a46f305b143054a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 9, 2020 at 12:28 PM Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Fri, Oct 9, 2020 at 9:23 AM akuster808 &lt;=
<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; Can we make an=C2=A0 Arch change like this in a stable release?<br>
<br>
My vote is yes since it will reduce the number of intermittent<br>
autobuilder failures and seems very unlikely to have any side effects<br>
for normal users.<br>
<br>
Of course if others object I&#39;m willing to bow to the will of the commu=
nity.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I would be fine=
 but let=E2=80=99s soak it in master for few weeks first and then see=C2=A0=
what happens</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Steve<br>
<br>
&gt; On 10/9/20 7:18 AM, Steve Sakoman wrote:<br>
&gt; &gt; From: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.com" =
target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; In Yocto Project PR 13992 it was reported that qemumips<br>
&gt; &gt; in autobuilder runs almost twice slower then qemumips64 and<br>
&gt; &gt; some times hit time out.<br>
&gt; &gt;<br>
&gt; &gt; Upon investigations of qemu-system with perf, gdb, and<br>
&gt; &gt; SystemTap and comparing qemumips and qemumips64 machines<br>
&gt; &gt; behavior it was noticed that qemu soft mmu code behaves<br>
&gt; &gt; quite different and in case if qemumips tlbwr instruction<br>
&gt; &gt; called 16 times more oftern. It happens that in qemumips64<br>
&gt; &gt; case qemu runs with cpu type that contains 64 TLB, but in case<b=
r>
&gt; &gt; of qemumips qemu runs with cpu type that contains only<br>
&gt; &gt; 16 TLBs.<br>
&gt; &gt;<br>
&gt; &gt; The idea of proposed qemu patch is to introduce fictitious<br>
&gt; &gt; 34Kf-64tlb cpu type that defined exactly as 34Kf but has<br>
&gt; &gt; 64 TLBs, instead of original 16 TLBs.<br>
&gt; &gt;<br>
&gt; &gt; Testing of core-image-full-cmdline:do_testimage with<br>
&gt; &gt; 34Kf-64tlb shows 40% or so test execution real time<br>
&gt; &gt; improvement.<br>
&gt; &gt;<br>
&gt; &gt; Note for future porters of the patch: easiest way to update<br>
&gt; &gt; the patch and be in sync with 34Kf definition is to copy<br>
&gt; &gt; 34Kf machine definition and apply the following changes to<br>
&gt; &gt; it (just change 15 to 63 of CP0C1_MMU bits value)<br>
&gt; &gt;<br>
&gt; &gt; [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c<br>
&gt; &gt; 2c2<br>
&gt; &gt; &lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;34Kf&quot;=
,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;34Kf-64tlb&=
quot;,<br>
&gt; &gt; 6c6<br>
&gt; &gt; &lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.CP0_Config1 =3D MIPS_CONF=
IG1 | (1 &lt;&lt; CP0C1_FP) | (15 &lt;&lt; CP0C1_MMU) |<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.CP0_Config1 =3D MIPS_CONFI=
G1 | (1 &lt;&lt; CP0C1_FP) | (63 &lt;&lt; CP0C1_MMU) |<br>
&gt; &gt; Fixes <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D13992" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D13992</a><br>
&gt; &gt;<br>
&gt; &gt; Upstream Status: Inappropriate<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Victor Kamensky &lt;<a href=3D"mailto:kamensky@ci=
sco.com" target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt;<br>
&gt; &gt; (cherry picked from commit 4470a04943352224955f17e004962f0f9e1c9=
b0c)<br>
&gt; &gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman=
.com" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 ...tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++=
++++++++++++<br>
&gt; &gt;=C2=A0 2 files changed, 119 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mi=
ps-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-=
devtools/qemu/qemu.inc<br>
&gt; &gt; index 7ce89c0023..7c21b66a0c 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; &gt; @@ -48,6 +48,7 @@ SRC_URI =3D &quot;<a href=3D"https://download.=
qemu.org/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">=
https://download.qemu.org/${BPN}-${PV}.tar.xz</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-14364.patch \<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-14415.patch \<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-16092.patch \<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mips-add-34Kf-64tlb-fic=
titious-cpu-type-like-34Kf-bu.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\=
d+)+)\.tar&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-=
64tlb-fictitious-cpu-type-like-34Kf-bu.patch b/meta/recipes-devtools/qemu/q=
emu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..b6312e1543<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-f=
ictitious-cpu-type-like-34Kf-bu.patch<br>
&gt; &gt; @@ -0,0 +1,118 @@<br>
&gt; &gt; +From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.com"=
 target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; &gt; +Date: Wed, 7 Oct 2020 10:19:42 -0700<br>
&gt; &gt; +Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like =
34Kf but with<br>
&gt; &gt; + 64 TLBs<br>
&gt; &gt; +<br>
&gt; &gt; +In Yocto Project CI runs it was observed that test run<br>
&gt; &gt; +of 32 bit mips image takes almost twice longer than 64 bit<br>
&gt; &gt; +mips image with the same logical load and CI execution<br>
&gt; &gt; +hits timeout.<br>
&gt; &gt; +<br>
&gt; &gt; +See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D13992" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D13992</a><br>
&gt; &gt; +<br>
&gt; &gt; +Yocto project uses 34Kf cpu type to run 32 bit mips image,<br>
&gt; &gt; +and MIPS64R2-generic cpu type to run 64 bit mips64 image.<br>
&gt; &gt; +<br>
&gt; &gt; +Upon qemu behavior differences investigation between mips<br>
&gt; &gt; +and mips64 two prominent observations came up: under<br>
&gt; &gt; +logically similar load (same definition and configuration<br>
&gt; &gt; +of user-land image) in case of mips get_physical_address<br>
&gt; &gt; +function is called almost twice more often, meaning<br>
&gt; &gt; +twice more memory accesses involved in this case. Also<br>
&gt; &gt; +number of tlbwr instruction executed (r4k_helper_tlbwr<br>
&gt; &gt; +qemu function) almost 16 time bigger in mips case than in<br>
&gt; &gt; +mips64.<br>
&gt; &gt; +<br>
&gt; &gt; +It turns out that 34Kf cpu has 16 TLBs, but in case of<br>
&gt; &gt; +MIPS64R2-generic it is 64 TLBs. So that explains why<br>
&gt; &gt; +some many more tlbwr had to be execute by kernel TLB refill<br>
&gt; &gt; +handler in case of 32 bit misp.<br>
&gt; &gt; +<br>
&gt; &gt; +The idea of the fix is to come up with new 34Kf-64tlb fictitiou=
s<br>
&gt; &gt; +cpu type, that would behave exactly as 34Kf but it would<br>
&gt; &gt; +contain 64 TLBs to reduce TLB trashing. After all, adding<br>
&gt; &gt; +more TLBs to soft mmu is easy.<br>
&gt; &gt; +<br>
&gt; &gt; +Experiment with some significant non-trvial load in Yocto<br>
&gt; &gt; +environment by running do_testimage load shows that 34Kf-64tlb<=
br>
&gt; &gt; +cpu performs 40% or so better than original 34Kf cpu wrt test<b=
r>
&gt; &gt; +execution real time.<br>
&gt; &gt; +<br>
&gt; &gt; +It is not ideal to have cpu type that does not exist in the<br>
&gt; &gt; +wild but given performance gains it seems to be justified.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Victor Kamensky &lt;<a href=3D"mailto:kamensky@c=
isco.com" target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + target/mips/translate_init.inc.c | 55 ++++++++++++++++++++++++=
++++++++++++++++<br>
&gt; &gt; + 1 file changed, 55 insertions(+)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/target/mips/translate_init.inc.c b/target/mips/tra=
nslate_init.inc.c<br>
&gt; &gt; +index 637caccd89..b73ab48231 100644<br>
&gt; &gt; +--- a/target/mips/translate_init.inc.c<br>
&gt; &gt; ++++ b/target/mips/translate_init.inc.c<br>
&gt; &gt; +@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =3D<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.insn_flags =3D CPU_MIPS32R2 =
| ASE_MIPS16 | ASE_DSP | ASE_MT,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mmu_type =3D MMU_TYPE_R4000,=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; ++=C2=A0 =C2=A0 /*<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* Verbatim copy of &quot;34Kf&quot; cpu, o=
nly bumped up number of TLB entries<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* from 16 to 64 (see CP0_Config0 value at =
CP0C1_MMU bits) to improve<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* performance by reducing number of TLB re=
fill exceptions and<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* eliminating need to run all correspondin=
g TLB refill handling<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* instructions.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; ++=C2=A0 =C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;34Kf-64tlb&quot;,<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_PRid =3D 0x00019500,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config0 =3D MIPS_CONFIG0 | (0=
x1 &lt;&lt; CP0C0_AR) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(MMU_TYPE_R4000 &lt;&lt; CP0C0_MT),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config1 =3D MIPS_CONFIG1 | (1=
 &lt;&lt; CP0C1_FP) | (63 &lt;&lt; CP0C1_MMU) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(0 &lt;&lt; CP0C1_IS) | (3 &lt;&lt; CP0C1_IL) | (1 &lt=
;&lt; CP0C1_IA) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(0 &lt;&lt; CP0C1_DS) | (3 &lt;&lt; CP0C1_DL) | (1 &lt=
;&lt; CP0C1_DA) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; CP0C1_CA),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config2 =3D MIPS_CONFIG2,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config3 =3D MIPS_CONFIG3 | (1=
 &lt;&lt; CP0C3_VInt) | (1 &lt;&lt; CP0C3_MT) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; CP0C3_DSPP),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_LLAddr_rw_bitmask =3D 0,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_LLAddr_shift =3D 0,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .SYNCI_Step =3D 32,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CCRes =3D 2,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Status_rw_bitmask =3D 0x3778F=
F1F,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_TCStatus_rw_bitmask =3D (0 &l=
t;&lt; CP0TCSt_TCU3) | (0 &lt;&lt; CP0TCSt_TCU2) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (1 &lt;&lt; CP0TCSt_TCU1) | (1 &lt;&lt; CP0TCSt_TCU0) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0 &lt;&lt; CP0TCSt_TMX) | (1 &lt;&lt; CP0TCSt_DT) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (1 &lt;&lt; CP0TCSt_DA) | (1 &lt;&lt; CP0TCSt_A) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0x3 &lt;&lt; CP0TCSt_TKSU) | (1 &lt;&lt; CP0TCSt_IXMT) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0xff &lt;&lt; CP0TCSt_TASID),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP1_fcr0 =3D (1 &lt;&lt; FCR0_F64=
) | (1 &lt;&lt; FCR0_L) | (1 &lt;&lt; FCR0_W) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (1 &lt;&lt; FCR0_D) | (1 &lt;&lt; FCR0_S) | (0x95 &lt;&lt; FCR0_PRI=
D),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP1_fcr31 =3D 0,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP1_fcr31_rw_bitmask =3D 0xFF83FF=
FF,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSCtl =3D (0xf &lt;&lt; CP0S=
RSCtl_HSS),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf0_rw_bitmask =3D 0x3ff=
fffff,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf0 =3D (1U &lt;&lt; CP0=
SRSC0_M) | (0x3fe &lt;&lt; CP0SRSC0_SRS3) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0x3fe &lt;&lt; CP0SRSC0_SRS2) | (0x3fe &lt;&lt; CP0SRSC0_SRS1),<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf1_rw_bitmask =3D 0x3ff=
fffff,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf1 =3D (1U &lt;&lt; CP0=
SRSC1_M) | (0x3fe &lt;&lt; CP0SRSC1_SRS6) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0x3fe &lt;&lt; CP0SRSC1_SRS5) | (0x3fe &lt;&lt; CP0SRSC1_SRS4),<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf2_rw_bitmask =3D 0x3ff=
fffff,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf2 =3D (1U &lt;&lt; CP0=
SRSC2_M) | (0x3fe &lt;&lt; CP0SRSC2_SRS9) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0x3fe &lt;&lt; CP0SRSC2_SRS8) | (0x3fe &lt;&lt; CP0SRSC2_SRS7),<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf3_rw_bitmask =3D 0x3ff=
fffff,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf3 =3D (1U &lt;&lt; CP0=
SRSC3_M) | (0x3fe &lt;&lt; CP0SRSC3_SRS12) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0x3fe &lt;&lt; CP0SRSC3_SRS11) | (0x3fe &lt;&lt; CP0SRSC3_SRS10),<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf4_rw_bitmask =3D 0x3ff=
fffff,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_SRSConf4 =3D (0x3fe &lt;&lt; =
CP0SRSC4_SRS15) |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0x3fe &lt;&lt; CP0SRSC4_SRS14) | (0x3fe &lt;&lt; CP0SRSC4_SRS13),<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .SEGBITS =3D 32,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .PABITS =3D 32,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .insn_flags =3D CPU_MIPS32R2 | ASE=
_MIPS16 | ASE_DSP | ASE_MT,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mmu_type =3D MMU_TYPE_R4000,<br>
&gt; &gt; ++=C2=A0 =C2=A0 },<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;74Kf&quot;,<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.CP0_PRid =3D 0x00019700,<br>
&gt; &gt; +--<br>
&gt; &gt; +2.14.5<br>
&gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000004a46f305b143054a--
