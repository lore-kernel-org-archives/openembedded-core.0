Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6908EC47086
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.19046.1652634914042315138
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FqJKnG7m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180c8b789ee-2829067e-2063-4ef7-b17e-9000c5353f9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tUO+Za3c60DlqPeMOh1bYPpzHorcrmDmYPadvELJjBA=;
	b=FqJKnG7mtwL12nr+4Cr4q4xriq90Nal0wQQQiKc2UBR2ny9ZvES+hnCCv+faThGn
	/xq8dUX9mocXpIBuRT5qrJ05VITjCwjKlEqlmn8he3JeiAzB4dSUMIwtJDgqBXjATDF
	GJvYSh/rTMK7890wJoOpSiDE0pQ7x/+sqogldX4Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tUO+Za3c60DlqPeMOh1bYPpzHorcrmDmYPadvELJjBA=;
	b=FOJJr2I5rpNTcSwbc/qEUQcrKfExusYC3uR7WkguAEqLBiGvisPU7FkZvnvvfRvH
	sP2BDckqtAeHorchSTlij1jJjIm/tT9TUkFrHmn1p6fV3KQRGFW2R279x8TM2luT/aN
	/p50QzHoVEWfpHCr3QYBaxkkKJbzhvEgi26xEdd8=
Content-Type: multipart/mixed; boundary="===============3826823484086824490=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.14.01 SUCCEEDED
Message-ID: 
 <01010180c8b789ee-2829067e-2063-4ef7-b17e-9000c5353f9a-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165634

--===============3826823484086824490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.14.01* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.14.00-0.14.01.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3826823484086824490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master file://0001-Makefile-quote-CC.patch" to "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.14.00 [default] to 0.14.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.14.00 [default] to 0.14.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 6060452 to 6396228 (+6%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.14.00 [default] to 0.14.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.14.00 [default] to 0.14.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 60719 to 61265 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.14.00 [default] to 0.14.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.14.00 [default] to 0.14.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: FILELIST: removed "/usr/src/debug/stress-ng/0.14.00-r0/git/stress-copy-file.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-efivar.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sysbadaddr.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-mincore.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-ptrace.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vecwide.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-schedpolicy.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-iomix.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-ramfs.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-io-uring.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-ng.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-ioport.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rseq.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-memcpy.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-stream.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-bad-ioctl.c /usr/src/debug/stres
 s-ng/0.14.00-r0/git/stress-mlockmany.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-lockofd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dccp.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-procfs.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-msg.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-zero.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-shm-sysv.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-tsc.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-chown.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-inotify.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-readahead.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-tree.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-msync.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-hash.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-seek.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-exec.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-str.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-chdir.c /usr/src/debug/stress-n
 g/0.14.00-r0/git/core-cache.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-pkey.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-remap-file-pages.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-hash.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-chattr.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mmapfork.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mq.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-seal.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-tlb-shootdown.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mmapaddr.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-bigheap.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rdrand.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-resources.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-heapsort.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-revio.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-nop.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-bind-mount.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-cache.c /
 usr/src/debug/stress-ng/0.14.00-r0/git/stress-dynlib.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-mmap.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-cpu.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fork.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-lease.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-link.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-prctl.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigio.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-madvise.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-signal.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-bad-altstack.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-syncload.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-daemon.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigfpe.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-af-alg.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-oom-pipe.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-eventfd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-munma
 p.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-futex.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-session.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-list.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-binderfs.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-cyclic.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-stack.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sysinfo.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-seccomp.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-stackmmap.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-ignite-cpu.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-itimer.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-l1cache.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-inode-flags.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-udp-flood.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-bsearch.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-crypt.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-io-priority.c /usr/src/debug/stress-n
 g/0.14.00-r0/git/stress-cap.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fanotify.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rawsock.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-lockbus.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-perf.h /usr/src/debug/stress-ng/0.14.00-r0/git/core-log.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-memrate.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigabrt.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigfd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-tmpfs.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vm-addr.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vm.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-netdev.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-key.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-job.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-smart.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-null.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-kvm.c /usr/src/debug/stress-ng/0.14.00-r0/git
 /stress-shm.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-lsearch.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-clone.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-pipeherd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mmapmany.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-goto.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sysinval.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-full.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-getrandom.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vdso.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-smi.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dekker.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-alarm.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dev-shm.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-madvise.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sleep.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-swap.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-switch.c /usr/src/debug/stress-ng/0.14.00-
 r0/git/stress-sigq.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-zombie.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-klog.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-thermal-zone.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-netlink-proc.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-thrash.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-cache.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigrt.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-aio.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-usersyscall.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-try-open.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dir.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-filename.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-x86syscall.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-netlink-task.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-epoll.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sem.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-zlib.c /usr/src/debug/stre
 ss-ng/0.14.00-r0/git/core-smart.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vecmath.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-exit-group.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fcntl.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-enosys.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-membarrier.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-hdd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rtc.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-watchdog.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-qsort.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-mwc.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-nanosleep.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-open.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-opcode.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sctp.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sockfd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-handle.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-splice.c /usr/src/debug
 /stress-ng/0.14.00-r0/git/stress-rawdev.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-parse-opts.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-wait.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mcontend.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mmap.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-mounts.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-perf.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-hrtimers.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-flock.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fstat.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigsegv.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-ftrace.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rlimit.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigsuspend.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sockabuse.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-vmstat.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-net.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-env.c /usr/src/debu
 g/stress-ng/0.14.00-r0/git/stress-shellsort.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-close.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-tee.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-tun.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-misaligned.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-xattr.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-apparmor.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-cpu-online.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-lockf.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-thermal-zone.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-numa.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-ping-sock.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-setting.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sockpair.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-skiplist.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-matrix-3d.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fiemap.c /usr/src/debug/stress-ng/0.14.00-r0/git/str
 ess-secretmem.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sockdiag.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-put.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fifo.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-prefetch.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-pci.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-module.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-spawn.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-context.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fault.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dup.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-malloc.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-mlock.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-memhotplug.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sysfs.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-wcstr.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-hash.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-chroot.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress
 -dirmany.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-judy.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-memfd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vforkmany.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-brk.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mergesort.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-udp.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-funcret.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dnotify.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-hsearch.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-cpu.h /usr/src/debug/stress-ng/0.14.00-r0/git/core-affinity.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-helper.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-locka.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-aio-linux.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-matrix.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-jpeg.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-killpid.c /usr/src/debug/stress-ng/0.14.00-r0/git/st
 ress-timer.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-softlockup.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-utime.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-unshare.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mmaphuge.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mknod.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-memthrash.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-affinity.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-loop.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mmapfixed.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-pty.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-cpu.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-sched.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-klog.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-loadavg.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-pthread.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-set.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-verity.c /usr/src/debug/stress-ng/0.14.00-
 r0/git/stress-fp-error.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fpunch.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-kill.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-urandom.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rawpkt.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sync-file.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-tsearch.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-branch.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dentry.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-reboot.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rmap.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-ftrace.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-get.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigtrap.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-kcmp.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-net.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-resched.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vm-segv.c /usr/src/debug/stress-ng/0.1
 4.00-r0/git/stress-sigchld.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-thrash.h /usr/src/debug/stress-ng/0.14.00-r0/git/stress-getdent.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-clock.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mincore.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mlock.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-ipsec-mb.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-pidfd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-radixsort.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rawudp.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-iosync.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-atomic.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-physpage.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-signest.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vm-rw.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-vm-splice.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dirdeep.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-dev.c /usr/src/de
 bug/stress-ng/0.14.00-r0/git/stress-pipe.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-access.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-yield.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-shim.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-fallocate.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-out-of-memory.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-icache.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-ioprio.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-limit.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-personality.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sparsematrix.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-file-ioctl.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-chmod.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-rename.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-longjmp.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigpipe.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-uprobe.c /usr/src/debug/stress-ng/0.14.00-r0/git/st
 ress-idle-page.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-mremap.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-poll.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-randlist.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-funccall.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-ng.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-pageswap.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sockmany.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-timerfd.c /usr/src/debug/stress-ng/0.14.00-r0/git/core-time.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sem-sysv.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-landlock.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-peterson.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-nice.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-userfaultfd.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-icmp-flood.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-quota.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sigpending.c /usr/src/debu
 g/stress-ng/0.14.00-r0/git/stress-sock.c /usr/src/debug/stress-ng/0.14.00-r0/git/stress-sendfile.c", added "/usr/src/debug/stress-ng/0.14.01-r0/git/stress-nice.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-shellsort.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fcntl.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-bad-ioctl.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fifo.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-udp.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-efivar.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-klog.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-parse-opts.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-access.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-softlockup.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-open.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mknod.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rdrand.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-cpu-online.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-log
 .c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-loadavg.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-memcpy.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigpending.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-xattr.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-pipeherd.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-mlock.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-full.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-ptrace.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-idle-page.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-pthread.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-stackmmap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-funcret.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-timer.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-set.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-misaligned.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-bigheap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-bad-altstack.c /usr/src/debug/stress-ng/0
 .14.01-r0/git/stress-icache.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-revio.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-aio.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sysbadaddr.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-kill.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-tsc.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-usersyscall.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-utime.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-af-alg.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-spawn.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-loop.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-ng.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-killpid.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sparsematrix.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigrt.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dentry.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-perf.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-funccall.c /usr/src/debug/stress
 -ng/0.14.01-r0/git/stress-memhotplug.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-chmod.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mmap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-klog.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigio.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-stack.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-hash.h /usr/src/debug/stress-ng/0.14.01-r0/git/core-put.h /usr/src/debug/stress-ng/0.14.01-r0/git/stress-env.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-locka.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigsegv.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-resources.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-bind-mount.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-syncload.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-affinity.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sockabuse.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-hsearch.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-chdir.c /usr/src/de
 bug/stress-ng/0.14.01-r0/git/stress-prctl.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rseq.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-shm-sysv.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-itimer.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-perf.h /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mergesort.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-atomic.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-judy.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rlimit.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-watchdog.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-lease.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-ping-sock.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fp-error.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-enosys.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-getrandom.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-pageswap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-readahead.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-b
 itops.h /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rawpkt.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigchld.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-uprobe.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-kvm.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-landlock.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mincore.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-smart.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-wcstr.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-zlib.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rename.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigfpe.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-cache.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-link.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sync-file.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-vmstat.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sysfs.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-bsearch.c /usr/src/debug/stress-ng/0.14.01-r0/git/stre
 ss-daemon.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mmapaddr.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-timerfd.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sysinfo.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-ipsec-mb.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mmapfixed.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sendfile.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-sched.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-io-uring.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-wait.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-setting.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rtc.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-reboot.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-personality.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dnotify.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-resched.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-getdent.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sctp.c /usr/src/debug/stress-n
 g/0.14.01-r0/git/stress-brk.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-vdso.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-pty.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-chattr.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-iosync.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-skiplist.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dynlib.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-signal.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-exit-group.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mmaphuge.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-mincore.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-prefetch.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-qsort.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rawudp.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-epoll.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigfd.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-pipe.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-tee.c /usr/src/debug/stre
 ss-ng/0.14.01-r0/git/stress-pidfd.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-heapsort.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-filename.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-nop.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-memrate.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-munmap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-context.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-pci.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-netlink-proc.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-try-open.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-hdd.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fault.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-oom-pipe.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rawsock.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-cyclic.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-lockf.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sockpair.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-helper.c /usr/
 src/debug/stress-ng/0.14.01-r0/git/stress-malloc.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-nanosleep.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-seccomp.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sem.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-membarrier.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-opcode.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-session.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-inotify.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dev-shm.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-icmp-flood.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-l1cache.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-schedpolicy.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sleep.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-msyncmany.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-affinity.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-aio-linux.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-chroot.c /usr/src/debug/stress-ng/0.
 14.01-r0/git/stress-vecwide.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dccp.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fpunch.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-key.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-shim.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dirdeep.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-crypt.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-out-of-memory.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-urandom.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-randlist.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-zombie.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fiemap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-stream.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-thermal-zone.h /usr/src/debug/stress-ng/0.14.01-r0/git/stress-matrix-3d.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-clone.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-netlink-task.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-seal.c /usr/s
 rc/debug/stress-ng/0.14.01-r0/git/stress-ng.h /usr/src/debug/stress-ng/0.14.01-r0/git/core-net.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-futex.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mmapfork.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-splice.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-lsearch.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-matrix.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mremap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-hrtimers.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-vm-addr.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigq.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mmapmany.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sockfd.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-ramfs.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-msync.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-signest.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-longjmp.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-file-ioc
 tl.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-secretmem.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-ftrace.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mq.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-memfd.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-vm-splice.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-cache.h /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fstat.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-seek.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rawdev.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-shm.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-tmpfs.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-cpu.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-ioprio.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigabrt.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-time.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-cap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigtrap.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-thrash.h /usr/
 src/debug/stress-ng/0.14.01-r0/git/core-mounts.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-list.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-vm-segv.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sockmany.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-apparmor.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-module.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-udp-flood.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-get.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-memthrash.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dev.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-tlb-shootdown.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sem-sysv.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fork.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dirmany.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fanotify.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mlock.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-cpu.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-
 pkey.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-copy-file.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-poll.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-procfs.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-remap-file-pages.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-unshare.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-eventfd.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-msg.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-vforkmany.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-limit.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mcontend.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mutex.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-peterson.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-physpage.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-tree.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-branch.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-close.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-verity.c /usr/src/debug/stress-ng/0
 .14.01-r0/git/stress-dup.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-madvise.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-yield.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-hash.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-tsearch.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-ignite-cpu.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-madvise.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-mlockmany.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-lockbus.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-goto.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-userfaultfd.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-kcmp.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-rmap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-x86syscall.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-mwc.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-alarm.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-quota.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-exec.c /usr/src/debug/stress-
 ng/0.14.01-r0/git/core-io-priority.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-chown.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-null.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-vm.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-tun.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-thermal-zone.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-inode-flags.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-numa.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dir.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-str.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-switch.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-netdev.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-radixsort.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-binderfs.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigpipe.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-clock.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-smi.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-vecmath.c /usr/src/debug
 /stress-ng/0.14.01-r0/git/stress-sockdiag.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-thrash.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-ioport.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sigsuspend.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sysinval.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-smart.h /usr/src/debug/stress-ng/0.14.01-r0/git/stress-zero.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-cpu.h /usr/src/debug/stress-ng/0.14.01-r0/git/core-mmap.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-dekker.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-fallocate.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-job.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-iomix.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-jpeg.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-cache.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-hash.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-vm-rw.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-sock.c /usr/src/debug/stress-ng
 /0.14.01-r0/git/stress-flock.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-handle.c /usr/src/debug/stress-ng/0.14.01-r0/git/stress-swap.c /usr/src/debug/stress-ng/0.14.01-r0/git/core-net.h /usr/src/debug/stress-ng/0.14.01-r0/git/core-ftrace.h /usr/src/debug/stress-ng/0.14.01-r0/git/stress-lockofd.c"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 3547752 to 3576785 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.14.00 [default] to 0.14.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.14.00 [default] to 0.14.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.14.00" to "0.14.01"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4617960 to 4700008 (+2%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.14.00 [default] to 0.14.01 [default]

--===============3826823484086824490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.14.00-0.14.01.patch"

From 247ba76a4ab2b76c77707616ed60127749826897 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 09:44:57 +0000
Subject: [PATCH] stress-ng: upgrade 0.14.00 -> 0.14.01

---
 .../stress-ng/0001-Makefile-quote-CC.patch    | 41 -------------------
 ...ess-ng_0.14.00.bb => stress-ng_0.14.01.bb} |  6 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.14.00.bb => stress-ng_0.14.01.bb} (85%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
deleted file mode 100644
index 498a024830..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f6162ced588c17c1141a8f6154475a299a2ebc0d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 26 Apr 2022 22:35:35 +0200
-Subject: [PATCH] Makefile: quote CC
-
-It can contain command line options, and therefore spaces, and so
-needs to be quoted.
-
-Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/188]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Makefile        | 2 +-
- Makefile.config | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 501093f5..8a454edd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -432,7 +432,7 @@ stress-ng: $(OBJS)
- 	$(V)sync
- 
- config.h:
--	$(MAKE) CC=$(CC) STATIC=$(STATIC) -f Makefile.config
-+	$(MAKE) CC="$(CC)" STATIC=$(STATIC) -f Makefile.config
- 
- .PHONY:
- makeconfig: config.h
-diff --git a/Makefile.config b/Makefile.config
-index b76d0903..f03f7a85 100644
---- a/Makefile.config
-+++ b/Makefile.config
-@@ -69,7 +69,7 @@ else
- endif
- 
- 
--MAKE_OPTS=CC=$(CC) -f Makefile.config --no-print-directory
-+MAKE_OPTS=CC="$(CC)" -f Makefile.config --no-print-directory
- 
- comma = ,
- 
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb
similarity index 85%
rename from meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb
index e7cc1d1846..cba15e947e 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb
@@ -5,10 +5,8 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
-           file://0001-Makefile-quote-CC.patch \
-           "
-SRCREV = "ec7f6c4731a54f0e515bef7f7e84ef9e9b8125a2"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
+SRCREV = "597da6154263c9317291f2dd0ed71a8ff1e8b2dc"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.31.1


--===============3826823484086824490==--

