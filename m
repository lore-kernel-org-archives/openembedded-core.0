Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D1CC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:23:48 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.11181.1642184626719950852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q9gG7Zqf;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id 14so4125758qty.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nxXS0vReu6mHIqC4+In4yRs1mQc44dBzmCmLBqRmkvI=;
        b=Q9gG7ZqfyZeGa2wv3P2jYTwb8FBE1Oqtbwx6EZtSpeSxtjB0kxgXQrNRhbDiKHTIF3
         ZqD1hO8I1a9fAX7cVEXlKQjJSGK3+HUkwu7IqLqNYTl6eBhUuMvm6c7abeJERBFnlzeu
         ozjSiVf5RR8RN6P0oZ8Ruzg3K87GhYniIk9k13He17kYP/KV9h9OxZ5w80nZOSw+19i9
         oVNZgn9zpyXIauXSMjlPVMV+5HIOMe2z/0zHv0HBD0gVva4LpKe/ghkb2MU3GCu4uQl6
         vgymekyBdcIqhQ5R2c8CmebWFSm45GlW1uCDViacFnk1291MEPmQY0apAZlf/+9Zj0zv
         iTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nxXS0vReu6mHIqC4+In4yRs1mQc44dBzmCmLBqRmkvI=;
        b=PKcZDDilJIPzVCFZCD6mVCgb0XjVHMVzvW2frNWLOkDwThNJn8GZE91p0XD2U/xTi0
         8vgMQKeuHnEP3EIPu1o21EoH61tHUoF3/PKkZrkJWGWNRtNJdj+pEnbU5JTtxgxpB9rU
         RMX8u42+pm5HeVek3tfKrOI5G9slr4AOQQIk9fx9ya9+v/hJPrCnE9vow3gZGXFV9IYU
         V+Of3ZB5AF915WahvpzDc4LHkegZHdfFtKRPfavfgHrO77IcYk4wzNducCC8sqrXmS4A
         CihS4gFT5NE5/npBxwx1IuNLCGGqB3vrVsT/wT7wnuae1G6dhc1LpVgZE6jLvTeULPAC
         8z/Q==
X-Gm-Message-State: AOAM530u8idlVyBcDrCstkMXvqyJfb9A8yH9mMf+EnAvObU02aZLI+O4
	tpR8wKy+1VdK2njmv6dL9JMj7rjYg5vHGA==
X-Google-Smtp-Source: 
 ABdhPJw+1vpdPpgxDGX0CTmJtzo2jIVVNi/ABQ0jQcyd6WnMidtqgbmj01F0DJvlVttR/Qg3sd+Z3g==
X-Received: by 2002:ac8:5a49:: with SMTP id o9mr8870879qta.537.1642184625770;
        Fri, 14 Jan 2022 10:23:45 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 z14sm4448995qtw.59.2022.01.14.10.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:23:45 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/5.15: update to v5.15.14
Date: Fri, 14 Jan 2022 13:23:37 -0500
Message-Id: 
 <c660b7d6feb357d1edb5ccf6a671387bd8d0fb1f.1642184457.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1642184457.git.bruce.ashfield@gmail.com>
References: <cover.1642184457.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:23:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160588

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    d114b082bef7 Linux 5.15.14
    b8a1293e3850 drm/amd/pm: keep the BACO feature enabled for suspend
    19070d812e13 Revert "drm/amdgpu: stop scheduler when calling hw_fini (v2)"
    b228924bb619 Input: zinitix - make sure the IRQ is allocated before it gets enabled
    1917ace18375 ARM: dts: gpio-ranges property is now required
    2f66e0976b4a userfaultfd/selftests: fix hugetlb area allocations
    ec33da9ae072 ipv6: raw: check passed optlen before reading
    04d945934362 drm/amd/display: Added power down for DCN10
    9b1df8dab312 drm/amd/display: fix B0 TMDS deepcolor no dislay issue
    9964f0840a82 mISDN: change function names to avoid conflicts
    f55383e6b92b drm/amdgpu: put SMU into proper state on runpm suspending for BOCO capable platform
    3c196f056666 drm/amdgpu: always reset the asic in suspend (v2)
    fbabb82b11b4 drm/amd/pm: skip setting gfx cgpg in the s0ix suspend-resume
    80f229009b59 atlantic: Fix buff_ring OOB in aq_ring_rx_clean
    cf8f0e76c4ce net: udp: fix alignment problem in udp4_seq_show()
    294f3fc9dc27 ip6_vti: initialize __ip6_tnl_parm struct in vti6_siocdevprivate
    847050d40dc0 scsi: libiscsi: Fix UAF in iscsi_conn_get_param()/iscsi_conn_teardown()
    6ebb6853108f usb: mtu3: fix interval value for intr and isoc
    12a4c1092ae7 drm/amd/pm: Fix xgmi link control on aldebaran
    31d95ff41cdf drm/amdgpu: fix dropped backing store handling in amdgpu_dma_buf_move_notify
    4ed66cdc542f auxdisplay: charlcd: checking for pointer reference before dereferencing
    8a7520c49994 ipv6: Do cleanup if attribute validation fails in multipath route
    c1de618c95e9 ipv6: Continue processing multipath route even if gateway attribute is invalid
    5aec746bf7f2 power: bq25890: Enable continuous conversion for ADC at charging
    b4391e49ac1d drm/amdgpu: disable runpm if we are the primary adapter
    fa3d8456f7cd fbdev: fbmem: add a helper to determine if an aperture is used by a fw fb
    9ca97a693aa8 phonet: refcount leak in pep_sock_accep
    d57da5185def net ticp:fix a kernel-infoleak in __tipc_sendmsg()
    75d840c0f5d7 gpio: gpio-aspeed-sgpio: Fix wrong hwirq base in irq handler
    7601a265696c rndis_host: support Hytera digital radios
    b381e0f98711 reset: renesas: Fix Runtime PM usage
    550acd770f9f power: reset: ltc2952: Fix use of floating point literals
    be816676f38b power: supply: core: Break capacity loop
    b0e72ba9e520 xfs: map unwritten blocks in XFS_IOC_{ALLOC,FREE}SP just like fallocate
    800f02fa8a51 i2c: mpc: Avoid out of bounds memory access
    e24c6a48c6ea Revert "i2c: core: support bus regulator controlling in adapter"
    43fa0b3639c5 cgroup: Use open-time cgroup namespace for process migration perm checks
    50273128d640 cgroup: Allocate cgroup_file_ctx for kernfs_open_file->priv
    c6ebc3529884 cgroup: Use open-time credentials for process migraton perm checks
    247b6244d40e KVM: x86: Check for rmaps allocation
    a08275570392 EDAC/i10nm: Release mdev/mbase when failing to detect HBM
    3400aa7eda64 md/raid1: fix missing bitmap update w/o WriteMostly devices
    15fb002977f6 net: ena: Fix error handling when calculating max IO queues number
    c4c20dc24e09 net: ena: Fix wrong rx request id by resetting device
    bf8263c71420 net: ena: Fix undefined state when tx request id is out of bounds
    6511f8074b70 sch_qfq: prevent shift-out-of-bounds in qfq_init_qdisc
    9b8bbe489ced batman-adv: mcast: don't send link-local multicast to mcast routers
    9f00a2a0c139 sctp: hold endpoint before calling cb in sctp_transport_lookup_process
    3c5c81d1e350 selftests: net: udpgro_fwd.sh: explicitly checking the available ping feature
    41844e68eb92 lwtunnel: Validate RTA_ENCAP_TYPE attribute length
    ca0097c543fc ipv6: Check attribute length for RTA_GATEWAY when deleting multipath route
    00e8b9f313b2 ipv6: Check attribute length for RTA_GATEWAY in multipath route
    bb471784ca85 ipv4: Check attribute length for RTA_FLOW in multipath route
    72971eaad6ea ipv4: Check attribute length for RTA_GATEWAY in multipath route
    5cb0bd07125f ftrace/samples: Add missing prototypes direct functions
    61169d6c77de i40e: Fix incorrect netdev's real number of RX/TX queues
    7b177d34a123 i40e: Fix for displaying message regarding NVM version
    3f4c2ade4d65 i40e: fix use-after-free in i40e_sync_filters_subtask()
    8fbbc33cf018 sfc: The RX page_ring is optional
    03fb6db4ad61 mac80211: mesh: embedd mesh_paths and mpp_paths into ieee80211_if_mesh
    18b224910edc mac80211: initialize variable have_higher_than_11mbit
    0ea8bb0811ba RDMA/uverbs: Check for null return of kmalloc_array
    6716b40d162f netrom: fix copying in user data in nr_setsockopt
    21a18420ae2d Revert "net: usb: r8152: Add MAC passthrough support for more Lenovo Docks"
    e1e354771812 RDMA/core: Don't infoleak GRH fields
    607f126d4a21 iavf: Fix limit of total number of queues to active queues of VF
    fda95797fc50 i40e: Fix to not show opcode msg on unsuccessful VF MAC change
    deb65735b5b1 ieee802154: atusb: fix uninit value in atusb_set_extended_addr
    c44979ace49b Revert "RDMA/mlx5: Fix releasing unallocated memory in dereg MR flow"
    21f8a3b110f2 tracing: Tag trace_percpu_buffer as a percpu pointer
    be134e7c5b38 tracing: Fix check for trace_percpu_buffer validity in get_trace_buf()
    3cf50a37286c selftests: x86: fix [-Wstringop-overread] warn in test_process_vm_readv()
    ef3047fca111 fscache_cookie_enabled: check cookie is valid before accessing it

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 0a905d0bff..8659c606a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "04a95b0307715d513560636c2bef4238dde56c86"
-SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
+SRCREV_machine ?= "4903bb17bd48345aa95509e33f0d3aabb782f328"
+SRCREV_meta ?= "72e4eafb6b3c999aefc56e1c1b9dfa0c94ae2fbb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.13"
+LINUX_VERSION ?= "5.15.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index bee98d87cf..b5397529ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.13"
+LINUX_VERSION ?= "5.15.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "149aa4e4f2f3c704e11fd379be32746ab2d3433f"
-SRCREV_machine ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
-SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
+SRCREV_machine:qemuarm ?= "a499d1d7ad7cee5ddea8a737bfd0c44b109b63b6"
+SRCREV_machine ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
+SRCREV_meta ?= "72e4eafb6b3c999aefc56e1c1b9dfa0c94ae2fbb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 2e093357cb..daa83eb9fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "49cda4a3872929491dbcc3793afbd01709555315"
-SRCREV_machine:qemuarm64 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
-SRCREV_machine:qemumips ?= "049f989b96848df48c445c2b83c634cc5d692032"
-SRCREV_machine:qemuppc ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
-SRCREV_machine:qemuriscv64 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
-SRCREV_machine:qemuriscv32 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
-SRCREV_machine:qemux86 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
-SRCREV_machine:qemux86-64 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
-SRCREV_machine:qemumips64 ?= "27a47d7d5d6e7bbe8267f32f8089e395e0eaa863"
-SRCREV_machine ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
-SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
+SRCREV_machine:qemuarm ?= "03294d897ba8374d172b5c035e8c5698f676a1d7"
+SRCREV_machine:qemuarm64 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
+SRCREV_machine:qemumips ?= "84d8700593a35c850938994e080422bd354245ce"
+SRCREV_machine:qemuppc ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
+SRCREV_machine:qemuriscv64 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
+SRCREV_machine:qemuriscv32 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
+SRCREV_machine:qemux86 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
+SRCREV_machine:qemux86-64 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
+SRCREV_machine:qemumips64 ?= "4b8ef0714dd9fe90b5f92fab297926c482a58b88"
+SRCREV_machine ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
+SRCREV_meta ?= "72e4eafb6b3c999aefc56e1c1b9dfa0c94ae2fbb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "734eb1fd2073f503f5c6b44f1c0d453ca6986b84"
+SRCREV_machine:class-devupstream ?= "d114b082bef784345bfac1e1d5c17257005284f2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.13"
+LINUX_VERSION ?= "5.15.14"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


