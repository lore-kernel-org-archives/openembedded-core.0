Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F426CA0FE9
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:23 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.23004.1693924642258645361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ug+vFCwS;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76ef8b91a72so154044485a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924641; x=1694529441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF9cBaEcCwSTFRtoJMJyp5eRJ4xUmZeL9Kq+xmE4mTk=;
        b=Ug+vFCwSFnMBXTu2iXlVYYnyLzHPslTheugl9GHEavTHsPcSIkoLK+QBJh/AwYli9n
         JBmPcj8nQWtKcfqQdMKqXVwxOnl9HHWkfITkxQMh3GDRfKPiFlYYf556eB7rk0t2tN5W
         K6RGRuqnWIlFnwSXC5//jMrmObtouYV2o0kaUQRFqraK3mKxzAJ4LKpqitAX9fmnw6KN
         QKeBBTuOJzHNMcs7oGzscqwF4mtGXKY11i5wgBmR13YJKfrNKGl8Qx+eIwuNbr9Lp6OJ
         UUCfraDkrxnill/9JEEFDHahYA5JcAMA/u1qSFR0uLf6/+16BLRpLii6HZVlWsGxcnz8
         ZfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924641; x=1694529441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF9cBaEcCwSTFRtoJMJyp5eRJ4xUmZeL9Kq+xmE4mTk=;
        b=IfgMn7sln4icfX5LIh3tWdd1RnRferQC+7jP9Kj+t+/kpWJTmgbKyONq24cM7MYNPU
         Ax2io7HLIaxllhhrWc/V/iOwk1SK2El2+8zBCPtZP2256acLwhOPSJpelggB/T8NFk5a
         fzoX+HkvIE/EW1zASOa4EIfNXR7OkNOjqlCanhiN//Ak9q4iyKCSDG42l6Pw5J87wj7k
         Y4lZY8RDedv3myZ9lGj5rFDpfvRM3gPUcQKk97KaxOdpSP2Zt7IgEOvgfCQZDlpy7Hk4
         aFn25dJv5HXG9hIQk8Q/76rqukd4xSjRhyu4tPyBAyoPN+AozMJukNmuqMeWu4J7rcMo
         ZmoQ==
X-Gm-Message-State: AOJu0Yy/8EI+91AiUsMCC/XBYqCDhxgZ2LZVF/GuivrgTkHN1vhM1P+9
	I9ZHHjxT82VNK37daTV7xEF+ANAHukx4Mw==
X-Google-Smtp-Source: AGHT+IGvR7vfeMhjulPag0zdx3BmqmNAL54A8GnTcAA9MWZDBQSJspTkKprOb11Sx9sOCWIbN179Fg==
X-Received: by 2002:a05:620a:2410:b0:767:2e61:ca9c with SMTP id d16-20020a05620a241000b007672e61ca9cmr16801979qkn.57.1693924641213;
        Tue, 05 Sep 2023 07:37:21 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/6.4: update to v6.4.13
Date: Tue,  5 Sep 2023 10:37:11 -0400
Message-Id: <f64c151f8489c35a65e53a9c6b0bef718ce179c5.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187221

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    388f6d150784 Linux 6.4.13
    734cf5795f4b netfilter: nf_tables: fix kdoc warnings after gc rework
    ae2d1461ebcc TIOCSTI: Document CAP_SYS_ADMIN behaviour in Kconfig
    259ff81cee3c ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
    d641fa9fc8fc maple_tree: disable mas_wr_append() when other readers are possible
    163d62238efc ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ
    45bb78bc2f57 gpio: sim: pass the GPIO device's software node to irq domain
    14540aa3eaba gpio: sim: dispose of irq mappings before destroying the irq_sim domain
    c6e1fcd50cbc dma-buf/sw_sync: Avoid recursive lock during fence signal
    8c776cd8f1db pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}
    3efa0b7fc28d pinctrl: renesas: rzv2m: Fix NULL pointer dereference in rzv2m_dt_subnode_to_map()
    a1f12138b17d pinctrl: renesas: rzg2l: Fix NULL pointer dereference in rzg2l_dt_subnode_to_map()
    66bb9745f96e ASoC: cs35l56: Read firmware uuid from a device property instead of _SUB
    5e9db7d4d3bc ASoC: SOF: ipc4-pcm: fix possible null pointer deference
    dd07e9de2d82 clk: Fix undefined reference to `clk_rate_exclusive_{get,put}'
    686c9e8221f8 scsi: core: raid_class: Remove raid_component_add()
    2684b97b01eb scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW major version > 5
    43dc0a70ed1e scsi: snic: Fix double free in snic_tgt_create()
    54fce635ee7f madvise:madvise_free_pte_range(): don't use mapcount() against large folio for sharing check
    63f230177510 madvise:madvise_cold_or_pageout_pte_range(): don't use mapcount() against large folio for sharing check
    26a2b7cec0dd drm/i915: Fix error handling if driver creation fails during probe
    0a47ffcac3c5 can: raw: add missing refcount for memory leak fix
    06614ca4f18e thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
    efe4d998330a PCI: acpiphp: Use pci_assign_unassigned_bridge_resources() only for non-root bus
    f80b4b818e5e media: vcodec: Fix potential array out-of-bounds in encoder queue_setup
    423e75565761 pinctrl: amd: Mask wake bits on probe again
    ce2e8904a817 of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
    d92815c542d7 of: unittest: Fix EXPECT for parse_phandle_with_args_map() test
    fa700d9cda9a radix tree: remove unused variable
    8f6813c62d2f riscv: Fix build errors using binutils2.37 toolchains
    1b7ac88ef2e4 riscv: Handle zicsr/zifencei issue between gcc and binutils
    5039e4afc050 lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
    d64a94bc6ef7 ACPI: resource: Fix IRQ override quirk for PCSpecialist Elimina Pro 16 M
    4cb9ace298f3 batman-adv: Hold rtnl lock during MTU update via netlink
    55d18e4b2bfe batman-adv: Fix batadv_v_ogm_aggr_send memory leak
    e265dca9ba59 batman-adv: Fix TT global entry leak when client roamed back
    5effaa05704a batman-adv: Do not get eth header before batadv_check_management_packet
    1f82cd26c650 batman-adv: Don't increase MTU when set by user
    2c783344218d batman-adv: Trigger events for auto adjusted MTU
    21cd99431aae selinux: set next pointer before attaching to list
    14fa028a2e63 nfsd: Fix race to FREE_STATEID and cl_revoked
    a3a91119964d NFS: Fix a use after free in nfs_direct_join_group()
    c8df36eedb65 nilfs2: fix general protection fault in nilfs_lookup_dirty_data_buffers()
    bca3e63be00e mm: multi-gen LRU: don't spin during memcg release
    56d11051190d mm: memory-failure: fix unexpected return value in soft_offline_page()
    22178c6e6c2d mm: add a call to flush_cache_vmap() in vmap_pfn()
    0677bed47996 cgroup/cpuset: Free DL BW in case can_attach() fails
    d1cfa53e5e4e sched/deadline: Create DL BW alloc, free & check overflow interface
    c95a751498c9 cgroup/cpuset: Iterate only if DEADLINE tasks are present
    74fac5bb0d37 sched/cpuset: Keep track of SCHED_DEADLINE task in cpusets
    00f3719c85bf sched/cpuset: Bring back cpuset_mutex
    4d17b2ea4ee6 cgroup/cpuset: Rename functions dealing with DEADLINE accounting
    aefabccb1334 drm/i915: fix display probe for IVB Q and IVB D GT2 server
    6621912f4221 drm/i915/display: Handle GMD_ID identification in display code
    517771333fd4 x86/fpu: Set X86_FEATURE_OSXSAVE feature after enabling OSXSAVE in CR4
    4b04c422ea8d x86/fpu: Invalidate FPU state correctly on exec()
    0c2a9b7ba1b8 LoongArch: Fix hw_breakpoint_control() for watchpoints
    8771f80bafa3 drm/i915: Fix HPD polling, reenabling the output poll work as needed
    40b67b55337a drm/display/dp: Fix the DP DSC Receiver cap size
    503d787d303e drm/i915/dgfx: Enable d3cold at s2idle
    dd8683e0af50 drm/panfrost: Skip speed binning on EOPNOTSUPP
    933f1fc826a5 drm: Add an HPD poll helper to reschedule the poll work
    6969e4500d86 drm/vmwgfx: Fix possible invalid drm gem put calls
    5574b0cbb493 drm/vmwgfx: Fix shader stage validation
    980cde3ac4bb mm/gup: handle cont-PTE hugetlb pages correctly in gup_must_unshare() via GUP-fast
    2106dae0f19d mm/gup: reintroduce FOLL_NUMA as FOLL_HONOR_NUMA_FAULT
    a55dd240a9f1 mm: enable page walking API to lock vmas during the walk
    2dcc0e4b3c1c selftests/mm: FOLL_LONGTERM need to be updated to 0x100
    c02c4e76ccb9 ALSA: ymfpci: Fix the missing snd_card_free() call at probe error
    6218f967d579 shmem: fix smaps BUG sleeping while atomic
    535cdce0713e mm,ima,kexec,of: use memblock_free_late from ima_free_kexec_buffer
    c856ff4acd94 clk: Fix slab-out-of-bounds error in devm_clk_release()
    ed2e9e10a130 NFSv4: Fix dropped lock for racing OPEN and delegation return
    ed29b5fbf07f platform/x86: ideapad-laptop: Add support for new hotkeys found on ThinkBook 14s Yoga ITL
    3bdeb65ca9c8 platform/x86: lenovo-ymc: Add Lenovo Yoga 7 14ACN6 to ec_trigger_quirk_dmi_table
    28eee9b4e819 wifi: mac80211: limit reorder_buf_filtered to avoid UBSAN warning
    a3009e19f09b ibmveth: Use dcbf rather than dcbfl
    06a128cbe40e spi: spi-cadence: Fix data corruption issues in slave mode
    28b605e939b3 ASoC: cs35l41: Correct amp_gain_tlv values
    8c7fd1baeed0 ASoC: amd: yc: Add VivoBook Pro 15 to quirks list for acp6x
    1cc2d9685043 bonding: fix macvlan over alb bond support
    abdf60d759f7 rtnetlink: Reject negative ifindexes in RTM_NEWLINK
    beceaf2e5e33 netfilter: nf_tables: defer gc run if previous batch is still pending
    16cc42cc00fb netfilter: nf_tables: fix out of memory error handling
    e05b2a9f03b3 netfilter: nf_tables: use correct lock to protect gc_list
    e07e68823116 netfilter: nf_tables: GC transaction race with abort path
    4167aa477abc netfilter: nf_tables: flush pending destroy work before netlink notifier
    e290509f8be5 netfilter: nf_tables: validate all pending tables
    711ffb6fa5a0 i40e: fix potential NULL pointer dereferencing of pf->vf i40e_sync_vsi_filters()
    7ac409385e1c net/sched: fix a qdisc modification with ambiguous command request
    0717a95ba5ca igc: Fix the typo in the PTM Control macro
    8fe9d54f7ad4 igb: Avoid starting unnecessary workqueues
    ecebc0841362 can: isotp: fix support for transmission of SF without flow control
    65009906dff2 net: ethernet: mtk_eth_soc: fix NULL pointer on hw reset
    d56f8304bcc4 tg3: Use slab_build_skb() when needed
    be7d58c9a203 selftests: bonding: do not set port down before adding to bond
    b995365bbdd8 ice: Fix NULL pointer deref during VF reset
    929892877620 Revert "ice: Fix ice VF reset during iavf initialization"
    8aa038c25042 ice: fix receive buffer size miscalculation
    abee4c8eb778 ipv4: fix data-races around inet->inet_id
    3844e0c55977 net: validate veth and vxcan peer ifindexes
    691799211bf1 net: bcmgenet: Fix return value check for fixed_phy_register()
    d3a74a85fbb4 net: bgmac: Fix return value check for fixed_phy_register()
    a7cecd332c9e net: mdio: mdio-bitbang: Fix C45 read/write protocol
    7e7b2b50dcd9 net: dsa: mt7530: fix handling of 802.1X PAE frames
    b457f312e78e selftests: mlxsw: Fix test failure on Spectrum-4
    747e71ff06bf mlxsw: Fix the size of 'VIRT_ROUTER_MSB'
    5a76c5256501 mlxsw: reg: Fix SSPR register layout
    40ffbae5312a mlxsw: pci: Set time stamp fields also when its type is MIRROR_UTC
    3f5a3e027410 ipvlan: Fix a reference count leak warning in ipvlan_ns_exit()
    056e0ce1f1c0 dccp: annotate data-races in dccp_poll()
    2a7d2f2b8c2c sock: annotate data-races around prot->memory_pressure
    b8bcc45afcd3 net: dsa: felix: fix oversize frame dropping for always closed tc-taprio gates
    e3b4e5276ccd devlink: add missing unregister linecard notification
    0f0dd7b19ec6 octeontx2-af: SDP: fix receive link config
    2242640e9bd9 tracing: Fix memleak due to race between current_tracer and trace
    49834a2c43d5 tracing/synthetic: Allocate one additional element for size
    009e77a91690 tracing/synthetic: Skip first entry for stack traces
    5c2d886ea8cd tracing/synthetic: Use union instead of casts
    299e0033f1bd tracing: Fix cpu buffers unavailable due to 'record_disabled' missed
    f3acc61309e0 wifi: iwlwifi: mvm: add dependency for PTP clock
    7f35e5611730 can: raw: fix lockdep issue in raw_release()
    c8ddbaec835a can: raw: fix receiver memory leak
    019b59aeb2af jbd2: fix a race when checking checkpoint buffer busy
    557fda9ed70e jbd2: remove journal_clean_one_cp_list()
    2968fec1d56f jbd2: remove t_checkpoint_io_list
    1d9995c2ac80 PCI: acpiphp: Reassign resources on bridge if necessary
    a7342df30797 xprtrdma: Remap Receive buffers after a reconnect
    ef65498c8087 NFSv4: fix out path in __nfs4_get_acl_uncached
    9e2388d814ac NFSv4.2: fix error handling in nfs42_proc_getxattr

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 3a9d647e84..fac0eaf156 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d21f733f32e333301c41302269e97f8a2c23d35e"
-SRCREV_meta ?= "e470f033e5577e2e9bb256ce3b419541c4829364"
+SRCREV_machine ?= "6c3fed2773c3f8ac4f389c1a16b74af499a15d00"
+SRCREV_meta ?= "63304ee24efde8260ecdc840eb2e2fb7ae1f1193"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.12"
+LINUX_VERSION ?= "6.4.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index a54a698be9..dd782146b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.12"
+LINUX_VERSION ?= "6.4.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_meta ?= "e470f033e5577e2e9bb256ce3b419541c4829364"
+SRCREV_machine ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_meta ?= "63304ee24efde8260ecdc840eb2e2fb7ae1f1193"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 84d66d8bc5..6e18ac688d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5f3231da12226c3a1f30a6074691adeb50e87e29"
-SRCREV_machine:qemuarm64 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_machine:qemuloongarch64 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_machine:qemumips ?= "cd6f4d29a436519a02fb03788ffcd1b537311e74"
-SRCREV_machine:qemuppc ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_machine:qemuriscv64 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_machine:qemuriscv32 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_machine:qemux86 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_machine:qemux86-64 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_machine:qemumips64 ?= "c66efea0d1d1d36395ee98abe1d912b6b4b42885"
-SRCREV_machine ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
-SRCREV_meta ?= "e470f033e5577e2e9bb256ce3b419541c4829364"
+SRCREV_machine:qemuarm ?= "d0f3b0622c54ce9a203363c0c20975a8ff888286"
+SRCREV_machine:qemuarm64 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_machine:qemuloongarch64 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_machine:qemumips ?= "cb78ab735dcba4631199b347993d9f3c00fbf4af"
+SRCREV_machine:qemuppc ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_machine:qemuriscv64 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_machine:qemuriscv32 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_machine:qemux86 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_machine:qemux86-64 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_machine:qemumips64 ?= "8a49433d63c8109fc107653733313e8aad1083a1"
+SRCREV_machine ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
+SRCREV_meta ?= "63304ee24efde8260ecdc840eb2e2fb7ae1f1193"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "05d8970cca014b96c06c3730ae084f08087f13dd"
+SRCREV_machine:class-devupstream ?= "388f6d150784d9d1d25a3b6bace00aa52a85daf3"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.12"
+LINUX_VERSION ?= "6.4.13"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


