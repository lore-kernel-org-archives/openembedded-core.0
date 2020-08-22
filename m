Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.158720.1598116311594712157
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 10:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HGYNq+9g;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id md23so5603028ejb.6
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 10:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nYZstF6wHonwCmT+sgrn3WfwH3u8kFcOroyK01ONj7c=;
        b=HGYNq+9g1X4Q9KowhM7/ZV6/SEUiWm6yQJOGESxRDYNwWu3uNbBbTol5GRpkL/L5Vp
         t9+rxtKfsK9o1LsXBBfCg54jp8/Yx8RBYdQAWHgdfVVcKHVzYf6U9QWcMbSscttFlait
         tYIhLWIuLRTu/xOECG+Y/7VgQKhpn72aiwvQUgOeGtu1I8rFMPbWvkyan7+hHPF0Cm8a
         Uy6nEzShuit5bjqGzc3BVzi3/m5fnK4aaiE591csqPT8MdS5oBPTFzSfIDPGwgqolpWR
         hUajIaWMSZGdJ/7C0qXetnWgCJTW9tlwdmKfaqDBzJqyz/4SmyeXKwRIY/iT7XcNBqpu
         KGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nYZstF6wHonwCmT+sgrn3WfwH3u8kFcOroyK01ONj7c=;
        b=DDESbGN1Pvt8pQCfkkrWncqvn28WjEU94Tw/X8ShF5y3sz/uBXaTXwM9CliMmW23Dd
         Fiq2ZiFfbk9mNWTrJYQh7QO9RUqRIEYDvx3XmTeoY8giLF5OiD70vLx1gBc2om8trb2x
         LlfPhH/bveoqwYRkNifKnptlGV0keDyTk+zmWnpSIorZ+kd1vXuerPIau4MZiKGHnXRk
         OwaY/zCF/CUBTbeoEYetUGpDFXX47bRNS4mOr0cvI+UOJHq0noG9Phz+riXbnV1vQH7/
         DtdoP+kKdIML3SS3u7HXH9mr/ACCZNOtAe5iunP7Hq+hXQcmPCHwHI+eIR0SbCY6NlAh
         mUgg==
X-Gm-Message-State: AOAM5304o6FR6SQQHfojOjy4Izkpsr+9LBpvcyrYuKBFhkHTyVJblIH+
	jVU/NmCFxtW8J9E/zD0xh6xTIx5KSjCkmHemZyA=
X-Google-Smtp-Source: ABdhPJwGG+ZKo/xV4/SwzXZ5XMjc9kpXcMqa31JTXs2RnJpkUHw5HmnBfyHd+9eiqsofgSArMzETy2G3UpSsFUDlG7M=
X-Received: by 2002:a17:906:bc52:: with SMTP id s18mr7635482ejv.298.1598116309595;
 Sat, 22 Aug 2020 10:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598036283.git.bruce.ashfield@gmail.com>
 <c9d0bb421a2f7c6783f2c2bbf47c95da5537985d.1598036283.git.bruce.ashfield@gmail.com>
 <CAMKF1sr-JshybsWtqUv9ACo873VoabioyzQipS8EFmeHB96XZA@mail.gmail.com> <162DA34FDEE6646E.7353@lists.openembedded.org>
In-Reply-To: <162DA34FDEE6646E.7353@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 22 Aug 2020 13:11:38 -0400
Message-ID: <CADkTA4NAdZmNDpD7HHn016Zt39Avnb4FZxGNgsaq9wG_Ya5crw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto/5.8: update to v5.8.2
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f179ed05ad7a725d"

--000000000000f179ed05ad7a725d
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 22, 2020 at 12:16 PM Bruce Ashfield via lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:

>
>
> On Sat, Aug 22, 2020 at 4:20 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Hi Bruce
>>
>> On rv64 I am seeing an error while building lttng
>>
>>  #error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
>> |    20 | # error "LTTng-modules requires CONFIG_KPROBES on kernels >=
>> 5.7.0"
>> |       |   ^~~~~
>>
>>
> I spun up a local build and will have a look.
>
>
>
>>
>> I wonder if we need to update defconfig
>>
>>
> There's no changes in the config (it is using the standard ktype), so it
> should be enabled. But I'll check it out in detail once my build errors out.
>
>
As near as I can tell, I don't see any kprobes support in arch/riscv. At
least not in the standard HAVE_KBPROBES sort of way.

If there really is kprobes support, we need to figure out how to tell
lttng-modules to not look at that symbol. Otherwise, it looks like
development is required to get lttng-modules working and we may need to
skip that build.

Bruce



> Bruce
>
>
>
>> On Fri, Aug 21, 2020 at 12:02 PM Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> >
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > Updating linux-yocto/5.8 to the latest korg -stable release that
>> comprises
>> > the following commits:
>> >
>> >     ad8c735b1497 Linux 5.8.2
>> >     7e430e763be2 task_work: only grab task signal lock when needed
>> >     df18711f9c00 io_uring: enable lookup of links holding inflight files
>> >     d181cfc89885 io_uring: add missing REQ_F_COMP_LOCKED for nested
>> requests
>> >     960ea38bfe7a io_uring: hold 'ctx' reference around task_work queue
>> + execute
>> >     a4418e11cf9b io_uring: Fix NULL pointer dereference in
>> loop_rw_iter()
>> >     06f96778837e s390/gmap: improve THP splitting
>> >     74e0d05fc682 s390/numa: set node distance to LOCAL_DISTANCE
>> >     d7776a09f52a s390/dasd: fix inability to use DASD with DIAG driver
>> >     2026a268071e drm/xen-front: Fix misused IS_ERR_OR_NULL checks
>> >     f798d7de4a01 xen/gntdev: Fix dmabuf import with non-zero sgt offset
>> >     1cd690215d30 xen/balloon: make the balloon wait interruptible
>> >     e26aab6587b1 xen/balloon: fix accounting in
>> alloc_xenballooned_pages error path
>> >     8a2845246554 firmware_loader: EFI firmware loader must handle
>> pre-allocated buffer
>> >     6573d3c1f402 irqdomain/treewide: Free firmware node after domain
>> removal
>> >     86caf5d8ac3e firmware: qcom_scm: Fix legacy convention SCM accessors
>> >     0255b5803332 ARM: 8992/1: Fix unwind_frame for clang-built kernels
>> >     89a16b68221c ARM: dts: exynos: Extend all Exynos5800 A15's OPPs
>> with max voltage data
>> >     dc12363fb7ff parisc: mask out enable and reserved bits from sba
>> imask
>> >     c33370975ce4 parisc: Implement __smp_store_release and
>> __smp_load_acquire barriers
>> >     5efde2158258 parisc: Do not use an ordered store in pa_tlb_lock()
>> >     0730d6cd49e0 Revert "parisc: Revert "Release spinlocks using
>> ordered store""
>> >     56b60c71143a Revert "parisc: Use ldcw instruction for SMP spinlock
>> release barrier"
>> >     40ab3539bc7c Revert "parisc: Drop LDCW barrier in CAS code when
>> running UP"
>> >     6044b0d92ac6 Revert "parisc: Improve interrupt handling in
>> arch_spin_lock_flags()"
>> >     49b9263b2a15 Revert "mm/vmstat.c: do not show lowmem reserve
>> protection information of empty zone"
>> >     0e2d35b34891 erofs: fix extended inode could cross boundary
>> >     00a43cd24d66 mtd: spi-nor: intel-spi: Simulate WRDI command
>> >     a2e5af466884 mtd: rawnand: qcom: avoid write to unavailable register
>> >     118612569083 spi: spidev: Align buffers for DMA
>> >     1e4d8a76f09e PM / devfreq: Fix indentaion of devfreq_summary
>> debugfs node
>> >     83e35713b3d4 PM / devfreq: rk3399_dmc: Fix kernel oops when
>> rockchip,pmu is absent
>> >     4eeeaca1e935 include/asm-generic/vmlinux.lds.h: align ro_after_init
>> >     768eb23b7670 MIPS: VZ: Only include loongson_regs.h for
>> CPU_LOONGSON64
>> >     f9bb92d06d9a cpufreq: dt: fix oops on armada37xx
>> >     e147c355b717 cpufreq: Fix locking issues with governors
>> >     8ad74327fb4b NFS: Don't return layout segments that are in use
>> >     8a7dfccb581f NFS: Don't move layouts to plh_return_segs list while
>> in use
>> >     4db216cc1d59 io_uring: sanitize double poll handling
>> >     fe552346a87b io_uring: fail poll arm on queue proc failure
>> >     3c5d00a21128 io_uring: use TWA_SIGNAL for task_work uncondtionally
>> >     93bc88750e69 io_uring: set ctx sq/cq entry count earlier
>> >     3c374f0e63d7 drm/ttm/nouveau: don't call tt destroy callback on
>> alloc failure.
>> >     441ba3c8300b media: media-request: Fix crash if memory allocation
>> fails
>> >     0a4d8f8bc3c9 driver core: Fix probe_count imbalance in
>> really_probe()
>> >     eb0b64b4817c 9p: Fix memory leak in v9fs_mount
>> >     72bc544c0dd4 kvm: x86: replace kvm_spec_ctrl_test_value with
>> runtime test on the host
>> >     2e91bbf598b2 fs/minix: reject too-large maximum file size
>> >     4ded4aeb84a7 fs/minix: don't allow getting deleted inodes
>> >     3362c7fb3f9a fs/minix: check return value of sb_getblk()
>> >     77e0be9e8212 bitfield.h: don't compile-time validate _val in
>> FIELD_FIT
>> >     d613f0186778 tick/nohz: Narrow down noise while setting current
>> task's tick dependency
>> >     8720986cf5ab crypto: cpt - don't sleep of CRYPTO_TFM_REQ_MAY_SLEEP
>> was not specified
>> >     4a412ab6211b crypto: ccp - Fix use of merged scatterlists
>> >     98df3304a1fc crypto: qat - fix double free in
>> qat_uclo_create_batch_init_list
>> >     a256a5c33ab3 crypto: hisilicon - don't sleep of
>> CRYPTO_TFM_REQ_MAY_SLEEP was not specified
>> >     6158e615334a pstore: Fix linking when crypto API disabled
>> >     32e110843422 tpm: Unify the mismatching TPM space buffer sizes
>> >     ec0cf56ee031 ALSA: usb-audio: add quirk for Pioneer DDJ-RB
>> >     f8b0754bb141 ALSA: usb-audio: work around streaming quirk for
>> MacroSilicon MS2109
>> >     184f08d3789f ALSA: usb-audio: fix overeager device match for
>> MacroSilicon MS2109
>> >     2b4d81f58d9d ALSA: usb-audio: Creative USB X-Fi Pro SB1095 volume
>> knob support
>> >     9af94db4d1b7 ALSA: hda - reverse the setting value in the
>> micmute_led_set
>> >     d81a84e7bba0 ALSA: hda - fix the micmute led status for Lenovo
>> ThinkCentre AIO
>> >     09af2d0326b1 vdpasim: protect concurrent access to iommu iotlb
>> >     53dcbd3acc74 iommu/vt-d: Skip TE disabling on quirky gfx dedicated
>> iommu
>> >     56448553974f usb: cdns3: gadget: always zeroed TRB buffer when
>> enable endpoint
>> >     1425bf7b1be0 USB: serial: cp210x: enable usb generic
>> throttle/unthrottle
>> >     bd5cc29fca5e USB: serial: cp210x: re-enable auto-RTS on open
>> >     e9eb38791a1f r8152: Use MAC address from correct device tree node
>> >     26121668ba97 net: phy: marvell10g: fix null pointer dereference
>> >     6979755c3473 vsock: fix potential null pointer dereference in
>> vsock_poll()
>> >     c1a7c51485e1 net: initialize fastreuse on inet_inherit_port
>> >     fe00aee967ec net: refactor bind_bucket fastreuse into helper
>> >     0306c15114e2 vmxnet3: use correct tcp hdr length when packet is
>> encapsulated
>> >     743ae9f790ec tcp: correct read of TFO keys on big endian systems
>> >     1cccda2d0888 net/tls: Fix kmap usage
>> >     e6e356db45f4 net: Set fput_needed iff FDPUT_FPUT is set
>> >     5512f2549e3d net: phy: fix memory leak in device-create error path
>> >     d556aa7ab7b7 net/nfc/rawsock.c: add CAP_NET_RAW check.
>> >     469cb3bb42d1 net: Fix potential memory leak in proto_register()
>> >     4268aa35b6dd drivers/net/wan/lapbether: Added needed_headroom and a
>> skb->len check
>> >     e85a5151e5f9 af_packet: TPACKET_V3: fix fill status rwlock imbalance
>> >     b879ed3103c1 crypto: aesni - add compatibility with IAS
>> >     335e8039fddd x86/fsgsbase/64: Fix NULL deref in
>> 86_fsgsbase_read_task
>> >     dcab7f26a723 SUNRPC: Fix ("SUNRPC: Add "@len" parameter to
>> gss_unwrap()")
>> >     6c031aec6218 nfsd: avoid a NULL dereference in __cld_pipe_upcall()
>> >     7f84e3caf510 svcrdma: Fix page leak in svc_rdma_recv_read_chunk()
>> >     9bf49b97ab0b mtd: rawnand: brcmnand: Don't default to edu transfer
>> >     a75fc224ebe8 pinctrl-single: fix pcs_parse_pinconf() return value
>> >     eba0e0f5ae94 ocfs2: fix unbalanced locking
>> >     e29f6ba2c10f dlm: Fix kobject memleak
>> >     2bbe1b50734a media: mtk-mdp: Fix a refcounting bug on error in init
>> >     ce1b309dd629 net: thunderx: initialize VF's mailbox mutex before
>> first usage
>> >     8eb42c65f162 selftests/net: relax cpu affinity requirement in
>> msg_zerocopy test
>> >     551cdcc12892 Revert "vxlan: fix tos value before xmit"
>> >     b187671275ac hv_netvsc: do not use VF device if link is down
>> >     adc38af984ad dpaa2-eth: Fix passing zero to 'PTR_ERR' warning
>> >     3f730f7b0edf net: macb: Properly handle phylink on at91sam9x
>> >     92bb2e6b119c net: thunderx: use spin_lock_bh in
>> nicvf_set_rx_mode_task()
>> >     312efc832854 gpio: don't use same lockdep class for all
>> devm_gpiochip_add_data users
>> >     5543ea25c09d fsl/fman: fix eth hash table allocation
>> >     e5a4333e2cdf fsl/fman: check dereferencing null pointer
>> >     d3d5c8c74008 fsl/fman: fix unreachable code
>> >     47fe6d67f941 fsl/fman: fix dereference null return value
>> >     f90112519854 fsl/fman: use 32-bit unsigned integer
>> >     d097ca1397c0 net: spider_net: Fix the size used in a
>> 'dma_free_coherent()' call
>> >     66e007f01aa1 net: sgi: ioc3-eth: Fix the size used in some
>> 'dma_free_coherent()' calls
>> >     d0414b18f877 liquidio: Fix wrong return value in cn23xx_get_pf_num()
>> >     17948294d0ae net: ethernet: aquantia: Fix wrong return value
>> >     fba2cf348d9e net: mvpp2: fix memory leak in mvpp2_rx
>> >     1a6a61db6f4c ftrace: Fix ftrace_trace_task return value
>> >     f10a3fb43b02 net/mlx5: Delete extra dump stack that gives nothing
>> >     b7855bad4c6a net/mlx5: DR, Change push vlan action sequence
>> >     63d91a65f226 tools, bpftool: Fix wrong return value in do_dump()
>> >     fccac9cc36b0 tools, build: Propagate build failures from
>> tools/build/Makefile.build
>> >     060bd61d4cc6 wl1251: fix always return 0 error
>> >     c7565e834207 qtnfmac: Missing platform_device_unregister() on error
>> in qtnf_core_mac_alloc()
>> >     e879051c0828 rtw88: coex: only skip coex triggered by BT info
>> >     1a93abb6a68d rtw88: fix short GI capability based on current
>> bandwidth
>> >     f2a4bd36a126 rtw88: fix LDPC field for RA info
>> >     763c576f095b netfilter: nft_meta: fix iifgroup matching
>> >     ae32b42b3641 ice: Graceful error handling in HW table calloc failure
>> >     f0c20782f637 ice: Clear and free XLT entries on reset
>> >     4bd27fb14f7b s390/qeth: don't process empty bridge port events
>> >     22697ca855c0 s390/qeth: tolerate pre-filled RX buffer
>> >     ee9f0d33c024 ASoC: fsl_sai: Fix value of FSL_SAI_CR1_RFW_MASK
>> >     3d26a53f004d ASoC: meson: cards: deal dpcm flag change
>> >     224e14999588 ASoC: core: use less strict tests for dailink
>> capabilities
>> >     bd82844099c4 MIPS: only register FTLBPar exception handler for
>> supported models
>> >     6edc078a22a2 libbpf: Fix register in PT_REGS MIPS macros
>> >     fbcedc1579f5 drm/msm/dpu: don't use INTF_INPUT_CTRL feature on
>> sdm845
>> >     77c8cfdf8084 net: ll_temac: Use
>> devm_platform_ioremap_resource_byname()
>> >     7a4c9d17c8bc ASoC: soc-core: Fix regression causing sysfs entries
>> to disappear
>> >     0c7d64caaf13 ASoC: meson: axg-tdm-formatters: fix sclk inversion
>> >     036a8c923358 ASoC: meson: axg-tdmin: fix g12a skew
>> >     30fde1d41d73 ASoC: meson: axg-tdm-interface: fix link fmt setup
>> >     3369ed2127bb RDMA/hns: Fix the unneeded process when getting a
>> general type of CQE error
>> >     a6c7b76332b3 RDMA/hns: Fix error during modify qp RTS2RTS
>> >     fd926b32b9ca selftests/powerpc: Fix online CPU selection
>> >     3e444bad470e powerpc/pseries/hotplug-cpu: Remove double free in
>> error path
>> >     c2ff56c52846 cpufreq: ap806: fix cpufreq driver needs ap cpu clk
>> >     40e453d8a9df PCI: Release IVRS table in AMD ACS quirk
>> >     c62142f3b48b RDMA/netlink: Remove CAP_NET_RAW check when dump a raw
>> QP
>> >     87ccb032ee9f RDMA/rtrs: remove WQ_MEM_RECLAIM for rtrs_wq
>> >     2247e03d8206 RDMA/rtrs-clt: add an additional random 8 seconds
>> before reconnecting
>> >     34503392af35 nvmem: sprd: Fix return value of sprd_efuse_probe()
>> >     081428bc9c3b selftests/powerpc: Fix CPU affinity for child process
>> >     0e03270c6d95 powerpc/boot: Fix CONFIG_PPC_MPC52XX references
>> >     a5baa27249bf powerpc/32s: Fix CONFIG_BOOK3S_601 uses
>> >     94976f931d33 selftests/powerpc: Squash spurious errors due to
>> device removal
>> >     6c96e968f10c xfs: clear XFS_DQ_FREEING if we can't lock the dquot
>> buffer to flush
>> >     5db458a85892 xfs: fix inode allocation block res calculation
>> precedence
>> >     03acd91927d2 net: dsa: rtl8366: Fix VLAN set-up
>> >     427fa4ecef77 net: dsa: rtl8366: Fix VLAN semantics
>> >     536079c88a4f Bluetooth: hci_qca: Stop collecting memdump again for
>> command timeout during SSR
>> >     3d27182481fe Bluetooth: Fix suspend notifier race
>> >     226020402b1f bpf: Fix bpf_ringbuf_output() signature to return long
>> >     8a365b83f67e Bluetooth: hci_serdev: Only unregister device if it
>> was registered
>> >     715faee64cea Bluetooth: hci_h5: Set HCI_UART_RESET_ON_INIT to
>> correct flags
>> >     267dac50f18e Bluetooth: btusb: Fix and detect most of the Chinese
>> Bluetooth controllers
>> >     a7d08a5c1ed4 power: supply: check if calc_soc succeeded in
>> pm860x_init_battery
>> >     1fe77db0d48b Smack: prevent underflow in smk_set_cipso()
>> >     cdb83ad0c45b Smack: fix another vsscanf out of bounds
>> >     16b5b7dd945e RDMA/core: Fix return error value in _ib_modify_qp()
>> to negative
>> >     e415706d69fe PCI: cadence: Fix updating Vendor ID and Subsystem
>> Vendor ID register
>> >     8398e98caec2 PCI: cadence: Fix cdns_pcie_{host|ep}_setup() error
>> path
>> >     6c7b87f48585 gpio: regmap: fix type clash
>> >     38c296c86322 macintosh/via-macii: Access autopoll_devs when inside
>> lock
>> >     d2b414c7916e powerpc/watchpoint: Fix DAWR exception for CACHEOP
>> >     50b0fe566b11 powerpc/watchpoint: Fix DAWR exception constraint
>> >     93f7e2100c93 powerpc/watchpoint: Fix 512 byte boundary limit
>> >     1e43aee1568e bpf: Fix pos computation for bpf_iter seq_ops->start()
>> >     7aa88d36b692 net: dsa: mv88e6xxx: MV88E6097 does not support jumbo
>> configuration
>> >     04ce7e5016de scsi: core: Add missing scsi_device_put() in
>> scsi_host_block()
>> >     c16097b56df8 scsi: mesh: Fix panic after host or bus reset
>> >     14f820a1b601 scsi: megaraid_sas: Clear affinity hint
>> >     1bcba06e5888 usb: gadget: f_uac2: fix AC Interface Header
>> Descriptor wTotalLength
>> >     88dcd13872b1 usb: dwc2: Fix error path in gadget registration
>> >     816adf48d9ff usb: dwc3: meson-g12a: fix shared reset control use
>> >     de27452f2308 thermal: int340x: processor_thermal: fix: update
>> Jasper Lake PCI id
>> >     0415ff8c7d6e MIPS: OCTEON: add missing put_device() call in
>> dwc3_octeon_device_init()
>> >     214d219e48a2 PCI: rcar: Fix runtime PM imbalance on error
>> >     0d4b670195f5 powerpc/spufs: Fix the type of ret in
>> spufs_arch_write_note
>> >     a1d76052b1e3 ASoC: hdac_hda: fix deadlock after PCM open error
>> >     7593350d7b72 qed: Fix ILT and XRCD bitmap memory leaks
>> >     4a7063478d13 ASoC: tas2770: Fix reset gpio property name
>> >     360ee482151c tools/bpftool: Fix error handing in do_skeleton()
>> >     23072846b309 s390/bpf: Tolerate not converging code shrinking
>> >     a463d46b323c s390/bpf: Use brcl for jumping to exit_ip if necessary
>> >     fa9a83dab397 s390/bpf: Fix sign extension in branch_ku
>> >     cec737d79fa4 phy: armada-38x: fix NETA lockup when repeatedly
>> switching speeds
>> >     e5e386a90961 mt76: mt7615: fix possible memory leak in
>> mt7615_mcu_wtbl_sta_add
>> >     3432b568dec4 mt76: mt7915: add missing CONFIG_MAC80211_DEBUGFS
>> >     d8177e088f10 mt76: mt7915: potential array overflow in
>> mt7915_mcu_tx_rate_report()
>> >     fbdc18979b1d mt76: mt7615: fix potential memory leak in mcu message
>> handler
>> >     8c2729a1ead8 mt76: mt7663u: fix potential memory leak in mcu
>> message handler
>> >     6aee19b46bc7 mt76: mt7663u: fix memory leak in set key
>> >     a73ed0f9bca1 powerpc/perf: Fix missing is_sier_aviable() during
>> build
>> >     66ce4246d1d3 coresight: etm4x: Fix save/restore during cpu idle
>> >     3e75f65575c9 coresight: tmc: Fix TMC mode read in
>> tmc_read_unprepare_etb()
>> >     91813b6c4a71 coresight: etmv4: Counter values not saved on disable
>> >     9b975cf2fb05 coresight: etmv4: Fix resource selector constant
>> >     6d52214425ce thermal: ti-soc-thermal: Fix reversed condition in
>> ti_thermal_expose_sensor()
>> >     99075b81545c usb: core: fix quirks_param_set() writing to a const
>> pointer
>> >     e9ba39efa669 clk: qcom: gcc: Make disp gpll0 branch aon for
>> sc7180/sdm845
>> >     ef54393965e4 USB: serial: iuu_phoenix: fix led-activity helpers
>> >     d1ffb4446102 PCI: loongson: Use DECLARE_PCI_FIXUP_EARLY for
>> bridge_class_quirk()
>> >     9d42c78119a0 spi: lantiq-ssc: Fix warning by using WQ_MEM_RECLAIM
>> >     75d9f30b8b56 gpu: ipu-v3: Restore RGB32, BGR32
>> >     19a106b23be9 drm/imx: tve: fix regulator_disable error path
>> >     68c15a6dbc77 drm/imx: fix use after free
>> >     20d2eba09230 powerpc/book3s64/pkeys: Use PVR check instead of cpu
>> feature
>> >     aa11151dd892 powerpc/mm/radix: Free PUD table when freeing pagetable
>> >     05d976032bb8 phy: renesas: rcar-gen3-usb2: move irq registration to
>> init
>> >     27d42b1bcde1 media: s5p-g2d: Fix a memory leak in an error handling
>> path in 'g2d_probe()'
>> >     9922de2681e2 go7007: add sanity checking for endpoints
>> >     43a040aea142 PCI/ASPM: Add missing newline in sysfs 'policy'
>> >     94fbbc3cdd99 ASoC: meson: fixes the missed kfree() for
>> axg_card_add_tdm_loopback
>> >     c660787eb906 staging: rtl8192u: fix a dubious looking mask before a
>> shift
>> >     263875d7b606 ima: Fail rule parsing when the KEY_CHECK hook is
>> combined with an invalid cond
>> >     c7e3b96d1229 ima: Fail rule parsing when the KEXEC_CMDLINE hook is
>> combined with an invalid cond
>> >     8e07cdb1778e ima: Fail rule parsing when buffer hook functions have
>> an invalid action
>> >     bd6f756234dc ima: Free the entire rule if it fails to parse
>> >     644a11adfcc7 ima: Free the entire rule when deleting a list of rules
>> >     96022c3ddf63 ima: Have the LSM free its audit rule
>> >     b76ca3f373b5 RDMA/rxe: Prevent access to wr->next ptr afrer wr is
>> posted to send queue
>> >     bdb550b1e420 RDMA/qedr: Add EDPM max size to alloc ucontext response
>> >     06e28eb3bcef RDMA/qedr: Add EDPM mode type for user-fw compatibility
>> >     01fdb8e7c330 RDMA/qedr: SRQ's bug fixes
>> >     99d321c2a921 Bluetooth: Fix update of connection state in
>> `hci_encrypt_cfm`
>> >     13b052362be4 powerpc/vdso: Fix vdso cpu truncation
>> >     fbbdd2434157 powerpc/rtas: don't online CPUs for partition suspend
>> >     d411475796be powerpc/pseries: remove cede offline state for CPUs
>> >     358d38e35d6d kernfs: do not call fsnotify() with name without a
>> parent
>> >     bc2599182f8e mwifiex: Prevent memory corruption handling keys
>> >     63f6498a979a bpfilter: Initialize pos variable
>> >     7a3c6b8c2987 scsi: scsi_debug: Add check for sdebug_max_queue
>> during module init
>> >     b62846a209d8 drm/bridge: sil_sii8620: initialize return of
>> sii8620_readb
>> >     43e8b3c268aa mmc: sdhci-of-arasan: Add missed checks for
>> devm_clk_register()
>> >     adb10d0dc592 phy: exynos5-usbdrd: Calibrating makes sense only for
>> USB2.0 PHY
>> >     a4fc32a7cebd dt-bindings: phy: uniphier: Fix incorrect clocks and
>> clock-names for PXs3 usb3-hsphy
>> >     84cbf55c6744 phy: cadence: salvo: fix wrong bit definition
>> >     16835dc05924 drm: panel: simple: Fix bpc for LG LB070WV8 panel
>> >     413d189f9a3c leds: core: Flush scheduled work for system suspend
>> >     c5450ee5eb1a kobject: Avoid premature parent object freeing in
>> kobject_cleanup()
>> >     49d6de41c9da drm/stm: repair runtime power management
>> >     f59499bcd70d samples: bpf: Fix bpf programs with kprobe/sys_connect
>> event
>> >     5c7ca8d75dce PCI: Fix pci_cfg_wait queue locking problem
>> >     e36653b51177 RDMA/rxe: Skip dgid check in loopback mode
>> >     6d283e10b30f xfs: fix reflink quota reservation accounting error
>> >     95c286034452 xfs: don't eat an EIO/ENOSPC writeback error when
>> scrubbing data fork
>> >     9ff3281d903f xfs: preserve rmapbt swapext block reservation from
>> freed blocks
>> >     4173d4194d77 media: cros-ec-cec: do not bail on device_init_wakeup
>> failure
>> >     050f814243b6 media: exynos4-is: Add missed check for
>> pinctrl_lookup_state()
>> >     200a75ac7e46 media: tvp5150: Add missed media_entity_cleanup()
>> >     dc2ac5c3a96a media: staging: rkisp1: rsz: fix resolution limitation
>> on sink pad
>> >     39e5b396bc9d media: staging: rkisp1: rsz: supported formats are the
>> isp's src formats, not sink formats
>> >     94f0fc91b3fd media: allegro: Fix some NULL vs IS_ERR() checks in
>> probe
>> >     9f32f439a33f media: firewire: Using uninitialized values in
>> node_probe()
>> >     101df88a5837 ipvs: allow connection reuse for unconfirmed conntrack
>> >     013c7b012461 scsi: eesox: Fix different dev_id between
>> request_irq() and free_irq()
>> >     64c6cd408d98 scsi: powertec: Fix different dev_id between
>> request_irq() and free_irq()
>> >     9b470925a9dc RDMA/core: Fix bogus WARN_ON during
>> ib_unregister_device_queued()
>> >     8cb26b10f5b7 dma-buf: fix dma-fence-chain out of order test
>> >     b48e8758634a iavf: Fix updating statistics
>> >     1c5da372e87e iavf: fix error return code in
>> iavf_init_get_resources()
>> >     290ca6a85627 staging: vchiq_arm: Add a matching unregister call
>> >     6545d3462e35 drm/radeon: fix array out-of-bounds read and write
>> issues
>> >     9707e1a7f8ac drm/amdgpu: ensure 0 is returned for success in
>> jpeg_v2_5_wait_for_idle
>> >     8ee5083de201 drm/amdgpu/debugfs: fix memory leak when
>> amdgpu_virt_enable_access_debugfs failed
>> >     5e3b4e09c9b9 scsi: qla2xxx: Make __qla2x00_alloc_iocbs() initialize
>> 32 bits of request_t.handle
>> >     da3684003dc1 tracing: Move pipe reference to trace array instead of
>> current_tracer
>> >     d579cc130a28 net: ethernet: ti: am65-cpsw-nuss: restore vlan
>> configuration while down/up
>> >     33333c08d28a lkdtm: Make arch-specific tests always available
>> >     a4c1f5314327 selftests/lkdtm: Reset WARN_ONCE to avoid false
>> negatives
>> >     5397915bf77b lkdtm: Avoid more compiler optimizations for bad writes
>> >     fe1f13b572b2 cxl: Fix kobject memleak
>> >     cb52bc02e65d drm/mipi: use dcs write for
>> mipi_dsi_dcs_set_tear_scanline
>> >     bdcfb3217816 scsi: ufs: Disable WriteBooster capability for
>> non-supported UFS devices
>> >     b5118d2bbb8e scsi: cumana_2: Fix different dev_id between
>> request_irq() and free_irq()
>> >     36428bc924e6 net: atlantic: MACSec offload statistics checkpatch fix
>> >     10b8d2696578 ASoC: Intel: Boards: cml_rt1011_rt5682: use statically
>> define codec config
>> >     e6046c52f127 ASoC: Intel: bxt_rt298: add missing .owner field
>> >     5ee90079d049 ASoC: Intel: sof_sdw: add missing .owner field
>> >     f678fb5fd3ba ASoC: Intel: cml_rt1011_rt5682: add missing .owner
>> field
>> >     72425036a6c5 ASoC: SOF: nocodec: add missing .owner field
>> >     37c77ff3b1cc dpaa2-eth: fix condition for number of buffer acquire
>> retries
>> >     ed3f590f2ac6 staging: most: avoid null pointer dereference when
>> iface is null
>> >     10738d622ef0 media: omap3isp: Add missed v4l2_ctrl_handler_free()
>> for preview_init_entities()
>> >     41013c90d84c media: marvell-ccic: Add missed
>> v4l2_async_notifier_cleanup()
>> >     eadd4aa1c520 media: cxusb-analog: fix V4L2 dependency
>> >     b50202c0770c Bluetooth: btmtksdio: fix up firmware download sequence
>> >     6fb4ccc66e01 Bluetooth: btusb: fix up firmware download sequence
>> >     56704a6ba1c7 ASoC: fsl_easrc: Fix uninitialized scalar variable in
>> fsl_easrc_set_ctx_format
>> >     d304a3f78d1b leds: lm355x: avoid enum conversion warning
>> >     d95947426c42 powerpc/fixmap: Fix FIX_EARLY_DEBUG_BASE when page
>> size is 256k
>> >     10057c82dd62 powerpc/mm: Fix typo in IS_ENABLED()
>> >     47fea4d1a23f clk: bcm63xx-gate: fix last clock availability
>> >     a29030741107 drm/arm: fix unintentional integer overflow on left
>> shift
>> >     3ea4204a722a drm/panfrost: Fix inbalance of devfreq
>> record_busy/idle()
>> >     b9af8ae89d51 drm/etnaviv: Fix error path on failure to enable bus
>> clk
>> >     7022baca7cfb scsi: ufs: Fix imprecise load calculation in devfreq
>> window
>> >     c53b4ac934e4 iio: amplifiers: ad8366: Change devm_gpiod_get() to
>> optional and add the missed check
>> >     0f3ff5cba631 iio: improve IIO_CONCENTRATION channel type description
>> >     5af9cf807b5e Bluetooth: hci_qca: Increase SoC idle timeout to 200ms
>> >     1d22f52161b2 Bluetooth: hci_qca: Bug fix during SSR timeout
>> >     17e8eb2db9cc ath10k: Acquire tx_lock in tx error paths
>> >     1b1cacc13022 Bluetooth: Allow suspend even when preparation has
>> failed
>> >     4f87bf4b50b5 Bluetooth: hci_qca: Only remove TX clock vote after TX
>> is completed
>> >     88959e705f04 drm/mm: fix hole size comparison
>> >     fe7a5d7fdea5 Bluetooth: hci_qca: Fix an error pointer dereference
>> >     f1785f21b6be video: pxafb: Fix the function used to balance a
>> 'dma_alloc_coherent()' call
>> >     92f18805fd07 console: newport_con: fix an issue about leak related
>> system resources
>> >     ec47a8107033 video: fbdev: sm712fb: fix an issue about iounmap for
>> a wrong address
>> >     4d2663776cae btmrvl: Fix firmware filename for sd8997 chipset
>> >     2e00553ce46e btmrvl: Fix firmware filename for sd8977 chipset
>> >     86faf4735ccf mwifiex: Fix firmware filename for sd8997 chipset
>> >     d41c930387d3 mwifiex: Fix firmware filename for sd8977 chipset
>> >     4f82ecd46efe agp/intel: Fix a memory leak on module initialisation
>> failure
>> >     86a94d97881d drm/amdgpu: use the unlocked drm_gem_object_put
>> >     1d2ead5d4b39 drm/bridge: ti-sn65dsi86: Fix off-by-one error in
>> clock choice
>> >     b81b49591375 drm/bridge: ti-sn65dsi86: Clear old error bits before
>> AUX transfers
>> >     d65751086ca7 drm/gem: Fix a leak in drm_gem_objects_lookup()
>> >     7c83c5090850 drm/msm: ratelimit crtc event overflow error
>> >     46c8b2e8255c crypto: caam - silence .setkey in case of bad key
>> length
>> >     d5c9f20e4ad7 io_uring: fix stalled deferred requests
>> >     458ae14d4ce5 io_uring: fix racy overflow count reporting
>> >     7ab9b92b614d ACPICA: Do not increment operation_region reference
>> counts for field units
>> >     064c5272a19d btrfs: qgroup: free per-trans reserved space when a
>> subvolume gets dropped
>> >     16a35c7dd8f4 btrfs: allow btrfs_truncate_block() to fallback to
>> nocow for data space reservation
>> >     11bf4638158a bcache: fix super block seq numbers comparision in
>> register_cache_set()
>> >     20fa1e9929e8 dyndbg: fix a BUG_ON in ddebug_describe_flags
>> >     2f92047fea41 usb: bdc: Halt controller on suspend
>> >     8415df3d6eb1 bdc: Fix bug causing crash after multiple disconnects
>> >     7677cbd18b99 usb: gadget: net2280: fix memory leak on probe error
>> handling paths
>> >     fa979805e400 mmc: sdhci-pci-o2micro: Bug fix for O2 host controller
>> Seabird1
>> >     d5bf76c14acd x86/uaccess: Make __get_user_size() Clang compliant on
>> 32-bit
>> >     c234811c3754 ionic: update eid test for overflow
>> >     7ee88f37ad1b drm/amd/powerplay: suppress compile error around BUG_ON
>> >     2ae6cbe7652a gpu: host1x: debug: Fix multiple channels emitting
>> messages simultaneously
>> >     4e701b476f48 iwlegacy: Check the return value of
>> pcie_capability_read_*()
>> >     79f477d1beac platform/x86: asus-nb-wmi: add support for ASUS ROG
>> Zephyrus G14 and G15
>> >     b195c3db8434 brcmfmac: set state of hanger slot to FREE when
>> flushing PSQ
>> >     f41a2583e10b brcmfmac: To fix Bss Info flag definition Bug
>> >     38a031bbdfd3 brcmfmac: keep SDIO watchdog running when
>> console_interval is non-zero
>> >     93e05fd717de Bluetooth: hci_qca: Bug fixes for SSR
>> >     a82baea4babd bpf: Fix fds_example SIGSEGV error
>> >     e9496b4f3165 drm/amd/powerplay: fix compile error with ARCH=arc
>> >     e4c9ade43bc5 drm/amd/display: allow query ddc data over aux to be
>> read only operation
>> >     81ece245ce78 drm/amdgpu/display: properly guard the calls to swSMU
>> functions
>> >     53812570f84c drm/amdgpu/display bail early in
>> dm_pp_get_static_clocks
>> >     865e2dbadf68 drm/amdgpu/debugfs: fix ref count leak when
>> pm_runtime_get_sync fails
>> >     1adb2ff1f6b1 drm/amd/display: Improve DisplayPort monitor interop
>> >     1839d11b9bb2 mm/mmap.c: Add cond_resched() for exit_mmap() CPU
>> stalls
>> >     b70d115ebdcf irqchip/irq-mtk-sysirq: Replace spinlock with
>> raw_spinlock
>> >     d77ecc91b0d8 net: phy: mscc: restore the base page in
>> vsc8514/8584_config_init
>> >     befe5de6250b drm/radeon: disable AGP by default
>> >     175bbacf669b drm/debugfs: fix plain echo to connector "force"
>> attribute
>> >     376bf3ddda59 drm/msm: Fix a null pointer access in
>> msm_gem_shrinker_count()
>> >     37f45e55b596 drm: msm: a6xx: fix gpu failure after system resume
>> >     f2ea1e1877d0 usb: mtu3: clear dual mode of u3port when disable
>> device
>> >     870ed79fc2b7 btrfs: fix lockdep splat from btrfs_dump_space_info
>> >     14fad4e83050 mmc: sdhci-cadence: do not use hardware tuning for SD
>> mode
>> >     085af96b1506 drm/nouveau: fix multiple instances of reference count
>> leaks
>> >     ff0ef144057e drm/nouveau: fix reference count leak in
>> nouveau_debugfs_strap_peek
>> >     ef11e2b533de memory: samsung: exynos5422-dmc: Do not ignore return
>> code of regmap_read()
>> >     1020d869babf ionic: rearrange reset and bus-master control
>> >     51d26960fcb0 drm/etnaviv: fix ref count leak via pm_runtime_get_sync
>> >     49395a64e5f5 arm64: dts: hisilicon: hikey: fixes to comply with
>> adi, adv7533 DT binding
>> >     256d7e3a6752 drm/nouveau/kms/nv50-: Fix disabling dithering
>> >     77a318a4da3e rtw88: 8822ce: add support for device ID 0xc82f
>> >     679d3baca18f md-cluster: fix wild pointer of unlock_all_bitmaps()
>> >     0ff3a2b771b9 bus: ti-sysc: Add missing quirk flags for usb_host_hs
>> >     8131c27f8088 video: fbdev: neofb: fix memory leak in
>> neo_scan_monitor()
>> >     5cc3bdb0aea5 video: fbdev: savage: fix memory leak on error
>> handling path in probe
>> >     cccec0d3e0ef crypto: aesni - Fix build with LLVM_IAS=1
>> >     90bcb927d66d drm/radeon: Fix reference count leaks caused by
>> pm_runtime_get_sync
>> >     59fed9e55e17 drm/amdgpu: avoid dereferencing a NULL pointer
>> >     6cd01fb89ac9 fs/btrfs: Add cond_resched() for
>> try_release_extent_mapping() stalls
>> >     5a4f7281d5a6 io_uring: fix req->work corruption
>> >     b51a31ec3e7c loop: be paranoid on exit and prevent new additions /
>> removals
>> >     35dfb4f8423e Bluetooth: add a mutex lock to avoid UAF in
>> do_enale_set
>> >     7fd31dbc8ece ARM: exynos: clear L310_AUX_CTRL_FULL_LINE_ZERO in
>> default l2c_aux_val
>> >     be90ca6b1f53 net: mscc: ocelot: fix encoding destination ports into
>> multicast IPv4 address
>> >     9638ef9db839 soc: qcom: rpmh-rsc: Set suppress_bind_attrs flag
>> >     47b94c5c6604 drm/tilcdc: fix leak & null ref in
>> panel_connector_get_modes
>> >     22ca8cb2a5b9 block: don't do revalidate zones on invalid devices
>> >     4c3aeda8791c irqchip/loongson-pch-pic: Fix the misused irq flow
>> handler
>> >     c790d6a2306b nvme-multipath: do not fall back to __nvme_find_path()
>> for non-optimized paths
>> >     ebd5b7f6b99e nvme-multipath: fix logic for non-optimized paths
>> >     a7e15f57766c nvme-rdma: fix controller reset hang during traffic
>> >     c11521f04ed9 nvme-tcp: fix controller reset hang during traffic
>> >     ac26d372f1a3 irqchip/gic-v4.1: Use GFP_ATOMIC flag in
>> allocate_vpe_l1_table()
>> >     bc654671a452 irqchip/irq-bcm7038-l1: Guard uses of cpu_logical_map
>> >     ee9db7fc3a2b kunit: tool: fix improper treatment of file location
>> >     0044496d9440 kunit: tool: fix broken default args in unit tests
>> >     dda3d66364ed irqchip/loongson-liointc: Fix potential dead lock
>> >     922ce733868a irqchip/loongson-pch-pic: Check return value of
>> irq_domain_translate_twocell()
>> >     594496eccb4c irqchip/loongson-htvec: Check return value of
>> irq_domain_translate_onecell()
>> >     6affe6f7db79 irqchip/loongson-htvec: Fix potential resource leak
>> >     1926d2da825f md: raid0/linear: fix dereference before null check on
>> pointer mddev
>> >     51ef07ca87be seccomp: Fix ioctl number for
>> SECCOMP_IOCTL_NOTIF_ID_VALID
>> >     d2d09105657d irqchip/ti-sci-inta: Fix return value about
>> devm_ioremap_resource()
>> >     8705ff60b829 scripts/selinux/mdp: fix initial SID handling
>> >     35d16397b2ab iocost: Fix check condition of iocg abs_vdebt
>> >     793788d7848c ARM: socfpga: PM: add missing put_device() call in
>> socfpga_setup_ocram_self_refresh()
>> >     0e16025c3657 spi: rockchip: Fix error in SPI slave pio read
>> >     7ca8cc7b3ee0 soc: qcom: pdr: Reorder the PD state indication ack
>> >     f743813ff463 arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
>> >     8dcdb3754ffd arm64: dts: meson: misc fixups for w400 dtsi
>> >     ff316db596a8 io_uring: fix sq array offset calculation
>> >     680283e6992d regulator: fix memory leak on error path of
>> regulator_register()
>> >     ca1c20292739 recordmcount: only record relocation of type
>> R_AARCH64_CALL26 on arm64.
>> >     8e7d79dec504 tpm: Require that all digests are present in
>> TCG_PCR_EVENT2 structures
>> >     81fd1c90e748 crypto: x86/crc32c - fix building with clang ias
>> >     6760df0358ef spi: lantiq: fix: Rx overflow error in full duplex mode
>> >     067345b6863f spi: dw-dma: Fix Tx DMA channel working too fast
>> >     af58be14b8c1 ARM: dts: stm32: Fix spi4 pins in stm32mp15-pinctrl
>> >     19798aa6945c ARM: dts: sunxi: bananapi-m2-plus-v1.2: Fix CPU supply
>> voltages
>> >     2f2b61f5cb0c ARM: dts: sunxi: bananapi-m2-plus-v1.2: Add regulator
>> supply to all CPU cores
>> >     3b5043161541 ARM: dts: at91: sama5d3_xplained: change phy-mode
>> >     ea2c9ccdbb33 reset: intel: fix a compile warning about REG_OFFSET
>> redefined
>> >     14ae200d052b ARM: dts: exynos: Disable frequency scaling for FSYS
>> bus on Odroid XU3 family
>> >     c1e877ce5e12 ARM: at91: pm: add missing put_device() call in
>> at91_pm_sram_init()
>> >     4f8c0858195c ARM: dts: gose: Fix ports node name for adv7612
>> >     141b07accc60 arm64: dts: renesas: Fix SD Card/eMMC interface device
>> node names
>> >     459fae59fa50 ARM: dts: gose: Fix ports node name for adv7180
>> >     7b49da0dd3f4 platform/x86: intel-vbtn: Fix return value check in
>> check_acpi_dev()
>> >     54ba0892aabc platform/x86: intel-hid: Fix return value check in
>> check_acpi_dev()
>> >     40bd5e36e27e m68k: mac: Fix IOP status/control register writes
>> >     6b4132d29576 m68k: mac: Don't send IOP message until channel is idle
>> >     d3e1f3ea5877 clk: scmi: Fix min and max rate when registering
>> clocks with discrete rates
>> >     02a4e7bc34eb crypto: qat - allow xts requests not multiple of block
>> >     d4ec29ee8836 sched/uclamp: Fix initialization of struct uclamp_rq
>> >     6d67baf624c6 arm64: dts: exynos: Fix silent hang after boot on
>> Espresso
>> >     0c348e7b0380 arm64: dts: sun50i-pinephone: dldo4 must not be >= 1.8V
>> >     660f9b20f525 firmware: arm_scmi: Fix SCMI genpd domain probing
>> >     7ea14136a7d4 rcu/tree: Repeat the monitor if any free channel is
>> busy
>> >     a1e2c6d58bd8 ARM: exynos: MCPM: Restore big.LITTLE cpuidle support
>> >     c7b6519619aa crypto: ccree - fix resource leak on error path
>> >     06769a572492 soc: qcom: rpmh-rsc: Don't use ktime for timeout in
>> write_tcs_reg_sync()
>> >     00734ff000fc blktrace: fix debugfs use after free
>> >     71fc8e5f4cc3 memory: tegra: Fix an error handling path in
>> tegra186_emc_probe()
>> >     d84a71c79a0c arm64: dts: qcom: msm8916: Replace invalid
>> bias-pull-none property
>> >     f6ab00652486 crc-t10dif: Fix potential crypto notify dead-lock
>> >     012f0e4c9732 EDAC: Fix reference count leaks
>> >     b069187f3044 arm64: dts: rockchip: fix rk3399-puma gmac reset gpio
>> >     ae3da7d2be00 arm64: dts: rockchip: fix rk3399-puma vcc5v0-host gpio
>> >     4df058114a1c arm64: dts: rockchip: fix rk3368-lion gmac reset gpio
>> >     6624632301bc sched: correct SD_flags returned by tl->sd_flags()
>> >     4b53a8f2aed2 sched/fair: Fix NOHZ next idle balance
>> >     f08ce56b56fe x86, sched: Bail out of frequency invariance if
>> turbo_freq/base_freq gives 0
>> >     6ddc271a3a55 x86, sched: Bail out of frequency invariance if turbo
>> frequency is unknown
>> >     2b611e8adc57 x86, sched: check for counters overflow in frequency
>> invariant accounting
>> >     792aececc15d perf/x86/intel/uncore: Fix oops when counting IMC
>> uncore events on some TGL
>> >     421caf5e2ba9 x86/mce/inject: Fix a wrong assignment of i_mce.status
>> >     1e5993c9e22c ARM: dts: stm32: fix uart7_pins_a comments in
>> stm32mp15-pinctrl
>> >     ca1e6f9272ac ARM: dts: stm32: fix uart nodes ordering in
>> stm32mp15-pinctrl
>> >     d6828c99ab8a HID: input: Fix devices that return multiple bytes in
>> battery report
>> >     7701efa45b5b io_uring: abstract out task work running
>> >     2f2bf462d1d4 kunit: capture stderr on all make subprocess calls
>> >     0534d726fffe tracepoint: Mark __tracepoint_string's __used
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > ---
>> >  .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
>> >  .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
>> >  meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
>> >  3 files changed, 18 insertions(+), 18 deletions(-)
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
>> > index e23e7dcfb1..6317f8da7b 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
>> > @@ -11,13 +11,13 @@ python () {
>> >          raise bb.parse.SkipRecipe("Set
>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>> >  }
>> >
>> > -SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
>> > -SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
>> > +SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
>> > +SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
>> >
>> >  SRC_URI = "git://
>> git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
>> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
>> \
>> >             git://
>> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=$%7BKMETA%7D>
>> "
>> >
>> > -LINUX_VERSION ?= "5.8.1"
>> > +LINUX_VERSION ?= "5.8.2"
>> >
>> >  LIC_FILES_CHKSUM =
>> "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
>> > index 36a8ae4577..022779f97f 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
>> > @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
>> >
>> >  require recipes-kernel/linux/linux-yocto.inc
>> >
>> > -LINUX_VERSION ?= "5.8.1"
>> > +LINUX_VERSION ?= "5.8.2"
>> >  LIC_FILES_CHKSUM =
>> "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>> >
>> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
>> d)}"
>> > @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>> >  KMETA = "kernel-meta"
>> >  KCONF_BSP_AUDIT_LEVEL = "2"
>> >
>> > -SRCREV_machine_qemuarm ?= "566e869df9400258b6f162bf34933f5b6dcd0115"
>> > -SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
>> > -SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
>> > +SRCREV_machine_qemuarm ?= "15d5da73971d108241be861b5587949fd56933e9"
>> > +SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
>> > +SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
>> >
>> >  PV = "${LINUX_VERSION}+git${SRCPV}"
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
>> b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
>> > index aad689590c..ea167c1866 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
>> > @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
>> >  KBRANCH_qemux86-64 ?= "v5.8/standard/base"
>> >  KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
>> >
>> > -SRCREV_machine_qemuarm ?= "097417e785af04be0cbe757bc6e24456a3f701fd"
>> > -SRCREV_machine_qemuarm64 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
>> > -SRCREV_machine_qemumips ?= "1fc5490bef8322680d73f6ab2c7b666eccc3bce1"
>> > -SRCREV_machine_qemuppc ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
>> > -SRCREV_machine_qemuriscv64 ?=
>> "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
>> > -SRCREV_machine_qemux86 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
>> > -SRCREV_machine_qemux86-64 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
>> > -SRCREV_machine_qemumips64 ?= "e61fc06792254eed92c6908a9b35790ed54b0ace"
>> > -SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
>> > -SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
>> > +SRCREV_machine_qemuarm ?= "ca2de8f4027075ca7d7c973c2cc03f7d8b219a43"
>> > +SRCREV_machine_qemuarm64 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
>> > +SRCREV_machine_qemumips ?= "5e0205a156d14b6341487a169b75ea45b67007b9"
>> > +SRCREV_machine_qemuppc ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
>> > +SRCREV_machine_qemuriscv64 ?=
>> "3eb064c5f2b3938ef296c016bc7904cd66f50329"
>> > +SRCREV_machine_qemux86 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
>> > +SRCREV_machine_qemux86-64 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
>> > +SRCREV_machine_qemumips64 ?= "576f92f17434ae7dd027e8d465a32e4119ead4ee"
>> > +SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
>> > +SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
>> >
>> >  # remap qemuarm to qemuarma15 for the 5.8 kernel
>> >  # KMACHINE_qemuarm ?= "qemuarma15"
>> > @@ -30,7 +30,7 @@ SRC_URI = "git://
>> git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
>> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRA>
>> >             git://
>> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=$%7BKMETA%7D>
>> "
>> >
>> >  LIC_FILES_CHKSUM =
>> "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>> > -LINUX_VERSION ?= "5.8.1"
>> > +LINUX_VERSION ?= "5.8.2"
>> >
>> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
>> d)}"
>> >  DEPENDS += "openssl-native util-linux-native"
>> > --
>> > 2.19.1
>> >
>> >
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f179ed05ad7a725d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Aug 22, 2020 at 12:16 PM Bruce Ashfield via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;b=
ruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fo=
nt-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, Aug 22, 2020 at 4:20 AM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bru=
ce<br>
<br>
On rv64 I am seeing an error while building lttng<br>
<br>
=C2=A0#error &quot;LTTng-modules requires CONFIG_KPROBES on kernels &gt;=
=3D 5.7.0&quot;<br>
|=C2=A0 =C2=A0 20 | # error &quot;LTTng-modules requires CONFIG_KPROBES on=
 kernels &gt;=3D 5.7.0&quot;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0^~~~~<br>
<br></blockquote><div><br></div><div><div style=3D"font-size:small">I spun=
 up a local build and will have a look.</div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I wonder if we need to update defconfig<br>
<br></blockquote><div><br></div><div><div style=3D"font-size:small">There&=
#39;s no changes in the config (it is using the standard ktype), so it shou=
ld be enabled. But I&#39;ll check it out in detail once my build errors out=
.</div><div style=3D"font-size:small"><br></div></div></div></div></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">As near as I can tell, I don&#39;t see any kprobes support in arch/risc=
v. At least not in the standard HAVE_KBPROBES sort of way.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">If there really is kprobes support, we =
need to figure out how to tell lttng-modules to not look at that symbol. Ot=
herwise, it looks like development is required to get lttng-modules working=
 and we may need to skip that build.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><=
div style=3D"font-size:small"></div><div style=3D"font-size:small">Bruce</d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
On Fri, Aug 21, 2020 at 12:02 PM Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.as=
hfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Updating linux-yocto/5.8 to the latest korg -stable release that comp=
rises<br>
&gt; the following commits:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ad8c735b1497 Linux 5.8.2<br>
&gt;=C2=A0 =C2=A0 =C2=A07e430e763be2 task_work: only grab task signal lock=
 when needed<br>
&gt;=C2=A0 =C2=A0 =C2=A0df18711f9c00 io_uring: enable lookup of links hold=
ing inflight files<br>
&gt;=C2=A0 =C2=A0 =C2=A0d181cfc89885 io_uring: add missing REQ_F_COMP_LOCK=
ED for nested requests<br>
&gt;=C2=A0 =C2=A0 =C2=A0960ea38bfe7a io_uring: hold &#39;ctx&#39; referenc=
e around task_work queue + execute<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4418e11cf9b io_uring: Fix NULL pointer dereferenc=
e in loop_rw_iter()<br>
&gt;=C2=A0 =C2=A0 =C2=A006f96778837e s390/gmap: improve THP splitting<br>
&gt;=C2=A0 =C2=A0 =C2=A074e0d05fc682 s390/numa: set node distance to LOCAL=
_DISTANCE<br>
&gt;=C2=A0 =C2=A0 =C2=A0d7776a09f52a s390/dasd: fix inability to use DASD =
with DIAG driver<br>
&gt;=C2=A0 =C2=A0 =C2=A02026a268071e drm/xen-front: Fix misused IS_ERR_OR_=
NULL checks<br>
&gt;=C2=A0 =C2=A0 =C2=A0f798d7de4a01 xen/gntdev: Fix dmabuf import with no=
n-zero sgt offset<br>
&gt;=C2=A0 =C2=A0 =C2=A01cd690215d30 xen/balloon: make the balloon wait in=
terruptible<br>
&gt;=C2=A0 =C2=A0 =C2=A0e26aab6587b1 xen/balloon: fix accounting in alloc_=
xenballooned_pages error path<br>
&gt;=C2=A0 =C2=A0 =C2=A08a2845246554 firmware_loader: EFI firmware loader =
must handle pre-allocated buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A06573d3c1f402 irqdomain/treewide: Free firmware nod=
e after domain removal<br>
&gt;=C2=A0 =C2=A0 =C2=A086caf5d8ac3e firmware: qcom_scm: Fix legacy conven=
tion SCM accessors<br>
&gt;=C2=A0 =C2=A0 =C2=A00255b5803332 ARM: 8992/1: Fix unwind_frame for cla=
ng-built kernels<br>
&gt;=C2=A0 =C2=A0 =C2=A089a16b68221c ARM: dts: exynos: Extend all Exynos58=
00 A15&#39;s OPPs with max voltage data<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc12363fb7ff parisc: mask out enable and reserved =
bits from sba imask<br>
&gt;=C2=A0 =C2=A0 =C2=A0c33370975ce4 parisc: Implement __smp_store_release=
 and __smp_load_acquire barriers<br>
&gt;=C2=A0 =C2=A0 =C2=A05efde2158258 parisc: Do not use an ordered store i=
n pa_tlb_lock()<br>
&gt;=C2=A0 =C2=A0 =C2=A00730d6cd49e0 Revert &quot;parisc: Revert &quot;Rel=
ease spinlocks using ordered store&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A056b60c71143a Revert &quot;parisc: Use ldcw instruc=
tion for SMP spinlock release barrier&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A040ab3539bc7c Revert &quot;parisc: Drop LDCW barrie=
r in CAS code when running UP&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A06044b0d92ac6 Revert &quot;parisc: Improve interrup=
t handling in arch_spin_lock_flags()&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A049b9263b2a15 Revert &quot;mm/vmstat.c: do not show=
 lowmem reserve protection information of empty zone&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A00e2d35b34891 erofs: fix extended inode could cross=
 boundary<br>
&gt;=C2=A0 =C2=A0 =C2=A000a43cd24d66 mtd: spi-nor: intel-spi: Simulate WRD=
I command<br>
&gt;=C2=A0 =C2=A0 =C2=A0a2e5af466884 mtd: rawnand: qcom: avoid write to un=
available register<br>
&gt;=C2=A0 =C2=A0 =C2=A0118612569083 spi: spidev: Align buffers for DMA<br=
>
&gt;=C2=A0 =C2=A0 =C2=A01e4d8a76f09e PM / devfreq: Fix indentaion of devfr=
eq_summary debugfs node<br>
&gt;=C2=A0 =C2=A0 =C2=A083e35713b3d4 PM / devfreq: rk3399_dmc: Fix kernel =
oops when rockchip,pmu is absent<br>
&gt;=C2=A0 =C2=A0 =C2=A04eeeaca1e935 include/asm-generic/vmlinux.lds.h: al=
ign ro_after_init<br>
&gt;=C2=A0 =C2=A0 =C2=A0768eb23b7670 MIPS: VZ: Only include loongson_regs.=
h for CPU_LOONGSON64<br>
&gt;=C2=A0 =C2=A0 =C2=A0f9bb92d06d9a cpufreq: dt: fix oops on armada37xx<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0e147c355b717 cpufreq: Fix locking issues with gove=
rnors<br>
&gt;=C2=A0 =C2=A0 =C2=A08ad74327fb4b NFS: Don&#39;t return layout segments=
 that are in use<br>
&gt;=C2=A0 =C2=A0 =C2=A08a7dfccb581f NFS: Don&#39;t move layouts to plh_re=
turn_segs list while in use<br>
&gt;=C2=A0 =C2=A0 =C2=A04db216cc1d59 io_uring: sanitize double poll handli=
ng<br>
&gt;=C2=A0 =C2=A0 =C2=A0fe552346a87b io_uring: fail poll arm on queue proc=
 failure<br>
&gt;=C2=A0 =C2=A0 =C2=A03c5d00a21128 io_uring: use TWA_SIGNAL for task_wor=
k uncondtionally<br>
&gt;=C2=A0 =C2=A0 =C2=A093bc88750e69 io_uring: set ctx sq/cq entry count e=
arlier<br>
&gt;=C2=A0 =C2=A0 =C2=A03c374f0e63d7 drm/ttm/nouveau: don&#39;t call tt de=
stroy callback on alloc failure.<br>
&gt;=C2=A0 =C2=A0 =C2=A0441ba3c8300b media: media-request: Fix crash if me=
mory allocation fails<br>
&gt;=C2=A0 =C2=A0 =C2=A00a4d8f8bc3c9 driver core: Fix probe_count imbalanc=
e in really_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A0eb0b64b4817c 9p: Fix memory leak in v9fs_mount<br>
&gt;=C2=A0 =C2=A0 =C2=A072bc544c0dd4 kvm: x86: replace kvm_spec_ctrl_test_=
value with runtime test on the host<br>
&gt;=C2=A0 =C2=A0 =C2=A02e91bbf598b2 fs/minix: reject too-large maximum fi=
le size<br>
&gt;=C2=A0 =C2=A0 =C2=A04ded4aeb84a7 fs/minix: don&#39;t allow getting del=
eted inodes<br>
&gt;=C2=A0 =C2=A0 =C2=A03362c7fb3f9a fs/minix: check return value of sb_ge=
tblk()<br>
&gt;=C2=A0 =C2=A0 =C2=A077e0be9e8212 bitfield.h: don&#39;t compile-time va=
lidate _val in FIELD_FIT<br>
&gt;=C2=A0 =C2=A0 =C2=A0d613f0186778 tick/nohz: Narrow down noise while se=
tting current task&#39;s tick dependency<br>
&gt;=C2=A0 =C2=A0 =C2=A08720986cf5ab crypto: cpt - don&#39;t sleep of CRYP=
TO_TFM_REQ_MAY_SLEEP was not specified<br>
&gt;=C2=A0 =C2=A0 =C2=A04a412ab6211b crypto: ccp - Fix use of merged scatt=
erlists<br>
&gt;=C2=A0 =C2=A0 =C2=A098df3304a1fc crypto: qat - fix double free in qat_=
uclo_create_batch_init_list<br>
&gt;=C2=A0 =C2=A0 =C2=A0a256a5c33ab3 crypto: hisilicon - don&#39;t sleep o=
f CRYPTO_TFM_REQ_MAY_SLEEP was not specified<br>
&gt;=C2=A0 =C2=A0 =C2=A06158e615334a pstore: Fix linking when crypto API d=
isabled<br>
&gt;=C2=A0 =C2=A0 =C2=A032e110843422 tpm: Unify the mismatching TPM space =
buffer sizes<br>
&gt;=C2=A0 =C2=A0 =C2=A0ec0cf56ee031 ALSA: usb-audio: add quirk for Pionee=
r DDJ-RB<br>
&gt;=C2=A0 =C2=A0 =C2=A0f8b0754bb141 ALSA: usb-audio: work around streamin=
g quirk for MacroSilicon MS2109<br>
&gt;=C2=A0 =C2=A0 =C2=A0184f08d3789f ALSA: usb-audio: fix overeager device=
 match for MacroSilicon MS2109<br>
&gt;=C2=A0 =C2=A0 =C2=A02b4d81f58d9d ALSA: usb-audio: Creative USB X-Fi Pr=
o SB1095 volume knob support<br>
&gt;=C2=A0 =C2=A0 =C2=A09af94db4d1b7 ALSA: hda - reverse the setting value=
 in the micmute_led_set<br>
&gt;=C2=A0 =C2=A0 =C2=A0d81a84e7bba0 ALSA: hda - fix the micmute led statu=
s for Lenovo ThinkCentre AIO<br>
&gt;=C2=A0 =C2=A0 =C2=A009af2d0326b1 vdpasim: protect concurrent access to=
 iommu iotlb<br>
&gt;=C2=A0 =C2=A0 =C2=A053dcbd3acc74 iommu/vt-d: Skip TE disabling on quir=
ky gfx dedicated iommu<br>
&gt;=C2=A0 =C2=A0 =C2=A056448553974f usb: cdns3: gadget: always zeroed TRB=
 buffer when enable endpoint<br>
&gt;=C2=A0 =C2=A0 =C2=A01425bf7b1be0 USB: serial: cp210x: enable usb gener=
ic throttle/unthrottle<br>
&gt;=C2=A0 =C2=A0 =C2=A0bd5cc29fca5e USB: serial: cp210x: re-enable auto-R=
TS on open<br>
&gt;=C2=A0 =C2=A0 =C2=A0e9eb38791a1f r8152: Use MAC address from correct d=
evice tree node<br>
&gt;=C2=A0 =C2=A0 =C2=A026121668ba97 net: phy: marvell10g: fix null pointe=
r dereference<br>
&gt;=C2=A0 =C2=A0 =C2=A06979755c3473 vsock: fix potential null pointer der=
eference in vsock_poll()<br>
&gt;=C2=A0 =C2=A0 =C2=A0c1a7c51485e1 net: initialize fastreuse on inet_inh=
erit_port<br>
&gt;=C2=A0 =C2=A0 =C2=A0fe00aee967ec net: refactor bind_bucket fastreuse i=
nto helper<br>
&gt;=C2=A0 =C2=A0 =C2=A00306c15114e2 vmxnet3: use correct tcp hdr length w=
hen packet is encapsulated<br>
&gt;=C2=A0 =C2=A0 =C2=A0743ae9f790ec tcp: correct read of TFO keys on big =
endian systems<br>
&gt;=C2=A0 =C2=A0 =C2=A01cccda2d0888 net/tls: Fix kmap usage<br>
&gt;=C2=A0 =C2=A0 =C2=A0e6e356db45f4 net: Set fput_needed iff FDPUT_FPUT i=
s set<br>
&gt;=C2=A0 =C2=A0 =C2=A05512f2549e3d net: phy: fix memory leak in device-c=
reate error path<br>
&gt;=C2=A0 =C2=A0 =C2=A0d556aa7ab7b7 net/nfc/rawsock.c: add CAP_NET_RAW ch=
eck.<br>
&gt;=C2=A0 =C2=A0 =C2=A0469cb3bb42d1 net: Fix potential memory leak in pro=
to_register()<br>
&gt;=C2=A0 =C2=A0 =C2=A04268aa35b6dd drivers/net/wan/lapbether: Added need=
ed_headroom and a skb-&gt;len check<br>
&gt;=C2=A0 =C2=A0 =C2=A0e85a5151e5f9 af_packet: TPACKET_V3: fix fill statu=
s rwlock imbalance<br>
&gt;=C2=A0 =C2=A0 =C2=A0b879ed3103c1 crypto: aesni - add compatibility wit=
h IAS<br>
&gt;=C2=A0 =C2=A0 =C2=A0335e8039fddd x86/fsgsbase/64: Fix NULL deref in 86=
_fsgsbase_read_task<br>
&gt;=C2=A0 =C2=A0 =C2=A0dcab7f26a723 SUNRPC: Fix (&quot;SUNRPC: Add &quot;=
@len&quot; parameter to gss_unwrap()&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A06c031aec6218 nfsd: avoid a NULL dereference in __c=
ld_pipe_upcall()<br>
&gt;=C2=A0 =C2=A0 =C2=A07f84e3caf510 svcrdma: Fix page leak in svc_rdma_re=
cv_read_chunk()<br>
&gt;=C2=A0 =C2=A0 =C2=A09bf49b97ab0b mtd: rawnand: brcmnand: Don&#39;t def=
ault to edu transfer<br>
&gt;=C2=A0 =C2=A0 =C2=A0a75fc224ebe8 pinctrl-single: fix pcs_parse_pinconf=
() return value<br>
&gt;=C2=A0 =C2=A0 =C2=A0eba0e0f5ae94 ocfs2: fix unbalanced locking<br>
&gt;=C2=A0 =C2=A0 =C2=A0e29f6ba2c10f dlm: Fix kobject memleak<br>
&gt;=C2=A0 =C2=A0 =C2=A02bbe1b50734a media: mtk-mdp: Fix a refcounting bug=
 on error in init<br>
&gt;=C2=A0 =C2=A0 =C2=A0ce1b309dd629 net: thunderx: initialize VF&#39;s ma=
ilbox mutex before first usage<br>
&gt;=C2=A0 =C2=A0 =C2=A08eb42c65f162 selftests/net: relax cpu affinity req=
uirement in msg_zerocopy test<br>
&gt;=C2=A0 =C2=A0 =C2=A0551cdcc12892 Revert &quot;vxlan: fix tos value bef=
ore xmit&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b187671275ac hv_netvsc: do not use VF device if li=
nk is down<br>
&gt;=C2=A0 =C2=A0 =C2=A0adc38af984ad dpaa2-eth: Fix passing zero to &#39;P=
TR_ERR&#39; warning<br>
&gt;=C2=A0 =C2=A0 =C2=A03f730f7b0edf net: macb: Properly handle phylink on=
 at91sam9x<br>
&gt;=C2=A0 =C2=A0 =C2=A092bb2e6b119c net: thunderx: use spin_lock_bh in ni=
cvf_set_rx_mode_task()<br>
&gt;=C2=A0 =C2=A0 =C2=A0312efc832854 gpio: don&#39;t use same lockdep clas=
s for all devm_gpiochip_add_data users<br>
&gt;=C2=A0 =C2=A0 =C2=A05543ea25c09d fsl/fman: fix eth hash table allocati=
on<br>
&gt;=C2=A0 =C2=A0 =C2=A0e5a4333e2cdf fsl/fman: check dereferencing null po=
inter<br>
&gt;=C2=A0 =C2=A0 =C2=A0d3d5c8c74008 fsl/fman: fix unreachable code<br>
&gt;=C2=A0 =C2=A0 =C2=A047fe6d67f941 fsl/fman: fix dereference null return=
 value<br>
&gt;=C2=A0 =C2=A0 =C2=A0f90112519854 fsl/fman: use 32-bit unsigned integer=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0d097ca1397c0 net: spider_net: Fix the size used in=
 a &#39;dma_free_coherent()&#39; call<br>
&gt;=C2=A0 =C2=A0 =C2=A066e007f01aa1 net: sgi: ioc3-eth: Fix the size used=
 in some &#39;dma_free_coherent()&#39; calls<br>
&gt;=C2=A0 =C2=A0 =C2=A0d0414b18f877 liquidio: Fix wrong return value in c=
n23xx_get_pf_num()<br>
&gt;=C2=A0 =C2=A0 =C2=A017948294d0ae net: ethernet: aquantia: Fix wrong re=
turn value<br>
&gt;=C2=A0 =C2=A0 =C2=A0fba2cf348d9e net: mvpp2: fix memory leak in mvpp2_=
rx<br>
&gt;=C2=A0 =C2=A0 =C2=A01a6a61db6f4c ftrace: Fix ftrace_trace_task return =
value<br>
&gt;=C2=A0 =C2=A0 =C2=A0f10a3fb43b02 net/mlx5: Delete extra dump stack tha=
t gives nothing<br>
&gt;=C2=A0 =C2=A0 =C2=A0b7855bad4c6a net/mlx5: DR, Change push vlan action=
 sequence<br>
&gt;=C2=A0 =C2=A0 =C2=A063d91a65f226 tools, bpftool: Fix wrong return valu=
e in do_dump()<br>
&gt;=C2=A0 =C2=A0 =C2=A0fccac9cc36b0 tools, build: Propagate build failure=
s from tools/build/Makefile.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0060bd61d4cc6 wl1251: fix always return 0 error<br>
&gt;=C2=A0 =C2=A0 =C2=A0c7565e834207 qtnfmac: Missing platform_device_unre=
gister() on error in qtnf_core_mac_alloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e879051c0828 rtw88: coex: only skip coex triggered=
 by BT info<br>
&gt;=C2=A0 =C2=A0 =C2=A01a93abb6a68d rtw88: fix short GI capability based =
on current bandwidth<br>
&gt;=C2=A0 =C2=A0 =C2=A0f2a4bd36a126 rtw88: fix LDPC field for RA info<br>
&gt;=C2=A0 =C2=A0 =C2=A0763c576f095b netfilter: nft_meta: fix iifgroup mat=
ching<br>
&gt;=C2=A0 =C2=A0 =C2=A0ae32b42b3641 ice: Graceful error handling in HW ta=
ble calloc failure<br>
&gt;=C2=A0 =C2=A0 =C2=A0f0c20782f637 ice: Clear and free XLT entries on re=
set<br>
&gt;=C2=A0 =C2=A0 =C2=A04bd27fb14f7b s390/qeth: don&#39;t process empty br=
idge port events<br>
&gt;=C2=A0 =C2=A0 =C2=A022697ca855c0 s390/qeth: tolerate pre-filled RX buf=
fer<br>
&gt;=C2=A0 =C2=A0 =C2=A0ee9f0d33c024 ASoC: fsl_sai: Fix value of FSL_SAI_C=
R1_RFW_MASK<br>
&gt;=C2=A0 =C2=A0 =C2=A03d26a53f004d ASoC: meson: cards: deal dpcm flag ch=
ange<br>
&gt;=C2=A0 =C2=A0 =C2=A0224e14999588 ASoC: core: use less strict tests for=
 dailink capabilities<br>
&gt;=C2=A0 =C2=A0 =C2=A0bd82844099c4 MIPS: only register FTLBPar exception=
 handler for supported models<br>
&gt;=C2=A0 =C2=A0 =C2=A06edc078a22a2 libbpf: Fix register in PT_REGS MIPS =
macros<br>
&gt;=C2=A0 =C2=A0 =C2=A0fbcedc1579f5 drm/msm/dpu: don&#39;t use INTF_INPUT=
_CTRL feature on sdm845<br>
&gt;=C2=A0 =C2=A0 =C2=A077c8cfdf8084 net: ll_temac: Use devm_platform_iore=
map_resource_byname()<br>
&gt;=C2=A0 =C2=A0 =C2=A07a4c9d17c8bc ASoC: soc-core: Fix regression causin=
g sysfs entries to disappear<br>
&gt;=C2=A0 =C2=A0 =C2=A00c7d64caaf13 ASoC: meson: axg-tdm-formatters: fix =
sclk inversion<br>
&gt;=C2=A0 =C2=A0 =C2=A0036a8c923358 ASoC: meson: axg-tdmin: fix g12a skew=
<br>
&gt;=C2=A0 =C2=A0 =C2=A030fde1d41d73 ASoC: meson: axg-tdm-interface: fix l=
ink fmt setup<br>
&gt;=C2=A0 =C2=A0 =C2=A03369ed2127bb RDMA/hns: Fix the unneeded process wh=
en getting a general type of CQE error<br>
&gt;=C2=A0 =C2=A0 =C2=A0a6c7b76332b3 RDMA/hns: Fix error during modify qp =
RTS2RTS<br>
&gt;=C2=A0 =C2=A0 =C2=A0fd926b32b9ca selftests/powerpc: Fix online CPU sel=
ection<br>
&gt;=C2=A0 =C2=A0 =C2=A03e444bad470e powerpc/pseries/hotplug-cpu: Remove d=
ouble free in error path<br>
&gt;=C2=A0 =C2=A0 =C2=A0c2ff56c52846 cpufreq: ap806: fix cpufreq driver ne=
eds ap cpu clk<br>
&gt;=C2=A0 =C2=A0 =C2=A040e453d8a9df PCI: Release IVRS table in AMD ACS qu=
irk<br>
&gt;=C2=A0 =C2=A0 =C2=A0c62142f3b48b RDMA/netlink: Remove CAP_NET_RAW chec=
k when dump a raw QP<br>
&gt;=C2=A0 =C2=A0 =C2=A087ccb032ee9f RDMA/rtrs: remove WQ_MEM_RECLAIM for =
rtrs_wq<br>
&gt;=C2=A0 =C2=A0 =C2=A02247e03d8206 RDMA/rtrs-clt: add an additional rand=
om 8 seconds before reconnecting<br>
&gt;=C2=A0 =C2=A0 =C2=A034503392af35 nvmem: sprd: Fix return value of sprd=
_efuse_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A0081428bc9c3b selftests/powerpc: Fix CPU affinity f=
or child process<br>
&gt;=C2=A0 =C2=A0 =C2=A00e03270c6d95 powerpc/boot: Fix CONFIG_PPC_MPC52XX =
references<br>
&gt;=C2=A0 =C2=A0 =C2=A0a5baa27249bf powerpc/32s: Fix CONFIG_BOOK3S_601 us=
es<br>
&gt;=C2=A0 =C2=A0 =C2=A094976f931d33 selftests/powerpc: Squash spurious er=
rors due to device removal<br>
&gt;=C2=A0 =C2=A0 =C2=A06c96e968f10c xfs: clear XFS_DQ_FREEING if we can&#=
39;t lock the dquot buffer to flush<br>
&gt;=C2=A0 =C2=A0 =C2=A05db458a85892 xfs: fix inode allocation block res c=
alculation precedence<br>
&gt;=C2=A0 =C2=A0 =C2=A003acd91927d2 net: dsa: rtl8366: Fix VLAN set-up<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0427fa4ecef77 net: dsa: rtl8366: Fix VLAN semantics=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0536079c88a4f Bluetooth: hci_qca: Stop collecting m=
emdump again for command timeout during SSR<br>
&gt;=C2=A0 =C2=A0 =C2=A03d27182481fe Bluetooth: Fix suspend notifier race<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0226020402b1f bpf: Fix bpf_ringbuf_output() signatu=
re to return long<br>
&gt;=C2=A0 =C2=A0 =C2=A08a365b83f67e Bluetooth: hci_serdev: Only unregiste=
r device if it was registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0715faee64cea Bluetooth: hci_h5: Set HCI_UART_RESET=
_ON_INIT to correct flags<br>
&gt;=C2=A0 =C2=A0 =C2=A0267dac50f18e Bluetooth: btusb: Fix and detect most=
 of the Chinese Bluetooth controllers<br>
&gt;=C2=A0 =C2=A0 =C2=A0a7d08a5c1ed4 power: supply: check if calc_soc succ=
eeded in pm860x_init_battery<br>
&gt;=C2=A0 =C2=A0 =C2=A01fe77db0d48b Smack: prevent underflow in smk_set_c=
ipso()<br>
&gt;=C2=A0 =C2=A0 =C2=A0cdb83ad0c45b Smack: fix another vsscanf out of bou=
nds<br>
&gt;=C2=A0 =C2=A0 =C2=A016b5b7dd945e RDMA/core: Fix return error value in =
_ib_modify_qp() to negative<br>
&gt;=C2=A0 =C2=A0 =C2=A0e415706d69fe PCI: cadence: Fix updating Vendor ID =
and Subsystem Vendor ID register<br>
&gt;=C2=A0 =C2=A0 =C2=A08398e98caec2 PCI: cadence: Fix cdns_pcie_{host|ep}=
_setup() error path<br>
&gt;=C2=A0 =C2=A0 =C2=A06c7b87f48585 gpio: regmap: fix type clash<br>
&gt;=C2=A0 =C2=A0 =C2=A038c296c86322 macintosh/via-macii: Access autopoll_=
devs when inside lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0d2b414c7916e powerpc/watchpoint: Fix DAWR exceptio=
n for CACHEOP<br>
&gt;=C2=A0 =C2=A0 =C2=A050b0fe566b11 powerpc/watchpoint: Fix DAWR exceptio=
n constraint<br>
&gt;=C2=A0 =C2=A0 =C2=A093f7e2100c93 powerpc/watchpoint: Fix 512 byte boun=
dary limit<br>
&gt;=C2=A0 =C2=A0 =C2=A01e43aee1568e bpf: Fix pos computation for bpf_iter=
 seq_ops-&gt;start()<br>
&gt;=C2=A0 =C2=A0 =C2=A07aa88d36b692 net: dsa: mv88e6xxx: MV88E6097 does n=
ot support jumbo configuration<br>
&gt;=C2=A0 =C2=A0 =C2=A004ce7e5016de scsi: core: Add missing scsi_device_p=
ut() in scsi_host_block()<br>
&gt;=C2=A0 =C2=A0 =C2=A0c16097b56df8 scsi: mesh: Fix panic after host or b=
us reset<br>
&gt;=C2=A0 =C2=A0 =C2=A014f820a1b601 scsi: megaraid_sas: Clear affinity hi=
nt<br>
&gt;=C2=A0 =C2=A0 =C2=A01bcba06e5888 usb: gadget: f_uac2: fix AC Interface=
 Header Descriptor wTotalLength<br>
&gt;=C2=A0 =C2=A0 =C2=A088dcd13872b1 usb: dwc2: Fix error path in gadget r=
egistration<br>
&gt;=C2=A0 =C2=A0 =C2=A0816adf48d9ff usb: dwc3: meson-g12a: fix shared res=
et control use<br>
&gt;=C2=A0 =C2=A0 =C2=A0de27452f2308 thermal: int340x: processor_thermal: =
fix: update Jasper Lake PCI id<br>
&gt;=C2=A0 =C2=A0 =C2=A00415ff8c7d6e MIPS: OCTEON: add missing put_device(=
) call in dwc3_octeon_device_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A0214d219e48a2 PCI: rcar: Fix runtime PM imbalance o=
n error<br>
&gt;=C2=A0 =C2=A0 =C2=A00d4b670195f5 powerpc/spufs: Fix the type of ret in=
 spufs_arch_write_note<br>
&gt;=C2=A0 =C2=A0 =C2=A0a1d76052b1e3 ASoC: hdac_hda: fix deadlock after PC=
M open error<br>
&gt;=C2=A0 =C2=A0 =C2=A07593350d7b72 qed: Fix ILT and XRCD bitmap memory l=
eaks<br>
&gt;=C2=A0 =C2=A0 =C2=A04a7063478d13 ASoC: tas2770: Fix reset gpio propert=
y name<br>
&gt;=C2=A0 =C2=A0 =C2=A0360ee482151c tools/bpftool: Fix error handing in d=
o_skeleton()<br>
&gt;=C2=A0 =C2=A0 =C2=A023072846b309 s390/bpf: Tolerate not converging cod=
e shrinking<br>
&gt;=C2=A0 =C2=A0 =C2=A0a463d46b323c s390/bpf: Use brcl for jumping to exi=
t_ip if necessary<br>
&gt;=C2=A0 =C2=A0 =C2=A0fa9a83dab397 s390/bpf: Fix sign extension in branc=
h_ku<br>
&gt;=C2=A0 =C2=A0 =C2=A0cec737d79fa4 phy: armada-38x: fix NETA lockup when=
 repeatedly switching speeds<br>
&gt;=C2=A0 =C2=A0 =C2=A0e5e386a90961 mt76: mt7615: fix possible memory lea=
k in mt7615_mcu_wtbl_sta_add<br>
&gt;=C2=A0 =C2=A0 =C2=A03432b568dec4 mt76: mt7915: add missing CONFIG_MAC8=
0211_DEBUGFS<br>
&gt;=C2=A0 =C2=A0 =C2=A0d8177e088f10 mt76: mt7915: potential array overflo=
w in mt7915_mcu_tx_rate_report()<br>
&gt;=C2=A0 =C2=A0 =C2=A0fbdc18979b1d mt76: mt7615: fix potential memory le=
ak in mcu message handler<br>
&gt;=C2=A0 =C2=A0 =C2=A08c2729a1ead8 mt76: mt7663u: fix potential memory l=
eak in mcu message handler<br>
&gt;=C2=A0 =C2=A0 =C2=A06aee19b46bc7 mt76: mt7663u: fix memory leak in set=
 key<br>
&gt;=C2=A0 =C2=A0 =C2=A0a73ed0f9bca1 powerpc/perf: Fix missing is_sier_avi=
able() during build<br>
&gt;=C2=A0 =C2=A0 =C2=A066ce4246d1d3 coresight: etm4x: Fix save/restore du=
ring cpu idle<br>
&gt;=C2=A0 =C2=A0 =C2=A03e75f65575c9 coresight: tmc: Fix TMC mode read in =
tmc_read_unprepare_etb()<br>
&gt;=C2=A0 =C2=A0 =C2=A091813b6c4a71 coresight: etmv4: Counter values not =
saved on disable<br>
&gt;=C2=A0 =C2=A0 =C2=A09b975cf2fb05 coresight: etmv4: Fix resource select=
or constant<br>
&gt;=C2=A0 =C2=A0 =C2=A06d52214425ce thermal: ti-soc-thermal: Fix reversed=
 condition in ti_thermal_expose_sensor()<br>
&gt;=C2=A0 =C2=A0 =C2=A099075b81545c usb: core: fix quirks_param_set() wri=
ting to a const pointer<br>
&gt;=C2=A0 =C2=A0 =C2=A0e9ba39efa669 clk: qcom: gcc: Make disp gpll0 branc=
h aon for sc7180/sdm845<br>
&gt;=C2=A0 =C2=A0 =C2=A0ef54393965e4 USB: serial: iuu_phoenix: fix led-act=
ivity helpers<br>
&gt;=C2=A0 =C2=A0 =C2=A0d1ffb4446102 PCI: loongson: Use DECLARE_PCI_FIXUP_=
EARLY for bridge_class_quirk()<br>
&gt;=C2=A0 =C2=A0 =C2=A09d42c78119a0 spi: lantiq-ssc: Fix warning by using=
 WQ_MEM_RECLAIM<br>
&gt;=C2=A0 =C2=A0 =C2=A075d9f30b8b56 gpu: ipu-v3: Restore RGB32, BGR32<br>
&gt;=C2=A0 =C2=A0 =C2=A019a106b23be9 drm/imx: tve: fix regulator_disable e=
rror path<br>
&gt;=C2=A0 =C2=A0 =C2=A068c15a6dbc77 drm/imx: fix use after free<br>
&gt;=C2=A0 =C2=A0 =C2=A020d2eba09230 powerpc/book3s64/pkeys: Use PVR check=
 instead of cpu feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0aa11151dd892 powerpc/mm/radix: Free PUD table when=
 freeing pagetable<br>
&gt;=C2=A0 =C2=A0 =C2=A005d976032bb8 phy: renesas: rcar-gen3-usb2: move ir=
q registration to init<br>
&gt;=C2=A0 =C2=A0 =C2=A027d42b1bcde1 media: s5p-g2d: Fix a memory leak in =
an error handling path in &#39;g2d_probe()&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A09922de2681e2 go7007: add sanity checking for endpo=
ints<br>
&gt;=C2=A0 =C2=A0 =C2=A043a040aea142 PCI/ASPM: Add missing newline in sysf=
s &#39;policy&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A094fbbc3cdd99 ASoC: meson: fixes the missed kfree()=
 for axg_card_add_tdm_loopback<br>
&gt;=C2=A0 =C2=A0 =C2=A0c660787eb906 staging: rtl8192u: fix a dubious look=
ing mask before a shift<br>
&gt;=C2=A0 =C2=A0 =C2=A0263875d7b606 ima: Fail rule parsing when the KEY_C=
HECK hook is combined with an invalid cond<br>
&gt;=C2=A0 =C2=A0 =C2=A0c7e3b96d1229 ima: Fail rule parsing when the KEXEC=
_CMDLINE hook is combined with an invalid cond<br>
&gt;=C2=A0 =C2=A0 =C2=A08e07cdb1778e ima: Fail rule parsing when buffer ho=
ok functions have an invalid action<br>
&gt;=C2=A0 =C2=A0 =C2=A0bd6f756234dc ima: Free the entire rule if it fails=
 to parse<br>
&gt;=C2=A0 =C2=A0 =C2=A0644a11adfcc7 ima: Free the entire rule when deleti=
ng a list of rules<br>
&gt;=C2=A0 =C2=A0 =C2=A096022c3ddf63 ima: Have the LSM free its audit rule=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0b76ca3f373b5 RDMA/rxe: Prevent access to wr-&gt;ne=
xt ptr afrer wr is posted to send queue<br>
&gt;=C2=A0 =C2=A0 =C2=A0bdb550b1e420 RDMA/qedr: Add EDPM max size to alloc=
 ucontext response<br>
&gt;=C2=A0 =C2=A0 =C2=A006e28eb3bcef RDMA/qedr: Add EDPM mode type for use=
r-fw compatibility<br>
&gt;=C2=A0 =C2=A0 =C2=A001fdb8e7c330 RDMA/qedr: SRQ&#39;s bug fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A099d321c2a921 Bluetooth: Fix update of connection s=
tate in `hci_encrypt_cfm`<br>
&gt;=C2=A0 =C2=A0 =C2=A013b052362be4 powerpc/vdso: Fix vdso cpu truncation=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0fbbdd2434157 powerpc/rtas: don&#39;t online CPUs f=
or partition suspend<br>
&gt;=C2=A0 =C2=A0 =C2=A0d411475796be powerpc/pseries: remove cede offline =
state for CPUs<br>
&gt;=C2=A0 =C2=A0 =C2=A0358d38e35d6d kernfs: do not call fsnotify() with n=
ame without a parent<br>
&gt;=C2=A0 =C2=A0 =C2=A0bc2599182f8e mwifiex: Prevent memory corruption ha=
ndling keys<br>
&gt;=C2=A0 =C2=A0 =C2=A063f6498a979a bpfilter: Initialize pos variable<br>
&gt;=C2=A0 =C2=A0 =C2=A07a3c6b8c2987 scsi: scsi_debug: Add check for sdebu=
g_max_queue during module init<br>
&gt;=C2=A0 =C2=A0 =C2=A0b62846a209d8 drm/bridge: sil_sii8620: initialize r=
eturn of sii8620_readb<br>
&gt;=C2=A0 =C2=A0 =C2=A043e8b3c268aa mmc: sdhci-of-arasan: Add missed chec=
ks for devm_clk_register()<br>
&gt;=C2=A0 =C2=A0 =C2=A0adb10d0dc592 phy: exynos5-usbdrd: Calibrating make=
s sense only for USB2.0 PHY<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4fc32a7cebd dt-bindings: phy: uniphier: Fix incor=
rect clocks and clock-names for PXs3 usb3-hsphy<br>
&gt;=C2=A0 =C2=A0 =C2=A084cbf55c6744 phy: cadence: salvo: fix wrong bit de=
finition<br>
&gt;=C2=A0 =C2=A0 =C2=A016835dc05924 drm: panel: simple: Fix bpc for LG LB=
070WV8 panel<br>
&gt;=C2=A0 =C2=A0 =C2=A0413d189f9a3c leds: core: Flush scheduled work for =
system suspend<br>
&gt;=C2=A0 =C2=A0 =C2=A0c5450ee5eb1a kobject: Avoid premature parent objec=
t freeing in kobject_cleanup()<br>
&gt;=C2=A0 =C2=A0 =C2=A049d6de41c9da drm/stm: repair runtime power managem=
ent<br>
&gt;=C2=A0 =C2=A0 =C2=A0f59499bcd70d samples: bpf: Fix bpf programs with k=
probe/sys_connect event<br>
&gt;=C2=A0 =C2=A0 =C2=A05c7ca8d75dce PCI: Fix pci_cfg_wait queue locking p=
roblem<br>
&gt;=C2=A0 =C2=A0 =C2=A0e36653b51177 RDMA/rxe: Skip dgid check in loopback=
 mode<br>
&gt;=C2=A0 =C2=A0 =C2=A06d283e10b30f xfs: fix reflink quota reservation ac=
counting error<br>
&gt;=C2=A0 =C2=A0 =C2=A095c286034452 xfs: don&#39;t eat an EIO/ENOSPC writ=
eback error when scrubbing data fork<br>
&gt;=C2=A0 =C2=A0 =C2=A09ff3281d903f xfs: preserve rmapbt swapext block re=
servation from freed blocks<br>
&gt;=C2=A0 =C2=A0 =C2=A04173d4194d77 media: cros-ec-cec: do not bail on de=
vice_init_wakeup failure<br>
&gt;=C2=A0 =C2=A0 =C2=A0050f814243b6 media: exynos4-is: Add missed check f=
or pinctrl_lookup_state()<br>
&gt;=C2=A0 =C2=A0 =C2=A0200a75ac7e46 media: tvp5150: Add missed media_enti=
ty_cleanup()<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc2ac5c3a96a media: staging: rkisp1: rsz: fix reso=
lution limitation on sink pad<br>
&gt;=C2=A0 =C2=A0 =C2=A039e5b396bc9d media: staging: rkisp1: rsz: supporte=
d formats are the isp&#39;s src formats, not sink formats<br>
&gt;=C2=A0 =C2=A0 =C2=A094f0fc91b3fd media: allegro: Fix some NULL vs IS_E=
RR() checks in probe<br>
&gt;=C2=A0 =C2=A0 =C2=A09f32f439a33f media: firewire: Using uninitialized =
values in node_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A0101df88a5837 ipvs: allow connection reuse for unco=
nfirmed conntrack<br>
&gt;=C2=A0 =C2=A0 =C2=A0013c7b012461 scsi: eesox: Fix different dev_id bet=
ween request_irq() and free_irq()<br>
&gt;=C2=A0 =C2=A0 =C2=A064c6cd408d98 scsi: powertec: Fix different dev_id =
between request_irq() and free_irq()<br>
&gt;=C2=A0 =C2=A0 =C2=A09b470925a9dc RDMA/core: Fix bogus WARN_ON during i=
b_unregister_device_queued()<br>
&gt;=C2=A0 =C2=A0 =C2=A08cb26b10f5b7 dma-buf: fix dma-fence-chain out of o=
rder test<br>
&gt;=C2=A0 =C2=A0 =C2=A0b48e8758634a iavf: Fix updating statistics<br>
&gt;=C2=A0 =C2=A0 =C2=A01c5da372e87e iavf: fix error return code in iavf_i=
nit_get_resources()<br>
&gt;=C2=A0 =C2=A0 =C2=A0290ca6a85627 staging: vchiq_arm: Add a matching un=
register call<br>
&gt;=C2=A0 =C2=A0 =C2=A06545d3462e35 drm/radeon: fix array out-of-bounds r=
ead and write issues<br>
&gt;=C2=A0 =C2=A0 =C2=A09707e1a7f8ac drm/amdgpu: ensure 0 is returned for =
success in jpeg_v2_5_wait_for_idle<br>
&gt;=C2=A0 =C2=A0 =C2=A08ee5083de201 drm/amdgpu/debugfs: fix memory leak w=
hen amdgpu_virt_enable_access_debugfs failed<br>
&gt;=C2=A0 =C2=A0 =C2=A05e3b4e09c9b9 scsi: qla2xxx: Make __qla2x00_alloc_i=
ocbs() initialize 32 bits of request_t.handle<br>
&gt;=C2=A0 =C2=A0 =C2=A0da3684003dc1 tracing: Move pipe reference to trace=
 array instead of current_tracer<br>
&gt;=C2=A0 =C2=A0 =C2=A0d579cc130a28 net: ethernet: ti: am65-cpsw-nuss: re=
store vlan configuration while down/up<br>
&gt;=C2=A0 =C2=A0 =C2=A033333c08d28a lkdtm: Make arch-specific tests alway=
s available<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4c1f5314327 selftests/lkdtm: Reset WARN_ONCE to a=
void false negatives<br>
&gt;=C2=A0 =C2=A0 =C2=A05397915bf77b lkdtm: Avoid more compiler optimizati=
ons for bad writes<br>
&gt;=C2=A0 =C2=A0 =C2=A0fe1f13b572b2 cxl: Fix kobject memleak<br>
&gt;=C2=A0 =C2=A0 =C2=A0cb52bc02e65d drm/mipi: use dcs write for mipi_dsi_=
dcs_set_tear_scanline<br>
&gt;=C2=A0 =C2=A0 =C2=A0bdcfb3217816 scsi: ufs: Disable WriteBooster capab=
ility for non-supported UFS devices<br>
&gt;=C2=A0 =C2=A0 =C2=A0b5118d2bbb8e scsi: cumana_2: Fix different dev_id =
between request_irq() and free_irq()<br>
&gt;=C2=A0 =C2=A0 =C2=A036428bc924e6 net: atlantic: MACSec offload statist=
ics checkpatch fix<br>
&gt;=C2=A0 =C2=A0 =C2=A010b8d2696578 ASoC: Intel: Boards: cml_rt1011_rt568=
2: use statically define codec config<br>
&gt;=C2=A0 =C2=A0 =C2=A0e6046c52f127 ASoC: Intel: bxt_rt298: add missing .=
owner field<br>
&gt;=C2=A0 =C2=A0 =C2=A05ee90079d049 ASoC: Intel: sof_sdw: add missing .ow=
ner field<br>
&gt;=C2=A0 =C2=A0 =C2=A0f678fb5fd3ba ASoC: Intel: cml_rt1011_rt5682: add m=
issing .owner field<br>
&gt;=C2=A0 =C2=A0 =C2=A072425036a6c5 ASoC: SOF: nocodec: add missing .owne=
r field<br>
&gt;=C2=A0 =C2=A0 =C2=A037c77ff3b1cc dpaa2-eth: fix condition for number o=
f buffer acquire retries<br>
&gt;=C2=A0 =C2=A0 =C2=A0ed3f590f2ac6 staging: most: avoid null pointer der=
eference when iface is null<br>
&gt;=C2=A0 =C2=A0 =C2=A010738d622ef0 media: omap3isp: Add missed v4l2_ctrl=
_handler_free() for preview_init_entities()<br>
&gt;=C2=A0 =C2=A0 =C2=A041013c90d84c media: marvell-ccic: Add missed v4l2_=
async_notifier_cleanup()<br>
&gt;=C2=A0 =C2=A0 =C2=A0eadd4aa1c520 media: cxusb-analog: fix V4L2 depende=
ncy<br>
&gt;=C2=A0 =C2=A0 =C2=A0b50202c0770c Bluetooth: btmtksdio: fix up firmware=
 download sequence<br>
&gt;=C2=A0 =C2=A0 =C2=A06fb4ccc66e01 Bluetooth: btusb: fix up firmware dow=
nload sequence<br>
&gt;=C2=A0 =C2=A0 =C2=A056704a6ba1c7 ASoC: fsl_easrc: Fix uninitialized sc=
alar variable in fsl_easrc_set_ctx_format<br>
&gt;=C2=A0 =C2=A0 =C2=A0d304a3f78d1b leds: lm355x: avoid enum conversion w=
arning<br>
&gt;=C2=A0 =C2=A0 =C2=A0d95947426c42 powerpc/fixmap: Fix FIX_EARLY_DEBUG_B=
ASE when page size is 256k<br>
&gt;=C2=A0 =C2=A0 =C2=A010057c82dd62 powerpc/mm: Fix typo in IS_ENABLED()<=
br>
&gt;=C2=A0 =C2=A0 =C2=A047fea4d1a23f clk: bcm63xx-gate: fix last clock ava=
ilability<br>
&gt;=C2=A0 =C2=A0 =C2=A0a29030741107 drm/arm: fix unintentional integer ov=
erflow on left shift<br>
&gt;=C2=A0 =C2=A0 =C2=A03ea4204a722a drm/panfrost: Fix inbalance of devfre=
q record_busy/idle()<br>
&gt;=C2=A0 =C2=A0 =C2=A0b9af8ae89d51 drm/etnaviv: Fix error path on failur=
e to enable bus clk<br>
&gt;=C2=A0 =C2=A0 =C2=A07022baca7cfb scsi: ufs: Fix imprecise load calcula=
tion in devfreq window<br>
&gt;=C2=A0 =C2=A0 =C2=A0c53b4ac934e4 iio: amplifiers: ad8366: Change devm_=
gpiod_get() to optional and add the missed check<br>
&gt;=C2=A0 =C2=A0 =C2=A00f3ff5cba631 iio: improve IIO_CONCENTRATION channe=
l type description<br>
&gt;=C2=A0 =C2=A0 =C2=A05af9cf807b5e Bluetooth: hci_qca: Increase SoC idle=
 timeout to 200ms<br>
&gt;=C2=A0 =C2=A0 =C2=A01d22f52161b2 Bluetooth: hci_qca: Bug fix during SS=
R timeout<br>
&gt;=C2=A0 =C2=A0 =C2=A017e8eb2db9cc ath10k: Acquire tx_lock in tx error p=
aths<br>
&gt;=C2=A0 =C2=A0 =C2=A01b1cacc13022 Bluetooth: Allow suspend even when pr=
eparation has failed<br>
&gt;=C2=A0 =C2=A0 =C2=A04f87bf4b50b5 Bluetooth: hci_qca: Only remove TX cl=
ock vote after TX is completed<br>
&gt;=C2=A0 =C2=A0 =C2=A088959e705f04 drm/mm: fix hole size comparison<br>
&gt;=C2=A0 =C2=A0 =C2=A0fe7a5d7fdea5 Bluetooth: hci_qca: Fix an error poin=
ter dereference<br>
&gt;=C2=A0 =C2=A0 =C2=A0f1785f21b6be video: pxafb: Fix the function used t=
o balance a &#39;dma_alloc_coherent()&#39; call<br>
&gt;=C2=A0 =C2=A0 =C2=A092f18805fd07 console: newport_con: fix an issue ab=
out leak related system resources<br>
&gt;=C2=A0 =C2=A0 =C2=A0ec47a8107033 video: fbdev: sm712fb: fix an issue a=
bout iounmap for a wrong address<br>
&gt;=C2=A0 =C2=A0 =C2=A04d2663776cae btmrvl: Fix firmware filename for sd8=
997 chipset<br>
&gt;=C2=A0 =C2=A0 =C2=A02e00553ce46e btmrvl: Fix firmware filename for sd8=
977 chipset<br>
&gt;=C2=A0 =C2=A0 =C2=A086faf4735ccf mwifiex: Fix firmware filename for sd=
8997 chipset<br>
&gt;=C2=A0 =C2=A0 =C2=A0d41c930387d3 mwifiex: Fix firmware filename for sd=
8977 chipset<br>
&gt;=C2=A0 =C2=A0 =C2=A04f82ecd46efe agp/intel: Fix a memory leak on modul=
e initialisation failure<br>
&gt;=C2=A0 =C2=A0 =C2=A086a94d97881d drm/amdgpu: use the unlocked drm_gem_=
object_put<br>
&gt;=C2=A0 =C2=A0 =C2=A01d2ead5d4b39 drm/bridge: ti-sn65dsi86: Fix off-by-=
one error in clock choice<br>
&gt;=C2=A0 =C2=A0 =C2=A0b81b49591375 drm/bridge: ti-sn65dsi86: Clear old e=
rror bits before AUX transfers<br>
&gt;=C2=A0 =C2=A0 =C2=A0d65751086ca7 drm/gem: Fix a leak in drm_gem_object=
s_lookup()<br>
&gt;=C2=A0 =C2=A0 =C2=A07c83c5090850 drm/msm: ratelimit crtc event overflo=
w error<br>
&gt;=C2=A0 =C2=A0 =C2=A046c8b2e8255c crypto: caam - silence .setkey in cas=
e of bad key length<br>
&gt;=C2=A0 =C2=A0 =C2=A0d5c9f20e4ad7 io_uring: fix stalled deferred reques=
ts<br>
&gt;=C2=A0 =C2=A0 =C2=A0458ae14d4ce5 io_uring: fix racy overflow count rep=
orting<br>
&gt;=C2=A0 =C2=A0 =C2=A07ab9b92b614d ACPICA: Do not increment operation_re=
gion reference counts for field units<br>
&gt;=C2=A0 =C2=A0 =C2=A0064c5272a19d btrfs: qgroup: free per-trans reserve=
d space when a subvolume gets dropped<br>
&gt;=C2=A0 =C2=A0 =C2=A016a35c7dd8f4 btrfs: allow btrfs_truncate_block() t=
o fallback to nocow for data space reservation<br>
&gt;=C2=A0 =C2=A0 =C2=A011bf4638158a bcache: fix super block seq numbers c=
omparision in register_cache_set()<br>
&gt;=C2=A0 =C2=A0 =C2=A020fa1e9929e8 dyndbg: fix a BUG_ON in ddebug_descri=
be_flags<br>
&gt;=C2=A0 =C2=A0 =C2=A02f92047fea41 usb: bdc: Halt controller on suspend<=
br>
&gt;=C2=A0 =C2=A0 =C2=A08415df3d6eb1 bdc: Fix bug causing crash after mult=
iple disconnects<br>
&gt;=C2=A0 =C2=A0 =C2=A07677cbd18b99 usb: gadget: net2280: fix memory leak=
 on probe error handling paths<br>
&gt;=C2=A0 =C2=A0 =C2=A0fa979805e400 mmc: sdhci-pci-o2micro: Bug fix for O=
2 host controller Seabird1<br>
&gt;=C2=A0 =C2=A0 =C2=A0d5bf76c14acd x86/uaccess: Make __get_user_size() C=
lang compliant on 32-bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0c234811c3754 ionic: update eid test for overflow<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A07ee88f37ad1b drm/amd/powerplay: suppress compile e=
rror around BUG_ON<br>
&gt;=C2=A0 =C2=A0 =C2=A02ae6cbe7652a gpu: host1x: debug: Fix multiple chan=
nels emitting messages simultaneously<br>
&gt;=C2=A0 =C2=A0 =C2=A04e701b476f48 iwlegacy: Check the return value of p=
cie_capability_read_*()<br>
&gt;=C2=A0 =C2=A0 =C2=A079f477d1beac platform/x86: asus-nb-wmi: add suppor=
t for ASUS ROG Zephyrus G14 and G15<br>
&gt;=C2=A0 =C2=A0 =C2=A0b195c3db8434 brcmfmac: set state of hanger slot to=
 FREE when flushing PSQ<br>
&gt;=C2=A0 =C2=A0 =C2=A0f41a2583e10b brcmfmac: To fix Bss Info flag defini=
tion Bug<br>
&gt;=C2=A0 =C2=A0 =C2=A038a031bbdfd3 brcmfmac: keep SDIO watchdog running =
when console_interval is non-zero<br>
&gt;=C2=A0 =C2=A0 =C2=A093e05fd717de Bluetooth: hci_qca: Bug fixes for SSR=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0a82baea4babd bpf: Fix fds_example SIGSEGV error<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0e9496b4f3165 drm/amd/powerplay: fix compile error =
with ARCH=3Darc<br>
&gt;=C2=A0 =C2=A0 =C2=A0e4c9ade43bc5 drm/amd/display: allow query ddc data=
 over aux to be read only operation<br>
&gt;=C2=A0 =C2=A0 =C2=A081ece245ce78 drm/amdgpu/display: properly guard th=
e calls to swSMU functions<br>
&gt;=C2=A0 =C2=A0 =C2=A053812570f84c drm/amdgpu/display bail early in dm_p=
p_get_static_clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0865e2dbadf68 drm/amdgpu/debugfs: fix ref count lea=
k when pm_runtime_get_sync fails<br>
&gt;=C2=A0 =C2=A0 =C2=A01adb2ff1f6b1 drm/amd/display: Improve DisplayPort =
monitor interop<br>
&gt;=C2=A0 =C2=A0 =C2=A01839d11b9bb2 mm/mmap.c: Add cond_resched() for exi=
t_mmap() CPU stalls<br>
&gt;=C2=A0 =C2=A0 =C2=A0b70d115ebdcf irqchip/irq-mtk-sysirq: Replace spinl=
ock with raw_spinlock<br>
&gt;=C2=A0 =C2=A0 =C2=A0d77ecc91b0d8 net: phy: mscc: restore the base page=
 in vsc8514/8584_config_init<br>
&gt;=C2=A0 =C2=A0 =C2=A0befe5de6250b drm/radeon: disable AGP by default<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0175bbacf669b drm/debugfs: fix plain echo to connec=
tor &quot;force&quot; attribute<br>
&gt;=C2=A0 =C2=A0 =C2=A0376bf3ddda59 drm/msm: Fix a null pointer access in=
 msm_gem_shrinker_count()<br>
&gt;=C2=A0 =C2=A0 =C2=A037f45e55b596 drm: msm: a6xx: fix gpu failure after=
 system resume<br>
&gt;=C2=A0 =C2=A0 =C2=A0f2ea1e1877d0 usb: mtu3: clear dual mode of u3port =
when disable device<br>
&gt;=C2=A0 =C2=A0 =C2=A0870ed79fc2b7 btrfs: fix lockdep splat from btrfs_d=
ump_space_info<br>
&gt;=C2=A0 =C2=A0 =C2=A014fad4e83050 mmc: sdhci-cadence: do not use hardwa=
re tuning for SD mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0085af96b1506 drm/nouveau: fix multiple instances o=
f reference count leaks<br>
&gt;=C2=A0 =C2=A0 =C2=A0ff0ef144057e drm/nouveau: fix reference count leak=
 in nouveau_debugfs_strap_peek<br>
&gt;=C2=A0 =C2=A0 =C2=A0ef11e2b533de memory: samsung: exynos5422-dmc: Do n=
ot ignore return code of regmap_read()<br>
&gt;=C2=A0 =C2=A0 =C2=A01020d869babf ionic: rearrange reset and bus-master=
 control<br>
&gt;=C2=A0 =C2=A0 =C2=A051d26960fcb0 drm/etnaviv: fix ref count leak via p=
m_runtime_get_sync<br>
&gt;=C2=A0 =C2=A0 =C2=A049395a64e5f5 arm64: dts: hisilicon: hikey: fixes t=
o comply with adi, adv7533 DT binding<br>
&gt;=C2=A0 =C2=A0 =C2=A0256d7e3a6752 drm/nouveau/kms/nv50-: Fix disabling =
dithering<br>
&gt;=C2=A0 =C2=A0 =C2=A077a318a4da3e rtw88: 8822ce: add support for device=
 ID 0xc82f<br>
&gt;=C2=A0 =C2=A0 =C2=A0679d3baca18f md-cluster: fix wild pointer of unloc=
k_all_bitmaps()<br>
&gt;=C2=A0 =C2=A0 =C2=A00ff3a2b771b9 bus: ti-sysc: Add missing quirk flags=
 for usb_host_hs<br>
&gt;=C2=A0 =C2=A0 =C2=A08131c27f8088 video: fbdev: neofb: fix memory leak =
in neo_scan_monitor()<br>
&gt;=C2=A0 =C2=A0 =C2=A05cc3bdb0aea5 video: fbdev: savage: fix memory leak=
 on error handling path in probe<br>
&gt;=C2=A0 =C2=A0 =C2=A0cccec0d3e0ef crypto: aesni - Fix build with LLVM_I=
AS=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A090bcb927d66d drm/radeon: Fix reference count leaks=
 caused by pm_runtime_get_sync<br>
&gt;=C2=A0 =C2=A0 =C2=A059fed9e55e17 drm/amdgpu: avoid dereferencing a NUL=
L pointer<br>
&gt;=C2=A0 =C2=A0 =C2=A06cd01fb89ac9 fs/btrfs: Add cond_resched() for try_=
release_extent_mapping() stalls<br>
&gt;=C2=A0 =C2=A0 =C2=A05a4f7281d5a6 io_uring: fix req-&gt;work corruption=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0b51a31ec3e7c loop: be paranoid on exit and prevent=
 new additions / removals<br>
&gt;=C2=A0 =C2=A0 =C2=A035dfb4f8423e Bluetooth: add a mutex lock to avoid =
UAF in do_enale_set<br>
&gt;=C2=A0 =C2=A0 =C2=A07fd31dbc8ece ARM: exynos: clear L310_AUX_CTRL_FULL=
_LINE_ZERO in default l2c_aux_val<br>
&gt;=C2=A0 =C2=A0 =C2=A0be90ca6b1f53 net: mscc: ocelot: fix encoding desti=
nation ports into multicast IPv4 address<br>
&gt;=C2=A0 =C2=A0 =C2=A09638ef9db839 soc: qcom: rpmh-rsc: Set suppress_bin=
d_attrs flag<br>
&gt;=C2=A0 =C2=A0 =C2=A047b94c5c6604 drm/tilcdc: fix leak &amp; null ref i=
n panel_connector_get_modes<br>
&gt;=C2=A0 =C2=A0 =C2=A022ca8cb2a5b9 block: don&#39;t do revalidate zones =
on invalid devices<br>
&gt;=C2=A0 =C2=A0 =C2=A04c3aeda8791c irqchip/loongson-pch-pic: Fix the mis=
used irq flow handler<br>
&gt;=C2=A0 =C2=A0 =C2=A0c790d6a2306b nvme-multipath: do not fall back to _=
_nvme_find_path() for non-optimized paths<br>
&gt;=C2=A0 =C2=A0 =C2=A0ebd5b7f6b99e nvme-multipath: fix logic for non-opt=
imized paths<br>
&gt;=C2=A0 =C2=A0 =C2=A0a7e15f57766c nvme-rdma: fix controller reset hang =
during traffic<br>
&gt;=C2=A0 =C2=A0 =C2=A0c11521f04ed9 nvme-tcp: fix controller reset hang d=
uring traffic<br>
&gt;=C2=A0 =C2=A0 =C2=A0ac26d372f1a3 irqchip/gic-v4.1: Use GFP_ATOMIC flag=
 in allocate_vpe_l1_table()<br>
&gt;=C2=A0 =C2=A0 =C2=A0bc654671a452 irqchip/irq-bcm7038-l1: Guard uses of=
 cpu_logical_map<br>
&gt;=C2=A0 =C2=A0 =C2=A0ee9db7fc3a2b kunit: tool: fix improper treatment o=
f file location<br>
&gt;=C2=A0 =C2=A0 =C2=A00044496d9440 kunit: tool: fix broken default args =
in unit tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0dda3d66364ed irqchip/loongson-liointc: Fix potenti=
al dead lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0922ce733868a irqchip/loongson-pch-pic: Check retur=
n value of irq_domain_translate_twocell()<br>
&gt;=C2=A0 =C2=A0 =C2=A0594496eccb4c irqchip/loongson-htvec: Check return =
value of irq_domain_translate_onecell()<br>
&gt;=C2=A0 =C2=A0 =C2=A06affe6f7db79 irqchip/loongson-htvec: Fix potential=
 resource leak<br>
&gt;=C2=A0 =C2=A0 =C2=A01926d2da825f md: raid0/linear: fix dereference bef=
ore null check on pointer mddev<br>
&gt;=C2=A0 =C2=A0 =C2=A051ef07ca87be seccomp: Fix ioctl number for SECCOMP=
_IOCTL_NOTIF_ID_VALID<br>
&gt;=C2=A0 =C2=A0 =C2=A0d2d09105657d irqchip/ti-sci-inta: Fix return value=
 about devm_ioremap_resource()<br>
&gt;=C2=A0 =C2=A0 =C2=A08705ff60b829 scripts/selinux/mdp: fix initial SID =
handling<br>
&gt;=C2=A0 =C2=A0 =C2=A035d16397b2ab iocost: Fix check condition of iocg a=
bs_vdebt<br>
&gt;=C2=A0 =C2=A0 =C2=A0793788d7848c ARM: socfpga: PM: add missing put_dev=
ice() call in socfpga_setup_ocram_self_refresh()<br>
&gt;=C2=A0 =C2=A0 =C2=A00e16025c3657 spi: rockchip: Fix error in SPI slave=
 pio read<br>
&gt;=C2=A0 =C2=A0 =C2=A07ca8cc7b3ee0 soc: qcom: pdr: Reorder the PD state =
indication ack<br>
&gt;=C2=A0 =C2=A0 =C2=A0f743813ff463 arm64: dts: meson: fix mmc0 tuning er=
ror on Khadas VIM3<br>
&gt;=C2=A0 =C2=A0 =C2=A08dcdb3754ffd arm64: dts: meson: misc fixups for w4=
00 dtsi<br>
&gt;=C2=A0 =C2=A0 =C2=A0ff316db596a8 io_uring: fix sq array offset calcula=
tion<br>
&gt;=C2=A0 =C2=A0 =C2=A0680283e6992d regulator: fix memory leak on error p=
ath of regulator_register()<br>
&gt;=C2=A0 =C2=A0 =C2=A0ca1c20292739 recordmcount: only record relocation =
of type R_AARCH64_CALL26 on arm64.<br>
&gt;=C2=A0 =C2=A0 =C2=A08e7d79dec504 tpm: Require that all digests are pre=
sent in TCG_PCR_EVENT2 structures<br>
&gt;=C2=A0 =C2=A0 =C2=A081fd1c90e748 crypto: x86/crc32c - fix building wit=
h clang ias<br>
&gt;=C2=A0 =C2=A0 =C2=A06760df0358ef spi: lantiq: fix: Rx overflow error i=
n full duplex mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0067345b6863f spi: dw-dma: Fix Tx DMA channel worki=
ng too fast<br>
&gt;=C2=A0 =C2=A0 =C2=A0af58be14b8c1 ARM: dts: stm32: Fix spi4 pins in stm=
32mp15-pinctrl<br>
&gt;=C2=A0 =C2=A0 =C2=A019798aa6945c ARM: dts: sunxi: bananapi-m2-plus-v1.=
2: Fix CPU supply voltages<br>
&gt;=C2=A0 =C2=A0 =C2=A02f2b61f5cb0c ARM: dts: sunxi: bananapi-m2-plus-v1.=
2: Add regulator supply to all CPU cores<br>
&gt;=C2=A0 =C2=A0 =C2=A03b5043161541 ARM: dts: at91: sama5d3_xplained: cha=
nge phy-mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0ea2c9ccdbb33 reset: intel: fix a compile warning a=
bout REG_OFFSET redefined<br>
&gt;=C2=A0 =C2=A0 =C2=A014ae200d052b ARM: dts: exynos: Disable frequency s=
caling for FSYS bus on Odroid XU3 family<br>
&gt;=C2=A0 =C2=A0 =C2=A0c1e877ce5e12 ARM: at91: pm: add missing put_device=
() call in at91_pm_sram_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A04f8c0858195c ARM: dts: gose: Fix ports node name f=
or adv7612<br>
&gt;=C2=A0 =C2=A0 =C2=A0141b07accc60 arm64: dts: renesas: Fix SD Card/eMMC=
 interface device node names<br>
&gt;=C2=A0 =C2=A0 =C2=A0459fae59fa50 ARM: dts: gose: Fix ports node name f=
or adv7180<br>
&gt;=C2=A0 =C2=A0 =C2=A07b49da0dd3f4 platform/x86: intel-vbtn: Fix return =
value check in check_acpi_dev()<br>
&gt;=C2=A0 =C2=A0 =C2=A054ba0892aabc platform/x86: intel-hid: Fix return v=
alue check in check_acpi_dev()<br>
&gt;=C2=A0 =C2=A0 =C2=A040bd5e36e27e m68k: mac: Fix IOP status/control reg=
ister writes<br>
&gt;=C2=A0 =C2=A0 =C2=A06b4132d29576 m68k: mac: Don&#39;t send IOP message=
 until channel is idle<br>
&gt;=C2=A0 =C2=A0 =C2=A0d3e1f3ea5877 clk: scmi: Fix min and max rate when =
registering clocks with discrete rates<br>
&gt;=C2=A0 =C2=A0 =C2=A002a4e7bc34eb crypto: qat - allow xts requests not =
multiple of block<br>
&gt;=C2=A0 =C2=A0 =C2=A0d4ec29ee8836 sched/uclamp: Fix initialization of s=
truct uclamp_rq<br>
&gt;=C2=A0 =C2=A0 =C2=A06d67baf624c6 arm64: dts: exynos: Fix silent hang a=
fter boot on Espresso<br>
&gt;=C2=A0 =C2=A0 =C2=A00c348e7b0380 arm64: dts: sun50i-pinephone: dldo4 m=
ust not be &gt;=3D 1.8V<br>
&gt;=C2=A0 =C2=A0 =C2=A0660f9b20f525 firmware: arm_scmi: Fix SCMI genpd do=
main probing<br>
&gt;=C2=A0 =C2=A0 =C2=A07ea14136a7d4 rcu/tree: Repeat the monitor if any f=
ree channel is busy<br>
&gt;=C2=A0 =C2=A0 =C2=A0a1e2c6d58bd8 ARM: exynos: MCPM: Restore big.LITTLE=
 cpuidle support<br>
&gt;=C2=A0 =C2=A0 =C2=A0c7b6519619aa crypto: ccree - fix resource leak on =
error path<br>
&gt;=C2=A0 =C2=A0 =C2=A006769a572492 soc: qcom: rpmh-rsc: Don&#39;t use kt=
ime for timeout in write_tcs_reg_sync()<br>
&gt;=C2=A0 =C2=A0 =C2=A000734ff000fc blktrace: fix debugfs use after free<=
br>
&gt;=C2=A0 =C2=A0 =C2=A071fc8e5f4cc3 memory: tegra: Fix an error handling =
path in tegra186_emc_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A0d84a71c79a0c arm64: dts: qcom: msm8916: Replace in=
valid bias-pull-none property<br>
&gt;=C2=A0 =C2=A0 =C2=A0f6ab00652486 crc-t10dif: Fix potential crypto noti=
fy dead-lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0012f0e4c9732 EDAC: Fix reference count leaks<br>
&gt;=C2=A0 =C2=A0 =C2=A0b069187f3044 arm64: dts: rockchip: fix rk3399-puma=
 gmac reset gpio<br>
&gt;=C2=A0 =C2=A0 =C2=A0ae3da7d2be00 arm64: dts: rockchip: fix rk3399-puma=
 vcc5v0-host gpio<br>
&gt;=C2=A0 =C2=A0 =C2=A04df058114a1c arm64: dts: rockchip: fix rk3368-lion=
 gmac reset gpio<br>
&gt;=C2=A0 =C2=A0 =C2=A06624632301bc sched: correct SD_flags returned by t=
l-&gt;sd_flags()<br>
&gt;=C2=A0 =C2=A0 =C2=A04b53a8f2aed2 sched/fair: Fix NOHZ next idle balanc=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0f08ce56b56fe x86, sched: Bail out of frequency inv=
ariance if turbo_freq/base_freq gives 0<br>
&gt;=C2=A0 =C2=A0 =C2=A06ddc271a3a55 x86, sched: Bail out of frequency inv=
ariance if turbo frequency is unknown<br>
&gt;=C2=A0 =C2=A0 =C2=A02b611e8adc57 x86, sched: check for counters overfl=
ow in frequency invariant accounting<br>
&gt;=C2=A0 =C2=A0 =C2=A0792aececc15d perf/x86/intel/uncore: Fix oops when =
counting IMC uncore events on some TGL<br>
&gt;=C2=A0 =C2=A0 =C2=A0421caf5e2ba9 x86/mce/inject: Fix a wrong assignmen=
t of i_mce.status<br>
&gt;=C2=A0 =C2=A0 =C2=A01e5993c9e22c ARM: dts: stm32: fix uart7_pins_a com=
ments in stm32mp15-pinctrl<br>
&gt;=C2=A0 =C2=A0 =C2=A0ca1e6f9272ac ARM: dts: stm32: fix uart nodes order=
ing in stm32mp15-pinctrl<br>
&gt;=C2=A0 =C2=A0 =C2=A0d6828c99ab8a HID: input: Fix devices that return m=
ultiple bytes in battery report<br>
&gt;=C2=A0 =C2=A0 =C2=A07701efa45b5b io_uring: abstract out task work runn=
ing<br>
&gt;=C2=A0 =C2=A0 =C2=A02f2bf462d1d4 kunit: capture stderr on all make sub=
process calls<br>
&gt;=C2=A0 =C2=A0 =C2=A00534d726fffe tracepoint: Mark __tracepoint_string&=
#39;s __used<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_5.8.bb" rel=3D"noref=
errer" target=3D"_blank">linux-yocto-rt_5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++---<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_5.8.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-tiny_5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++----<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.8.bb</a>=C2=A0 | 22 +++=
++++++----------<br>
&gt;=C2=A0 3 files changed, 18 insertions(+), 18 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-=
rt_5.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.8.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.8.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-yocto-rt_5.8.bb</a><br>
&gt; index e23e7dcfb1..6317f8da7b 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.8.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.8.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.8.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.8.bb</a><br>
&gt; @@ -11,13 +11,13 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Set=
 PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;)<br=
>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -SRCREV_machine ?=3D &quot;d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3&q=
uot;<br>
&gt; -SRCREV_meta ?=3D &quot;a3138cb23c3b7409c516d5d2115da9534c120a0c&quot=
;<br>
&gt; +SRCREV_machine ?=3D &quot;3eb064c5f2b3938ef296c016bc7904cd66f50329&q=
uot;<br>
&gt; +SRCREV_meta ?=3D &quot;196209114496901389e2f9012c0600121fc617e0&quot=
;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/=
linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};=
name=3Dmachine</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:=
//git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.8;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.8;destsuffix=3D${KMETA}</a>&quot;<br>
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;5.8.1&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;5.8.2&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7f=
c9398086aedcd7e46&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-=
tiny_5.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.8.bb</=
a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.8.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.8.bb</a><br>
&gt; index 36a8ae4577..022779f97f 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.=
8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.8.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.=
8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.8.bb</a><br>
&gt; @@ -6,7 +6,7 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
&gt;<br>
&gt;=C2=A0 require recipes-kernel/linux/linux-yocto.inc<br>
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;5.8.1&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;5.8.2&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7f=
c9398086aedcd7e46&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x8=
6&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; @@ -15,9 +15,9 @@ DEPENDS +=3D &quot;openssl-native util-linux-native=
&quot;<br>
&gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt;<br>
&gt; -SRCREV_machine_qemuarm ?=3D &quot;566e869df9400258b6f162bf34933f5b6d=
cd0115&quot;<br>
&gt; -SRCREV_machine ?=3D &quot;d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3&q=
uot;<br>
&gt; -SRCREV_meta ?=3D &quot;a3138cb23c3b7409c516d5d2115da9534c120a0c&quot=
;<br>
&gt; +SRCREV_machine_qemuarm ?=3D &quot;15d5da73971d108241be861b5587949fd5=
6933e9&quot;<br>
&gt; +SRCREV_machine ?=3D &quot;3eb064c5f2b3938ef296c016bc7904cd66f50329&q=
uot;<br>
&gt; +SRCREV_meta ?=3D &quot;196209114496901389e2f9012c0600121fc617e0&quot=
;<br>
&gt;<br>
&gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_=
5.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.8.bb</a> b/meta/=
recipes-kernel/linux/<a href=3D"http://linux-yocto_5.8.bb" rel=3D"noreferre=
r" target=3D"_blank">linux-yocto_5.8.bb</a><br>
&gt; index aad689590c..ea167c1866 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.8.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.8.bb</a><br>
&gt; @@ -12,16 +12,16 @@ KBRANCH_qemux86=C2=A0 ?=3D &quot;v5.8/standard/ba=
se&quot;<br>
&gt;=C2=A0 KBRANCH_qemux86-64 ?=3D &quot;v5.8/standard/base&quot;<br>
&gt;=C2=A0 KBRANCH_qemumips64 ?=3D &quot;v5.8/standard/mti-malta64&quot;<b=
r>
&gt;<br>
&gt; -SRCREV_machine_qemuarm ?=3D &quot;097417e785af04be0cbe757bc6e24456a3=
f701fd&quot;<br>
&gt; -SRCREV_machine_qemuarm64 ?=3D &quot;d3c69e89ee5b5d4c3c19b8614bdcdc3f=
5dc7a8b3&quot;<br>
&gt; -SRCREV_machine_qemumips ?=3D &quot;1fc5490bef8322680d73f6ab2c7b666ec=
cc3bce1&quot;<br>
&gt; -SRCREV_machine_qemuppc ?=3D &quot;d3c69e89ee5b5d4c3c19b8614bdcdc3f5d=
c7a8b3&quot;<br>
&gt; -SRCREV_machine_qemuriscv64 ?=3D &quot;d3c69e89ee5b5d4c3c19b8614bdcdc=
3f5dc7a8b3&quot;<br>
&gt; -SRCREV_machine_qemux86 ?=3D &quot;d3c69e89ee5b5d4c3c19b8614bdcdc3f5d=
c7a8b3&quot;<br>
&gt; -SRCREV_machine_qemux86-64 ?=3D &quot;d3c69e89ee5b5d4c3c19b8614bdcdc3=
f5dc7a8b3&quot;<br>
&gt; -SRCREV_machine_qemumips64 ?=3D &quot;e61fc06792254eed92c6908a9b35790=
ed54b0ace&quot;<br>
&gt; -SRCREV_machine ?=3D &quot;d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3&q=
uot;<br>
&gt; -SRCREV_meta ?=3D &quot;a3138cb23c3b7409c516d5d2115da9534c120a0c&quot=
;<br>
&gt; +SRCREV_machine_qemuarm ?=3D &quot;ca2de8f4027075ca7d7c973c2cc03f7d8b=
219a43&quot;<br>
&gt; +SRCREV_machine_qemuarm64 ?=3D &quot;3eb064c5f2b3938ef296c016bc7904cd=
66f50329&quot;<br>
&gt; +SRCREV_machine_qemumips ?=3D &quot;5e0205a156d14b6341487a169b75ea45b=
67007b9&quot;<br>
&gt; +SRCREV_machine_qemuppc ?=3D &quot;3eb064c5f2b3938ef296c016bc7904cd66=
f50329&quot;<br>
&gt; +SRCREV_machine_qemuriscv64 ?=3D &quot;3eb064c5f2b3938ef296c016bc7904=
cd66f50329&quot;<br>
&gt; +SRCREV_machine_qemux86 ?=3D &quot;3eb064c5f2b3938ef296c016bc7904cd66=
f50329&quot;<br>
&gt; +SRCREV_machine_qemux86-64 ?=3D &quot;3eb064c5f2b3938ef296c016bc7904c=
d66f50329&quot;<br>
&gt; +SRCREV_machine_qemumips64 ?=3D &quot;576f92f17434ae7dd027e8d465a32e4=
119ead4ee&quot;<br>
&gt; +SRCREV_machine ?=3D &quot;3eb064c5f2b3938ef296c016bc7904cd66f50329&q=
uot;<br>
&gt; +SRCREV_meta ?=3D &quot;196209114496901389e2f9012c0600121fc617e0&quot=
;<br>
&gt;<br>
&gt;=C2=A0 # remap qemuarm to qemuarma15 for the 5.8 kernel<br>
&gt;=C2=A0 # KMACHINE_qemuarm ?=3D &quot;qemuarma15&quot;<br>
&gt; @@ -30,7 +30,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yocto=
project.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"norefe=
rrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine=
;branch=3D${KBRA</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:=
//git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.8;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.8;destsuffix=3D${KMETA}</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7f=
c9398086aedcd7e46&quot;<br>
&gt; -LINUX_VERSION ?=3D &quot;5.8.1&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;5.8.2&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x8=
6&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
&gt; --<br>
&gt; 2.19.1<br>
&gt;<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
">- Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r><br></div></div>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000f179ed05ad7a725d--
