Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.165.1602271385487762380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 12:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n2vjusKh;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id y14so7658970pfp.13
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 12:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ij6xIqHpmxf0kZ/GRO6QHy7YrG7MJCiBH7SVjL+6HUY=;
        b=n2vjusKhxIfLFcJo+wlDLKfaK61cFdwiWS/jSatbapSljZSYT2kSR5NcC3fy8aOlJi
         uOJFYbiMpMIuA3ehShYcFZXQLnB/IrtVQfhFB5AXMkn9gx3N8A11Ud+7bJ2GZ3kYIt/2
         jXurOwuX+OPUzuVJdhSB58svrs8UsnuSbWZn3iuQsdOxNMKe1SrPNVtHsPtNXbi4ALgw
         u68i7IbMhZH+SY7ZSMKdTieUIp63gPXZYBgy0rJHfswWsbWeXVlhflWTZMeceZeqe8fI
         p+rnGZS8+O7gZvaDiqEzmK0NO5vDJpdd4rr0v92JAK2kPZMrZyaM0KarqzuNJ9qpc80h
         BtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ij6xIqHpmxf0kZ/GRO6QHy7YrG7MJCiBH7SVjL+6HUY=;
        b=D/IeGmwb99OWMPCsKlWBG2idxNt0Uo+fcJqY96yIDlyEoSnmdV/fYrIseWp4aT1XrN
         2Ehq1WMbxvqhHkixb1FrsuDiy6sfLM4WkkPietF0AGgeTgB87IBMa0SoWHnVAKKrUeQ9
         xjwPenrWsKtDc6uCWWHay3BwMZPk02ibt2lcGrk6iIfO2iUQ5/2UY1pyOvoa3AHzj6ld
         qeCUiOsq1MOc92fWhITGUzJA1TffrQVh8sjW025Piu747k7AHBtEQCrwRf2ujypINHhu
         zCD7MUkEVnfMM9IDIsOxn3NOEMQ/WNj1qF99fU31+C37jSEIBR+iEssqAkH6l0z+avGT
         dyOw==
X-Gm-Message-State: AOAM531D2jWNqmaHeMi4aYKPBzLsrpO5fgl+LWfsgn4ft4/y4+Zlegmx
	Ih0IpeUtoWl5c3Y19EDe+jGWUPRBRPk=
X-Google-Smtp-Source: ABdhPJxdMkn7Q9neVFxRQPFklaa2lsnzUM84VdIjkoLBJ/YW5ZdOIjxzwkFOg80AUkEmcKK3xymkDg==
X-Received: by 2002:a62:7744:0:b029:152:4223:1b4e with SMTP id s65-20020a6277440000b029015242231b4emr13033133pfc.60.1602271384252;
        Fri, 09 Oct 2020 12:23:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5ff:8ee5:b507:b3ff? ([2601:202:4180:a5c0:5ff:8ee5:b507:b3ff])
        by smtp.gmail.com with ESMTPSA id ge19sm12533392pjb.55.2020.10.09.12.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 12:23:03 -0700 (PDT)
Subject: Re: [OE-core][dunfell 13/14] qemu: add 34Kf-64tlb fictitious cpu type
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1602253014.git.steve@sakoman.com>
 <182869203b57860695e818b620e40b398ef4e921.1602253014.git.steve@sakoman.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <1d2bfd98-69d7-2f43-7b6b-7ea5c2b2719e@gmail.com>
Date: Fri, 9 Oct 2020 12:23:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <182869203b57860695e818b620e40b398ef4e921.1602253014.git.steve@sakoman.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Can we make an  Arch change like this in a stable release?

-armin

On 10/9/20 7:18 AM, Steve Sakoman wrote:
> From: Victor Kamensky <kamensky@cisco.com>
>
> In Yocto Project PR 13992 it was reported that qemumips
> in autobuilder runs almost twice slower then qemumips64 and
> some times hit time out.
>
> Upon investigations of qemu-system with perf, gdb, and
> SystemTap and comparing qemumips and qemumips64 machines
> behavior it was noticed that qemu soft mmu code behaves
> quite different and in case if qemumips tlbwr instruction
> called 16 times more oftern. It happens that in qemumips64
> case qemu runs with cpu type that contains 64 TLB, but in case
> of qemumips qemu runs with cpu type that contains only
> 16 TLBs.
>
> The idea of proposed qemu patch is to introduce fictitious
> 34Kf-64tlb cpu type that defined exactly as 34Kf but has
> 64 TLBs, instead of original 16 TLBs.
>
> Testing of core-image-full-cmdline:do_testimage with
> 34Kf-64tlb shows 40% or so test execution real time
> improvement.
>
> Note for future porters of the patch: easiest way to update
> the patch and be in sync with 34Kf definition is to copy
> 34Kf machine definition and apply the following changes to
> it (just change 15 to 63 of CP0C1_MMU bits value)
>
> [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c
> 2c2
> <         .name = "34Kf",
>>         .name = "34Kf-64tlb",
> 6c6
> <         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
>>         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
> Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
>
> Upstream Status: Inappropriate
>
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 4470a04943352224955f17e004962f0f9e1c9b0c)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  ...tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 7ce89c0023..7c21b66a0c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -48,6 +48,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>  	   file://CVE-2020-14364.patch \
>  	   file://CVE-2020-14415.patch \
>  	   file://CVE-2020-16092.patch \
> +	   file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch \
>  	   "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> new file mode 100644
> index 0000000000..b6312e1543
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> @@ -0,0 +1,118 @@
> +From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 2001
> +From: Victor Kamensky <kamensky@cisco.com>
> +Date: Wed, 7 Oct 2020 10:19:42 -0700
> +Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf but with
> + 64 TLBs
> +
> +In Yocto Project CI runs it was observed that test run
> +of 32 bit mips image takes almost twice longer than 64 bit
> +mips image with the same logical load and CI execution
> +hits timeout.
> +
> +See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
> +
> +Yocto project uses 34Kf cpu type to run 32 bit mips image,
> +and MIPS64R2-generic cpu type to run 64 bit mips64 image.
> +
> +Upon qemu behavior differences investigation between mips
> +and mips64 two prominent observations came up: under
> +logically similar load (same definition and configuration
> +of user-land image) in case of mips get_physical_address
> +function is called almost twice more often, meaning
> +twice more memory accesses involved in this case. Also
> +number of tlbwr instruction executed (r4k_helper_tlbwr
> +qemu function) almost 16 time bigger in mips case than in
> +mips64.
> +
> +It turns out that 34Kf cpu has 16 TLBs, but in case of
> +MIPS64R2-generic it is 64 TLBs. So that explains why
> +some many more tlbwr had to be execute by kernel TLB refill
> +handler in case of 32 bit misp.
> +
> +The idea of the fix is to come up with new 34Kf-64tlb fictitious
> +cpu type, that would behave exactly as 34Kf but it would
> +contain 64 TLBs to reduce TLB trashing. After all, adding
> +more TLBs to soft mmu is easy.
> +
> +Experiment with some significant non-trvial load in Yocto
> +environment by running do_testimage load shows that 34Kf-64tlb
> +cpu performs 40% or so better than original 34Kf cpu wrt test
> +execution real time.
> +
> +It is not ideal to have cpu type that does not exist in the
> +wild but given performance gains it seems to be justified.
> +
> +Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> +---
> + target/mips/translate_init.inc.c | 55 ++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 55 insertions(+)
> +
> +diff --git a/target/mips/translate_init.inc.c b/target/mips/translate_init.inc.c
> +index 637caccd89..b73ab48231 100644
> +--- a/target/mips/translate_init.inc.c
> ++++ b/target/mips/translate_init.inc.c
> +@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =
> +         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
> +         .mmu_type = MMU_TYPE_R4000,
> +     },
> ++    /*
> ++     * Verbatim copy of "34Kf" cpu, only bumped up number of TLB entries
> ++     * from 16 to 64 (see CP0_Config0 value at CP0C1_MMU bits) to improve
> ++     * performance by reducing number of TLB refill exceptions and
> ++     * eliminating need to run all corresponding TLB refill handling
> ++     * instructions.
> ++     */
> ++    {
> ++        .name = "34Kf-64tlb",
> ++        .CP0_PRid = 0x00019500,
> ++        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> ++                       (MMU_TYPE_R4000 << CP0C0_MT),
> ++        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
> ++                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
> ++                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
> ++                       (1 << CP0C1_CA),
> ++        .CP0_Config2 = MIPS_CONFIG2,
> ++        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 << CP0C3_MT) |
> ++                       (1 << CP0C3_DSPP),
> ++        .CP0_LLAddr_rw_bitmask = 0,
> ++        .CP0_LLAddr_shift = 0,
> ++        .SYNCI_Step = 32,
> ++        .CCRes = 2,
> ++        .CP0_Status_rw_bitmask = 0x3778FF1F,
> ++        .CP0_TCStatus_rw_bitmask = (0 << CP0TCSt_TCU3) | (0 << CP0TCSt_TCU2) |
> ++                    (1 << CP0TCSt_TCU1) | (1 << CP0TCSt_TCU0) |
> ++                    (0 << CP0TCSt_TMX) | (1 << CP0TCSt_DT) |
> ++                    (1 << CP0TCSt_DA) | (1 << CP0TCSt_A) |
> ++                    (0x3 << CP0TCSt_TKSU) | (1 << CP0TCSt_IXMT) |
> ++                    (0xff << CP0TCSt_TASID),
> ++        .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
> ++                    (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
> ++        .CP1_fcr31 = 0,
> ++        .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
> ++        .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
> ++        .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
> ++        .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
> ++                    (0x3fe << CP0SRSC0_SRS2) | (0x3fe << CP0SRSC0_SRS1),
> ++        .CP0_SRSConf1_rw_bitmask = 0x3fffffff,
> ++        .CP0_SRSConf1 = (1U << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SRS6) |
> ++                    (0x3fe << CP0SRSC1_SRS5) | (0x3fe << CP0SRSC1_SRS4),
> ++        .CP0_SRSConf2_rw_bitmask = 0x3fffffff,
> ++        .CP0_SRSConf2 = (1U << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SRS9) |
> ++                    (0x3fe << CP0SRSC2_SRS8) | (0x3fe << CP0SRSC2_SRS7),
> ++        .CP0_SRSConf3_rw_bitmask = 0x3fffffff,
> ++        .CP0_SRSConf3 = (1U << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SRS12) |
> ++                    (0x3fe << CP0SRSC3_SRS11) | (0x3fe << CP0SRSC3_SRS10),
> ++        .CP0_SRSConf4_rw_bitmask = 0x3fffffff,
> ++        .CP0_SRSConf4 = (0x3fe << CP0SRSC4_SRS15) |
> ++                    (0x3fe << CP0SRSC4_SRS14) | (0x3fe << CP0SRSC4_SRS13),
> ++        .SEGBITS = 32,
> ++        .PABITS = 32,
> ++        .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
> ++        .mmu_type = MMU_TYPE_R4000,
> ++    },
> +     {
> +         .name = "74Kf",
> +         .CP0_PRid = 0x00019700,
> +-- 
> +2.14.5
> +
>
> 
>

