Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E899C04A95
	for <webhook@archiver.kernel.org>; Sat, 24 Sep 2022 02:22:00 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.2948.1663986118590011319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 19:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qxrWKtcz;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id v1so1658412plo.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 19:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uqP4RcfwuCGtHtE0xcVWh6jXbDGG0s/9ilLHQMRuV2g=;
        b=qxrWKtcz77Jkd2F1FfJW2UkEVUnFeREXIjGcNYuR/cAVcPpemUwIJK8RP+BXO4RlvC
         ElLUjkHxm01o66a7B8+nZefGS8Vw2H2wzwvWAtTUz8AMcHmzBOBbCl/wqLM0NM69pa+5
         PM0DQhwKRoIihDfLuJSjfMxGkGWIvdMMBGiEFV49DsMMrUDjXPR0niw1wzvQZNsKgh1Z
         6LbgbGf0diUDWg53xGi1qmLOOjdeewO78yU/UI6liw3JSds4ufbmb9oX6oyfo46/XLzb
         YqnttgbQJ9J5wSsrEV+ok0VFHktuoY/CDV1JZfWvJeP60uSBZqxOzy/FlHec9oJgV3vn
         2T4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uqP4RcfwuCGtHtE0xcVWh6jXbDGG0s/9ilLHQMRuV2g=;
        b=tTTxNhwu9PY/NrfDzINHidrWMFaFXiz5RINtAgLLouWR+Fni3di7WEsMzxD1yvCyUS
         w5yiFdE+5uFzzUIqhaDASWiXmEirz7VNxFiOCBmfFn9ulDs/aeZShGhvjzgtG7dfGAMF
         7DUmkEkq+M/rLb7r+TZ76JHQGz40haM1KbfuN45K/faDC2hjM3lbFOEzZI49jP8AEcjx
         6+zX3va7vVhH6shVDLCa6AfpnE3LpWunNPu67ivap7D8sytori4LXouj0ZJBxqKWS5IW
         OyCtbae5sYzraB8/sunYOrcfAgFcGloqnNRXUWN/k5Pimhi4EW3SYMgYXWd8WtwIIruT
         fDnA==
X-Gm-Message-State: ACrzQf1j3rQukOg7HlzJmeeLacWwFVcfbusQarnh2ciTns6GQHXp/BQS
	34Og2ZoWH4pyPPP7Q9psNfbYE7HI5ZZk0qiQP8c=
X-Google-Smtp-Source: 
 AMsMyM6PPp7eSkzgcQ4WiTFng1w5Uc/XmPrLKhDZj2TI/xlnPa19StH+OyjxPIt/ut3hfxk8oPM+w+omldjyqRipsZ8=
X-Received: by 2002:a17:902:ea11:b0:176:b283:9596 with SMTP id
 s17-20020a170902ea1100b00176b2839596mr11048153plg.69.1663986117646; Fri, 23
 Sep 2022 19:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
 <2356a6f51caa7e3216248ee7978059cb67b61860.1663597409.git.bruce.ashfield@gmail.com>
 <CAOSpxdbHmZtdfxi=mLMFXfMQKyZcMLQBzUMMkd7kdmNT5n_oPA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbHmZtdfxi=mLMFXfMQKyZcMLQBzUMMkd7kdmNT5n_oPA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Sep 2022 22:21:46 -0400
Message-ID: 
 <CADkTA4MvVOig9kR5XvaiPJ=9c-OUHatEeK=x==7uCHQ7L=L=QQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] linux-yocto/5.15: update to v5.15.68
To: Steve Sakoman <steve@sakoman.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Sep 2022 02:22:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171006

On Fri, Sep 23, 2022 at 5:31 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> Hi Bruce,
>
> I cherry-picked this 5.15.x series into kirkstone and I'm getting a
> warning with the poky-tiny build.  Any suggestions?
>
> (you can view the patch set in:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut)
>

I fixed this in 5.19, but I forgot that I had merged the same ACPI
configuration change to 5.15.

I've just sent a patch that cherry-picks the 5.19 fix to 5.15 and that
should resolve the warnings.

Bruce

> Steve
>
> WARNING: linux-yocto-tiny-5.15.68+gitAUTOINC+81c5990606_35d0c78ae3-r0
> do_kernel_configcheck: [kernel config]: specified values did not make
> it into the kernel's final configuration:
> [NOTE]: 'CONFIG_ATA_ACPI' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_ATA_ACPI : n
> [INFO]: raw config text:
> config ATA_ACPI
> bool "ATA ACPI Support"
> default y
> select PATA_TIMINGS
> depends on ACPI && ATA
> help
> This option adds support for ATA-related ACPI objects.
> These ACPI objects add the ability to retrieve taskfiles
> from the ACPI BIOS and write them to the disk controller.
> These objects may be related to performance, security,
> power management, or other areas.
> You can disable this at kernel boot time by using the
> option libata.noacpi=1
> Config 'ATA_ACPI' has the following Direct dependencies (ATA_ACPI=n):
> ACPI(=n) && ATA(=y)
> Parent dependencies are:
> ACPI [n] ATA [y]
> [INFO]: config 'CONFIG_ATA_ACPI' was set, but it wasn't assignable,
> check (parent) dependencies
> [NOTE]: 'CONFIG_SERIAL_8250_PNP' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_SERIAL_8250_PNP : n
> [INFO]: raw config text:
> config SERIAL_8250_PNP
> bool "8250/16550 PNP device support" if EXPERT
> default y
> depends on SERIAL_8250 && PNP && HAS_IOMEM && TTY
> help
> This builds standard PNP serial support. You may be able to
> disable this feature if you only need legacy serial support.
> Config 'SERIAL_8250_PNP' has the following Direct dependencies
> (SERIAL_8250_PNP=n):
> SERIAL_8250(=y) && PNP(=n) && HAS_IOMEM(=y) && TTY(=y)
> Parent dependencies are:
> HAS_IOMEM [y] EXPERT [y] TTY [y] PNP [n] SERIAL_8250 [y]
> [INFO]: config 'CONFIG_SERIAL_8250_PNP' was set, but it wasn't
> assignable, check (parent) dependencies
> [NOTE]: 'CONFIG_EFI' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_EFI : n
> [INFO]: raw config text:
> config EFI
> bool "EFI runtime service support"
> select UCS2_STRING
> select EFI_RUNTIME_WRAPPERS
> select ARCH_USE_MEMREMAP_PROT
> depends on ACPI
> help
> This enables the kernel to use EFI runtime services that are
> available (such as the EFI variable services).
> This option is only useful on systems that have EFI firmware.
> In addition, you should use the latest ELILO loader available
> at <http://elilo.sourceforge.net> in order to take advantage
> of EFI runtime services. However, even with this option, the
> resultant kernel should continue to boot on existing non-EFI
> platforms.
> Config 'EFI' has the following Direct dependencies (EFI=n):
> ACPI(=n)
> Parent dependencies are:
> ACPI [n]
> [INFO]: config 'CONFIG_EFI' was set, but it wasn't assignable, check
> (parent) dependencies
> [NOTE]: 'CONFIG_EFI_STUB' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_EFI_STUB : n
> [INFO]: raw config text:
> config EFI_STUB
> bool "EFI stub support"
> select RELOCATABLE
> depends on EFI && !X86_USE_3DNOW && (y || X86_32)
> help
> This kernel feature allows a bzImage to be loaded directly
> by EFI firmware without the use of a bootloader.
> See Documentation/admin-guide/efi-stub.rst for more information.
> Config 'EFI_STUB' has the following Direct dependencies (EFI_STUB=n):
> EFI(=n) && !X86_USE_3DNOW(=n) (=y) && y || X86_32(=y) (=y)
> Parent dependencies are:
> EFI [n] X86_32 [y] X86_USE_3DNOW [n]
> [INFO]: config 'CONFIG_EFI_STUB' was set, but it wasn't assignable,
> check (parent) dependencies
> [NOTE]: 'CONFIG_EFIVAR_FS' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_EFIVAR_FS : n
> [INFO]: raw config text:
> config EFIVAR_FS
> tristate "EFI Variable filesystem"
> default m
> depends on EFI
> help
> efivarfs is a replacement filesystem for the old EFI
> variable support via sysfs, as it doesn't suffer from the
> same 1024-byte variable size limit.
> To compile this file system support as a module, choose M
> here. The module will be called efivarfs.
> If unsure, say N.
> Config 'EFIVAR_FS' has the following Direct dependencies (EFIVAR_FS=n):
> EFI(=n)
> Parent dependencies are:
> EFI [n]
> [INFO]: config 'CONFIG_EFIVAR_FS' was set, but it wasn't assignable,
> check (parent) dependencies
> [NOTE]: 'CONFIG_FB_EFI' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_FB_EFI : n
> [INFO]: raw config text:
> config FB_EFI
> bool "EFI-based Framebuffer Support"
> select DRM_PANEL_ORIENTATION_QUIRKS
> select FB_CFB_FILLRECT
> select FB_CFB_COPYAREA
> select FB_CFB_IMAGEBLIT
> depends on FB = y && !IA64 && EFI && HAS_IOMEM
> help
> This is the EFI frame buffer device driver. If the firmware on
> your platform is EFI 1.10 or UEFI 2.0, select Y to add support for
> using the EFI framebuffer as your console.
> Config 'FB_EFI' has the following Direct dependencies (FB_EFI=n):
> FB(=y) = y (=y) && !IA64(undefined/n) (=y) && EFI(=n) && HAS_IOMEM(=y)
> Parent dependencies are:
> HAS_IOMEM [y] EFI [n] FB [y] IA64 [IA64]
> [INFO]: config 'CONFIG_FB_EFI' was set, but it wasn't assignable,
> check (parent) dependencies
> [NOTE]: 'CONFIG_EFI_VARS' last val (m) and .config val (n) do not match
> [INFO]: CONFIG_EFI_VARS : n
> [INFO]: raw config text:
> config EFI_VARS
> tristate "EFI Variable Support via sysfs"
> default n
> depends on EFI && (X86 || IA64) && EFI
> help
> If you say Y here, you are able to get EFI (Extensible Firmware
> Interface) variable information via sysfs. You may read,
> write, create, and destroy EFI variables through this interface.
> Note that this driver is only retained for compatibility with
> legacy users: new users should use the efivarfs filesystem
> instead.
> Config 'EFI_VARS' has the following Direct dependencies (EFI_VARS=n):
> EFI(=n) && X86(=y) || IA64(undefined/n) (=y)
> Parent dependencies are:
> IA64 [IA64] EFI [n] X86 [y]
> [INFO]: config 'CONFIG_EFI_VARS' was set, but it wasn't assignable,
> check (parent) dependencies
> [NOTE]: 'CONFIG_HPET' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_HPET : n
> [INFO]: raw config text:
> config HPET
> bool "HPET - High Precision Event Timer" if X86 || IA64
> default n
> depends on ACPI
> help
> If you say Y here, you will have a miscdevice named "/dev/hpet/". Each
> open selects one of the timers supported by the HPET. The timers are
> non-periodic and/or periodic.
> Config 'HPET' has the following Direct dependencies (HPET=n):
> ACPI(=n)
> Parent dependencies are:
> IA64 [IA64] X86 [y] ACPI [n]
> [INFO]: config 'CONFIG_HPET' was set, but it wasn't assignable, check
> (parent) dependencies
> [NOTE]: 'CONFIG_HPET_MMAP' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_HPET_MMAP : n
> [INFO]: raw config text:
> config HPET_MMAP
> bool "Allow mmap of HPET"
> default y
> depends on HPET
> help
> If you say Y here, user applications will be able to mmap
> the HPET registers.
> Config 'HPET_MMAP' has the following Direct dependencies (HPET_MMAP=n):
> HPET(=n)
> Parent dependencies are:
> HPET [n]
> [INFO]: config 'CONFIG_HPET_MMAP' was set, but it wasn't assignable,
> check (parent) dependencies
> [NOTE]: 'CONFIG_X86_AMD_PLATFORM_DEVICE' last val (y) and .config val
> (n) do not match
> [INFO]: CONFIG_X86_AMD_PLATFORM_DEVICE : n
> [INFO]: raw config text:
> config X86_AMD_PLATFORM_DEVICE
> bool "AMD ACPI2Platform devices support"
> select COMMON_CLK
> select PINCTRL
> depends on ACPI
> help
> Select to interpret AMD specific ACPI device to platform device
> such as I2C, UART, GPIO found on AMD Carrizo and later chipsets.
> I2C and UART depend on COMMON_CLK to set clock. GPIO driver is
> implemented under PINCTRL subsystem.
> Config 'X86_AMD_PLATFORM_DEVICE' has the following Direct dependencies
> (X86_AMD_PLATFORM_DEVICE=n):
> ACPI(=n)
> Parent dependencies are:
> ACPI [n]
> [INFO]: config 'CONFIG_X86_AMD_PLATFORM_DEVICE' was set, but it wasn't
> assignable, check (parent) dependencies
> [NOTE]: 'CONFIG_MMC_SDHCI_ACPI' last val (y) and .config val (n) do not match
> [INFO]: CONFIG_MMC_SDHCI_ACPI : n
> [INFO]: raw config text:
> config MMC_SDHCI_ACPI
> tristate "SDHCI support for ACPI enumerated SDHCI controllers"
> select IOSF_MBI if X86
> depends on MMC_SDHCI && ACPI && PCI && MMC
> help
> This selects support for ACPI enumerated SDHCI controllers,
> identified by ACPI Compatibility ID PNP0D40 or specific
> ACPI Hardware IDs.
> If you have a controller with this interface, say Y or M here.
> If unsure, say N.
> Config 'MMC_SDHCI_ACPI' has the following Direct dependencies
> (MMC_SDHCI_ACPI=n):
> MMC_SDHCI(=y) && ACPI(=n) && PCI(=y) && MMC(=y)
> Parent dependencies are:
> X86 [y] MMC_SDHCI [y] PCI [y] MMC [y] ACPI [n]
> [INFO]: config 'CONFIG_MMC_SDHCI_ACPI' was set, but it wasn't
> assignable, check (parent) dependencies
> NOTE: recipe linux-yocto-tiny-5.15.68+gitAUTOINC+81c5990606_35d0c78ae3-r0:
> task do_kernel_configcheck: Succeeded
>
> On Mon, Sep 19, 2022 at 4:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating  to the latest korg -stable release that comprises
> > the following commits:
> >
> >     dd20085f2a88 Linux 5.15.68
> >     e04b25638aef ARM: at91: ddr: remove CONFIG_SOC_SAMA7 dependency
> >     154e72a4b381 perf machine: Use path__join() to compose a path instead of snprintf(dir, '/', filename)
> >     590b4f10e3a4 drm/bridge: display-connector: implement bus fmts callbacks
> >     e084c6ab37d2 arm64: errata: add detection for AMEVCNTR01 incrementing incorrectly
> >     4740910867ea iommu/vt-d: Correctly calculate sagaw value of IOMMU
> >     f9e792035a0b arm64/bti: Disable in kernel BTI when cross section thunks are broken
> >     a8a007c5b10f Revert "arm64: kasan: Revert "arm64: mte: reset the page tag in page->flags""
> >     7aa57d869e4a hwmon: (mr75203) enable polling for all VM channels
> >     5e0fddad7100 hwmon: (mr75203) fix multi-channel voltage reading
> >     948b7beb0073 hwmon: (mr75203) fix voltage equation for negative source input
> >     a02267ebb247 hwmon: (mr75203) update pvt->v_num and vm_num to the actual number of used sensors
> >     000f3353231e hwmon: (mr75203) fix VM sensor allocation when "intel,vm-map" not defined
> >     4b198c41d736 s390/boot: fix absolute zero lowcore corruption on boot
> >     a557ae094207 iommu/amd: use full 64-bit value in build_completion_wait()
> >     4f8d65884808 swiotlb: avoid potential left shift overflow
> >     df82f5ce4f50 i40e: Fix ADQ rate limiting for PF
> >     39d9de5872b6 i40e: Refactor tc mqprio checks
> >     657d9d8ac3e6 kbuild: disable header exports for UML in a straightforward way
> >     12202e0f74fd MIPS: loongson32: ls1c: Fix hang during startup
> >     166ae43f02fb ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
> >     4643fbc79ded ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
> >     30a455ac385e hwmon: (tps23861) fix byte order in resistance register
> >     159d35a87ec3 perf script: Fix Cannot print 'iregs' field for hybrid systems
> >     4519d4e32f98 sch_sfb: Also store skb len before calling child enqueue
> >     a600a9babad6 RDMA/irdma: Report RNR NAK generation in device caps
> >     3ca173b217f4 RDMA/irdma: Return correct WC error for bind operation failure
> >     c1872dfde6f7 RDMA/irdma: Report the correct max cqes from query device
> >     a1d7c8647c18 nvmet: fix mar and mor off-by-one errors
> >     a96b1d33ec71 tcp: fix early ETIMEDOUT after spurious non-SACK RTO
> >     8589bbfad2b4 nvme-tcp: fix regression that causes sporadic requests to time out
> >     13c80a6c1124 nvme-tcp: fix UAF when detecting digest errors
> >     8ddd001cef5e erofs: fix pcluster use-after-free on UP platforms
> >     5fbe35c94abc RDMA/mlx5: Set local port to one when accessing counters
> >     819110054b14 IB/core: Fix a nested dead lock as part of ODP flow
> >     55195563ec29 ipv6: sr: fix out-of-bounds read when setting HMAC data.
> >     4c4eda136410 RDMA/siw: Pass a pointer to virt_to_page()
> >     595e3616f8e0 xen-netback: only remove 'hotplug-status' when the vif is actually destroyed
> >     c3efe896f13b iavf: Detach device during reset task
> >     2ed94383f3a2 i40e: Fix kernel crash during module removal
> >     3e245b0e2168 ice: use bitmap_free instead of devm_kfree
> >     8527c9a6bf8e tcp: TX zerocopy should not sense pfmemalloc status
> >     cd5f1a69d0b6 net: introduce __skb_fill_page_desc_noacc
> >     7eb9bf4edd1c tipc: fix shift wrapping bug in map_get()
> >     1a889da60afc sch_sfb: Don't assume the skb is still around after enqueueing to child
> >     b0b35b455ece Revert "net: phy: meson-gxl: improve link-up behavior"
> >     2f6640b19edf afs: Use the operation issue time instead of the reply time for callbacks
> >     e28eb3519d5f rxrpc: Fix an insufficiently large sglist in rxkad_verify_packet_2()
> >     24a4e79d92e0 rxrpc: Fix ICMP/ICMP6 error handling
> >     59f1c62d91ca ALSA: usb-audio: Register card again for iface over delayed_register option
> >     4dc401ef8b23 ALSA: usb-audio: Inform the delayed registration more properly
> >     a8edd49c94b4 RDMA/srp: Set scmnd->result only when scmnd is not NULL
> >     451c9ce1e2fc netfilter: nf_conntrack_irc: Fix forged IP logic
> >     1ce55ec5cb7c netfilter: nf_tables: clean up hook list when offload flags check fails
> >     92837ac04779 netfilter: br_netfilter: Drop dst references before setting.
> >     940e58f2ccc0 ARM: dts: at91: sama5d2_icp: don't keep vdd_other enabled all the time
> >     86706fa90be6 ARM: dts: at91: sama5d27_wlsom1: don't keep ldo2 enabled all the time
> >     d6015c56f477 ARM: dts: at91: sama5d2_icp: specify proper regulator output ranges
> >     a8ab10c3f137 ARM: dts: at91: sama5d27_wlsom1: specify proper regulator output ranges
> >     6fbff44cba17 ARM: at91: pm: fix DDR recalibration when resuming from backup and self-refresh
> >     e11d08c825f2 ARM: at91: pm: fix self-refresh for sama7g5
> >     32dd0b22a5ba wifi: wilc1000: fix DMA on stack objects
> >     6f7aa1029f8e RDMA/hns: Fix wrong fixed value of qp->rq.wqe_shift
> >     c1796dd54259 RDMA/hns: Fix supported page size
> >     43245c77d9ef soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs
> >     d3eb252d7636 RDMA/cma: Fix arguments order in net device validation
> >     e2ec1064a47d tee: fix compiler warning in tee_shm_register()
> >     eb53e84dc1ac regulator: core: Clean up on enable failure
> >     a53b30716c60 soc: imx: gpcv2: Assert reset before ungating clock
> >     83a7e5d2f14e ARM: dts: imx6qdl-kontron-samx6i: remove duplicated node
> >     ae8e70e31763 RDMA/rtrs-srv: Pass the correct number of entries for dma mapped SGL
> >     ad69caa47861 RDMA/rtrs-clt: Use the right sg_cnt after ib_dma_map_sg
> >     237f16395304 ASoC: qcom: sm8250: add missing module owner
> >     3bf4bf54069f cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
> >     509e3456d363 cgroup: Elide write-locking threadgroup_rwsem when updating csses on an empty subtree
> >     3b97deb4abf5 NFS: Fix another fsync() issue after a server reboot
> >     31b992b3c39b NFS: Save some space in the inode
> >     88d24e83a268 NFS: Further optimisations for 'ls -l'
> >     1dcc308898e7 scsi: lpfc: Add missing destroy_workqueue() in error path
> >     6229fa494a59 scsi: mpt3sas: Fix use-after-free warning
> >     d2ca79dd0b54 drm/i915: Implement WaEdpLinkRateDataReload
> >     ebf46da50beb nvmet: fix a use-after-free
> >     58acd2ebae03 drm/amd/display: fix memory leak when using debugfs_lookup()
> >     26e9a1ded892 sched/debug: fix dentry leak in update_sched_domain_debugfs
> >     94c84128adb1 debugfs: add debugfs_lookup_and_remove()
> >     8875d606761e kprobes: Prohibit probes in gate area
> >     5321908ef74f vfio/type1: Unpin zero pages
> >     7da1afa444a1 btrfs: zoned: set pseudo max append zone limit in zone emulation mode
> >     75082adeb414 tracing: Fix to check event_mutex is held while accessing trigger list
> >     98e8e67395cc ALSA: usb-audio: Fix an out-of-bounds bug in __snd_usb_parse_audio_interface()
> >     df5ec554e9e3 ALSA: usb-audio: Split endpoint setups for hw_params and prepare
> >     d1118465ae2e ALSA: aloop: Fix random zeros in capture data when using jiffies timer
> >     45814a53514e ALSA: emu10k1: Fix out of bounds access in snd_emu10k1_pcm_channel_alloc()
> >     8015ef9e8a0e ALSA: pcm: oss: Fix race at SNDCTL_DSP_SYNC
> >     ad5ef763dbbe drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly
> >     fc5a2a9616f3 fbdev: chipsfb: Add missing pci_disable_device() in chipsfb_pci_init()
> >     c3abfd6ce2f3 fbdev: fbcon: Destroy mutex on freeing struct fb_info
> >     a7dff6f41e16 md: Flush workqueue md_rdev_misc_wq in md_alloc()
> >     0b7058067eb8 net/core/skbuff: Check the return value of skb_copy_bits()
> >     bd1b769564eb cpufreq: check only freq_table in __resolve_freq()
> >     e928cf258910 netfilter: conntrack: work around exceeded receive window
> >     29906311b351 arm64: cacheinfo: Fix incorrect assignment of signed error value to unsigned fw_level
> >     27092358e9c6 parisc: Add runtime check to prevent PA2.0 kernels on PA1.x machines
> >     deb2c9c0770b parisc: ccio-dma: Handle kmalloc failure in ccio_init_resources()
> >     c63ff388e7d4 Revert "parisc: Show error if wrong 32/64-bit compiler is being used"
> >     c50189129374 scsi: ufs: core: Reduce the power mode change timeout
> >     5a7a5b2edac4 drm/radeon: add a force flush to delay work when radeon
> >     622a557b28b7 drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
> >     c15c2c2c0896 drm/amdgpu: Move psp_xgmi_terminate call from amdgpu_xgmi_remove_device to psp_hw_fini
> >     1f574fbe9c2b drm/gem: Fix GEM handle release errors
> >     bbfd857abbd2 scsi: megaraid_sas: Fix double kfree()
> >     8179f0e08578 scsi: qla2xxx: Disable ATIO interrupt coalesce for quad port ISP27XX
> >     625c78e1ae35 Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"
> >     7c6333411acf fs: only do a memory barrier for the first set_buffer_uptodate()
> >     44b402da7b24 wifi: iwlegacy: 4965: corrected fix for potential off-by-one overflow in il4965_rs_fill_link_cmd()
> >     dd291e070be0 efi: capsule-loader: Fix use-after-free in efi_capsule_write
> >     ee06f08139e7 efi: libstub: Disable struct randomization
> >     6427605fa781 net: wwan: iosm: remove pointless null check
> >     e1ad7a011591 Linux 5.15.67
> >     096e34b05a43 kbuild: fix up permissions on scripts/pahole-flags.sh
> >     bcecd2ee19ef Linux 5.15.66
> >     e1779c25e48b USB: serial: ch341: fix disabled rx timer on older devices
> >     e0923b4f38df USB: serial: ch341: fix lost character on LCR updates
> >     55d328924347 usb: dwc3: disable USB core PHY management
> >     121c6e37da76 usb: dwc3: qcom: fix use-after-free on runtime-PM wakeup
> >     9d6a2d022010 usb: dwc3: fix PHY disable sequence
> >     b775fbf532dc kbuild: Add skip_encoding_btf_enum64 option to pahole
> >     0baced0e0938 kbuild: Unify options for BTF generation for vmlinux and modules
> >     309aea4b6b81 tty: n_gsm: add sanity check for gsm->receive in gsm_receive_buf()
> >     1787ec7dcc37 drm/i915: Skip wm/ddb readout for disabled pipes
> >     f9a0f49be767 drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk
> >     301be8985e87 ALSA: seq: Fix data-race at module auto-loading
> >     9b7a07fcc5d4 ALSA: seq: oss: Fix data-race for max_midi_devs access
> >     b2c973b52f14 ALSA: hda/realtek: Add speaker AMP init for Samsung laptops with ALC298
> >     c5652d5d71cf net: mac802154: Fix a condition in the receive path
> >     4b9f3743a822 net: Use u64_stats_fetch_begin_irq() for stats fetch.
> >     57f1407ca166 ip: fix triggering of 'icmp redirect'
> >     5d20c6f932f2 wifi: mac80211: Fix UAF in ieee80211_scan_rx()
> >     552ba102a689 wifi: mac80211: Don't finalize CSA in IBSS mode if state is disconnected
> >     253ec5fb8405 driver core: Don't probe devices after bus_type.match() probe deferral
> >     7da29a2cc514 usb: gadget: mass_storage: Fix cdrom data transfers on MAC-OS
> >     299f4f420f23 usb: xhci-mtk: fix bandwidth release issue
> >     27102b39b6d0 usb: xhci-mtk: relax TT periodic bandwidth allocation
> >     c548b99e1c37 USB: core: Prevent nested device-reset calls
> >     4e22a43ec717 s390: fix nospec table alignments
> >     047a4d0f7924 s390/hugetlb: fix prepare_hugepage_range() check for 2 GB hugepages
> >     efdfa236a085 usb-storage: Add ignore-residue quirk for NXP PN7462AU
> >     0f8b5d706dcd USB: cdc-acm: Add Icom PMR F3400 support (0c26:0020)
> >     bf6e4243f80b usb: cdns3: fix incorrect handling TRB_SMM flag for ISOC transfer
> >     f1eb9e5d2f6e usb: cdns3: fix issue with rearming ISO OUT endpoint
> >     48917032c702 usb: dwc2: fix wrong order of phy_power_on and phy_init
> >     ea72b22a05ea usb: typec: tcpm: Return ENOTSUPP for power supply prop writes
> >     4be500c63911 usb: typec: intel_pmc_mux: Add new ACPI ID for Meteor Lake IOM device
> >     b201f6203197 usb: typec: altmodes/displayport: correct pin assignment for UFP receptacles
> >     577f84a6f120 USB: serial: option: add support for Cinterion MV32-WA/WB RmNet mode
> >     6415953963a9 USB: serial: option: add Quectel EM060K modem
> >     93c283a09959 USB: serial: option: add support for OPPO R11 diag port
> >     2bb1ad8c957d USB: serial: cp210x: add Decagon UCA device id
> >     3a6c5c5ab734 xhci: Add grace period after xHC start to prevent premature runtime suspend.
> >     75913c562f5b media: mceusb: Use new usb_control_msg_*() routines
> >     2c948dd68b9e usb: dwc3: pci: Add support for Intel Raptor Lake
> >     23987d01de44 thunderbolt: Use the actual buffer in tb_async_error()
> >     e31db376f6d1 xen-blkfront: Cache feature_persistent value before advertisement
> >     895a90ad7b3e xen-blkfront: Advertise feature-persistent as user requested
> >     3e8107d69fc3 xen-blkback: Advertise feature-persistent as user requested
> >     c235c4fc521f mm: pagewalk: Fix race between unmap and page walker
> >     763d77241d8f xen/grants: prevent integer overflow in gnttab_dma_alloc_pages()
> >     03b1870fbc5e KVM: x86: Mask off unsupported and unknown bits of IA32_ARCH_CAPABILITIES
> >     111a3586ed4a gpio: pca953x: Add mutex_lock for regcache sync in PM
> >     53196e037620 hwmon: (gpio-fan) Fix array out of bounds access
> >     7b8a284ffe7a clk: bcm: rpi: Add missing newline
> >     ff0b144d4b0a clk: bcm: rpi: Prevent out-of-bounds access
> >     e827a5f32a0d clk: bcm: rpi: Use correct order for the parameters of devm_kcalloc()
> >     237b4ef4c088 clk: bcm: rpi: Fix error handling of raspberrypi_fw_get_rate
> >     5ba6155d3b2f Input: rk805-pwrkey - fix module autoloading
> >     9766749a30f6 clk: core: Fix runtime PM sequence in clk_core_unprepare()
> >     c13b0be5ade0 Revert "clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops"
> >     519cd9c4b56e clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
> >     0522550aeed4 drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
> >     fec48eba4783 KVM: VMX: Heed the 'msr' argument in msr_write_intercepted()
> >     9e3c9efa7caf cifs: fix small mempool leak in SMB2_negotiate()
> >     81203ab7a6ef binder: fix alloc->vma_vm_mm null-ptr dereference
> >     c2a4b5dc8fa7 binder: fix UAF of ref->proc caused by race condition
> >     da3c6d0708e6 mmc: core: Fix inconsistent sd3_bus_mode at UHS-I SD voltage switch failure
> >     8bca22970e1c mmc: core: Fix UHS-I SD 1.8V workaround branch
> >     fc9b5b3f2ccc USB: serial: ftdi_sio: add Omron CS1W-CIF31 device id
> >     cf20c3533efc misc: fastrpc: fix memory corruption on open
> >     0e33b0f322fe misc: fastrpc: fix memory corruption on probe
> >     95ac9601feb5 iio: adc: mcp3911: use correct formula for AD conversion
> >     6e933a26e6a2 iio: ad7292: Prevent regulator double disable
> >     df1b53bc799d Input: iforce - wake up after clearing IFORCE_XMIT_RUNNING flag
> >     9f185ca8e019 tty: serial: lpuart: disable flow control while waiting for the transmit engine to complete
> >     532b255af195 musb: fix USB_MUSB_TUSB6010 dependency
> >     2535431ae967 vt: Clear selection before changing the font
> >     a19846f0f45b powerpc: align syscall table for ppc32
> >     f12afb4b5db0 staging: r8188eu: add firmware dependency
> >     dc02aaf95001 staging: rtl8712: fix use after free bugs
> >     01fd7e12f8fb serial: fsl_lpuart: RS485 RTS polariy is inverse
> >     839ca7969fcf soundwire: qcom: fix device status array range
> >     fdc69b070071 net/smc: Remove redundant refcount increase
> >     6ce0d73b2fbd Revert "sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb"
> >     aca9d0acda9e tcp: annotate data-race around challenge_timestamp
> >     1c472d671d9c sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb
> >     55fb8c3baa80 kcm: fix strp_init() order and cleanup
> >     660df4411ef4 mlxbf_gige: compute MDIO period based on i1clk
> >     a4c08cbfbcf9 ethernet: rocker: fix sleep in atomic context bug in neigh_timer_handler
> >     a420d5872601 net/sched: fix netdevice reference leaks in attach_default_qdiscs()
> >     ce881ddbdc02 net: sched: tbf: don't call qdisc_put() while holding tree lock
> >     d6ec2f711c94 net: dsa: xrs700x: Use irqsave variant for u64 stats update
> >     ca54b2bfaab3 openvswitch: fix memory leak at failed datapath creation
> >     8eeba7ef4d1d net: smsc911x: Stop and start PHY during suspend and resume
> >     cc2b9170aa34 net: sparx5: fix handling uneven length packets in manual extraction
> >     5359524251d2 Revert "xhci: turn off port power in shutdown"
> >     ee19bbed4b03 wifi: cfg80211: debugfs: fix return type in ht40allow_map_read()
> >     20b2d5be85e9 ALSA: hda: intel-nhlt: Correct the handling of fmt_config flexible array
> >     59a711467e8d ALSA: hda: intel-nhlt: remove use of __func__ in dev_dbg
> >     7828b5d0080a drm/i915/display: avoid warnings when registering dual panel backlight
> >     630ab29120b5 drm/i915/backlight: extract backlight code to a separate file
> >     9f8558c5c642 ieee802154/adf7242: defer destroy_workqueue call
> >     222bd95c89b1 bpf, cgroup: Fix kernel BUG in purge_effective_progs
> >     1c518476ceb4 bpf: Restrict bpf_sys_bpf to CAP_PERFMON
> >     de22cba333d8 skmsg: Fix wrong last sg check in sk_msg_recvmsg()
> >     7497f9766f08 iio: adc: mcp3911: make use of the sign bit
> >     9e1f74294d53 platform/x86: pmc_atom: Fix SLP_TYPx bitfield mask
> >     1a785b435276 drm/msm/dsi: Fix number of regulators for SDM660
> >     ab8533946db7 drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
> >     0a4f633548c4 drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4
> >     e8bd54b0664b drm/msm/dsi: fix the inconsistent indenting
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
> >  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
> >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
> >  3 files changed, 19 insertions(+), 19 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > index 1144cf1bfd..65a0b5c5a4 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > @@ -11,13 +11,13 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?= "4c435c4647d58aa41f423efb1fc461dafc70b619"
> > -SRCREV_meta ?= "cbf9741b1cbc3e22bbe17f4e20920df4f46eb4d3"
> > +SRCREV_machine ?= "98f38e83ef2d2b00de16c507c308bd806661a53f"
> > +SRCREV_meta ?= "81c59906067bcb77841113c76daad85fb94688d6"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
> >
> > -LINUX_VERSION ?= "5.15.65"
> > +LINUX_VERSION ?= "5.15.68"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > index a9f32bd5d5..358501fc2e 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > @@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
> >
> >  require recipes-kernel/linux/linux-yocto.inc
> >
> > -LINUX_VERSION ?= "5.15.65"
> > +LINUX_VERSION ?= "5.15.68"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > @@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
> >  KMETA = "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL = "2"
> >
> > -SRCREV_machine ?= "27747392d509aa1562545466cfecb627557676b2"
> > -SRCREV_meta ?= "cbf9741b1cbc3e22bbe17f4e20920df4f46eb4d3"
> > +SRCREV_machine ?= "35d0c78ae3efd6fe1c4fcbf4c8b0d7f43fc2aff7"
> > +SRCREV_meta ?= "81c59906067bcb77841113c76daad85fb94688d6"
> >
> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > index cbe3f0b0dc..3b4eb4d844 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > @@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
> >  KBRANCH:qemux86-64 ?= "v5.15/standard/base"
> >  KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?= "86cc7ffeba75d76077270ba98ff84cb48b7134ca"
> > -SRCREV_machine:qemuarm64 ?= "9ce45e4f8bd9fcccbee7e97873753a8a9ea49ba6"
> > -SRCREV_machine:qemumips ?= "c82ae040723f1c19c76d1ae263945b46af2a58fb"
> > -SRCREV_machine:qemuppc ?= "4b4bfed43fcd28ddaa55d518f56dd35dc66286d3"
> > -SRCREV_machine:qemuriscv64 ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
> > -SRCREV_machine:qemuriscv32 ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
> > -SRCREV_machine:qemux86 ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
> > -SRCREV_machine:qemux86-64 ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
> > -SRCREV_machine:qemumips64 ?= "f165a8d9cead8022974a88435c9ca4e69c697be9"
> > -SRCREV_machine ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
> > -SRCREV_meta ?= "cbf9741b1cbc3e22bbe17f4e20920df4f46eb4d3"
> > +SRCREV_machine:qemuarm ?= "1e5a26d496c1671b38474e191bb748a47dc7dc59"
> > +SRCREV_machine:qemuarm64 ?= "e4f332a5c08ddebbd1a36cff5270e5eebe278cf4"
> > +SRCREV_machine:qemumips ?= "4dd7bbdb60c07d2861468a9c8545ac9e97ba400d"
> > +SRCREV_machine:qemuppc ?= "c1ddaa69dd463a11645cc5362a3200dbce28d664"
> > +SRCREV_machine:qemuriscv64 ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
> > +SRCREV_machine:qemuriscv32 ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
> > +SRCREV_machine:qemux86 ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
> > +SRCREV_machine:qemux86-64 ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
> > +SRCREV_machine:qemumips64 ?= "481a521e65375aeef6b8903c8df6fc2b23a184b8"
> > +SRCREV_machine ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
> > +SRCREV_meta ?= "81c59906067bcb77841113c76daad85fb94688d6"
> >
> >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
> >  # get the <version>/base branch, which is pure upstream -stable, and the same
> >  # meta SRCREV as the linux-yocto-standard builds. Select your version using the
> >  # normal PREFERRED_VERSION settings.
> >  BBCLASSEXTEND = "devupstream:target"
> > -SRCREV_machine:class-devupstream ?= "633c3b4c71bb949de771388de213d331c1ebd270"
> > +SRCREV_machine:class-devupstream ?= "dd20085f2a88b6cdb12bdcdbd2d7a761c86b184a"
> >  PN:class-devupstream = "linux-yocto-upstream"
> >  KBRANCH:class-devupstream = "v5.15/base"
> >
> > @@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> > -LINUX_VERSION ?= "5.15.65"
> > +LINUX_VERSION ?= "5.15.68"
> >
> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> >  DEPENDS += "openssl-native util-linux-native"
> > --
> > 2.19.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170872): https://lists.openembedded.org/g/openembedded-core/message/170872
> > Mute This Topic: https://lists.openembedded.org/mt/93782013/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

