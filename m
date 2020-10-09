Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.1216.1602274382682769937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 13:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hc1BW/2R;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id u8so14900113ejg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nKHzBqoAxe4aeQoPv4EmGanskurr2YPFJrujE4TULkw=;
        b=Hc1BW/2Rw+Tbw7ISmCz6vS+HIBYwxO+TDYNg23fQ2jMemxgkMjUt+nTLk9D8sLI037
         DgqAsIgkzkdXhOs+X7s60JQThkwxfopfoJ9NkyMGRWnWLrVM+TcaCnKyZRT/BG9h7GTj
         qhcCp0Uh5t7Zp1aB2VsOiqSTRlcja+ioEEwDBid50uVdUK1AxY81NBIAdklUMSIv9vff
         HwlOuwKYjQ8SUE+MdPSYeeOywLeJb7FWS8VGjzXAI5Vq/dQzN7YCX71nbChJ2fYtvPq2
         BxAlgqbplRDscrpfDVSASL8HmPAA3vYXaLk5aceG+8r9WAyiUEww+CDZM9tcKxrp0MP1
         Md3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nKHzBqoAxe4aeQoPv4EmGanskurr2YPFJrujE4TULkw=;
        b=kwsWAXgdWgIpHgemxJyxZec1PXT0ZScOd0a3fWa8KNsV3G/xjI+YJqFrot8OIrecCh
         rW5dvPdhsQk0B9gGjNpM8zRgfqcBVG21rVvVamGS7/klKEyFE2DyiVbyABEqU7Z906Np
         ZZbwTrpwmcAQiRN3ZxCM2/ioGy14vgS0HIrShy5oiMwcuISQaJ1FPFdJcBBKAjRHdp80
         mDz4d1CopVnDFamjhCXY1UVMzSzVi1de/aOhZYI23cGjoCJgzMdKUF+gCcd0+fS1Xjbf
         Yc2hCPfoO9AUQGVFxkX+pfJwx/yA/W+AWVq14X/fMKHjPJf2WKyBM27wI7vWtprzjjXL
         oTSg==
X-Gm-Message-State: AOAM530hNUb3xIjmKoApkQcskn3ZPZpFJ5EHpR06eQqknKczkg/Kzozz
	w3EA3hjcpegI6/yiHDOFoI+W5KbYS3E0DmAJD2M=
X-Google-Smtp-Source: ABdhPJwOgACwZ3TE1Tds2LaGfPV5+fmAxEslvIZE/HA8OadipkiSs9JixDaaKrJvgRQm8aA1ubyd8MAKVUR+CTFh2UI=
X-Received: by 2002:a17:906:7e53:: with SMTP id z19mr15901582ejr.334.1602274380856;
 Fri, 09 Oct 2020 13:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602253014.git.steve@sakoman.com> <182869203b57860695e818b620e40b398ef4e921.1602253014.git.steve@sakoman.com>
 <1d2bfd98-69d7-2f43-7b6b-7ea5c2b2719e@gmail.com> <CAOSpxdZEuXWm0Ed36nVmC4z8q9-Hzdq+ymCW0AkA4b-oDNeBoA@mail.gmail.com>
In-Reply-To: <CAOSpxdZEuXWm0Ed36nVmC4z8q9-Hzdq+ymCW0AkA4b-oDNeBoA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 9 Oct 2020 16:12:49 -0400
Message-ID: <CADkTA4OSQD-oWv5L=ByqTz_gSFG13DHN_JPPK01UuKeCX2MfNw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 13/14] qemu: add 34Kf-64tlb fictitious cpu type
To: Steve Sakoman <steve@sakoman.com>
Cc: akuster808 <akuster808@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2020 at 3:28 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Fri, Oct 9, 2020 at 9:23 AM akuster808 <akuster808@gmail.com> wrote:
> >
> > Can we make an  Arch change like this in a stable release?
>
> My vote is yes since it will reduce the number of intermittent
> autobuilder failures and seems very unlikely to have any side effects
> for normal users.
>

I'd agree with that.

We haven't seen any regressions from it in master, and the benefits to
-stable maintenance are significant.

Bruce

> Of course if others object I'm willing to bow to the will of the community.
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
> > > <         .name = "34Kf",
> > >>         .name = "34Kf-64tlb",
> > > 6c6
> > > <         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
> > >>         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
> > > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
> > >
> > > Upstream Status: Inappropriate
> > >
> > > Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit 4470a04943352224955f17e004962f0f9e1c9b0c)
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/recipes-devtools/qemu/qemu.inc           |   1 +
> > >  ...tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++++++++++++++
> > >  2 files changed, 119 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> > >
> > > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> > > index 7ce89c0023..7c21b66a0c 100644
> > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > @@ -48,6 +48,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
> > >          file://CVE-2020-14364.patch \
> > >          file://CVE-2020-14415.patch \
> > >          file://CVE-2020-16092.patch \
> > > +        file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch \
> > >          "
> > >  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> > >
> > > diff --git a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> > > new file mode 100644
> > > index 0000000000..b6312e1543
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> > > @@ -0,0 +1,118 @@
> > > +From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 2001
> > > +From: Victor Kamensky <kamensky@cisco.com>
> > > +Date: Wed, 7 Oct 2020 10:19:42 -0700
> > > +Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf but with
> > > + 64 TLBs
> > > +
> > > +In Yocto Project CI runs it was observed that test run
> > > +of 32 bit mips image takes almost twice longer than 64 bit
> > > +mips image with the same logical load and CI execution
> > > +hits timeout.
> > > +
> > > +See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
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
> > > + target/mips/translate_init.inc.c | 55 ++++++++++++++++++++++++++++++++++++++++
> > > + 1 file changed, 55 insertions(+)
> > > +
> > > +diff --git a/target/mips/translate_init.inc.c b/target/mips/translate_init.inc.c
> > > +index 637caccd89..b73ab48231 100644
> > > +--- a/target/mips/translate_init.inc.c
> > > ++++ b/target/mips/translate_init.inc.c
> > > +@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =
> > > +         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
> > > +         .mmu_type = MMU_TYPE_R4000,
> > > +     },
> > > ++    /*
> > > ++     * Verbatim copy of "34Kf" cpu, only bumped up number of TLB entries
> > > ++     * from 16 to 64 (see CP0_Config0 value at CP0C1_MMU bits) to improve
> > > ++     * performance by reducing number of TLB refill exceptions and
> > > ++     * eliminating need to run all corresponding TLB refill handling
> > > ++     * instructions.
> > > ++     */
> > > ++    {
> > > ++        .name = "34Kf-64tlb",
> > > ++        .CP0_PRid = 0x00019500,
> > > ++        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> > > ++                       (MMU_TYPE_R4000 << CP0C0_MT),
> > > ++        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
> > > ++                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
> > > ++                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
> > > ++                       (1 << CP0C1_CA),
> > > ++        .CP0_Config2 = MIPS_CONFIG2,
> > > ++        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 << CP0C3_MT) |
> > > ++                       (1 << CP0C3_DSPP),
> > > ++        .CP0_LLAddr_rw_bitmask = 0,
> > > ++        .CP0_LLAddr_shift = 0,
> > > ++        .SYNCI_Step = 32,
> > > ++        .CCRes = 2,
> > > ++        .CP0_Status_rw_bitmask = 0x3778FF1F,
> > > ++        .CP0_TCStatus_rw_bitmask = (0 << CP0TCSt_TCU3) | (0 << CP0TCSt_TCU2) |
> > > ++                    (1 << CP0TCSt_TCU1) | (1 << CP0TCSt_TCU0) |
> > > ++                    (0 << CP0TCSt_TMX) | (1 << CP0TCSt_DT) |
> > > ++                    (1 << CP0TCSt_DA) | (1 << CP0TCSt_A) |
> > > ++                    (0x3 << CP0TCSt_TKSU) | (1 << CP0TCSt_IXMT) |
> > > ++                    (0xff << CP0TCSt_TASID),
> > > ++        .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
> > > ++                    (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
> > > ++        .CP1_fcr31 = 0,
> > > ++        .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
> > > ++        .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
> > > ++        .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
> > > ++        .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
> > > ++                    (0x3fe << CP0SRSC0_SRS2) | (0x3fe << CP0SRSC0_SRS1),
> > > ++        .CP0_SRSConf1_rw_bitmask = 0x3fffffff,
> > > ++        .CP0_SRSConf1 = (1U << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SRS6) |
> > > ++                    (0x3fe << CP0SRSC1_SRS5) | (0x3fe << CP0SRSC1_SRS4),
> > > ++        .CP0_SRSConf2_rw_bitmask = 0x3fffffff,
> > > ++        .CP0_SRSConf2 = (1U << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SRS9) |
> > > ++                    (0x3fe << CP0SRSC2_SRS8) | (0x3fe << CP0SRSC2_SRS7),
> > > ++        .CP0_SRSConf3_rw_bitmask = 0x3fffffff,
> > > ++        .CP0_SRSConf3 = (1U << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SRS12) |
> > > ++                    (0x3fe << CP0SRSC3_SRS11) | (0x3fe << CP0SRSC3_SRS10),
> > > ++        .CP0_SRSConf4_rw_bitmask = 0x3fffffff,
> > > ++        .CP0_SRSConf4 = (0x3fe << CP0SRSC4_SRS15) |
> > > ++                    (0x3fe << CP0SRSC4_SRS14) | (0x3fe << CP0SRSC4_SRS13),
> > > ++        .SEGBITS = 32,
> > > ++        .PABITS = 32,
> > > ++        .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
> > > ++        .mmu_type = MMU_TYPE_R4000,
> > > ++    },
> > > +     {
> > > +         .name = "74Kf",
> > > +         .CP0_PRid = 0x00019700,
> > > +--
> > > +2.14.5
> > > +
> > >
> > >
> > >
> >
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
