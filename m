Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CC8C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.10706.1652193565397838443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hs/gamNT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id m12so3181255plb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PZBuMkxU3At9YKBHbac6Tvyp2tAz81DSj8QOxR4oNEg=;
        b=hs/gamNT2d9mTkzcnxm05M8DI6tfrUaVdciBhdUyqttvUVXytULK+YosH550jopE/y
         BmUlK84+hGMtTu3vT/IZRBhDdXJhXVc01DQEDJHejHl8T6C7B6h6vA1LuxiC8d/r47zd
         nn5WkkF55vnekhaez6RkB7gQ3mz2VG8KgjQ6a1XWFL1rBDo9kalxG22blhf/CzutRuAs
         ZO2io1v6KDcnJZm7S77NY4nVEwu4pkRUhBkTeJeEk/7Elela0STDl9XhMyzzM8K5hZcv
         Op1eklkZZYl3oc1Urwyoy99EFu2owa3qV0H3PNfoAT8e9zxP6rLmI37/K01BMtokb6sZ
         46Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PZBuMkxU3At9YKBHbac6Tvyp2tAz81DSj8QOxR4oNEg=;
        b=uEOegOQ79OAx74VIxFfSmjNsZFWFsWB+rsTTjhccBAkEoPKG4jJFcpVoPsUIROJTkE
         0nHxSTqA2tUi5HIOBA9q/2xyVam6yq1uOEzcCNs7niNYOccNgexKzG64haYa1yTKw3Un
         UfWSncFQsOtRlMjYH8teRBa/lNhFPwjYpmYs4d+pdcy3zDw8ygpBrybr6SZczXxiLV0I
         CxSXqvVlksj61VJVG01m/toJFuXDfmY82PRRXrWklnUIYEY388JL4RNxGFfs2sA767Yp
         3v208xABdLL8KgQtMZXx/OySnn5Q/9ll1sc6x/ZU8swfS2/xFBS/KQpSxGhjYzYi9cXn
         F7gA==
X-Gm-Message-State: AOAM531hHbc19U7lHij0SaMuBITQT4AaI87xn0GZj5IclpndtoTqg0SW
	Co+dEgYZF4xeDpe8ScgzFIUIgcD8Fvp9BYYm
X-Google-Smtp-Source: 
 ABdhPJzsh8ZWLq5id46RSss2ecMVM+kMD4SuBQwgp76zSUrZiKSmIgW8euAulITVO99F4b5lfHuPpg==
X-Received: by 2002:a17:902:7897:b0:15d:318d:706b with SMTP id
 q23-20020a170902789700b0015d318d706bmr20538462pll.16.1652193563640;
        Tue, 10 May 2022 07:39:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/40] linux-yocto/5.15: update to v5.15.35
Date: Tue, 10 May 2022 04:36:59 -1000
Message-Id: 
 <2104966bb02100e661ce77887470b0df7a877ff2.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165437

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    81d8d30c35ed Linux 5.15.35
    85f25bb9a005 ax25: Fix UAF bugs in ax25 timers
    43c107021d91 ax25: Fix NULL pointer dereferences in ax25 timers
    da6509fba636 ax25: fix NPD bug in ax25_disconnect
    1bf8946d5826 ax25: fix UAF bug in ax25_send_control()
    452ae92b9906 ax25: Fix refcount leaks caused by ax25_cb_del()
    b982492ec3a1 ax25: fix UAF bugs of net_device caused by rebinding operation
    bc706d89199b ax25: fix reference count leaks of ax25_dev
    9af0fd5c4453 ax25: add refcount in ax25_dev to avoid UAF bugs
    de6a76eea645 cpufreq: intel_pstate: ITMT support for overclocked system
    74d23d422556 net: ipa: fix a build dependency
    1648c7b450d8 soc: qcom: aoss: Fix missing put_device call in qmp_get
    d712aea3cd81 cpu/hotplug: Remove the 'cpu' member of cpuhp_cpu_state
    14785927a1d4 drm/i915: Sunset igpu legacy mmap support based on GRAPHICS_VER_FULL
    4ef9951d0252 dma-direct: avoid redundant memory sync for swiotlb
    111becd63e37 timers: Fix warning condition in __run_timers()
    cbdd7a33c533 dt-bindings: net: snps: remove duplicate name
    83a4c1080e09 i2c: pasemi: Wait for write xfers to finish
    44981e4cde68 smp: Fix offline cpu check in flush_smp_call_function_queue()
    2f345bb14ad4 i2c: dev: check return value when calling dev_set_name()
    6b4bf97587ef dm integrity: fix memory corruption when tag_size is less than digest size
    0940795c6834 ARM: davinci: da850-evm: Avoid NULL pointer dereference
    68a38b07f125 tick/nohz: Use WARN_ON_ONCE() to prevent console saturation
    c11ef9ded22e genirq/affinity: Consider that CPUs on nodes can be unbalanced
    c61d929944c9 x86/tsx: Disable TSX development mode at boot
    aaf27fcaefc1 x86/tsx: Use MSR_TSX_CTRL to clear CPUID bits
    2dd7d2eddf8e drm/amdgpu: Enable gfxoff quirk on MacBook Pro
    804c096d640e drm/amd/display: don't ignore alpha property on pre-multiplied mode
    adee01bbf6cb ipv6: fix panic when forwarding a pkt with no in6 dev
    cab64cb82fe1 nl80211: correctly check NL80211_ATTR_REG_ALPHA2 size
    63038f6e96a7 ALSA: pcm: Test for "silence" field in struct "pcm_format_data"
    a53062c94b8c ALSA: hda/realtek: add quirk for Lenovo Thinkpad X12 speakers
    0349df521528 ALSA: hda/realtek: Add quirk for Clevo PD50PNT
    3680b48533ae btrfs: mark resumed async balance as writing
    252db93fd0bd btrfs: fix root ref counts in error handling in btrfs_get_root_ref
    9b81c2c147e1 ath9k: Fix usage of driver-private space in tx_info
    3386927f436e ath9k: Properly clear TX status area before reporting to mac80211
    7a509a9f2bb7 cifs: verify that tcon is valid before dereference in cifs_kill_sb
    bd17422b9b67 gcc-plugins: latent_entropy: use /dev/urandom
    05d1824a7fb4 memory: renesas-rpc-if: fix platform-device leak in error path
    f5e13d700a4d SUNRPC: Fix NFSD's request deferral on RDMA transports
    00715427ea77 KVM: x86/mmu: Resolve nx_huge_pages when kvm.ko is loaded
    70ea5e7b38c3 mm: kmemleak: take a full lowmem check in kmemleak_*_phys()
    12ba1d38115a mm: fix unexpected zeroed page mapping with zram swap
    bb7645c33869 mm, page_alloc: fix build_zonerefs_node()
    b6d17c67885a mm/secretmem: fix panic when growing a memfd_secret
    4cdf0e7a5be8 perf/imx_ddr: Fix undefined behavior due to shift overflowing the constant
    b8ed0f7531f3 io_uring: use nospec annotation for more indexes
    5218d5cc0283 io_uring: zero tag on rsrc removal
    efb020924a71 drivers: net: slip: fix NPD bug in sl_tx_timeout()
    e455d7510db7 scsi: megaraid_sas: Target with invalid LUN ID is deleted during scan
    f1933d9ee745 scsi: mvsas: Add PCI ID of RocketRaid 2640
    389f37e46bdd scsi: mpt3sas: Fail reset operation if config request timed out
    184b4fad0872 drbd: set QUEUE_FLAG_STABLE_WRITES
    6a03581ccffa drm/amd/display: Fix allocate_mst_payload assert on resume
    ac2eb310af05 drm/amd/display: Revert FEC check in validation
    eab8e585840f drm/amd/display: Enable power gating before init_pipes
    d8860f1f9e41 spi: cadence-quadspi: fix protocol setup for non-1-1-X operations
    6d48df738272 myri10ge: fix an incorrect free for skb in myri10ge_sw_tso
    b416898442f2 net: usb: aqc111: Fix out-of-bounds accesses in RX fixup
    c3f86aef97cf Drivers: hv: balloon: Disable balloon and hot-add accordingly
    1c9fdb9587e0 net: axienet: setup mdio unconditionally
    61dd8bef80c2 tlb: hugetlb: Add more sizes to tlb_remove_huge_tlb_entry
    ed2711c696ce arm64: alternatives: mark patch_alternative() as `noinstr`
    cfd24b14eb2d regulator: wm8994: Add an off-on delay for WM8994 variant
    86d1cdf56fc5 gpu: ipu-v3: Fix dev_dbg frequency output
    4583205048ae ata: libata-core: Disable READ LOG DMA EXT for Samsung 840 EVOs
    6eecc4811a47 net: micrel: fix KS8851_MLL Kconfig
    9e60a788a3f7 scsi: ibmvscsis: Increase INITIAL_SRP_LIMIT to 1024
    026083cb43a4 scsi: lpfc: Fix queue failures when recovering from PCI parity error
    b7f3b5d70c83 scsi: target: tcmu: Fix possible page UAF
    44f95a5aae99 Drivers: hv: vmbus: Prevent load re-ordering when reading ring buffer
    92a3499933c1 PCI: hv: Propagate coherence from VMbus device to PCI device
    1b576e81d31b Drivers: hv: vmbus: Deactivate sysctl_record_panic_msg by default in isolated guests
    f2658d5966bc drm/amdkfd: Check for potential null return of kmalloc_array()
    9f0fabf30b48 drm/amdgpu/vcn: improve vcn dpg stop procedure
    25efb191d86b drm/amdkfd: Fix Incorrect VMIDs passed to HWS
    7a3bc11a4034 drm/amd/display: Update VTEM Infopacket definition
    92951699a5f1 drm/amd/display: FEC check in timing validation
    b054e8183fbd drm/amd/display: fix audio format not updated after edid updated
    37bc29a44538 drm/amdgpu/gmc: use PCI BARs for APUs in passthrough
    5a3b56a4a1c7 drm/amdgpu: conduct a proper cleanup of PDB bo
    01dcda701fef btrfs: do not warn for free space inode in cow_file_range
    bb93369f93b5 btrfs: fix fallocate to use file_modified to update permissions consistently
    6dded62e5aa6 drm/amd: Add USBC connector ID
    3e67054c339c block: fix offset/size check in bio_trim()
    279018a01b08 net: bcmgenet: Revert "Use stronger register read/writes to assure ordering"
    b8c0f6d1b04c vfio/pci: Fix vf_token mechanism when device-specific VF drivers are used
    5fda973f0ece dm mpath: only use ktime_get_ns() in historical selector
    9901b07ba42b cifs: potential buffer overflow in handling symlinks
    9ded5ae40f4f nfc: nci: add flush_workqueue to prevent uaf
    331c99ee8dcb net: ftgmac100: access hardware register after clock ready
    8f79ce226ad2 macvlan: Fix leaking skb in source mode with nodst option
    8e86fba13479 perf tools: Fix misleading add event PMU debug message
    1665758b4bfd ALSA: usb-audio: Limit max buffer and period sizes per time
    6b38c5722610 ALSA: usb-audio: Increase max buffer size
    7399ed8e6a8d testing/selftests/mqueue: Fix mq_perf_tests to free the allocated cpu set
    9947548d9cef io_uring: verify pad field is 0 in io_get_ext_arg
    7a7c9f9de961 io_uring: verify that resv2 is 0 in io_uring_rsrc_update2
    22aa1597f462 io_uring: move io_uring_rsrc_update2 validation
    cb981d5c7511 ALSA: mtpav: Don't call card private_free at probe error path
    872e5fa0781f ALSA: ad1889: Fix the missing snd_card_free() call at probe error
    96aceacda8d2 netfilter: nf_tables: nft_parse_register can return a negative value
    90c153ca45da sctp: Initialize daddr on peeled off socket
    50d46b5ce004 scsi: iscsi: Fix unbound endpoint error handling
    578616ac3d87 scsi: iscsi: Fix conn cleanup and stop race during iscsid restart
    485780af7ef1 scsi: iscsi: Fix endpoint reuse regression
    cbd4f4e40944 scsi: iscsi: Fix offload conn cleanup when iscsid restarts
    cc0082d45de1 scsi: iscsi: Move iscsi_ep_disconnect()
    d6f6f945e850 scsi: pm80xx: Enable upper inbound, outbound queues
    b02c509ceef4 scsi: pm80xx: Mask and unmask upper interrupt vectors 32-63
    3a523807f014 net/smc: Fix NULL pointer dereference in smc_pnet_find_ib()
    66b3107a4a06 drm/msm/dp: add fail safe mode outside of event_mutex context
    815006c33391 drm/msm/dsi: Use connector directly in msm_dsi_manager_connector_init()
    a6549b364be4 drm/msm: Fix range size vs end confusion
    1c86b7ea63ff netfilter: nft_socket: make cgroup match work in input too
    5a52384a5134 cfg80211: hold bss_lock while updating nontrans_list
    d5be67ecbeff net/sched: taprio: Check if socket flags are valid
    62a48383ebe2 net: ethernet: stmmac: fix altr_tse_pcs function when using a fixed-link
    72f9c15854b0 net: dsa: felix: suppress -EPROBE_DEFER errors
    13faa76cf572 net/sched: fix initialization order when updating chain 0 head
    4c979e6fcec8 mlxsw: i2c: Fix initialization error flow
    152b813d8ba5 net: mdio: don't defer probe forever if PHY IRQ provider is missing
    675e7d3086d0 cifs: release cached dentries only if mount is complete
    d40cf3492277 gpiolib: acpi: use correct format characters
    93940fc4cb81 veth: Ensure eth header is in skb's linear part
    de8a332c86a7 net/sched: flower: fix parsing of ethertype following VLAN header
    726ae7300fcc SUNRPC: Fix the svc_deferred_event trace class
    ec2ab59b9e66 media: rockchip/rga: do proper error checking in probe
    b0d8a9eb3239 firmware: arm_scmi: Fix sorting of retrieved clock rates
    e2da8f9ce3ea Revert "ath11k: mesh: add support for 256 bitmap in blockack frames in 11ax"
    9f029cb2c92e memory: atmel-ebi: Fix missing of_node_put in atmel_ebi_probe
    e7b1992b0722 firmware: arm_scmi: Remove clear channel call on the TX channel
    77ffc38e577d drm/msm: Add missing put_task_struct() in debugfs path
    aa4845194b9d ALSA: nm256: Don't call card private_free at probe error path
    425c83e2898d ALSA: usb-audio: Cap upper limits of buffer/period bytes for implicit fb
    3bbd4850d957 ALSA: via82xx: Fix the missing snd_card_free() call at probe error
    56e44ff13d84 ALSA: sonicvibes: Fix the missing snd_card_free() call at probe error
    73229d7cb836 ALSA: sc6000: Fix the missing snd_card_free() call at probe error
    df03ce487e1b ALSA: rme96: Fix the missing snd_card_free() call at probe error
    ef4c35339414 ALSA: rme9652: Fix the missing snd_card_free() call at probe error
    4efa63663c36 ALSA: rme32: Fix the missing snd_card_free() call at probe error
    bb94f5d98511 ALSA: riptide: Fix the missing snd_card_free() call at probe error
    4ecd10217df6 ALSA: oxygen: Fix the missing snd_card_free() call at probe error
    30b86477daaa ALSA: maestro3: Fix the missing snd_card_free() call at probe error
    5fbb73cb1208 ALSA: lx6464es: Fix the missing snd_card_free() call at probe error
    0651442d22e2 ALSA: lola: Fix the missing snd_card_free() call at probe error
    0bec8b8a57de ALSA: korg1212: Fix the missing snd_card_free() call at probe error
    d9ac5256de1f ALSA: intel_hdmi: Fix the missing snd_card_free() call at probe error
    e87b8d0ba455 ALSA: intel8x0: Fix the missing snd_card_free() call at probe error
    547c9af67b4e ALSA: ice1724: Fix the missing snd_card_free() call at probe error
    141abcbf902a ALSA: hdspm: Fix the missing snd_card_free() call at probe error
    f006a4bcf8bb ALSA: hdsp: Fix the missing snd_card_free() call at probe error
    85515309293b ALSA: galaxy: Fix the missing snd_card_free() call at probe error
    841e8f8dd21f ALSA: fm801: Fix the missing snd_card_free() call at probe error
    3a738f1b3ffd ALSA: es1968: Fix the missing snd_card_free() call at probe error
    d3c6ac7a051c ALSA: es1938: Fix the missing snd_card_free() call at probe error
    20b35ba7aa2f ALSA: ens137x: Fix the missing snd_card_free() call at probe error
    0d52c09f0c17 ALSA: emu10k1x: Fix the missing snd_card_free() call at probe error
    2a2a75ebdbd4 ALSA: echoaudio: Fix the missing snd_card_free() call at probe error
    648e89e9de29 ALSA: cs5535audio: Fix the missing snd_card_free() call at probe error
    9decc5bfd173 ALSA: cs4281: Fix the missing snd_card_free() call at probe error
    2dde47610757 ALSA: cmipci: Fix the missing snd_card_free() call at probe error
    f98476228801 ALSA: ca0106: Fix the missing snd_card_free() call at probe error
    e5a54e236f70 ALSA: bt87x: Fix the missing snd_card_free() call at probe error
    935629ba096e ALSA: azt3328: Fix the missing snd_card_free() call at probe error
    3a943321c362 ALSA: aw2: Fix the missing snd_card_free() call at probe error
    811a92b866a0 ALSA: au88x0: Fix the missing snd_card_free() call at probe error
    ea61c1bd582b ALSA: atiixp: Fix the missing snd_card_free() call at probe error
    007a9b5554e1 ALSA: als4000: Fix the missing snd_card_free() call at probe error
    291d9e5e94d0 ALSA: als300: Fix the missing snd_card_free() call at probe error
    5bc156409025 ALSA: ali5451: Fix the missing snd_card_free() call at probe error
    cfa98d6c41e0 ALSA: sis7019: Fix the missing error handling
    1479bdea76dd ALSA: core: Add snd_card_free_on_error() helper
    07cacfd9d9dc btrfs: release correct delalloc amount in direct IO write path
    8ff8bdb8c92d net: ipa: request IPA register values be retained
    587ced6b8cf3 dt-bindings: net: qcom,ipa: add optional qcom,qmp property
    7883df73fd59 soc: qcom: aoss: Expose send for generic usecase
    ec13aa4e0085 btrfs: remove unused variable in btrfs_{start,write}_dirty_block_groups()
    ed0e951463ea btrfs: remove no longer used counter when reading data page
    6308ab54c8ec btrfs: remove unused parameter nr_pages in add_ra_bio_pages()
    ff810f85ed3f ACPI: processor: idle: fix lockup regression on 32-bit ThinkPad T40
    7cad1c40ef91 ACPI: processor idle: Allow playing dead in C3 state
    631473adaaef ACPI: processor idle: Check for architectural support for LPI
    5b13295ac584 cpuidle: PSCI: Move the `has_lpi` check to the beginning of the function
    9873fe0f3857 hamradio: remove needs_free_netdev to avoid UAF
    c799c18a287e hamradio: defer 6pack kfree after unregister_netdev
    8e663865f528 drm/amd/display: Fix p-state allow debug index on dcn31
    685a19fa6ae9 drm/amd/display: Add pstate verification and recovery for DCN31
    1b86fc15ba6d Linux 5.15.34
    c9ea4fb1f3f3 stacktrace: move filter_irq_stacks() to kernel/stacktrace.c
    fddb88bd266f powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit
    68cea1e243b8 static_call: Don't make __static_call_return0 static
    429f413ed83f mm/sparsemem: fix 'mem_section' will never be NULL gcc 12 warning
    8fe51495efff irqchip/gic, gic-v3: Prevent GSI to SGI translations
    69943af22a32 powerpc/64: Fix build failure with allyesconfig in book3s_64_entry.S
    7b5d60323f90 irqchip/gic-v4: Wait for GICR_VPENDBASER.Dirty to clear before descheduling
    f4f8b6d8490e x86,static_call: Fix __static_call_return0 for i386
    ff6505766565 sched: Teach the forced-newidle balancer about CPU affinity limitation.
    f399f38eda57 x86/bug: Prevent shadowing in __WARN_FLAGS
    469eed08becd Drivers: hv: vmbus: Replace smp_store_mb() with virt_store_mb()
    f5e59185b033 mm: don't skip swap entry even if zap_details specified
    4693fce5a5d4 selftests: cgroup: Test open-time cgroup namespace usage for migration checks
    47802775bc11 selftests: cgroup: Test open-time credential usage for migration checks
    e326f218de1f selftests: cgroup: Make cg_create() use 0755 for permission instead of 0644
    33db9912ff7c ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
    f1607e13ed71 Revert "net/mlx5: Accept devlink user input after driver initialization complete"
    226b4327ef5c KVM: avoid NULL pointer dereference in kvm_dirty_ring_push
    104bfa23a001 dmaengine: Revert "dmaengine: shdma: Fix runtime PM imbalance on error"
    3c3a8e56553e tools build: Use $(shell ) instead of `` to get embedded libperl's ccopts
    fbe722d48b8e tools build: Filter out options and warnings not supported by clang
    9b2b01e36741 perf python: Fix probing for some clang command line options
    03044b841406 perf build: Don't use -ffat-lto-objects in the python feature test when building with clang-13
    3b14aa053181 Revert "nbd: fix possible overflow on 'first_minor' in nbd_dev_add()"
    5d69622eb036 SUNRPC: Don't call connect() more than once on a TCP socket
    22174e8ce8ac rtc: mc146818-lib: fix signedness bug in mc146818_get_time()
    9e46f7319549 selftests/bpf: Fix u8 narrow load checks for bpf_sk_lookup remote_port
    0c64645e6373 bpf: Make remote_port field in struct bpf_sk_lookup 16-bit wide
    e2ff1d653069 Revert "selftests: net: Add tls config dependency for tls selftests"
    7f48521172fb net/smc: send directly on setting TCP_NODELAY
    20633216ded0 KVM: SVM: Allow AVIC support on system w/ physical APIC ID > 255
    b536cf3eb6f9 drm/amdgpu: don't use BACO for reset in S3
    3c8902bbf2ab drm/amdkfd: Create file descriptor after client is added to smi_clients list
    588393cdae7f drm/nouveau/pmu: Add missing callbacks for Tegra devices
    6a5d209898a6 drm/amdgpu/vcn: Fix the register setting for vcn1
    155338be5d90 drm/amdgpu/smu10: fix SoC/fclk units in auto mode
    0115e4f2f6bc drm/amdgpu/display: change pipe policy for DCN 2.1
    28dc1503a9d3 drm/panel: ili9341: fix optional regulator handling
    b911702a0105 SUNRPC: Prevent immediate close+reconnect
    a551e6629247 amd/display: set backlight only if required
    2388f826cdc9 fbdev: Fix unregistering of framebuffers without device
    7218a789abb3 irqchip/gic-v3: Fix GICR_CTLR.RWP polling
    fcf9ccf9d26a perf/core: Inherit event_caps
    0309f053ce47 perf: qcom_l2_pmu: fix an incorrect NULL check on list iterator
    8a05a6952ecd ata: sata_dwc_460ex: Fix crash due to OOB write
    136c21ce8e01 perf/x86/intel: Don't extend the pseudo-encoding to GP counters
    983a759640bf x86/mm/tlb: Revert retpoline avoidance approach
    2f67341e5bce x86/msi: Fix msi message data shadow struct
    0912cf021fb5 gpio: Restrict usage of GPIO chip irq members before initialization
    9ca11bd8222a RDMA/hfi1: Fix use-after-free bug for mm struct
    fa7cc2df9505 arm64: patch_text: Fixup last cpu should be master
    90012c6748d3 spi: core: add dma_map_dev for __spi_unmap_msg()
    887366faf0c9 btrfs: prevent subvol with swapfile from being deleted
    4b98799e181b btrfs: fix qgroup reserve overflow the qgroup limit
    56c88810466b perf/x86/intel: Update the FRONTEND MSR mask on Sapphire Rapids
    fab4b79e869a x86/speculation: Restore speculation related MSRs during S3 resume
    fcf185f7e03e x86/pm: Save the MSR validity status at context setup
    ba7261af2b03 io_uring: fix race between timeout flush and removal
    fe223dd2f18b io_uring: implement compat handling for IORING_REGISTER_IOWQ_AFF
    ae6cba337cbf io_uring: defer splice/tee file validity check until command issue
    056e1e7c1713 io_uring: don't check req->file in io_fsync_prep()
    198932a14aeb mm/mempolicy: fix mpol_new leak in shared_policy_replace
    a04cb99c5d46 mmmremap.c: avoid pointless invalidate_range_start/end on mremap(old_size=0)
    c21d040de622 highmem: fix checks in __kmap_local_sched_{in,out}
    9fb8bc6cfc58 lz4: fix LZ4_decompress_safe_partial read out of bound
    75cae557bc44 mmc: core: Fixup support for writeback-cache for eMMC and SD
    5d2712b78056 mmc: renesas_sdhi: don't overwrite TAP settings when HS400 tuning is complete
    11497ecbda04 mmc: mmci: stm32: correctly check all elements of sg list
    1515d2a466bf mmc: block: Check for errors after write on SPI
    86b5d155fced Revert "mmc: sdhci-xenon: fix annoying 1.8V regulator warning"
    dc5e603c247d scsi: ufs: ufs-pci: Add support for Intel MTL
    25c1353dca74 scsi: mpt3sas: Fix use after free in _scsih_expander_node_remove()
    32dd8b63e633 arm64: Add part number for Arm Cortex-A78AE
    159c7db3ccbb perf session: Remap buf if there is no space for event
    58aece34fb7f perf tools: Fix perf's libperf_print callback
    e1f2750e7531 perf: arm-spe: Fix perf report --mem-mode
    47e239117bd9 iommu/omap: Fix regression in probe for NULL pointer dereference
    3fd9be3ec5c8 SUNRPC: svc_tcp_sendmsg() should handle errors from xdr_alloc_bvec()
    3b32dda29f99 SUNRPC: Handle low memory situations in call_status()
    03ac680dacf9 SUNRPC: Handle ENOMEM in call_transmit_status()
    285f5d724005 io_uring: don't touch scm_fp_list after queueing skb
    50c981bd7790 io_uring: nospec index for tags on files update
    685f42de443d scsi: ufs: ufshpb: Fix a NULL check on list iterator
    a972c7687233 drbd: Fix five use after free bugs in get_initial_state
    1816af613e56 bpf: Support dual-stack sockets in bpf_tcp_check_syncookie
    88a3bdcb462a spi: bcm-qspi: fix MSPI only access with bcm_qspi_exec_mem_op()
    c9bdce2359b5 qede: confirm skb is allocated before using
    fb45e80b2194 net: phy: mscc-miim: reject clause 45 register accesses
    8ba8e1398a66 net: sfc: fix using uninitialized xdp tx_queue
    571d8e1d154c rxrpc: fix a race in rxrpc_exit_net()
    837b96d81039 net: openvswitch: fix leak of nested actions
    42b2e418f9a2 net: ethernet: mv643xx: Fix over zealous checking of_get_mac_address()
    085d002432ac net: openvswitch: don't send internal clone attribute to the userspace.
    70cf0b820e55 ice: xsk: fix VSI state check in ice_xsk_wakeup()
    840cbbdc8bf1 ice: synchronize_rcu() when terminating rings
    070aa68f8fab ipv6: Fix stats accounting in ip6_pkt_drop
    1c0763475401 ice: Do not skip not enabled queues in ice_vc_dis_qs_msg
    5d3e9f71c310 ice: Set txq_teid to ICE_INVAL_TEID on ring creation
    599874bbc4ed dpaa2-ptp: Fix refcount leak in dpaa2_ptp_probe
    2cb2b3fb20a2 sctp: count singleton chunks in assoc user stats
    92f1947c0d26 IB/rdmavt: add lock to call to rvt_error_qp to prevent a race condition
    3b5fd693621b IB/cm: Cancel mad on the DREQ event when the state is MRA_REP_RCVD
    34b8ba1cb337 RDMA/mlx5: Add a missing update of cache->last_add
    5b88519b78e8 RDMA/mlx5: Don't remove cache MRs when a delay is needed
    d1c87d36a655 sfc: Do not free an empty page_ring
    917eeb220023 bnxt_en: Prevent XDP redirect from running when stopping TX queue
    154fc224e65e bnxt_en: reserve space inside receive page for skb_shared_info
    6108a8918fd7 bnxt_en: Synchronize tx when xdp redirects happen on same ring
    87f5d66daa5f arch/arm64: Fix topology initialization for core scheduling
    cb713eb793e6 regulator: atc260x: Fix missing active_discharge_on setting
    336942b1682f regulator: rtq2134: Fix missing active_discharge_on setting
    2560fe298e6e drm/imx: dw_hdmi-imx: Fix bailout in error cases of probe
    31e449302ed0 drm/imx: Fix memory leak in imx_pd_connector_get_modes
    c1e96348dbeb drm/imx: imx-ldb: Check for null pointer after calling kmemdup
    47fec6139b5e net: stmmac: Fix unset max_speed difference between DT and non-DT platforms
    907c97986d6f net: ipv4: fix route with nexthop object delete warning
    71d28e5073b8 mctp: Fix check for dev_hard_header() result
    40229b2977f1 ice: Clear default forwarding VSI during VSI release
    ba965e8605ae skbuff: fix coalescing for page_pool fragment recycling
    13bcc6f8efcd vrf: fix packet sniffing for traffic originating from ip tunnels
    6e2f1b033b17 net/tls: fix slab-out-of-bounds bug in decrypt_internal
    ed7a824fda87 net: sfc: add missing xdp queue reinitialization
    69ec350a417d vdpa: mlx5: prevent cvq work from hogging CPU
    893c70f8b8f3 vdpa/mlx5: Propagate link status from device to vdpa driver
    dc872b72d180 vdpa/mlx5: Rename control VQ workqueue to vdpa wq
    aefd755a9605 scsi: zorro7xx: Fix a resource leak in zorro7xx_remove_one()
    cd483e17eca2 scsi: core: Fix sbitmap depth in scsi_realloc_sdev_budget_map()
    0610371c768c scsi: sr: Fix typo in CDROM(CLOSETRAY|EJECT) handling
    6f52d4cda0bf NFSv4: fix open failure with O_ACCMODE flag
    9f0c217469e8 Revert "NFSv4: Handle the special Linux file open access mode"
    dcd6b1a624c0 Drivers: hv: vmbus: Fix potential crash on module unload
    5ba9d78a7294 drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()
    985d87e6a365 rtc: mc146818-lib: fix RTC presence check
    be6c3152d6f6 rtc: Check return value from mc146818_get_time()
    8c6921075222 rtc: mc146818-lib: change return values of mc146818_get_time()
    c9f50e06ca76 mm: fix race between MADV_FREE reclaim and blkdev direct IO read
    93a8347f72c0 parisc: Fix patch code locking and flushing
    f77f482ec31a parisc: Fix CPU affinity for Lasi, WAX and Dino chips
    30dd4af48a9e selftests: net: Add tls config dependency for tls selftests
    ea029e4ce760 NFS: Avoid writeback threads getting stuck in mempool_alloc()
    da747de68599 NFS: nfsiod should not block forever in mempool_alloc()
    e04ef859d6c6 SUNRPC: Fix socket waits for write buffer space
    d925b7e78b62 jfs: prevent NULL deref in diFree
    44c2d5fbe7b2 virtio_console: eliminate anonymous module_init & module_exit
    053bbff873a1 serial: samsung_tty: do not unlock port->lock for uart_write_wakeup()
    c393a9f4cb3b x86/Kconfig: Do not allow CONFIG_X86_X32_ABI=y with llvm-objcopy
    e3c961c56ad5 x86: Annotate call_on_stack()
    6bb2270223a8 NFS: swap-out must always use STABLE writes.
    24d28d9b0fd5 NFS: swap IO handling is slightly different for O_DIRECT IO
    a55386405094 SUNRPC: remove scheduling boost for "SWAPPER" tasks.
    20700aa01bc2 SUNRPC/xprt: async tasks mustn't block waiting for memory
    a19fd1d61797 SUNRPC/call_alloc: async tasks mustn't block waiting for memory
    b07387c476a3 clk: Enforce that disjoints limits are invalid
    15bfec9d8030 clk: ti: Preserve node in ti_dt_clocks_register()
    5c0750cad733 xen: delay xen_hvm_init_time_ops() if kdump is boot on vcpu>=32
    12e49aefda2e habanalabs: fix possible memory leak in MMU DR fini
    a34752aa2397 NFSv4: Protect the state recovery thread against direct reclaim
    b37f482ba9f0 NFSv4.2: fix reference count leaks in _nfs42_proc_copy_notify()
    24acdd5f9c91 w1: w1_therm: fixes w1_seq for ds28ea00 sensors
    86efcb524ae1 staging: wfx: fix an error handling in wfx_init_common()
    7295544bcf56 opp: Expose of-node's name in debugfs
    ea1f29584136 cpufreq: CPPC: Fix performance/frequency conversion
    26f0a9e3d04d clk: rockchip: drop CLK_SET_RATE_PARENT from dclk_vop* on rk3568
    caffa76ded5a phy: amlogic: meson8b-usb2: fix shared reset control use
    ab27675a0fcc phy: amlogic: meson8b-usb2: Use dev_err_probe()
    35df38c4be0c phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
    42f2142a337e staging: vchiq_core: handle NULL result of find_service_by_handle
    176df12b38c7 staging: vchiq_arm: Avoid NULL ptr deref in vchiq_dump_platform_instances
    161863aec0e1 clk: si5341: fix reported clk_rate when output divider is 2
    31e027259ce4 minix: fix bug when opening a file with O_DIRECT
    4602b7a8ee0d init/main.c: return 1 from handled __setup() functions
    9d849449d28f lib/Kconfig.debug: add ARCH dependency for FUNCTION_ALIGN option
    2fe82d325402 ceph: fix memory leak in ceph_readdir when note_last_dentry returns error
    3ae7163598c6 ceph: fix inode reference leakage in ceph_get_snapdir()
    eb0e7173d9cb netlabel: fix out-of-bounds memory accesses
    58d52743ae85 netfilter: conntrack: revisit gc autotuning
    d404765dffdb Bluetooth: Fix use after free in hci_send_acl
    f249bbf3cb9a MIPS: ingenic: correct unit node address
    11ba1aa21280 xtensa: fix DTC warning unit_address_format
    13946d5a68ef mt76: fix monitor mode crash with sdio driver
    ac27808b82db usb: dwc3: omap: fix "unbalanced disables for smps10_out1" on omap5evm
    0616792164d3 net: sfp: add 2500base-X quirk for Lantech SFP module
    459e56859f7a net/mlx5e: Remove overzealous validations in netlink EEPROM query
    1c4561d9b5cb net: limit altnames to 64k total
    601f748029f3 net: account alternate interface name memory
    d804db3dafd1 riscv: Fixed misaligned memory access. Fixed pointer comparison.
    6ca71078a91e can: etas_es58x: es58x_fd_rx_event_msg(): initialize rx_event_msg before calling es58x_check_msg_len()
    db9a140a8585 can: isotp: set default value for N_As to 50 micro seconds
    f581df412bc4 scsi: libfc: Fix use after free in fc_exch_abts_resp()
    2a71e3ecd829 powerpc/secvar: fix refcount leak in format_show()
    5c80ff21c5db powerpc/64e: Tie PPC_BOOK3E_64 to PPC_FSL_BOOK3E
    9b85e31309c2 MIPS: fix fortify panic when copying asm exception handlers
    dc9d33b2d8d0 PCI: endpoint: Fix misused goto label
    b6d4b322da46 bnxt_en: Eliminate unintended link toggle during FW reset
    42b6a39f439b Bluetooth: use memset avoid memory leaks
    0000de40b9f3 Bluetooth: Fix not checking for valid hdev on bt_dev_{info,warn,err,dbg}
    bb78c3b11f4d tuntap: add sanity checks about msg_controllen in sendmsg
    e8d8f1d091e4 macvtap: advertise link netns via netlink
    5fb47ca34908 mips: ralink: fix a refcount leak in ill_acc_of_setup()
    58758110912d net/smc: correct settings of RMB window update limit
    dd111d335cab scsi: hisi_sas: Limit users changing debugfs BIST count value
    f05a0d8de2ea scsi: hisi_sas: Free irq vectors in order for v3 HW
    b8fa10d7c8fc scsi: aha152x: Fix aha152x_setup() __setup handler return value
    556ec5030e57 mt76: mt7615: Fix assigning negative values to unsigned variable
    c3543bac6efa powerpc/64s/hash: Make hash faults work in NMI context
    df467929a040 mt76: mt7915: fix injected MPDU transmission to not use HW A-MSDU
    e5ecdb01952f scsi: pm8001: Fix memory leak in pm8001_chip_fw_flash_update_req()
    43c617eefab7 scsi: pm8001: Fix tag leaks on error
    2290dcad6f65 scsi: pm8001: Fix task leak in pm8001_send_abort_all()
    ece79aaec8fc scsi: pm8001: Fix pm8001_mpi_task_abort_resp()
    5e4ac14baebb scsi: pm8001: Fix pm80xx_pci_mem_copy() interface
    5e96bb81eddf vfio/pci: Stub vfio_pci_vga_rw when !CONFIG_VFIO_PCI_VGA
    f325d3e1dcc8 drm/amdkfd: make CRAT table missing message informational only
    da52e8b9dad6 dm: requeue IO if mapping table not yet available
    02cc46f397eb dm ioctl: prevent potential spectre v1 gadget
    049072749a5e ipv4: Invalidate neighbour for broadcast address upon address addition
    e45d1d19a0bb drm/msm/dsi: Remove spurious IRQF_ONESHOT flag
    e1b5aae5b6b0 iwlwifi: mvm: move only to an enabled channel
    6f215801c302 iwlwifi: mvm: Correctly set fragmented EBS
    d353d3b27af4 usb: dwc3: pci: Set the swnode from inside dwc3_pci_quirks()
    c64f3707cdf9 net/mlx5e: Disable TX queues before registering the netdev
    83efc05c8579 power: supply: axp288-charger: Set Vhold to 4.4V
    6def4eaf0391 powerpc/set_memory: Avoid spinlock recursion in change_page_attr()
    5d76a88b8536 scsi: mpi3mr: Fix memory leaks
    248ead78f346 scsi: mpi3mr: Fix reporting of actual data transfer size
    53643a112dd6 PCI: pciehp: Add Qualcomm quirk for Command Completed erratum
    aa9c9fd0ef9d tcp: Don't acquire inet_listen_hashbucket::lock with disabled BH.
    bd21b9607bd7 PCI: endpoint: Fix alignment fault error in copy tests
    2aa10e2fa2ab usb: ehci: add pci device support for Aspeed platforms
    99073052f45b iommu/arm-smmu-v3: fix event handling soft lockup
    60eabd66d17f PCI: aardvark: Fix support for MSI interrupts
    330c4e1b4ec4 scsi: smartpqi: Fix kdump issue when controller is locked up
    0a922366d6d9 drm/amdgpu: Fix recursive locking warning
    06ee48a4fc25 powerpc: Set crashkernel offset to mid of RMA region
    9c1ace066f22 net: initialize init_net earlier
    4790998fdd0d ipv6: make mc_forwarding atomic
    e9da1df2c021 libbpf: Fix build issue with llvm-readelf
    19d067c10b71 cfg80211: don't add non transmitted BSS to 6GHz scanned channels
    55c93a89e31d mt76: dma: initialize skip_unmap in mt76_dma_rx_fill
    38fbe8066450 mt76: mt7921: fix crash when startup fails.
    793a37045893 power: supply: axp20x_battery: properly report current when discharging
    a0f8220ce934 drm/v3d: fix missing unlock
    0f8ec114029a scsi: bfa: Replace snprintf() with sysfs_emit()
    1378075fa5bc scsi: mvsas: Replace snprintf() with sysfs_emit()
    1c6ffdf4cc45 bpf: Make dst_port field in struct bpf_sock 16-bit wide
    ff13c90d7f7a drm/bridge: Add missing pm_runtime_put_sync
    35380262304f net/smc: Send directly when TCP_CORK is cleared
    20d01a11efde ath11k: mhi: use mhi_sync_power_up()
    fed4cef115ab ath11k: pci: fix crash on suspend if board file is not found
    c4b7653af62a ath11k: fix kernel panic during unload/load ath11k modules
    910ee99d47d3 powerpc: dts: t104xrdb: fix phy type for FMAN 4/5
    e84b0438010d drm/amdkfd: Don't take process mutex for svm ioctls
    1eb598045326 ptp: replace snprintf with sysfs_emit
    052fb1c9ddfb usb: cdnsp: fix cdnsp_decode_trb function to properly handle ret value
    c27576bbbe77 usb: gadget: tegra-xudc: Fix control endpoint's definitions
    111a63235001 usb: gadget: tegra-xudc: Do not program SPARAM
    6040c99cb1a1 drm/amd/display: Use PSR version selected during set_psr_caps
    7e10369c72db drm/amd/display: Fix memory leak
    3edd8646cb7c drm/amd/amdgpu/amdgpu_cs: fix refcount leak of a dma_fence obj
    c4b64a80554e drm/amd/display: Add signal type check when verify stream backends same
    be2f81024e79 ath5k: fix OOB in ath5k_eeprom_read_pcal_info_5111
    b3ca02c1ee93 drm: Add orientation quirk for GPD Win Max
    d5f6f44e04c3 KVM: x86/emulator: Emulate RDPID only if it is enabled in guest
    a997e0f5aa55 KVM: x86/pmu: Fix and isolate TSX-specific performance event logic
    e7bab9898249 KVM: x86/svm: Clear reserved bits written to PerfEvtSeln MSRs
    5483640f8efb KVM: SVM: Fix kvm_cache_regs.h inclusions for is_guest_mode()
    a82fe0ba1c52 KVM: x86/pmu: Use different raw event masks for AMD and Intel
    105b50d9bb82 kfence: limit currently covered allocations when pool nearly full
    44b44b64b4da kfence: move saving stack trace of allocations into __kfence_alloc()
    72d2d94a981d kfence: count unexpectedly skipped allocations
    5142720dbe51 nbd: fix possible overflow on 'first_minor' in nbd_dev_add()
    64742cf82dec nbd: Fix hungtask when nbd_config_put
    694b5a32c162 nbd: Fix incorrect error handle when first_minor is illegal in nbd_dev_add
    3e526e9ae0e4 nbd: add error handling support for add_disk()
    f8008f42d463 rtc: wm8350: Handle error for wm8350_register_irq
    b257272f5483 um: fix and optimize xor select template for CONFIG64 and timetravel mode
    2be1a7f09635 lib/logic_iomem: correct fallback config references

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39e9635c34b773f671870dec4c1953daef576b16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 9910ea023c..f503df6404 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a5e556295fd7c0ec6095e12c0960d4313587e2e0"
-SRCREV_meta ?= "cb8938bc9d6b4575a1cd0072106b9720648ed0ab"
+SRCREV_machine ?= "5a5ffe1f47ec90c9778697a0b8dcc3145859fe61"
+SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.33"
+LINUX_VERSION ?= "5.15.35"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 96f09f3839..9a80353ee2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.33"
+LINUX_VERSION ?= "5.15.35"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "57d9f612e60a3b73774df1046dc3e3f7c17fbf49"
-SRCREV_meta ?= "cb8938bc9d6b4575a1cd0072106b9720648ed0ab"
+SRCREV_machine ?= "c1ea4d56b597a4740b655e3535157fd3248b6dde"
+SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 22b4a790fd..fbb953f559 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2c5f632df378c23226fdb89fe36ad83c05d8da01"
-SRCREV_machine:qemuarm64 ?= "4a6d3cff7783b6d6f0c8c09de3158cffe8fa97af"
-SRCREV_machine:qemumips ?= "b8cca873d9d28cb48884ce4aa69983fe36867309"
-SRCREV_machine:qemuppc ?= "b0a8af64b0b46184583f8eb05a3c7b038d5484bf"
-SRCREV_machine:qemuriscv64 ?= "07a63f760793c64abe99674f067ae0643fdd2314"
-SRCREV_machine:qemuriscv32 ?= "07a63f760793c64abe99674f067ae0643fdd2314"
-SRCREV_machine:qemux86 ?= "07a63f760793c64abe99674f067ae0643fdd2314"
-SRCREV_machine:qemux86-64 ?= "07a63f760793c64abe99674f067ae0643fdd2314"
-SRCREV_machine:qemumips64 ?= "6456900204c039e30e383eebb27b97cffacf420a"
-SRCREV_machine ?= "07a63f760793c64abe99674f067ae0643fdd2314"
-SRCREV_meta ?= "cb8938bc9d6b4575a1cd0072106b9720648ed0ab"
+SRCREV_machine:qemuarm ?= "3954bbe99f0b517dafa413d88609d0c6f28e9790"
+SRCREV_machine:qemuarm64 ?= "e0f74df7acce2888931dbd6800b1503244155879"
+SRCREV_machine:qemumips ?= "8b632ac1df6b6f9dd61bce1479f6b48847326bee"
+SRCREV_machine:qemuppc ?= "ff7d30e3eabd702f870e10be7411d8dadb7bfdf8"
+SRCREV_machine:qemuriscv64 ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
+SRCREV_machine:qemuriscv32 ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
+SRCREV_machine:qemux86 ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
+SRCREV_machine:qemux86-64 ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
+SRCREV_machine:qemumips64 ?= "5a1907849e651536a7eef3e1d5bc1a51f5cebb7a"
+SRCREV_machine ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
+SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "06f50ca83ace219cb72213369d2be05bb0dd337e"
+SRCREV_machine:class-devupstream ?= "81d8d30c35edf29c5c70186ccb14dac4a5ca38a8"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.33"
+LINUX_VERSION ?= "5.15.35"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


