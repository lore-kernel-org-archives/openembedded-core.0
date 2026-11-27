Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1541.1795801789734867354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IaqjzLqQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so81841905e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801788; x=1796406588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xS/CFajpZIrIv46wC57zrewhwdEXAtztn18QPtAnIAU=;
        b=IaqjzLqQU//suPdUveWiAvZ24Mgsaiz4vgjKPSdKMmXjQh4wBUYQlwHY06SfW8Kk+r
         eYVBHh4XmiD82/q26D6kQUbPo2PC1hTH3G0n9SuiNhIV2ndTvgV1AIigJyuv0lNKujps
         JkW2bX+B+OKiSMrFrEREY1At3JLL+wVFQBkYaX7CrVSZEY/HvGkVRGaBxHjhnM0f/r5A
         srcbcVuYHAmYtjH3PYnH77g67sED/08wxwWZvwq09+9WQRIxd3tH/a5KY/FmmNQU9A86
         cxLIn5lHc2fqZALyIfvWyLknJxVDxVnYCt2wCsAUY0fHn/QmS7/h/rJSz8mONZAxBpgI
         BLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801788; x=1796406588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xS/CFajpZIrIv46wC57zrewhwdEXAtztn18QPtAnIAU=;
        b=CM1f/uxHwuTZXb3gUPM7xbJPDI0eu5oECwihuj3rbtvybYXqOp2pwqx2CSuMcpcFeq
         8rR1TX4xeaI7TDXNwGYzeQo9bkLrLBZvG+Cl7Wz29xNakKUPhVqWYS9MI6xx3zfyl7f6
         WxJfN0eH+XuyGQMp12BelJv+wz3EkbWrHmLjkh7VqTVcIwSdOqSF0X8wTnpa180oCcqV
         32R4rHJVndW4VFB503feHf8i0fGZcb5nUscbw3kQtP7DGeU7j6KnwFfkYvWz/qWQrHme
         X2RlD2HieFGqxmbrCV3j861mMs/peQslEv66NAQEjsr+CawPfzQxSGTm+4zd/D1FcSuD
         sN5g==
X-Gm-Message-State: APuU4Z8dT0BScb5YgtVfZdsy5aaTXNEB9n+yNo1dfZInC+mTQX+4JGw2
	Pb1WeutA7ka80p0HH7BOGtleaD5+QCrX+EQb17GKjA9JIBxB9phRoLC+cflv1h20rNgadyseIUl
	qWesN6+c=
X-Gm-Gg: AZFdTZcpVf5YCqjJTC9bomc3mKeAxtjENI+fLx2cyrCc9jK7oGjqrKm/MqoFuZ1gtjy
	lwczyLGKlW+aWSF8ZQzr/5Y+HDFyuPYRLEFJ9oe1MNN4rqR9JGAvTlVO3FYK/Nv0yGqQ8Bm6shL
	KnMGalT2HREHmEcnj9BRdROvjYJYuHDuTOG330ESQNa7KGe58+E/nf0Xip08lbyDTq0WIwHND1+
	Hf9U/YsUALYd3z1PMX3xEiATVA/mtWfUJel9U4LMU88nC0EJJ9r2C03l18xTdzHLProQ9H5LJST
	XI614l/9AoiIZspCgymv+6IVX4xVvH6m09+j6vfAwx2G5Lm/gsbw76gPhSj0mlzqyV+7I9kWPOu
	tI6yM6xPRoqYFnKK9wQD4ypEHdzAdYCIrB3OzCOAhQNPMzAGw2IQEFuwkuopnwE3F7UO0Y/JeXR
	2CcDJ0N581zKh89Wy+MttqAASYppUYHVrxNht0XS7ixvG3L5Epyeuv4BVnys1uk7cR9F+94GqGT
	bejzGE6kjbFRDeYYZQr63gKHkOUUkEkLBswTo/6jWsA0J6uX/veNCOvj9YJUQJv8+860S+4NWYE
	fIB4G4gJSL6KDc+GwF5OT2Cj7N0XMi/rlGU69+h83KeSihiUJq14MCSTZZKmNgLwFSJl+CnJJ0D
	jut9q0DNPgaHA3f7ofkBU9NJ73Uo9
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr475826995e9.11.1795801787812;
        Fri, 27 Nov 2026 09:49:47 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/37] linux-yocto/6.6: update to v6.6.162
Date: Fri, 27 Nov 2026 18:49:07 +0100
Message-ID: <5bee37c8d264fe035056381985bb237feb143e70.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251430
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    5139929c698c2 Linux 6.6.162
    fe9ead8c5bdb7 xen-blkback: Avoid UAF when reading I/O statistics
    0d515c409033c xen-netback: defer xenvif_mcast_addr_list_free()
    89e534265b62c xen-netback: Fix UAF when reading statistics data
    b5a1dc3ad4822 Linux 6.6.161
    9ab0324f4868e pid_namespace: prevent TIF_NOTIFY_SIGNAL from interrupting the reaper
    9fdbfd1a15a3e signal: allow taks to temporarily block TIF_NOTIFY_SIGNAL
    4d1fdb850d016 ptrace: refuse to change the signal mask of a user worker
    ec2c8af51ccd5 signal: only SIGKILL and the freezers interrupt a coredumping task
    105ca21eb3356 signal: don't retarget shared signals in a dying thread group
    71146c437bae5 coredump: hold RCU while releasing parked threads
    0e5ff07be834a ftrace: Initialize modname and offset in print_rec()
    7f0728ba89624 asymmetric_keys: reject trust keys without IDs
    234d09bb3b3d8 keys/trusted_keys: return immediately after TPM unseal failure
    c77401946b5bf KEYS: trusted: Fix blob allocation size in tpm2_key_decode()
    19dfc37c9deef KEYS: Fix key_reject_and_link() race with keyring restriction
    ff44f1b303aa7 keys: Protect the read method check against type removal
    8451d4a4c4312 keys: make keyring indexes independent of kernel addresses
    dddd3a1ab7d12 keys: Protect the type name while describing a key
    26949c2e4c461 keys: Check the authorization payload in process keyring searches
    aa03c8fb4334f keys: Avoid the owner account dereference in named keyring lookup
    89f0290fc2856 io_uring/poll: don't loop on HUP with multiple references
    68cd06ba918d9 io_uring/timeout: don't lose a cancel as io-wq arms a timeout
    838475965e5e3 io_uring/timeout: don't flush with the sequence behind the last flush
    ee081d232e8f6 io_uring/timeout: don't put a sequence target behind the last flush
    41fae2e9e1fa3 io_uring/poll: avoid retry wakeup loss when dropping ownership
    c276be0c83ee0 io_uring: look up the file before queueing to io-wq
    c614af6826ca2 io_uring/timeout: no ABS update of multishot timeouts
    ec267cd430ee4 io_uring: don't pass restart error codes to userspace
    9786f24078e30 io_uring/sqpoll: let the thread sleep on disabled rings
    f592e45df49c9 io_uring/timeout: keep repeat count on multishot update
    93947570afbb9 io_uring/timeout: don't skip over reached sequences
    07aa50be5eee5 io_uring/poll: drop stale double poll entry on rearm
    9f59721eddabc io_uring/wait: look at all CQ waiters on wake up
    9bb28e7740ce7 io_uring: wake ring pollers for local task_work
    b23306ea31a0b io_uring/cancel: let CANCEL_ALL find parked requests
    b22a4cdc0a90c io_uring/cancel: don't default to setting req->work.cancel_seq
    8a9aa27d23e8d io_uring/cancel: recognize "no timeout" on 32-bit
    96aaafd7baa54 io_uring/cancel: don't forget that the work was running
    39a503e0981c0 io_uring/poll: don't lose a cancel as io-wq arms poll
    8408964c14e53 io_uring/io-wq: let cancel find picked up hashed work
    b2cfc9fa4ec05 io_uring/io-wq: don't exit with a creation pending
    d2a824548aeda io_uring/io-wq: don't strand work when a worker exits
    2c75ebae8a7f0 io_uring: don't flood a cancelling task with task_work
    d39ebc7a583d6 io_uring/io-wq: don't hide a link from cancellations
    08c42055b8f9a io_uring/io-wq: don't lose the signal that ends work
    bf1d2ed84b316 io_uring/wait: don't spin on a stuck overflow list
    1432d881d9958 io-wq: order the exit bit against worker creation task work
    4472579bd1c83 tracing/histograms: Verify event_call identity when updating synth_event refcount
    584701bf9b7a0 tracing: Fix 64-bit and signed histogram fields on 32-bit kernels
    aae0ccd7326ee tracing: Unregister field variable histograms when the command fails
    8b307d64a6054 tracing: Save the event file instead of the compatible histogram
    b205ff58e0292 tracing: Reject incomplete event filter expressions
    fabaff1c59ff2 Bluetooth: L2CAP: refuse __l2cap_chan_add if chan already has conn
    7aaaca01a3f8e net_sched: codel: fix stale state for empty flows in fq_codel
    95b887e3d4d7a Revert "srcu: Use irq_work to start GP in tiny SRCU"
    7192633a23d6b bonding: do not set usable_slaves for broadcast mode
    863303ad4caac net: bonding: update the slave array for broadcast mode
    83b2e511cf9ba xfs: don't hold buffer locks across sync transaction commit in xfs_sync_sb_buf
    ad33433131ebc cifs: add revalidation on FSCTL failure in smb2_duplicate_extents()
    bbc154a7da4e0 dm-integrity: fix infinite loop on discard with large tag size
    e265221019d20 drm/amdgpu: free the userptr ranges when a CS fails after parser_bos
    4589ad76a6b10 drm/i915/dmc: Harden DMC firmware payload parsing
    0c133ed517000 futex: Fix mm reuse handling for FUT_OFF_MMSHARED
    9504c8b6644f3 i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
    0254b2ffc6276 gtp: disable BH before calling udp_tunnel_xmit_skb()
    0cf0ff2f728f2 ipv4: udp: Create exceptions before socket matching
    f77fb90edca53 vsock/virtio: validate packet source for connected sockets
    64e196a6d7173 io_uring/cancel: don't spin on local work the task can't run
    762ffd4a8daff dm-integrity: require stable writes for internal hash modes
    f4fcbae8b2735 tracing: Keep the predicate limit separate from program capacity
    ef9342fa74336 ASoC: SOF: ipc4-topology: Fix shift-out-of-bounds for aggregated ALH capture
    e8dafad7de9ed pid_namespace: make zap_pid_ns_processes() freezable
    2358060edbc35 exit: move core of do_wait() into helper
    74b4d2370a9e2 drm/exec: don't immediately add prelocked obj to array of locked objs
    913a1876fbe9a scsi: bsg: Pass reply_len to bsg_setup_queue() to fit UFS ARPMB replies
    b4b0598fad51a ext4: free the sbi after a grace period
    c39150784a801 ntfs3: free the sbi after a grace period
    da52e5fcb2cae watch_queue: Fix note pool publication race in watch_queue_set_size()
    5e1e8702f45d1 kernel/watch_queue: Use pipe_buf() to retrieve the pipe buffer
    cd7cd04be583b eventfs: fix SRCU read lock leak in eventfs_iterate()
    c3b6aa73a895e perf: Track the perf mlock gift separately
    00ff1128123d4 scsi: st: Fix use-after-free race between st_remove() and st_open()
    98975a7172288 smb: client: fix multiuser mount with krb5
    68652afb9b9ad smb: client: fix heap overflow in cifs_do_set_acl()
    cff9bf34afde4 net/sched: cls_flower: validate mask pointer after nla_next()
    1a35a81c302b3 ksmbd: zero the FS_OBJECT_ID_INFORMATION buffer before filling it in
    e8b82184a1982 ksmbd: initialize FileSystemControlFlags in FS_CONTROL_INFORMATION
    da2ec27fdd7ef ksmbd: fill in FileSysIdentifier in FS_POSIX_INFORMATION
    b0db9f4ff402b net: bridge: mcast: don't truncate the port group walk on teardown
    9ca91638aa027 mm, madvise: fix potential workingset node list_lru leaks
    6273bfdeb248d KVM: x86/mmu: Preserve nested TDP shadow page tables if they are used as roots
    25dbafda0e432 mm/huge_memory: initialise workingset state before folio split
    6ae0cfcb74234 drm/amdgpu: Fix VCE 3 ring align_mask
    226a974054acb ipv4: avoid divide by zero in fib_rebalance
    ff31c34e921d1 s390/pci: Fix leak of uninitialized kernel data in SCLP report
    977dac6cc5531 s390/ctcm: Prevent XID null dereference
    ccc28e498ef1c page_pool: keep frag_offset aligned for odd-sized requests
    5a7ee52589dae sctp: validate chunk length in the inqueue parser
    6abd93d01b0f4 tipc: protect node reset trace dump with node lock
    e84bfb0801649 xfs: fix capability check in xfs
    23e7fbbdca5aa net/iucv: fix the recvmsg window update
    b090c321f203d dm-ebs: fix incorrect device offset check in ebs_ctr()
    056bf8322e39a dm-crypt: fix a tiny race condition in crypt_dec_pending
    8433fd005c25f dm cache: fix issue with background work locking
    495ef656f965f dm cache: fix demotion stats in passthrough mode
    f88339e197ea9 cgroup: fix spurious SIGKILL of CLONE_INTO_CGROUP children
    8d5fc9e6dc091 tcp: fix use-after-free in do_tcp_getsockopt(TCP_CC_INFO)
    4b0930d66dde0 tcp: fix use-after-free in do_tcp_getsockopt(TCP_CONGESTION)
    dda5245afc347 wifi: p54: validate firmware record lengths
    ab320f6aa3769 tracing: Fix hist trigger timestamps for buffered events
    e8cfcd7e60eaa tracing: Do not initialize tracefs work if tracing is disabled
    c43c41ec62ca5 tracing: Check operator stack capacity before pushing
    16d51e3ca46af tracing: Fix the shift out of bounds in the log2 histogram modifier
    f9c0b333a5e44 drm/amdgpu: don't drop the runtime PM reference twice in amdgpu_gpr
    13c3cbfd0d1c8 drm/amdgpu/sdma3: Work around POLL_REGMEM / FENCE hang
    77134cf996bab scsi: libiscsi: Validate the task named by a management response
    ebb8c5ef2aabf scsi: libiscsi: Validate the ITT reflected in a Reject PDU
    6200fb2de579f scsi: libiscsi: Reject a negative task index from parse_pdu_itt
    e397d4da76bed scsi: xen/scsifront: Check for a NULL shadow entry on a backend response
    995350c4f4097 perf: Update cgroup time when rotating multiplexed events
    fb13353f0761d i2c: qcom-cci: Fix HALT_ACK reset request being dropped
    7e0d05a6234a9 tracing/histograms: Reject non-stacktrace fields for synthetic stacktrace fields
    6440608024b00 tools: gpio: fix building from the top level with O=
    994694a2d4611 sctp: revalidate output stream after association connect wait
    1fccfbc553a63 pinctrl: amd: Clear S4 wake bits when firmware has _AEI
    a2fde862b98db net: rds: fix uninitialized trans dereference in CM event handler
    fde33eb9955d8 net/sched: fix use-after-free in __tcf_action_put()
    5819018dc29fb eventfs: Free the eventfs_inode after an rcu grace period too
    d28a460a22372 fsnotify: prevent mark additions during connector teardown
    6a36b05fc5b3d KVM: nVMX: Reset MMU back to the root MMU if loading L2 state fails for !VM-Entry
    5d7687b0b7160 unicode: free the map after a grace period
    35c2c4f3cf140 autofs: ignore notification errors from a replaced pipe
    3caf006eb731e perf: Fix perf_pmu_migrate_context() leaving events behind
    b5148fad7f9f6 gpio: mxc: fix wakeup_pads bit operations
    5982563c56cad gpio: mxc: use BIT() macro
    15c0dd095d19d gpio: mxc: fix both_edges bit operations
    1b5c5ae021815 gpio: mxc: use lock guards for the generic GPIO chip lock
    e29d0a00c619a calipso: keep BIG TCP payload_len in calipso_skbuff_setattr()
    2ef0ce6c84470 net/ipv6: Introduce payload_len helpers
    e5aa07c62e4fd net: bcmgenet: unshare the skb before writing the control block
    41a2f69f091b0 netlink: avoid hashing the network namespace pointer
    6078a5369f9e8 scsi: libsas: Fix SMP IO deadlock during HA resume
    219aee17dd023 tracing: probes: error if BTF is required but unavailable
    94be790dd6fbe pipe: preserve existing fasync readers on writer setup failure
    14d8fdf03fb71 samples: pidfd: fix userprogs typo
    403669041cb77 ocfs2/dlm: Protect the recovery list during debugfs reads
    57b6ebcc83afb scsi: target: iscsi: Fix race in discovery auth updates
    d2c2fb020eb97 scsi: st: Save the visited block for the partition the drive is in
    9761f81707440 nios2: fix __wsum type degradation in csum_fold()
    174c6a8735f42 spi: tegra114: assert CS GPIO for every transfer in a message
    ea0e0fc4c72f7 netlink: reset skb headers before unicast and multicast filtering
    847874bdbc7bf ASoC: nau8822: Fix the 128x oversampling switch bits
    1ffc03f432bb7 ASoC: wm8978: Fix the 128x oversampling switch bits
    07bbe910ccc72 ASoC: max98371: Fix the Speaker DHT Min Volume bits
    ba5c27c9fa751 ASoC: pcm3168a: Fix the DAC zero flag polarity bit
    12d589f384c4d ASoC: cs42l52: Fix the NG Type Switch bit
    677c0e9cbb19a ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
    4827c986f16d9 ASoC: stm32: spdifrx: fix synchronization state check
    41d5c47cf7949 ASoC: Intel: avs: Reset the stream unless it is already prepared
    e677eda15df7d net/rds: don't let the rdma_cm destroy an id RDS still owns on route failure
    deb972c7eea8d vsock: treat TCP_CLOSING as once-established
    86ef8cec3e105 pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
    9ee4a57a9858a power: supply: generic-adc-battery: Fix temperature IIO channel conversion
    2cba0c8a7b158 pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13
    2e5ffbf1e41ab Drivers: hv: Don't reset VMBus connection state on error/exit paths
    f561392afb44a Drivers: hv: Avoid infinite retry loop in init_vp_index()
    4643aead9c920 power: supply: ds2780: Fix ds2780_get_capacity() returning raw value
    47469a5602b65 power: supply: Fix maintenance charge table kernel-doc
    0db8fdcfad51c ext4: fallback to complex scan if aligned scan doesn't work
    90a7876e83118 mptcp: move the OoO check back into __mptcp_try_fallback()
    ee54f7b6cb4be blk-mq: reinsert cached request to the list
    f122d9968d730 blk-mq: pop cached request if it is usable

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 51a4e9703cb..eb44fdc10af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bbef8f873c0872eaa717fb9b043b7b428de82c92"
-SRCREV_meta ?= "111e66d07f015c08755ae564c4a2f4a7710863ef"
+SRCREV_machine ?= "7593447608d70ada4e27630e9047fdf459b3fd6f"
+SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.160"
+LINUX_VERSION ?= "6.6.162"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 14f0a62d797..d39247e3314 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.160"
+LINUX_VERSION ?= "6.6.162"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ada4ee01eb1897a0f2a46b9b3ceeb94690f9e619"
-SRCREV_meta ?= "111e66d07f015c08755ae564c4a2f4a7710863ef"
+SRCREV_machine ?= "33978ed066431901d7e235059590916deb73fa28"
+SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 13fe981462e..2a812631ae9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e67812bab0b383dea8ae786005a5ec642e6b860a"
-SRCREV_machine:qemuarm64 ?= "dce83a630a519666f8c5599478cd8db87cf772c2"
-SRCREV_machine:qemuloongarch64 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
-SRCREV_machine:qemumips ?= "e74bfb3fbb54e475fea2371332942c68ab7edc8e"
-SRCREV_machine:qemuppc ?= "a384bf5c01fda52c362015fb31815f41193f9e3b"
-SRCREV_machine:qemuriscv64 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
-SRCREV_machine:qemuriscv32 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
-SRCREV_machine:qemux86 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
-SRCREV_machine:qemux86-64 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
-SRCREV_machine:qemumips64 ?= "14d15eae8d97e33895da68333b4347af334e5c65"
-SRCREV_machine ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
-SRCREV_meta ?= "111e66d07f015c08755ae564c4a2f4a7710863ef"
+SRCREV_machine:qemuarm ?= "7fba77c3443f7ffb974bca08c44cd741ae422baf"
+SRCREV_machine:qemuarm64 ?= "b98967f55ff0be50f7ad0dbcc5938c76278d96b5"
+SRCREV_machine:qemuloongarch64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
+SRCREV_machine:qemumips ?= "6a6d5067d6dac276c4c0d0829a0483d47b67c7de"
+SRCREV_machine:qemuppc ?= "da6b28016510be8a0c0ecdf864f48d2a1851ab71"
+SRCREV_machine:qemuriscv64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
+SRCREV_machine:qemuriscv32 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
+SRCREV_machine:qemux86 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
+SRCREV_machine:qemux86-64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
+SRCREV_machine:qemumips64 ?= "a1afaf058fb596aa7e7750378ccb3f9b77297256"
+SRCREV_machine ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
+SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0aebf2870d53a8d97e02a99e2103ea0b38950c1b"
+SRCREV_machine:class-devupstream ?= "5139929c698c273e07cb0635732f6a918a7b8e78"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.160"
+LINUX_VERSION ?= "6.6.162"
 
 PV = "${LINUX_VERSION}+git"
 
