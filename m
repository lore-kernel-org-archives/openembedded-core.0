Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B038CA5533
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:43:44 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.7825.1694598218112403278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="131778411"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="131778411"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:43:35 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EB87D3EA9
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:43:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DAC10CF7C4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:43:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 02049200501AE;
	Wed, 13 Sep 2023 18:43:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.16.04 -> 0.16.05
Date: Wed, 13 Sep 2023 17:43:14 +0800
Message-Id: <1694598194-21987-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--21.801700-10.000000
X-TMASE-MatchedRID: xHArK2ENf+2jz0nOeth/yUIIxwDaU5mrmVsWc6VNam8rfoFYrvlA5ALE
	vL7Co6I9Ks4v28+zpclO+o7Dw7WB4S8oE1Ngob6lJmbrB1j4XwoEa8g1x8eqF3iz+9SmHO6KBuh
	MNLfO6UC3IAm6OhmFjeVc0ygAIzoN/r2K6wdIm99pkjCmkW/E+zZlY6a4lRLZztl6Ba1N2TrToh
	hY3qi5AuDXnK5Pe6No6Pjqs72sKn5OBjuTIREKLbqQyAveNtg6a9qiaDSLgo10Vj5gY98rDA02W
	udRpRshWtICjWWbSUmS1Ao71T65NUSOI5itQ0ipxDiakrJ+Spl7tnRTJA7lM0JsNXD374+phQ6Y
	ZNvnIb9AgwdjT8rC/hoIjHA5kUhgg83KSLkgRGUrUvpNWR2DO9iPDVCot+tGLEzDQUyQGVkxfpG
	UY2S5wjf3LjDSfF326Ob2SHdPNr7eKCGV1QWomp13aYUE0ivycV3n4J/0zUOeKexxYcO4yJLNqQ
	IZnj7hcYa4XeQtems3iyvgfZpVZ6k5+6tQ+lSgn6y0mNkW0aSW0X7Fb7OFSHYASZIZpoawkl2C8
	uys43xUJQfmdfrC+30LeewmFFo+S27AvgeJoNAapIb9znReA9XLiEcLf+DIKxnRjlf7+WtE++L/
	YhMD7Z1OZMVb59dLbjzm6kCK7fPm6Kwuq5YazNfeP+V/VXwsbiVzMTheSbBX5bL9foRcMOgUeRF
	B4mcJgcjNRBg0IxiY2UnY8YSSrQgZdhNSUCgfuce7gFxhKa1AN4ki4eRl0s9anVQrvNX3Es/HfH
	RrWc456UleuofCzbDft91/XBmujoR5DwlwBUeeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8jpP8tMO
	yYmaA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187578

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-stress-vnni: verify if selected method supports intrinsic in intrisinc mode
-Manual: Indent stressors to ease man page reading
-stress-ng: Fix text of license in stress-sleep.c
-stress-pty: don't treat EINTR as failure when tcdrain is interrupted
-core-asm-generic: reintroduce HAVE_ASM_NOP check
-Makefile: bump version
-Makefile: add missing core-time.h from headers
-Makefile: remove snap from make dist rule
-stress-touch: fix missing help args for --touch-method and --touch-opts
-stress-ng: fix missing arg for --timer-slack help
-stress-stream: fix --stream-index help, missing arg
-stress-ring-pipe: fix help, missing args for --ring-pipe-num and
---ring-pipe-size
-stress-mremap: fix type in mremap-mlock help
-stress-module: use settings names and variable names that match
-boolean args
-core-opts: module-no-modver and module-no-vermag are argless, fix these
-stress-ng: fix --max-fd help, needs arg N
-stress-dirmany: fix --dirmany-bytes option in help
-stress-cache: fix help for cacheline writeback should be --cache-clwb
-stress-affinity: add missing numeric arg in --affinity-sleep option
-help
-stress-llc-affinity: Fix spelling mistake "memiry" -> "memory"
-Makefile: restore verify-test-all to 5 secs per stressor
-stress-misaligned: double the timeout time for very heavily loaded
-systems
-stress-cpu-online: fix nixos build error, missing semicolon
-stress-kvm: skip stressor if /dev/kvm is already in use
-Makefile: ignore warning return values in regression tests
-stress-syscall: Add BSD rfork() system call
-README.md: add another kernel reference
-stress-mlock: only show munlock metrics if they are available
-core-opts: fix disabled --perf option
-Add map_shadow_stack to TODO list
-stress-enosys: add map_shadow_stack
-stress-dev: only use stress_dev_hid_linux if HAVE_LINUX_HIDRAW_H is
-defined
-stress-ng.h: define _RENTRANT for sun builds for threading
-test/test-builtin-bitreverse: don't use random() to remove OpenBSD warnings
-tests: don't use random() to remove OpenBSD warnings
-core-cpu-cache: cast uint32 values to uint64_t before multiply
-stress-sigbus: unconstify ptr8, clean up pedantic warnings:
-core-helper: stress_write_buffer: use void * for ptr rather than char *
-core-setting: fix const warning with pedantic builds
-core-sort: fix const warning with pedantic builds
-stress-icache: make function stress_icache_func static
-stress-zero.c: only declare mmap_counter and mmap_index for linux builds
-stress-softlockup: reduce scope of variables t and d
-stress-icache: reduce scope of variable val
-stress-fma: fix return type of stress_fma_rnd_float to float
-core-builtin: ensure shim_sqrtl returns long double
-stress-bad-ioctl: constify pointers
-stress-bad-ioctl: reduce scope of variables type, nr and ret
-stress-aiol: cast result of multiply to same type as offset
-core-cpu-cache: make cache_size match the same type as
-cpu->caches[i].size
-stress-af-alg: constify pointer ptr
-core-shim: shim_posix_fallocate: reduce scope of variable ret
-core-numa: stress_parse_node: constify pointer str
-core-affinity: stress_parse_cpu: constify pointer str
-core-setting: remove unused field uintptr_t from struct
-core-interrupts: change scope of pointer ptr
-stress-watchdog: re-work code to remove need for watchdog_close label
-Makefile: force vnni to be built with at least -O2
-stress-vnni: move scope of variable to inside loop
-stress-far-branch: clean false positive gcc warning by initializing ptr
-stress-bad-altstack: make variable rnd non-clobberable
-Add --interrupts option to enable interrupt accounting
-core-interrupts: parse /proc/interrupts once for all types
-README.md: add another paper citation
-README.md: add two more kernel issues found with stress-ng
-stress-enosys: add fchmodat2
-stress-syscall: add fchmodat2
-test-chmod: add fchmodat2 Linux 6.6 call and shim, add fchmodat shim
-core-opts.h: move PR_OPT option macros to core-opts.h
-core-opts: move gnu long options into core-opts.c
-stress-prctl: add build check for new prctl macros
-stress-prctl: exercise PR_RISCV_V_{GET|SET}_CONTROL
-stress-prctl: add PR_GET_AUXV
-README.md: add another kernel issue found using stress-ng
-stess-schedmix: reduce scope of variable policy and remove initialisation
-test/test-vfork.c: replace exit with _exit
-stress-jpeg: stress_rgb_compress_to_jpeg: ensure duration is
-initialized to zero
-stress-dev: add lseek + read on /dev/nvram, voidify some args to /dev/hid
-stress-dev: exercise linux /dev/hid ioctls
-stress-dev: exercise linux /dev/acpi_thermal_rel ioctls
-stress-ng.h: rename PR_* macros to OPT_FLAGS_PR_*
-core-thermal-zone.h: move perf related structs and defines to core-thermal-zone.h
-core-perf.h: move perf related structs and defines to core-perf.h
-stress-ng.h: remove unused typedef stress_func_t
-README.md: add Anisse Astier to contributors list
-Manual: rename AF_ALG stressor title
-stress-netdev: exercise invalid lengths in ifr_ifindex and ifc_len
-core-helper.h: move stress_align_stack into core-helper.h
-core-time: move function prototypes to core-time.h
-move stress_pagein_self definition to core-thrash.h
-core-helper.h: move stress_warn_once from stress-ng.h to core-helper.h
-stress-ng.h: remove unused legacy function declarations
-core-helper: move stress_sigchld_set_handler from stress-ng.c to core-helper.c
-include core-killpid.h for stress_killpid definition
-stress-ng.h: remove stress_killpid, it is in core-kill.h
-stress-ng.h: remove stress_clean_dir
-core-helper: move stress_clean_dir and helpers to core-helper.c
-core-helper: rename pr_* helper functions to stress_*
-Makefile: add core-shim.h to headers
-core-helper: move function prototypes and macros to core-helper.h
-core-shim: move function prototypes and typedefs to core-shim.h
-Remove snapcraft yaml file
-core-helper: provide non BSD no-op variants of getsysctl functions
-stress-sock: enable --sock-msgs option, set default from 1 to 1000 messages
-stress-sock: remove need to assign recvfunc pointer for every send
-Manual: clarify support for --vmstat option
-Manual: add --metrics RSS description
-stress-dccp: add --dccp-msgs option, set default from 16 to 10000 messages
-README.md: add some more citiations
-Manual: minor stressor description tweaks
-Manual: minor corrections
-Manual: re-adjust first option after each stressor heading using .TQ
-stress-ng: make --metrics brief dump just bogo-ops metrics, more metrics with --metrics option
-stress-null: add --null-write for write only null benchmarking
-core-shared-heap: move function prototypes to core-shared-heap.h
-core-processes: move function prototypes to core-processes.h
-core-sched: remove unused function stress_set_deadline_sched
-core-sched: move function prototypes to core-sched.h
-Makefile: add missing core-limit.h
-stress-ng.h: replace lock declarations with include of core-lock.h
-core-mwc: move function prototypes to core-mwc.h
-core-log: move function prototypes to core-log.h
-core-setting: move function prototypes to core-setting.h
-core-: add missing extern and missing inclusion of header in corec
-Add core-attribute.h and core-parse-opts.h
-core-out-of-memory: move function prototypes to core-out-of-memory.h
-core-lock: move function prototypes to core-lock.h
-core-limit: move function prototypes to core-limit.h
-core-job: move function prototypes to core-job.h
-core-vmstat: move function prototypes to core-vmstat.h
-core-try-open: move function prototypes to core-try-open.h
-core-numa: move function prototypes to core-numa.h
-core-mounts: move function prototypes to core-mounts.h
-Makefile: add two missing header files
-core-mmap: move function prototypes to core-mmap.h
-core-mlock: move function prototypes to core-mlock.h
-core-mincore: move function prototypes to core-mincore.h
-core-madvise: move function prototypes to core-madvise.h
-core-klog: move function prototypes to core-klog.h
-core-killpid: move function prototypes to core-killpid.h
-core-io-priority: move function prototypes to core-io-priority.h
-core-interrupts: move function prototypes to core-interrupts.h
-core-ignite-cpu: move function prototypes to core-ignite-cpu.h
-core-cpuidle: move stress_log_cpuidle_info to core-cpuidle.h
-core-affinity: move function prototypes to core-affinity.h
-stress-ng: stress_class_info_t: constify class
-stress-ng: stress_verifiable_mode: constify mode arg
-stress-ng: move stress_kill_stressors to remove need for forward declaration
-stress-ng: rename some variables, add some inlining
-stress-ng: rename classes to stress_classes
-stress-ng.h: minor clean-ups
-stress-ng.h: move some compiler specific #define's
-core-opts: move long option enum into core-opts.h
-stress-ng: fix spelling mistake in --oom-avoid message
-README.md: update list of contributors
-Manual: minor indention fixup for some hdd stressor options
-stress-ng.h: use STATX definitions for SHIM'd macros if they exist
-stress-ng.h: some minor #define and comment clean-ups
-stress-ng.h: remove old legacy HDD flags and fix starting bit for OPT_FLAGS_METRICS
-stress-ng.h: annotate the bit flags for the option flags
-stress-ng.h: remove g_caught_signal - it is no longer used
-stress-ng.h: remove g_opt_parallel from header, it's only used in stress-ng.c
-stress-ng.h: remove g_opt_sequential from header, it's only used in stress-ng.c
-stress-sem-sysv: skip stressor if semaphore can't be initialized early
-stress-zero: rate reduce the amount of mmap's in stressor loop
-stress-zero: add --zero-read option just to benchmark /dev/zero reads
-stress-dir: add directory renaming while exercising readdir
-stress-vecshuf: implement shuffle if __builtin_shuffle does not exist
-README.md: add two more research paper citations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.16.04.bb => stress-ng_0.16.05.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.16.04.bb => stress-ng_0.16.05.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.16.05.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.16.05.bb
index af8433975b..1a1e9e4057 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.16.05.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "95777d7cf32de9fc88c452a968ae2ae23ed269c2"
+SRCREV = "aea6f3306f4676a7f7e8d8c507f811ef3d0244c5"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1


