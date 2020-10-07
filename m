Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.2555.1602108361832797787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 15:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JZDnpNpW;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id h6so2491997pgk.4
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 15:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YgzLBFXNHtTBB8Cpt7MyDy+HYWCZxqJoFu3LB+WqwiE=;
        b=JZDnpNpWzLzw2xwHBR+zlcu2ZRRmAft8Vp/WznQf9zR52KfIg1kP+WDMLtfdhnQUWf
         fZSGUXGWPYbXXx9R1qakL55krQOQmB245qWTamuuxQsf5r7l3CHtsMjiwLNRxxtkvUIj
         moId491mk6EBYiuvpuc7nRP+wDYFdQd3RVWP1dcBMc6wFUuz3BMs6rgDXG37Nim+vVs3
         6Jr+8BZUI3cZP3lNRzRlNFSWL6CYEFb6APmng5VDbSsZ0kTH3jhBDqnMrgaL02ier/NL
         ZvVK980DW+vLmOnZtjWVGrxC9Ry37xPhG8YQwlShplozfae4uOPb7TAiNFT2XaxvCLQP
         hKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YgzLBFXNHtTBB8Cpt7MyDy+HYWCZxqJoFu3LB+WqwiE=;
        b=pgKhWlQOIUPXOXMfXH2WV0YGfz/RDcU+6AuPNAFjYxdPr7AY3SCN0bBT/tO/VHeXZ+
         mVDI538/SUNSK1a47q/iZPQpFSSXutGNiGe7+ubeOHDi1bJZ6OFEubJIzjMyY/p/65VM
         v8adXuGqpB13WFsXKfBVdIHH3cuIu82OtWaW4w1aD5XA3JtUFDe00gWCA8uEPjh5aoG5
         Njr8EWClH/jr3iOzCGcoe3MPOF6t4KlxzzyIGqHdlwSNBxaDAUdUHNenKKAHB7vXv0mQ
         OyrGWFSfTQMOo20qWLc3mp6xQymc+4NqfzwLd81wD3MKlk+KSE68uh08jvR/XP3PogjF
         P/QA==
X-Gm-Message-State: AOAM532jaAlWigDMF1m/1/izhb1mHmVd+apZY5gmLq341K9SXrel0lOl
	FHRLH12MR+jnk14YadwLCNk=
X-Google-Smtp-Source: ABdhPJz+m8og48YuZsJFx8P4Xl5xVzp++uKjaODkA7ldJku4EhzM1agADDNAb65C5tWaMcr7M5yGkQ==
X-Received: by 2002:a17:90a:634b:: with SMTP id v11mr4617718pjs.108.1602108361153;
        Wed, 07 Oct 2020 15:06:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:f80d:4abb:99ae:980? ([2601:646:9200:4e0:f80d:4abb:99ae:980])
        by smtp.gmail.com with ESMTPSA id m6sm3426357pjn.47.2020.10.07.15.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 15:06:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
To: Victor Kamensky <kamensky@cisco.com>,
 openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20201007203838.19096-1-kamensky@cisco.com>
 <20201007203838.19096-2-kamensky@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ebd29fd2-a720-37a2-4122-014898b7c6c8@gmail.com>
Date: Wed, 7 Oct 2020 15:05:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201007203838.19096-2-kamensky@cisco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Victor

Thanks for investigating it, these are hard problems to root cause.
I am fine with this patchset as it is. one comment/question I have is if 
you tried 32 TLBs since r6 implementation does allow 32 TLBs this would 
make it less fictition and perhaps any 32bit mips issues could be shared 
with mips32r6 implementation. I am curious if that would result
in better performance or 64 TLB emulation is better.

On 10/7/20 1:38 PM, Victor Kamensky wrote:
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
>>          .name = "34Kf-64tlb",
> 6c6
> <         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
>>          .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
> 
> Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
> 
> Upstream Status: Inappropriate
> 
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc                |   1 +
>   ...Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 +++++++++++++++++++++
>   2 files changed, 119 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index bbb9038961..6c0edcb706 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>              file://0001-qemu-Do-not-include-file-if-not-exists.patch \
>              file://find_datadir.patch \
>              file://usb-fix-setup_len-init.patch \
> +           file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch \
>              "
>   UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
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
