Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8581.1795065444137618833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 21:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PQNQQzKC;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso972259241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 21:17:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795065443; cv=none;
        d=google.com; s=arc-20260327;
        b=eEl10+aDdQhOmWbFt1fEsxYRBEW0txzaWxwMzI7ZvluPBAWt/DbwbhYXv7aHeuK6LA
         PJBrU2NU4nVZTXb2FPZZdVpKbVk+nPhG37CN2IviTAM0ZfFLMV75wpM/2cmCAiaeDukJ
         VRarZTUHtvM8PvF97b1qLewnqMXW1NI64yqdSuI2QUOdY9kmweEu5TbVFOYjkMwIh2HJ
         Of0UIi/ThGnSdOJ1DdtqYiIg9n+oZuPT5XagtDGXiybBlSubSHvmThudF/qdcBATLz6K
         5k/oeqVMgN+pG9hhVZWHAk220eUm87bQUxxOAfkr7cZS+Rf7Tni5M0hqR09Ptv9aUHWS
         WJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FrQY5tasZBLigH3xN0C2ArN09KJ2nHMlfOlRrooqnmE=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=qBB/pc81Rrnbb8ruNr3eYUjeRN+WNigKLa3HWCCnMEQAVjM6mQKPt0L9U8zzP98Yoy
         DRefHFCeDZZA9xvKWUxVW4uKZFZwFb+MI3wShJYnuE89rkqEXwVhPQQFbCESg+5nAatY
         bh/HaGE1fZvA3opL1Tk9gkBCt3Ma2JVLC0d9uMQqFCZ/qgMXFe7NEfClCsCjFNMXVy0N
         Ke3ohRJgugwB/O9iEnWk3KPb7pawj6uf110urSOiLPUHyOcA9ozw3Ii1MMufIKzNEeZV
         9y9OM06vD/PeXZh0M6nhxuK8TXVaWSoKRG34qeU8AMktUEMiNL/SV64xRVh/SLED3dqZ
         Nlag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795065443; x=1795670243; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrQY5tasZBLigH3xN0C2ArN09KJ2nHMlfOlRrooqnmE=;
        b=PQNQQzKCjlQOqgJnmr6rIU7vWwaozmFOIgiC3WQTh2g0VdUl6Gg0QPpJzSRo6GFC+Q
         yQkXZ9uP7KqinpOnzxS9bUP+Y3QeZo+o3UtB2R5gAhCzdQNu2tDDC+BKttbTVHzZR48O
         3WsEaj1vVzYFaYhY7FiXrPwjpDGu4fiuRj41Ihdip5T6X8whSUraJfoh5Q6LiMFSc1Wl
         EEBsxbdNp75r4i2Z4f+YGaaVqcti3pAHZK/zrPMpwmitjI5CQ7S/jFmGJ+/7P2oBxjBA
         Cg7NKWg0kIszJd8Wp80LxcyLose1zs8spgAE4HfM/Ut3xrwxysj5qx+OO5bmVIFfPC1T
         Qvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065443; x=1795670243;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrQY5tasZBLigH3xN0C2ArN09KJ2nHMlfOlRrooqnmE=;
        b=pe2J/WM+142M8ju2cVeADawFzow5aajMNzve5IQFaG4KMvLZQoCwRt0xTngFbSBqhU
         A8uw4TTZxzItZnsAHuyew3xy+FWPeZNSGHX1qqHMf+0033Dh+RGNqiKVjvNDfiGZDc9O
         FpJeHzxMakpjKqzChOWhTo8+F9LIQbpRJa6oPHvaMjk1pMYJPVNe7x2PK9p53IwjnzUY
         AzX7c9X7dLfhjwbvbIEUAgp88Ayp8R9lLfJ8rU07rXr8SltBrypDhcMkkH2EVpvoKvjq
         ONiJT2vrBlFyrOpzsqWqCcdA/pAiCo5WPNeOUqg/g1AWtiqLswI1BFhBjrCs9+zQg5qD
         4Z8w==
X-Gm-Message-State: APuU4Z/SorLHoSqfY+tQO918VzStUIFKzgQdbmZbmsYVKIEdaSj+2L+7
	hcagS5wzT1ugveSm9h9YDsGY06izPwCCXnjHsVZruid7fQcZqoiS/9dLdjEHsWYcU1XRtkkSeq9
	Po39EtIKPJHYfHBIstixZHa2qccttSzW6ED1Iu/U=
X-Gm-Gg: AYBFou15DBg1d01WpuxnXmT6z+CwbZlvjtq3jwD6AfkTNtohIZa6jZEijNi1wwi4Qjt
	ovyohLEllfcjzvjMc6245z/AWmldroR6zS1I9uwtqxvKGkjSBWIi/P31C+sGquYsIx9cx4KPAV9
	2bhQ5cSuQJootfVOWSKHmDk8m1JoIsjMfITaRB44GbSAyydU8jmzJBGHar2xM+vVSB/GCi1/+b/
	C9eFDRRsYjYS2mMfX8r+UX2w9hyX9lRAo+7NDeRhWhTE1BNp1ZX9H4MyJ7cyA9d61VQhfVyciGn
	OVIR/HYZ53dOLQfinon+ymAOSJ2fL2oYUVK26Ttb0wSDd0dNWNudV5DuhgsnOUlntI5tKA3tJ9H
	27POwN7zecrKxbNaOL7QuW2WGC8fu+hYxpk8f5TJGVhDfOOVW59cJlBc4k8raF+vY1mf/nfaoUT
	fU4G505BrrRGVRSFwQSaUdqxmognVMbWzG8TaVLyc+OwoG8roPfaOLCg==
X-Received: by 2002:a05:6102:370c:b0:7cc:7801:b317 with SMTP id
 ada2fe7eead31-7d6ba3c1332mr2159538137.9.1795065442494; Wed, 18 Nov 2026
 21:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20261119051332.3840412-1-bruce.ashfield@gmail.com>
In-Reply-To: <20261119051332.3840412-1-bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Nov 2026 00:17:10 -0500
X-Gm-Features: Aa3M54oq2EMyzDT7eY0X5S3hlFntK52yQF-OWuMYPj_E3qg4Df-TUcjeyQYA3us
Message-ID: <CADkTA4MESamhbTiAZF2dEzoVC1V1SHijMCAWpovrdHSSwyouLQ@mail.gmail.com>
Subject: Re: [poky][scarthgap][PATCH 02/02] yocto-bsps: update to v6.6.162
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000c6eb606609a3ead"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 05:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250638

--0000000000000c6eb606609a3ead
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ignore this! wrong patch sent!

Bruce

On Thu, Nov 19, 2026 at 12:13=E2=80=AFAM <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.6 to the latest korg -stable release that comprise=
s
> the following commits:
>
>     5139929c698c2 Linux 6.6.162
>     fe9ead8c5bdb7 xen-blkback: Avoid UAF when reading I/O statistics
>     0d515c409033c xen-netback: defer xenvif_mcast_addr_list_free()
>     89e534265b62c xen-netback: Fix UAF when reading statistics data
>     b5a1dc3ad4822 Linux 6.6.161
>     9ab0324f4868e pid_namespace: prevent TIF_NOTIFY_SIGNAL from
> interrupting the reaper
>     9fdbfd1a15a3e signal: allow taks to temporarily block TIF_NOTIFY_SIGN=
AL
>     4d1fdb850d016 ptrace: refuse to change the signal mask of a user work=
er
>     ec2c8af51ccd5 signal: only SIGKILL and the freezers interrupt a
> coredumping task
>     105ca21eb3356 signal: don't retarget shared signals in a dying thread
> group
>     71146c437bae5 coredump: hold RCU while releasing parked threads
>     0e5ff07be834a ftrace: Initialize modname and offset in print_rec()
>     7f0728ba89624 asymmetric_keys: reject trust keys without IDs
>     234d09bb3b3d8 keys/trusted_keys: return immediately after TPM unseal
> failure
>     c77401946b5bf KEYS: trusted: Fix blob allocation size in
> tpm2_key_decode()
>     19dfc37c9deef KEYS: Fix key_reject_and_link() race with keyring
> restriction
>     ff44f1b303aa7 keys: Protect the read method check against type remova=
l
>     8451d4a4c4312 keys: make keyring indexes independent of kernel
> addresses
>     dddd3a1ab7d12 keys: Protect the type name while describing a key
>     26949c2e4c461 keys: Check the authorization payload in process keyrin=
g
> searches
>     aa03c8fb4334f keys: Avoid the owner account dereference in named
> keyring lookup
>     89f0290fc2856 io_uring/poll: don't loop on HUP with multiple referenc=
es
>     68cd06ba918d9 io_uring/timeout: don't lose a cancel as io-wq arms a
> timeout
>     838475965e5e3 io_uring/timeout: don't flush with the sequence behind
> the last flush
>     ee081d232e8f6 io_uring/timeout: don't put a sequence target behind th=
e
> last flush
>     41fae2e9e1fa3 io_uring/poll: avoid retry wakeup loss when dropping
> ownership
>     c276be0c83ee0 io_uring: look up the file before queueing to io-wq
>     c614af6826ca2 io_uring/timeout: no ABS update of multishot timeouts
>     ec267cd430ee4 io_uring: don't pass restart error codes to userspace
>     9786f24078e30 io_uring/sqpoll: let the thread sleep on disabled rings
>     f592e45df49c9 io_uring/timeout: keep repeat count on multishot update
>     93947570afbb9 io_uring/timeout: don't skip over reached sequences
>     07aa50be5eee5 io_uring/poll: drop stale double poll entry on rearm
>     9f59721eddabc io_uring/wait: look at all CQ waiters on wake up
>     9bb28e7740ce7 io_uring: wake ring pollers for local task_work
>     b23306ea31a0b io_uring/cancel: let CANCEL_ALL find parked requests
>     b22a4cdc0a90c io_uring/cancel: don't default to setting
> req->work.cancel_seq
>     8a9aa27d23e8d io_uring/cancel: recognize "no timeout" on 32-bit
>     96aaafd7baa54 io_uring/cancel: don't forget that the work was running
>     39a503e0981c0 io_uring/poll: don't lose a cancel as io-wq arms poll
>     8408964c14e53 io_uring/io-wq: let cancel find picked up hashed work
>     b2cfc9fa4ec05 io_uring/io-wq: don't exit with a creation pending
>     d2a824548aeda io_uring/io-wq: don't strand work when a worker exits
>     2c75ebae8a7f0 io_uring: don't flood a cancelling task with task_work
>     d39ebc7a583d6 io_uring/io-wq: don't hide a link from cancellations
>     08c42055b8f9a io_uring/io-wq: don't lose the signal that ends work
>     bf1d2ed84b316 io_uring/wait: don't spin on a stuck overflow list
>     1432d881d9958 io-wq: order the exit bit against worker creation task
> work
>     4472579bd1c83 tracing/histograms: Verify event_call identity when
> updating synth_event refcount
>     584701bf9b7a0 tracing: Fix 64-bit and signed histogram fields on
> 32-bit kernels
>     aae0ccd7326ee tracing: Unregister field variable histograms when the
> command fails
>     8b307d64a6054 tracing: Save the event file instead of the compatible
> histogram
>     b205ff58e0292 tracing: Reject incomplete event filter expressions
>     fabaff1c59ff2 Bluetooth: L2CAP: refuse __l2cap_chan_add if chan
> already has conn
>     7aaaca01a3f8e net_sched: codel: fix stale state for empty flows in
> fq_codel
>     95b887e3d4d7a Revert "srcu: Use irq_work to start GP in tiny SRCU"
>     7192633a23d6b bonding: do not set usable_slaves for broadcast mode
>     863303ad4caac net: bonding: update the slave array for broadcast mode
>     83b2e511cf9ba xfs: don't hold buffer locks across sync transaction
> commit in xfs_sync_sb_buf
>     ad33433131ebc cifs: add revalidation on FSCTL failure in
> smb2_duplicate_extents()
>     bbc154a7da4e0 dm-integrity: fix infinite loop on discard with large
> tag size
>     e265221019d20 drm/amdgpu: free the userptr ranges when a CS fails
> after parser_bos
>     4589ad76a6b10 drm/i915/dmc: Harden DMC firmware payload parsing
>     0c133ed517000 futex: Fix mm reuse handling for FUT_OFF_MMSHARED
>     9504c8b6644f3 i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
>     0254b2ffc6276 gtp: disable BH before calling udp_tunnel_xmit_skb()
>     0cf0ff2f728f2 ipv4: udp: Create exceptions before socket matching
>     f77fb90edca53 vsock/virtio: validate packet source for connected
> sockets
>     64e196a6d7173 io_uring/cancel: don't spin on local work the task can'=
t
> run
>     762ffd4a8daff dm-integrity: require stable writes for internal hash
> modes
>     f4fcbae8b2735 tracing: Keep the predicate limit separate from program
> capacity
>     ef9342fa74336 ASoC: SOF: ipc4-topology: Fix shift-out-of-bounds for
> aggregated ALH capture
>     e8dafad7de9ed pid_namespace: make zap_pid_ns_processes() freezable
>     2358060edbc35 exit: move core of do_wait() into helper
>     74b4d2370a9e2 drm/exec: don't immediately add prelocked obj to array
> of locked objs
>     913a1876fbe9a scsi: bsg: Pass reply_len to bsg_setup_queue() to fit
> UFS ARPMB replies
>     b4b0598fad51a ext4: free the sbi after a grace period
>     c39150784a801 ntfs3: free the sbi after a grace period
>     da52e5fcb2cae watch_queue: Fix note pool publication race in
> watch_queue_set_size()
>     5e1e8702f45d1 kernel/watch_queue: Use pipe_buf() to retrieve the pipe
> buffer
>     cd7cd04be583b eventfs: fix SRCU read lock leak in eventfs_iterate()
>     c3b6aa73a895e perf: Track the perf mlock gift separately
>     00ff1128123d4 scsi: st: Fix use-after-free race between st_remove()
> and st_open()
>     98975a7172288 smb: client: fix multiuser mount with krb5
>     68652afb9b9ad smb: client: fix heap overflow in cifs_do_set_acl()
>     cff9bf34afde4 net/sched: cls_flower: validate mask pointer after
> nla_next()
>     1a35a81c302b3 ksmbd: zero the FS_OBJECT_ID_INFORMATION buffer before
> filling it in
>     e8b82184a1982 ksmbd: initialize FileSystemControlFlags in
> FS_CONTROL_INFORMATION
>     da2ec27fdd7ef ksmbd: fill in FileSysIdentifier in FS_POSIX_INFORMATIO=
N
>     b0db9f4ff402b net: bridge: mcast: don't truncate the port group walk
> on teardown
>     9ca91638aa027 mm, madvise: fix potential workingset node list_lru lea=
ks
>     6273bfdeb248d KVM: x86/mmu: Preserve nested TDP shadow page tables if
> they are used as roots
>     25dbafda0e432 mm/huge_memory: initialise workingset state before foli=
o
> split
>     6ae0cfcb74234 drm/amdgpu: Fix VCE 3 ring align_mask
>     226a974054acb ipv4: avoid divide by zero in fib_rebalance
>     ff31c34e921d1 s390/pci: Fix leak of uninitialized kernel data in SCLP
> report
>     977dac6cc5531 s390/ctcm: Prevent XID null dereference
>     ccc28e498ef1c page_pool: keep frag_offset aligned for odd-sized
> requests
>     5a7ee52589dae sctp: validate chunk length in the inqueue parser
>     6abd93d01b0f4 tipc: protect node reset trace dump with node lock
>     e84bfb0801649 xfs: fix capability check in xfs
>     23e7fbbdca5aa net/iucv: fix the recvmsg window update
>     b090c321f203d dm-ebs: fix incorrect device offset check in ebs_ctr()
>     056bf8322e39a dm-crypt: fix a tiny race condition in crypt_dec_pendin=
g
>     8433fd005c25f dm cache: fix issue with background work locking
>     495ef656f965f dm cache: fix demotion stats in passthrough mode
>     f88339e197ea9 cgroup: fix spurious SIGKILL of CLONE_INTO_CGROUP
> children
>     8d5fc9e6dc091 tcp: fix use-after-free in do_tcp_getsockopt(TCP_CC_INF=
O)
>     4b0930d66dde0 tcp: fix use-after-free in
> do_tcp_getsockopt(TCP_CONGESTION)
>     dda5245afc347 wifi: p54: validate firmware record lengths
>     ab320f6aa3769 tracing: Fix hist trigger timestamps for buffered event=
s
>     e8cfcd7e60eaa tracing: Do not initialize tracefs work if tracing is
> disabled
>     c43c41ec62ca5 tracing: Check operator stack capacity before pushing
>     16d51e3ca46af tracing: Fix the shift out of bounds in the log2
> histogram modifier
>     f9c0b333a5e44 drm/amdgpu: don't drop the runtime PM reference twice i=
n
> amdgpu_gpr
>     13c3cbfd0d1c8 drm/amdgpu/sdma3: Work around POLL_REGMEM / FENCE hang
>     77134cf996bab scsi: libiscsi: Validate the task named by a management
> response
>     ebb8c5ef2aabf scsi: libiscsi: Validate the ITT reflected in a Reject
> PDU
>     6200fb2de579f scsi: libiscsi: Reject a negative task index from
> parse_pdu_itt
>     e397d4da76bed scsi: xen/scsifront: Check for a NULL shadow entry on a
> backend response
>     995350c4f4097 perf: Update cgroup time when rotating multiplexed even=
ts
>     fb13353f0761d i2c: qcom-cci: Fix HALT_ACK reset request being dropped
>     7e0d05a6234a9 tracing/histograms: Reject non-stacktrace fields for
> synthetic stacktrace fields
>     6440608024b00 tools: gpio: fix building from the top level with O=3D
>     994694a2d4611 sctp: revalidate output stream after association connec=
t
> wait
>     1fccfbc553a63 pinctrl: amd: Clear S4 wake bits when firmware has _AEI
>     a2fde862b98db net: rds: fix uninitialized trans dereference in CM
> event handler
>     fde33eb9955d8 net/sched: fix use-after-free in __tcf_action_put()
>     5819018dc29fb eventfs: Free the eventfs_inode after an rcu grace
> period too
>     d28a460a22372 fsnotify: prevent mark additions during connector
> teardown
>     6a36b05fc5b3d KVM: nVMX: Reset MMU back to the root MMU if loading L2
> state fails for !VM-Entry
>     5d7687b0b7160 unicode: free the map after a grace period
>     35c2c4f3cf140 autofs: ignore notification errors from a replaced pipe
>     3caf006eb731e perf: Fix perf_pmu_migrate_context() leaving events
> behind
>     b5148fad7f9f6 gpio: mxc: fix wakeup_pads bit operations
>     5982563c56cad gpio: mxc: use BIT() macro
>     15c0dd095d19d gpio: mxc: fix both_edges bit operations
>     1b5c5ae021815 gpio: mxc: use lock guards for the generic GPIO chip lo=
ck
>     e29d0a00c619a calipso: keep BIG TCP payload_len in
> calipso_skbuff_setattr()
>     2ef0ce6c84470 net/ipv6: Introduce payload_len helpers
>     e5aa07c62e4fd net: bcmgenet: unshare the skb before writing the
> control block
>     41a2f69f091b0 netlink: avoid hashing the network namespace pointer
>     6078a5369f9e8 scsi: libsas: Fix SMP IO deadlock during HA resume
>     219aee17dd023 tracing: probes: error if BTF is required but unavailab=
le
>     94be790dd6fbe pipe: preserve existing fasync readers on writer setup
> failure
>     14d8fdf03fb71 samples: pidfd: fix userprogs typo
>     403669041cb77 ocfs2/dlm: Protect the recovery list during debugfs rea=
ds
>     57b6ebcc83afb scsi: target: iscsi: Fix race in discovery auth updates
>     d2c2fb020eb97 scsi: st: Save the visited block for the partition the
> drive is in
>     9761f81707440 nios2: fix __wsum type degradation in csum_fold()
>     174c6a8735f42 spi: tegra114: assert CS GPIO for every transfer in a
> message
>     ea0e0fc4c72f7 netlink: reset skb headers before unicast and multicast
> filtering
>     847874bdbc7bf ASoC: nau8822: Fix the 128x oversampling switch bits
>     1ffc03f432bb7 ASoC: wm8978: Fix the 128x oversampling switch bits
>     07bbe910ccc72 ASoC: max98371: Fix the Speaker DHT Min Volume bits
>     ba5c27c9fa751 ASoC: pcm3168a: Fix the DAC zero flag polarity bit
>     12d589f384c4d ASoC: cs42l52: Fix the NG Type Switch bit
>     677c0e9cbb19a ASoC: cs42l56: Put the Limiter Cushion control on the
> limiter register
>     4827c986f16d9 ASoC: stm32: spdifrx: fix synchronization state check
>     41d5c47cf7949 ASoC: Intel: avs: Reset the stream unless it is already
> prepared
>     e677eda15df7d net/rds: don't let the rdma_cm destroy an id RDS still
> owns on route failure
>     deb972c7eea8d vsock: treat TCP_CLOSING as once-established
>     86ef8cec3e105 pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 o=
n
> gpio12
>     9ee4a57a9858a power: supply: generic-adc-battery: Fix temperature IIO
> channel conversion
>     2cba0c8a7b158 pinctrl: qcom: ipq5018: add missing pwm3 function on
> gpio13
>     2e5ffbf1e41ab Drivers: hv: Don't reset VMBus connection state on
> error/exit paths
>     f561392afb44a Drivers: hv: Avoid infinite retry loop in init_vp_index=
()
>     4643aead9c920 power: supply: ds2780: Fix ds2780_get_capacity()
> returning raw value
>     47469a5602b65 power: supply: Fix maintenance charge table kernel-doc
>     0db8fdcfad51c ext4: fallback to complex scan if aligned scan doesn't
> work
>     90a7876e83118 mptcp: move the OoO check back into
> __mptcp_try_fallback()
>     ee54f7b6cb4be blk-mq: reinsert cached request to the list
>     f122d9968d730 blk-mq: pop cached request if it is usable
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../recipes-kernel/linux/linux-yocto_6.6.bbappend    | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> index dc079a8cd8..e36886aea0 100644
> --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> @@ -12,10 +12,10 @@ KMACHINE:genericx86 ?=3D "common-pc"
>  KMACHINE:genericx86-64 ?=3D "common-pc-64"
>  KMACHINE:beaglebone-yocto ?=3D "beaglebone"
>
> -SRCREV_machine:genericx86 ?=3D "8f55e2a3b837190130b37f52b906396739b6ac24=
"
> -SRCREV_machine:genericx86-64 ?=3D "8f55e2a3b837190130b37f52b906396739b6a=
c24"
> -SRCREV_machine:beaglebone-yocto ?=3D
> "0f0eb060f0536344a77c54833ee722a91cce1193"
> +SRCREV_machine:genericx86 ?=3D "3ad693476cb4cc113480e15b2ae7da1e432b5262=
"
> +SRCREV_machine:genericx86-64 ?=3D "3ad693476cb4cc113480e15b2ae7da1e432b5=
262"
> +SRCREV_machine:beaglebone-yocto ?=3D
> "8919dd56bc1ff6df60d7fec34b03ea95857a3148"
>
> -LINUX_VERSION:genericx86 =3D "6.6.160"
> -LINUX_VERSION:genericx86-64 =3D "6.6.160"
> -LINUX_VERSION:beaglebone-yocto =3D "6.6.160"
> +LINUX_VERSION:genericx86 =3D "6.6.162"
> +LINUX_VERSION:genericx86-64 =3D "6.6.162"
> +LINUX_VERSION:beaglebone-yocto =3D "6.6.162"
> --
> 2.43.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000c6eb606609a3ead
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Ign=
ore this! wrong patch sent!</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 19, 2026 at 12:13=E2=80=AFA=
M &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
Updating linux-yocto/6.6 to the latest korg -stable release that comprises<=
br>
the following commits:<br>
<br>
=C2=A0 =C2=A0 5139929c698c2 Linux 6.6.162<br>
=C2=A0 =C2=A0 fe9ead8c5bdb7 xen-blkback: Avoid UAF when reading I/O statist=
ics<br>
=C2=A0 =C2=A0 0d515c409033c xen-netback: defer xenvif_mcast_addr_list_free(=
)<br>
=C2=A0 =C2=A0 89e534265b62c xen-netback: Fix UAF when reading statistics da=
ta<br>
=C2=A0 =C2=A0 b5a1dc3ad4822 Linux 6.6.161<br>
=C2=A0 =C2=A0 9ab0324f4868e pid_namespace: prevent TIF_NOTIFY_SIGNAL from i=
nterrupting the reaper<br>
=C2=A0 =C2=A0 9fdbfd1a15a3e signal: allow taks to temporarily block TIF_NOT=
IFY_SIGNAL<br>
=C2=A0 =C2=A0 4d1fdb850d016 ptrace: refuse to change the signal mask of a u=
ser worker<br>
=C2=A0 =C2=A0 ec2c8af51ccd5 signal: only SIGKILL and the freezers interrupt=
 a coredumping task<br>
=C2=A0 =C2=A0 105ca21eb3356 signal: don&#39;t retarget shared signals in a =
dying thread group<br>
=C2=A0 =C2=A0 71146c437bae5 coredump: hold RCU while releasing parked threa=
ds<br>
=C2=A0 =C2=A0 0e5ff07be834a ftrace: Initialize modname and offset in print_=
rec()<br>
=C2=A0 =C2=A0 7f0728ba89624 asymmetric_keys: reject trust keys without IDs<=
br>
=C2=A0 =C2=A0 234d09bb3b3d8 keys/trusted_keys: return immediately after TPM=
 unseal failure<br>
=C2=A0 =C2=A0 c77401946b5bf KEYS: trusted: Fix blob allocation size in tpm2=
_key_decode()<br>
=C2=A0 =C2=A0 19dfc37c9deef KEYS: Fix key_reject_and_link() race with keyri=
ng restriction<br>
=C2=A0 =C2=A0 ff44f1b303aa7 keys: Protect the read method check against typ=
e removal<br>
=C2=A0 =C2=A0 8451d4a4c4312 keys: make keyring indexes independent of kerne=
l addresses<br>
=C2=A0 =C2=A0 dddd3a1ab7d12 keys: Protect the type name while describing a =
key<br>
=C2=A0 =C2=A0 26949c2e4c461 keys: Check the authorization payload in proces=
s keyring searches<br>
=C2=A0 =C2=A0 aa03c8fb4334f keys: Avoid the owner account dereference in na=
med keyring lookup<br>
=C2=A0 =C2=A0 89f0290fc2856 io_uring/poll: don&#39;t loop on HUP with multi=
ple references<br>
=C2=A0 =C2=A0 68cd06ba918d9 io_uring/timeout: don&#39;t lose a cancel as io=
-wq arms a timeout<br>
=C2=A0 =C2=A0 838475965e5e3 io_uring/timeout: don&#39;t flush with the sequ=
ence behind the last flush<br>
=C2=A0 =C2=A0 ee081d232e8f6 io_uring/timeout: don&#39;t put a sequence targ=
et behind the last flush<br>
=C2=A0 =C2=A0 41fae2e9e1fa3 io_uring/poll: avoid retry wakeup loss when dro=
pping ownership<br>
=C2=A0 =C2=A0 c276be0c83ee0 io_uring: look up the file before queueing to i=
o-wq<br>
=C2=A0 =C2=A0 c614af6826ca2 io_uring/timeout: no ABS update of multishot ti=
meouts<br>
=C2=A0 =C2=A0 ec267cd430ee4 io_uring: don&#39;t pass restart error codes to=
 userspace<br>
=C2=A0 =C2=A0 9786f24078e30 io_uring/sqpoll: let the thread sleep on disabl=
ed rings<br>
=C2=A0 =C2=A0 f592e45df49c9 io_uring/timeout: keep repeat count on multisho=
t update<br>
=C2=A0 =C2=A0 93947570afbb9 io_uring/timeout: don&#39;t skip over reached s=
equences<br>
=C2=A0 =C2=A0 07aa50be5eee5 io_uring/poll: drop stale double poll entry on =
rearm<br>
=C2=A0 =C2=A0 9f59721eddabc io_uring/wait: look at all CQ waiters on wake u=
p<br>
=C2=A0 =C2=A0 9bb28e7740ce7 io_uring: wake ring pollers for local task_work=
<br>
=C2=A0 =C2=A0 b23306ea31a0b io_uring/cancel: let CANCEL_ALL find parked req=
uests<br>
=C2=A0 =C2=A0 b22a4cdc0a90c io_uring/cancel: don&#39;t default to setting r=
eq-&gt;work.cancel_seq<br>
=C2=A0 =C2=A0 8a9aa27d23e8d io_uring/cancel: recognize &quot;no timeout&quo=
t; on 32-bit<br>
=C2=A0 =C2=A0 96aaafd7baa54 io_uring/cancel: don&#39;t forget that the work=
 was running<br>
=C2=A0 =C2=A0 39a503e0981c0 io_uring/poll: don&#39;t lose a cancel as io-wq=
 arms poll<br>
=C2=A0 =C2=A0 8408964c14e53 io_uring/io-wq: let cancel find picked up hashe=
d work<br>
=C2=A0 =C2=A0 b2cfc9fa4ec05 io_uring/io-wq: don&#39;t exit with a creation =
pending<br>
=C2=A0 =C2=A0 d2a824548aeda io_uring/io-wq: don&#39;t strand work when a wo=
rker exits<br>
=C2=A0 =C2=A0 2c75ebae8a7f0 io_uring: don&#39;t flood a cancelling task wit=
h task_work<br>
=C2=A0 =C2=A0 d39ebc7a583d6 io_uring/io-wq: don&#39;t hide a link from canc=
ellations<br>
=C2=A0 =C2=A0 08c42055b8f9a io_uring/io-wq: don&#39;t lose the signal that =
ends work<br>
=C2=A0 =C2=A0 bf1d2ed84b316 io_uring/wait: don&#39;t spin on a stuck overfl=
ow list<br>
=C2=A0 =C2=A0 1432d881d9958 io-wq: order the exit bit against worker creati=
on task work<br>
=C2=A0 =C2=A0 4472579bd1c83 tracing/histograms: Verify event_call identity =
when updating synth_event refcount<br>
=C2=A0 =C2=A0 584701bf9b7a0 tracing: Fix 64-bit and signed histogram fields=
 on 32-bit kernels<br>
=C2=A0 =C2=A0 aae0ccd7326ee tracing: Unregister field variable histograms w=
hen the command fails<br>
=C2=A0 =C2=A0 8b307d64a6054 tracing: Save the event file instead of the com=
patible histogram<br>
=C2=A0 =C2=A0 b205ff58e0292 tracing: Reject incomplete event filter express=
ions<br>
=C2=A0 =C2=A0 fabaff1c59ff2 Bluetooth: L2CAP: refuse __l2cap_chan_add if ch=
an already has conn<br>
=C2=A0 =C2=A0 7aaaca01a3f8e net_sched: codel: fix stale state for empty flo=
ws in fq_codel<br>
=C2=A0 =C2=A0 95b887e3d4d7a Revert &quot;srcu: Use irq_work to start GP in =
tiny SRCU&quot;<br>
=C2=A0 =C2=A0 7192633a23d6b bonding: do not set usable_slaves for broadcast=
 mode<br>
=C2=A0 =C2=A0 863303ad4caac net: bonding: update the slave array for broadc=
ast mode<br>
=C2=A0 =C2=A0 83b2e511cf9ba xfs: don&#39;t hold buffer locks across sync tr=
ansaction commit in xfs_sync_sb_buf<br>
=C2=A0 =C2=A0 ad33433131ebc cifs: add revalidation on FSCTL failure in smb2=
_duplicate_extents()<br>
=C2=A0 =C2=A0 bbc154a7da4e0 dm-integrity: fix infinite loop on discard with=
 large tag size<br>
=C2=A0 =C2=A0 e265221019d20 drm/amdgpu: free the userptr ranges when a CS f=
ails after parser_bos<br>
=C2=A0 =C2=A0 4589ad76a6b10 drm/i915/dmc: Harden DMC firmware payload parsi=
ng<br>
=C2=A0 =C2=A0 0c133ed517000 futex: Fix mm reuse handling for FUT_OFF_MMSHAR=
ED<br>
=C2=A0 =C2=A0 9504c8b6644f3 i2c: viai2c-wmt: Fix clock leak in wmt_i2c_prob=
e()<br>
=C2=A0 =C2=A0 0254b2ffc6276 gtp: disable BH before calling udp_tunnel_xmit_=
skb()<br>
=C2=A0 =C2=A0 0cf0ff2f728f2 ipv4: udp: Create exceptions before socket matc=
hing<br>
=C2=A0 =C2=A0 f77fb90edca53 vsock/virtio: validate packet source for connec=
ted sockets<br>
=C2=A0 =C2=A0 64e196a6d7173 io_uring/cancel: don&#39;t spin on local work t=
he task can&#39;t run<br>
=C2=A0 =C2=A0 762ffd4a8daff dm-integrity: require stable writes for interna=
l hash modes<br>
=C2=A0 =C2=A0 f4fcbae8b2735 tracing: Keep the predicate limit separate from=
 program capacity<br>
=C2=A0 =C2=A0 ef9342fa74336 ASoC: SOF: ipc4-topology: Fix shift-out-of-boun=
ds for aggregated ALH capture<br>
=C2=A0 =C2=A0 e8dafad7de9ed pid_namespace: make zap_pid_ns_processes() free=
zable<br>
=C2=A0 =C2=A0 2358060edbc35 exit: move core of do_wait() into helper<br>
=C2=A0 =C2=A0 74b4d2370a9e2 drm/exec: don&#39;t immediately add prelocked o=
bj to array of locked objs<br>
=C2=A0 =C2=A0 913a1876fbe9a scsi: bsg: Pass reply_len to bsg_setup_queue() =
to fit UFS ARPMB replies<br>
=C2=A0 =C2=A0 b4b0598fad51a ext4: free the sbi after a grace period<br>
=C2=A0 =C2=A0 c39150784a801 ntfs3: free the sbi after a grace period<br>
=C2=A0 =C2=A0 da52e5fcb2cae watch_queue: Fix note pool publication race in =
watch_queue_set_size()<br>
=C2=A0 =C2=A0 5e1e8702f45d1 kernel/watch_queue: Use pipe_buf() to retrieve =
the pipe buffer<br>
=C2=A0 =C2=A0 cd7cd04be583b eventfs: fix SRCU read lock leak in eventfs_ite=
rate()<br>
=C2=A0 =C2=A0 c3b6aa73a895e perf: Track the perf mlock gift separately<br>
=C2=A0 =C2=A0 00ff1128123d4 scsi: st: Fix use-after-free race between st_re=
move() and st_open()<br>
=C2=A0 =C2=A0 98975a7172288 smb: client: fix multiuser mount with krb5<br>
=C2=A0 =C2=A0 68652afb9b9ad smb: client: fix heap overflow in cifs_do_set_a=
cl()<br>
=C2=A0 =C2=A0 cff9bf34afde4 net/sched: cls_flower: validate mask pointer af=
ter nla_next()<br>
=C2=A0 =C2=A0 1a35a81c302b3 ksmbd: zero the FS_OBJECT_ID_INFORMATION buffer=
 before filling it in<br>
=C2=A0 =C2=A0 e8b82184a1982 ksmbd: initialize FileSystemControlFlags in FS_=
CONTROL_INFORMATION<br>
=C2=A0 =C2=A0 da2ec27fdd7ef ksmbd: fill in FileSysIdentifier in FS_POSIX_IN=
FORMATION<br>
=C2=A0 =C2=A0 b0db9f4ff402b net: bridge: mcast: don&#39;t truncate the port=
 group walk on teardown<br>
=C2=A0 =C2=A0 9ca91638aa027 mm, madvise: fix potential workingset node list=
_lru leaks<br>
=C2=A0 =C2=A0 6273bfdeb248d KVM: x86/mmu: Preserve nested TDP shadow page t=
ables if they are used as roots<br>
=C2=A0 =C2=A0 25dbafda0e432 mm/huge_memory: initialise workingset state bef=
ore folio split<br>
=C2=A0 =C2=A0 6ae0cfcb74234 drm/amdgpu: Fix VCE 3 ring align_mask<br>
=C2=A0 =C2=A0 226a974054acb ipv4: avoid divide by zero in fib_rebalance<br>
=C2=A0 =C2=A0 ff31c34e921d1 s390/pci: Fix leak of uninitialized kernel data=
 in SCLP report<br>
=C2=A0 =C2=A0 977dac6cc5531 s390/ctcm: Prevent XID null dereference<br>
=C2=A0 =C2=A0 ccc28e498ef1c page_pool: keep frag_offset aligned for odd-siz=
ed requests<br>
=C2=A0 =C2=A0 5a7ee52589dae sctp: validate chunk length in the inqueue pars=
er<br>
=C2=A0 =C2=A0 6abd93d01b0f4 tipc: protect node reset trace dump with node l=
ock<br>
=C2=A0 =C2=A0 e84bfb0801649 xfs: fix capability check in xfs<br>
=C2=A0 =C2=A0 23e7fbbdca5aa net/iucv: fix the recvmsg window update<br>
=C2=A0 =C2=A0 b090c321f203d dm-ebs: fix incorrect device offset check in eb=
s_ctr()<br>
=C2=A0 =C2=A0 056bf8322e39a dm-crypt: fix a tiny race condition in crypt_de=
c_pending<br>
=C2=A0 =C2=A0 8433fd005c25f dm cache: fix issue with background work lockin=
g<br>
=C2=A0 =C2=A0 495ef656f965f dm cache: fix demotion stats in passthrough mod=
e<br>
=C2=A0 =C2=A0 f88339e197ea9 cgroup: fix spurious SIGKILL of CLONE_INTO_CGRO=
UP children<br>
=C2=A0 =C2=A0 8d5fc9e6dc091 tcp: fix use-after-free in do_tcp_getsockopt(TC=
P_CC_INFO)<br>
=C2=A0 =C2=A0 4b0930d66dde0 tcp: fix use-after-free in do_tcp_getsockopt(TC=
P_CONGESTION)<br>
=C2=A0 =C2=A0 dda5245afc347 wifi: p54: validate firmware record lengths<br>
=C2=A0 =C2=A0 ab320f6aa3769 tracing: Fix hist trigger timestamps for buffer=
ed events<br>
=C2=A0 =C2=A0 e8cfcd7e60eaa tracing: Do not initialize tracefs work if trac=
ing is disabled<br>
=C2=A0 =C2=A0 c43c41ec62ca5 tracing: Check operator stack capacity before p=
ushing<br>
=C2=A0 =C2=A0 16d51e3ca46af tracing: Fix the shift out of bounds in the log=
2 histogram modifier<br>
=C2=A0 =C2=A0 f9c0b333a5e44 drm/amdgpu: don&#39;t drop the runtime PM refer=
ence twice in amdgpu_gpr<br>
=C2=A0 =C2=A0 13c3cbfd0d1c8 drm/amdgpu/sdma3: Work around POLL_REGMEM / FEN=
CE hang<br>
=C2=A0 =C2=A0 77134cf996bab scsi: libiscsi: Validate the task named by a ma=
nagement response<br>
=C2=A0 =C2=A0 ebb8c5ef2aabf scsi: libiscsi: Validate the ITT reflected in a=
 Reject PDU<br>
=C2=A0 =C2=A0 6200fb2de579f scsi: libiscsi: Reject a negative task index fr=
om parse_pdu_itt<br>
=C2=A0 =C2=A0 e397d4da76bed scsi: xen/scsifront: Check for a NULL shadow en=
try on a backend response<br>
=C2=A0 =C2=A0 995350c4f4097 perf: Update cgroup time when rotating multiple=
xed events<br>
=C2=A0 =C2=A0 fb13353f0761d i2c: qcom-cci: Fix HALT_ACK reset request being=
 dropped<br>
=C2=A0 =C2=A0 7e0d05a6234a9 tracing/histograms: Reject non-stacktrace field=
s for synthetic stacktrace fields<br>
=C2=A0 =C2=A0 6440608024b00 tools: gpio: fix building from the top level wi=
th O=3D<br>
=C2=A0 =C2=A0 994694a2d4611 sctp: revalidate output stream after associatio=
n connect wait<br>
=C2=A0 =C2=A0 1fccfbc553a63 pinctrl: amd: Clear S4 wake bits when firmware =
has _AEI<br>
=C2=A0 =C2=A0 a2fde862b98db net: rds: fix uninitialized trans dereference i=
n CM event handler<br>
=C2=A0 =C2=A0 fde33eb9955d8 net/sched: fix use-after-free in __tcf_action_p=
ut()<br>
=C2=A0 =C2=A0 5819018dc29fb eventfs: Free the eventfs_inode after an rcu gr=
ace period too<br>
=C2=A0 =C2=A0 d28a460a22372 fsnotify: prevent mark additions during connect=
or teardown<br>
=C2=A0 =C2=A0 6a36b05fc5b3d KVM: nVMX: Reset MMU back to the root MMU if lo=
ading L2 state fails for !VM-Entry<br>
=C2=A0 =C2=A0 5d7687b0b7160 unicode: free the map after a grace period<br>
=C2=A0 =C2=A0 35c2c4f3cf140 autofs: ignore notification errors from a repla=
ced pipe<br>
=C2=A0 =C2=A0 3caf006eb731e perf: Fix perf_pmu_migrate_context() leaving ev=
ents behind<br>
=C2=A0 =C2=A0 b5148fad7f9f6 gpio: mxc: fix wakeup_pads bit operations<br>
=C2=A0 =C2=A0 5982563c56cad gpio: mxc: use BIT() macro<br>
=C2=A0 =C2=A0 15c0dd095d19d gpio: mxc: fix both_edges bit operations<br>
=C2=A0 =C2=A0 1b5c5ae021815 gpio: mxc: use lock guards for the generic GPIO=
 chip lock<br>
=C2=A0 =C2=A0 e29d0a00c619a calipso: keep BIG TCP payload_len in calipso_sk=
buff_setattr()<br>
=C2=A0 =C2=A0 2ef0ce6c84470 net/ipv6: Introduce payload_len helpers<br>
=C2=A0 =C2=A0 e5aa07c62e4fd net: bcmgenet: unshare the skb before writing t=
he control block<br>
=C2=A0 =C2=A0 41a2f69f091b0 netlink: avoid hashing the network namespace po=
inter<br>
=C2=A0 =C2=A0 6078a5369f9e8 scsi: libsas: Fix SMP IO deadlock during HA res=
ume<br>
=C2=A0 =C2=A0 219aee17dd023 tracing: probes: error if BTF is required but u=
navailable<br>
=C2=A0 =C2=A0 94be790dd6fbe pipe: preserve existing fasync readers on write=
r setup failure<br>
=C2=A0 =C2=A0 14d8fdf03fb71 samples: pidfd: fix userprogs typo<br>
=C2=A0 =C2=A0 403669041cb77 ocfs2/dlm: Protect the recovery list during deb=
ugfs reads<br>
=C2=A0 =C2=A0 57b6ebcc83afb scsi: target: iscsi: Fix race in discovery auth=
 updates<br>
=C2=A0 =C2=A0 d2c2fb020eb97 scsi: st: Save the visited block for the partit=
ion the drive is in<br>
=C2=A0 =C2=A0 9761f81707440 nios2: fix __wsum type degradation in csum_fold=
()<br>
=C2=A0 =C2=A0 174c6a8735f42 spi: tegra114: assert CS GPIO for every transfe=
r in a message<br>
=C2=A0 =C2=A0 ea0e0fc4c72f7 netlink: reset skb headers before unicast and m=
ulticast filtering<br>
=C2=A0 =C2=A0 847874bdbc7bf ASoC: nau8822: Fix the 128x oversampling switch=
 bits<br>
=C2=A0 =C2=A0 1ffc03f432bb7 ASoC: wm8978: Fix the 128x oversampling switch =
bits<br>
=C2=A0 =C2=A0 07bbe910ccc72 ASoC: max98371: Fix the Speaker DHT Min Volume =
bits<br>
=C2=A0 =C2=A0 ba5c27c9fa751 ASoC: pcm3168a: Fix the DAC zero flag polarity =
bit<br>
=C2=A0 =C2=A0 12d589f384c4d ASoC: cs42l52: Fix the NG Type Switch bit<br>
=C2=A0 =C2=A0 677c0e9cbb19a ASoC: cs42l56: Put the Limiter Cushion control =
on the limiter register<br>
=C2=A0 =C2=A0 4827c986f16d9 ASoC: stm32: spdifrx: fix synchronization state=
 check<br>
=C2=A0 =C2=A0 41d5c47cf7949 ASoC: Intel: avs: Reset the stream unless it is=
 already prepared<br>
=C2=A0 =C2=A0 e677eda15df7d net/rds: don&#39;t let the rdma_cm destroy an i=
d RDS still owns on route failure<br>
=C2=A0 =C2=A0 deb972c7eea8d vsock: treat TCP_CLOSING as once-established<br=
>
=C2=A0 =C2=A0 86ef8cec3e105 pinctrl: qcom: ipq5018: replace gcc_plltest wit=
h pwm2 on gpio12<br>
=C2=A0 =C2=A0 9ee4a57a9858a power: supply: generic-adc-battery: Fix tempera=
ture IIO channel conversion<br>
=C2=A0 =C2=A0 2cba0c8a7b158 pinctrl: qcom: ipq5018: add missing pwm3 functi=
on on gpio13<br>
=C2=A0 =C2=A0 2e5ffbf1e41ab Drivers: hv: Don&#39;t reset VMBus connection s=
tate on error/exit paths<br>
=C2=A0 =C2=A0 f561392afb44a Drivers: hv: Avoid infinite retry loop in init_=
vp_index()<br>
=C2=A0 =C2=A0 4643aead9c920 power: supply: ds2780: Fix ds2780_get_capacity(=
) returning raw value<br>
=C2=A0 =C2=A0 47469a5602b65 power: supply: Fix maintenance charge table ker=
nel-doc<br>
=C2=A0 =C2=A0 0db8fdcfad51c ext4: fallback to complex scan if aligned scan =
doesn&#39;t work<br>
=C2=A0 =C2=A0 90a7876e83118 mptcp: move the OoO check back into __mptcp_try=
_fallback()<br>
=C2=A0 =C2=A0 ee54f7b6cb4be blk-mq: reinsert cached request to the list<br>
=C2=A0 =C2=A0 f122d9968d730 blk-mq: pop cached request if it is usable<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-kernel/linux/linux-yocto_6.6.bbappend=C2=A0 =C2=A0 | 12 +=
+++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend b=
/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend<br>
index dc079a8cd8..e36886aea0 100644<br>
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend<br>
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend<br>
@@ -12,10 +12,10 @@ KMACHINE:genericx86 ?=3D &quot;common-pc&quot;<br>
=C2=A0KMACHINE:genericx86-64 ?=3D &quot;common-pc-64&quot;<br>
=C2=A0KMACHINE:beaglebone-yocto ?=3D &quot;beaglebone&quot;<br>
<br>
-SRCREV_machine:genericx86 ?=3D &quot;8f55e2a3b837190130b37f52b906396739b6a=
c24&quot;<br>
-SRCREV_machine:genericx86-64 ?=3D &quot;8f55e2a3b837190130b37f52b906396739=
b6ac24&quot;<br>
-SRCREV_machine:beaglebone-yocto ?=3D &quot;0f0eb060f0536344a77c54833ee722a=
91cce1193&quot;<br>
+SRCREV_machine:genericx86 ?=3D &quot;3ad693476cb4cc113480e15b2ae7da1e432b5=
262&quot;<br>
+SRCREV_machine:genericx86-64 ?=3D &quot;3ad693476cb4cc113480e15b2ae7da1e43=
2b5262&quot;<br>
+SRCREV_machine:beaglebone-yocto ?=3D &quot;8919dd56bc1ff6df60d7fec34b03ea9=
5857a3148&quot;<br>
<br>
-LINUX_VERSION:genericx86 =3D &quot;6.6.160&quot;<br>
-LINUX_VERSION:genericx86-64 =3D &quot;6.6.160&quot;<br>
-LINUX_VERSION:beaglebone-yocto =3D &quot;6.6.160&quot;<br>
+LINUX_VERSION:genericx86 =3D &quot;6.6.162&quot;<br>
+LINUX_VERSION:genericx86-64 =3D &quot;6.6.162&quot;<br>
+LINUX_VERSION:beaglebone-yocto =3D &quot;6.6.162&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000000c6eb606609a3ead--
