Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAB8C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 04:21:56 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.36973.1658204509894665220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 21:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=B2QeZVxj;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id r6so17977428edd.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ZUbI43pwSo8jJo//+q9G2WhDVYkAdA5UKTH0waByuU=;
        b=B2QeZVxjGkRAiYX58lwtGN7vN30N5Grs5Rp703sRjn+pjXIcCN63tKdXWdto2pzvot
         /SuZzeS07EwcD8y01DOfdEs9F+yShcf+daAGgaol6JeOlUQHW1EnQaO40fZGJ2GlBu05
         Y2yqc1+x1ATyMlXNO3NlthkQ8mwZm2KUgrULcGH0BRdrLKSYyEW95zTZwtRzqRLP06xG
         ELMh/ycyGzwuJc0ZcrK1TpJWksE8snkJpLYjTB1l1+L1m1kF+6/rrSa65xqD6T+aEKbA
         dOqpYgmUXDC7soojtRynDSfardKfVYOanMOQkA/SBW7TViktf+paNeei+HpyiRSblqgy
         8V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ZUbI43pwSo8jJo//+q9G2WhDVYkAdA5UKTH0waByuU=;
        b=6y8j67Sn9TWcXLhVoR1N3y/DHfYEOlh3yIgahchVrHX/9W3o0UxqtF0RjksNohOHHw
         7e3BLTtreShDC5mHyHbFLUYj/kmhm/czoQ1dSf90asg/wyrI5JqP5GAaKX1LwL/pRWuv
         XjHiayowuAw6P40XjcVE9AcdfrkG30S+ll8jZ8vf2fIcICSk5yOYmF0oupP41dMzwd5O
         9GSnzh+wAtWND9h4mghJiwLUNcS28InV467Q+Wf7uIag6mOZOB+yzj4L8HJFys9HpwdW
         hT5oen+vl02fhzaIWqinco+myVOpznckpRoMO/5ejsYoLNZH5+YeKSQz8Z8pm00rnAjN
         tQiw==
X-Gm-Message-State: AJIora/uIyieXuk/iTeW7WTlXWT78dsmupYQUHIh8ZrE0rnIELl6FIiX
	G92OXCHiS4gCjnU67u7YF7Kn6jvN1oTXjyzQQQ6u7Q==
X-Google-Smtp-Source: 
 AGRyM1vIDilVrEof1N2W1VQEBDBAqI1wr/gv8rt1oZ1R9ldjOrHXhEJsQFCfbI/QgnkDasOBOZqzRq1KQ1BTZskeEHc=
X-Received: by 2002:a05:6402:1606:b0:43a:2204:8b5e with SMTP id
 f6-20020a056402160600b0043a22048b5emr40569986edv.316.1658204508018; Mon, 18
 Jul 2022 21:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220707163827.857-1-bruce.ashfield@gmail.com>
 <20220707163827.857-2-bruce.ashfield@gmail.com>
 <1702FEA99540B493.2228@lists.openembedded.org>
 <20220718181931.GS18692@denix.org>
 <CADkTA4NaNFcJomJB4J8v1tUiKW+ZuBhQCc4rhCRauSN+j96c+A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NaNFcJomJB4J8v1tUiKW+ZuBhQCc4rhCRauSN+j96c+A@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Jul 2022 18:21:35 -1000
Message-ID: 
 <CAOSpxdbPKCRS255ais4WDfoQC9LfWsywsCq02aOBfpQOv0kkpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2][dunfell] linux-yocto/5.4: update to
 v5.4.203
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000aa6b8005e420d2d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 04:21:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168272

--000000000000aa6b8005e420d2d4
Content-Type: text/plain; charset="UTF-8"

Thanks Bruce!

Steve

On Mon, Jul 18, 2022, 5:46 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> We fixed this for 5.10/5.15, but missed 5.4.
>
> I ported the fix from those kernels to 5.4, and it now builds fine here.
>
> patch has been sent to the list.
>
> Bruce
>
> On Mon, Jul 18, 2022 at 2:19 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > Oops, Richard's alias didn't get resolved properly the first time, sorry
> >
> > On Mon, Jul 18, 2022 at 02:06:52PM -0400, Denys Dmytriyenko wrote:
> > > There's been some rework done around random subsystem lately. It now
> breaks RT
> > > kernel, at least on Aarch64, x86_64, maybe other platforms. Is there a
> quick
> > > fix, or should this update be reverted in Dunfell?
> > >
> > >
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:39:45:
> warning: 'struct random_ready_callback' declared inside parameter list will
> not be visible outside of this definition or declaration
> > > |    39 | extern int add_random_ready_callback(struct
> random_ready_callback *rdy);
> > > |       |
>  ^~~~~~~~~~~~~~~~~~~~~
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:40:46:
> warning: 'struct random_ready_callback' declared inside parameter list will
> not be visible outside of this definition or declaration
> > > |    40 | extern void del_random_ready_callback(struct
> random_ready_callback *rdy);
> > > |       |
> ^~~~~~~~~~~~~~~~~~~~~
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:47:6:
> error: conflicting types for 'get_random_bytes'
> > > |    47 | void get_random_bytes(void *buf, size_t len);
> > > |       |      ^~~~~~~~~~~~~~~~
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:35:13:
> note: previous declaration of 'get_random_bytes' was here
> > > |    35 | extern void get_random_bytes(void *buf, int nbytes);
> > > |       |             ^~~~~~~~~~~~~~~~
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:48:21:
> error: conflicting types for 'get_random_bytes_arch'
> > > |    48 | size_t __must_check get_random_bytes_arch(void *buf, size_t
> len);
> > > |       |                     ^~~~~~~~~~~~~~~~~~~~~
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:41:25:
> note: previous declaration of 'get_random_bytes_arch' was here
> > > |    41 | extern int __must_check get_random_bytes_arch(void *buf, int
> nbytes);
> > > |       |                         ^~~~~~~~~~~~~~~~~~~~~
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/scripts/Makefile.build:99:
> recipe for target 'arch/arm64/kernel/asm-offsets.s' failed
> > > | make[2]: *** [arch/arm64/kernel/asm-offsets.s] Error 1
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:1134:
> recipe for target 'prepare0' failed
> > > | make[1]: *** [prepare0] Error 2
> > > |
> /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:179:
> recipe for target 'sub-make' failed
> > > | make: *** [sub-make] Error 2
> > > | ERROR: oe_runmake failed
> > > | WARNING: exit code 1 from a shell command.
> > > | ERROR: Execution of
> '/OE/poky-dunfell/build/tmp/work/qemuarm64-poky-linux/linux-yocto-rt/5.4.203+gitAUTOINC+010ac788e8_fa8536530b-r0/temp/run.do_compile.240410'
> failed with exit code 1
> > > ERROR: Task
> (/OE/poky-dunfell/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb:do_compile)
> failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 586 tasks of which 465 didn't need to
> be rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >   /OE/poky-dunfell/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb:
> do_compile
> > > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> > >
> > >
> > > On Thu, Jul 07, 2022 at 12:38:27PM -0400, Bruce Ashfield wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Updating  to the latest korg -stable release that comprises
> > > > the following commits:
> > > >
> > > >     871cbc208bf0 Linux 5.4.203
> > > >     572cc34503d4 crypto: arm/ghash-ce - define fpu before fpu
> registers are referenced
> > > >     3bf992f9d9a8 crypto: arm - use Kconfig based compiler checks for
> crypto opcodes
> > > >     1b43c30cd5d5 ARM: 9029/1: Make iwmmxt.S support Clang's
> integrated assembler
> > > >     9e00e5d195ed ARM: OMAP2+: drop unnecessary adrl
> > > >     3657432a75e3 ARM: 8929/1: use APSR_nzcv instead of r15 as mrc
> operand
> > > >     02c200fdba46 ARM: 8933/1: replace Sun/Solaris style flag on
> section directive
> > > >     54e6ecd5b7ca crypto: arm/sha512-neon - avoid ADRL pseudo
> instruction
> > > >     5e6f80033286 crypto: arm/sha256-neon - avoid ADRL pseudo
> instruction
> > > >     e120403c0e7c ARM: 8971/1: replace the sole use of a symbol with
> its definition
> > > >     0a43679016f0 ARM: 8990/1: use VFP assembler mnemonics in
> register load/store macros
> > > >     472671eec98a ARM: 8989/1: use .fpu assembler directives instead
> of assembler arguments
> > > >     2bfb0d43a47c net: mscc: ocelot: allow unregistered IP multicast
> flooding
> > > >     223d551a6681 kexec_file: drop weak attribute from
> arch_kexec_apply_relocations[_add]
> > > >     ab3ed204a146 powerpc/ftrace: Remove ftrace init tramp once
> kernel init is complete
> > > >     77e2ad091850 drm: remove drm_fb_helper_modinit
> > > >     9ef3ad40a81f Linux 5.4.202
> > > >     ceda71d49f6b powerpc/pseries: wire up rng during setup_arch()
> > > >     ece983890287 kbuild: link vmlinux only once for
> CONFIG_TRIM_UNUSED_KSYMS (2nd attempt)
> > > >     2a81e813141e random: update comment from copy_to_user() ->
> copy_to_iter()
> > > >     80f0038d757e modpost: fix section mismatch check for exported
> init/exit sections
> > > >     d1359e4129ad ARM: cns3xxx: Fix refcount leak in cns3xxx_init
> > > >     29ca9c4efacc ARM: Fix refcount leak in axxia_boot_secondary
> > > >     734a4d15142b soc: bcm: brcmstb: pm: pm-arm: Fix refcount leak in
> brcmstb_pm_probe
> > > >     f9b77a529375 ARM: exynos: Fix refcount leak in exynos_map_pmu
> > > >     615907ccc421 ARM: dts: imx6qdl: correct PU regulator ramp delay
> > > >     93e6137d2a5b powerpc/powernv: wire up rng during setup_arch
> > > >     97808c781721 powerpc/rtas: Allow ibm,platform-dump RTAS call
> with null buffer address
> > > >     b6232979320a powerpc: Enable execve syscall exit tracepoint
> > > >     e0701f150b28 parisc: Enable ARCH_HAS_STRICT_MODULE_RWX
> > > >     e5234a9d64a9 xtensa: Fix refcount leak bug in time.c
> > > >     a52972ee706b xtensa: xtfpga: Fix refcount leak bug in setup
> > > >     f0fc7cdf5f19 iio: adc: axp288: Override TS pin bias current for
> some models
> > > >     11c7ea38be91 iio: adc: stm32: fix maximum clock rate for
> stm32mp15x
> > > >     5e39397d60da iio: trigger: sysfs: fix use-after-free on remove
> > > >     6d2e68d02171 iio: gyro: mpu3050: Fix the error handling in
> mpu3050_power_up()
> > > >     1ad6d668543d iio: accel: mma8452: ignore the return value of
> reset operation
> > > >     a391bced8404 iio:accel:mxc4005: rearrange iio trigger get and
> register
> > > >     23c158caa032 iio:accel:bma180: rearrange iio trigger get and
> register
> > > >     8ea16a64aafc iio:chemical:ccs811: rearrange iio trigger get and
> register
> > > >     2333db14d875 usb: chipidea: udc: check request status before
> setting device address
> > > >     47e41b4dabbf xhci: turn off port power in shutdown
> > > >     d62d1c606db0 iio: adc: vf610: fix conversion mode sysfs node name
> > > >     741b6c8363c2 s390/cpumf: Handle events cycles and instructions
> identical
> > > >     4837d1c81223 gpio: winbond: Fix error code in winbond_gpio_get()
> > > >     bb18ad00c0b7 Revert "net/tls: fix tls_sk_proto_close executed
> repeatedly"
> > > >     8c7a32b7c155 virtio_net: fix xdp_rxq_info bug after
> suspend/resume
> > > >     28a78414f21e igb: Make DMA faster when CPU is active on the PCIe
> link
> > > >     a5ed066bc246 regmap-irq: Fix a bug in regmap_irq_enable() for
> type_in_mask chips
> > > >     844168a5dabf ice: ethtool: advertise 1000M speeds properly
> > > >     e3a232e57670 afs: Fix dynamic root getattr
> > > >     cacab1e620e0 MIPS: Remove repetitive increase irq_err_count
> > > >     788c954f194c x86/xen: Remove undefined behavior in
> setup_features()
> > > >     c7bdaad9cbfe udmabuf: add back sanity check
> > > >     05c6c36c7931 net/tls: fix tls_sk_proto_close executed repeatedly
> > > >     02da602bc2f3 erspan: do not assume transport header is always set
> > > >     d1592d3e362c drm/msm/mdp4: Fix refcount leak in
> mdp4_modeset_init_intf
> > > >     f1f9c2a5a3d9 net/sched: sch_netem: Fix arithmetic in
> netem_dump() for 32-bit platforms
> > > >     47d31b97bf47 bonding: ARP monitor spams NETDEV_NOTIFY_PEERS
> notifiers
> > > >     104a59b74577 phy: aquantia: Fix AN when higher speeds than 1G
> are not advertised
> > > >     8ffe2e50e967 bpf: Fix request_sock leak in sk lookup helpers
> > > >     f074ab253988 USB: serial: option: add Quectel RM500K module
> support
> > > >     ea7b23eadebc USB: serial: option: add Quectel EM05-G modem
> > > >     613c849d73df USB: serial: option: add Telit LE910Cx 0x1250
> composition
> > > >     ae183969bd66 random: quiet urandom warning ratelimit suppression
> message
> > > >     06a24ddba93a dm mirror log: clear log bits up to BITS_PER_LONG
> boundary
> > > >     1f350f3cf0c1 dm era: commit metadata in postsuspend after worker
> stops
> > > >     0e75acbe1b76 ata: libata: add qc->flags in
> ata_qc_complete_template tracepoint
> > > >     71c76f56b97c mtd: rawnand: gpmi: Fix setting busy timeout setting
> > > >     c8d37e6ca180 mmc: sdhci-pci-o2micro: Fix card detect by dealing
> with debouncing
> > > >     af28f602df74 net: openvswitch: fix parsing of nw_proto for IPv6
> fragments
> > > >     6fda65dabd3e ALSA: hda/realtek: Add quirk for Clevo PD70PNT
> > > >     5fbad99e76c0 ALSA: hda/realtek - ALC897 headset MIC no sound
> > > >     cf81f367cf81 ALSA: hda/conexant: Fix missing beep setup
> > > >     eca9b5e36e24 ALSA: hda/via: Fix missing beep setup
> > > >     1df5178fdebe random: schedule mix_interrupt_randomness() less
> often
> > > >     c87e851b23e5 vt: drop old FONT ioctls
> > > >     23db944f754e Linux 5.4.201
> > > >     3994d2ee55e2 Revert "hwmon: Make chip parameter for with_info
> API mandatory"
> > > >     7b9c3bfbad25 arm64: mm: Don't invalidate FROM_DEVICE buffers at
> start of DMA transfer
> > > >     2e1591c27b95 tcp: drop the hash_32() part from the index
> calculation
> > > >     c26e1addf157 tcp: increase source port perturb table to 2^16
> > > >     77d29f3b18c4 tcp: dynamically allocate the perturb table used by
> source ports
> > > >     7c0a777b7dbd tcp: add small random increments to the source port
> > > >     53c5de3092ad tcp: use different parts of the port_offset for
> index and offset
> > > >     95921a3bab76 tcp: add some entropy in __inet_hash_connect()
> > > >     bdcbf2602feb usb: gadget: u_ether: fix regression in setting
> fixed MAC address
> > > >     2577d67a9a8a dm: remove special-casing of bio-based immutable
> singleton target on NVMe
> > > >     4143503b486a s390/mm: use non-quiescing sske for KVM switch to
> keyed guest
> > > >     f0c280af0ec7 Linux 5.4.200
> > > >     ab8dff4b716e powerpc/mm: Switch obsolete dssall to .long
> > > >     1a48a41f1422 riscv: Less inefficient gcc tishift helpers (and
> export their symbols)
> > > >     2464a1c0de53 RISC-V: fix barrier() use in <vdso/processor.h>
> > > >     490a02cd8205 arm64: kprobes: Use BRK instead of single-step when
> executing instructions out-of-line
> > > >     ef6f9ce0a79a net: openvswitch: fix leak of nested actions
> > > >     6bb3c77c74f5 net: openvswitch: fix misuse of the cached
> connection on tuple changes
> > > >     b47319b4aa21 net/sched: act_police: more accurate MTU policing
> > > >     13fbdea1184b virtio-pci: Remove wrong address verification in
> vp_del_vqs()
> > > >     80e4d8a27451 ALSA: hda/realtek: fix right sounds and
> mute/micmute LEDs for HP machine
> > > >     119e0268cc1c ALSA: hda/realtek: fix mute/micmute LEDs for HP 440
> G8
> > > >     fba542891767 ext4: add reserved GDT blocks check
> > > >     4ca0d2f1e04e ext4: make variable "count" signed
> > > >     a6b31616e5af ext4: fix bug_on ext4_mb_use_inode_pa
> > > >     ae4603128751 dm mirror log: round up region bitmap size to
> BITS_PER_LONG
> > > >     64d2df648003 serial: 8250: Store to lsr_save_flags after lsr read
> > > >     b75bddfcc181 usb: gadget: lpc32xx_udc: Fix refcount leak in
> lpc32xx_udc_probe
> > > >     6506aff2dc2f usb: dwc2: Fix memory leak in dwc2_hcd_init
> > > >     940653b51c33 USB: serial: io_ti: add Agilent E5805A support
> > > >     31363b2b868e USB: serial: option: add support for Cinterion MV31
> with new baseline
> > > >     d0c3730f2763 comedi: vmk80xx: fix expression for tx buffer size
> > > >     bf833c484881 i2c: designware: Use standard optional ref clock
> implementation
> > > >     8d884c08eeb8 irqchip/gic-v3: Fix refcount leak in
> gic_populate_ppi_partitions
> > > >     58e67c81e229 irqchip/gic-v3: Fix error handling in
> gic_populate_ppi_partitions
> > > >     56526c3883fc irqchip/gic/realview: Fix refcount leak in
> realview_gic_of_init
> > > >     4695bafabf5b faddr2line: Fix overlapping text section failures,
> the sequel
> > > >     1b34d6a93832 certs/blacklist_hashes.c: fix const confusion in
> certs blacklist
> > > >     fb775ee3cfff arm64: ftrace: fix branch range checks
> > > >     0e21311ba459 net: bgmac: Fix an erroneous kfree() in
> bgmac_remove()
> > > >     c19cdd72b3ec mlxsw: spectrum_cnt: Reorder counter pools
> > > >     c03304dc4234 misc: atmel-ssc: Fix IRQ check in ssc_probe
> > > >     f7183c76d500 tty: goldfish: Fix free_irq() on remove
> > > >     ff6e03fe84bc i40e: Fix call trace in setup_tx_descriptors
> > > >     4b94408e1617 i40e: Fix calculating the number of queue pairs
> > > >     43f65970eeb2 i40e: Fix adding ADQ filter to TC0
> > > >     cff3a7ce6e81 clocksource: hyper-v: unexport __init-annotated
> hv_init_clocksource()
> > > >     11c870c0b532 pNFS: Don't keep retrying if the server replied
> NFS4ERR_LAYOUTUNAVAILABLE
> > > >     e32fe87afcfe random: credit cpu and bootloader seeds by default
> > > >     9e4cab02b7ec net: ethernet: mtk_eth_soc: fix misuse of mem alloc
> interface netdev[napi]_alloc_frag
> > > >     2f42389d270f ipv6: Fix signed integer overflow in
> l2tp_ip6_sendmsg
> > > >     6b4d8b44e716 nfc: nfcmrvl: Fix memory leak in
> nfcmrvl_play_deferred
> > > >     786428a1dec2 virtio-mmio: fix missing put_device() when
> vm_cmdline_parent registration failed
> > > >     aacb264d54c4 ALSA: hda/realtek - Add HW8326 support
> > > >     ff882404dff7 scsi: pmcraid: Fix missing resource cleanup in
> error case
> > > >     c48119223618 scsi: ipr: Fix missing/incorrect resource cleanup
> in error case
> > > >     fe0855944a64 scsi: lpfc: Allow reduced polling rate for
> nvme_admin_async_event cmd completion
> > > >     1f1be79189fd scsi: lpfc: Fix port stuck in bypassed state after
> LIP in PT2PT topology
> > > >     001de3d8ce82 scsi: vmw_pvscsi: Expand vcpuHint to 16 bits
> > > >     9e3a0d3fc71c ASoC: wm_adsp: Fix event generation for
> wm_adsp_fw_put()
> > > >     bc046649c5d6 ASoC: es8328: Fix event generation for deemphasis
> control
> > > >     a81f5a7f7a20 ASoC: wm8962: Fix suspend while playing music
> > > >     253334f84c81 ata: libata-core: fix NULL pointer deref in
> ata_host_alloc_pinfo()
> > > >     052cd621acbf ASoC: cs42l56: Correct typo in minimum level for SX
> volume controls
> > > >     6d180913b3ab ASoC: cs42l52: Correct TLV for Bypass Volume
> > > >     385a031c56a9 ASoC: cs53l30: Correct number of volume levels on
> SX controls
> > > >     675b6a49cf70 ASoC: cs35l36: Update digital volume TLV
> > > >     b00f63dba5b8 ASoC: cs42l52: Fix TLV scales for mixer controls
> > > >     cd8c1e6c01f1 dma-debug: make things less spammy under memory
> pressure
> > > >     a45e19fd6ed8 ASoC: nau8822: Add operation for internal PLL off
> and on
> > > >     348831a9e8aa powerpc/kasan: Silence KASAN warnings in
> __get_wchan()
> > > >     5624055c8f4b random: account for arch randomness in bits
> > > >     c0bf6bfce70a random: mark bootloader randomness code as __init
> > > >     f96250197b43 random: avoid checking crng_ready() twice in
> random_init()
> > > >     072cd87d12a8 crypto: drbg - make reseeding from
> get_random_bytes() synchronous
> > > >     e9eb0c4741a7 crypto: drbg - always try to free Jitter RNG
> instance
> > > >     f284afc3a9ca crypto: drbg - move dynamic ->reseed_threshold
> adjustments to __drbg_seed()
> > > >     babba4bf53a6 crypto: drbg - track whether DRBG was seeded with
> !rng_is_initialized()
> > > >     1b93b302e942 crypto: drbg - prepare for more fine-grained
> tracking of seeding state
> > > >     98e574a73414 crypto: drbg - always seeded with SP800-90B
> compliant noise source
> > > >     61f87ea3f957 Revert "random: use static branch for crng_ready()"
> > > >     3faf33a85650 random: check for signals after page of pool writes
> > > >     2177cef53ec9 random: wire up fops->splice_{read,write}_iter()
> > > >     35db2a073118 random: convert to using fops->write_iter()
> > > >     43e62db84a99 random: convert to using fops->read_iter()
> > > >     c23188facd10 random: unify batched entropy implementations
> > > >     1aeedbe02b5c random: move randomize_page() into mm where it
> belongs
> > > >     ceaf1feefe6e random: move initialization functions out of hot
> pages
> > > >     d3bf98d61fb6 random: make consistent use of buf and len
> > > >     70fce7f105bb random: use proper return types on
> get_random_{int,long}_wait()
> > > >     d05948dc23e6 random: remove extern from functions in header
> > > >     d8b4296417ea random: use static branch for crng_ready()
> > > >     087a14b9cf9b random: credit architectural init the exact amount
> > > >     ac48f7bee198 random: handle latent entropy and command line from
> random_init()
> > > >     736a22645d98 random: use proper jiffies comparison macro
> > > >     3266fba20661 random: remove ratelimiting for in-kernel unseeded
> randomness
> > > >     c5373bd6e4fb random: move initialization out of reseeding hot
> path
> > > >     0747ad152fa1 random: avoid initializing twice in credit race
> > > >     0baeec0effc7 random: use symbolic constants for crng_init states
> > > >     55d64df3ad5b siphash: use one source of truth for siphash
> permutations
> > > >     e4e8a9f8a616 random: help compiler out with fast_mix() by using
> simpler arguments
> > > >     bf3b51eb0f13 random: do not use input pool from hard IRQs
> > > >     6d4203a2cddc random: order timer entropy functions below
> interrupt functions
> > > >     58da574f105a random: do not pretend to handle premature next
> security model
> > > >     e739d5bd1466 random: use first 128 bits of input as fast init
> > > >     c44f8b386376 random: do not use batches when !crng_ready()
> > > >     e247ea8d97bf random: insist on random_get_entropy() existing in
> order to simplify
> > > >     9bfbcb37e5f6 xtensa: use fallback for random_get_entropy()
> instead of zero
> > > >     fa15650b51f6 sparc: use fallback for random_get_entropy()
> instead of zero
> > > >     9dfc14590c5d um: use fallback for random_get_entropy() instead
> of zero
> > > >     0cc41e2c73f7 x86/tsc: Use fallback for random_get_entropy()
> instead of zero
> > > >     f2a6e8727084 nios2: use fallback for random_get_entropy()
> instead of zero
> > > >     db1d13fe4c80 arm: use fallback for random_get_entropy() instead
> of zero
> > > >     6fa912f987fa mips: use fallback for random_get_entropy() instead
> of just c0 random
> > > >     36f38f838c5b m68k: use fallback for random_get_entropy() instead
> of zero
> > > >     a7d04ca9da61 timekeeping: Add raw clock fallback for
> random_get_entropy()
> > > >     eb2f9d72f32a powerpc: define get_cycles macro for arch-override
> > > >     10455a367c33 alpha: define get_cycles macro for arch-override
> > > >     5f0b77ca1978 parisc: define get_cycles macro for arch-override
> > > >     80459abc9fee s390: define get_cycles macro for arch-override
> > > >     73385644490a ia64: define get_cycles macro for arch-override
> > > >     5fac86663976 init: call time_init() before rand_initialize()
> > > >     b88ae87b100c random: fix sysctl documentation nits
> > > >     465425748359 random: document crng_fast_key_erasure()
> destination possibility
> > > >     ec07b3494517 random: make random_get_entropy() return an
> unsigned long
> > > >     fe156368f987 random: allow partial reads if later user copies
> fail
> > > >     70788723da70 random: check for signals every PAGE_SIZE chunk of
> /dev/[u]random
> > > >     2ce859d91fe9 random: check for signal_pending() outside of
> need_resched() check
> > > >     0e8030c9e03d random: do not allow user to keep crng key around
> on stack
> > > >     95aed891f7be random: do not split fast init input in
> add_hwgenerator_randomness()
> > > >     1d53d5a0973e random: mix build-time latent entropy into pool at
> init
> > > >     0aba75c6173d random: re-add removed comment about
> get_random_{u32,u64} reseeding
> > > >     81ea8a609b48 random: treat bootloader trust toggle the same way
> as cpu trust toggle
> > > >     a08d52a6081b random: skip fast_init if hwrng provides large
> chunk of entropy
> > > >     8320bc665c29 random: check for signal and try earlier when
> generating entropy
> > > >     3a53b818bb0e random: reseed more often immediately after booting
> > > >     905759e0fc17 random: make consistent usage of crng_ready()
> > > >     ad4c6bd98c54 random: use SipHash as interrupt entropy accumulator
> > > >     631503001ccf random: replace custom notifier chain with standard
> one
> > > >     1ae73fb2a635 random: don't let 644 read-only sysctls be written
> to
> > > >     ed409757100b random: give sysctl_random_min_urandom_seed a more
> sensible value
> > > >     75d95c1b5dea random: do crng pre-init loading in worker rather
> than irq
> > > >     219c84fe93e5 random: unify cycles_t and jiffies usage and types
> > > >     673637c4c9e0 random: cleanup UUID handling
> > > >     4d5151cc288a random: only wake up writers after zap if threshold
> was passed
> > > >     ac0081dec7d6 random: round-robin registers as ulong, not u32
> > > >     62cd795e465a random: clear fast pool, crng, and batches in cpuhp
> bring up
> > > >     a7f8f385bb6f random: pull add_hwgenerator_randomness()
> declaration into random.h
> > > >     ff607fc7607d random: check for crng_init == 0 in
> add_device_randomness()
> > > >     20788eb4ce70 random: unify early init crng load accounting
> > > >     49567f947735 random: do not take pool spinlock at boot
> > > >     4a61bf7f9b18 random: defer fast pool mixing to worker
> > > >     944d1bd0e5be random: rewrite header introductory comment
> > > >     c0e35949c736 random: group sysctl functions
> > > >     d946084180ee random: group userspace read/write functions
> > > >     565a66043bdf random: group entropy collection functions
> > > >     f2d587c493fc random: group entropy extraction functions
> > > >     a8786d54762f random: group crng functions
> > > >     c12dfec1aacf random: group initialization wait functions
> > > >     22e3db57ab94 random: remove whitespace and reorder includes
> > > >     cee64be60591 random: remove useless header comment
> > > >     904e6123c400 random: introduce drain_entropy() helper to
> declutter crng_reseed()
> > > >     47c56790d51c random: deobfuscate irq u32/u64 contributions
> > > >     e280b79c3127 random: add proper SPDX header
> > > >     776927dfd4ac random: remove unused tracepoints
> > > >     d68883956d36 random: remove ifdef'd out interrupt bench
> > > >     4a14a5a6969a random: tie batched entropy generation to base_crng
> generation
> > > >     d8a6684950c1 random: fix locking for crng_init in crng_reseed()
> > > >     b1d561138150 random: zero buffer after reading entropy from
> userspace
> > > >     21da00f8cb3a random: remove outdated INT_MAX >> 6 check in
> urandom_read()
> > > >     b530684129b2 random: make more consistent use of integer types
> > > >     3eed6af93ecd random: use hash function for crng_slow_load()
> > > >     cee3c7056900 random: use simpler fast key erasure flow on
> per-cpu keys
> > > >     ea9941fd6e26 random: absorb fast pool into input pool after fast
> load
> > > >     a3562bf4e8c9 random: do not xor RDRAND when writing into
> /dev/random
> > > >     574c8839504b random: ensure early RDSEED goes through mixer on
> init
> > > >     d3d3c1c214c3 random: inline leaves of rand_initialize()
> > > >     817315517af9 random: get rid of secondary crngs
> > > >     c15fc80b7df0 random: use RDSEED instead of RDRAND in entropy
> extraction
> > > >     72db8151c889 random: fix locking in crng_fast_load()
> > > >     7229c6d90a1a random: remove batched entropy locking
> > > >     6c8911579221 random: remove use_input_pool parameter from
> crng_reseed()
> > > >     4ef908fb81d9 random: make credit_entropy_bits() always safe
> > > >     42a9a7e80750 random: always wake up entropy writers after
> extraction
> > > >     373ef51f3e8a random: use linear min-entropy accumulation
> crediting
> > > >     a1a2bae5ef93 random: simplify entropy debiting
> > > >     4e5814bd2e75 random: use computational hash for entropy
> extraction
> > > >     99a0f8e22d4c random: only call crng_finalize_init() for
> primary_crng
> > > >     88609b892fdd random: access primary_pool directly rather than
> through pointer
> > > >     0b9f9b94f1ea random: continually use hwgenerator randomness
> > > >     811e333c4eb2 random: simplify arithmetic function flow in
> account()
> > > >     56de23dcf9d0 random: selectively clang-format where it makes
> sense
> > > >     86eac12b1cf5 random: access input_pool_data directly rather than
> through pointer
> > > >     4f5400ca7fc1 random: cleanup fractional entropy shift constants
> > > >     1b6f1d32a858 random: prepend remaining pool constants with POOL_
> > > >     0fe4a64fd946 random: de-duplicate INPUT_POOL constants
> > > >     e35576c4cb18 random: remove unused OUTPUT_POOL constants
> > > >     74cb3093f2de random: rather than entropy_store abstraction, use
> global
> > > >     14652d864280 random: remove unused extract_entropy() reserved
> argument
> > > >     12f17e3f3a14 random: remove incomplete last_data logic
> > > >     adcbbb44ccc1 random: cleanup integer types
> > > >     4ac4c7f057ff random: cleanup poolinfo abstraction
> > > >     5c3818e3bd7b random: fix typo in comments
> > > >     0a7e65810269 random: don't reset crng_init_cnt on urandom_read()
> > > >     8d7c55563ed0 random: avoid superfluous call to RDRAND in CRNG
> extraction
> > > >     8b4695640bc5 random: early initialization of ChaCha constants
> > > >     cfc69065005e random: initialize ChaCha20 constants with correct
> endianness
> > > >     922d082e3363 random: use IS_ENABLED(CONFIG_NUMA) instead of
> ifdefs
> > > >     565b3af16894 random: harmonize "crng init done" messages
> > > >     346c4a697c29 random: mix bootloader randomness into pool
> > > >     afce74c0c04f random: do not re-init if crng_reseed completes
> before primary init
> > > >     d76758c71209 random: do not sign extend bytes for rotation when
> mixing
> > > >     c2f0a89cd1d5 random: use BLAKE2s instead of SHA1 in extraction
> > > >     6e6ae70c1eac random: remove unused irq_flags argument from
> add_interrupt_randomness()
> > > >     2580b0b3fd5a random: document add_hwgenerator_randomness() with
> other input functions
> > > >     3cc36a4aa1ca crypto: blake2s - adjust include guard naming
> > > >     09342a544c4b crypto: blake2s - include <linux/bug.h> instead of
> <asm/bug.h>
> > > >     f850f3643d6b MAINTAINERS: co-maintain random.c
> > > >     967e3a136f9b random: remove dead code left over from blocking
> pool
> > > >     610f0b439a6b random: avoid arch_get_random_seed_long() when
> collecting IRQ randomness
> > > >     ad3fce669105 random: add arch_get_random_*long_early()
> > > >     41b0d3e86c50 powerpc: Use bool in archrandom.h
> > > >     89533373e11c linux/random.h: Mark CONFIG_ARCH_RANDOM functions
> __must_check
> > > >     0222f9f1d168 linux/random.h: Use false with bool
> > > >     15f93060b718 linux/random.h: Remove arch_has_random,
> arch_has_random_seed
> > > >     a95ed04e21da s390: Remove arch_has_random, arch_has_random_seed
> > > >     aab52172d9f9 powerpc: Remove arch_has_random,
> arch_has_random_seed
> > > >     35e28a05f659 x86: Remove arch_has_random, arch_has_random_seed
> > > >     98f749e29728 random: avoid warnings for !CONFIG_NUMA builds
> > > >     c13b9c3627d8 random: split primary/secondary crng init paths
> > > >     c070b07aaf34 random: remove some dead code of poolinfo
> > > >     898498bb4414 random: fix typo in add_timer_randomness()
> > > >     2c53d6d6a7be random: Add and use pr_fmt()
> > > >     f3375cfe31bc random: convert to ENTROPY_BITS for better code
> readability
> > > >     9f757cad20b7 random: remove unnecessary unlikely()
> > > >     4431c366fe23 random: remove kernel.random.read_wakeup_threshold
> > > >     ec134003cc39 random: delete code to pull data into pools
> > > >     a9564e14c6dd random: remove the blocking pool
> > > >     940cbc47b369 random: make /dev/random be almost like /dev/urandom
> > > >     c4edc1055c11 random: ignore GRND_RANDOM in getentropy(2)
> > > >     7f9f864af021 random: add GRND_INSECURE to return best-effort
> non-cryptographic bytes
> > > >     479d39707ff7 random: Add a urandom_read_nowait() for random APIs
> that don't warn
> > > >     69441ba56f13 random: Don't wake crng_init_wait when crng_init ==
> 1
> > > >     69ef3109d422 random: don't forget compat_ioctl on urandom
> > > >     927fc225af29 compat_ioctl: remove /dev/random commands
> > > >     996fba14fa35 lib/crypto: sha1: re-roll loops to reduce code size
> > > >     c4f48374407b lib/crypto: blake2s: move hmac construction into
> wireguard
> > > >     97126d2f65b3 crypto: blake2s - generic C library implementation
> and selftest
> > > >     76101f1b7f59 nfc: st21nfca: fix incorrect sizing calculations in
> EVT_TRANSACTION
> > > >     e804587ecdcd bpf: Fix incorrect memory charge cost calculation
> in stack_map_alloc()
> > > >     f91da317e6fa 9p: missing chunk of "fs/9p: Don't update file type
> when updating file attributes"
> > > >
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
> > > >  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
> > > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22
> +++++++++----------
> > > >  3 files changed, 18 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > > index 2fef4f032d..7fa1b81229 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > > @@ -11,13 +11,13 @@ python () {
> > > >          raise bb.parse.SkipRecipe("Set
> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > > >  }
> > > >
> > > > -SRCREV_machine ?= "d7693f19702e1fa1bb18507260198478cba0d6a2"
> > > > -SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
> > > > +SRCREV_machine ?= "fa8536530bdd6a87856aa6fe0af4f9ef4af21fe0"
> > > > +SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
> > > >
> > > >  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
> \
> > > >             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=$%7BKMETA%7D>
> "
> > > >
> > > > -LINUX_VERSION ?= "5.4.199"
> > > > +LINUX_VERSION ?= "5.4.203"
> > > >
> > > >  LIC_FILES_CHKSUM =
> "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > > index 32ff438a57..d08658cf7e 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > > @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
> > > >
> > > >  require recipes-kernel/linux/linux-yocto.inc
> > > >
> > > > -LINUX_VERSION ?= "5.4.199"
> > > > +LINUX_VERSION ?= "5.4.203"
> > > >  LIC_FILES_CHKSUM =
> "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > >
> > > >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native',
> '', d)}"
> > > > @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> > > >  KMETA = "kernel-meta"
> > > >  KCONF_BSP_AUDIT_LEVEL = "2"
> > > >
> > > > -SRCREV_machine_qemuarm ?= "a117c8494d49f5ab6ec54a69c0f926bad5d55616"
> > > > -SRCREV_machine ?= "fbc1147bd48ea6b51895e8ab9d6422d112cdd58a"
> > > > -SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
> > > > +SRCREV_machine_qemuarm ?= "d92cd7d5916772a20105ef776c7f3bf433df55a4"
> > > > +SRCREV_machine ?= "5f7c3e952857eb90a4113a41901bb770150af46b"
> > > > +SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
> > > >
> > > >  PV = "${LINUX_VERSION}+git${SRCPV}"
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > > index e2130386b2..545c754c1d 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > > @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
> > > >  KBRANCH_qemux86-64 ?= "v5.4/standard/base"
> > > >  KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
> > > >
> > > > -SRCREV_machine_qemuarm ?= "3bc1fc1cd35bd8f95e80fb49627c2f6977debc84"
> > > > -SRCREV_machine_qemuarm64 ?=
> "c048122124fdbd78d02ac64ef6558503e7536f7b"
> > > > -SRCREV_machine_qemumips ?=
> "19fc003e228a56e30943ddcba0614de6365e2740"
> > > > -SRCREV_machine_qemuppc ?= "ef263615ec81ddfac29c82c5c61f6195dde31944"
> > > > -SRCREV_machine_qemuriscv64 ?=
> "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
> > > > -SRCREV_machine_qemux86 ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
> > > > -SRCREV_machine_qemux86-64 ?=
> "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
> > > > -SRCREV_machine_qemumips64 ?=
> "9ee7899b379b865fe676d50be29162845c9a9ee3"
> > > > -SRCREV_machine ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
> > > > -SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
> > > > +SRCREV_machine_qemuarm ?= "bf4029e0d9ff2e65d654909d7e9df50dce294c77"
> > > > +SRCREV_machine_qemuarm64 ?=
> "3e0dab732964f7bbc26671fee05be420fd02890a"
> > > > +SRCREV_machine_qemumips ?=
> "e8bea70e0c6a527383f2351e4f3d189aedf543a3"
> > > > +SRCREV_machine_qemuppc ?= "24cc2a066b8151925fdf86136b70b63cf37cc540"
> > > > +SRCREV_machine_qemuriscv64 ?=
> "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
> > > > +SRCREV_machine_qemux86 ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
> > > > +SRCREV_machine_qemux86-64 ?=
> "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
> > > > +SRCREV_machine_qemumips64 ?=
> "5a5e07ef8df0e73b2f318b921f9262b49a6125d5"
> > > > +SRCREV_machine ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
> > > > +SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
> > > >
> > > >  # remap qemuarm to qemuarma15 for the 5.4 kernel
> > > >  # KMACHINE_qemuarm ?= "qemuarma15"
> > > > @@ -30,7 +30,7 @@ SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRA>
> > > >             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=$%7BKMETA%7D>
> "
> > > >
> > > >  LIC_FILES_CHKSUM =
> "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > > -LINUX_VERSION ?= "5.4.199"
> > > > +LINUX_VERSION ?= "5.4.203"
> > > >
> > > >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native',
> '', d)}"
> > > >  DEPENDS += "openssl-native util-linux-native"
> > > > --
> > > > 2.19.1
> > > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000aa6b8005e420d2d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Bruce!<div dir=3D"auto"><br></div><div dir=3D"auto=
">Steve</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Jul 18, 2022, 5:46 PM Bruce Ashfield &lt;<a href=3D"ma=
ilto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">We fixed this for 5.10/5.15, but missed=
 5.4.<br>
<br>
I ported the fix from those kernels to 5.4, and it now builds fine here.<br=
>
<br>
patch has been sent to the list.<br>
<br>
Bruce<br>
<br>
On Mon, Jul 18, 2022 at 2:19 PM Denys Dmytriyenko &lt;<a href=3D"mailto:den=
is@denix.org" target=3D"_blank" rel=3D"noreferrer">denis@denix.org</a>&gt; =
wrote:<br>
&gt;<br>
&gt; Oops, Richard&#39;s alias didn&#39;t get resolved properly the first t=
ime, sorry<br>
&gt;<br>
&gt; On Mon, Jul 18, 2022 at 02:06:52PM -0400, Denys Dmytriyenko wrote:<br>
&gt; &gt; There&#39;s been some rework done around random subsystem lately.=
 It now breaks RT<br>
&gt; &gt; kernel, at least on Aarch64, x86_64, maybe other platforms. Is th=
ere a quick<br>
&gt; &gt; fix, or should this update be reverted in Dunfell?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
include/linux/random.h:39:45: warning: &#39;struct random_ready_callback&#3=
9; declared inside parameter list will not be visible outside of this defin=
ition or declaration<br>
&gt; &gt; |=C2=A0 =C2=A0 39 | extern int add_random_ready_callback(struct r=
andom_ready_callback *rdy);<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~<b=
r>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
include/linux/random.h:40:46: warning: &#39;struct random_ready_callback&#3=
9; declared inside parameter list will not be visible outside of this defin=
ition or declaration<br>
&gt; &gt; |=C2=A0 =C2=A0 40 | extern void del_random_ready_callback(struct =
random_ready_callback *rdy);<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~<=
br>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
include/linux/random.h:47:6: error: conflicting types for &#39;get_random_b=
ytes&#39;<br>
&gt; &gt; |=C2=A0 =C2=A0 47 | void get_random_bytes(void *buf, size_t len);=
<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~=
~<br>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
include/linux/random.h:35:13: note: previous declaration of &#39;get_random=
_bytes&#39; was here<br>
&gt; &gt; |=C2=A0 =C2=A0 35 | extern void get_random_bytes(void *buf, int n=
bytes);<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~~~~~~~~~~<br>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
include/linux/random.h:48:21: error: conflicting types for &#39;get_random_=
bytes_arch&#39;<br>
&gt; &gt; |=C2=A0 =C2=A0 48 | size_t __must_check get_random_bytes_arch(voi=
d *buf, size_t len);<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~<br>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
include/linux/random.h:41:25: note: previous declaration of &#39;get_random=
_bytes_arch&#39; was here<br>
&gt; &gt; |=C2=A0 =C2=A0 41 | extern int __must_check get_random_bytes_arch=
(void *buf, int nbytes);<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~=
~<br>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
scripts/Makefile.build:99: recipe for target &#39;arch/arm64/kernel/asm-off=
sets.s&#39; failed<br>
&gt; &gt; | make[2]: *** [arch/arm64/kernel/asm-offsets.s] Error 1<br>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
Makefile:1134: recipe for target &#39;prepare0&#39; failed<br>
&gt; &gt; | make[1]: *** [prepare0] Error 2<br>
&gt; &gt; | /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/=
Makefile:179: recipe for target &#39;sub-make&#39; failed<br>
&gt; &gt; | make: *** [sub-make] Error 2<br>
&gt; &gt; | ERROR: oe_runmake failed<br>
&gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt; &gt; | ERROR: Execution of &#39;/OE/poky-dunfell/build/tmp/work/qemuar=
m64-poky-linux/linux-yocto-rt/5.4.203+gitAUTOINC+010ac788e8_fa8536530b-r0/t=
emp/run.do_compile.240410&#39; failed with exit code 1<br>
&gt; &gt; ERROR: Task (/OE/poky-dunfell/meta/recipes-kernel/linux/linux-yoc=
to-rt_5.4.bb:do_compile) failed with exit code &#39;1&#39;<br>
&gt; &gt; NOTE: Tasks Summary: Attempted 586 tasks of which 465 didn&#39;t =
need to be rerun and 1 failed.<br>
&gt; &gt;<br>
&gt; &gt; Summary: 1 task failed:<br>
&gt; &gt;=C2=A0 =C2=A0/OE/poky-dunfell/meta/recipes-kernel/linux/linux-yoct=
o-rt_5.4.bb:do_compile<br>
&gt; &gt; Summary: There were 2 ERROR messages shown, returning a non-zero =
exit code.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jul 07, 2022 at 12:38:27PM -0400, Bruce Ashfield wrote:<b=
r>
&gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&=
gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Updating=C2=A0 to the latest korg -stable release that compr=
ises<br>
&gt; &gt; &gt; the following commits:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0871cbc208bf0 Linux 5.4.203<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0572cc34503d4 crypto: arm/ghash-ce - defin=
e fpu before fpu registers are referenced<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03bf992f9d9a8 crypto: arm - use Kconfig ba=
sed compiler checks for crypto opcodes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01b43c30cd5d5 ARM: 9029/1: Make iwmmxt.S s=
upport Clang&#39;s integrated assembler<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09e00e5d195ed ARM: OMAP2+: drop unnecessar=
y adrl<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03657432a75e3 ARM: 8929/1: use APSR_nzcv i=
nstead of r15 as mrc operand<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002c200fdba46 ARM: 8933/1: replace Sun/Sol=
aris style flag on section directive<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A054e6ecd5b7ca crypto: arm/sha512-neon - av=
oid ADRL pseudo instruction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e6f80033286 crypto: arm/sha256-neon - av=
oid ADRL pseudo instruction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e120403c0e7c ARM: 8971/1: replace the sol=
e use of a symbol with its definition<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a43679016f0 ARM: 8990/1: use VFP assembl=
er mnemonics in register load/store macros<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0472671eec98a ARM: 8989/1: use .fpu assemb=
ler directives instead of assembler arguments<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02bfb0d43a47c net: mscc: ocelot: allow unr=
egistered IP multicast flooding<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0223d551a6681 kexec_file: drop weak attrib=
ute from arch_kexec_apply_relocations[_add]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab3ed204a146 powerpc/ftrace: Remove ftrac=
e init tramp once kernel init is complete<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077e2ad091850 drm: remove drm_fb_helper_mo=
dinit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ef3ad40a81f Linux 5.4.202<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ceda71d49f6b powerpc/pseries: wire up rng=
 during setup_arch()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ece983890287 kbuild: link vmlinux only on=
ce for CONFIG_TRIM_UNUSED_KSYMS (2nd attempt)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a81e813141e random: update comment from =
copy_to_user() -&gt; copy_to_iter()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080f0038d757e modpost: fix section mismatc=
h check for exported init/exit sections<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1359e4129ad ARM: cns3xxx: Fix refcount l=
eak in cns3xxx_init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A029ca9c4efacc ARM: Fix refcount leak in ax=
xia_boot_secondary<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0734a4d15142b soc: bcm: brcmstb: pm: pm-ar=
m: Fix refcount leak in brcmstb_pm_probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9b77a529375 ARM: exynos: Fix refcount le=
ak in exynos_map_pmu<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0615907ccc421 ARM: dts: imx6qdl: correct P=
U regulator ramp delay<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A093e6137d2a5b powerpc/powernv: wire up rng=
 during setup_arch<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097808c781721 powerpc/rtas: Allow ibm,plat=
form-dump RTAS call with null buffer address<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b6232979320a powerpc: Enable execve sysca=
ll exit tracepoint<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0701f150b28 parisc: Enable ARCH_HAS_STRI=
CT_MODULE_RWX<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5234a9d64a9 xtensa: Fix refcount leak bu=
g in time.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a52972ee706b xtensa: xtfpga: Fix refcount=
 leak bug in setup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0fc7cdf5f19 iio: adc: axp288: Override T=
S pin bias current for some models<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A011c7ea38be91 iio: adc: stm32: fix maximum=
 clock rate for stm32mp15x<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e39397d60da iio: trigger: sysfs: fix use=
-after-free on remove<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06d2e68d02171 iio: gyro: mpu3050: Fix the =
error handling in mpu3050_power_up()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ad6d668543d iio: accel: mma8452: ignore =
the return value of reset operation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a391bced8404 iio:accel:mxc4005: rearrange=
 iio trigger get and register<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A023c158caa032 iio:accel:bma180: rearrange =
iio trigger get and register<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ea16a64aafc iio:chemical:ccs811: rearran=
ge iio trigger get and register<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02333db14d875 usb: chipidea: udc: check re=
quest status before setting device address<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047e41b4dabbf xhci: turn off port power in=
 shutdown<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d62d1c606db0 iio: adc: vf610: fix convers=
ion mode sysfs node name<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0741b6c8363c2 s390/cpumf: Handle events cy=
cles and instructions identical<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04837d1c81223 gpio: winbond: Fix error cod=
e in winbond_gpio_get()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb18ad00c0b7 Revert &quot;net/tls: fix tl=
s_sk_proto_close executed repeatedly&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c7a32b7c155 virtio_net: fix xdp_rxq_info=
 bug after suspend/resume<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028a78414f21e igb: Make DMA faster when CP=
U is active on the PCIe link<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5ed066bc246 regmap-irq: Fix a bug in reg=
map_irq_enable() for type_in_mask chips<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0844168a5dabf ice: ethtool: advertise 1000=
M speeds properly<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e3a232e57670 afs: Fix dynamic root getatt=
r<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cacab1e620e0 MIPS: Remove repetitive incr=
ease irq_err_count<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0788c954f194c x86/xen: Remove undefined be=
havior in setup_features()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c7bdaad9cbfe udmabuf: add back sanity che=
ck<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A005c6c36c7931 net/tls: fix tls_sk_proto_cl=
ose executed repeatedly<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002da602bc2f3 erspan: do not assume transp=
ort header is always set<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1592d3e362c drm/msm/mdp4: Fix refcount l=
eak in mdp4_modeset_init_intf<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1f9c2a5a3d9 net/sched: sch_netem: Fix ar=
ithmetic in netem_dump() for 32-bit platforms<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047d31b97bf47 bonding: ARP monitor spams N=
ETDEV_NOTIFY_PEERS notifiers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0104a59b74577 phy: aquantia: Fix AN when h=
igher speeds than 1G are not advertised<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ffe2e50e967 bpf: Fix request_sock leak i=
n sk lookup helpers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f074ab253988 USB: serial: option: add Que=
ctel RM500K module support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea7b23eadebc USB: serial: option: add Que=
ctel EM05-G modem<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0613c849d73df USB: serial: option: add Tel=
it LE910Cx 0x1250 composition<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae183969bd66 random: quiet urandom warnin=
g ratelimit suppression message<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A006a24ddba93a dm mirror log: clear log bit=
s up to BITS_PER_LONG boundary<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f350f3cf0c1 dm era: commit metadata in p=
ostsuspend after worker stops<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e75acbe1b76 ata: libata: add qc-&gt;flag=
s in ata_qc_complete_template tracepoint<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071c76f56b97c mtd: rawnand: gpmi: Fix sett=
ing busy timeout setting<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8d37e6ca180 mmc: sdhci-pci-o2micro: Fix =
card detect by dealing with debouncing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0af28f602df74 net: openvswitch: fix parsin=
g of nw_proto for IPv6 fragments<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06fda65dabd3e ALSA: hda/realtek: Add quirk=
 for Clevo PD70PNT<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05fbad99e76c0 ALSA: hda/realtek - ALC897 h=
eadset MIC no sound<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf81f367cf81 ALSA: hda/conexant: Fix miss=
ing beep setup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eca9b5e36e24 ALSA: hda/via: Fix missing b=
eep setup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01df5178fdebe random: schedule mix_interru=
pt_randomness() less often<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c87e851b23e5 vt: drop old FONT ioctls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A023db944f754e Linux 5.4.201<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03994d2ee55e2 Revert &quot;hwmon: Make chi=
p parameter for with_info API mandatory&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07b9c3bfbad25 arm64: mm: Don&#39;t invalid=
ate FROM_DEVICE buffers at start of DMA transfer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e1591c27b95 tcp: drop the hash_32() part=
 from the index calculation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c26e1addf157 tcp: increase source port pe=
rturb table to 2^16<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077d29f3b18c4 tcp: dynamically allocate th=
e perturb table used by source ports<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c0a777b7dbd tcp: add small random increm=
ents to the source port<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A053c5de3092ad tcp: use different parts of =
the port_offset for index and offset<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A095921a3bab76 tcp: add some entropy in __i=
net_hash_connect()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdcbf2602feb usb: gadget: u_ether: fix re=
gression in setting fixed MAC address<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02577d67a9a8a dm: remove special-casing of=
 bio-based immutable singleton target on NVMe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04143503b486a s390/mm: use non-quiescing s=
ske for KVM switch to keyed guest<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0c280af0ec7 Linux 5.4.200<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab8dff4b716e powerpc/mm: Switch obsolete =
dssall to .long<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01a48a41f1422 riscv: Less inefficient gcc =
tishift helpers (and export their symbols)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02464a1c0de53 RISC-V: fix barrier() use in=
 &lt;vdso/processor.h&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0490a02cd8205 arm64: kprobes: Use BRK inst=
ead of single-step when executing instructions out-of-line<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef6f9ce0a79a net: openvswitch: fix leak o=
f nested actions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06bb3c77c74f5 net: openvswitch: fix misuse=
 of the cached connection on tuple changes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b47319b4aa21 net/sched: act_police: more =
accurate MTU policing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A013fbdea1184b virtio-pci: Remove wrong add=
ress verification in vp_del_vqs()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080e4d8a27451 ALSA: hda/realtek: fix right=
 sounds and mute/micmute LEDs for HP machine<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0119e0268cc1c ALSA: hda/realtek: fix mute/=
micmute LEDs for HP 440 G8<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fba542891767 ext4: add reserved GDT block=
s check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ca0d2f1e04e ext4: make variable &quot;co=
unt&quot; signed<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6b31616e5af ext4: fix bug_on ext4_mb_use=
_inode_pa<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae4603128751 dm mirror log: round up regi=
on bitmap size to BITS_PER_LONG<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064d2df648003 serial: 8250: Store to lsr_s=
ave_flags after lsr read<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b75bddfcc181 usb: gadget: lpc32xx_udc: Fi=
x refcount leak in lpc32xx_udc_probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06506aff2dc2f usb: dwc2: Fix memory leak i=
n dwc2_hcd_init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0940653b51c33 USB: serial: io_ti: add Agil=
ent E5805A support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A031363b2b868e USB: serial: option: add sup=
port for Cinterion MV31 with new baseline<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0c3730f2763 comedi: vmk80xx: fix express=
ion for tx buffer size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bf833c484881 i2c: designware: Use standar=
d optional ref clock implementation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d884c08eeb8 irqchip/gic-v3: Fix refcount=
 leak in gic_populate_ppi_partitions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058e67c81e229 irqchip/gic-v3: Fix error ha=
ndling in gic_populate_ppi_partitions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056526c3883fc irqchip/gic/realview: Fix re=
fcount leak in realview_gic_of_init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04695bafabf5b faddr2line: Fix overlapping =
text section failures, the sequel<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01b34d6a93832 certs/blacklist_hashes.c: fi=
x const confusion in certs blacklist<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fb775ee3cfff arm64: ftrace: fix branch ra=
nge checks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e21311ba459 net: bgmac: Fix an erroneous=
 kfree() in bgmac_remove()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c19cdd72b3ec mlxsw: spectrum_cnt: Reorder=
 counter pools<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c03304dc4234 misc: atmel-ssc: Fix IRQ che=
ck in ssc_probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f7183c76d500 tty: goldfish: Fix free_irq(=
) on remove<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff6e03fe84bc i40e: Fix call trace in setu=
p_tx_descriptors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04b94408e1617 i40e: Fix calculating the nu=
mber of queue pairs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A043f65970eeb2 i40e: Fix adding ADQ filter =
to TC0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cff3a7ce6e81 clocksource: hyper-v: unexpo=
rt __init-annotated hv_init_clocksource()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A011c870c0b532 pNFS: Don&#39;t keep retryin=
g if the server replied NFS4ERR_LAYOUTUNAVAILABLE<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e32fe87afcfe random: credit cpu and bootl=
oader seeds by default<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09e4cab02b7ec net: ethernet: mtk_eth_soc: =
fix misuse of mem alloc interface netdev[napi]_alloc_frag<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02f42389d270f ipv6: Fix signed integer ove=
rflow in l2tp_ip6_sendmsg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b4d8b44e716 nfc: nfcmrvl: Fix memory lea=
k in nfcmrvl_play_deferred<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0786428a1dec2 virtio-mmio: fix missing put=
_device() when vm_cmdline_parent registration failed<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aacb264d54c4 ALSA: hda/realtek - Add HW83=
26 support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff882404dff7 scsi: pmcraid: Fix missing r=
esource cleanup in error case<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c48119223618 scsi: ipr: Fix missing/incor=
rect resource cleanup in error case<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe0855944a64 scsi: lpfc: Allow reduced po=
lling rate for nvme_admin_async_event cmd completion<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f1be79189fd scsi: lpfc: Fix port stuck i=
n bypassed state after LIP in PT2PT topology<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0001de3d8ce82 scsi: vmw_pvscsi: Expand vcp=
uHint to 16 bits<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09e3a0d3fc71c ASoC: wm_adsp: Fix event gen=
eration for wm_adsp_fw_put()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc046649c5d6 ASoC: es8328: Fix event gene=
ration for deemphasis control<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a81f5a7f7a20 ASoC: wm8962: Fix suspend wh=
ile playing music<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0253334f84c81 ata: libata-core: fix NULL p=
ointer deref in ata_host_alloc_pinfo()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0052cd621acbf ASoC: cs42l56: Correct typo =
in minimum level for SX volume controls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06d180913b3ab ASoC: cs42l52: Correct TLV f=
or Bypass Volume<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0385a031c56a9 ASoC: cs53l30: Correct numbe=
r of volume levels on SX controls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0675b6a49cf70 ASoC: cs35l36: Update digita=
l volume TLV<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b00f63dba5b8 ASoC: cs42l52: Fix TLV scale=
s for mixer controls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd8c1e6c01f1 dma-debug: make things less =
spammy under memory pressure<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a45e19fd6ed8 ASoC: nau8822: Add operation=
 for internal PLL off and on<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0348831a9e8aa powerpc/kasan: Silence KASAN=
 warnings in __get_wchan()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05624055c8f4b random: account for arch ran=
domness in bits<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0bf6bfce70a random: mark bootloader rand=
omness code as __init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f96250197b43 random: avoid checking crng_=
ready() twice in random_init()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0072cd87d12a8 crypto: drbg - make reseedin=
g from get_random_bytes() synchronous<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9eb0c4741a7 crypto: drbg - always try to=
 free Jitter RNG instance<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f284afc3a9ca crypto: drbg - move dynamic =
-&gt;reseed_threshold adjustments to __drbg_seed()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0babba4bf53a6 crypto: drbg - track whether=
 DRBG was seeded with !rng_is_initialized()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01b93b302e942 crypto: drbg - prepare for m=
ore fine-grained tracking of seeding state<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A098e574a73414 crypto: drbg - always seeded=
 with SP800-90B compliant noise source<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A061f87ea3f957 Revert &quot;random: use sta=
tic branch for crng_ready()&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03faf33a85650 random: check for signals af=
ter page of pool writes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02177cef53ec9 random: wire up fops-&gt;spl=
ice_{read,write}_iter()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035db2a073118 random: convert to using fop=
s-&gt;write_iter()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A043e62db84a99 random: convert to using fop=
s-&gt;read_iter()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c23188facd10 random: unify batched entrop=
y implementations<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01aeedbe02b5c random: move randomize_page(=
) into mm where it belongs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ceaf1feefe6e random: move initialization =
functions out of hot pages<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3bf98d61fb6 random: make consistent use =
of buf and len<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070fce7f105bb random: use proper return ty=
pes on get_random_{int,long}_wait()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d05948dc23e6 random: remove extern from f=
unctions in header<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8b4296417ea random: use static branch fo=
r crng_ready()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0087a14b9cf9b random: credit architectural=
 init the exact amount<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac48f7bee198 random: handle latent entrop=
y and command line from random_init()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0736a22645d98 random: use proper jiffies c=
omparison macro<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03266fba20661 random: remove ratelimiting =
for in-kernel unseeded randomness<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c5373bd6e4fb random: move initialization =
out of reseeding hot path<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00747ad152fa1 random: avoid initializing t=
wice in credit race<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00baeec0effc7 random: use symbolic constan=
ts for crng_init states<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A055d64df3ad5b siphash: use one source of t=
ruth for siphash permutations<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e4e8a9f8a616 random: help compiler out wi=
th fast_mix() by using simpler arguments<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bf3b51eb0f13 random: do not use input poo=
l from hard IRQs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06d4203a2cddc random: order timer entropy =
functions below interrupt functions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058da574f105a random: do not pretend to ha=
ndle premature next security model<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e739d5bd1466 random: use first 128 bits o=
f input as fast init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c44f8b386376 random: do not use batches w=
hen !crng_ready()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e247ea8d97bf random: insist on random_get=
_entropy() existing in order to simplify<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09bfbcb37e5f6 xtensa: use fallback for ran=
dom_get_entropy() instead of zero<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa15650b51f6 sparc: use fallback for rand=
om_get_entropy() instead of zero<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09dfc14590c5d um: use fallback for random_=
get_entropy() instead of zero<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00cc41e2c73f7 x86/tsc: Use fallback for ra=
ndom_get_entropy() instead of zero<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f2a6e8727084 nios2: use fallback for rand=
om_get_entropy() instead of zero<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db1d13fe4c80 arm: use fallback for random=
_get_entropy() instead of zero<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06fa912f987fa mips: use fallback for rando=
m_get_entropy() instead of just c0 random<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036f38f838c5b m68k: use fallback for rando=
m_get_entropy() instead of zero<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7d04ca9da61 timekeeping: Add raw clock f=
allback for random_get_entropy()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb2f9d72f32a powerpc: define get_cycles m=
acro for arch-override<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A010455a367c33 alpha: define get_cycles mac=
ro for arch-override<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05f0b77ca1978 parisc: define get_cycles ma=
cro for arch-override<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080459abc9fee s390: define get_cycles macr=
o for arch-override<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A073385644490a ia64: define get_cycles macr=
o for arch-override<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05fac86663976 init: call time_init() befor=
e rand_initialize()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b88ae87b100c random: fix sysctl documenta=
tion nits<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0465425748359 random: document crng_fast_k=
ey_erasure() destination possibility<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ec07b3494517 random: make random_get_entr=
opy() return an unsigned long<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe156368f987 random: allow partial reads =
if later user copies fail<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070788723da70 random: check for signals ev=
ery PAGE_SIZE chunk of /dev/[u]random<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ce859d91fe9 random: check for signal_pen=
ding() outside of need_resched() check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e8030c9e03d random: do not allow user to=
 keep crng key around on stack<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A095aed891f7be random: do not split fast in=
it input in add_hwgenerator_randomness()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01d53d5a0973e random: mix build-time laten=
t entropy into pool at init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00aba75c6173d random: re-add removed comme=
nt about get_random_{u32,u64} reseeding<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081ea8a609b48 random: treat bootloader tru=
st toggle the same way as cpu trust toggle<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a08d52a6081b random: skip fast_init if hw=
rng provides large chunk of entropy<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08320bc665c29 random: check for signal and=
 try earlier when generating entropy<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a53b818bb0e random: reseed more often im=
mediately after booting<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0905759e0fc17 random: make consistent usag=
e of crng_ready()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ad4c6bd98c54 random: use SipHash as inter=
rupt entropy accumulator<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0631503001ccf random: replace custom notif=
ier chain with standard one<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ae73fb2a635 random: don&#39;t let 644 re=
ad-only sysctls be written to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ed409757100b random: give sysctl_random_m=
in_urandom_seed a more sensible value<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075d95c1b5dea random: do crng pre-init loa=
ding in worker rather than irq<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0219c84fe93e5 random: unify cycles_t and j=
iffies usage and types<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0673637c4c9e0 random: cleanup UUID handlin=
g<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04d5151cc288a random: only wake up writers=
 after zap if threshold was passed<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac0081dec7d6 random: round-robin register=
s as ulong, not u32<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A062cd795e465a random: clear fast pool, crn=
g, and batches in cpuhp bring up<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7f8f385bb6f random: pull add_hwgenerator=
_randomness() declaration into random.h<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff607fc7607d random: check for crng_init =
=3D=3D 0 in add_device_randomness()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020788eb4ce70 random: unify early init crn=
g load accounting<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049567f947735 random: do not take pool spi=
nlock at boot<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04a61bf7f9b18 random: defer fast pool mixi=
ng to worker<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0944d1bd0e5be random: rewrite header intro=
ductory comment<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0e35949c736 random: group sysctl functio=
ns<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d946084180ee random: group userspace read=
/write functions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0565a66043bdf random: group entropy collec=
tion functions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f2d587c493fc random: group entropy extrac=
tion functions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8786d54762f random: group crng functions=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c12dfec1aacf random: group initialization=
 wait functions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A022e3db57ab94 random: remove whitespace an=
d reorder includes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cee64be60591 random: remove useless heade=
r comment<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0904e6123c400 random: introduce drain_entr=
opy() helper to declutter crng_reseed()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047c56790d51c random: deobfuscate irq u32/=
u64 contributions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e280b79c3127 random: add proper SPDX head=
er<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0776927dfd4ac random: remove unused tracep=
oints<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d68883956d36 random: remove ifdef&#39;d o=
ut interrupt bench<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04a14a5a6969a random: tie batched entropy =
generation to base_crng generation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8a6684950c1 random: fix locking for crng=
_init in crng_reseed()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b1d561138150 random: zero buffer after re=
ading entropy from userspace<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021da00f8cb3a random: remove outdated INT_=
MAX &gt;&gt; 6 check in urandom_read()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b530684129b2 random: make more consistent=
 use of integer types<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03eed6af93ecd random: use hash function fo=
r crng_slow_load()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cee3c7056900 random: use simpler fast key=
 erasure flow on per-cpu keys<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea9941fd6e26 random: absorb fast pool int=
o input pool after fast load<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a3562bf4e8c9 random: do not xor RDRAND wh=
en writing into /dev/random<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0574c8839504b random: ensure early RDSEED =
goes through mixer on init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3d3c1c214c3 random: inline leaves of ran=
d_initialize()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0817315517af9 random: get rid of secondary=
 crngs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c15fc80b7df0 random: use RDSEED instead o=
f RDRAND in entropy extraction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072db8151c889 random: fix locking in crng_=
fast_load()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07229c6d90a1a random: remove batched entro=
py locking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c8911579221 random: remove use_input_poo=
l parameter from crng_reseed()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ef908fb81d9 random: make credit_entropy_=
bits() always safe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A042a9a7e80750 random: always wake up entro=
py writers after extraction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0373ef51f3e8a random: use linear min-entro=
py accumulation crediting<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a1a2bae5ef93 random: simplify entropy deb=
iting<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e5814bd2e75 random: use computational ha=
sh for entropy extraction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A099a0f8e22d4c random: only call crng_final=
ize_init() for primary_crng<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A088609b892fdd random: access primary_pool =
directly rather than through pointer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b9f9b94f1ea random: continually use hwge=
nerator randomness<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0811e333c4eb2 random: simplify arithmetic =
function flow in account()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056de23dcf9d0 random: selectively clang-fo=
rmat where it makes sense<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A086eac12b1cf5 random: access input_pool_da=
ta directly rather than through pointer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f5400ca7fc1 random: cleanup fractional e=
ntropy shift constants<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01b6f1d32a858 random: prepend remaining po=
ol constants with POOL_<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00fe4a64fd946 random: de-duplicate INPUT_P=
OOL constants<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e35576c4cb18 random: remove unused OUTPUT=
_POOL constants<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A074cb3093f2de random: rather than entropy_=
store abstraction, use global<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A014652d864280 random: remove unused extrac=
t_entropy() reserved argument<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012f17e3f3a14 random: remove incomplete la=
st_data logic<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0adcbbb44ccc1 random: cleanup integer type=
s<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ac4c7f057ff random: cleanup poolinfo abs=
traction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c3818e3bd7b random: fix typo in comments=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a7e65810269 random: don&#39;t reset crng=
_init_cnt on urandom_read()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d7c55563ed0 random: avoid superfluous ca=
ll to RDRAND in CRNG extraction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b4695640bc5 random: early initialization=
 of ChaCha constants<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cfc69065005e random: initialize ChaCha20 =
constants with correct endianness<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0922d082e3363 random: use IS_ENABLED(CONFI=
G_NUMA) instead of ifdefs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0565b3af16894 random: harmonize &quot;crng=
 init done&quot; messages<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0346c4a697c29 random: mix bootloader rando=
mness into pool<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0afce74c0c04f random: do not re-init if cr=
ng_reseed completes before primary init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d76758c71209 random: do not sign extend b=
ytes for rotation when mixing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c2f0a89cd1d5 random: use BLAKE2s instead =
of SHA1 in extraction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e6ae70c1eac random: remove unused irq_fl=
ags argument from add_interrupt_randomness()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02580b0b3fd5a random: document add_hwgener=
ator_randomness() with other input functions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03cc36a4aa1ca crypto: blake2s - adjust inc=
lude guard naming<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009342a544c4b crypto: blake2s - include &l=
t;linux/bug.h&gt; instead of &lt;asm/bug.h&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f850f3643d6b MAINTAINERS: co-maintain ran=
dom.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0967e3a136f9b random: remove dead code lef=
t over from blocking pool<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0610f0b439a6b random: avoid arch_get_rando=
m_seed_long() when collecting IRQ randomness<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ad3fce669105 random: add arch_get_random_=
*long_early()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A041b0d3e86c50 powerpc: Use bool in archran=
dom.h<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A089533373e11c linux/random.h: Mark CONFIG_=
ARCH_RANDOM functions __must_check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00222f9f1d168 linux/random.h: Use false wi=
th bool<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A015f93060b718 linux/random.h: Remove arch_=
has_random, arch_has_random_seed<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a95ed04e21da s390: Remove arch_has_random=
, arch_has_random_seed<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aab52172d9f9 powerpc: Remove arch_has_ran=
dom, arch_has_random_seed<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035e28a05f659 x86: Remove arch_has_random,=
 arch_has_random_seed<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A098f749e29728 random: avoid warnings for !=
CONFIG_NUMA builds<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c13b9c3627d8 random: split primary/second=
ary crng init paths<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c070b07aaf34 random: remove some dead cod=
e of poolinfo<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0898498bb4414 random: fix typo in add_time=
r_randomness()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02c53d6d6a7be random: Add and use pr_fmt()=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3375cfe31bc random: convert to ENTROPY_B=
ITS for better code readability<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09f757cad20b7 random: remove unnecessary u=
nlikely()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04431c366fe23 random: remove kernel.random=
.read_wakeup_threshold<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ec134003cc39 random: delete code to pull =
data into pools<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9564e14c6dd random: remove the blocking =
pool<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0940cbc47b369 random: make /dev/random be =
almost like /dev/urandom<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4edc1055c11 random: ignore GRND_RANDOM i=
n getentropy(2)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07f9f864af021 random: add GRND_INSECURE to=
 return best-effort non-cryptographic bytes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0479d39707ff7 random: Add a urandom_read_n=
owait() for random APIs that don&#39;t warn<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A069441ba56f13 random: Don&#39;t wake crng_=
init_wait when crng_init =3D=3D 1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A069ef3109d422 random: don&#39;t forget com=
pat_ioctl on urandom<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0927fc225af29 compat_ioctl: remove /dev/ra=
ndom commands<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0996fba14fa35 lib/crypto: sha1: re-roll lo=
ops to reduce code size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4f48374407b lib/crypto: blake2s: move hm=
ac construction into wireguard<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097126d2f65b3 crypto: blake2s - generic C =
library implementation and selftest<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076101f1b7f59 nfc: st21nfca: fix incorrect=
 sizing calculations in EVT_TRANSACTION<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e804587ecdcd bpf: Fix incorrect memory ch=
arge cost calculation in stack_map_alloc()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f91da317e6fa 9p: missing chunk of &quot;f=
s/9p: Don&#39;t update file type when updating file attributes&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.as=
hfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail=
.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_5.4.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-rt_5.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++---<br>
&gt; &gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_5.4.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-tiny_5.4.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++----<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto_5.4.b=
b</a>=C2=A0 | 22 +++++++++----------<br>
&gt; &gt; &gt;=C2=A0 3 files changed, 18 insertions(+), 18 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://lin=
ux-yocto-rt_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-y=
octo-rt_5.4.bb</a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o-rt_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-rt=
_5.4.bb</a><br>
&gt; &gt; &gt; index 2fef4f032d..7fa1b81229 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o-rt_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-rt=
_5.4.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o-rt_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-rt=
_5.4.bb</a><br>
&gt; &gt; &gt; @@ -11,13 +11,13 @@ python () {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(=
&quot;Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&=
quot;)<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -SRCREV_machine ?=3D &quot;d7693f19702e1fa1bb18507260198478c=
ba0d6a2&quot;<br>
&gt; &gt; &gt; -SRCREV_meta ?=3D &quot;318db1080fdd1e26567b6ba679310adad84c=
173a&quot;<br>
&gt; &gt; &gt; +SRCREV_machine ?=3D &quot;fa8536530bdd6a87856aa6fe0af4f9ef4=
af21fe0&quot;<br>
&gt; &gt; &gt; +SRCREV_meta ?=3D &quot;010ac788e81b6cb6c3fd2367802eee9d8fea=
c34f&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctopro=
ject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;=
branch=3D${KBRANCH};name=3Dmachine</a> \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=
=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta=
;branch=3Dyocto-5.4;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer noreferrer=
" target=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}</a>&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -LINUX_VERSION ?=3D &quot;5.4.199&quot;<br>
&gt; &gt; &gt; +LINUX_VERSION ?=3D &quot;5.4.203&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea81=
5ee2795b2f4230826c0c6b8814&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://lin=
ux-yocto-tiny_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux=
-yocto-tiny_5.4.bb</a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto-tiny_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yo=
cto-tiny_5.4.bb</a><br>
&gt; &gt; &gt; index 32ff438a57..d08658cf7e 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o-tiny_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-=
tiny_5.4.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o-tiny_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-=
tiny_5.4.bb</a><br>
&gt; &gt; &gt; @@ -6,7 +6,7 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 require recipes-kernel/linux/linux-yocto.inc<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -LINUX_VERSION ?=3D &quot;5.4.199&quot;<br>
&gt; &gt; &gt; +LINUX_VERSION ?=3D &quot;5.4.203&quot;<br>
&gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea81=
5ee2795b2f4230826c0c6b8814&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;=
, &#39;x86&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; &gt; @@ -15,9 +15,9 @@ DEPENDS +=3D &quot;openssl-native util-lin=
ux-native&quot;<br>
&gt; &gt; &gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt; &gt; &gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -SRCREV_machine_qemuarm ?=3D &quot;a117c8494d49f5ab6ec54a69c=
0f926bad5d55616&quot;<br>
&gt; &gt; &gt; -SRCREV_machine ?=3D &quot;fbc1147bd48ea6b51895e8ab9d6422d11=
2cdd58a&quot;<br>
&gt; &gt; &gt; -SRCREV_meta ?=3D &quot;318db1080fdd1e26567b6ba679310adad84c=
173a&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemuarm ?=3D &quot;d92cd7d5916772a20105ef776=
c7f3bf433df55a4&quot;<br>
&gt; &gt; &gt; +SRCREV_machine ?=3D &quot;5f7c3e952857eb90a4113a41901bb7701=
50af46b&quot;<br>
&gt; &gt; &gt; +SRCREV_meta ?=3D &quot;010ac788e81b6cb6c3fd2367802eee9d8fea=
c34f&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://lin=
ux-yocto_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yoct=
o_5.4.bb</a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><=
br>
&gt; &gt; &gt; index e2130386b2..545c754c1d 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto_5.4.b=
b</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o_5.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto_5.4.b=
b</a><br>
&gt; &gt; &gt; @@ -12,16 +12,16 @@ KBRANCH_qemux86=C2=A0 ?=3D &quot;v5.4/st=
andard/base&quot;<br>
&gt; &gt; &gt;=C2=A0 KBRANCH_qemux86-64 ?=3D &quot;v5.4/standard/base&quot;=
<br>
&gt; &gt; &gt;=C2=A0 KBRANCH_qemumips64 ?=3D &quot;v5.4/standard/mti-malta6=
4&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -SRCREV_machine_qemuarm ?=3D &quot;3bc1fc1cd35bd8f95e80fb496=
27c2f6977debc84&quot;<br>
&gt; &gt; &gt; -SRCREV_machine_qemuarm64 ?=3D &quot;c048122124fdbd78d02ac64=
ef6558503e7536f7b&quot;<br>
&gt; &gt; &gt; -SRCREV_machine_qemumips ?=3D &quot;19fc003e228a56e30943ddcb=
a0614de6365e2740&quot;<br>
&gt; &gt; &gt; -SRCREV_machine_qemuppc ?=3D &quot;ef263615ec81ddfac29c82c5c=
61f6195dde31944&quot;<br>
&gt; &gt; &gt; -SRCREV_machine_qemuriscv64 ?=3D &quot;ac296ae9753c775eb216f=
e6c2eb3dbccfc1489f7&quot;<br>
&gt; &gt; &gt; -SRCREV_machine_qemux86 ?=3D &quot;ac296ae9753c775eb216fe6c2=
eb3dbccfc1489f7&quot;<br>
&gt; &gt; &gt; -SRCREV_machine_qemux86-64 ?=3D &quot;ac296ae9753c775eb216fe=
6c2eb3dbccfc1489f7&quot;<br>
&gt; &gt; &gt; -SRCREV_machine_qemumips64 ?=3D &quot;9ee7899b379b865fe676d5=
0be29162845c9a9ee3&quot;<br>
&gt; &gt; &gt; -SRCREV_machine ?=3D &quot;ac296ae9753c775eb216fe6c2eb3dbccf=
c1489f7&quot;<br>
&gt; &gt; &gt; -SRCREV_meta ?=3D &quot;318db1080fdd1e26567b6ba679310adad84c=
173a&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemuarm ?=3D &quot;bf4029e0d9ff2e65d654909d7=
e9df50dce294c77&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemuarm64 ?=3D &quot;3e0dab732964f7bbc26671f=
ee05be420fd02890a&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemumips ?=3D &quot;e8bea70e0c6a527383f2351e=
4f3d189aedf543a3&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemuppc ?=3D &quot;24cc2a066b8151925fdf86136=
b70b63cf37cc540&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemuriscv64 ?=3D &quot;9eab27738de4b3222b1c9=
9cdebf3bde9611ef9fa&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemux86 ?=3D &quot;9eab27738de4b3222b1c99cde=
bf3bde9611ef9fa&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemux86-64 ?=3D &quot;9eab27738de4b3222b1c99=
cdebf3bde9611ef9fa&quot;<br>
&gt; &gt; &gt; +SRCREV_machine_qemumips64 ?=3D &quot;5a5e07ef8df0e73b2f318b=
921f9262b49a6125d5&quot;<br>
&gt; &gt; &gt; +SRCREV_machine ?=3D &quot;9eab27738de4b3222b1c99cdebf3bde96=
11ef9fa&quot;<br>
&gt; &gt; &gt; +SRCREV_meta ?=3D &quot;010ac788e81b6cb6c3fd2367802eee9d8fea=
c34f&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 # remap qemuarm to qemuarma15 for the 5.4 kernel<br>
&gt; &gt; &gt;=C2=A0 # KMACHINE_qemuarm ?=3D &quot;qemuarma15&quot;<br>
&gt; &gt; &gt; @@ -30,7 +30,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://=
git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=
=3D"noreferrer noreferrer" target=3D"_blank">git.yoctoproject.org/linux-yoc=
to.git;name=3Dmachine;branch=3D${KBRA</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=
=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta=
;branch=3Dyocto-5.4;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer noreferrer=
" target=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}</a>&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea81=
5ee2795b2f4230826c0c6b8814&quot;<br>
&gt; &gt; &gt; -LINUX_VERSION ?=3D &quot;5.4.199&quot;<br>
&gt; &gt; &gt; +LINUX_VERSION ?=3D &quot;5.4.203&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;=
, &#39;x86&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; &gt;=C2=A0 DEPENDS +=3D &quot;openssl-native util-linux-native&qu=
ot;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.19.1<br>
&gt; &gt; &gt;<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000aa6b8005e420d2d4--

