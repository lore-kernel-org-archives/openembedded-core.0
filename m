Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3749.1794864137243280412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Uw7EUgFk;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc3eb09dd2so1036811137.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864136; x=1795468936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nCjrIPteHqE2AkqOUCq1UCBEXXDX31pNEik2YUe0CE=;
        b=Uw7EUgFk+YshX60I/x7VT+E3wdSQki5H6z+BM1sBkAjYy5Waf8ruVW8DDqBji3dxiB
         Zh8ywi48ZGe83OSFwK24bCiZnea6fLsvIaDTbFdHVD+zwEx1nqm/k1HOcj4L/kDJbRsd
         InLvIp+AjjhdyK/AJ897vNoxe9QtvvP7y1Q7qFf5r3GL+cjpIsBNFI0qMfJnaxhNXDmI
         iDFKF9wJ+mgaP12vQ26oy0fgm+R7ua7shnwYq7IdC+fROTZabvzZkXPdSToK9ieoNSeM
         HH/aKxKMMNwghpFcpDIt6jLNELKs/M4Clrl3WSMvFCrDrZeF03Iz/fsk93nqRHCYHCxY
         h35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864136; x=1795468936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nCjrIPteHqE2AkqOUCq1UCBEXXDX31pNEik2YUe0CE=;
        b=Gj2q/uX38RZlzkcTsbLT0ZaYJHLLvsrjy8jgh0yjKLpxP16/9Pu0j0HIGh7NBDrWV7
         YvAzdAY7W2MKdF5PiXhCu++9nrGpUPLFfi8ivBH+rQcG3ChmzGWByFrSCNN93NiX71Sg
         0tX9CYuhLioqc4+JJkeVDMlx/5cg1BJdP7S/wPc7fv2Uh9xjkMonqtd9V6HHprWJkUCE
         xz0SCQIDZp5QQTnx5oR7H06CNhrUl4ulO1kDppqQIxqoKPSGos/fr0IuN9RxsGdnpIM+
         KzVLCQM80FVDomtx2czSSBrO4+kbvn1kX8Kdlhh/aa7U/mikWEK33YrzxeIhxkHTxs1a
         BLuw==
X-Gm-Message-State: APuU4Z8Sw2gdW5jdTHzeXnARp2O2cKjCvsHT1XcmWrCPAcUa6QcwLzGn
	1Ksgmaio2OPk7oOcmXfXFHzp0tEqK2ZBflQLK+C01ESvR6UHUHomm4Ty5dz3F8SBSlqp5A==
X-Gm-Gg: AYBFou2AhGEIDmdsgnPlalFx19Np+ckjKAZbeh/eB2fVs9ZFEiSq1izBJsXCyfECgMk
	+iUjCYDLRHs9foaaUuN8hqr0psUdCnX1g2kW//bkB/XVJQQ7SFWbthjLz9wBsH+KPHT+udjZL5w
	SRL4ga0KiJe2Yk0xosOJu1rJUig+I53sL4S/frgQ9FtMdpo/paKX9b61WYkrhhtsbtl/VbmiwDR
	tXIm6ZL7VlLLykNnx0owdC3YG/C++g73aQXv4MXaRlERJqVfEltj7PnGFbA2y4XIVEzwwYLpmIG
	YjYeHT1pzFt5SU6zAITmI32CC6Yh1Dl2OqX5O8e1VygEYOQi3UwKUo2GBiDhbl0REhgWbNjR1Zl
	k5N0tUUByhvrza7ZqEcEsmAKBMfvzHxXcCXBFn8cL+4eTItp9FnmWjkKWSKQhXShCAiECgm8GbK
	fHGO7x4xa9HjdbOdTPeT/sRRj2VtEH63l2TQMkAvuv8OYpTlWWHZKnDQNoPN+oImrVhARBUFcd1
	mxvchuu91qvwUyCKAYYBBq921kRFzsHp4GsTucnAOvwjcsbDNTANdMT+5Wi2GJuhwvJXP/cLVXa
	Wyb6ediknTdOyrNONXFRJrpWoFfxwjEjr4YxCUhHFdm6ZfLZm3B9EH+zRTJAcdcCdYIN/GgxseG
	qy59bOOXh6lnn3ATmiqqWl90shG7LQ8FgsDOcX9rk/WBQ6m0V7gc+GTjFYoysuqI503IAEe3Vtp
	ddHfFXFCSz6FF5leDoDuBFbvM3Q8ElhBDqlfAkTR1cI18=
X-Received: by 2002:a05:6102:5ccb:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d64db1d681mr3654375137.34.1794864135759;
        Mon, 16 Nov 2026 13:22:15 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e0c53a8sm896282137.11.2026.11.16.13.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][PATCH 02/05] linux-yocto/7.2: update to v7.2.15
Date: Mon, 16 Nov 2026 16:22:08 -0500
Message-ID: <20261116212211.4068570-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
References: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250383
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
 .../linux/linux-yocto-rt_7.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_7.2.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index 57c0c0bed0..3da45b7403 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ac271024979d3c7473f3222e7cf094c34a693865"
-SRCREV_meta ?= "b4b30a9da6e99401a3e93f63887030b4bcd6e8c0"
+SRCREV_machine ?= "d58784d4e77fa825c54f0f534169cdf5d4a72749"
+SRCREV_meta ?= "373cedc82c23ad70f86e132e5afd69f3e7bd9695"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "7.2.13"
+LINUX_VERSION ?= "7.2.15"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index 3764ed259b..58a3b2218e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_7.2.inc
 
-LINUX_VERSION ?= "7.2.13"
+LINUX_VERSION ?= "7.2.15"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
-SRCREV_meta ?= "b4b30a9da6e99401a3e93f63887030b4bcd6e8c0"
+SRCREV_machine ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
+SRCREV_meta ?= "373cedc82c23ad70f86e132e5afd69f3e7bd9695"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index 770d748a7e..d02e127ff4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "8fd75fc8ff0e240e41bcd79b6562a456af29eb58"
-SRCREV_machine:qemuarm64 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
-SRCREV_machine:qemuloongarch64 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_machine:qemuarm ?= "1aff202779bbfb6715a9083b1c62c3acdeb18e5d"
+SRCREV_machine:qemuarm64 ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
+SRCREV_machine:qemuloongarch64 ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
-SRCREV_machine:qemuriscv64 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
-SRCREV_machine:qemuriscv32 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
-SRCREV_machine:qemux86 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
-SRCREV_machine:qemux86-64 ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
+SRCREV_machine:qemuppc ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
+SRCREV_machine:qemuriscv64 ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
+SRCREV_machine:qemuriscv32 ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
+SRCREV_machine:qemux86 ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
+SRCREV_machine:qemux86-64 ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "8413fe29e671d5cd6816897d2615a910f4cc9f36"
-SRCREV_meta ?= "b4b30a9da6e99401a3e93f63887030b4bcd6e8c0"
+SRCREV_machine ?= "97931231e7da5ee013ddbeaf9aabeb7e0cbf7b5f"
+SRCREV_meta ?= "373cedc82c23ad70f86e132e5afd69f3e7bd9695"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3c172eede0d6b889ead876f45cc843070209208f"
+SRCREV_machine:class-devupstream ?= "497791a0a96b866d90add64041c47acdff49cae6"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v7.2/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "7.2.13"
+LINUX_VERSION ?= "7.2.15"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0

