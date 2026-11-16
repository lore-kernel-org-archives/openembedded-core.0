Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3739.1794864140834574760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LZDL5Hs/;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2da166818so3022850137.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864140; x=1795468940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmqQ5oyXcVUei3eK8Yi/8lwzmjKJQaHHf4lOXVmH3Pc=;
        b=LZDL5Hs/pgqnwlvVfmDdLljmsCVwh4bmLVCT58HkYhLXnM/0fo0+YwU0U1A/gumTTw
         mkh8BfBEG7g6n5shW0SYfuc7UoyR9y6GrglC5IutqwNCZGjma7EKxwfEDLmxeK9tMQFh
         hP5+qnGt12ZUyJHR3pOzfgXvH9QRaK0ckr1LX4ueIzQs7bOWxXEf3axECUoXI4jnHq0m
         3/jHt/whCeSjQ3WNYv0lzYF+CUBpjbnPDc0QC5drZ8TjtEQjHCtuaWhEFjMCog0kV/gQ
         lgTnZF3JFdArVyFVXfRq0hQpYkNwZPgvQZ2n7x1JWtl5IcfGN930xC3qaFhwzESljh1r
         7bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864140; x=1795468940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmqQ5oyXcVUei3eK8Yi/8lwzmjKJQaHHf4lOXVmH3Pc=;
        b=pkibJTAx71RYEoZYXjx4VxdxG0RI4/xxCb5qVkGaCwoQgt9ICtGI8bqeG5X0ZRsrgf
         PhD9enQ8k7O1AGly49sdt4lM9C+zyeKZ6fysDkYFQoUXvp0rphdWbs8YEPHJ/GWdtOhV
         2rTaAm/Z+d9v4feFURIroRY7zpYpAVwSdSpWPWxwo4krmdl95q6P8asG1xHWWtdR0pof
         +WtzNq0+exGfCpYPspKd8YVJ02J+B524S+4BO0Rk40vOhce7BEjvUQLJBhNQOY9cpQGY
         T9Q1pqpoC58Ey8pB4s4wR0vnmXTYWPYxSwYW4k0340XUaGECtgCOUiC2EVOsZGCPwwqx
         eANQ==
X-Gm-Message-State: APuU4Z+BtwvgRkftEmM+wqPqjqDXiCpkM6kDfQZuq57fCE1mHNoIDYEt
	vqYMIDiqNnFMEgyAXPPoYif5ozuzKB+lLV7mbyE6fFjBjjkgDKdkm8Vv2DKp3Vz+HAIAMg==
X-Gm-Gg: AYBFou23niSfFgC0xTZzVFpZWKmG0/VQZ5gduF1tmLoVIgM5pGeYuYHxM3jnuELAZMV
	+7uU0x8MBhAcB4DurxWuFMn6bpImYLo7VEZL02fMEB/MiOp+dQISqgaG6RXREpCYuMWXQ2UkwEw
	dXLaKcStGD8QvRGfl47lEquqE3axOdRWrRxiXHPBBh+Ypq/jpUc5NUQfKoCHiSax+tI/qFSB9m/
	o/3ZwXvFvv/sXzUaMQRBlqBd7BGR/OwFwmA/enZZh6SKM4pPGRp49CkGnJz+dMWQ31On9Olg/wB
	ypVCvjjNB9T+lHc+LahmCadmNqpGFeLZrL2z4VgWyhJW7AXo9bG+HxZMc4F2L6f7094Uw3VWU8L
	YVf3lrm3Ugtv0l01wgq4rvQ4pZ785xPElMLHr5Odru+hJh6kUj1u2hR6HvTVvNocYwWHHFUIX2I
	fnp2cqf1IARHLAtNQ3PyO+EOtmuLsPM7yXt5iD03ToXg/1agKf1lUDs1RSvrK8U1bruYVlrTCbG
	5BmV2ROA0bBBM2pstD3Rnio3y/F//J8MVHNbMyL6qAqIZAsLccyqPw3Xygszznf0waXeDnzJ720
	qRx59AgnEFeFWVMTyu7MflnoF/tEsEomMqtGX06TVj3B927kuLRonUoI/ABl9LleQcBnAJ+NDDI
	DtOP8Rx9orARY9tneOa/SdAOflmbMOXqCtr0TQQ3fWdeXwUKyV6pW8HKAC1frA3CTc4ZlaagtKK
	knH43ro+FPHuphKCPPYAkWeHqRT8Dr6HnIGZ49TFbmCWQ=
X-Received: by 2002:a05:6102:3714:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d64d840611mr4536612137.28.1794864139457;
        Mon, 16 Nov 2026 13:22:19 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e0c53a8sm896282137.11.2026.11.16.13.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto][PATCH 05/05] yocto-bsps: update to v7.2.15
Date: Mon, 16 Nov 2026 16:22:11 -0500
Message-ID: <20261116212211.4068570-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
References: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250386
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/7.2 to the latest korg -stable release that comprises
the following commits:

    497791a0a96b8 Linux 7.2.15
    53173c77df208 Bluetooth: forget a peer's RPA once it advertises its identity address
    d7d6ff98d5d1b net: skbuff: propagate shared-frag marker in skb_zerocopy()
    9dea2e237ffe2 fork: don't create io threads once PF_POSTCOREDUMP is set
    915fa76e22589 fork: move the coredump and exec checks into create_io_thread()
    be2156e8d61c7 exec: cancel io_uring requests before de_thread()
    00edc2319f19e kbuild: link-vmlinux.sh: improve detection of third pass requirement
    4c9c0235f8e45 platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
    8df7b995ebef4 iio: hid-sensor: als: scale each channel individually
    99d13ac9f46d7 smb: smbdirect: don't hand out already failed sockets in smbdirect_socket_accept()
    c13279523ed5d smb: smbdirect: release failed pending sockets of a listener
    e08d8c2a02275 smb: smbdirect: don't wait for RDMA_CM_EVENT_DISCONNECTED in smbdirect_socket_destroy_sync()
    aaf8a64a3fbf7 ksmbd: wait for negotiation before receiving another PDU
    e09610b541f27 Linux 7.2.14
    3d15ac36ce174 pid_namespace: prevent TIF_NOTIFY_SIGNAL from interrupting the reaper
    de4ce7a7e3ba2 coredump: prevent TIF_NOTIFY_SIGNAL from interrupting coredumps
    649c6e593ad62 signal: allow taks to temporarily block TIF_NOTIFY_SIGNAL
    0182428fb2ae8 exit: hang up the tty before closing the files
    14c7de6ca2393 fork: release the files of a failed fork after sched_cancel_fork()
    faa706f087f9a ptrace: refuse to change the signal mask of a user worker
    9599034284441 signal: only SIGKILL and the freezers interrupt a coredumping task
    7a6afc7fa9750 signal: don't retarget shared signals in a dying thread group
    a0f09ff4c6b93 coredump: hold RCU while releasing parked threads
    7271c064dd60d ftrace: Initialize modname and offset in print_rec()
    33a078f04e264 asymmetric_keys: reject trust keys without IDs
    63b19ec2863b2 keys/trusted_keys: return immediately after TPM unseal failure
    be761640fbf42 KEYS: trusted: Fix blob allocation size in tpm2_key_decode()
    6fc0c818b1cac KEYS: Fix key_reject_and_link() race with keyring restriction
    cf1af7df80e38 keys: Protect the read method check against type removal
    84f7c699f8d13 keys: make keyring indexes independent of kernel addresses
    dea367df18e3a keys: Protect the type name while describing a key
    b4dfda438fee3 keys: Check the authorization payload in process keyring searches
    5c6a9512887a6 keys: Avoid the owner account dereference in named keyring lookup
    72debb893a4bb io_uring: keep the drain active when a deferred drain request is started
    7be9e9d997e0d io_uring: end the drain when the drain request completes
    857aa2012b91c io_uring/waitid: prevent cancel reference wrap
    4bfec43cf844c io_uring/wait: wake real-time waiters from hard interrupt context
    6cc019eadf128 io_uring/net: keep recv buffer select length within MAX_RW_COUNT
    d379a8db88e5c io_uring/poll: don't loop on HUP with multiple references
    df705a274da10 io_uring/timeout: don't lose a cancel as io-wq arms a timeout
    9d5ba7e121dc8 io_uring/timeout: don't flush with the sequence behind the last flush
    db2cdb40d9f8f io_uring/timeout: don't put a sequence target behind the last flush
    eb2a50d8235e4 io_uring/poll: avoid retry wakeup loss when dropping ownership
    a01f35f52314a io_uring: look up the file before queueing to io-wq
    d402e2da23b89 io_uring/timeout: don't end a linked timeout with 1
    17a03003bdd76 io_uring/timeout: no ABS update of multishot timeouts
    97b8dc36ba3cb io_uring/net: don't retry recv on uncommitted buffers
    ee0bf68a63fe3 io_uring: don't pass restart error codes to userspace
    7299a32764ab8 io_uring/openclose: keep the lock in io_pipe_fixed()
    e3e19f7019847 io_uring/sqpoll: let the thread sleep on disabled rings
    21feda9465760 io_uring/kbuf: handle index wrap in last buffer check
    51f4ee29bf056 io_uring/zcrx: fix buffer offsets in areas above 4GB
    b779d47fdae80 io_uring/napi: don't busy poll past an expired timeout
    981621d6eadcd io_uring/napi: make stale entries time out after 60s
    c1c41f740888c io_uring/wait: no early -ETIME if min_wait finds work
    b0e0256dd45a5 io_uring/timeout: use the right clock for ABS updates
    ba1d5cf3c948c io_uring/timeout: keep repeat count on multishot update
    4f229e93dffe6 io_uring/timeout: don't skip over reached sequences
    40ce56dcf1a78 io_uring/fdinfo: fix CQE dump of CQE32 rings
    a3bc9b2e7b3c0 io_uring/register: keep 128b SQEs intact on resize
    4b7aaf3ce9d53 io_uring/register: handle index wrap when resizing
    37d8caedace34 io_uring/register: don't wrap 32b CQEs when resizing
    a08a28e125b34 io_uring: don't split 128b SQEs at the SQPOLL cap
    89f3d0dfef794 io_uring: drop the CQE cache if a refill fails
    27cee9c0f7789 io_uring/futex: allocate private hash before waiting
    34eef9b254f8c io_uring/poll: drop stale double poll entry on rearm
    4ce1acd224483 io_uring/wait: look at all CQ waiters on wake up
    92bfadcbe0a9a io_uring: wake ring pollers for local task_work
    11ca374f18cd4 io_uring/cancel: let CANCEL_ALL find parked requests
    8ed3d8d7d9ec6 io_uring/cancel: recognize "no timeout" on 32-bit
    a93aa29cbcbed io_uring/cancel: don't forget that the work was running
    6773939d93fa6 io_uring: don't lose a cancel as io-wq parks a request
    f1a2919e0d834 io_uring/poll: don't lose a cancel as io-wq arms poll
    300665d107478 io_uring/io-wq: let cancel find picked up hashed work
    50eb342b1c452 io_uring/io-wq: don't exit with a creation pending
    18bf64cb927aa io_uring/io-wq: don't strand work when a worker exits
    d0494e51aa02b io_uring/io-wq: don't go to sleep on pending work
    8c94677e2b614 io_uring/mpscq: disable preemption while pushing
    aaa06bb9fc033 io_uring/cancel: rearm local work wake up before sleep
    d29be0d1a6724 io_uring: don't lose the DEFER_TASKRUN wake up
    abdc57c7ebaba io_uring: don't flood a cancelling task with task_work
    92e20e9c72bdf io_uring/io-wq: don't hide a link from cancellations
    fdb771015c1e1 io_uring/io-wq: don't lose the signal that ends work
    c347691e5dc54 io_uring/wait: don't spin on a stuck overflow list
    685b494832003 io_uring/cmd: don't leave list poison in ->hash_node
    c10ad2813e151 io_uring/waitid: own the request before clearing ->head
    75395db7a9b40 io-wq: order the exit bit against worker creation task work
    e33e2718c62a6 tracing/syscalls: Use copy_from_user for the faultable syscall buffer
    5597bb8db6855 tracing/histograms: Verify event_call identity when updating synth_event refcount
    3ec17e0b23a84 tracing: Fix 64-bit and signed histogram fields on 32-bit kernels
    5afb9317e2eeb tracing: Unregister field variable histograms when the command fails
    9631dbccd3c64 tracing: Save the event file instead of the compatible histogram
    64993d970dde2 tracing: Reject incomplete event filter expressions
    d6d991afe775a tracing: Hold trace_types_lock when resetting last boot data from readers
    dab2bd4d67ad5 tracing: Hold trace_types_lock when updating modules in persistent instances
    00d90a21662fe tools/dma: fix building with O=
    73820561d8cbf Bluetooth: L2CAP: refuse __l2cap_chan_add if chan already has conn
    4e7f5dd22b5d9 sched/fair: Avoid overflow in place_entity()
    cc190c4073f57 mm/damon/core: error damos_commit_quota_goal() for zero target_value
    57c0d5281666d ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite()
    7dd1c2fec6ebd ntfs: fix race between fallocate and mmap reads
    cc2839946328c sched_ext: Wait for SCX_OPSS_DISPATCHING before moving tasks off DSQs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
index 4584b4b..0391fc7 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v7.2/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "278328a7e4f0b7d4ccaea67b55951e8b7551d166"
+SRCREV_machine:genericarm64 ?= "3eb27e40c7e336d43b8ca72188ed1d71bec1cd0e"
-- 
2.43.0

