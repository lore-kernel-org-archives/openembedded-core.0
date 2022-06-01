Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E480CCA485
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.672.1654100324512149876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YELmlMKP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181200fecb5-a6d3a0f9-3da6-4fb0-ab49-af6fdd822ff9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CJiUMczHFmv8e1FbVSlb81cXMC5duqPMlMIjd2dfSo0=;
	b=YELmlMKPiNjMgMxE4/s81bVUaJI+osRiWO600Oo3ifnbpZqUK+rI/Om88yAt0YZa
	TeMIDqk7NqJM5L460Uo1vy9UKfLB2jGwZsVyzr7wNPcaTPZ0e2bLWVYfCO47FRV62TZ
	aJB/elNJoD4suJ/s4IZ61TKPgQIpPMqimL3sys14=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CJiUMczHFmv8e1FbVSlb81cXMC5duqPMlMIjd2dfSo0=;
	b=QkHqynCdugdb6MRa2h4vNh9mlTfqbfE86pE2zDYoGDhEnQGtdN1AnXouXNPHcf8a
	8eGiChVILiUG9wgO2g5at9Mct2smqSNCQ7bItLFn6yrPKuqO75cvUsOtKFpod1EtH17
	qpL47Gull2c6DSzN9zESj7+9kEhTP1w/yO86nIIs=
Content-Type: multipart/mixed; boundary="===============6621191244740866571=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20220527 FAILED
Message-ID: 
 <01010181200fecb5-a6d3a0f9-3da6-4fb0-ab49-af6fdd822ff9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166415

--===============6621191244740866571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ltp* to *20220527* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20220121-20220527.patch
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
--===============6621191244740866571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ltp: SRC_URI changed from "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch file://disable_hanging_tests.patch" to "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://disable_hanging_tests.patch"
packages/core2-32-poky-linux/ltp: PKGV changed from 20220121 [default] to 20220527 [default]
packages/core2-32-poky-linux/ltp: PV changed from "20220121" to "20220527"
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGV changed from 20220121 [default] to 20220527 [default]
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 678062864 to 761542684 (+12%)
packages/core2-32-poky-linux/ltp/ltp-dbg: PV changed from "20220121" to "20220527"
packages/core2-32-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/syslogtst /opt/ltp/testcases/bin/.debug/read_checkzero /opt/ltp/testcases/bin/.debug/umount2_03", added "/opt/ltp/testcases/bin/.debug/wqueue08 /opt/ltp/testcases/bin/.debug/waitid07 /opt/ltp/testcases/bin/.debug/futex_waitv03 /opt/ltp/testcases/bin/.debug/futex_waitv01 /opt/ltp/testcases/bin/.debug/pty06 /opt/ltp/testcases/bin/.debug/setsockopt09 /opt/ltp/testcases/bin/.debug/pty07 /opt/ltp/testcases/bin/.debug/futex_waitv02 /opt/ltp/testcases/bin/.debug/pidfd_getfd01 /opt/ltp/testcases/bin/.debug/wqueue04 /opt/ltp/testcases/bin/.debug/wqueue03 /opt/ltp/testcases/bin/.debug/inotify11 /opt/ltp/testcases/bin/.debug/fcntl39 /opt/ltp/testcases/bin/.debug/wqueue09 /opt/ltp/testcases/bin/.debug/statx09 /opt/ltp/testcases/bin/.debug/wqueue06 /opt/ltp/testcases/bin/.debug/kvm_pagefault01 /opt/ltp/testcases/bin/.debug/io_control01 /opt/ltp/testcases/bin/.debug/keyctl09 /opt/ltp/testcases/bin/.debug/wqu
 eue01 /opt/ltp/testcases/bin/.debug/waitid04 /opt/ltp/testcases/bin/.debug/waitid08 /opt/ltp/testcases/bin/.debug/pidfd_open04 /opt/ltp/testcases/bin/.debug/fcntl39_64 /opt/ltp/testcases/bin/.debug/waitid03 /opt/ltp/testcases/bin/.debug/waitid11 /opt/ltp/testcases/bin/.debug/memcontrol03 /opt/ltp/testcases/bin/.debug/wqueue02 /opt/ltp/testcases/bin/.debug/waitid09 /opt/ltp/testcases/bin/.debug/wqueue07 /opt/ltp/testcases/bin/.debug/pidfd_getfd02 /opt/ltp/testcases/bin/.debug/waitid10 /opt/ltp/testcases/bin/.debug/waitid05 /opt/ltp/testcases/bin/.debug/wqueue05 /opt/ltp/testcases/bin/.debug/memcontrol04 /opt/ltp/testcases/bin/.debug/waitid06"
packages/core2-32-poky-linux/ltp/ltp-dev: PKGV changed from 20220121 [default] to 20220527 [default]
packages/core2-32-poky-linux/ltp/ltp-dev: PKGSIZE changed from 260477 to 262884 (+1%)
packages/core2-32-poky-linux/ltp/ltp-dev: PV changed from "20220121" to "20220527"
packages/core2-32-poky-linux/ltp/ltp-doc: PKGV changed from 20220121 [default] to 20220527 [default]
packages/core2-32-poky-linux/ltp/ltp-doc: PV changed from "20220121" to "20220527"
packages/core2-32-poky-linux/ltp/ltp-locale: PKGV changed from 20220121 [default] to 20220527 [default]
packages/core2-32-poky-linux/ltp/ltp-locale: PV changed from "20220121" to "20220527"
packages/core2-32-poky-linux/ltp/ltp-src: PKGV changed from 20220121 [default] to 20220527 [default]
packages/core2-32-poky-linux/ltp/ltp-src: PKGSIZE changed from 13154347 to 13188932 (+0%)
packages/core2-32-poky-linux/ltp/ltp-src: PV changed from "20220121" to "20220527"
packages/core2-32-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/can/cve -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20220121-r0/
 git/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/tools, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, 
 directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/flock -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/flock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/move_mount, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fsmount -> /usr/src/debug/ltp/20220527-r0/
 git/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/lib -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20220527-r0/git/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/in
 terfaces/difftime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/include -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/
 interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/utils/sctp/testlib -> /usr/src/debug/ltp/20220527-r0/git/utils/sctp/testlib, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/utime -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/2022012
 1-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/alarm, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuset/cpuset_hotplug_test, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sys
 calls/timer_delete -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/prctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/prctl, directory renamed /usr/src/debug
 /ltp/20220121-r0/git/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/recvfrom
 , directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sbrk -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/
 ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/definitions/aio_h, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsu
 ite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/crypto -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sendto -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/f00f -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/f00f, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/s
 peculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/epoll_pwait -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/zram, directory renamed /
 usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/periodic_cpu_load -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/time, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/hyperthreading/ht_affinity, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp
 /20220527-r0/git/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/aio -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20220121-r0/git/tools/apicmds -> /usr/src/debug/ltp/20220527-r0/git/tools/apicmds, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/ker
 nel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/membarrier, 
 directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/packet -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/packet, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fanotify, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/clock_adjtime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/memcg/regression -> /us
 r/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/regression, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/inte
 rfaces/pthread_once -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_setaffinity -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setfsuid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20220121-r0/gi
 t/testcases/kernel/syscalls/setgroups -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setgroups, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/
 syscalls/syscall -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/measuremen
 t -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mincore -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_pos
 ix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/rt_sigqueueinfo, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/shmt, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/fs_di, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20220527-r0
 /git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/time -
 > /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/inte
 rfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20220121-r0/git/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20220527-r0/git/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20220121
 -r0/git/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getitimer, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20220527-r0/git/testc
 ases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/inode, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/int
 erfaces/pthread_join -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases
 /open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pselect, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/openat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open
 _posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/l
 tp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigpending -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setpriority, directory renamed /usr/
 src/debug/ltp/20220121-r0/git/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/page -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getxattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sysc
 alls/linkat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/request_key, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/definitions/sched_h -> 
 /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/lib -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/lib, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedpara
 m -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/io_setup -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/security/tomoyo -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/security/tomoyo, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getdtablesize -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getdtablesize, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sy
 scalls/syncfs -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cgroup -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cgroup, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/perf/latency -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/perf/latency, dire
 ctory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcas
 es/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pipe -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ustat, directory renamed /usr/src/de
 bug/ltp/20220121-r0/git/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20220527-r0/git/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/float/power -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/execve, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/ipc/semaphore -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/ipc/semaphore, directory renamed 
 /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_
 settime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getgid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/l
 tp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/de
 bug/ltp/20220121-r0/git/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/vmsplice, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/in
 terfaces/raise -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock, 
 directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mq_notify -> /usr/src/debug/l
 tp/20220527-r0/git/testcases/kernel/syscalls/mq_notify, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/functional/timers/tim
 ers, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/wait, directory renamed /usr/s
 rc/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20220121-r0/git/libs/libltpnewipc -> /usr/src/debug/ltp/20220527-r0/git/libs/libltpnewipc, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/doio/include, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src
 /debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fsconfig -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fsconfig, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/sched_jitter, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pwritev2, directory rena
 med /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/semop -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/semop, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pwrite -> 
 /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/clone3 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/2
 0220527-r0/git/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sy
 scalls/select, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debu
 g/ltp/20220121-r0/git/testcases/kernel/syscalls/eventfd2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/eventfd2, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/execl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr
 /src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/s
 yscalls/sched_getscheduler -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/security/filecaps -> /usr/src
 /debug/ltp/20220527-r0/git/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/2022012
 1-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/power_management -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/power_management, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/kill -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/kill, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/
 pthread_attr_setstacksize -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/abs -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, dire
 ctory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/io_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/rename, directory renamed /usr/src/debug/ltp/20220121-r0/git/testca
 ses/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mprotect -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mprotect, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance
 /interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/contro
 llers/memcg/control -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/bpf -> /us
 r/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/bpf, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/shmdt, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/modify_ldt -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/modify_ldt, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20220527-r0/g
 it/testcases/kernel/syscalls/set_tid_address, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigfillset, dire
 ctory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/sockets -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/sockets, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20220121-r0/git/libs/libltpswap -> /usr/src/debug/ltp/20220527-r0/git/libs/libltpswap, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /
 usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/include -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/include, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuctl, directory r
 enamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/
 interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/libclone -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/libclone, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory rename
 d /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/cve -> /usr/src/debug/ltp/20220527-r0/git/testcases/cve, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/lib -> /usr/src/debug/ltp/20220527-r0/git/testcases/lib, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory
  renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/readv -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/execvp -> /u
 sr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/pci/tpci_user, directory renamed 
 /usr/src/debug/ltp/20220121-r0/git/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/fsync, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/doio -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/munmap -> /usr/src/deb
 ug/ltp/20220527-r0/git/testcases/kernel/syscalls/munmap, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/commands/eject -> /usr/src/debug/ltp/20220527-r0/git/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/fs_fill
 , directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kerne
 l/syscalls/set_mempolicy -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20220121-r0/
 git/testcases/misc/math/fptests -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/lib6 -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/
 pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/security/cap_bound -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/crash -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/confo
 rmance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/sched_latency, directory renamed
  /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/symlink, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/l
 tp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/unlink -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/unlink, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/gethostbyn
 ame_r, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getrandom -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getrandom, directory renamed /usr/src/debug/ltp/20220121-r0/git/pan -> /usr/src/debug/ltp/20220527-r0/git/pan, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sy
 scalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/utsname -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/utsname, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/access, direc
 tory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop
 , directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/gethostname -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem
 _post, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/stress/pi-tests, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fremovexattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/netwo
 rk/tcp_cmds/sendfile -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/cfs-scheduler -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/cfs-scheduler, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20220121
 -r0/git/testcases/kernel/syscalls/munlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuacct, directory renamed /usr/src/debug/ltp/20220121-r0/git/include/old -> /usr/src/debug/ltp/20220527-r0/git/include/old, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/shmat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20220121
 -r0/git/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/pidns, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/personality, directory re
 named /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/msgget -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/numa -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/s
 yscalls/clock_getres -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/sched_football -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pkeys -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pkeys, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigtime
 dwait -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/hugetlb/hugemmap -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/hugetlb/hugemmap, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20220121-
 r0/git/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/uaccess -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/2022
 0121-r0/git/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setgid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/sched_stress, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol ->
  /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/unshare -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/unshare, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/clock_settime -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/open_tree, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/202
 20121-r0/git/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/include -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/include, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/mqns -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/irq -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, di
 rectory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pause, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20220527-r0/git/testc
 ases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/utils/sctp/lib -> /usr/src/debug/ltp/20220527-r0/git/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/memfd_create -> /usr/src/debug/lt
 p/20220527-r0/git/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscall
 s/fdatasync, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/add_key -> /usr/src/debug
 /ltp/20220527-r0/git/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/block/block_dev_user -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/block/block_dev_user, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /usr/src/debug/ltp/2022
 0121-r0/git/testcases/realtime/func/prio-wake -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src/debug/ltp/20220527
 -r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20220121-r0/
 git/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fork -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fork, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fsync, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/llseek, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20220527-r
 0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setregid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/ksm -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/deb
 ug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp
 /20220527-r0/git/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/eventfd -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel
 /syscalls/eventfd, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/libcontrollers, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/
 syscalls/symlinkat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setitimer, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mount -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mount, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20220527-r0/git/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/2022
 0121-r0/git/testcases/kernel/syscalls/mlockall -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/wait4 -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ulimit, direct
 ory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/sctp -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/oom -> /usr/src/debug/ltp/20220527-r0/git/testcases/kerne
 l/mem/oom, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/execveat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sysc
 alls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ipc/semget -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sy
 scalls/ipc/semget, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/capset -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/security/smack -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/stress/ns-tools -> /usr
 /src/debug/ltp/20220527-r0/git/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/hugetlb/hugeshmget -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/hugetlb/hugeshmget, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sound -> /usr/
 src/debug/ltp/20220527-r0/git/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/input -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20220121
 -r0/git/testcases/kernel/uevents -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/pci/tpci_kernel, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/float/trigo, di
 rectory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/20220527-r0/git/
 testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/madvise -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/madvise, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/freezer, directory renamed /usr/
 src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp/20220121-r0/git/utils/sctp/include/netinet -> /usr/src/debug/ltp/20220527-r0/git/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20220527-r0/git/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/renameat
 , directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/cpuset/cpuset_syscall_test -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setreuid -> /usr/src
 /debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_create -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20220121-r0/git/utils/sctp/func_tests -> /usr/src/debug/ltp/20220527-r0/git/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20220121-r0/git/libs/libltpipc -> /usr/src/debug/ltp/20220527-r0/git/libs/libltpipc, directory renamed /usr/src/debug/ltp/20220121-r0/git/libs/libltpvdso -> /usr/src/debug/ltp/20220527-r0/git/libs/libltpvdso, dire
 ctory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20220121-r0/git/libs/libltpuinput -> /usr/src/debug/ltp/20220527-r0/git/libs/libltpuinput, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/functional, dir
 ectory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20220121-r0/git/libs/libltpsigwait -> /usr/src/debug/ltp/20220527-r0/git/libs/libltpsigwait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls
 /lseek, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sched_setparam, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/
 ltp/20220121-r0/git/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/
 syscalls/signalfd -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20220121-r0/git/include -> /usr/src/debug/ltp/20220527-r0/git/include, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls
 /umount -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/fs-bench -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/fs-bench, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/mmapstress, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/nanoslee
 p, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/timens -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20220121-r0/git/tools/genload -> /usr/src/debug/ltp/20220527-r0/git/tools/genload, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/confor
 mance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /
 usr/src/debug/ltp/20220121-r0/git/testcases/network/netstress -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed
  /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/share -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/share, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_ini
 t -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/lib -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mmap -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mmap, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/202
 20527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20220527-r0/git/testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/atof -> /usr/src/debug/ltp/20220527-r0/git/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_
 testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/getuid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel
 /syscalls/fchownat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/set_thread_area -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscal
 ls/set_thread_area, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conforman
 ce/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20220527-r0/git/testcas
 es/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/socket, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pread, directory renamed /usr/
 src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20220527-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/ioctl -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/ioctl, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/splice, directory renamed /usr/src/debug/ltp/20220121-r0/git/testcases/misc/math/float -> /usr/src/debug/l
 tp/20220527-r0/git/testcases/misc/math/float, removed "/usr/src/debug/ltp/20220121-r0/git/lib/safe_file_ops.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/aiodio_append.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20220121-r0/git/lib/cloner.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_crypto.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/dio_sparse.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_checkpoint.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/dio_truncate.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_coredump.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/pty/pty05.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/
 userns/userns03.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statx/statx06.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_af_alg.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/init_module.h /usr/src/debug/ltp/20220121-r0/git/include/lapi/sem.h /usr/src/debug/ltp/20220121-r0/git/lib/tst_status.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_device.c /usr/src/debug/ltp/20220121-r0/git/lib/get_path.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_safe_file_at.c /usr/src/debug/ltp/20220121-r0/git/lib/safe_macros.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_mkfs.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/dio_append.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wake02.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_ansi_color.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns02.c /usr/src/debug/ltp/20220121-r0/git/lib/t
 st_fs_type.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/umount2/umount2_01.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_safe_io_uring.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/keyctl/keyctl05.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_path_has_mnt_flags.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/pidfd_open.h /usr/src/debug/ltp/20220121-r0/git/lib/tst_arch.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_sys_conf.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/keyctl/keyctl03.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_safe_sysv_ipc.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/keyctl/keyctl07.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_cgroup.c /usr/src/debug/ltp/20220121-r0/git/testcases/ker
 nel/syscalls/syslog/syslogtst.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl06.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_checksum.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_cpu.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt04.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt02.c /usr/src/debug/ltp/20220121-r0/git/lib/signame.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/memcg/memcontrol01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns06_capcheck.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/aiodio_sparse.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/s
 etsockopt/setsockopt05.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/io_uring.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/common_checkzero.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_capability.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/quotactl.h /usr/src/debug/ltp/20220121-r0/git/include/lapi/fs.h /usr/src/debug/ltp/20220121-r0/git/lib/tst_buffers.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_netdevice.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/aio-stress.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/keyctl/keyctl04.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/dirty.
 c /usr/src/debug/ltp/20220121-r0/git/lib/tst_parse_opts.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/common.h /usr/src/debug/ltp/20220121-r0/git/lib/tst_net.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/mountns/mountns02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns06.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_assert.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_fill_fs.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_process_state.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wait03.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt08.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/pty/pty02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify06.c /usr/src/
 debug/ltp/20220121-r0/git/include/lapi/openat2.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statx/statx07.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_rtnetlink.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl_common.h /usr/src/debug/ltp/20220121-r0/git/lib/tst_rtctime.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/mountns/mountns04.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/umount2/umount2_02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_utils.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statx/statx02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/mountns/mountns03.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/waitid/waitid01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_memutils.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_kconfig.c /usr/src/deb
 ug/ltp/20220121-r0/git/lib/tst_module.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_safe_macros.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wake03.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/keyctl/keyctl08.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_supported_fs_types.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns_helper.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/pty/pty03.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wake04.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/umount2/umount2.h /usr/src/debug/ltp/20220121-r0/git/include/lapi/keyctl.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/pty/hangup01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl28.c /usr/src/
 debug/ltp/20220121-r0/git/testcases/kernel/syscalls/kcmp/kcmp02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/keyctl/keyctl01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statx/statx01.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/readdir.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statx/statx05.c /usr/src/debug/ltp/20220121-r0/git/lib/tlibio.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/aiocp.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/pidfd_send_signal.h /usr/src/debug/ltp/20220121-r0/git/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20220121-r0/git/lib/random_range.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/common_sparse.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wait02.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_fs_setup.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20220121-r0/git/tes
 tcases/kernel/syscalls/inotify/inotify.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wait05.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/msgbuf.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify05.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_ioctl.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/membarrier.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/keyctl/keyctl06.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/read_checkzero.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt01.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_hugepage.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify04.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify07.c /usr/
 src/debug/ltp/20220121-r0/git/lib/tst_bool_expr.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/sched.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt07.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/futex.h /usr/src/debug/ltp/20220121-r0/git/include/lapi/bpf.h /usr/src/debug/ltp/20220121-r0/git/lib/tst_res.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns04.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_sig.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/controllers/memcg/memcontrol02.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_timer.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify10.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statx/statx03.c /usr/src/debug/ltp/20220121-r0/git/lib/errnos.h /usr/src/debug/ltp/
 20220121-r0/git/include/lapi/clone.h /usr/src/debug/ltp/20220121-r0/git/include/lapi/ipcbuf.h /usr/src/debug/ltp/20220121-r0/git/include/lapi/common_timers.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/io/ltp-aiodio/dio_read.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/pty/ptem01.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_clone.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_dir_is_empty.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_fips.c /usr/src/debug/ltp/20220121-r0/git/lib/safe_net.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify03.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_cmp_requeue02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/kcmp/kcmp.h /usr
 /src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_tmpdir.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/inotify08.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_kernel.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_fs_link_count.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/epoll.h /usr/src/debug/ltp/20220121-r0/git/lib/tst_pid.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/pty/pty01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_clocks.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp
 /20220121-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt06.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns08.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_sig_proc.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/keyctl/keyctl02.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_resource.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/fsmount.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt03.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statx/statx04.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_wallclock.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_fill_file.c /usr/src/debug/ltp/20220121-r0/git/lib/parse_opts.c /usr/src/debug/ltp/20220121-r0/git/testcases/
 kernel/syscalls/futex/futextest.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/statx/statx08.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/syslog/syslog12.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns05.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/umount2/umount2_03.c /usr/src/debug/ltp/20220121-r0/git/lib/safe_stdio.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_test.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/syslog/syslog11.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_timer_test.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_taint.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl24.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_lockdown.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/inotify/in
 otify09.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/mountns/mountns01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/mountns/mountns_helper.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/sembuf.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wake01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/pty/pty04.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wait_bitset01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_cmd.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wait01.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_fs_has_free.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20220
 121-r0/git/lib/tst_kvercmp.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/containers/userns/userns07.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_uid.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/kcmp/kcmp03.c /usr/src/debug/ltp/20220121-r0/git/lib/safe_pthread.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_get_bad_addr.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/ustat.h /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20220121-r0/git/include/lapi/shmbuf.h /usr/src/debug/ltp/20220121-r0/git/lib/tst_safe_timerfd.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/futex/futex_wait04.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/kcmp/kcmp01.c /usr/src/debug/ltp/20220121-r0/git/testcases/kernel/syscalls/waitid/waitid02.c /usr/src/debug/ltp/20220121-r0/git/lib/tst_virt.c", added "/usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/mountns/mountns04.c /usr/src/debug/ltp/202205
 27-r0/git/testcases/kernel/syscalls/keyctl/keyctl05.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/memcontrol01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20220527-r0/git/lib/safe_net.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/wqueue06.c /usr/src/debug/ltp/20220527-r0/git/lib/cloner.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/hangup01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/kvm/include/kvm_common.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/kcmp/kcmp03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/openat2.h /usr/src/deb
 ug/ltp/20220527-r0/git/include/lapi/watch_queue.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/kcmp/kcmp01.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_safe_sysv_ipc.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_cgroup.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_path_has_mnt_flags.c /usr/src/debug/ltp/20220527-r0/git/lib/errnos.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/mountns/mountns02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/dio_truncate.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/sembuf.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_coredump.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20220527-r0/git/lib/safe_stdio.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_process_state.c /usr/src/debug/ltp/202
 20527-r0/git/lib/safe_file_ops.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid04.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/pty02.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_taint.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20220527-r0/git/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_test.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_clocks.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/userns/userns08.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/kvm/lib_host.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_utils.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt04.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/userns/userns02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/
 userns/userns04.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_ioctl.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/pty06.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futextest.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wait_bitset01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/dio_sparse.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/futex.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/keyctl/keyctl01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/keyctl/keyctl07.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/userns/userns01.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_ansi_color.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_safe_io_uring.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wake04.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_safe_
 file_at.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/io_uring.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/pty04.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_fs_has_free.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl24.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wait02.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/init_module.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_uid.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl06.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify11.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_cmp_requeue02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/wqueue03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/k
 eyctl/keyctl09.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/memcontrol03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/keyctl/keyctl03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pidfd_getfd/pidfd_getfd02.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/quotactl.h /usr/src/debug/ltp/20220527-r0/git/include/lapi/bpf.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_hugepage.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/mountns/mountns03.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_kconfig.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wake03.c /usr/src/debug/ltp/20220527-r0/git/lib/get_path.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_rtnetlink.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/keyctl/keyctl08.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/syslog/syslog12.c 
 /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/wqueue01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/pty03.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_cmd.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/kcmp.h /usr/src/debug/ltp/20220527-r0/git/include/lapi/sem.h /usr/src/debug/ltp/20220527-r0/git/lib/parse_opts.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_bool_expr.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_net.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_res.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/mountns/mountns01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pidfd_getfd/pidfd_getfd01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/pty01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify06.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx07.c /usr/src/debug/ltp/202205
 27-r0/git/lib/safe_pthread.c /usr/src/debug/ltp/20220527-r0/git/lib/tlibio.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_virt.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_assert.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_sys_conf.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/userns/userns06_capcheck.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/pty07.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl_common.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_get_bad_addr.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid09.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_capability.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/userns/userns06.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_waitv03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/lt
 p/20220527-r0/git/testcases/kernel/syscalls/futex/futex_waitv02.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_fs_type.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_clone.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_netdevice.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx05.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_kernel.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_fs_link_count.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/mountns/mountns.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/userns/userns03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx08.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/syslog/syslog11.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/keyctl.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_fs_setup.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_af_alg.c /usr/src/debug/ltp/2022052
 7-r0/git/lib/tst_lockdown.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify09.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/wqueue09.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/aio-stress.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_pid.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl28.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify04.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_status.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_wallclock.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid11.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify10.c /usr/src/debug/ltp/20220527-r0
 /git/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_checksum.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_tmpdir.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx04.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/common.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_resource.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_waitv01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify07.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_thread_state.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/readdir.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_arc
 h.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_rtctime.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex2test.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pidfd_open/pidfd_open04.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt08.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx09.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/shmbuf.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx03.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/fsmount.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/common.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/userns/common.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_device.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c /usr/src/debug/ltp/20220527-r0/git/testcases/ker
 nel/syscalls/umount2/umount2_01.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/ustat.h /usr/src/debug/ltp/20220527-r0/git/lib/tst_checkpoint.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/pidfd.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/aiocp.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/ptem01.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_fill_file.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/keyctl/keyctl02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/keyctl/keyctl06.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/umount2/umount2_02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/ipcbuf.h /usr/src/debug/ltp/20220527-r0/git/include/lapi/sched.h /usr/src/debug/lt
 p/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid08.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid05.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_supported_fs_types.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/epoll.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_dir_is_empty.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_module.c /usr/src/debug/ltp/20220527-r0/git/lib/safe_macros.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_crypto.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/dio_read.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/fs.h /usr/s
 rc/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/msgbuf.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wait05.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/common_timers.h /usr/src/debug/ltp/20220527-r0/git/lib/random_range.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/memcontrol_common.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/kcmp/kcmp02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/pty/pty05.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_fips.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_sig.c /usr/src/debug/
 ltp/20220527-r0/git/lib/signame.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/aiodio_sparse.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/dio_append.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify08.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/dirty.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/membarrier.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/kvm/include/kvm_host.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid06.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt03.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wait04.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/memcontrol02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/wqueue05.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_mkfs.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/co
 ntainers/userns/userns07.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_buffers.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_sig_proc.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid07.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wait03.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_timer.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_timer_test.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/memcg/memcontrol04.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wake01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt07.c /usr/src/debug/ltp/20220527-r0/git/testcases/k
 ernel/watchqueue/wqueue07.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/io/ltp-aiodio/aiodio_append.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wake02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt06.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/waitid/waitid01.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/clone.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/keyctl/keyctl04.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20220527-r0/git/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt05.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/futex/futex_wait01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20220527-r0/git/test
 cases/kernel/syscalls/waitid/waitid10.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_safe_macros.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/wqueue02.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_memutils.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_safe_timerfd.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/containers/userns/userns05.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/kvm/kvm_pagefault01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify.h /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/controllers/io/io_control01.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/statx/statx06.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/inotify/inotify05.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/wqueue08.c /u
 sr/src/debug/ltp/20220527-r0/git/lib/tst_parse_opts.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_fill_fs.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_cpu.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt02.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/syscalls/setsockopt/setsockopt09.c /usr/src/debug/ltp/20220527-r0/git/testcases/kernel/watchqueue/wqueue04.c /usr/src/debug/ltp/20220527-r0/git/lib/tst_kvercmp.c"
packages/core2-32-poky-linux/ltp/ltp-staticdev: PKGV changed from 20220121 [default] to 20220527 [default]
packages/core2-32-poky-linux/ltp/ltp-staticdev: PV changed from "20220121" to "20220527"
packages/core2-32-poky-linux/ltp/ltp: PKGV changed from 20220121 [default] to 20220527 [default]
packages/core2-32-poky-linux/ltp/ltp: PKGSIZE changed from 400062049 to 448877208 (+12%)
packages/core2-32-poky-linux/ltp/ltp: PV changed from "20220121" to "20220527"
packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/syslogtst /opt/ltp/testcases/bin/syslog10 /opt/ltp/testcases/bin/syslog04 /opt/ltp/testcases/bin/syslog-lib.sh /opt/ltp/testcases/bin/umount2_03 /opt/ltp/testcases/bin/syslog07 /opt/ltp/testcases/bin/nfslock01 /opt/ltp/testcases/bin/syslog09 /opt/ltp/testcases/bin/syslog01 /opt/ltp/testcases/bin/syslog06 /opt/ltp/testcases/bin/read_checkzero /opt/ltp/testcases/bin/syslog05 /opt/ltp/testcases/bin/nfsstat01 /opt/ltp/testcases/bin/syslog08 /opt/ltp/testcases/bin/syslog03 /opt/ltp/testcases/bin/syslog02", added "/opt/ltp/testcases/bin/pty06 /opt/ltp/testcases/bin/waitid08 /opt/ltp/testcases/bin/pidfd_getfd01 /opt/ltp/testcases/bin/keyctl09 /opt/ltp/runtest/watchqueue /opt/ltp/testcases/bin/memcontrol03 /opt/ltp/testcases/bin/waitid10 /opt/ltp/testcases/bin/wqueue01 /opt/ltp/testcases/bin/wqueue08 /opt/ltp/testcases/bin/waitid03 /opt/ltp/testcases/bin/inotify11 /opt/ltp/testcases/bin/wqueue07 /opt/ltp/testcase
 s/bin/wqueue02 /opt/ltp/testcases/bin/memcontrol04 /opt/ltp/testcases/bin/wqueue05 /opt/ltp/testcases/bin/pty07 /opt/ltp/testcases/bin/futex_waitv01 /opt/ltp/testcases/bin/pidfd_open04 /opt/ltp/testcases/bin/wqueue04 /opt/ltp/testcases/bin/waitid06 /opt/ltp/testcases/bin/pidfd_getfd02 /opt/ltp/testcases/bin/wqueue06 /opt/ltp/testcases/bin/statx09 /opt/ltp/testcases/bin/kvm_pagefault01 /opt/ltp/testcases/bin/wqueue09 /opt/ltp/testcases/bin/futex_waitv02 /opt/ltp/testcases/bin/io_control01 /opt/ltp/testcases/bin/waitid05 /opt/ltp/testcases/bin/waitid04 /opt/ltp/testcases/bin/waitid09 /opt/ltp/runtest/kvm /opt/ltp/testcases/bin/fcntl39 /opt/ltp/testcases/bin/setsockopt09 /opt/ltp/testcases/bin/fcntl39_64 /opt/ltp/testcases/bin/waitid07 /opt/ltp/testcases/bin/futex_waitv03 /opt/ltp/testcases/bin/waitid11 /opt/ltp/testcases/bin/wqueue03 /opt/ltp/testcases/bin/nfsstat01.sh /opt/ltp/testcases/bin/nfslock01.sh"

--===============6621191244740866571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 678062864 to 761542684 (+12%)
packages/core2-32-poky-linux/ltp/ltp: PKGSIZE changed from 400062049 to 448877208 (+12%)
packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/syslog08 /opt/ltp/testcases/bin/syslog04 /opt/ltp/testcases/bin/nfslock01 /opt/ltp/testcases/bin/syslog07 /opt/ltp/testcases/bin/syslogtst /opt/ltp/testcases/bin/syslog01 /opt/ltp/testcases/bin/nfsstat01 /opt/ltp/testcases/bin/syslog09 /opt/ltp/testcases/bin/read_checkzero /opt/ltp/testcases/bin/syslog10 /opt/ltp/testcases/bin/syslog02 /opt/ltp/testcases/bin/umount2_03 /opt/ltp/testcases/bin/syslog05 /opt/ltp/testcases/bin/syslog06 /opt/ltp/testcases/bin/syslog-lib.sh /opt/ltp/testcases/bin/syslog03", added "/opt/ltp/testcases/bin/wqueue05 /opt/ltp/testcases/bin/wqueue03 /opt/ltp/testcases/bin/waitid05 /opt/ltp/testcases/bin/pidfd_getfd01 /opt/ltp/testcases/bin/inotify11 /opt/ltp/testcases/bin/wqueue07 /opt/ltp/testcases/bin/waitid10 /opt/ltp/runtest/kvm /opt/ltp/testcases/bin/statx09 /opt/ltp/testcases/bin/nfsstat01.sh /opt/ltp/testcases/bin/fcntl39_64 /opt/ltp/testcases/bin/fcntl39 /opt/ltp/testcases/bi
 n/futex_waitv01 /opt/ltp/testcases/bin/wqueue09 /opt/ltp/testcases/bin/waitid07 /opt/ltp/testcases/bin/waitid04 /opt/ltp/testcases/bin/futex_waitv02 /opt/ltp/testcases/bin/wqueue08 /opt/ltp/testcases/bin/pty06 /opt/ltp/testcases/bin/futex_waitv03 /opt/ltp/testcases/bin/pidfd_open04 /opt/ltp/testcases/bin/nfslock01.sh /opt/ltp/testcases/bin/pidfd_getfd02 /opt/ltp/testcases/bin/memcontrol03 /opt/ltp/testcases/bin/waitid08 /opt/ltp/testcases/bin/keyctl09 /opt/ltp/testcases/bin/wqueue01 /opt/ltp/testcases/bin/wqueue06 /opt/ltp/testcases/bin/pty07 /opt/ltp/testcases/bin/memcontrol04 /opt/ltp/testcases/bin/waitid06 /opt/ltp/testcases/bin/setsockopt09 /opt/ltp/testcases/bin/waitid11 /opt/ltp/testcases/bin/wqueue04 /opt/ltp/testcases/bin/waitid09 /opt/ltp/testcases/bin/wqueue02 /opt/ltp/testcases/bin/io_control01 /opt/ltp/testcases/bin/kvm_pagefault01 /opt/ltp/runtest/watchqueue /opt/ltp/testcases/bin/waitid03"

--===============6621191244740866571==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20220121-20220527.patch"

From 1a3af87511966a01eee9608c6ff2e8cdcec62f8f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 10:14:24 +0000
Subject: [PATCH] ltp: upgrade 20220121 -> 20220527

---
 ...sh-sort-filelist-for-reproducibility.patch | 28 -------------------
 .../ltp/{ltp_20220121.bb => ltp_20220527.bb}  |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
 rename meta/recipes-extended/ltp/{ltp_20220121.bb => ltp_20220527.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch b/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
deleted file mode 100644
index e8d9f212a9..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4aad23f208cc7725cd61bbe5aaadb9994c794cd0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 26 Jan 2022 20:58:46 +0100
-Subject: [PATCH] metadata/parse.sh: sort filelist for reproducibility
-
-find does not guarantee the order of the files.
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/907]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- metadata/parse.sh | 2 +-
-
-diff --git a/metadata/parse.sh b/metadata/parse.sh
-index b43d024c68..1811665bfe 100755
---- a/metadata/parse.sh
-+++ b/metadata/parse.sh
-@@ -29,7 +29,7 @@ echo ' "tests": {'
- 
- first=1
- 
--for test in `find testcases/ -name '*.c'`; do
-+for test in `find testcases/ -name '*.c'|sort`; do
- 	a=$($top_builddir/metadata/metaparse -Iinclude -Itestcases/kernel/syscalls/utils/ "$test")
- 	if [ -n "$a" ]; then
- 		if [ -z "$first" ]; then
--- 
-2.20.1
-
diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20220121.bb
rename to meta/recipes-extended/ltp/ltp_20220527.bb
index 8a13dcf9d0..b136c83860 100644
--- a/meta/recipes-extended/ltp/ltp_20220121.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -22,11 +22,10 @@ CFLAGS:append:x86-64 = " -fomit-frame-pointer"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "b0561ad8d9ee9fe1244b5385e941eb65a21e91a1"
+SRCREV = "6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
            file://disable_hanging_tests.patch \
            "
 
-- 
2.31.1


--===============6621191244740866571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1644 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (882 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-392942f956df5e58d2a1c286aad2bee8bca1b79e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:392942f956df5e58d2a1c286aad2bee8bca1b79e"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 166 Local 10 Mirrors 0 Missed 156 Current 498 (6% match, 76% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 598 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_250.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1141 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_fetch)
NOTE: Running task 1159 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_fetch: Started
NOTE: recipe systemd-1_250.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1239 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 1338 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_fetch)
NOTE: Running task 1340 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_fetch)
NOTE: Running task 1380 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1410 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.11-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.11-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.6.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1423 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1424 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_unpack)
NOTE: Running task 1447 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_unpack)
NOTE: Running task 1449 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_unpack)
NOTE: Running task 1467 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1530 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1588 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: Running task 1590 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1613 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_fetch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_unpack: Started
NOTE: Running task 1628 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1629 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_fetch)
NOTE: recipe tcl-8.6.11-r0: task do_unpack: Started
NOTE: Running task 1641 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1654 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1659 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 1660 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 1665 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1668 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_fetch)
NOTE: Running task 1693 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_fetch)
NOTE: Running task 1695 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: Running task 1721 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1722 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb:do_fetch)
NOTE: Running task 1724 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1737 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_fetch)
NOTE: Running task 1738 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1739 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_fetch)
NOTE: Running task 1740 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_fetch)
NOTE: Running task 1742 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1743 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: Running task 1744 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_fetch)
NOTE: Running task 1745 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 1796 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 1844 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_fetch)
NOTE: Running task 1845 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_fetch)
NOTE: Running task 1849 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.8-r0: task do_fetch: Started
NOTE: Running task 1851 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1901 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1902 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.6.0-r0: task do_unpack: Succeeded
NOTE: recipe tcl-8.6.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Started
NOTE: Running task 1910 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1911 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: Running task 1914 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe ltp-20220527-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe iproute2-5.18.0-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 1915 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe gdb-12.1-r0: task do_fetch: Started
NOTE: recipe cpio-2.13-r0: task do_fetch: Started
NOTE: Running task 1916 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe diffutils-3.8-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 1917 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_patch)
NOTE: Running task 1918 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-5.18.0-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.06-r0: task do_fetch: Started
NOTE: Running task 1919 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 1920 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_unpack)
NOTE: Running task 1921 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: Running task 1922 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1923 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_unpack)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: Running task 1924 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.06-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1925 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe ltp-20220527-r0: task do_fetch: Succeeded
NOTE: recipe gdb-12.1-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.20.1-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 1926 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Started
NOTE: recipe logrotate-3.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 1927 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe file-5.41-r0: task do_package_write_rpm: Started
NOTE: Running task 1928 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.11-r0: task do_unpack: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1929 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_patch)
NOTE: Running task 1930 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_unpack)
NOTE: Running task 1931 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1932 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1933 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1934 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: Running task 1935 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1936 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb:do_unpack)
NOTE: Running task 1937 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1938 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_unpack)
NOTE: Running task 1939 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 1940 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_unpack)
NOTE: Running task 1941 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_unpack)
NOTE: Running task 1942 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 1943 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: Running task 1944 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: Running task 1945 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 1946 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.6.0-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Started
NOTE: Running task 1947 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1948 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: Running task 1949 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1950 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe diffutils-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1951 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1952 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.11-r0: task do_patch: Started
NOTE: Running task 1953 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_unpack)
NOTE: Running task 1954 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_unpack)
NOTE: Running task 1955 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1956 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20220527-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.18.0-r0: task do_unpack: Started
NOTE: recipe gdb-12.1-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe logrotate-3.20.1-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe cpio-2.13-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe quota-4.06-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 1957 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: Running task 1958 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 1959 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe quota-4.06-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1960 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 1961 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_patch)
NOTE: Running task 1962 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1963 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe cpio-2.13-r0: task do_unpack: Succeeded
NOTE: Running task 1964 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1965 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1966 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1967 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: Running task 1968 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: Running task 1969 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_patch)
NOTE: Running task 1970 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1971 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_patch)
NOTE: recipe iproute2-5.18.0-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe diffutils-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1972 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1973 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_patch)
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1975 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1976 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1977 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.20.1-r0: task do_patch: Started
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1978 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1979 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1980 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: Running task 1981 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_patch)
NOTE: recipe logrotate-3.20.1-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.06-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: Running task 1982 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_patch)
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.13-r0: task do_patch: Started
NOTE: recipe iproute2-5.18.0-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Started
NOTE: Running task 1983 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 1984 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_patch: Started
NOTE: Running task 1985 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1986 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Started
NOTE: Running task 1987 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Started
NOTE: recipe logrotate-3.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1988 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe libnl-1_3.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1989 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.18.0-r0: task do_patch: Succeeded
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 1990 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1991 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe logrotate-3.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1992 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: recipe libnl-1_3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1993 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1994 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: Running task 1995 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 1996 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1997 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Succeeded
NOTE: recipe ltp-20220527-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1998 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1999 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.8-r0: task do_patch: Succeeded
NOTE: Running task 2000 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b0c61aea22dce8f624b85304ab204c1e9684ae296da75745f49b90a50579929e
NOTE: Running task 2008 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure_ptest_base)
NOTE: recipe quota-4.06-r0: task do_patch: Succeeded
NOTE: Running task 2009 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2010 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2011 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 2012 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: Running task 2013 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2014 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_deploy_source_date_epoch)
NOTE: Running task 2015 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20220527-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2016 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 2017 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2019 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_configure)
NOTE: Running task 2020 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe iproute2-5.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2021 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_configure)
NOTE: Running task 2022 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2023 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.06-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2024 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2026 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2027 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2028 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 2029 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile)
NOTE: recipe libnl-1_3.6.0-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: Running task 2030 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2032 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2033 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_compile: Started
NOTE: Running task 2035 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe tcl-8.6.11-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2036 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: Running task 2037 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_configure)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe diffutils-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe quota-4.06-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2038 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_configure)
NOTE: Running task 2039 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_configure)
NOTE: recipe tcl-8.6.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2040 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2041 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: Running task 2042 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_configure: Started
NOTE: recipe diffutils-3.8-r0: task do_configure: Started
NOTE: recipe logrotate-3.20.1-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe ltp-20220527-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2043 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: Running task 2044 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_deploy_source_date_epoch)
NOTE: Running task 2045 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_populate_lic)
NOTE: Running task 2046 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2047 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 2048 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20220527-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2049 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe ltp-20220527-r0: task do_populate_lic: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe tcl-8.6.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2050 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_configure)
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe tcl-8.6.11-r0: task do_configure: Started
NOTE: recipe gdb-12.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2051 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_patch)
NOTE: recipe ltp-20220527-r0: task do_populate_lic: Succeeded
NOTE: Running task 2052 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_populate_lic unihash changed to 76986814f086034b46539bde26a5ced72ce66a5ba05fc1ea1fcef3f25f5cd42f
NOTE: recipe gdb-12.1-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe ltp-20220527-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2053 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2054 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: Running task 2055 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2056 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 56fac8ee0c7d26483246c4fcb01cc0878f40f2b7f8798514e2447802eab20187
NOTE: Running task 2059 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2061 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: Running task 2062 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2063 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_configure)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2064 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2065 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20220527-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20220527-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2066 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20220527-r0: task do_configure: Started
NOTE: Running task 2067 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2068 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gdb-12.1-r0: task do_patch: Succeeded
NOTE: Running task 2069 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: Running task 2070 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2072 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 2073 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_unpack: Succeeded
NOTE: Running task 2074 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_symlink_kernsrc)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 2075 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2076 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_checkout)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_checkout: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2077 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2078 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2079 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2080 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2081 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2082 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2083 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_compile)
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2085 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install)
NOTE: recipe logrotate-3.20.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_install: Started
NOTE: Running task 2086 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2087 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2088 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2089 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: Running task 2090 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2091 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 2092 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: Running task 2093 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_configure)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Started
NOTE: recipe logrotate-3.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2095 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_install)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe logrotate-3.20.1-r0: task do_install: Started
NOTE: Running task 2096 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe logrotate-3.20.1-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe logrotate-3.20.1-r0: task do_package: Started
NOTE: Running task 2098 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2099 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: Running task 2100 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 2101 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: Running task 2102 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2103 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: Running task 2104 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2105 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2107 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: Running task 2108 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.11-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.11-r0: task do_configure_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2110 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: Running task 2111 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe tcl-8.6.11-r0: task do_compile: Started
NOTE: Running task 2112 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.20.1-r0: task do_package: Succeeded
NOTE: Running task 2113 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_packagedata)
NOTE: recipe logrotate-3.20.1-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2114 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.20.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.20.1.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2116 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_compile)
NOTE: recipe logrotate-3.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2117 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe libnl-1_3.6.0-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: Running task 2118 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2119 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 2120 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: Running task 2121 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2122 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2124 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: Running task 2125 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: recipe dbus-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 2126 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install_ptest_base)
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2127 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_package)
NOTE: Running task 2128 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2129 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe libnl-1_3.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2130 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.11-r0: task do_compile: Succeeded
NOTE: Running task 2131 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe tcl-8.6.11-r0: task do_compile_ptest_base: Started
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2132 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Started
NOTE: Running task 2133 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe iptables-1.8.8-r0: task do_compile: Succeeded
NOTE: Running task 2134 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2135 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe iptables-1.8.8-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe tcl-8.6.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2137 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_install)
NOTE: recipe iptables-1.8.8-r0: task do_install: Succeeded
NOTE: recipe tcl-8.6.11-r0: task do_install: Started
NOTE: Running task 2138 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_package)
NOTE: Running task 2139 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2141 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2142 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2143 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe ltp-20220527-r0: task do_configure: Succeeded
NOTE: Running task 2144 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_compile)
NOTE: recipe ltp-20220527-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2145 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2146 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2147 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_install)
NOTE: Running task 2148 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe liburcu-0.13.1-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2149 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2150 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 2151 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_populate_sysroot)
NOTE: Running task 2152 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_package)
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2153 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2154 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Started
NOTE: Running task 2155 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2156 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2157 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 2158 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_validate_branches)
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: Running task 2159 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_validate_branches: Started
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_validate_branches: Succeeded
NOTE: Running task 2160 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_metadata: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2161 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2162 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.8-r0: task do_configure: Succeeded
NOTE: Running task 2163 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_configure_ptest_base)
NOTE: recipe diffutils-3.8-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2164 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_compile)
NOTE: recipe diffutils-3.8-r0: task do_compile: Started
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 2165 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2166 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_compile)
NOTE: recipe liburcu-0.13.1-r0: task do_package: Succeeded
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Started
NOTE: Running task 2167 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_packagedata)
NOTE: recipe libnl-1_3.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2168 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_install)
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Succeeded
NOTE: recipe libnl-1_3.6.0-r0: task do_install: Started
NOTE: Running task 2169 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_packagedata)
NOTE: recipe iptables-1.8.8-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_packagedata: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2170 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_install: Started
NOTE: recipe socat-1.7.4.3-r0: task do_install: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2171 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_package)
NOTE: Running task 2172 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_package: Started
NOTE: recipe libidn2-2.3.2-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: Running task 2173 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_compile: Started
NOTE: recipe diffutils-3.8-r0: task do_compile: Succeeded
NOTE: Running task 2174 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.8-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2175 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_install)
NOTE: recipe diffutils-3.8-r0: task do_install: Started
NOTE: recipe socat-1.7.4.3-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 2177 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot)
NOTE: Running task 2178 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 2179 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 2180 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2181 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2182 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.83.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2183 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_configure)
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_metadata: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_configure: Started
NOTE: Running task 2184 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_patch)
NOTE: Running task 2185 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_version_sanity_check)
NOTE: recipe gnutls-3.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2186 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_configure)
NOTE: recipe gnutls-3.7.5-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configme)
NOTE: Running task 2188 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.8-r0: task do_install: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_configme: Started
NOTE: Running task 2189 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.8-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2190 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: Running task 2191 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: recipe tcl-8.6.11-r0: task do_install: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe diffutils-3.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2192 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_install_ptest_base)
NOTE: Running task 2193 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe tcl-8.6.11-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.8-r0: task do_package: Started
NOTE: recipe tcl-8.6.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2194 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_package)
NOTE: Running task 2195 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_populate_sysroot)
NOTE: recipe tcl-8.6.11-r0: task do_populate_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: recipe tcl-8.6.11-r0: task do_package: Started
NOTE: Running task 2196 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2197 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_package: Succeeded
NOTE: Running task 2198 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2199 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_configure)
NOTE: Running task 2200 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_compile: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2201 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_install)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_install: Started
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2202 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe cpio-2.13-r0: task do_configure: Succeeded
NOTE: Running task 2203 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_compile)
NOTE: recipe cpio-2.13-r0: task do_compile: Started
NOTE: recipe tar-1.34-r0: task do_install: Succeeded
NOTE: Running task 2204 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe cpio-2.13-r0: task do_compile: Succeeded
NOTE: Running task 2205 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_install)
NOTE: recipe cpio-2.13-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 2206 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.8-r0: task do_package: Succeeded
NOTE: Running task 2207 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_packagedata)
NOTE: recipe libnl-1_3.6.0-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.8-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2209 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.6.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe cpio-2.13-r0: task do_install: Succeeded
NOTE: Running task 2211 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package)
NOTE: recipe diffutils-3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2212 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: recipe cpio-2.13-r0: task do_package: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2213 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_compile)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2214 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_prepare_recipe_sysroot)
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: Running task 2215 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe quota-4.06-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: Running task 2216 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.06-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2217 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_configure)
NOTE: recipe quota-4.06-r0: task do_configure: Started
NOTE: recipe tcl-8.6.11-r0: task do_package: Succeeded
NOTE: Running task 2218 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.11.bb:do_packagedata)
NOTE: recipe tcl-8.6.11-r0: task do_packagedata: Started
NOTE: recipe cpio-2.13-r0: task do_package: Succeeded
NOTE: Running task 2219 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_packagedata)
NOTE: recipe tcl-8.6.11-r0: task do_packagedata: Succeeded
NOTE: recipe cpio-2.13-r0: task do_packagedata: Started
NOTE: recipe cpio-2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2220 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package_write_rpm)
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 2221 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2222 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2223 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Started
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: Running task 2224 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe libnl-1_3.6.0-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.6.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.6.0-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2226 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_compile)
NOTE: recipe libnl-1_3.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2228 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_package)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2230 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe quota-4.06-r0: task do_configure: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: Running task 2231 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_compile)
NOTE: recipe quota-4.06-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2232 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.06-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_install)
NOTE: recipe quota-4.06-r0: task do_install: Started
NOTE: recipe quota-4.06-r0: task do_install: Succeeded
NOTE: Running task 2234 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_package)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2235 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_packagedata)
NOTE: recipe quota-4.06-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.06-r0: task do_package: Succeeded
NOTE: Running task 2236 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_packagedata)
NOTE: recipe quota-4.06-r0: task do_packagedata: Started
NOTE: recipe quota-4.06-r0: task do_packagedata: Succeeded
NOTE: Running task 2237 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_package_write_rpm)
NOTE: recipe quota-4.06-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.06-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2238 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_configure)
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_configure: Succeeded
NOTE: Running task 2239 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_configcheck: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2240 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Succeeded
NOTE: Running task 2241 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_package)
NOTE: Running task 2242 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_populate_sysroot)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_compile)
NOTE: recipe curl-7.83.1-r0: task do_compile: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Succeeded
NOTE: Running task 2244 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2245 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile)
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_compile: Started
NOTE: recipe curl-7.83.1-r0: task do_compile: Succeeded
NOTE: Running task 2246 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_install)
NOTE: recipe curl-7.83.1-r0: task do_install: Started
NOTE: recipe curl-7.83.1-r0: task do_install: Succeeded
NOTE: Running task 2247 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_populate_sysroot)
NOTE: Running task 2248 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_package)
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_package: Started
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_package: Succeeded
NOTE: Running task 2249 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_packagedata)
NOTE: recipe curl-7.83.1-r0: task do_packagedata: Started
NOTE: recipe curl-7.83.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2250 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_package_write_rpm)
NOTE: recipe curl-7.83.1-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.83.1-r0: task do_package_write_rpm: Succeeded
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56 HOSTCC=gcc  HOST_CFLAGS=-isystem/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native/usr/include -O2 -pipe HOST_LDFLAGS=-L/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native/usr/lib                         -L/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native/lib                         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native/lib                         -Wl,-rpath,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysro
 ot-native/usr/lib                         -Wl,-rpath,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
| make -C "lib" \
| 	-f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/lib/Makefile" all
| make -C "libs" \
| 	-f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/libs/Makefile" all
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/lib'
| if git describe >/dev/null 2>&1; then \
| 	git describe > "Version"; \
| else \
| 	cp /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/VERSION "Version"; \
| fi
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/libs'
| CC lib/self_exec.o
| CC lib/get_path.o
| CC lib/cloner.o
| In file included from safe_stdio.c:23:
| safe_stdio.c: In function 'safe_fclose':
| ../include/old/test.h:147:17: warning: pointer 'f' may be used after 'fclose' [-Wuse-after-free]
|   147 |                 tst_brk_(file, lineno, flags, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_stdio.c:47:17: note: in expansion of macro 'tst_brkm_'
|    47 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_stdio.c:44:15: note: call to 'fclose' here
|    44 |         ret = fclose(f);
|       |               ^~~~~~~~~
| ../include/old/test.h:149:17: warning: pointer 'f' may be used after 'fclose' [-Wuse-after-free]
|   149 |                 tst_brkm__(file, lineno, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_stdio.c:47:17: note: in expansion of macro 'tst_brkm_'
|    47 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_stdio.c:44:15: note: call to 'fclose' here
|    44 |         ret = fclose(f);
|       |               ^~~~~~~~~
| ../include/old/test.h:147:17: warning: pointer 'f' may be used after 'fclose' [-Wuse-after-free]
|   147 |                 tst_brk_(file, lineno, flags, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_stdio.c:50:17: note: in expansion of macro 'tst_brkm_'
|    50 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_stdio.c:44:15: note: call to 'fclose' here
|    44 |         ret = fclose(f);
|       |               ^~~~~~~~~
| ../include/old/test.h:149:17: warning: pointer 'f' may be used after 'fclose' [-Wuse-after-free]
|   149 |                 tst_brkm__(file, lineno, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_stdio.c:50:17: note: in expansion of macro 'tst_brkm_'
|    50 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_stdio.c:44:15: note: call to 'fclose' here
|    44 |         ret = fclose(f);
|       |               ^~~~~~~~~
| CC lib/random_range.o
| CC lib/safe_stdio.o
| CC libs/libltpipc/libipc.o
| tlibio.c: In function 'lio_write_buffer':
| tlibio.c:682:17: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   682 |                 sigset(sig, lio_async_signal_handler);
|       |                 ^~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/param.h:28,
|                  from tlibio.c:95:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| tlibio.c:795:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   795 |                         sighold(sig);
|       |                         ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:802:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   802 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:866:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   866 |                         sighold(sig);
|       |                         ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:873:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   873 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:935:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   935 |                         sighold(sig);
|       |                         ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:942:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   942 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:539:22: warning: unused parameter 'wrd' [-Wunused-parameter]
|   539 |                 long wrd)       /* to allow future features, use zero for now */
|       |                 ~~~~~^~~
| tlibio.c: In function 'lio_read_buffer':
| tlibio.c:1253:17: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|  1253 |                 sigset(sig, lio_async_signal_handler);
|       |                 ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| tlibio.c:1370:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1370 |                         sighold(sig);
|       |                         ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:1377:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1377 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:1439:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1439 |                         sighold(sig);
|       |                         ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:1446:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1446 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:1508:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1508 |                         sighold(sig);
|       |                         ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:1515:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1515 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:1109:22: warning: unused parameter 'wrd' [-Wunused-parameter]
|  1109 |                 long wrd)       /* to allow future features, use zero for now */
|       |                 ~~~~~^~~
| tlibio.c: In function 'lio_check_asyncio':
| tlibio.c:1688:17: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1688 |                 sigrelse(aiocbp->aio_sigevent.sigev_signo);
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c: In function 'lio_wait4asyncio':
| tlibio.c:1907:25: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1907 |                         sigrelse(aiocbp->aio_sigevent.sigev_signo);
|       |                         ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:1919:25: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1919 |                         sigrelse(aiocbp->aio_sigevent.sigev_signo);
|       |                         ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| CC lib/parse_opts.o
| CC lib/safe_pthread.o
| CC lib/tst_ansi_color.o
| tst_af_alg.c: In function 'init_sockaddr_alg':
| tst_af_alg.c:58:9: warning: '__builtin_strncpy' specified bound 14 equals destination size [-Wstringop-truncation]
|    58 |         strncpy((char *)addr->salg_type, algtype, sizeof(addr->salg_type));
|       |         ^
| tst_af_alg.c:62:9: warning: '__builtin_strncpy' specified bound 64 equals destination size [-Wstringop-truncation]
|    62 |         strncpy((char *)addr->salg_name, algname, sizeof(addr->salg_name));
|       |         ^
| CC libs/libltpipc/libmsgctl.o
| AR libltpipc.a
| CC lib/safe_file_ops.o
| CC lib/tst_arch.o
| RANLIB libltpipc.a
| CC lib/tst_assert.o
| CC lib/tst_checksum.o
| tlibio.c: In function 'lio_write_buffer':
| tlibio.c:938:40: warning: '%s' directive writing up to 4095 bytes into a region of size 487 [-Wformat-overflow=]
|   938 |                                 "%s/%d %s failed, fd:%d, nbyte:%d errno=%d %s",
|       |                                        ^~
|   939 |                                 __FILE__, __LINE__, Lio_SysCall, fd, size,
|       |                                                     ~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from tlibio.c:88:
| In function 'sprintf',
|     inlined from 'lio_write_buffer' at tlibio.c:937:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 45 or more bytes (assuming 4140) into a destination of size 500
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| tlibio.c: In function 'lio_write_buffer':
| tlibio.c:938:40: warning: '%s' directive writing up to 4095 bytes into a region of size 487 [-Wformat-overflow=]
|   938 |                                 "%s/%d %s failed, fd:%d, nbyte:%d errno=%d %s",
|       |                                        ^~
|   939 |                                 __FILE__, __LINE__, Lio_SysCall, fd, size,
|       |                                                     ~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'lio_write_buffer' at tlibio.c:937:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 45 or more bytes (assuming 4140) into a destination of size 500
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| tlibio.c: In function 'lio_write_buffer':
| tlibio.c:869:40: warning: '%s' directive writing up to 4095 bytes into a region of size 487 [-Wformat-overflow=]
|   869 |                                 "%s/%d %s failed, fd:%d, nbyte:%d errno=%d %s",
|       |                                        ^~
|   870 |                                 __FILE__, __LINE__, Lio_SysCall, fd, size,
|       |                                                     ~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'lio_write_buffer' at tlibio.c:868:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 45 or more bytes (assuming 4140) into a destination of size 500
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| tlibio.c: In function 'lio_write_buffer':
| tlibio.c:869:40: warning: '%s' directive writing up to 4095 bytes into a region of size 487 [-Wformat-overflow=]
|   869 |                                 "%s/%d %s failed, fd:%d, nbyte:%d errno=%d %s",
|       |                                        ^~
|   870 |                                 __FILE__, __LINE__, Lio_SysCall, fd, size,
|       |                                                     ~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'lio_write_buffer' at tlibio.c:868:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 45 or more bytes (assuming 4140) into a destination of size 500
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC lib/safe_net.o
| CC lib/tst_af_alg.o
| CC lib/tst_buffers.o
| tlibio.c: In function 'lio_read_buffer':
| tlibio.c:1511:40: warning: '%s' directive writing up to 4095 bytes into a region of size 486 [-Wformat-overflow=]
|  1511 |                                 "%s/%d %s failed, fd:%d, nbyte:%d errno=%d %s",
|       |                                        ^~
|  1512 |                                 __FILE__, __LINE__, Lio_SysCall, fd, size,
|       |                                                     ~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'lio_read_buffer' at tlibio.c:1510:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 46 or more bytes (assuming 4141) into a destination of size 500
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| tlibio.c: In function 'lio_read_buffer':
| tlibio.c:1511:40: warning: '%s' directive writing up to 4095 bytes into a region of size 486 [-Wformat-overflow=]
|  1511 |                                 "%s/%d %s failed, fd:%d, nbyte:%d errno=%d %s",
|       |                                        ^~
|  1512 |                                 __FILE__, __LINE__, Lio_SysCall, fd, size,
|       |                                                     ~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'lio_read_buffer' at tlibio.c:1510:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 46 or more bytes (assuming 4141) into a destination of size 500
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| tlibio.c: In function 'lio_read_buffer':
| tlibio.c:1442:40: warning: '%s' directive writing up to 4095 bytes into a region of size 486 [-Wformat-overflow=]
|  1442 |                                 "%s/%d %s failed, fd:%d, nbyte:%d errno=%d %s",
|       |                                        ^~
|  1443 |                                 __FILE__, __LINE__, Lio_SysCall, fd, size,
|       |                                                     ~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'lio_read_buffer' at tlibio.c:1441:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 46 or more bytes (assuming 4141) into a destination of size 500
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| tlibio.c: In function 'lio_read_buffer':
| tlibio.c:1442:40: warning: '%s' directive writing up to 4095 bytes into a region of size 486 [-Wformat-overflow=]
|  1442 |                                 "%s/%d %s failed, fd:%d, nbyte:%d errno=%d %s",
|       |                                        ^~
|  1443 |                                 __FILE__, __LINE__, Lio_SysCall, fd, size,
|       |                                                     ~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'lio_read_buffer' at tlibio.c:1441:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 46 or more bytes (assuming 4141) into a destination of size 500
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC lib/tst_bool_expr.o
| CC lib/tst_capability.o
| CC lib/tst_checkpoint.o
| CC lib/tst_clone.o
| CC lib/tst_coredump.o
| CC libs/libltpnewipc/libnewipc.o
| AR libltpnewipc.a
| CC lib/tst_dir_is_empty.o
| RANLIB libltpnewipc.a
| CC lib/tst_cpu.o
| CC lib/tlibio.o
| CC lib/tst_cmd.o
| CC lib/tst_crypto.o
| CC lib/tst_clocks.o
| CC lib/tst_fill_fs.o
| CC lib/tst_fs_has_free.o
| CC lib/tst_fill_file.o
| CC lib/tst_fips.o
| CC libs/libltpnuma/tst_numa.o
| CC lib/tst_fs_setup.o
| AR libltpnuma.a
| CC lib/tst_fs_type.o
| CC lib/safe_macros.o
| RANLIB libltpnuma.a
| CC lib/tst_get_bad_addr.o
| CC lib/tst_hugepage.o
| CC lib/tst_device.o
| CC lib/tst_fs_link_count.o
| CC lib/tst_cgroup.o
| CC lib/tst_ioctl.o
| CC lib/tst_kvercmp.o
| CC lib/tst_kernel.o
| CC lib/tst_lockdown.o
| CC lib/tst_memutils.o
| CC lib/tst_mkfs.o
| CC lib/tst_parse_opts.o
| CC lib/tst_module.o
| CC lib/tst_kconfig.o
| CC lib/tst_net.o
| CC lib/tst_path_has_mnt_flags.o
| CC lib/tst_pid.o
| CC libs/libltpsigwait/sigwait.o
| AR libltpsigwait.a
| CC lib/tst_process_state.o
| RANLIB libltpsigwait.a
| CC lib/tst_netdevice.o
| CC lib/tst_resource.o
| tst_sig.c: In function 'tst_sig':
| tst_sig.c:210:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   210 |                         if (fork_flag == FORK)
|       |                            ^
| tst_sig.c:213:17: note: here
|   213 |                 default:
|       |                 ^~~~~~~
| CC lib/tst_rtctime.o
| CC lib/tst_sig.o
| CC lib/tst_sig_proc.o
| CC lib/tst_safe_timerfd.o
| CC lib/tst_safe_sysv_ipc.o
| CC lib/tst_safe_io_uring.o
| CC lib/tst_status.o
| CC lib/tst_thread_state.o
| CC libs/libltpswap/libswap.o
| AR libltpswap.a
| CC lib/tst_taint.o
| RANLIB libltpswap.a
| CC lib/tst_rtnetlink.o
| CC lib/tst_safe_file_at.o
| CC lib/tst_supported_fs_types.o
| CC lib/tst_timer.o
| CC lib/tst_safe_macros.o
| CC lib/tst_res.o
| CC lib/tst_sys_conf.o
| CC lib/tst_uid.o
| CC lib/tst_virt.o
| CC lib/tst_wallclock.o
| CC lib/tst_tmpdir.o
| CC libs/libltpuinput/tst_uinput.o
| AR libltpuinput.a
| RANLIB libltpuinput.a
| CC lib/tst_timer_test.o
| CC libs/libltpvdso/vdso_helpers.o
| CC libs/libltpvdso/parse_vdso.o
| AR libltpvdso.a
| RANLIB libltpvdso.a
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/libs'
| CC lib/tst_test.o
| AR libltp.a
| RANLIB libltp.a
| CC lib/newlib_tests/test03
| CC lib/newlib_tests/test01
| CC lib/newlib_tests/test02
| CC lib/newlib_tests/test05
| CC lib/newlib_tests/test04
| CC lib/newlib_tests/test06
| CC lib/newlib_tests/test07
| CC lib/newlib_tests/test11
| CC lib/newlib_tests/test09
| CC lib/newlib_tests/test13
| CC lib/newlib_tests/test08
| CC lib/newlib_tests/test14
| CC lib/newlib_tests/test19
| CC lib/newlib_tests/test20
| CC lib/newlib_tests/test_children_cleanup
| CC lib/newlib_tests/test22
| CC lib/newlib_tests/test15
| CC lib/newlib_tests/test_assert
| CC lib/newlib_tests/test_exec
| CC lib/newlib_tests/test_exec_child
| CC lib/newlib_tests/test_kconfig
| CC lib/newlib_tests/test_kconfig01
| CC lib/newlib_tests/test_guarded_buf
| CC lib/newlib_tests/test_kconfig02
| CC lib/newlib_tests/test_macros02
| CC lib/newlib_tests/test_macros01
| CC lib/newlib_tests/test_macros03
| CC lib/newlib_tests/test_macros04
| CC lib/newlib_tests/test_macros05
| CC lib/newlib_tests/test_macros06
| CC lib/newlib_tests/test_parse_filesize
| CC lib/newlib_tests/test_runtime01
| CC lib/newlib_tests/test_runtime02
| CC lib/newlib_tests/test_zero_hugepage
| CC lib/newlib_tests/tst_capability01
| CC lib/newlib_tests/tst_capability02
| CC lib/newlib_tests/tst_bool_expr
| CC lib/newlib_tests/tst_cgroup01
| CC lib/newlib_tests/tst_cgroup02
| CC lib/newlib_tests/tst_expiration_timer
| CC lib/newlib_tests/tst_device
| CC lib/newlib_tests/tst_needs_cmds01
| CC lib/newlib_tests/test_timer
| CC lib/newlib_tests/tst_needs_cmds03
| CC lib/newlib_tests/tst_needs_cmds04
| CC lib/newlib_tests/tst_needs_cmds02
| CC lib/newlib_tests/tst_needs_cmds05
| CC lib/newlib_tests/tst_needs_cmds08
| CC lib/newlib_tests/tst_needs_cmds06
| CC lib/newlib_tests/tst_needs_cmds07
| CC lib/newlib_tests/tst_print_result
| CC lib/newlib_tests/tst_strstatus
| CC lib/newlib_tests/tst_res_hexd
| CC lib/newlib_tests/variant
| CC lib/newlib_tests/tst_safe_fileops
| CC lib/newlib_tests/tst_fuzzy_sync01
| CC lib/newlib_tests/tst_fuzzy_sync03
| CC lib/newlib_tests/tst_fuzzy_sync02
| tst_dataroot02.c: In function 'main':
| tst_dataroot02.c:51:36: warning: '/datafiles' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    51 |         snprintf(tmp, PATH_MAX, "%s/datafiles", curdir);
|       |                                    ^~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../include/old/test.h:14,
|                  from tst_dataroot02.c:23:
| In function 'snprintf',
|     inlined from 'main' at tst_dataroot02.c:51:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 11 and 4106 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| tst_dataroot03.c: In function 'main':
| tst_dataroot03.c:51:36: warning: '/datafiles' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    51 |         snprintf(tmp, PATH_MAX, "%s/datafiles", curdir);
|       |                                    ^~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../include/old/test.h:14,
|                  from tst_dataroot03.c:23:
| In function 'snprintf',
|     inlined from 'main' at tst_dataroot03.c:51:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 11 and 4106 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC lib/tests/tst_cleanup_once
| CC lib/tests/tst_checkpoint_wait_timeout
| CC lib/tests/tst_checkpoint_wake_timeout
| CC lib/tests/tst_checkpoint
| CC lib/tests/tst_dataroot01
| CC lib/tests/trerrno
| CC lib/tests/tst_dataroot02
| CC lib/tests/tst_dataroot03
| CC lib/tests/tst_device
| CC lib/tests/tst_fs_fill_hardlinks
| CC lib/tests/tst_fs_fill_subdirs
| CC lib/tests/tst_process_state
| CC lib/tests/tst_record_childstatus
| CC lib/tests/tst_strerrno
| CC lib/tests/tst_safe_macros
| CC lib/tests/tst_tmpdir_test
| CC lib/tests/tst_strsig
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/lib'
| make -C "pan" \
| 	-f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/pan/Makefile" all
| make -C "utils" \
| 	-f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/utils/Makefile" all
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/pan'
| make -C "testcases" \
| 	-f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/Makefile" all
| make -C "tools" \
| 	-f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/Makefile" all
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/utils'
| make -C "metadata" \
| 	-f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/metadata/Makefile" all
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases'
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools'
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/metadata'
| make[4]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC pan/splitstr.o
| CC pan/ltp-bump.o
| zoolib.c: In function 'cat_args':
| zoolib.c:386:14: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
|   386 |         *cmd = '\0';
|       |         ~~~~~^~~~~~
| zoolib.c:380:20: note: destination object of size 0 allocated by 'malloc'
|   380 |         if ((cmd = malloc(size)) == NULL) {
|       |                    ^~~~~~~~~~~~
| CC pan/zoolib.o
| CC testcases/commands/eject/eject_check_tray
| LD pan/ltp-bump
| CC tools/apicmds/ltpapicmd.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_brk
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_brkm
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_exit
| CC utils/benchmark/ebizzy-0.3/ebizzy
| make[3]: Nothing to be done for 'all'.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_res
| make -C "lib" -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/utils/sctp/lib/Makefile" all
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_resm
| make -C "testlib" -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/utils/sctp/testlib/Makefile" all
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_ncpus
| CC testcases/commands/file/datafiles/in
| make[3]: Nothing to be done for 'all'.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_ncpus_conf
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_ncpus_max
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../lib  ltpapicmd.o  -lltp -o tst_fs_has_free
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC utils/sctp/lib/bindx.o
| connectx.c:78:12: warning: 'sctp_connectx_orig' alias between functions of incompatible types 'int(int)' and 'int(int,  struct sockaddr *, int)' [-Wattribute-alias=]
|    78 | extern int sctp_connectx_orig (int)
|       |            ^~~~~~~~~~~~~~~~~~
| connectx.c:67:5: note: aliased declaration here
|    67 | int __sctp_connectx(int fd, struct sockaddr *addrs, int addrcnt)
|       |     ^~~~~~~~~~~~~~~
| CC utils/sctp/lib/opt_info.o
| CC utils/sctp/lib/peeloff.o
| CC utils/sctp/lib/addrs.o
| CC utils/sctp/lib/recvmsg.o
| CC utils/sctp/lib/sendmsg.o
| CC testcases/commands/ldd/datafiles/lddfile1.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -shared -o lddfile1.obj.so lddfile1.o
| CC utils/sctp/lib/connectx.o
| CC testcases/commands/ldd/datafiles/main.o
| AR libsctp.a
| RANLIB libsctp.a
| CC testcases/commands/ldd/datafiles/lddfile3.o
| HOSTCC metadata/metaparse
| CC testcases/commands/ldd/datafiles/lddfile2.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/metadata/parse.sh > ltp.json
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -shared -o lddfile2.obj.so lddfile2.o
| CC testcases/commands/ldd/datafiles/lddfile4.o
| CC testcases/commands/ldd/datafiles/lddfile5.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -shared -o lddfile3.obj.so lddfile3.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -shared -o lddfile4.obj.so lddfile4.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -shared -o lddfile5.obj.so lddfile5.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -O -o lddfile.out main.o lddfile1.obj.so lddfile2.obj.so lddfile3.obj.so lddfile4.obj.so lddfile5.obj.so
| CC utils/sctp/testlib/sctputil.o
| stress.c: In function 'main':
| stress.c:95:13: warning: variable 'do_timeout' set but not used [-Wunused-but-set-variable]
|    95 |         int do_timeout = 0;
|       |             ^~~~~~~~~~
| stress.c: In function 'hogcpu':
| stress.c:468:16: warning: variable 'd' set but not used [-Wunused-but-set-variable]
|   468 |         double d;
|       |                ^
| AR libsctputil.a
| genload.c: In function 'main':
| genload.c:95:13: warning: variable 'do_timeout' set but not used [-Wunused-but-set-variable]
|    95 |         int do_timeout = 0;
|       |             ^~~~~~~~~~
| genload.c: In function 'hogcpu':
| genload.c:468:16: warning: variable 'd' set but not used [-Wunused-but-set-variable]
|   468 |         double d;
|       |                ^
| RANLIB libsctputil.a
| rm lddfile2.o lddfile1.o lddfile4.o lddfile3.o lddfile5.o
| make[4]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| test_1_to_1_connectx.c: In function 'main':
| test_1_to_1_connectx.c:137:17: warning: array subscript 'struct sockaddr[0]' is partly outside array bounds of 'unsigned char[15]' [-Warray-bounds]
|   137 |         tmp_addr->sa_family = AF_INET;
|       |                 ^~
| test_1_to_1_connectx.c:136:40: note: object of size 15 allocated by 'malloc'
|   136 |         tmp_addr = (struct sockaddr *) malloc(sizeof(struct sockaddr) - 1);
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/commands/nm/datafiles/f3.o
| CC testcases/commands/nm/datafiles/f1.o
| CC pan/ltp-pan.o
| CC testcases/commands/nm/datafiles/f2.o
| x86_64-poky-linux-gcc-ar rcs lib.a f1.o f2.o f3.o
| CC utils/sctp/func_tests/test_1_to_1_rtoinfo
| CC utils/sctp/func_tests/test_1_to_1_connectx
| CC utils/sctp/func_tests/test_1_to_1_addrs
| CC utils/sctp/func_tests/test_1_to_1_events
| LD testcases/commands/nm/datafiles/f1
| LD testcases/commands/nm/datafiles/f3
| CC utils/sctp/func_tests/test_1_to_1_connect
| CC utils/sctp/func_tests/test_1_to_1_initmsg_connect
| CC utils/sctp/func_tests/test_1_to_1_recvfrom
| CC utils/sctp/func_tests/test_1_to_1_recvmsg
| CC utils/sctp/func_tests/test_1_to_1_accept_close
| CC utils/sctp/func_tests/test_1_to_1_sendmsg
| CC utils/sctp/func_tests/test_1_to_1_sendto
| LD pan/ltp-pan
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/pan'
| LD testcases/commands/nm/datafiles/f2
| CC utils/sctp/func_tests/test_basic_v6.o
| CC utils/sctp/func_tests/test_1_to_1_nonblock
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_1_to_1_send
| make[3]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_1_to_1_socket_bind_listen
| CC utils/sctp/func_tests/test_1_to_1_sockopt
| CC utils/sctp/func_tests/test_1_to_1_threads
| CC utils/sctp/func_tests/test_assoc_shutdown
| CC utils/sctp/func_tests/test_assoc_abort
| CC utils/sctp/func_tests/test_autoclose
| CC utils/sctp/func_tests/test_connect
| CC utils/sctp/func_tests/test_connectx
| CC utils/sctp/func_tests/test_getname
| CC utils/sctp/func_tests/test_recvmsg
| CC utils/sctp/func_tests/test_fragments_v6.o
| CC utils/sctp/func_tests/test_getname_v6.o
| CC utils/sctp/func_tests/test_inaddr_any_v6.o
| CC utils/sctp/func_tests/test_peeloff_v6.o
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_sctp_sendrecvmsg_v6.o
| CC utils/sctp/func_tests/test_fragments
| CC utils/sctp/func_tests/test_sockopt_v6.o
| CC utils/sctp/func_tests/test_inaddr_any
| make[5]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_tcp_style_v6.o
| CC utils/sctp/func_tests/test_timetolive_v6.o
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_1_to_1_shutdown
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_basic
| make[3]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_peeloff
| CC utils/sctp/func_tests/test_sctp_sendrecvmsg
| make[4]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC tools/genload/stress
| CC utils/sctp/func_tests/test_timetolive
| CC utils/sctp/func_tests/test_tcp_style
| LD utils/sctp/func_tests/test_getname_v6
| CC tools/genload/genload
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools'
| LD utils/sctp/func_tests/test_fragments_v6
| CC utils/sctp/func_tests/test_sockopt
| LD utils/sctp/func_tests/test_inaddr_any_v6
| LD utils/sctp/func_tests/test_sctp_sendrecvmsg_v6
| LD utils/sctp/func_tests/test_timetolive_v6
| LD utils/sctp/func_tests/test_basic_v6
| CC testcases/cve/cve-2016-10044
| LD utils/sctp/func_tests/test_peeloff_v6
| LD utils/sctp/func_tests/test_tcp_style_v6
| cve-2017-2618.c: In function 'do_test':
| cve-2017-2618.c:39:25: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    39 |                         write(fd, "\n", 1);
|       |                         ^~~~~~~~~~~~~~~~~~
| CC testcases/cve/cve-2017-16939
| stack_clash.c: In function 'exhaust_stack_into_sigsegv':
| stack_clash.c:48:6: warning: infinite recursion detected [-Winfinite-recursion]
|    48 | void exhaust_stack_into_sigsegv(void)
|       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
| stack_clash.c:52:9: note: recursive call
|    52 |         exhaust_stack_into_sigsegv();
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| LD utils/sctp/func_tests/test_sockopt_v6
| rm test_fragments_v6.o test_getname_v6.o test_basic_v6.o test_peeloff_v6.o test_tcp_style_v6.o test_inaddr_any_v6.o test_sockopt_v6.o test_sctp_sendrecvmsg_v6.o test_timetolive_v6.o
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/utils'
| CC testcases/cve/cve-2016-7042
| CC testcases/cve/cve-2015-3290
| CC testcases/cve/cve-2017-17053
| CC testcases/cve/cve-2017-17052
| CC testcases/cve/cve-2017-2618
| CC testcases/cve/stack_clash
| CC testcases/cve/icmp_rate_limit01
| CC testcases/cve/meltdown
| CC testcases/cve/cve-2016-7117
| CC testcases/cve/cve-2014-0196
| CC testcases/cve/cve-2017-2671
| CC testcases/kernel/syscalls/abort/abort01
| CC testcases/kernel/syscalls/accept4/accept4_01
| CC testcases/kernel/syscalls/accept/accept02
| CC testcases/kernel/syscalls/accept/accept01
| CC testcases/kernel/syscalls/access/access03
| CC testcases/kernel/syscalls/access/access04
| CC testcases/kernel/syscalls/access/access01
| CC testcases/kernel/syscalls/access/access02
| CC testcases/kernel/syscalls/acct/acct02_helper
| CC testcases/kernel/syscalls/acct/acct01
| CC testcases/kernel/syscalls/acct/acct02
| add_key05.c: In function 'do_test':
| add_key05.c:148:35: warning: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Wformat-overflow=]
|   148 |                 sprintf(desc, "abc%d", i);
|       |                                   ^~
| In function 'verify_max_keys',
|     inlined from 'do_test' at add_key05.c:194:4:
| add_key05.c:148:31: note: directive argument in the range [-2147483647, 2147483647]
|   148 |                 sprintf(desc, "abc%d", i);
|       |                               ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from add_key05.c:19:
| In function 'sprintf',
|     inlined from 'verify_max_keys' at add_key05.c:148:3,
|     inlined from 'do_test' at add_key05.c:194:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 5 and 15 bytes into a destination of size 10
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/add_key/add_key01
| CC testcases/kernel/syscalls/add_key/add_key02
| CC testcases/kernel/syscalls/add_key/add_key03
| CC testcases/kernel/syscalls/add_key/add_key04
| CC testcases/kernel/syscalls/add_key/add_key05
| CC testcases/kernel/syscalls/adjtimex/adjtimex03
| CC testcases/kernel/syscalls/adjtimex/adjtimex01
| CC testcases/kernel/syscalls/adjtimex/adjtimex02
| CC testcases/kernel/syscalls/alarm/alarm02
| CC testcases/kernel/syscalls/alarm/alarm07
| CC testcases/kernel/syscalls/alarm/alarm03
| CC testcases/kernel/syscalls/alarm/alarm05
| CC testcases/kernel/syscalls/alarm/alarm06
| CC testcases/kernel/syscalls/bind/bind02
| CC testcases/kernel/syscalls/bind/bind01
| CC testcases/kernel/syscalls/bind/bind03
| CC testcases/kernel/syscalls/bind/bind04
| CC testcases/kernel/syscalls/bind/bind05
| CC testcases/kernel/syscalls/bind/bind06
| CC testcases/kernel/syscalls/bpf/bpf_common.o
| CC testcases/kernel/syscalls/bpf/bpf_prog01
| CC testcases/kernel/syscalls/bpf/bpf_map01
| CC testcases/kernel/syscalls/bpf/bpf_prog02
| CC testcases/kernel/syscalls/bpf/bpf_prog04
| CC testcases/kernel/syscalls/bpf/bpf_prog03
| CC testcases/kernel/syscalls/bpf/bpf_prog05
| CC testcases/kernel/syscalls/brk/brk01
| CC testcases/kernel/syscalls/brk/brk02
| CC testcases/kernel/syscalls/cacheflush/cacheflush01
| CC testcases/kernel/syscalls/capget/capget01
| CC testcases/kernel/syscalls/capget/capget02
| CC testcases/kernel/syscalls/capset/capset02
| CC testcases/kernel/syscalls/capset/capset03
| CC testcases/kernel/syscalls/capset/capset04
| CC testcases/kernel/syscalls/capset/capset01
| CC testcases/kernel/syscalls/chdir/chdir04
| CC testcases/kernel/syscalls/chdir/chdir01
| CC testcases/kernel/syscalls/chmod/chmod06
| CC testcases/kernel/syscalls/chmod/chmod03
| CC testcases/kernel/syscalls/chmod/chmod07
| CC testcases/kernel/syscalls/chmod/chmod01
| CC testcases/kernel/syscalls/chmod/chmod05
| CC testcases/kernel/syscalls/chown/chown01_16.o
| CC testcases/kernel/syscalls/chown/chown02_16.o
| CC testcases/kernel/syscalls/chown/chown03_16.o
| CC testcases/kernel/syscalls/chown/chown04_16.o
| CC testcases/kernel/syscalls/chown/chown05_16.o
| CC testcases/kernel/syscalls/chown/chown01.o
| CC testcases/kernel/syscalls/chown/chown05.o
| CC testcases/kernel/syscalls/chown/chown02.o
| CC testcases/kernel/syscalls/chown/chown03.o
| CC testcases/kernel/syscalls/chown/chown04.o
| LD testcases/kernel/syscalls/chown/chown01
| LD testcases/kernel/syscalls/chown/chown02
| LD testcases/kernel/syscalls/chown/chown03
| LD testcases/kernel/syscalls/chown/chown05
| LD testcases/kernel/syscalls/chown/chown04
| LD testcases/kernel/syscalls/chown/chown04_16
| LD testcases/kernel/syscalls/chown/chown05_16
| LD testcases/kernel/syscalls/chown/chown02_16
| LD testcases/kernel/syscalls/chown/chown03_16
| LD testcases/kernel/syscalls/chown/chown01_16
| rm chown01.o chown03.o chown02.o chown04_16.o chown05.o chown02_16.o chown01_16.o chown04.o chown03_16.o chown05_16.o
| CC testcases/kernel/syscalls/chroot/chroot02
| CC testcases/kernel/syscalls/chroot/chroot04
| CC testcases/kernel/syscalls/chroot/chroot01
| CC testcases/kernel/syscalls/chroot/chroot03
| CC testcases/kernel/syscalls/clock_adjtime/clock_adjtime02
| CC testcases/kernel/syscalls/clock_adjtime/clock_adjtime01
| CC testcases/kernel/syscalls/clock_getres/clock_getres01
| BUILD libltpvdso.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime02
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime01
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime04
| CC testcases/kernel/syscalls/clock_gettime/leapsec01
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime03
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep02
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03
| clock_settime02.c:17: warning: "NSEC_PER_SEC" redefined
|    17 | #define NSEC_PER_SEC (1000000000L)
|       |
| In file included from ../../../../include/tst_timer.h:20,
|                  from ../../../../include/time64_variants.h:20,
|                  from clock_settime02.c:12:
| ../../../../include/lapi/common_timers.h:15: note: this is the location of the previous definition
|    15 | #define NSEC_PER_SEC (1000000000LL)
|       |
| CC testcases/kernel/syscalls/clock_settime/clock_settime02
| CC testcases/kernel/syscalls/clock_settime/clock_settime03
| CC testcases/kernel/syscalls/clock_settime/clock_settime01
| CC testcases/kernel/syscalls/clone3/clone302
| CC testcases/kernel/syscalls/clone3/clone301
| clone02.c: In function 'sig_child_defined_handler':
| clone02.c:456:43: warning: unused parameter 'pid' [-Wunused-parameter]
|   456 | static void sig_child_defined_handler(int pid)
|       |                                       ~~~~^~~
| CC testcases/kernel/syscalls/clone/clone01
| CC testcases/kernel/syscalls/clone/clone04
| CC testcases/kernel/syscalls/clone/clone05
| CC testcases/kernel/syscalls/clone/clone06
| CC testcases/kernel/syscalls/clone/clone03
| CC testcases/kernel/syscalls/clone/clone07
| CC testcases/kernel/syscalls/clone/clone02
| CC testcases/kernel/syscalls/clone/clone09
| CC testcases/kernel/syscalls/clone/clone08
| CC testcases/kernel/syscalls/close/close01
| CC testcases/kernel/syscalls/close/close02
| CC testcases/kernel/syscalls/close_range/close_range01
| CC testcases/kernel/syscalls/close_range/close_range02
| process_vm01.c: In function 'setup':
| process_vm01.c:97:25: warning: unused parameter 'argv' [-Wunused-parameter]
|    97 | static void setup(char *argv[])
|       |                   ~~~~~~^~~~~~
| CC testcases/kernel/syscalls/cma/process_vm_readv02
| CC testcases/kernel/syscalls/cma/process_vm_writev02
| CC testcases/kernel/syscalls/cma/process_vm01
| CC testcases/kernel/syscalls/cma/process_vm_readv03
| CC testcases/kernel/syscalls/confstr/confstr01
| CC testcases/kernel/syscalls/connect/connect02
| CC testcases/kernel/syscalls/connect/connect01
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range03
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range02
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range01
| CC testcases/kernel/syscalls/creat/creat07_child
| CC testcases/kernel/syscalls/creat/creat03
| CC testcases/kernel/syscalls/creat/creat06
| CC testcases/kernel/syscalls/creat/creat01
| CC testcases/kernel/syscalls/creat/creat07
| CC testcases/kernel/syscalls/creat/creat04
| CC testcases/kernel/syscalls/creat/creat05
| CC testcases/kernel/syscalls/creat/creat08
| CC testcases/kernel/syscalls/creat/creat09
| CC testcases/kernel/syscalls/delete_module/delete_module01
| CC testcases/kernel/syscalls/delete_module/delete_module02
| CC testcases/kernel/syscalls/delete_module/delete_module03
| CC testcases/kernel/syscalls/dup2/dup201
| CC testcases/kernel/syscalls/dup2/dup203
| CC testcases/kernel/syscalls/dup2/dup202
| CC testcases/kernel/syscalls/dup2/dup204
| CC testcases/kernel/syscalls/dup2/dup205
| CC testcases/kernel/syscalls/dup2/dup207
| CC testcases/kernel/syscalls/dup2/dup206
| CC testcases/kernel/syscalls/dup3/dup3_02
| CC testcases/kernel/syscalls/dup3/dup3_01
| CC testcases/kernel/syscalls/dup/dup02
| CC testcases/kernel/syscalls/dup/dup04
| CC testcases/kernel/syscalls/dup/dup06
| CC testcases/kernel/syscalls/dup/dup05
| CC testcases/kernel/syscalls/dup/dup03
| CC testcases/kernel/syscalls/dup/dup07
| CC testcases/kernel/syscalls/dup/dup01
| CC testcases/kernel/syscalls/epoll_create1/epoll_create1_01
| CC testcases/kernel/syscalls/epoll_create1/epoll_create1_02
| CC testcases/kernel/syscalls/epoll_create/epoll_create01
| CC testcases/kernel/syscalls/epoll_create/epoll_create02
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl03
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl04
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl01
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl05
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl02
| CC testcases/kernel/syscalls/epoll/epoll-ltp
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait03
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait02
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait01
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait04
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait05
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait03
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait02
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait01
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait04
| CC testcases/kernel/syscalls/eventfd2/eventfd2_01
| CC testcases/kernel/syscalls/eventfd2/eventfd2_02
| CC testcases/kernel/syscalls/eventfd2/eventfd2_03
| eventfd01.c: In function 'myeventfd':
| eventfd01.c:73:48: warning: unused parameter 'flags' [-Wunused-parameter]
|    73 | static int myeventfd(unsigned int initval, int flags)
|       |                                            ~~~~^~~~~
| CC testcases/kernel/syscalls/eventfd/eventfd01
| CC testcases/kernel/syscalls/execle/execle01
| CC testcases/kernel/syscalls/execle/execle01_child
| CC testcases/kernel/syscalls/execl/execl01
| CC testcases/kernel/syscalls/execl/execl01_child
| CC testcases/kernel/syscalls/execlp/execlp01
| CC testcases/kernel/syscalls/execlp/execlp01_child
| In file included from execveat01.c:28:
| execveat.h: In function 'check_execveat':
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~
| In file included from ../../../../include/tst_test.h:14,
|                  from execveat01.c:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| In file included from execveat02.c:26:
| execveat.h: In function 'check_execveat':
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~
| In file included from ../../../../include/tst_test.h:14,
|                  from execveat02.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| execveat01.c: In function 'setup':
| execveat01.c:72:35: warning: '%s' directive writing 22 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    72 |         sprintf(app_abs_path, "%s/%s", cur_dir_path, TEST_REL_APP);
|       |                                   ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from execveat01.c:22:
| In function 'sprintf',
|     inlined from 'setup' at execveat01.c:72:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 24 and 535 bytes into a destination of size 512
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| In file included from execveat03.c:35:
| execveat.h: In function 'check_execveat':
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~
| In file included from ../../../../include/tst_test.h:14,
|                  from execveat03.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| execveat02.c: In function 'setup':
| execveat02.c:80:35: warning: '%s' directive writing 22 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    80 |         sprintf(app_abs_path, "%s/%s", cur_dir_path, TEST_REL_APP);
|       |                                   ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from execveat02.c:20:
| In function 'sprintf',
|     inlined from 'setup' at execveat02.c:80:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 24 and 535 bytes into a destination of size 512
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| execveat02.c: In function 'setup':
| execveat02.c:81:35: warning: '%s' directive writing 24 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    81 |         sprintf(app_sym_path, "%s/%s", cur_dir_path, TEST_ERL_SYMLINK);
|       |                                   ^~
| In function 'sprintf',
|     inlined from 'setup' at execveat02.c:81:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 26 and 537 bytes into a destination of size 512
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| In function 'check_execveat',
|     inlined from 'setup' at execveat03.c:67:2:
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h: In function 'setup':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| execveat.h: In function 'check_execveat':
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| CC testcases/kernel/syscalls/execveat/execveat_errno
| CC testcases/kernel/syscalls/execveat/execveat01
| CC testcases/kernel/syscalls/execveat/execveat_child
| CC testcases/kernel/syscalls/execveat/execveat02
| CC testcases/kernel/syscalls/execveat/execveat03
| CC testcases/kernel/syscalls/execve/execve01_child
| execve03.c: In function 'setup':
| execve03.c:97:32: warning: '/fake' directive writing 5 bytes into a region of size between 1 and 1024 [-Wformat-overflow=]
|    97 |         sprintf(test_name3, "%s/fake", test_name5);
|       |                                ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from execve03.c:47:
| In function 'sprintf',
|     inlined from 'setup' at execve03.c:97:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 6 and 1029 bytes into a destination of size 1024
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/execve/execve01
| CC testcases/kernel/syscalls/execve/execve05
| CC testcases/kernel/syscalls/execve/execve_child
| CC testcases/kernel/syscalls/execve/execve02
| CC testcases/kernel/syscalls/execve/execve04
| CC testcases/kernel/syscalls/execve/execve03
| CC testcases/kernel/syscalls/execv/execv01
| CC testcases/kernel/syscalls/execv/execv01_child
| CC testcases/kernel/syscalls/execvp/execvp01_child
| CC testcases/kernel/syscalls/execvp/execvp01
| CC testcases/kernel/syscalls/exit_group/exit_group01
| CC testcases/kernel/syscalls/exit/exit01
| CC testcases/kernel/syscalls/exit/exit02
| CC testcases/kernel/syscalls/faccessat/faccessat01
| CC testcases/kernel/syscalls/fadvise/posix_fadvise02_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise01_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise03_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise04_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise01
| CC testcases/kernel/syscalls/fadvise/posix_fadvise02
| CC testcases/kernel/syscalls/fadvise/posix_fadvise04
| LD testcases/kernel/syscalls/fadvise/posix_fadvise01_64
| CC testcases/kernel/syscalls/fadvise/posix_fadvise03
| LD testcases/kernel/syscalls/fadvise/posix_fadvise02_64
| LD testcases/kernel/syscalls/fadvise/posix_fadvise03_64
| LD testcases/kernel/syscalls/fadvise/posix_fadvise04_64
| rm posix_fadvise03_64.o posix_fadvise02_64.o posix_fadvise04_64.o posix_fadvise01_64.o
| CC testcases/kernel/syscalls/fallocate/fallocate02
| CC testcases/kernel/syscalls/fallocate/fallocate03
| CC testcases/kernel/syscalls/fallocate/fallocate05
| CC testcases/kernel/syscalls/fallocate/fallocate01
| CC testcases/kernel/syscalls/fallocate/fallocate06
| CC testcases/kernel/syscalls/fallocate/fallocate04
| CC testcases/kernel/syscalls/fanotify/fanotify08
| CC testcases/kernel/syscalls/fanotify/fanotify_child
| CC testcases/kernel/syscalls/fanotify/fanotify02
| CC testcases/kernel/syscalls/fanotify/fanotify11
| CC testcases/kernel/syscalls/fanotify/fanotify07
| CC testcases/kernel/syscalls/fanotify/fanotify01
| CC testcases/kernel/syscalls/fanotify/fanotify18
| CC testcases/kernel/syscalls/fanotify/fanotify03
| CC testcases/kernel/syscalls/fanotify/fanotify04
| fanotify21.c:42:1: warning: useless storage class specifier in empty declaration
|    42 | };
|       | ^
| CC testcases/kernel/syscalls/fanotify/fanotify06
| CC testcases/kernel/syscalls/fanotify/fanotify12
| CC testcases/kernel/syscalls/fanotify/fanotify14
| CC testcases/kernel/syscalls/fanotify/fanotify09
| CC testcases/kernel/syscalls/fanotify/fanotify13
| CC testcases/kernel/syscalls/fanotify/fanotify05
| CC testcases/kernel/syscalls/fanotify/fanotify17
| CC testcases/kernel/syscalls/fanotify/fanotify19
| CC testcases/kernel/syscalls/fanotify/fanotify20
| CC testcases/kernel/syscalls/fanotify/fanotify15
| CC testcases/kernel/syscalls/fanotify/fanotify10
| CC testcases/kernel/syscalls/fanotify/fanotify21
| CC testcases/kernel/syscalls/fanotify/fanotify22
| CC testcases/kernel/syscalls/fanotify/fanotify16
| CC testcases/kernel/syscalls/fchdir/fchdir01
| CC testcases/kernel/syscalls/fchdir/fchdir03
| CC testcases/kernel/syscalls/fchdir/fchdir02
| CC testcases/kernel/syscalls/fchmodat/fchmodat01
| CC testcases/kernel/syscalls/fchmod/fchmod02
| CC testcases/kernel/syscalls/fchmod/fchmod03
| CC testcases/kernel/syscalls/fchmod/fchmod01
| CC testcases/kernel/syscalls/fchmod/fchmod04
| CC testcases/kernel/syscalls/fchmod/fchmod05
| CC testcases/kernel/syscalls/fchmod/fchmod06
| CC testcases/kernel/syscalls/fchownat/fchownat01
| CC testcases/kernel/syscalls/fchownat/fchownat02
| CC testcases/kernel/syscalls/fchown/fchown01_16.o
| CC testcases/kernel/syscalls/fchown/fchown02_16.o
| CC testcases/kernel/syscalls/fchown/fchown03_16.o
| CC testcases/kernel/syscalls/fchown/fchown04_16.o
| CC testcases/kernel/syscalls/fchown/fchown05_16.o
| CC testcases/kernel/syscalls/fchown/fchown02.o
| CC testcases/kernel/syscalls/fchown/fchown01.o
| CC testcases/kernel/syscalls/fchown/fchown03.o
| CC testcases/kernel/syscalls/fchown/fchown04.o
| CC testcases/kernel/syscalls/fchown/fchown05.o
| LD testcases/kernel/syscalls/fchown/fchown02
| LD testcases/kernel/syscalls/fchown/fchown03
| LD testcases/kernel/syscalls/fchown/fchown01
| LD testcases/kernel/syscalls/fchown/fchown04
| LD testcases/kernel/syscalls/fchown/fchown05
| LD testcases/kernel/syscalls/fchown/fchown01_16
| LD testcases/kernel/syscalls/fchown/fchown04_16
| LD testcases/kernel/syscalls/fchown/fchown05_16
| LD testcases/kernel/syscalls/fchown/fchown02_16
| LD testcases/kernel/syscalls/fchown/fchown03_16
| rm fchown04_16.o fchown05.o fchown02_16.o fchown02.o fchown03_16.o fchown03.o fchown04.o fchown01.o fchown05_16.o fchown01_16.o
| fcntl06.c: In function 'main':
| fcntl06.c:74:13: warning: variable 'fail' set but not used [-Wunused-but-set-variable]
|    74 |         int fail = 0;
|       |             ^~~~
| fcntl14.c: In function 'run_test':
| fcntl14.c:826:17: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   826 |                 (void)sighold(SIGUSR1);
|       |                 ^
| In file included from fcntl14.c:46:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| fcntl14.c:854:25: warning: 'sigpause' is deprecated: Use the sigsuspend function instead [-Wdeprecated-declarations]
|   854 |                         sigpause(SIGUSR1);
|       |                         ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:151:12: note: declared here
|   151 | extern int sigpause (int __sig) __asm__ ("__xpg_sigpause")
|       |            ^~~~~~~~
| fcntl14.c: In function 'catch_alarm':
| fcntl14.c:902:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   902 | void catch_alarm(int sig)
|       |                  ~~~~^~~
| fcntl14.c: In function 'catch1':
| fcntl14.c:917:17: warning: unused parameter 'sig' [-Wunused-parameter]
|   917 | void catch1(int sig)
|       |             ~~~~^~~
| fcntl14.c: In function 'main':
| fcntl14.c:1079:17: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1079 |                 if (sighold(SIGUSR1) < 0)
|       |                 ^~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| fcntl14.c:1105:17: warning: 'sigpause' is deprecated: Use the sigsuspend function instead [-Wdeprecated-declarations]
|  1105 |                 (void)sigpause(SIGUSR1);
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:151:12: note: declared here
|   151 | extern int sigpause (int __sig) __asm__ ("__xpg_sigpause")
|       |            ^~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl03
| CC testcases/kernel/syscalls/fcntl/fcntl04
| fcntl16.c: In function 'catch_alarm':
| fcntl16.c:351:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   351 | void catch_alarm(int sig)
|       |                  ~~~~^~~
| fcntl16.c: In function 'catch_usr1':
| fcntl16.c:356:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   356 | void catch_usr1(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_usr2':
| fcntl16.c:365:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   365 | void catch_usr2(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_int':
| fcntl16.c:374:20: warning: unused parameter 'sig' [-Wunused-parameter]
|   374 | void catch_int(int sig)
|       |                ~~~~^~~
| fcntl16.c: In function 'run_test':
| fcntl16.c:458:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   458 |                 (void)write(fd, FILEDATA, 10);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl05
| fcntl17.c: In function 'catch_alarm':
| fcntl17.c:414:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   414 |         sighold(SIGCHLD);
|       |         ^~~~~~~
| In file included from fcntl17.c:50:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl06
| fcntl21.c: In function 'setup':
| fcntl21.c:93:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|    93 |         pipe(parent_pipe);
|       |         ^~~~~~~~~~~~~~~~~
| fcntl21.c:94:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|    94 |         pipe(child_pipe);
|       |         ^~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl01
| CC testcases/kernel/syscalls/fcntl/fcntl02
| CC testcases/kernel/syscalls/fcntl/fcntl10
| CC testcases/kernel/syscalls/fcntl/fcntl07
| CC testcases/kernel/syscalls/fcntl/fcntl08
| CC testcases/kernel/syscalls/fcntl/fcntl09
| CC testcases/kernel/syscalls/fcntl/fcntl12
| CC testcases/kernel/syscalls/fcntl/fcntl13
| CC testcases/kernel/syscalls/fcntl/fcntl18
| CC testcases/kernel/syscalls/fcntl/fcntl22
| CC testcases/kernel/syscalls/fcntl/fcntl15
| CC testcases/kernel/syscalls/fcntl/fcntl24
| CC testcases/kernel/syscalls/fcntl/fcntl23
| CC testcases/kernel/syscalls/fcntl/fcntl25
| CC testcases/kernel/syscalls/fcntl/fcntl26
| CC testcases/kernel/syscalls/fcntl/fcntl27
| CC testcases/kernel/syscalls/fcntl/fcntl14
| CC testcases/kernel/syscalls/fcntl/fcntl28
| CC testcases/kernel/syscalls/fcntl/fcntl29
| CC testcases/kernel/syscalls/fcntl/fcntl17
| CC testcases/kernel/syscalls/fcntl/fcntl30
| CC testcases/kernel/syscalls/fcntl/fcntl11
| CC testcases/kernel/syscalls/fcntl/fcntl16
| CC testcases/kernel/syscalls/fcntl/fcntl01_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl02_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl03_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl19
| CC testcases/kernel/syscalls/fcntl/fcntl20
| CC testcases/kernel/syscalls/fcntl/fcntl04_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl05_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl06_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl32
| CC testcases/kernel/syscalls/fcntl/fcntl07_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl08_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl09_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl21
| CC testcases/kernel/syscalls/fcntl/fcntl10_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl11_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl12_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl33
| CC testcases/kernel/syscalls/fcntl/fcntl34
| CC testcases/kernel/syscalls/fcntl/fcntl13_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl31
| fcntl06.c: In function 'main':
| fcntl06.c:74:13: warning: variable 'fail' set but not used [-Wunused-but-set-variable]
|    74 |         int fail = 0;
|       |             ^~~~
| CC testcases/kernel/syscalls/fcntl/fcntl37
| CC testcases/kernel/syscalls/fcntl/fcntl35
| CC testcases/kernel/syscalls/fcntl/fcntl14_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl38
| CC testcases/kernel/syscalls/fcntl/fcntl15_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl39
| CC testcases/kernel/syscalls/fcntl/fcntl16_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl17_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl18_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl19_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl20_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl21_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl22_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl23_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl24_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl25_64.o
| fcntl14.c: In function 'run_test':
| fcntl14.c:826:17: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   826 |                 (void)sighold(SIGUSR1);
|       |                 ^
| In file included from fcntl14.c:46:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| fcntl14.c:854:25: warning: 'sigpause' is deprecated: Use the sigsuspend function instead [-Wdeprecated-declarations]
|   854 |                         sigpause(SIGUSR1);
|       |                         ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:151:12: note: declared here
|   151 | extern int sigpause (int __sig) __asm__ ("__xpg_sigpause")
|       |            ^~~~~~~~
| fcntl14.c: In function 'catch_alarm':
| fcntl14.c:902:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   902 | void catch_alarm(int sig)
|       |                  ~~~~^~~
| fcntl14.c: In function 'catch1':
| fcntl14.c:917:17: warning: unused parameter 'sig' [-Wunused-parameter]
|   917 | void catch1(int sig)
|       |             ~~~~^~~
| fcntl14.c: In function 'main':
| fcntl14.c:1079:17: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1079 |                 if (sighold(SIGUSR1) < 0)
|       |                 ^~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| fcntl14.c:1105:17: warning: 'sigpause' is deprecated: Use the sigsuspend function instead [-Wdeprecated-declarations]
|  1105 |                 (void)sigpause(SIGUSR1);
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:151:12: note: declared here
|   151 | extern int sigpause (int __sig) __asm__ ("__xpg_sigpause")
|       |            ^~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl26_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl27_64.o
| fcntl17.c: In function 'catch_alarm':
| fcntl17.c:414:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   414 |         sighold(SIGCHLD);
|       |         ^~~~~~~
| In file included from fcntl17.c:50:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl28_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl29_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl30_64.o
| fcntl16.c: In function 'catch_alarm':
| fcntl16.c:351:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   351 | void catch_alarm(int sig)
|       |                  ~~~~^~~
| fcntl16.c: In function 'catch_usr1':
| fcntl16.c:356:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   356 | void catch_usr1(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_usr2':
| fcntl16.c:365:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   365 | void catch_usr2(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_int':
| fcntl16.c:374:20: warning: unused parameter 'sig' [-Wunused-parameter]
|   374 | void catch_int(int sig)
|       |                ~~~~^~~
| fcntl16.c: In function 'run_test':
| fcntl16.c:458:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   458 |                 (void)write(fd, FILEDATA, 10);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl36
| CC testcases/kernel/syscalls/fcntl/fcntl31_64.o
| fcntl21.c: In function 'setup':
| fcntl21.c:93:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|    93 |         pipe(parent_pipe);
|       |         ^~~~~~~~~~~~~~~~~
| fcntl21.c:94:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|    94 |         pipe(child_pipe);
|       |         ^~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl32_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl33_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl34_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl35_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl36_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl37_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl38_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl39_64.o
| LD testcases/kernel/syscalls/fcntl/fcntl02_64
| LD testcases/kernel/syscalls/fcntl/fcntl01_64
| LD testcases/kernel/syscalls/fcntl/fcntl04_64
| LD testcases/kernel/syscalls/fcntl/fcntl03_64
| LD testcases/kernel/syscalls/fcntl/fcntl06_64
| LD testcases/kernel/syscalls/fcntl/fcntl07_64
| LD testcases/kernel/syscalls/fcntl/fcntl05_64
| LD testcases/kernel/syscalls/fcntl/fcntl08_64
| LD testcases/kernel/syscalls/fcntl/fcntl09_64
| LD testcases/kernel/syscalls/fcntl/fcntl10_64
| LD testcases/kernel/syscalls/fcntl/fcntl11_64
| LD testcases/kernel/syscalls/fcntl/fcntl12_64
| LD testcases/kernel/syscalls/fcntl/fcntl13_64
| LD testcases/kernel/syscalls/fcntl/fcntl14_64
| LD testcases/kernel/syscalls/fcntl/fcntl16_64
| LD testcases/kernel/syscalls/fcntl/fcntl15_64
| LD testcases/kernel/syscalls/fcntl/fcntl17_64
| LD testcases/kernel/syscalls/fcntl/fcntl18_64
| LD testcases/kernel/syscalls/fcntl/fcntl20_64
| LD testcases/kernel/syscalls/fcntl/fcntl19_64
| LD testcases/kernel/syscalls/fcntl/fcntl21_64
| LD testcases/kernel/syscalls/fcntl/fcntl22_64
| LD testcases/kernel/syscalls/fcntl/fcntl23_64
| LD testcases/kernel/syscalls/fcntl/fcntl24_64
| LD testcases/kernel/syscalls/fcntl/fcntl25_64
| LD testcases/kernel/syscalls/fcntl/fcntl26_64
| LD testcases/kernel/syscalls/fcntl/fcntl27_64
| LD testcases/kernel/syscalls/fcntl/fcntl28_64
| LD testcases/kernel/syscalls/fcntl/fcntl30_64
| LD testcases/kernel/syscalls/fcntl/fcntl29_64
| LD testcases/kernel/syscalls/fcntl/fcntl31_64
| LD testcases/kernel/syscalls/fcntl/fcntl32_64
| LD testcases/kernel/syscalls/fcntl/fcntl33_64
| LD testcases/kernel/syscalls/fcntl/fcntl34_64
| LD testcases/kernel/syscalls/fcntl/fcntl35_64
| LD testcases/kernel/syscalls/fcntl/fcntl36_64
| LD testcases/kernel/syscalls/fcntl/fcntl37_64
| LD testcases/kernel/syscalls/fcntl/fcntl38_64
| LD testcases/kernel/syscalls/fcntl/fcntl39_64
| rm fcntl35_64.o fcntl08_64.o fcntl03_64.o fcntl23_64.o fcntl29_64.o fcntl25_64.o fcntl30_64.o fcntl34_64.o fcntl37_64.o fcntl19_64.o fcntl14_64.o fcntl20_64.o fcntl21_64.o fcntl31_64.o fcntl15_64.o fcntl07_64.o fcntl12_64.o fcntl26_64.o fcntl10_64.o fcntl22_64.o fcntl13_64.o fcntl02_64.o fcntl11_64.o fcntl06_64.o fcntl17_64.o fcntl38_64.o fcntl24_64.o fcntl16_64.o fcntl04_64.o fcntl28_64.o fcntl18_64.o fcntl09_64.o fcntl33_64.o fcntl32_64.o fcntl05_64.o fcntl27_64.o fcntl39_64.o fcntl36_64.o fcntl01_64.o
| CC testcases/kernel/syscalls/fdatasync/fdatasync01
| CC testcases/kernel/syscalls/fdatasync/fdatasync03
| CC testcases/kernel/syscalls/fdatasync/fdatasync02
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr03
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr01
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr02
| CC testcases/kernel/syscalls/finit_module/finit_module01
| CC testcases/kernel/syscalls/finit_module/finit_module02
| CC testcases/kernel/syscalls/flistxattr/flistxattr03
| CC testcases/kernel/syscalls/flistxattr/flistxattr02
| CC testcases/kernel/syscalls/flistxattr/flistxattr01
| CC testcases/kernel/syscalls/flock/flock04
| CC testcases/kernel/syscalls/flock/flock03
| CC testcases/kernel/syscalls/flock/flock06
| CC testcases/kernel/syscalls/flock/flock01
| CC testcases/kernel/syscalls/flock/flock02
| fmtmsg01.c: In function 'main':
| fmtmsg01.c:103:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   103 |         fread(buf, sizeof(buf[0]), strlen(str1), fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:112:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   112 |         fread(&ch, sizeof(ch), 1, fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:114:17: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   114 |                 fread(&ch, sizeof(ch), 1, fp);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:118:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   118 |         fread(buf, sizeof(buf[0]), strlen(str2), fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:169:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   169 |         fread(buf, sizeof(buf[0]), strlen(str3), fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:178:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   178 |         fread(&ch, sizeof(ch), 1, fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:180:17: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   180 |                 fread(&ch, sizeof(ch), 1, fp);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:184:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   184 |         fread(buf, sizeof(buf[0]), strlen(str4), fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fmtmsg/fmtmsg01
| fork01.c: In function 'child_pid':
| fork01.c:120:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   120 |         write(fildes, tmp_line, LINE_SZ);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fork04.c: In function 'child_environment':
| fork04.c:157:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   157 |                 write(fildes, msg, sizeof(msg));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fork10.c: In function 'main':
| fork10.c:77:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    77 |                 write(fildes, "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n", 27);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fork10.c:127:41: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   127 |                                         write(fildes, parchar, 1);
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fork/fork03
| CC testcases/kernel/syscalls/fork/fork02
| CC testcases/kernel/syscalls/fork/fork01
| CC testcases/kernel/syscalls/fork/fork06
| CC testcases/kernel/syscalls/fork/fork05
| CC testcases/kernel/syscalls/fork/fork11
| CC testcases/kernel/syscalls/fork/fork04
| CC testcases/kernel/syscalls/fork/fork07
| CC testcases/kernel/syscalls/fork/fork08
| CC testcases/kernel/syscalls/fork/fork12
| CC testcases/kernel/syscalls/fork/fork13
| CC testcases/kernel/syscalls/fork/fork09
| CC testcases/kernel/syscalls/fork/fork10
| CC testcases/kernel/syscalls/fork/fork14
| CC testcases/kernel/syscalls/fpathconf/fpathconf01
| CC testcases/kernel/syscalls/fremovexattr/fremovexattr01
| CC testcases/kernel/syscalls/fremovexattr/fremovexattr02
| CC testcases/kernel/syscalls/fsconfig/fsconfig02
| CC testcases/kernel/syscalls/fsconfig/fsconfig01
| CC testcases/kernel/syscalls/fsetxattr/fsetxattr01
| CC testcases/kernel/syscalls/fsetxattr/fsetxattr02
| CC testcases/kernel/syscalls/fsmount/fsmount01
| CC testcases/kernel/syscalls/fsmount/fsmount02
| CC testcases/kernel/syscalls/fsopen/fsopen02
| CC testcases/kernel/syscalls/fsopen/fsopen01
| CC testcases/kernel/syscalls/fspick/fspick02
| CC testcases/kernel/syscalls/fspick/fspick01
| CC testcases/kernel/syscalls/fstatat/fstatat01
| CC testcases/kernel/syscalls/fstatfs/fstatfs01_64.o
| CC testcases/kernel/syscalls/fstatfs/fstatfs02_64.o
| LD testcases/kernel/syscalls/fstatfs/fstatfs01_64
| CC testcases/kernel/syscalls/fstatfs/fstatfs01
| CC testcases/kernel/syscalls/fstatfs/fstatfs02
| LD testcases/kernel/syscalls/fstatfs/fstatfs02_64
| rm fstatfs02_64.o fstatfs01_64.o
| CC testcases/kernel/syscalls/fstat/fstat02_64.o
| CC testcases/kernel/syscalls/fstat/fstat03_64.o
| CC testcases/kernel/syscalls/fstat/fstat03
| CC testcases/kernel/syscalls/fstat/fstat02
| LD testcases/kernel/syscalls/fstat/fstat02_64
| LD testcases/kernel/syscalls/fstat/fstat03_64
| rm fstat02_64.o fstat03_64.o
| CC testcases/kernel/syscalls/fsync/fsync01
| CC testcases/kernel/syscalls/fsync/fsync03
| CC testcases/kernel/syscalls/fsync/fsync02
| CC testcases/kernel/syscalls/fsync/fsync04
| CC testcases/kernel/syscalls/ftruncate/ftruncate01_64.o
| CC testcases/kernel/syscalls/ftruncate/ftruncate03_64.o
| CC testcases/kernel/syscalls/ftruncate/ftruncate04_64.o
| CC testcases/kernel/syscalls/ftruncate/ftruncate03
| CC testcases/kernel/syscalls/ftruncate/ftruncate01
| LD testcases/kernel/syscalls/ftruncate/ftruncate01_64
| CC testcases/kernel/syscalls/ftruncate/ftruncate04
| LD testcases/kernel/syscalls/ftruncate/ftruncate03_64
| LD testcases/kernel/syscalls/ftruncate/ftruncate04_64
| rm ftruncate03_64.o ftruncate01_64.o ftruncate04_64.o
| CC testcases/kernel/syscalls/futex/futex_cmp_requeue02
| CC testcases/kernel/syscalls/futex/futex_wait03
| CC testcases/kernel/syscalls/futex/futex_wait02
| CC testcases/kernel/syscalls/futex/futex_wake01
| CC testcases/kernel/syscalls/futex/futex_cmp_requeue01
| CC testcases/kernel/syscalls/futex/futex_wait01
| CC testcases/kernel/syscalls/futex/futex_waitv02
| CC testcases/kernel/syscalls/futex/futex_wait04
| CC testcases/kernel/syscalls/futex/futex_waitv01
| CC testcases/kernel/syscalls/futex/futex_waitv03
| CC testcases/kernel/syscalls/futex/futex_wake02
| CC testcases/kernel/syscalls/futex/futex_wait05
| CC testcases/kernel/syscalls/futex/futex_wait_bitset01
| CC testcases/kernel/syscalls/futex/futex_wake03
| CC testcases/kernel/syscalls/futex/futex_wake04
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/metadata'
| CC testcases/kernel/syscalls/futimesat/futimesat01
| CC testcases/kernel/syscalls/getcontext/getcontext01
| CC testcases/kernel/syscalls/getcpu/getcpu01
| CC testcases/kernel/syscalls/getcwd/getcwd01
| CC testcases/kernel/syscalls/getcwd/getcwd03
| CC testcases/kernel/syscalls/getcwd/getcwd02
| CC testcases/kernel/syscalls/getcwd/getcwd04
| CC testcases/kernel/syscalls/getdents/getdents02
| CC testcases/kernel/syscalls/getdents/getdents01
| CC testcases/kernel/syscalls/getdomainname/getdomainname01
| CC testcases/kernel/syscalls/getdtablesize/getdtablesize01
| CC testcases/kernel/syscalls/getegid/getegid01_16.o
| CC testcases/kernel/syscalls/getegid/getegid02_16.o
| CC testcases/kernel/syscalls/getegid/getegid02.o
| CC testcases/kernel/syscalls/getegid/getegid01.o
| LD testcases/kernel/syscalls/getegid/getegid01
| LD testcases/kernel/syscalls/getegid/getegid02
| LD testcases/kernel/syscalls/getegid/getegid01_16
| LD testcases/kernel/syscalls/getegid/getegid02_16
| rm getegid01.o getegid01_16.o getegid02_16.o getegid02.o
| CC testcases/kernel/syscalls/geteuid/geteuid01_16.o
| CC testcases/kernel/syscalls/geteuid/geteuid02_16.o
| CC testcases/kernel/syscalls/geteuid/geteuid01.o
| CC testcases/kernel/syscalls/geteuid/geteuid02.o
| LD testcases/kernel/syscalls/geteuid/geteuid02_16
| LD testcases/kernel/syscalls/geteuid/geteuid01
| LD testcases/kernel/syscalls/geteuid/geteuid02
| LD testcases/kernel/syscalls/geteuid/geteuid01_16
| rm geteuid01_16.o geteuid02_16.o geteuid01.o geteuid02.o
| CC testcases/kernel/syscalls/getgid/getgid01_16.o
| CC testcases/kernel/syscalls/getgid/getgid03_16.o
| CC testcases/kernel/syscalls/getgid/getgid01.o
| CC testcases/kernel/syscalls/getgid/getgid03.o
| LD testcases/kernel/syscalls/getgid/getgid01
| LD testcases/kernel/syscalls/getgid/getgid01_16
| LD testcases/kernel/syscalls/getgid/getgid03
| LD testcases/kernel/syscalls/getgid/getgid03_16
| rm getgid01.o getgid03_16.o getgid01_16.o getgid03.o
| CC testcases/kernel/syscalls/getgroups/getgroups01_16.o
| CC testcases/kernel/syscalls/getgroups/getgroups03_16.o
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/features.h:490,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:25,
|                  from getgroups01.c:48:
| In function 'getgroups',
|     inlined from 'GETGROUPS' at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/syscalls/getgroups/../utils/compat_16.h:82:2,
|     inlined from 'main' at getgroups01.c:83:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/unistd.h:221:10: warning: argument 1 value -1 is negative [-Wstringop-overflow=]
|   221 |   return __glibc_fortify (getgroups, __size, sizeof (__gid_t),
|       |          ^~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:1214:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/unistd.h: In function 'main':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/unistd.h:208:12: note: in a call to function '__getgroups_chk' declared with attribute 'access (write_only, 2, 1)'
|   208 | extern int __getgroups_chk (int __size, __gid_t __list[], size_t __listlen)
|       |            ^~~~~~~~~~~~~~~
| In function 'getgroups',
|     inlined from 'GETGROUPS' at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/syscalls/getgroups/../utils/compat_16.h:82:2,
|     inlined from 'main' at getgroups01.c:83:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/unistd.h:221:10: warning: argument 1 value -1 is negative [-Wstringop-overflow=]
|   221 |   return __glibc_fortify (getgroups, __size, sizeof (__gid_t),
|       |          ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/unistd.h: In function 'main':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/unistd.h:208:12: note: in a call to function '__getgroups_chk' declared with attribute 'access (write_only, 2, 1)'
|   208 | extern int __getgroups_chk (int __size, __gid_t __list[], size_t __listlen)
|       |            ^~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/getgroups/getgroups01.o
| CC testcases/kernel/syscalls/getgroups/getgroups03.o
| LD testcases/kernel/syscalls/getgroups/getgroups01_16
| LD testcases/kernel/syscalls/getgroups/getgroups01
| LD testcases/kernel/syscalls/getgroups/getgroups03_16
| LD testcases/kernel/syscalls/getgroups/getgroups03
| rm getgroups01.o getgroups01_16.o getgroups03_16.o getgroups03.o
| CC testcases/kernel/syscalls/gethostbyname_r/gethostbyname_r01
| CC testcases/kernel/syscalls/gethostid/gethostid01
| CC testcases/kernel/syscalls/gethostname/gethostname01
| CC testcases/kernel/syscalls/getitimer/getitimer01
| CC testcases/kernel/syscalls/getitimer/getitimer03
| CC testcases/kernel/syscalls/getitimer/getitimer02
| BUILD libltpnuma.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/get_mempolicy/get_mempolicy02
| CC testcases/kernel/syscalls/get_mempolicy/get_mempolicy01
| CC testcases/kernel/syscalls/getpagesize/getpagesize01
| getpeername01.c: In function 'cleanup4':
| getpeername01.c:174:26: warning: unused parameter 'i' [-Wunused-parameter]
|   174 | static void cleanup4(int i)
|       |                      ~~~~^
| CC testcases/kernel/syscalls/getpeername/getpeername01
| CC testcases/kernel/syscalls/getpgid/getpgid02
| CC testcases/kernel/syscalls/getpgid/getpgid01
| CC testcases/kernel/syscalls/getpgrp/getpgrp01
| CC testcases/kernel/syscalls/getpid/getpid01
| CC testcases/kernel/syscalls/getpid/getpid02
| CC testcases/kernel/syscalls/getppid/getppid01
| CC testcases/kernel/syscalls/getppid/getppid02
| CC testcases/kernel/syscalls/getpriority/getpriority02
| CC testcases/kernel/syscalls/getpriority/getpriority01
| CC testcases/kernel/syscalls/getrandom/getrandom01
| CC testcases/kernel/syscalls/getrandom/getrandom02
| CC testcases/kernel/syscalls/getrandom/getrandom03
| CC testcases/kernel/syscalls/getrandom/getrandom04
| CC testcases/kernel/syscalls/getresgid/getresgid01_16.o
| CC testcases/kernel/syscalls/getresgid/getresgid02_16.o
| CC testcases/kernel/syscalls/getresgid/getresgid03_16.o
| CC testcases/kernel/syscalls/getresgid/getresgid01.o
| CC testcases/kernel/syscalls/getresgid/getresgid02.o
| CC testcases/kernel/syscalls/getresgid/getresgid03.o
| LD testcases/kernel/syscalls/getresgid/getresgid01
| LD testcases/kernel/syscalls/getresgid/getresgid02
| LD testcases/kernel/syscalls/getresgid/getresgid03_16
| LD testcases/kernel/syscalls/getresgid/getresgid01_16
| LD testcases/kernel/syscalls/getresgid/getresgid02_16
| LD testcases/kernel/syscalls/getresgid/getresgid03
| rm getresgid03.o getresgid03_16.o getresgid01_16.o getresgid02_16.o getresgid01.o getresgid02.o
| CC testcases/kernel/syscalls/getresuid/getresuid01_16.o
| CC testcases/kernel/syscalls/getresuid/getresuid02_16.o
| CC testcases/kernel/syscalls/getresuid/getresuid03_16.o
| CC testcases/kernel/syscalls/getresuid/getresuid01.o
| CC testcases/kernel/syscalls/getresuid/getresuid02.o
| CC testcases/kernel/syscalls/getresuid/getresuid03.o
| LD testcases/kernel/syscalls/getresuid/getresuid03
| LD testcases/kernel/syscalls/getresuid/getresuid01_16
| LD testcases/kernel/syscalls/getresuid/getresuid01
| LD testcases/kernel/syscalls/getresuid/getresuid02
| LD testcases/kernel/syscalls/getresuid/getresuid03_16
| LD testcases/kernel/syscalls/getresuid/getresuid02_16
| rm getresuid02_16.o getresuid02.o getresuid01_16.o getresuid01.o getresuid03.o getresuid03_16.o
| CC testcases/kernel/syscalls/getrlimit/getrlimit01
| CC testcases/kernel/syscalls/getrlimit/getrlimit02
| CC testcases/kernel/syscalls/getrlimit/getrlimit03
| CC testcases/kernel/syscalls/get_robust_list/get_robust_list01
| CC testcases/kernel/syscalls/getrusage/getrusage01
| CC testcases/kernel/syscalls/getrusage/getrusage02
| CC testcases/kernel/syscalls/getrusage/getrusage03_child
| CC testcases/kernel/syscalls/getrusage/getrusage03
| CC testcases/kernel/syscalls/getrusage/getrusage04
| CC testcases/kernel/syscalls/getsid/getsid02
| CC testcases/kernel/syscalls/getsid/getsid01
| CC testcases/kernel/syscalls/getsockname/getsockname01
| CC testcases/kernel/syscalls/getsockopt/getsockopt02
| CC testcases/kernel/syscalls/getsockopt/getsockopt01
| CC testcases/kernel/syscalls/gettid/gettid01
| CC testcases/kernel/syscalls/gettimeofday/gettimeofday01
| CC testcases/kernel/syscalls/gettimeofday/gettimeofday02
| CC testcases/kernel/syscalls/getuid/getuid01_16.o
| CC testcases/kernel/syscalls/getuid/getuid03_16.o
| CC testcases/kernel/syscalls/getuid/getuid03.o
| CC testcases/kernel/syscalls/getuid/getuid01.o
| LD testcases/kernel/syscalls/getuid/getuid03
| LD testcases/kernel/syscalls/getuid/getuid01
| LD testcases/kernel/syscalls/getuid/getuid03_16
| LD testcases/kernel/syscalls/getuid/getuid01_16
| rm getuid03.o getuid03_16.o getuid01.o getuid01_16.o
| CC testcases/kernel/syscalls/getxattr/getxattr01
| CC testcases/kernel/syscalls/getxattr/getxattr02
| CC testcases/kernel/syscalls/getxattr/getxattr03
| CC testcases/kernel/syscalls/getxattr/getxattr04
| CC testcases/kernel/syscalls/getxattr/getxattr05
| CC testcases/kernel/syscalls/init_module/init_module01
| CC testcases/kernel/syscalls/init_module/init_module02
| CC testcases/kernel/syscalls/inotify_init/inotify_init1_01
| CC testcases/kernel/syscalls/inotify_init/inotify_init1_02
| inotify02.c: In function 'verify_inotify':
| inotify02.c:99:39: warning: '.rename1' directive output may be truncated writing 8 bytes into a region of size between 1 and 256 [-Wformat-truncation=]
|    99 |         snprintf(fname2, BUF_SIZE, "%s.rename1", fname1);
|       |                                       ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from inotify02.c:15:
| In function 'snprintf',
|     inlined from 'verify_inotify' at inotify02.c:99:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 9 and 264 bytes into a destination of size 256
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| inotify02.c: In function 'verify_inotify':
| inotify02.c:116:39: warning: '.rename2' directive output may be truncated writing 8 bytes into a region of size between 1 and 256 [-Wformat-truncation=]
|   116 |         snprintf(fname3, BUF_SIZE, "%s.rename2", fname1);
|       |                                       ^~~~~~~~
| In function 'snprintf',
|     inlined from 'verify_inotify' at inotify02.c:116:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 9 and 264 bytes into a destination of size 256
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/inotify/inotify01
| CC testcases/kernel/syscalls/inotify/inotify06
| CC testcases/kernel/syscalls/inotify/inotify04
| CC testcases/kernel/syscalls/inotify/inotify07
| CC testcases/kernel/syscalls/inotify/inotify05
| CC testcases/kernel/syscalls/inotify/inotify02
| CC testcases/kernel/syscalls/inotify/inotify11
| CC testcases/kernel/syscalls/inotify/inotify03
| CC testcases/kernel/syscalls/inotify/inotify08
| CC testcases/kernel/syscalls/inotify/inotify10
| CC testcases/kernel/syscalls/inotify/inotify09
| CC testcases/kernel/syscalls/io_cancel/io_cancel02
| CC testcases/kernel/syscalls/io_cancel/io_cancel01
| CC testcases/kernel/syscalls/ioctl/ioctl03
| CC testcases/kernel/syscalls/ioctl/ioctl05
| CC testcases/kernel/syscalls/ioctl/ioctl07
| CC testcases/kernel/syscalls/ioctl/ioctl04
| CC testcases/kernel/syscalls/ioctl/ioctl01
| CC testcases/kernel/syscalls/ioctl/ioctl02
| CC testcases/kernel/syscalls/ioctl/ioctl06
| CC testcases/kernel/syscalls/ioctl/ioctl_loop03
| CC testcases/kernel/syscalls/ioctl/ioctl08
| CC testcases/kernel/syscalls/ioctl/ioctl09
| CC testcases/kernel/syscalls/ioctl/ioctl_loop02
| CC testcases/kernel/syscalls/ioctl/ioctl_loop01
| CC testcases/kernel/syscalls/ioctl/ioctl_loop06
| CC testcases/kernel/syscalls/ioctl/ioctl_loop07
| CC testcases/kernel/syscalls/ioctl/ioctl_loop04
| CC testcases/kernel/syscalls/ioctl/ioctl_loop05
| CC testcases/kernel/syscalls/ioctl/ioctl_ns01
| CC testcases/kernel/syscalls/ioctl/ioctl_ns02
| CC testcases/kernel/syscalls/ioctl/ioctl_ns03
| CC testcases/kernel/syscalls/ioctl/ioctl_ns04
| CC testcases/kernel/syscalls/ioctl/ioctl_ns05
| CC testcases/kernel/syscalls/ioctl/ioctl_ns07
| CC testcases/kernel/syscalls/ioctl/ioctl_sg01
| CC testcases/kernel/syscalls/ioctl/ioctl_ns06
| CC testcases/kernel/syscalls/io_destroy/io_destroy01
| CC testcases/kernel/syscalls/io_destroy/io_destroy02
| CC testcases/kernel/syscalls/io_getevents/io_getevents02
| CC testcases/kernel/syscalls/io_getevents/io_getevents01
| CC testcases/kernel/syscalls/ioperm/ioperm01
| CC testcases/kernel/syscalls/ioperm/ioperm02
| CC testcases/kernel/syscalls/io_pgetevents/io_pgetevents01
| CC testcases/kernel/syscalls/io_pgetevents/io_pgetevents02
| CC testcases/kernel/syscalls/iopl/iopl02
| CC testcases/kernel/syscalls/iopl/iopl01
| CC testcases/kernel/syscalls/ioprio/ioprio_get01
| CC testcases/kernel/syscalls/ioprio/ioprio_set02
| CC testcases/kernel/syscalls/ioprio/ioprio_set03
| CC testcases/kernel/syscalls/ioprio/ioprio_set01
| CC testcases/kernel/syscalls/io_setup/io_setup01
| CC testcases/kernel/syscalls/io_setup/io_setup02
| CC testcases/kernel/syscalls/io_submit/io_submit02
| CC testcases/kernel/syscalls/io_submit/io_submit01
| CC testcases/kernel/syscalls/io_submit/io_submit03
| CC testcases/kernel/syscalls/io_uring/io_uring02
| CC testcases/kernel/syscalls/io_uring/io_uring01
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl02
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl05
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl03
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl12
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl01
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl04
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl06
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgget/msgget01
| CC testcases/kernel/syscalls/ipc/msgget/msgget03
| CC testcases/kernel/syscalls/ipc/msgget/msgget05
| CC testcases/kernel/syscalls/ipc/msgget/msgget02
| CC testcases/kernel/syscalls/ipc/msgget/msgget04
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv03
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv05
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv08
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv06
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv02
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv07
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv01
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd01
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd02
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd05
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd06
| BUILD libltpipc.a
| make[6]: Nothing to be done for 'all'.
| msgstress02.c: In function 'main':
| msgstress02.c:134:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   134 |         if (sigset(SIGTERM, term) == SIG_ERR) {
|       |         ^~
| msgstress01.c: In function 'dotest':
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/wait.h:36,
|                  from msgstress02.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| msgstress01.c:207:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   207 |         sighold(SIGTERM);
|       |         ^~~~~~~
| In file included from msgstress01.c:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| msgstress01.c:216:9: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   216 |         sigrelse(SIGTERM);
|       |         ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| msgstress02.c: In function 'dotest':
| msgstress02.c:239:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   239 |         sighold(SIGTERM);
|       |         ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| msgstress02.c:246:9: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   246 |         sigrelse(SIGTERM);
|       |         ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| msgstress03.c: In function 'dotest':
| msgstress03.c:212:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   212 |         sighold(SIGTERM);
|       |         ^~~~~~~
| In file included from msgstress03.c:28:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| msgstress03.c:220:9: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   220 |         sigrelse(SIGTERM);
|       |         ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| msgstress04.c: In function 'main':
| msgstress04.c:139:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   139 |         if (sigset(SIGTERM, term) == SIG_ERR)
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/wait.h:36,
|                  from msgstress04.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| msgstress04.c: In function 'dotest':
| msgstress04.c:266:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   266 |         sighold(SIGTERM);
|       |         ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| msgstress04.c:273:9: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   273 |         sigrelse(SIGTERM);
|       |         ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| CC testcases/kernel/syscalls/ipc/msgstress/msgstress01
| CC testcases/kernel/syscalls/ipc/msgstress/msgstress03
| CC testcases/kernel/syscalls/ipc/msgstress/msgstress02
| CC testcases/kernel/syscalls/ipc/msgstress/msgstress04
| BUILD libltpipc.a
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| semctl06.c: In function 'term':
| semctl06.c:288:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   288 | static void term(int sig)
|       |                  ~~~~^~~
| CC testcases/kernel/syscalls/ipc/semctl/semctl02
| CC testcases/kernel/syscalls/ipc/semctl/semctl04
| CC testcases/kernel/syscalls/ipc/semctl/semctl08
| CC testcases/kernel/syscalls/ipc/semctl/semctl03
| CC testcases/kernel/syscalls/ipc/semctl/semctl05
| CC testcases/kernel/syscalls/ipc/semctl/semctl07
| CC testcases/kernel/syscalls/ipc/semctl/semctl01
| CC testcases/kernel/syscalls/ipc/semctl/semctl09
| CC testcases/kernel/syscalls/ipc/semctl/semctl06
| BUILD libltpipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/semget/semget03
| CC testcases/kernel/syscalls/ipc/semget/semget06
| CC testcases/kernel/syscalls/ipc/semget/semget01
| CC testcases/kernel/syscalls/ipc/semget/semget05
| CC testcases/kernel/syscalls/ipc/semget/semget02
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/semop/semop01
| CC testcases/kernel/syscalls/ipc/semop/semop03
| CC testcases/kernel/syscalls/ipc/semop/semop02
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmat/shmat02
| CC testcases/kernel/syscalls/ipc/shmat/shmat03
| CC testcases/kernel/syscalls/ipc/shmat/shmat01
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| shmctl08.c: In function 'check_mode':
| shmctl08.c:41:31: warning: comparison of integer expressions of different signedness: '__mode_t' {aka 'unsigned int'} and 'short int' [-Wsign-compare]
|    41 |         if (ds->shm_perm.mode == exp_mode) {
|       |                               ^~
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl02
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl06
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl03
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl07
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl04
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl08
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl01
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl05
| BUILD libltpipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmdt/shmdt01
| CC testcases/kernel/syscalls/ipc/shmdt/shmdt02
| BUILD libltpnewipc.a
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmget/shmget05
| CC testcases/kernel/syscalls/ipc/shmget/shmget04
| CC testcases/kernel/syscalls/ipc/shmget/shmget06
| CC testcases/kernel/syscalls/ipc/shmget/shmget03
| CC testcases/kernel/syscalls/ipc/shmget/shmget02
| CC testcases/kernel/syscalls/kcmp/kcmp02
| CC testcases/kernel/syscalls/kcmp/kcmp01
| CC testcases/kernel/syscalls/kcmp/kcmp03
| CC testcases/kernel/syscalls/keyctl/keyctl01
| CC testcases/kernel/syscalls/keyctl/keyctl04
| CC testcases/kernel/syscalls/keyctl/keyctl03
| CC testcases/kernel/syscalls/keyctl/keyctl08
| CC testcases/kernel/syscalls/keyctl/keyctl07
| CC testcases/kernel/syscalls/keyctl/keyctl02
| CC testcases/kernel/syscalls/keyctl/keyctl06
| CC testcases/kernel/syscalls/keyctl/keyctl05
| CC testcases/kernel/syscalls/keyctl/keyctl09
| BUILD libltpipc.a
| BUILD libltpnewipc.a
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| kill02.c: In function 'setup':
| kill02.c:694:13: warning: variable 'errno_buf' set but not used [-Wunused-but-set-variable]
|   694 |         int errno_buf;          /*indicates the errno if pipe set up fails.             */
|       |             ^~~~~~~~~
| kill02.c: In function 'child1_rout':
| kill02.c:449:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   449 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:481:31: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   481 |                         (void)write(pipe2_fd[1], CHAR_SET_FAILED, 1);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:505:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   505 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:515:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   515 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:526:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   526 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:554:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   554 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:561:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   561 |         (void)write(pipe1_fd[1], CHAR_SET_PASSED, 1);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c: In function 'child2_rout':
| kill02.c:597:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   597 |                 (void)write(pipe2_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:602:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   602 |         (void)write(pipe2_fd[1], CHAR_SET_PASSED, 1);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c: In function 'childA_rout':
| kill02.c:618:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   618 |         write(pipeA_fd[1], CHAR_SET_PASSED, 1);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c: In function 'childB_rout':
| kill02.c:660:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   660 |         write(pipeB_fd[1], CHAR_SET_PASSED, 1);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c: In function 'chld1_kill':
| kill02.c:848:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   848 |         (void)write(pipe1_fd[1], CHAR_SET_PASSED, 1);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill07.c: In function 'main':
| kill07.c:90:39: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
|    90 |         int exno, status, nsig, asig, ret;
|       |                                       ^~~
| kill07.c:90:13: warning: variable 'exno' set but not used [-Wunused-but-set-variable]
|    90 |         int exno, status, nsig, asig, ret;
|       |             ^~~~
| kill07.c: In function 'sighandler':
| kill07.c:187:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   187 | void sighandler(int sig)
|       |                 ~~~~^~~
| kill09.c: In function 'alarm_handler':
| kill09.c:206:24: warning: unused parameter 'sig' [-Wunused-parameter]
|   206 | void alarm_handler(int sig)
|       |                    ~~~~^~~
| kill10.c: In function 'ack_ready':
| kill10.c:365:47: warning: unused parameter 'data' [-Wunused-parameter]
|   365 | void ack_ready(int sig, siginfo_t * si, void *data)
|       |                                         ~~~~~~^~~~
| kill10.c: In function 'ack_done':
| kill10.c:392:46: warning: unused parameter 'data' [-Wunused-parameter]
|   392 | void ack_done(int sig, siginfo_t * si, void *data)
|       |                                        ~~~~~~^~~~
| kill10.c: In function 'set_create_procs':
| kill10.c:477:27: warning: unused parameter 'sig' [-Wunused-parameter]
|   477 | void set_create_procs(int sig)
|       |                       ~~~~^~~
| kill10.c: In function 'graceful_exit':
| kill10.c:608:24: warning: unused parameter 'sig' [-Wunused-parameter]
|   608 | void graceful_exit(int sig)
|       |                    ~~~~^~~
| kill10.c: In function 'set_signal_parents':
| kill10.c:613:29: warning: unused parameter 'sig' [-Wunused-parameter]
|   613 | void set_signal_parents(int sig)
|       |                         ~~~~^~~
| kill10.c: In function 'clear_signal_parents':
| kill10.c:620:31: warning: unused parameter 'sig' [-Wunused-parameter]
|   620 | void clear_signal_parents(int sig)
|       |                           ~~~~^~~
| kill10.c: In function 'set_confirmed_ready':
| kill10.c:627:30: warning: unused parameter 'sig' [-Wunused-parameter]
|   627 | void set_confirmed_ready(int sig)
|       |                          ~~~~^~~
| kill10.c: In function 'reset_counter':
| kill10.c:635:24: warning: unused parameter 'sig' [-Wunused-parameter]
|   635 | void reset_counter(int sig)
|       |                    ~~~~^~~
| kill10.c: In function 'reply_to_child':
| kill10.c:643:25: warning: unused parameter 'sig' [-Wunused-parameter]
|   643 | void reply_to_child(int sig, siginfo_t * si, void *data)
|       |                     ~~~~^~~
| kill10.c:643:52: warning: unused parameter 'data' [-Wunused-parameter]
|   643 | void reply_to_child(int sig, siginfo_t * si, void *data)
|       |                                              ~~~~~~^~~~
| kill10.c: In function 'wakeup':
| kill10.c:670:17: warning: unused parameter 'sig' [-Wunused-parameter]
|   670 | void wakeup(int sig)
|       |             ~~~~^~~
| kill02.c: In function 'parent_rout':
| kill02.c:315:9: warning: '__builtin_strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   315 |         strncpy(buf_tmp1, pipe_buf, 1);
|       |         ^
| kill02.c:321:9: warning: '__builtin_strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   321 |         strncpy(buf_tmp2, pipe_buf, 1);
|       |         ^
| kill02.c:435:17: warning: '__builtin_strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   435 |                 strncpy(buf_tmp1, pipe_buf, 1);
|       |                 ^
| kill12.c: In function 'main':
| CC testcases/kernel/syscalls/kill/kill03
| kill12.c:89:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|    89 |         if (sigset(SIGCHLD, chsig) == SIG_ERR) {
|       |         ^~
| In file included from kill12.c:43:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| kill12.c:168:39: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
|   168 |                                 } else;
|       |                                       ^
| kill12.c:79:13: warning: variable 'core' set but not used [-Wunused-but-set-variable]
|    79 |         int core;
|       |             ^~~~
| kill12.c:77:19: warning: variable 'exno' set but not used [-Wunused-but-set-variable]
|    77 |         int nsig, exno, nexno, status;
|       |                   ^~~~
| kill12.c: In function 'do_child':
| kill12.c:201:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   201 |         sigset(sig, SIG_IGN);   /* set to ignore signal */
|       |         ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| CC testcases/kernel/syscalls/kill/kill08
| CC testcases/kernel/syscalls/kill/kill07
| CC testcases/kernel/syscalls/kill/kill05
| CC testcases/kernel/syscalls/kill/kill06
| CC testcases/kernel/syscalls/kill/kill02
| CC testcases/kernel/syscalls/kill/kill09
| CC testcases/kernel/syscalls/kill/kill13
| CC testcases/kernel/syscalls/kill/kill11
| CC testcases/kernel/syscalls/kill/kill12
| CC testcases/kernel/syscalls/kill/kill10
| CC testcases/kernel/syscalls/lchown/lchown01_16.o
| CC testcases/kernel/syscalls/lchown/lchown02_16.o
| CC testcases/kernel/syscalls/lchown/lchown03_16.o
| CC testcases/kernel/syscalls/lchown/lchown01.o
| CC testcases/kernel/syscalls/lchown/lchown02.o
| CC testcases/kernel/syscalls/lchown/lchown03.o
| LD testcases/kernel/syscalls/lchown/lchown01
| LD testcases/kernel/syscalls/lchown/lchown01_16
| LD testcases/kernel/syscalls/lchown/lchown02
| LD testcases/kernel/syscalls/lchown/lchown03
| LD testcases/kernel/syscalls/lchown/lchown03_16
| LD testcases/kernel/syscalls/lchown/lchown02_16
| rm lchown01_16.o lchown03.o lchown02_16.o lchown03_16.o lchown01.o lchown02.o
| CC testcases/kernel/syscalls/lgetxattr/lgetxattr01
| CC testcases/kernel/syscalls/lgetxattr/lgetxattr02
| CC testcases/kernel/syscalls/linkat/linkat01
| CC testcases/kernel/syscalls/linkat/linkat02
| link03.c: In function 'main':
| link03.c:104:43: warning: '%d' directive writing between 1 and 10 bytes into a region of size between 1 and 255 [-Wformat-overflow=]
|   104 |                         sprintf(lname, "%s%d", fname, i);
|       |                                           ^~
| link03.c:104:40: note: directive argument in the range [1, 2147483646]
|   104 |                         sprintf(lname, "%s%d", fname, i);
|       |                                        ^~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../../../include/old/test.h:14,
|                  from link03.c:47:
| In function 'sprintf',
|     inlined from 'main' at link03.c:104:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 2 and 265 bytes into a destination of size 255
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| link03.c: In function 'main':
| link03.c:123:43: warning: '%d' directive writing between 1 and 10 bytes into a region of size between 1 and 255 [-Wformat-overflow=]
|   123 |                         sprintf(lname, "%s%d", fname, i);
|       |                                           ^~
| link03.c:123:40: note: directive argument in the range [1, 2147483646]
|   123 |                         sprintf(lname, "%s%d", fname, i);
|       |                                        ^~~~~~
| In function 'sprintf',
|     inlined from 'main' at link03.c:123:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 2 and 265 bytes into a destination of size 255
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| link03.c: In function 'main':
| link03.c:138:43: warning: '%d' directive writing between 1 and 10 bytes into a region of size between 1 and 255 [-Wformat-overflow=]
|   138 |                         sprintf(lname, "%s%d", fname, i);
|       |                                           ^~
| link03.c:138:40: note: directive argument in the range [1, 2147483646]
|   138 |                         sprintf(lname, "%s%d", fname, i);
|       |                                        ^~~~~~
| In function 'sprintf',
|     inlined from 'main' at link03.c:138:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 2 and 265 bytes into a destination of size 255
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/link/link02
| CC testcases/kernel/syscalls/link/link08
| CC testcases/kernel/syscalls/link/link03
| CC testcases/kernel/syscalls/link/link04
| CC testcases/kernel/syscalls/link/link05
| CC testcases/kernel/syscalls/listen/listen01
| CC testcases/kernel/syscalls/listxattr/listxattr01
| CC testcases/kernel/syscalls/listxattr/listxattr02
| CC testcases/kernel/syscalls/listxattr/listxattr03
| CC testcases/kernel/syscalls/llistxattr/llistxattr01
| CC testcases/kernel/syscalls/llistxattr/llistxattr02
| CC testcases/kernel/syscalls/llistxattr/llistxattr03
| CC testcases/kernel/syscalls/llseek/llseek01
| CC testcases/kernel/syscalls/llseek/llseek03
| CC testcases/kernel/syscalls/llseek/llseek02
| CC testcases/kernel/syscalls/lremovexattr/lremovexattr01
| CC testcases/kernel/syscalls/lseek/lseek01
| CC testcases/kernel/syscalls/lseek/lseek02
| CC testcases/kernel/syscalls/lseek/lseek07
| CC testcases/kernel/syscalls/lseek/lseek11
| CC testcases/kernel/syscalls/lstat/lstat01_64.o
| CC testcases/kernel/syscalls/lstat/lstat02_64.o
| CC testcases/kernel/syscalls/lstat/lstat01
| LD testcases/kernel/syscalls/lstat/lstat01_64
| LD testcases/kernel/syscalls/lstat/lstat02_64
| CC testcases/kernel/syscalls/lstat/lstat02
| rm lstat02_64.o lstat01_64.o
| madvise08.c: In function 'find_sequence':
| madvise08.c:136:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   136 |                         if (expectc == 'z') {
|       |                            ^
| madvise08.c:140:17: note: here
|   140 |                 default:
|       |                 ^~~~~~~
| madvise09.c: In function 'setup_cgroup_paths':
| madvise09.c:97:53: warning: '/tasks' directive output may be truncated writing 6 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    97 |         snprintf(tasks_path, sizeof(tasks_path), "%s/tasks", cgroup_path);
|       |                                                     ^~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from madvise09.c:42:
| In function 'snprintf',
|     inlined from 'setup_cgroup_paths' at madvise09.c:97:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 7 and 4102 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| madvise09.c: In function 'setup_cgroup_paths':
| madvise09.c:99:21: warning: '/memory.limit_in_bytes' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    99 |                  "%s/memory.limit_in_bytes", cgroup_path);
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'setup_cgroup_paths' at madvise09.c:98:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| madvise09.c: In function 'setup_cgroup_paths':
| madvise09.c:101:21: warning: '/memory.memsw.limit_in_bytes' directive output may be truncated writing 28 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   101 |                  "%s/memory.memsw.limit_in_bytes", cgroup_path);
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'setup_cgroup_paths' at madvise09.c:100:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 29 and 4124 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/madvise/madvise05
| CC testcases/kernel/syscalls/madvise/madvise01
| CC testcases/kernel/syscalls/madvise/madvise02
| CC testcases/kernel/syscalls/madvise/madvise07
| CC testcases/kernel/syscalls/madvise/madvise10
| CC testcases/kernel/syscalls/madvise/madvise08
| CC testcases/kernel/syscalls/madvise/madvise06
| CC testcases/kernel/syscalls/madvise/madvise09
| CC testcases/kernel/syscalls/mallinfo2/mallinfo2_01
| mallinfo01.c: In function 'test_mallinfo':
| mallinfo01.c:43:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    43 |         info2 = mallinfo();
|       |         ^~~~~
| In file included from mallinfo_common.h:11,
|                  from mallinfo01.c:13:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo01.c:53:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    53 |         info2 = mallinfo();
|       |         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo01.c: In function 'setup':
| mallinfo01.c:68:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    68 |         info1 = mallinfo();
|       |         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo02.c: In function 'test_mallinfo':
| mallinfo02.c:26:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    26 |         info = mallinfo();
|       |         ^~~~
| In file included from mallinfo_common.h:11,
|                  from mallinfo02.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo02.c:35:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    35 |         info = mallinfo();
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo02.c:39:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    39 |         info = mallinfo();
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| CC testcases/kernel/syscalls/mallinfo/mallinfo01
| CC testcases/kernel/syscalls/mallinfo/mallinfo02
| mallopt01.c: In function 'test_mallopt':
| mallopt01.c:31:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    31 |         info = mallinfo();
|       |         ^~~~
| In file included from ../mallinfo/mallinfo_common.h:11,
|                  from mallopt01.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| CC testcases/kernel/syscalls/mallopt/mallopt01
| BUILD libltpnuma.a
| make -C /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/lib -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/lib/Makefile" all
| make[5]: Nothing to be done for 'all'.
| numa_helper.c: In function 'get_allowed_nodes_arr':
| numa_helper.c:152:31: warning: unused parameter 'flag' [-Wunused-parameter]
|   152 | int get_allowed_nodes_arr(int flag, int *num_nodes, int **nodes)
|       |                           ~~~~^~~~
| CC testcases/kernel/lib/ksm_helper.o
| CC testcases/kernel/lib/numa_helper.o
| AR libkerntest.a
| RANLIB libkerntest.a
| CC testcases/kernel/syscalls/mbind/mbind02
| CC testcases/kernel/syscalls/mbind/mbind04
| CC testcases/kernel/syscalls/mbind/mbind01
| CC testcases/kernel/syscalls/mbind/mbind03
| CC testcases/kernel/syscalls/membarrier/membarrier01
| CC testcases/kernel/syscalls/memcmp/memcmp01
| CC testcases/kernel/syscalls/memcpy/memcpy01
| memfd_create_common.c: In function 'check_mfd_growable_by_write':
| memfd_create_common.c:446:13: warning: 'buf' is used uninitialized [-Wuninitialized]
|   446 |         if (pwrite(fd, buf, sizeof(buf), 0) != sizeof(buf)) {
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from memfd_create_common.c:15:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:398:16: note: in a call to 'pwrite' declared with attribute 'access (read_only, 2, 3)' here
|   398 | extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
|       |                ^~~~~~
| memfd_create_common.c:444:14: note: 'buf' declared here
|   444 |         char buf[MFD_DEF_SIZE * 8];
|       |              ^~~
| memfd_create_common.c: In function 'check_mfd_non_growable_by_write':
| memfd_create_common.c:465:13: warning: 'buf' is used uninitialized [-Wuninitialized]
|   465 |         if (pwrite(fd, buf, sizeof(buf), 0) == sizeof(buf)) {
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:398:16: note: in a call to 'pwrite' declared with attribute 'access (read_only, 2, 3)' here
|   398 | extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
|       |                ^~~~~~
| memfd_create_common.c:463:14: note: 'buf' declared here
|   463 |         char buf[MFD_DEF_SIZE * 8];
|       |              ^~~
| CC testcases/kernel/syscalls/memfd_create/memfd_create_common.o
| memfd_create04.c:28: warning: "PATH_HUGEPAGES" redefined
|    28 | #define PATH_HUGEPAGES "/sys/kernel/mm/hugepages"
|       |
| In file included from ../../../../include/tst_test.h:40,
|                  from memfd_create04.c:22:
| ../../../../include/tst_hugepage.h:9: note: this is the location of the previous definition
|     9 | #define PATH_HUGEPAGES  "/sys/kernel/mm/hugepages/"
|       |
| memfd_create03.c: In function 'setup':
| memfd_create03.c:208:23: warning: '%ld' directive writing between 1 and 20 bytes into a region of size 8 [-Wformat-overflow=]
|   208 |         sprintf(buf, "%ld", og_total_pages + 1);
|       |                       ^~~
| memfd_create03.c:208:22: note: directive argument in the range [-9223372036854775807, 9223372036854775807]
|   208 |         sprintf(buf, "%ld", og_total_pages + 1);
|       |                      ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from memfd_create03.c:32:
| In function 'sprintf',
|     inlined from 'setup' at memfd_create03.c:208:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 2 and 21 bytes into a destination of size 8
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/memfd_create/memfd_create02
| CC testcases/kernel/syscalls/memfd_create/memfd_create04
| CC testcases/kernel/syscalls/memfd_create/memfd_create03
| CC testcases/kernel/syscalls/memfd_create/memfd_create01
| CC testcases/kernel/syscalls/memset/memset01
| CC testcases/kernel/syscalls/migrate_pages/migrate_pages_common.o
| CC testcases/kernel/syscalls/migrate_pages/migrate_pages01
| CC testcases/kernel/syscalls/migrate_pages/migrate_pages03
| CC testcases/kernel/syscalls/migrate_pages/migrate_pages02
| CC testcases/kernel/syscalls/mincore/mincore03
| CC testcases/kernel/syscalls/mincore/mincore02
| CC testcases/kernel/syscalls/mincore/mincore04
| CC testcases/kernel/syscalls/mincore/mincore01
| CC testcases/kernel/syscalls/mkdirat/mkdirat01
| CC testcases/kernel/syscalls/mkdirat/mkdirat02
| CC testcases/kernel/syscalls/mkdir/mkdir04
| CC testcases/kernel/syscalls/mkdir/mkdir05
| CC testcases/kernel/syscalls/mkdir/mkdir02
| CC testcases/kernel/syscalls/mkdir/mkdir03
| CC testcases/kernel/syscalls/mkdir/mkdir09
| CC testcases/kernel/syscalls/mknodat/mknodat01
| CC testcases/kernel/syscalls/mknodat/mknodat02
| CC testcases/kernel/syscalls/mknod/mknod09
| CC testcases/kernel/syscalls/mknod/mknod01
| CC testcases/kernel/syscalls/mknod/mknod06
| CC testcases/kernel/syscalls/mknod/mknod02
| CC testcases/kernel/syscalls/mknod/mknod07
| CC testcases/kernel/syscalls/mknod/mknod03
| CC testcases/kernel/syscalls/mknod/mknod04
| CC testcases/kernel/syscalls/mknod/mknod05
| CC testcases/kernel/syscalls/mknod/mknod08
| CC testcases/kernel/syscalls/mlock2/mlock203
| CC testcases/kernel/syscalls/mlock2/mlock202
| CC testcases/kernel/syscalls/mlock2/mlock201
| mlockall02.c: In function 'cleanup_test':
| mlockall02.c:238:25: warning: ignoring return value of 'seteuid' declared with attribute 'warn_unused_result' [-Wunused-result]
|   238 |                         seteuid(0);
|       |                         ^~~~~~~~~~
| CC testcases/kernel/syscalls/mlockall/mlockall01
| CC testcases/kernel/syscalls/mlockall/mlockall02
| CC testcases/kernel/syscalls/mlockall/mlockall03
| CC testcases/kernel/syscalls/mlock/mlock01
| CC testcases/kernel/syscalls/mlock/mlock03
| CC testcases/kernel/syscalls/mlock/mlock04
| CC testcases/kernel/syscalls/mlock/mlock02
| mmap11.c: In function 'wait_thread':
| mmap11.c:128:25: warning: unused parameter 'args' [-Wunused-parameter]
|   128 | void *wait_thread(void *args)
|       |                   ~~~~~~^~~~
| mmap11.c: In function 'wait_thread2':
| mmap11.c:139:26: warning: unused parameter 'args' [-Wunused-parameter]
|   139 | void *wait_thread2(void *args)
|       |                    ~~~~~~^~~~
| mmap05.c: In function 'main':
| mmap05.c:70:14: warning: variable 'file_content' set but not used [-Wunused-but-set-variable]
|    70 |         char file_content;
|       |              ^~~~~~~~~~~~
| CC testcases/kernel/syscalls/mmap/mmap02
| CC testcases/kernel/syscalls/mmap/mmap001
| CC testcases/kernel/syscalls/mmap/mmap01
| CC testcases/kernel/syscalls/mmap/mmap03
| CC testcases/kernel/syscalls/mmap/mmap04
| CC testcases/kernel/syscalls/mmap/mmap05
| CC testcases/kernel/syscalls/mmap/mmap06
| CC testcases/kernel/syscalls/mmap/mmap07
| CC testcases/kernel/syscalls/mmap/mmap08
| CC testcases/kernel/syscalls/mmap/mmap09
| CC testcases/kernel/syscalls/mmap/mmap10
| CC testcases/kernel/syscalls/mmap/mmap11
| CC testcases/kernel/syscalls/mmap/mmap13
| CC testcases/kernel/syscalls/mmap/mmap15
| CC testcases/kernel/syscalls/mmap/mmap14
| CC testcases/kernel/syscalls/mmap/mmap12
| CC testcases/kernel/syscalls/mmap/mmap17
| CC testcases/kernel/syscalls/mmap/mmap19
| CC testcases/kernel/syscalls/mmap/mmap16
| CC testcases/kernel/syscalls/mmap/mmap18
| CC testcases/kernel/syscalls/modify_ldt/modify_ldt01
| CC testcases/kernel/syscalls/modify_ldt/modify_ldt03
| CC testcases/kernel/syscalls/modify_ldt/modify_ldt02
| CC testcases/kernel/syscalls/mount/mount03_setuid_test
| mount03.c: In function 'setup':
| mount03.c:366:43: warning: '%s' directive output may be truncated writing 8 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   366 |         snprintf(path_name, PATH_MAX, "%s/%s/", path, mntpoint);
|       |                                           ^~          ~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../../../include/old/test.h:14,
|                  from mount03.c:47:
| In function 'snprintf',
|     inlined from 'setup' at mount03.c:366:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 11 and 4106 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount03.c: In function 'setup':
| mount03.c:371:37: warning: 'mount03_setuid_test' directive output may be truncated writing 19 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   371 |         snprintf(file, PATH_MAX, "%smount03_setuid_test", path_name);
|       |                                     ^~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'setup' at mount03.c:371:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 20 and 4115 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount06.c: In function 'main':
| mount06.c:145:46: warning: '%s' directive output may be truncated writing 7 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   145 |         snprintf(mntpoint_src, PATH_MAX, "%s/%s", path_name, MNTPOINT_SRC);
|       |                                              ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../../../include/old/test.h:14,
|                  from mount06.c:30:
| In function 'snprintf',
|     inlined from 'setup' at mount06.c:145:2,
|     inlined from 'main' at mount06.c:66:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount06.c: In function 'main':
| mount06.c:146:46: warning: '%s' directive output may be truncated writing 7 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   146 |         snprintf(mntpoint_des, PATH_MAX, "%s/%s", path_name, MNTPOINT_DES);
|       |                                              ^~
| In function 'snprintf',
|     inlined from 'setup' at mount06.c:146:2,
|     inlined from 'main' at mount06.c:66:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount03.c: In function 'main':
| mount03.c:292:45: warning: 'atime' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   292 |                 snprintf(file, PATH_MAX, "%satime", path_name);
|       |                                             ^~~~~
| In function 'snprintf',
|     inlined from 'test_rwflag' at mount03.c:292:3,
|     inlined from 'main' at mount03.c:106:8:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount03.c: In function 'main':
| mount03.c:264:45: warning: 'mount03_setuid_test' directive output may be truncated writing 19 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   264 |                 snprintf(file, PATH_MAX, "%smount03_setuid_test", path_name);
|       |                                             ^~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'test_rwflag' at mount03.c:264:3,
|     inlined from 'main' at mount03.c:106:8:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 20 and 4115 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount03.c: In function 'main':
| mount03.c:250:53: warning: 'tmp2' directive output may be truncated writing 4 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   250 |                         snprintf(file, PATH_MAX, "%stmp2", path_name);
|       |                                                     ^~~~
| In function 'snprintf',
|     inlined from 'test_rwflag' at mount03.c:250:4,
|     inlined from 'main' at mount03.c:106:8:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 5 and 4100 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount03.c: In function 'main':
| mount03.c:200:45: warning: '%s' directive output may be truncated writing 9 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   200 |                 snprintf(file, PATH_MAX, "%s%s", path_name, TEMP_FILE);
|       |                                             ^~
| In function 'snprintf',
|     inlined from 'test_rwflag' at mount03.c:200:3,
|     inlined from 'main' at mount03.c:106:8:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 10 and 4105 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount03.c: In function 'main':
| mount03.c:180:45: warning: 'tmp1' directive output may be truncated writing 4 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   180 |                 snprintf(file, PATH_MAX, "%stmp1", path_name);
|       |                                             ^~~~
| In function 'snprintf',
|     inlined from 'test_rwflag' at mount03.c:180:3,
|     inlined from 'main' at mount03.c:106:8:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 5 and 4100 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount03.c: In function 'main':
| mount03.c:157:45: warning: 'mynod_' directive output may be truncated writing 6 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   157 |                 snprintf(file, PATH_MAX, "%smynod_%d_%d", path_name, getpid(),
|       |                                             ^~~~~~
| In function 'test_rwflag',
|     inlined from 'main' at mount03.c:106:8:
| mount03.c:157:42: note: directive argument in the range [0, 2147483647]
|   157 |                 snprintf(file, PATH_MAX, "%smynod_%d_%d", path_name, getpid(),
|       |                                          ^~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'test_rwflag' at mount03.c:157:3,
|     inlined from 'main' at mount03.c:106:8:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 10 and 4124 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| mount03.c: In function 'main':
| mount03.c:141:45: warning: 'tmp' directive output may be truncated writing 3 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   141 |                 snprintf(file, PATH_MAX, "%stmp", path_name);
|       |                                             ^~~
| In function 'snprintf',
|     inlined from 'test_rwflag' at mount03.c:141:3,
|     inlined from 'main' at mount03.c:106:8:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 4 and 4099 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/mount/mount01
| CC testcases/kernel/syscalls/mount/mount04
| CC testcases/kernel/syscalls/mount/mount05
| CC testcases/kernel/syscalls/mount/mount06
| CC testcases/kernel/syscalls/mount/mount02
| CC testcases/kernel/syscalls/mount/mount03
| CC testcases/kernel/syscalls/move_mount/move_mount02
| CC testcases/kernel/syscalls/move_mount/move_mount01
| move_pages_support.c: In function 'free_pages':
| move_pages_support.c:37:24: warning: unused parameter 'pages' [-Wunused-parameter]
|    37 | void free_pages(void **pages, unsigned int num)
|       |                 ~~~~~~~^~~~~
| move_pages_support.c:37:44: warning: unused parameter 'num' [-Wunused-parameter]
|    37 | void free_pages(void **pages, unsigned int num)
|       |                               ~~~~~~~~~~~~~^~~
| move_pages_support.c: In function 'verify_pages_on_nodes':
| move_pages_support.c:169:30: warning: unused parameter 'pages' [-Wunused-parameter]
|   169 | verify_pages_on_nodes(void **pages, int *status, unsigned int num, int *nodes)
|       |                       ~~~~~~~^~~~~
| move_pages_support.c:169:42: warning: unused parameter 'status' [-Wunused-parameter]
|   169 | verify_pages_on_nodes(void **pages, int *status, unsigned int num, int *nodes)
|       |                                     ~~~~~^~~~~~
| move_pages_support.c:169:63: warning: unused parameter 'num' [-Wunused-parameter]
|   169 | verify_pages_on_nodes(void **pages, int *status, unsigned int num, int *nodes)
|       |                                                  ~~~~~~~~~~~~~^~~
| move_pages_support.c:169:73: warning: unused parameter 'nodes' [-Wunused-parameter]
|   169 | verify_pages_on_nodes(void **pages, int *status, unsigned int num, int *nodes)
|       |                                                                    ~~~~~^~~~~
| move_pages_support.c: In function 'verify_pages_linear':
| move_pages_support.c:215:33: warning: unused parameter 'pages' [-Wunused-parameter]
|   215 | void verify_pages_linear(void **pages, int *status, unsigned int num)
|       |                          ~~~~~~~^~~~~
| move_pages_support.c:215:45: warning: unused parameter 'status' [-Wunused-parameter]
|   215 | void verify_pages_linear(void **pages, int *status, unsigned int num)
|       |                                        ~~~~~^~~~~~
| move_pages_support.c:215:66: warning: unused parameter 'num' [-Wunused-parameter]
|   215 | void verify_pages_linear(void **pages, int *status, unsigned int num)
|       |                                                     ~~~~~~~~~~~~~^~~
| move_pages_support.c: In function 'alloc_shared_pages_on_node':
| move_pages_support.c:270:39: warning: unused parameter 'pages' [-Wunused-parameter]
|   270 | int alloc_shared_pages_on_node(void **pages, unsigned int num, int node)
|       |                                ~~~~~~~^~~~~
| move_pages_support.c:270:59: warning: unused parameter 'num' [-Wunused-parameter]
|   270 | int alloc_shared_pages_on_node(void **pages, unsigned int num, int node)
|       |                                              ~~~~~~~~~~~~~^~~
| move_pages_support.c:270:68: warning: unused parameter 'node' [-Wunused-parameter]
|   270 | int alloc_shared_pages_on_node(void **pages, unsigned int num, int node)
|       |                                                                ~~~~^~~~
| move_pages_support.c: In function 'check_config':
| move_pages_support.c:393:32: warning: unused parameter 'min_nodes' [-Wunused-parameter]
|   393 | void check_config(unsigned int min_nodes)
|       |                   ~~~~~~~~~~~~~^~~~~~~~~
| CC testcases/kernel/syscalls/move_pages/move_pages_support.o
| CC testcases/kernel/syscalls/move_pages/move_pages01
| CC testcases/kernel/syscalls/move_pages/move_pages02
| CC testcases/kernel/syscalls/move_pages/move_pages07
| CC testcases/kernel/syscalls/move_pages/move_pages04
| CC testcases/kernel/syscalls/move_pages/move_pages05
| CC testcases/kernel/syscalls/move_pages/move_pages06
| CC testcases/kernel/syscalls/move_pages/move_pages09
| CC testcases/kernel/syscalls/move_pages/move_pages03
| CC testcases/kernel/syscalls/move_pages/move_pages10
| CC testcases/kernel/syscalls/move_pages/move_pages12
| CC testcases/kernel/syscalls/move_pages/move_pages11
| In file included from ../../../../include/old/test.h:37,
|                  from mprotect02.c:42:
| mprotect02.c: In function 'main':
| ../../../../include/tst_minmax.h:12:21: warning: comparison of distinct pointer types lacks a cast
|    12 |         (void) (&_a == &_b); \
|       |                     ^~
| mprotect02.c:80:42: note: in expansion of macro 'MIN'
|    80 |                         bytes_to_write = MIN(strlen(buf), num_bytes);
|       |                                          ^~~
| CC testcases/kernel/syscalls/mprotect/mprotect03
| CC testcases/kernel/syscalls/mprotect/mprotect01
| CC testcases/kernel/syscalls/mprotect/mprotect02
| CC testcases/kernel/syscalls/mprotect/mprotect04
| CC testcases/kernel/syscalls/mq_notify/mq_notify02
| CC testcases/kernel/syscalls/mq_notify/mq_notify01
| CC testcases/kernel/syscalls/mq_open/mq_open01
| CC testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01
| CC testcases/kernel/syscalls/mq_timedsend/mq_timedsend01
| CC testcases/kernel/syscalls/mq_unlink/mq_unlink01
| BUILD libltpipc.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mremap/mremap02
| CC testcases/kernel/syscalls/mremap/mremap03
| CC testcases/kernel/syscalls/mremap/mremap04
| CC testcases/kernel/syscalls/mremap/mremap01
| CC testcases/kernel/syscalls/mremap/mremap05
| CC testcases/kernel/syscalls/msync/msync02
| CC testcases/kernel/syscalls/msync/msync01
| CC testcases/kernel/syscalls/msync/msync03
| CC testcases/kernel/syscalls/msync/msync04
| CC testcases/kernel/syscalls/munlockall/munlockall01
| CC testcases/kernel/syscalls/munlock/munlock02
| CC testcases/kernel/syscalls/munlock/munlock01
| CC testcases/kernel/syscalls/munmap/munmap01
| CC testcases/kernel/syscalls/munmap/munmap02
| CC testcases/kernel/syscalls/munmap/munmap03
| CC testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02
| CC testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01
| CC testcases/kernel/syscalls/nanosleep/nanosleep04
| CC testcases/kernel/syscalls/nanosleep/nanosleep01
| CC testcases/kernel/syscalls/nanosleep/nanosleep02
| CC testcases/kernel/syscalls/newuname/newuname01
| test_func.c: In function 'test_func1':
| test_func.c:41:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|    41 | test_func1(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:42:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|    42 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func.c:42:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|    42 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func3':
| test_func.c:76:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|    76 | test_func3(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:77:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|    77 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func.c:77:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|    77 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func4':
| test_func.c:101:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   101 | test_func4(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:102:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   102 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func.c:102:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   102 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func5':
| test_func.c:114:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   114 | test_func5(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:115:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   115 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func7':
| test_func.c:137:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   137 | test_func7(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:138:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   138 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func.c:138:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   138 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| nftw64.c: In function 'setup':
| nftw64.c:713:9: warning: ignoring return value of 'setuid' declared with attribute 'warn_unused_result' [-Wunused-result]
|   713 |         setuid(ltpuser->pw_uid);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~
| test_func.c: In function 'test_func8':
| test_func.c:168:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   168 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func9':
| test_func.c:248:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   248 | test_func9(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:249:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   249 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func10':
| test_func.c:283:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   283 | test_func10(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:284:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   284 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func11':
| test_func.c:317:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   317 | test_func11(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:318:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   318 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func12':
| test_func.c:351:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   351 | test_func12(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:352:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   352 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func13':
| test_func.c:383:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   383 | test_func13(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:384:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   384 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func14':
| test_func.c:418:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   418 | test_func14(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:419:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   419 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func15':
| test_func.c:453:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   453 | test_func15(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:454:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   454 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func16':
| test_func.c:468:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   468 | test_func16(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:469:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   469 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func.c: In function 'test_func17':
| test_func.c:497:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   497 | test_func17(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:498:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   498 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func18':
| test_func.c:510:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   510 | test_func18(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:511:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   511 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func19':
| test_func.c:522:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   522 | test_func19(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:523:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   523 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func20':
| nftw.c: In function 'setup':
| test_func.c:546:25: warning: unused parameter 'path_name' [-Wunused-parameter]
|   546 | test_func20(const char *path_name, const struct stat *stat_pointer,
|       |             ~~~~~~~~~~~~^~~~~~~~~
| nftw.c:686:9: warning: ignoring return value of 'setuid' declared with attribute 'warn_unused_result' [-Wunused-result]
|   686 |         setuid(ltpuser->pw_uid);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~
| test_func.c:546:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   546 | test_func20(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:547:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   547 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func.c:547:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   547 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func21':
| test_func.c:553:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   553 | test_func21(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:554:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   554 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func.c:554:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   554 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func22':
| test_func.c:581:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   581 | test_func22(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:582:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   582 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func.c: In function 'test_func23':
| test_func.c:613:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   613 | test_func23(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:614:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   614 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| lib.c: In function 'get_long_name_buffer':
| lib.c:65:62: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|    65 |         if ((path_length = pathconf(tmp_path, _PC_PATH_MAX)) == -1) {
|       |                                                              ^~
| lib.c:72:62: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|    72 |         if ((name_length = pathconf(tmp_path, _PC_NAME_MAX)) == -1) {
|       |                                                              ^~
| lib.c: In function 'test_ENAMETOOLONG_path':
| lib.c:183:60: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|   183 |         if ((pcPathMax = pathconf(tmp_path, _PC_PATH_MAX)) == -1) {
|       |                                                            ^~
| lib.c:208:27: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   208 |         while (pathLength < pcPathMax) {
|       |                           ^
| lib.c:219:27: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   219 |         while (pathLength <= pcPathMax) {
|       |                           ^~
| lib.c:226:24: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   226 |         if (pathLength != pcPathMax + 1) {
|       |                        ^~
| tools.c: In function 'nftw_fn':
| tools.c:158:25: warning: unused parameter 'path' [-Wunused-parameter]
|   158 | int nftw_fn(const char *path, const struct stat *st, int ival, struct FTW *FTWS)
|       |             ~~~~~~~~~~~~^~~~
| tools.c:158:50: warning: unused parameter 'st' [-Wunused-parameter]
|   158 | int nftw_fn(const char *path, const struct stat *st, int ival, struct FTW *FTWS)
|       |                               ~~~~~~~~~~~~~~~~~~~^~
| tools.c:158:58: warning: unused parameter 'ival' [-Wunused-parameter]
|   158 | int nftw_fn(const char *path, const struct stat *st, int ival, struct FTW *FTWS)
|       |                                                      ~~~~^~~~
| tools.c:158:76: warning: unused parameter 'FTWS' [-Wunused-parameter]
|   158 | int nftw_fn(const char *path, const struct stat *st, int ival, struct FTW *FTWS)
|       |                                                                ~~~~~~~~~~~~^~~~
| tools.c: In function 'do_info':
| tools.c:250:26: warning: unused parameter 'path_name' [-Wunused-parameter]
|   250 | void do_info(const char *path_name)
|       |              ~~~~~~~~~~~~^~~~~~~~~
| tools.c: In function 'cleanup_function':
| tools.c:53:9: warning: ignoring return value of 'system' declared with attribute 'warn_unused_result' [-Wunused-result]
|    53 |         system("rm -rf ./tmp");
|       |         ^~~~~~~~~~~~~~~~~~~~~~
| tools64.c: In function 'nftw64_fn':
| tools64.c:158:23: warning: unused parameter 'path' [-Wunused-parameter]
|   158 | nftw64_fn(const char *path, const struct stat64 *st, int ival, struct FTW *FTWS)
|       |           ~~~~~~~~~~~~^~~~
| tools64.c:158:50: warning: unused parameter 'st' [-Wunused-parameter]
|   158 | nftw64_fn(const char *path, const struct stat64 *st, int ival, struct FTW *FTWS)
|       |                             ~~~~~~~~~~~~~~~~~~~~~^~
| tools64.c:158:58: warning: unused parameter 'ival' [-Wunused-parameter]
|   158 | nftw64_fn(const char *path, const struct stat64 *st, int ival, struct FTW *FTWS)
|       |                                                      ~~~~^~~~
| tools64.c:158:76: warning: unused parameter 'FTWS' [-Wunused-parameter]
|   158 | nftw64_fn(const char *path, const struct stat64 *st, int ival, struct FTW *FTWS)
|       |                                                                ~~~~~~~~~~~~^~~~
| tools64.c: In function 'do_info':
| tools64.c:250:26: warning: unused parameter 'path_name' [-Wunused-parameter]
|   250 | void do_info(const char *path_name)
|       |              ~~~~~~~~~~~~^~~~~~~~~
| tools64.c: In function 'cleanup_function':
| tools64.c:52:9: warning: ignoring return value of 'system' declared with attribute 'warn_unused_result' [-Wunused-result]
|    52 |         system("rm -rf ./tmp");
|       |         ^~~~~~~~~~~~~~~~~~~~~~
| lib64.c: In function 'get_long_name_buffer':
| lib64.c:65:62: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|    65 |         if ((path_length = pathconf(tmp_path, _PC_PATH_MAX)) == -1) {
|       |                                                              ^~
| lib64.c:72:62: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|    72 |         if ((name_length = pathconf(tmp_path, _PC_NAME_MAX)) == -1) {
|       |                                                              ^~
| lib64.c: In function 'test_ENAMETOOLONG_path':
| lib64.c:183:60: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|   183 |         if ((pcPathMax = pathconf(tmp_path, _PC_PATH_MAX)) == -1) {
|       |                                                            ^~
| lib64.c:208:27: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   208 |         while (pathLength < pcPathMax) {
|       |                           ^
| lib64.c:219:27: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   219 |         while (pathLength <= pcPathMax) {
|       |                           ^~
| lib64.c:226:24: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   226 |         if (pathLength != pcPathMax + 1) {
|       |                        ^~
| CC testcases/kernel/syscalls/nftw/nftw64.o
| test_func64.c: In function 'test_func1':
| test_func64.c:41:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|    41 | test_func1(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:42:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|    42 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func64.c:42:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|    42 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func3':
| test_func64.c:75:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|    75 | test_func3(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:76:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|    76 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func64.c:76:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|    76 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func4':
| test_func64.c:100:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   100 | test_func4(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:101:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   101 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func64.c:101:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   101 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func5':
| test_func64.c:113:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   113 | test_func5(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:114:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   114 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func7':
| test_func64.c:137:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   137 | test_func7(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:138:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   138 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func64.c:138:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   138 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func8':
| test_func64.c:169:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   169 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func9':
| test_func64.c:250:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   250 | test_func9(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:251:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   251 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func10':
| test_func64.c:286:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   286 | test_func10(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:287:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   287 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func11':
| test_func64.c:321:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   321 | test_func11(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:322:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   322 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func12':
| test_func64.c:356:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   356 | test_func12(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:357:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   357 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func13':
| test_func64.c:389:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   389 | test_func13(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:390:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   390 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func14':
| test_func64.c:425:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   425 | test_func14(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:426:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   426 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func15':
| test_func64.c:461:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   461 | test_func15(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:462:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   462 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func16':
| test_func64.c:478:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   478 | test_func16(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:479:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   479 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func64.c: In function 'test_func17':
| test_func64.c:508:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   508 | test_func17(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:509:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   509 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func18':
| test_func64.c:521:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   521 | test_func18(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:522:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   522 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func19':
| test_func64.c:533:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   533 | test_func19(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:534:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   534 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func20':
| test_func64.c:558:25: warning: unused parameter 'path_name' [-Wunused-parameter]
|   558 | test_func20(const char *path_name, const struct stat64 *stat_pointer,
|       |             ~~~~~~~~~~~~^~~~~~~~~
| test_func64.c:558:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   558 | test_func20(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:559:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   559 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func64.c:559:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   559 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func21':
| test_func64.c:565:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   565 | test_func21(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:566:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   566 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func64.c:566:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   566 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func22':
| test_func64.c:594:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   594 | test_func22(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:595:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   595 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func64.c: In function 'test_func23':
| test_func64.c:626:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   626 | test_func23(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:627:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   627 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| CC testcases/kernel/syscalls/nftw/nftw.o
| CC testcases/kernel/syscalls/nftw/tools.o
| CC testcases/kernel/syscalls/nftw/tools64.o
| CC testcases/kernel/syscalls/nftw/lib.o
| CC testcases/kernel/syscalls/nftw/lib64.o
| CC testcases/kernel/syscalls/nftw/test_func.o
| CC testcases/kernel/syscalls/nftw/test.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../../../lib  nftw.o tools.o test_func.o test.o lib.o  -lltp -o nftw01
| CC testcases/kernel/syscalls/nftw/test64.o
| CC testcases/kernel/syscalls/nftw/test_func64.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -Wl,-O1 -W
 l,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../../../lib  nftw64.o tools64.o test_func64.o test64.o lib64.o  -lltp -o nftw6401
| CC testcases/kernel/syscalls/nice/nice01
| CC testcases/kernel/syscalls/nice/nice02
| CC testcases/kernel/syscalls/nice/nice03
| CC testcases/kernel/syscalls/nice/nice04
| CC testcases/kernel/syscalls/openat2/openat203
| CC testcases/kernel/syscalls/openat2/openat201
| CC testcases/kernel/syscalls/openat2/openat202
| CC testcases/kernel/syscalls/openat/openat02_child
| CC testcases/kernel/syscalls/openat/openat01
| CC testcases/kernel/syscalls/openat/openat02
| CC testcases/kernel/syscalls/openat/openat03
| CC testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01
| CC testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02
| open06.c: In function 'main':
| open06.c:79:28: warning: '%d' directive writing between 1 and 11 bytes into a region of size between 0 and 99 [-Wformat-overflow=]
|    79 |         sprintf(fname, "%s.%d", fname, getpid());
|       |                            ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../../../include/old/test.h:14,
|                  from open06.c:34:
| In function 'sprintf',
|     inlined from 'setup' at open06.c:79:2,
|     inlined from 'main' at open06.c:50:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 3 and 112 bytes into a destination of size 100
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: warning: '__builtin___sprintf_chk' argument 5 overlaps destination object 'fname' [-Wrestrict]
| open06.c: In function 'main':
| open06.c:42:13: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
|    42 | static char fname[100] = "fifo";
|       |             ^~~~~
| CC testcases/kernel/syscalls/open/open06
| CC testcases/kernel/syscalls/open/open02
| CC testcases/kernel/syscalls/open/open01
| CC testcases/kernel/syscalls/open/open03
| CC testcases/kernel/syscalls/open/open05
| CC testcases/kernel/syscalls/open/open12_child
| CC testcases/kernel/syscalls/open/open09
| CC testcases/kernel/syscalls/open/open04
| CC testcases/kernel/syscalls/open/open11
| CC testcases/kernel/syscalls/open/open07
| CC testcases/kernel/syscalls/open/open08
| CC testcases/kernel/syscalls/open/open10
| CC testcases/kernel/syscalls/open/open13
| CC testcases/kernel/syscalls/open/open12
| CC testcases/kernel/syscalls/open/open14
| CC testcases/kernel/syscalls/open_tree/open_tree01
| CC testcases/kernel/syscalls/open_tree/open_tree02
| make[4]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/pathconf/pathconf01
| pause02.c: In function 'sig_handle':
| pause02.c:115:28: warning: unused parameter 'sig' [-Wunused-parameter]
|   115 | static void sig_handle(int sig)
|       |                        ~~~~^~~
| CC testcases/kernel/syscalls/pause/pause02
| CC testcases/kernel/syscalls/pause/pause01
| CC testcases/kernel/syscalls/pause/pause03
| CC testcases/kernel/syscalls/perf_event_open/perf_event_open01
| CC testcases/kernel/syscalls/perf_event_open/perf_event_open03
| CC testcases/kernel/syscalls/perf_event_open/perf_event_open02
| CC testcases/kernel/syscalls/personality/personality02
| CC testcases/kernel/syscalls/personality/personality01
| CC testcases/kernel/syscalls/pidfd_getfd/pidfd_getfd02
| CC testcases/kernel/syscalls/pidfd_getfd/pidfd_getfd01
| CC testcases/kernel/syscalls/pidfd_open/pidfd_open02
| CC testcases/kernel/syscalls/pidfd_open/pidfd_open01
| CC testcases/kernel/syscalls/pidfd_open/pidfd_open03
| CC testcases/kernel/syscalls/pidfd_open/pidfd_open04
| CC testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02
| CC testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01
| CC testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03
| CC testcases/kernel/syscalls/pipe2/pipe2_02_child
| CC testcases/kernel/syscalls/pipe2/pipe2_01
| CC testcases/kernel/syscalls/pipe2/pipe2_02
| CC testcases/kernel/syscalls/pipe2/pipe2_04
| CC testcases/kernel/syscalls/pipe/pipe01
| CC testcases/kernel/syscalls/pipe/pipe03
| CC testcases/kernel/syscalls/pipe/pipe05
| CC testcases/kernel/syscalls/pipe/pipe02
| CC testcases/kernel/syscalls/pipe/pipe08
| CC testcases/kernel/syscalls/pipe/pipe10
| CC testcases/kernel/syscalls/pipe/pipe06
| CC testcases/kernel/syscalls/pipe/pipe04
| CC testcases/kernel/syscalls/pipe/pipe11
| CC testcases/kernel/syscalls/pipe/pipe07
| CC testcases/kernel/syscalls/pipe/pipe13
| CC testcases/kernel/syscalls/pipe/pipe09
| CC testcases/kernel/syscalls/pipe/pipe12
| CC testcases/kernel/syscalls/pivot_root/pivot_root01
| CC testcases/kernel/syscalls/pkeys/pkey01
| CC testcases/kernel/syscalls/poll/poll01
| CC testcases/kernel/syscalls/poll/poll02
| CC testcases/kernel/syscalls/ppoll/ppoll01
| CC testcases/kernel/syscalls/prctl/prctl01
| CC testcases/kernel/syscalls/prctl/prctl03
| CC testcases/kernel/syscalls/prctl/prctl05
| CC testcases/kernel/syscalls/prctl/prctl02
| CC testcases/kernel/syscalls/prctl/prctl06_execve
| CC testcases/kernel/syscalls/prctl/prctl06
| CC testcases/kernel/syscalls/prctl/prctl09
| CC testcases/kernel/syscalls/prctl/prctl04
| CC testcases/kernel/syscalls/prctl/prctl07
| CC testcases/kernel/syscalls/prctl/prctl08
| CC testcases/kernel/syscalls/pread/pread01_64.o
| CC testcases/kernel/syscalls/pread/pread02_64.o
| CC testcases/kernel/syscalls/pread/pread02
| LD testcases/kernel/syscalls/pread/pread02_64
| CC testcases/kernel/syscalls/pread/pread01
| LD testcases/kernel/syscalls/pread/pread01_64
| rm pread01_64.o pread02_64.o
| CC testcases/kernel/syscalls/preadv2/preadv201_64.o
| CC testcases/kernel/syscalls/preadv2/preadv202_64.o
| CC testcases/kernel/syscalls/preadv2/preadv203_64.o
| CC testcases/kernel/syscalls/preadv2/preadv202
| CC testcases/kernel/syscalls/preadv2/preadv201
| LD testcases/kernel/syscalls/preadv2/preadv201_64
| LD testcases/kernel/syscalls/preadv2/preadv202_64
| LD testcases/kernel/syscalls/preadv2/preadv203_64
| CC testcases/kernel/syscalls/preadv2/preadv203
| rm preadv201_64.o preadv202_64.o preadv203_64.o
| CC testcases/kernel/syscalls/preadv/preadv01_64.o
| CC testcases/kernel/syscalls/preadv/preadv02_64.o
| CC testcases/kernel/syscalls/preadv/preadv03_64.o
| CC testcases/kernel/syscalls/preadv/preadv01
| CC testcases/kernel/syscalls/preadv/preadv02
| LD testcases/kernel/syscalls/preadv/preadv02_64
| LD testcases/kernel/syscalls/preadv/preadv01_64
| LD testcases/kernel/syscalls/preadv/preadv03_64
| CC testcases/kernel/syscalls/preadv/preadv03
| rm preadv01_64.o preadv03_64.o preadv02_64.o
| CC testcases/kernel/syscalls/profil/profil01
| CC testcases/kernel/syscalls/pselect/pselect01_64.o
| CC testcases/kernel/syscalls/pselect/pselect02_64.o
| CC testcases/kernel/syscalls/pselect/pselect03_64.o
| CC testcases/kernel/syscalls/pselect/pselect02
| CC testcases/kernel/syscalls/pselect/pselect03
| LD testcases/kernel/syscalls/pselect/pselect02_64
| CC testcases/kernel/syscalls/pselect/pselect01
| LD testcases/kernel/syscalls/pselect/pselect03_64
| LD testcases/kernel/syscalls/pselect/pselect01_64
| rm pselect03_64.o pselect01_64.o pselect02_64.o
| ptrace04.c: In function 'compare_registers':
| ptrace04.c:50:38: warning: unused parameter 'poison' [-Wunused-parameter]
|    50 | void compare_registers(unsigned char poison)
|       |                        ~~~~~~~~~~~~~~^~~~~~
| CC testcases/kernel/syscalls/ptrace/ptrace04
| CC testcases/kernel/syscalls/ptrace/ptrace03
| CC testcases/kernel/syscalls/ptrace/ptrace02
| CC testcases/kernel/syscalls/ptrace/ptrace05
| CC testcases/kernel/syscalls/ptrace/ptrace11
| CC testcases/kernel/syscalls/ptrace/ptrace09
| CC testcases/kernel/syscalls/ptrace/ptrace01
| CC testcases/kernel/syscalls/ptrace/ptrace10
| CC testcases/kernel/syscalls/ptrace/ptrace08
| CC testcases/kernel/syscalls/ptrace/ptrace07
| CC testcases/kernel/syscalls/pwrite/pwrite01_64.o
| CC testcases/kernel/syscalls/pwrite/pwrite02_64.o
| CC testcases/kernel/syscalls/pwrite/pwrite03_64.o
| CC testcases/kernel/syscalls/pwrite/pwrite04_64.o
| CC testcases/kernel/syscalls/pwrite/pwrite02
| CC testcases/kernel/syscalls/pwrite/pwrite03
| LD testcases/kernel/syscalls/pwrite/pwrite03_64
| CC testcases/kernel/syscalls/pwrite/pwrite01
| LD testcases/kernel/syscalls/pwrite/pwrite02_64
| CC testcases/kernel/syscalls/pwrite/pwrite04
| LD testcases/kernel/syscalls/pwrite/pwrite01_64
| LD testcases/kernel/syscalls/pwrite/pwrite04_64
| rm pwrite01_64.o pwrite03_64.o pwrite04_64.o pwrite02_64.o
| CC testcases/kernel/syscalls/pwritev2/pwritev201_64.o
| CC testcases/kernel/syscalls/pwritev2/pwritev202_64.o
| CC testcases/kernel/syscalls/pwritev2/pwritev202
| LD testcases/kernel/syscalls/pwritev2/pwritev202_64
| CC testcases/kernel/syscalls/pwritev2/pwritev201
| LD testcases/kernel/syscalls/pwritev2/pwritev201_64
| rm pwritev201_64.o pwritev202_64.o
| CC testcases/kernel/syscalls/pwritev/pwritev01_64.o
| CC testcases/kernel/syscalls/pwritev/pwritev02_64.o
| CC testcases/kernel/syscalls/pwritev/pwritev03_64.o
| LD testcases/kernel/syscalls/pwritev/pwritev02_64
| LD testcases/kernel/syscalls/pwritev/pwritev01_64
| CC testcases/kernel/syscalls/pwritev/pwritev01
| CC testcases/kernel/syscalls/pwritev/pwritev02
| LD testcases/kernel/syscalls/pwritev/pwritev03_64
| CC testcases/kernel/syscalls/pwritev/pwritev03
| rm pwritev01_64.o pwritev02_64.o pwritev03_64.o
| In file included from quotactl02.h:15,
|                  from quotactl05.c:21:
| quotactl_syscall_var.h:24:13: warning: 'quotactl_info' defined but not used [-Wunused-function]
|    24 | static void quotactl_info(void)
|       |             ^~~~~~~~~~~~~
| quotactl_syscall_var.h:17:12: warning: 'do_quotactl' defined but not used [-Wunused-function]
|    17 | static int do_quotactl(int fd, int cmd, const char *special, int id, caddr_t addr)
|       |            ^~~~~~~~~~~
| quotactl_syscall_var.h:15:12: warning: 'fd' defined but not used [-Wunused-variable]
|    15 | static int fd = -1;
|       |            ^~
| In file included from quotactl03.c:32:
| quotactl_syscall_var.h:24:13: warning: 'quotactl_info' defined but not used [-Wunused-function]
|    24 | static void quotactl_info(void)
|       |             ^~~~~~~~~~~~~
| quotactl_syscall_var.h:17:12: warning: 'do_quotactl' defined but not used [-Wunused-function]
|    17 | static int do_quotactl(int fd, int cmd, const char *special, int id, caddr_t addr)
|       |            ^~~~~~~~~~~
| quotactl_syscall_var.h:15:12: warning: 'fd' defined but not used [-Wunused-variable]
|    15 | static int fd = -1;
|       |            ^~
| In file included from quotactl07.c:22:
| quotactl_syscall_var.h:24:13: warning: 'quotactl_info' defined but not used [-Wunused-function]
|    24 | static void quotactl_info(void)
|       |             ^~~~~~~~~~~~~
| quotactl_syscall_var.h:17:12: warning: 'do_quotactl' defined but not used [-Wunused-function]
|    17 | static int do_quotactl(int fd, int cmd, const char *special, int id, caddr_t addr)
|       |            ^~~~~~~~~~~
| quotactl_syscall_var.h:15:12: warning: 'fd' defined but not used [-Wunused-variable]
|    15 | static int fd = -1;
|       |            ^~
| In file included from quotactl02.h:15,
|                  from quotactl02.c:28:
| quotactl_syscall_var.h:24:13: warning: 'quotactl_info' defined but not used [-Wunused-function]
|    24 | static void quotactl_info(void)
|       |             ^~~~~~~~~~~~~
| quotactl_syscall_var.h:17:12: warning: 'do_quotactl' defined but not used [-Wunused-function]
|    17 | static int do_quotactl(int fd, int cmd, const char *special, int id, caddr_t addr)
|       |            ^~~~~~~~~~~
| quotactl_syscall_var.h:15:12: warning: 'fd' defined but not used [-Wunused-variable]
|    15 | static int fd = -1;
|       |            ^~
| CC testcases/kernel/syscalls/quotactl/quotactl03
| CC testcases/kernel/syscalls/quotactl/quotactl05
| CC testcases/kernel/syscalls/quotactl/quotactl02
| CC testcases/kernel/syscalls/quotactl/quotactl07
| CC testcases/kernel/syscalls/quotactl/quotactl04
| CC testcases/kernel/syscalls/quotactl/quotactl01
| CC testcases/kernel/syscalls/quotactl/quotactl08
| CC testcases/kernel/syscalls/quotactl/quotactl06
| CC testcases/kernel/syscalls/quotactl/quotactl09
| CC testcases/kernel/syscalls/readahead/readahead01
| CC testcases/kernel/syscalls/readahead/readahead02
| CC testcases/kernel/syscalls/readdir/readdir01
| CC testcases/kernel/syscalls/readdir/readdir21
| CC testcases/kernel/syscalls/readlinkat/readlinkat02
| CC testcases/kernel/syscalls/readlinkat/readlinkat01
| CC testcases/kernel/syscalls/readlink/readlink01
| CC testcases/kernel/syscalls/readlink/readlink03
| CC testcases/kernel/syscalls/read/read01
| CC testcases/kernel/syscalls/read/read03
| CC testcases/kernel/syscalls/read/read04
| CC testcases/kernel/syscalls/read/read02
| CC testcases/kernel/syscalls/readv/readv02
| CC testcases/kernel/syscalls/readv/readv01
| CC testcases/kernel/syscalls/realpath/realpath01
| CC testcases/kernel/syscalls/reboot/reboot01
| CC testcases/kernel/syscalls/reboot/reboot02
| recvfrom01.c: In function 'do_child':
| recvfrom01.c:323:39: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   323 |                                 (void)write(newfd, "hoser\n", 6);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/recvfrom/recvfrom01
| recv01.c: In function 'do_child':
| recv01.c:294:39: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   294 |                                 (void)write(newfd, "hoser\n", 6);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/recv/recv01
| CC testcases/kernel/syscalls/recvmmsg/recvmmsg01
| recvmsg01.c: In function 'do_child':
| recvmsg01.c:463:39: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   463 |                                 (void)write(newfd, "hoser\n", 6);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/recvmsg/recvmsg03
| CC testcases/kernel/syscalls/recvmsg/recvmsg02
| CC testcases/kernel/syscalls/recvmsg/recvmsg01
| CC testcases/kernel/syscalls/remap_file_pages/remap_file_pages02
| CC testcases/kernel/syscalls/remap_file_pages/remap_file_pages01
| CC testcases/kernel/syscalls/removexattr/removexattr01
| CC testcases/kernel/syscalls/removexattr/removexattr02
| CC testcases/kernel/syscalls/renameat2/renameat201
| CC testcases/kernel/syscalls/renameat2/renameat202
| CC testcases/kernel/syscalls/renameat/renameat01
| rename04.c: In function 'setup':
| rename04.c:148:27: warning: '%s' directive writing up to 254 bytes into a region of size 40 [-Wformat-overflow=]
|   148 |         sprintf(tstfile, "%s/tstfile_%d", mdir, getpid());
|       |                           ^~              ~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../../../include/old/test.h:14,
|                  from rename04.c:66:
| In function 'sprintf',
|     inlined from 'setup' at rename04.c:148:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 11 and 275 bytes into a destination of size 40
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| rename06.c: In function 'setup':
| rename06.c:137:26: warning: '/rndir_' directive writing 7 bytes into a region of size between 1 and 255 [-Wformat-overflow=]
|   137 |         sprintf(mdir, "%s/rndir_%d", fdir, getpid());
|       |                          ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../../../include/old/test.h:14,
|                  from rename06.c:65:
| In function 'sprintf',
|     inlined from 'setup' at rename06.c:137:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 9 and 273 bytes into a destination of size 255
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| rename10.c: In function 'setup':
| rename10.c:159:27: warning: '/rnfile_' directive writing 8 bytes into a region of size between 1 and 255 [-Wformat-overflow=]
|   159 |         sprintf(mname, "%s/rnfile_%d", mdir, getpid());
|       |                           ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../../../include/old/test.h:14,
|                  from rename10.c:67:
| In function 'sprintf',
|     inlined from 'setup' at rename10.c:159:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 10 and 274 bytes into a destination of size 255
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| rename14.c: In function 'main':
| rename14.c:75:26: warning: cast between incompatible function types from 'int (*)(void)' to 'void (*)()' [-Wcast-function-type]
|    75 |         act.sa_handler = (void (*)())term;
|       |                          ^
| rename14.c:83:26: warning: cast between incompatible function types from 'int (*)(void)' to 'void (*)()' [-Wcast-function-type]
|    83 |         act.sa_handler = (void (*)())al;
|       |                          ^
| CC testcases/kernel/syscalls/rename/rename02
| CC testcases/kernel/syscalls/rename/rename04
| rename12.c: In function 'setup':
| rename12.c:193:27: warning: '/tfile_' directive writing 7 bytes into a region of size between 1 and 255 [-Wformat-overflow=]
|   193 |         sprintf(fname, "%s/tfile_%d", fdir, getpid());
|       |                           ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ../../../../include/old/test.h:14,
|                  from rename12.c:75:
| In function 'sprintf',
|     inlined from 'setup' at rename12.c:193:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 9 and 273 bytes into a destination of size 255
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| rename12.c: In function 'setup':
| rename12.c:194:27: warning: '/rnfile_' directive writing 8 bytes into a region of size between 1 and 255 [-Wformat-overflow=]
|   194 |         sprintf(mname, "%s/rnfile_%d", fdir, getpid());
|       |                           ^~~~~~~~
| In function 'sprintf',
|     inlined from 'setup' at rename12.c:194:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 10 and 274 bytes into a destination of size 255
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/rename/rename05
| CC testcases/kernel/syscalls/rename/rename01
| CC testcases/kernel/syscalls/rename/rename03
| CC testcases/kernel/syscalls/rename/rename06
| CC testcases/kernel/syscalls/rename/rename08
| CC testcases/kernel/syscalls/rename/rename07
| CC testcases/kernel/syscalls/rename/rename09
| CC testcases/kernel/syscalls/rename/rename10
| CC testcases/kernel/syscalls/rename/rename14
| CC testcases/kernel/syscalls/rename/rename11
| CC testcases/kernel/syscalls/rename/rename12
| CC testcases/kernel/syscalls/rename/rename13
| CC testcases/kernel/syscalls/request_key/request_key01
| CC testcases/kernel/syscalls/request_key/request_key02
| CC testcases/kernel/syscalls/request_key/request_key05
| CC testcases/kernel/syscalls/request_key/request_key04
| CC testcases/kernel/syscalls/request_key/request_key03
| CC testcases/kernel/syscalls/rmdir/rmdir03
| CC testcases/kernel/syscalls/rmdir/rmdir01
| CC testcases/kernel/syscalls/rmdir/rmdir02
| In file included from rt_sigaction01.c:42:
| ../../../../include/lapi/rt_sigaction.h: In function 'handler_h':
| ../../../../include/lapi/rt_sigaction.h:59:27: warning: unused parameter 'signal' [-Wunused-parameter]
|    59 | static void handler_h(int signal)
|       |                       ~~~~^~~~~~
| rt_sigaction01.c: In function 'set_handler':
| rt_sigaction01.c:72:37: warning: unused parameter 'sig_to_mask' [-Wunused-parameter]
|    72 | static int set_handler(int sig, int sig_to_mask, int mask_flags)
|       |                                 ~~~~^~~~~~~~~~~
| In file included from rt_sigaction02.c:38:
| ../../../../include/lapi/rt_sigaction.h: In function 'handler_h':
| ../../../../include/lapi/rt_sigaction.h:59:27: warning: unused parameter 'signal' [-Wunused-parameter]
|    59 | static void handler_h(int signal)
|       |                       ~~~~^~~~~~
| In file included from rt_sigaction03.c:38:
| ../../../../include/lapi/rt_sigaction.h: In function 'handler_h':
| ../../../../include/lapi/rt_sigaction.h:59:27: warning: unused parameter 'signal' [-Wunused-parameter]
|    59 | static void handler_h(int signal)
|       |                       ~~~~^~~~~~
| CC testcases/kernel/syscalls/rt_sigaction/rt_sigaction02
| CC testcases/kernel/syscalls/rt_sigaction/rt_sigaction01
| CC testcases/kernel/syscalls/rt_sigaction/rt_sigaction03
| In file included from rt_sigprocmask01.c:48:
| ../../../../include/lapi/rt_sigaction.h: In function 'handler_h':
| ../../../../include/lapi/rt_sigaction.h:59:27: warning: unused parameter 'signal' [-Wunused-parameter]
|    59 | static void handler_h(int signal)
|       |                       ~~~~^~~~~~
| rt_sigprocmask01.c: In function 'sig_handler':
| rt_sigprocmask01.c:69:22: warning: unused parameter 'sig' [-Wunused-parameter]
|    69 | void sig_handler(int sig)
|       |                  ~~~~^~~
| CC testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask02
| CC testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01
| CC testcases/kernel/syscalls/rt_sigqueueinfo/rt_sigqueueinfo01
| In file included from ../../../../include/lapi/safe_rt_signal.h:9,
|                  from rt_sigsuspend01.c:16:
| ../../../../include/lapi/rt_sigaction.h: In function 'handler_h':
| ../../../../include/lapi/rt_sigaction.h:59:27: warning: unused parameter 'signal' [-Wunused-parameter]
|    59 | static void handler_h(int signal)
|       |                       ~~~~^~~~~~
| CC testcases/kernel/syscalls/rt_sigsuspend/rt_sigsuspend01
| BUILD libltpsigwait.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01
| CC testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01
| CC testcases/kernel/syscalls/sbrk/sbrk01
| CC testcases/kernel/syscalls/sbrk/sbrk02
| CC testcases/kernel/syscalls/sbrk/sbrk03
| CC testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01
| CC testcases/kernel/syscalls/sched_getattr/sched_getattr01
| CC testcases/kernel/syscalls/sched_getattr/sched_getattr02
| CC testcases/kernel/syscalls/sched_getparam/sched_getparam03
| CC testcases/kernel/syscalls/sched_getparam/sched_getparam01
| CC testcases/kernel/syscalls/sched_get_priority_max/sched_get_priority_max02
| CC testcases/kernel/syscalls/sched_get_priority_max/sched_get_priority_max01
| CC testcases/kernel/syscalls/sched_get_priority_min/sched_get_priority_min02
| CC testcases/kernel/syscalls/sched_get_priority_min/sched_get_priority_min01
| CC testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01
| CC testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02
| CC testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01
| CC testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02
| CC testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03
| CC testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01
| CC testcases/kernel/syscalls/sched_setattr/sched_setattr01
| CC testcases/kernel/syscalls/sched_setparam/sched_setparam04
| CC testcases/kernel/syscalls/sched_setparam/sched_setparam02
| CC testcases/kernel/syscalls/sched_setparam/sched_setparam05
| CC testcases/kernel/syscalls/sched_setparam/sched_setparam03
| CC testcases/kernel/syscalls/sched_setparam/sched_setparam01
| CC testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01
| CC testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02
| CC testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03
| CC testcases/kernel/syscalls/sched_yield/sched_yield01
| In file included from ../../../../include/tst_test.h:98,
|                  from ../../../../include/tst_timer.h:19,
|                  from select_var.h:8,
|                  from select01.c:19:
| ../../../../include/tst_safe_macros.h: In function 'run':
| ../../../../include/tst_safe_macros.h:181:9: warning: 'buf' may be used uninitialized [-Wmaybe-uninitialized]
|   181 |         safe_write(__FILE__, __LINE__, NULL, (len_strict), (fildes), (buf), (nbyte))
|       |         ^~~~~~~~~~
| In file included from ../../../../include/tst_safe_macros.h:24:
| ../../../../include/safe_macros_fn.h:113:9: note: by argument 6 of type 'const void *' to 'safe_write' declared here
|   113 | ssize_t safe_write(const char *file, const int lineno,
|       |         ^~~~~~~~~~
| select01.c:41:14: note: 'buf' declared here
|    41 |         char buf;
|       |              ^~~
| CC testcases/kernel/syscalls/select/select02
| CC testcases/kernel/syscalls/select/select03
| CC testcases/kernel/syscalls/select/select04
| CC testcases/kernel/syscalls/select/select01
| CC testcases/kernel/syscalls/sendfile/sendfile02_64.o
| CC testcases/kernel/syscalls/sendfile/sendfile03_64.o
| CC testcases/kernel/syscalls/sendfile/sendfile04_64.o
| CC testcases/kernel/syscalls/sendfile/sendfile05_64.o
| CC testcases/kernel/syscalls/sendfile/sendfile06_64.o
| CC testcases/kernel/syscalls/sendfile/sendfile07_64.o
| CC testcases/kernel/syscalls/sendfile/sendfile08_64.o
| CC testcases/kernel/syscalls/sendfile/sendfile09_64.o
| CC testcases/kernel/syscalls/sendfile/sendfile03
| CC testcases/kernel/syscalls/sendfile/sendfile04
| CC testcases/kernel/syscalls/sendfile/sendfile05
| CC testcases/kernel/syscalls/sendfile/sendfile09
| CC testcases/kernel/syscalls/sendfile/sendfile08
| CC testcases/kernel/syscalls/sendfile/sendfile02
| CC testcases/kernel/syscalls/sendfile/sendfile07
| LD testcases/kernel/syscalls/sendfile/sendfile07_64
| LD testcases/kernel/syscalls/sendfile/sendfile05_64
| LD testcases/kernel/syscalls/sendfile/sendfile02_64
| LD testcases/kernel/syscalls/sendfile/sendfile03_64
| LD testcases/kernel/syscalls/sendfile/sendfile06_64
| CC testcases/kernel/syscalls/sendfile/sendfile06
| LD testcases/kernel/syscalls/sendfile/sendfile09_64
| LD testcases/kernel/syscalls/sendfile/sendfile04_64
| LD testcases/kernel/syscalls/sendfile/sendfile08_64
| rm sendfile08_64.o sendfile05_64.o sendfile07_64.o sendfile04_64.o sendfile06_64.o sendfile03_64.o sendfile02_64.o sendfile09_64.o
| CC testcases/kernel/syscalls/send/send02
| CC testcases/kernel/syscalls/send/send01
| CC testcases/kernel/syscalls/sendmmsg/sendmmsg02
| CC testcases/kernel/syscalls/sendmmsg/sendmmsg01
| sendmsg02.c: In function 'server':
| sendmsg02.c:115:17: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   115 |                 read(pipefd[0], &fd, 1);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~
| sendmsg02.c: In function 'client':
| sendmsg02.c:92:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    92 |                 write(pipefd[1], &fd, 1);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/sendmsg/sendmsg02
| CC testcases/kernel/syscalls/sendmsg/sendmsg01
| CC testcases/kernel/syscalls/sendmsg/sendmsg03
| CC testcases/kernel/syscalls/sendto/sendto02
| CC testcases/kernel/syscalls/sendto/sendto03
| CC testcases/kernel/syscalls/sendto/sendto01
| CC testcases/kernel/syscalls/setdomainname/setdomainname03
| CC testcases/kernel/syscalls/setdomainname/setdomainname02
| CC testcases/kernel/syscalls/setdomainname/setdomainname01
| CC testcases/kernel/syscalls/setegid/setegid02
| CC testcases/kernel/syscalls/setegid/setegid01
| CC testcases/kernel/syscalls/setfsgid/setfsgid01_16.o
| CC testcases/kernel/syscalls/setfsgid/setfsgid02_16.o
| CC testcases/kernel/syscalls/setfsgid/setfsgid03_16.o
| CC testcases/kernel/syscalls/setfsgid/setfsgid03.o
| CC testcases/kernel/syscalls/setfsgid/setfsgid01.o
| CC testcases/kernel/syscalls/setfsgid/setfsgid02.o
| LD testcases/kernel/syscalls/setfsgid/setfsgid02
| LD testcases/kernel/syscalls/setfsgid/setfsgid01_16
| LD testcases/kernel/syscalls/setfsgid/setfsgid03
| LD testcases/kernel/syscalls/setfsgid/setfsgid01
| LD testcases/kernel/syscalls/setfsgid/setfsgid03_16
| LD testcases/kernel/syscalls/setfsgid/setfsgid02_16
| rm setfsgid01.o setfsgid03.o setfsgid01_16.o setfsgid02_16.o setfsgid03_16.o setfsgid02.o
| CC testcases/kernel/syscalls/setfsuid/setfsuid01_16.o
| CC testcases/kernel/syscalls/setfsuid/setfsuid02_16.o
| CC testcases/kernel/syscalls/setfsuid/setfsuid03_16.o
| CC testcases/kernel/syscalls/setfsuid/setfsuid04_16.o
| CC testcases/kernel/syscalls/setfsuid/setfsuid03.o
| CC testcases/kernel/syscalls/setfsuid/setfsuid02.o
| CC testcases/kernel/syscalls/setfsuid/setfsuid01.o
| LD testcases/kernel/syscalls/setfsuid/setfsuid03
| CC testcases/kernel/syscalls/setfsuid/setfsuid04.o
| LD testcases/kernel/syscalls/setfsuid/setfsuid02
| LD testcases/kernel/syscalls/setfsuid/setfsuid04_16
| LD testcases/kernel/syscalls/setfsuid/setfsuid01_16
| LD testcases/kernel/syscalls/setfsuid/setfsuid02_16
| LD testcases/kernel/syscalls/setfsuid/setfsuid03_16
| LD testcases/kernel/syscalls/setfsuid/setfsuid01
| LD testcases/kernel/syscalls/setfsuid/setfsuid04
| rm setfsuid04_16.o setfsuid01_16.o setfsuid03.o setfsuid04.o setfsuid03_16.o setfsuid02_16.o setfsuid02.o setfsuid01.o
| CC testcases/kernel/syscalls/setgid/setgid01_16.o
| CC testcases/kernel/syscalls/setgid/setgid02_16.o
| CC testcases/kernel/syscalls/setgid/setgid03_16.o
| CC testcases/kernel/syscalls/setgid/setgid03.o
| CC testcases/kernel/syscalls/setgid/setgid01.o
| CC testcases/kernel/syscalls/setgid/setgid02.o
| LD testcases/kernel/syscalls/setgid/setgid03
| LD testcases/kernel/syscalls/setgid/setgid01
| LD testcases/kernel/syscalls/setgid/setgid02
| LD testcases/kernel/syscalls/setgid/setgid03_16
| LD testcases/kernel/syscalls/setgid/setgid01_16
| LD testcases/kernel/syscalls/setgid/setgid02_16
| rm setgid01.o setgid02_16.o setgid02.o setgid03_16.o setgid01_16.o setgid03.o
| CC testcases/kernel/syscalls/setgroups/setgroups01_16.o
| CC testcases/kernel/syscalls/setgroups/setgroups02_16.o
| CC testcases/kernel/syscalls/setgroups/setgroups03_16.o
| CC testcases/kernel/syscalls/setgroups/setgroups04_16.o
| CC testcases/kernel/syscalls/setgroups/setgroups01.o
| CC testcases/kernel/syscalls/setgroups/setgroups02.o
| CC testcases/kernel/syscalls/setgroups/setgroups03.o
| CC testcases/kernel/syscalls/setgroups/setgroups04.o
| LD testcases/kernel/syscalls/setgroups/setgroups02
| LD testcases/kernel/syscalls/setgroups/setgroups01
| LD testcases/kernel/syscalls/setgroups/setgroups03
| LD testcases/kernel/syscalls/setgroups/setgroups04
| LD testcases/kernel/syscalls/setgroups/setgroups01_16
| LD testcases/kernel/syscalls/setgroups/setgroups02_16
| LD testcases/kernel/syscalls/setgroups/setgroups04_16
| LD testcases/kernel/syscalls/setgroups/setgroups03_16
| rm setgroups02.o setgroups03.o setgroups01.o setgroups02_16.o setgroups04_16.o setgroups03_16.o setgroups01_16.o setgroups04.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -DTEST_SETHOSTNAME -I../../../../include -I../../../../include -I../../../../include/old/ -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/
 usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../../../lib  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/syscalls/sethostname/../setdomainname/setdomainname01.c  -lltp -o sethostname01
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -DTEST_SETHOSTNAME -I../../../../include -I../../../../include -I../../../../include/old/ -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/
 usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../../../lib  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/syscalls/sethostname/../setdomainname/setdomainname02.c  -lltp -o sethostname02
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot -O2 -pipe 
 -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -DTEST_SETHOSTNAME -I../../../../include -I../../../../include -I../../../../include/old/ -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/
 usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L../../../../lib  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/syscalls/sethostname/../setdomainname/setdomainname03.c  -lltp -o sethostname03
| CC testcases/kernel/syscalls/setitimer/setitimer01
| CC testcases/kernel/syscalls/setitimer/setitimer03
| CC testcases/kernel/syscalls/setitimer/setitimer02
| BUILD libltpnuma.a
| make[5]: Nothing to be done for 'all'.
| set_mempolicy05.c: In function 'run':
| set_mempolicy05.c:57:19: warning: unused variable 'node_mask_sz' [-Wunused-variable]
|    57 |         const int node_mask_sz = UINT_MAX;
|       |                   ^~~~~~~~~~~~
| set_mempolicy05.c:56:19: warning: unused variable 'node_mask_ptr' [-Wunused-variable]
|    56 |         const int node_mask_ptr = UINT_MAX;
|       |                   ^~~~~~~~~~~~~
| set_mempolicy05.c:55:19: warning: unused variable 'mode' [-Wunused-variable]
|    55 |         const int mode;
|       |                   ^~~~
| set_mempolicy05.c:54:19: warning: unused variable 'sys_num' [-Wunused-variable]
|    54 |         const int sys_num = 276;
|       |                   ^~~~~~~
| CC testcases/kernel/syscalls/set_mempolicy/set_mempolicy03
| CC testcases/kernel/syscalls/set_mempolicy/set_mempolicy01
| CC testcases/kernel/syscalls/set_mempolicy/set_mempolicy02
| CC testcases/kernel/syscalls/set_mempolicy/set_mempolicy04
| CC testcases/kernel/syscalls/set_mempolicy/set_mempolicy05
| CC testcases/kernel/syscalls/setns/setns01
| CC testcases/kernel/syscalls/setns/setns02
| CC testcases/kernel/syscalls/setpgid/setpgid01
| CC testcases/kernel/syscalls/setpgid/setpgid03_child
| CC testcases/kernel/syscalls/setpgid/setpgid02
| CC testcases/kernel/syscalls/setpgid/setpgid03
| CC testcases/kernel/syscalls/setpgrp/setpgrp01
| CC testcases/kernel/syscalls/setpgrp/setpgrp02
| CC testcases/kernel/syscalls/setpriority/setpriority02
| CC testcases/kernel/syscalls/setpriority/setpriority01
| CC testcases/kernel/syscalls/setregid/setregid01_16.o
| CC testcases/kernel/syscalls/setregid/setregid02_16.o
| CC testcases/kernel/syscalls/setregid/setregid03_16.o
| CC testcases/kernel/syscalls/setregid/setregid04_16.o
| CC testcases/kernel/syscalls/setregid/setregid01.o
| CC testcases/kernel/syscalls/setregid/setregid03.o
| CC testcases/kernel/syscalls/setregid/setregid04.o
| CC testcases/kernel/syscalls/setregid/setregid02.o
| LD testcases/kernel/syscalls/setregid/setregid01
| LD testcases/kernel/syscalls/setregid/setregid04_16
| LD testcases/kernel/syscalls/setregid/setregid03
| LD testcases/kernel/syscalls/setregid/setregid04
| LD testcases/kernel/syscalls/setregid/setregid01_16
| LD testcases/kernel/syscalls/setregid/setregid02
| LD testcases/kernel/syscalls/setregid/setregid02_16
| LD testcases/kernel/syscalls/setregid/setregid03_16
| rm setregid02_16.o setregid03_16.o setregid01.o setregid03.o setregid04_16.o setregid04.o setregid01_16.o setregid02.o
| CC testcases/kernel/syscalls/setresgid/setresgid01_16.o
| CC testcases/kernel/syscalls/setresgid/setresgid02_16.o
| CC testcases/kernel/syscalls/setresgid/setresgid03_16.o
| CC testcases/kernel/syscalls/setresgid/setresgid04_16.o
| CC testcases/kernel/syscalls/setresgid/setresgid02.o
| CC testcases/kernel/syscalls/setresgid/setresgid03.o
| CC testcases/kernel/syscalls/setresgid/setresgid01.o
| CC testcases/kernel/syscalls/setresgid/setresgid04.o
| LD testcases/kernel/syscalls/setresgid/setresgid03
| LD testcases/kernel/syscalls/setresgid/setresgid02
| LD testcases/kernel/syscalls/setresgid/setresgid01
| LD testcases/kernel/syscalls/setresgid/setresgid04
| LD testcases/kernel/syscalls/setresgid/setresgid04_16
| LD testcases/kernel/syscalls/setresgid/setresgid02_16
| LD testcases/kernel/syscalls/setresgid/setresgid03_16
| LD testcases/kernel/syscalls/setresgid/setresgid01_16
| rm setresgid02.o setresgid02_16.o setresgid04_16.o setresgid03.o setresgid01_16.o setresgid01.o setresgid04.o setresgid03_16.o
| CC testcases/kernel/syscalls/setresuid/setresuid01_16.o
| CC testcases/kernel/syscalls/setresuid/setresuid02_16.o
| CC testcases/kernel/syscalls/setresuid/setresuid03_16.o
| CC testcases/kernel/syscalls/setresuid/setresuid04_16.o
| CC testcases/kernel/syscalls/setresuid/setresuid05_16.o
| CC testcases/kernel/syscalls/setresuid/setresuid01.o
| CC testcases/kernel/syscalls/setresuid/setresuid03.o
| CC testcases/kernel/syscalls/setresuid/setresuid02.o
| CC testcases/kernel/syscalls/setresuid/setresuid05.o
| CC testcases/kernel/syscalls/setresuid/setresuid04.o
| LD testcases/kernel/syscalls/setresuid/setresuid03
| LD testcases/kernel/syscalls/setresuid/setresuid01
| LD testcases/kernel/syscalls/setresuid/setresuid02_16
| LD testcases/kernel/syscalls/setresuid/setresuid01_16
| LD testcases/kernel/syscalls/setresuid/setresuid05_16
| LD testcases/kernel/syscalls/setresuid/setresuid05
| LD testcases/kernel/syscalls/setresuid/setresuid02
| LD testcases/kernel/syscalls/setresuid/setresuid04
| LD testcases/kernel/syscalls/setresuid/setresuid04_16
| LD testcases/kernel/syscalls/setresuid/setresuid03_16
| rm setresuid02_16.o setresuid04.o setresuid03_16.o setresuid05_16.o setresuid05.o setresuid03.o setresuid02.o setresuid04_16.o setresuid01_16.o setresuid01.o
| CC testcases/kernel/syscalls/setreuid/setreuid01_16.o
| CC testcases/kernel/syscalls/setreuid/setreuid02_16.o
| CC testcases/kernel/syscalls/setreuid/setreuid03_16.o
| CC testcases/kernel/syscalls/setreuid/setreuid04_16.o
| CC testcases/kernel/syscalls/setreuid/setreuid05_16.o
| CC testcases/kernel/syscalls/setreuid/setreuid06_16.o
| CC testcases/kernel/syscalls/setreuid/setreuid07_16.o
| CC testcases/kernel/syscalls/setreuid/setreuid01.o
| CC testcases/kernel/syscalls/setreuid/setreuid06.o
| CC testcases/kernel/syscalls/setreuid/setreuid02.o
| CC testcases/kernel/syscalls/setreuid/setreuid03.o
| CC testcases/kernel/syscalls/setreuid/setreuid04.o
| CC testcases/kernel/syscalls/setreuid/setreuid05.o
| CC testcases/kernel/syscalls/setreuid/setreuid07.o
| LD testcases/kernel/syscalls/setreuid/setreuid01
| LD testcases/kernel/syscalls/setreuid/setreuid06
| LD testcases/kernel/syscalls/setreuid/setreuid03
| LD testcases/kernel/syscalls/setreuid/setreuid02
| LD testcases/kernel/syscalls/setreuid/setreuid01_16
| LD testcases/kernel/syscalls/setreuid/setreuid03_16
| LD testcases/kernel/syscalls/setreuid/setreuid04
| LD testcases/kernel/syscalls/setreuid/setreuid05
| LD testcases/kernel/syscalls/setreuid/setreuid07
| LD testcases/kernel/syscalls/setreuid/setreuid02_16
| LD testcases/kernel/syscalls/setreuid/setreuid06_16
| LD testcases/kernel/syscalls/setreuid/setreuid07_16
| LD testcases/kernel/syscalls/setreuid/setreuid04_16
| LD testcases/kernel/syscalls/setreuid/setreuid05_16
| rm setreuid03_16.o setreuid01.o setreuid06_16.o setreuid03.o setreuid04.o setreuid07.o setreuid06.o setreuid02_16.o setreuid01_16.o setreuid05_16.o setreuid05.o setreuid02.o setreuid04_16.o setreuid07_16.o
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/string.h:535,
|                  from ../../../../include/old/test.h:17,
|                  from setrlimit01.c:38:
| In function 'strcpy',
|     inlined from 'test4' at setrlimit01.c:260:3,
|     inlined from 'main' at setrlimit01.c:77:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/string_fortified.h:79:10: warning: argument 1 null where non-null expected [-Wnonnull]
|    79 |   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/string_fortified.h:79:10: note: in a call to built-in function '__builtin_memcpy'
| CC testcases/kernel/syscalls/setrlimit/setrlimit02
| CC testcases/kernel/syscalls/setrlimit/setrlimit03
| CC testcases/kernel/syscalls/setrlimit/setrlimit05
| CC testcases/kernel/syscalls/setrlimit/setrlimit06
| CC testcases/kernel/syscalls/setrlimit/setrlimit04
| CC testcases/kernel/syscalls/setrlimit/setrlimit01
| CC testcases/kernel/syscalls/set_robust_list/set_robust_list01
| CC testcases/kernel/syscalls/setsid/setsid01
| CC testcases/kernel/syscalls/setsockopt/setsockopt04
| CC testcases/kernel/syscalls/setsockopt/setsockopt01
| CC testcases/kernel/syscalls/setsockopt/setsockopt03
| CC testcases/kernel/syscalls/setsockopt/setsockopt02
| CC testcases/kernel/syscalls/setsockopt/setsockopt08
| CC testcases/kernel/syscalls/setsockopt/setsockopt09
| CC testcases/kernel/syscalls/setsockopt/setsockopt05
| CC testcases/kernel/syscalls/setsockopt/setsockopt07
| CC testcases/kernel/syscalls/setsockopt/setsockopt06
| CC testcases/kernel/syscalls/set_thread_area/set_thread_area01
| CC testcases/kernel/syscalls/set_tid_address/set_tid_address01
| CC testcases/kernel/syscalls/settimeofday/settimeofday02
| CC testcases/kernel/syscalls/settimeofday/settimeofday01
| CC testcases/kernel/syscalls/setuid/setuid01_16.o
| CC testcases/kernel/syscalls/setuid/setuid03_16.o
| CC testcases/kernel/syscalls/setuid/setuid04_16.o
| CC testcases/kernel/syscalls/setuid/setuid01.o
| CC testcases/kernel/syscalls/setuid/setuid03.o
| LD testcases/kernel/syscalls/setuid/setuid01
| CC testcases/kernel/syscalls/setuid/setuid04.o
| LD testcases/kernel/syscalls/setuid/setuid03_16
| LD testcases/kernel/syscalls/setuid/setuid03
| LD testcases/kernel/syscalls/setuid/setuid04
| LD testcases/kernel/syscalls/setuid/setuid04_16
| LD testcases/kernel/syscalls/setuid/setuid01_16
| rm setuid01.o setuid04_16.o setuid04.o setuid03.o setuid01_16.o setuid03_16.o
| CC testcases/kernel/syscalls/setxattr/setxattr02
| CC testcases/kernel/syscalls/setxattr/setxattr01
| CC testcases/kernel/syscalls/setxattr/setxattr03
| CC testcases/kernel/syscalls/sgetmask/sgetmask01
| sigaction02.c:53: warning: "_GNU_SOURCE" redefined
|    53 | #define _GNU_SOURCE
|       |
| <command-line>: note: this is the location of the previous definition
| sigaction01.c: In function 'handler':
| sigaction01.c:89:46: warning: unused parameter 'ucp' [-Wunused-parameter]
|    89 | void handler(int sig, siginfo_t * sip, void *ucp)
|       |                                        ~~~~~~^~~
| CC testcases/kernel/syscalls/sigaction/sigaction02
| CC testcases/kernel/syscalls/sigaction/sigaction01
| sigaltstack01.c: In function 'sig_handler':
| sigaltstack01.c:223:14: warning: storing the address of local variable 'i' in 'addr' [-Wdangling-pointer=]
|   223 |         addr = &i;
|       |         ~~~~~^~~~
| sigaltstack01.c:220:13: note: 'i' declared here
|   220 |         int i;
|       |             ^
| sigaltstack01.c:83:7: note: 'addr' declared here
|    83 | void *addr, *main_stk;          /* address of main stack for signal */
|       |       ^~~~
| CC testcases/kernel/syscalls/sigaltstack/sigaltstack02
| CC testcases/kernel/syscalls/sigaltstack/sigaltstack01
| sighold02.c: In function 'do_child':
| sighold02.c:71:17: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|    71 |                 if (sighold(sig))
|       |                 ^~
| In file included from sighold02.c:20:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| CC testcases/kernel/syscalls/sighold/sighold02
| CC testcases/kernel/syscalls/signalfd4/signalfd4_02
| CC testcases/kernel/syscalls/signalfd4/signalfd4_01
| In file included from signalfd01.c:40:
| signalfd01.c: In function 'do_test2':
| ../../../../include/old/test.h:123:19: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| signalfd01.c:251:17: note: in expansion of macro 'tst_resm'
|   251 |                 tst_resm(TFAIL, "got unexpected signal: signal=%d : %s",
|       |                 ^~~~~~~~
| CC testcases/kernel/syscalls/signalfd/signalfd01
| CC testcases/kernel/syscalls/signal/signal03
| CC testcases/kernel/syscalls/signal/signal05
| CC testcases/kernel/syscalls/signal/signal02
| CC testcases/kernel/syscalls/signal/signal04
| CC testcases/kernel/syscalls/signal/signal06
| CC testcases/kernel/syscalls/signal/signal01
| CC testcases/kernel/syscalls/sigpending/sigpending02
| sigprocmask01.c: In function 'sig_handler':
| sigprocmask01.c:254:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   254 | void sig_handler(int sig)
|       |                  ~~~~^~~
| CC testcases/kernel/syscalls/sigprocmask/sigprocmask01
| sigrelse01.c: In function 'timeout':
| sigrelse01.c:683:25: warning: unused parameter 'sig' [-Wunused-parameter]
|   683 | static void timeout(int sig)
|       |                     ~~~~^~~
| In function 'write_pipe',
|     inlined from 'parent' at sigrelse01.c:286:6:
| sigrelse01.c:639:13: warning: 'write' reading 512 bytes from a region of size 6 [-Wstringop-overread]
|   639 |         if (write(fd, msg, MAXMESG) < 0) {
|       |             ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from sigrelse01.c:109:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h: In function 'parent':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to function 'write' declared with attribute 'access (read_only, 2, 3)'
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| In function 'write_pipe',
|     inlined from 'parent' at sigrelse01.c:286:6:
| sigrelse01.c:639:13: warning: 'write' reading 512 bytes from a region of size 6 [-Wstringop-overread]
|   639 |         if (write(fd, msg, MAXMESG) < 0) {
|       |             ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h: In function 'parent':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to function 'write' declared with attribute 'access (read_only, 2, 3)'
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| CC testcases/kernel/syscalls/sigrelse/sigrelse01
| CC testcases/kernel/syscalls/sigsuspend/sigsuspend01
| BUILD libltpsigwait.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/sigtimedwait/sigtimedwait01
| BUILD libltpsigwait.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01
| BUILD libltpsigwait.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/sigwait/sigwait01
| CC testcases/kernel/syscalls/socketcall/socketcall03
| CC testcases/kernel/syscalls/socketcall/socketcall01
| CC testcases/kernel/syscalls/socketcall/socketcall02
| CC testcases/kernel/syscalls/socket/socket02
| CC testcases/kernel/syscalls/socket/socket01
| CC testcases/kernel/syscalls/socketpair/socketpair02
| CC testcases/kernel/syscalls/socketpair/socketpair01
| CC testcases/kernel/syscalls/sockioctl/sockioctl01
| CC testcases/kernel/syscalls/splice/splice04
| CC testcases/kernel/syscalls/splice/splice03
| CC testcases/kernel/syscalls/splice/splice01
| CC testcases/kernel/syscalls/splice/splice05
| CC testcases/kernel/syscalls/splice/splice02
| CC testcases/kernel/syscalls/ssetmask/ssetmask01
| CC testcases/kernel/syscalls/statfs/statfs01_64.o
| CC testcases/kernel/syscalls/statfs/statfs02_64.o
| CC testcases/kernel/syscalls/statfs/statfs03_64.o
| statfs03.c: In function 'setup':
| statfs03.c:126:28: warning: '%d' directive writing between 1 and 11 bytes into a region of size between 0 and 29 [-Wformat-overflow=]
|   126 |         sprintf(fname, "%s.%d", fname, getpid());
|       |                            ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from statfs03.c:55:
| In function 'sprintf',
|     inlined from 'setup' at statfs03.c:126:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 3 and 42 bytes into a destination of size 30
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: warning: '__builtin___sprintf_chk' argument 5 overlaps destination object 'fname' [-Wrestrict]
| statfs03.c: In function 'setup':
| statfs03.c:67:6: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
|    67 | char fname[30] = "testfile";
|       |      ^~~~~
| statfs03.c:130:35: warning: '%s' directive writing up to 29 bytes into a region of size between 20 and 49 [-Wformat-overflow=]
|   130 |                 sprintf(path, "%s/%s", fname, fname);
|       |                                   ^~          ~~~~~
| In function 'sprintf',
|     inlined from 'setup' at statfs03.c:130:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 2 and 60 bytes into a destination of size 50
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| statfs03.c: In function 'setup':
| statfs03.c:126:28: warning: '%d' directive writing between 1 and 11 bytes into a region of size between 0 and 29 [-Wformat-overflow=]
|   126 |         sprintf(fname, "%s.%d", fname, getpid());
|       |                            ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from statfs03.c:55:
| In function 'sprintf',
|     inlined from 'setup' at statfs03.c:126:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 3 and 42 bytes into a destination of size 30
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: warning: '__builtin___sprintf_chk' argument 5 overlaps destination object 'fname' [-Wrestrict]
| statfs03.c: In function 'setup':
| statfs03.c:67:6: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
|    67 | char fname[30] = "testfile";
|       |      ^~~~~
| statfs03.c:130:35: warning: '%s' directive writing up to 29 bytes into a region of size between 20 and 49 [-Wformat-overflow=]
|   130 |                 sprintf(path, "%s/%s", fname, fname);
|       |                                   ^~          ~~~~~
| In function 'sprintf',
|     inlined from 'setup' at statfs03.c:130:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 2 and 60 bytes into a destination of size 50
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/statfs/statfs01
| LD testcases/kernel/syscalls/statfs/statfs01_64
| CC testcases/kernel/syscalls/statfs/statfs03
| CC testcases/kernel/syscalls/statfs/statfs02
| LD testcases/kernel/syscalls/statfs/statfs03_64
| LD testcases/kernel/syscalls/statfs/statfs02_64
| rm statfs01_64.o statfs02_64.o statfs03_64.o
| CC testcases/kernel/syscalls/stat/stat01_64.o
| CC testcases/kernel/syscalls/stat/stat02_64.o
| CC testcases/kernel/syscalls/stat/stat03_64.o
| CC testcases/kernel/syscalls/stat/stat01
| CC testcases/kernel/syscalls/stat/stat02
| LD testcases/kernel/syscalls/stat/stat03_64
| CC testcases/kernel/syscalls/stat/stat03
| LD testcases/kernel/syscalls/stat/stat01_64
| LD testcases/kernel/syscalls/stat/stat02_64
| rm stat01_64.o stat02_64.o stat03_64.o
| CC testcases/kernel/syscalls/statvfs/statvfs01
| CC testcases/kernel/syscalls/statvfs/statvfs02
| CC testcases/kernel/syscalls/statx/statx03
| CC testcases/kernel/syscalls/statx/statx04
| CC testcases/kernel/syscalls/statx/statx02
| CC testcases/kernel/syscalls/statx/statx05
| CC testcases/kernel/syscalls/statx/statx01
| CC testcases/kernel/syscalls/statx/statx07
| CC testcases/kernel/syscalls/statx/statx08
| CC testcases/kernel/syscalls/statx/statx06
| CC testcases/kernel/syscalls/statx/statx09
| CC testcases/kernel/syscalls/stime/stime01
| CC testcases/kernel/syscalls/stime/stime02
| CC testcases/kernel/syscalls/string/string01
| BUILD libltpswap.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/swapoff/swapoff01
| CC testcases/kernel/syscalls/swapoff/swapoff02
| BUILD libltpswap.a
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/swapon/swapon01
| CC testcases/kernel/syscalls/swapon/swapon02
| CC testcases/kernel/syscalls/swapon/swapon03
| CC testcases/kernel/syscalls/switch/endian_switch01
| CC testcases/kernel/syscalls/symlinkat/symlinkat01
| symlink01.c: In function 'creat_symlink':
| symlink01.c:650:51: warning: unused parameter '_path3' [-Wunused-parameter]
|   650 | int creat_symlink(char *path1, char *path2, char *_path3)
|       |                                             ~~~~~~^~~~~~
| symlink01.c: In function 'creat_object':
| symlink01.c:678:37: warning: unused parameter '_path2' [-Wunused-parameter]
|   678 | int creat_object(char *path1, char *_path2, char *_path3)
|       |                               ~~~~~~^~~~~~
| symlink01.c:678:51: warning: unused parameter '_path3' [-Wunused-parameter]
|   678 | int creat_object(char *path1, char *_path2, char *_path3)
|       |                                             ~~~~~~^~~~~~
| symlink01.c: In function 'ck_object':
| symlink01.c:859:34: warning: unused parameter 'path2' [-Wunused-parameter]
|   859 | int ck_object(char *path1, char *path2, char *path3)
|       |                            ~~~~~~^~~~~
| symlink01.c:859:47: warning: unused parameter 'path3' [-Wunused-parameter]
|   859 | int ck_object(char *path1, char *path2, char *path3)
|       |                                         ~~~~~~^~~~~
| In file included from symlink01.c:219:
| symlink01.c: In function 'do_link':
| ../../../../include/old/test.h:123:19: warning: format '%d' expects argument of type 'int', but argument 8 has type '__nlink_t' {aka 'long unsigned int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| symlink01.c:1563:41: note: in expansion of macro 'tst_resm'
|  1563 |                                         tst_resm(TFAIL,
|       |                                         ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%d' expects argument of type 'int', but argument 10 has type '__nlink_t' {aka 'long unsigned int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| symlink01.c:1563:41: note: in expansion of macro 'tst_resm'
|  1563 |                                         tst_resm(TFAIL,
|       |                                         ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%d' expects argument of type 'int', but argument 12 has type '__nlink_t' {aka 'long unsigned int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| symlink01.c:1563:41: note: in expansion of macro 'tst_resm'
|  1563 |                                         tst_resm(TFAIL,
|       |                                         ^~~~~~~~
| symlink01.c: In function 'do_ENOENT':
| symlink01.c:1095:25: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1095 |                         chdir(tst_get_tmpdir());
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~
| symlink01.c: In function 'do_ELOOP':
| symlink01.c:1177:25: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1177 |                         chdir(tst_get_tmpdir());
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~
| symlink01.c: In function 'do_chdir':
| symlink01.c:1517:25: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1517 |                         chdir(tst_get_tmpdir());
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/symlink/symlink05
| CC testcases/kernel/syscalls/symlink/symlink02
| CC testcases/kernel/syscalls/symlink/symlink04
| CC testcases/kernel/syscalls/symlink/symlink03
| In function 'delete_files',
|     inlined from 'do_ENOENT' at symlink01.c:1107:4:
| symlink01.c:639:9: warning: argument 1 null where non-null expected [-Wnonnull]
|   639 |         unlink(path2);
|       |         ^~~~~~~~~~~~~
| In file included from symlink01.c:217:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h: In function 'do_ENOENT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:858:12: note: in a call to function 'unlink' declared 'nonnull'
|   858 | extern int unlink (const char *__name) __THROW __nonnull ((1));
|       |            ^~~~~~
| In function 'delete_files',
|     inlined from 'do_EXDEV' at symlink01.c:1290:4,
|     inlined from 'do_EXDEV' at symlink01.c:1269:6:
| symlink01.c:639:9: warning: argument 1 null where non-null expected [-Wnonnull]
|   639 |         unlink(path2);
|       |         ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h: In function 'do_EXDEV':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:858:12: note: in a call to function 'unlink' declared 'nonnull'
|   858 | extern int unlink (const char *__name) __THROW __nonnull ((1));
|       |            ^~~~~~
| In function 'delete_files',
|     inlined from 'do_link' at symlink01.c:1576:3,
|     inlined from 'do_link' at symlink01.c:1530:6:
| symlink01.c:639:9: warning: argument 1 null where non-null expected [-Wnonnull]
|   639 |         unlink(path2);
|       |         ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h: In function 'do_link':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:858:12: note: in a call to function 'unlink' declared 'nonnull'
|   858 | extern int unlink (const char *__name) __THROW __nonnull ((1));
|       |            ^~~~~~
| CC testcases/kernel/syscalls/symlink/symlink01
| CC testcases/kernel/syscalls/sync_file_range/sync_file_range02
| CC testcases/kernel/syscalls/sync_file_range/sync_file_range01
| CC testcases/kernel/syscalls/syncfs/syncfs01
| CC testcases/kernel/syscalls/sync/sync01
| CC testcases/kernel/syscalls/syscall/syscall01
| CC testcases/kernel/syscalls/sysconf/sysconf01
| CC testcases/kernel/syscalls/sysctl/sysctl01
| CC testcases/kernel/syscalls/sysctl/sysctl03
| CC testcases/kernel/syscalls/sysctl/sysctl04
| CC testcases/kernel/syscalls/sysfs/sysfs01
| CC testcases/kernel/syscalls/sysfs/sysfs02
| CC testcases/kernel/syscalls/sysfs/sysfs03
| CC testcases/kernel/syscalls/sysfs/sysfs04
| CC testcases/kernel/syscalls/sysfs/sysfs05
| CC testcases/kernel/syscalls/sysinfo/sysinfo02
| CC testcases/kernel/syscalls/sysinfo/sysinfo03
| CC testcases/kernel/syscalls/sysinfo/sysinfo01
| CC testcases/kernel/syscalls/syslog/syslog11
| CC testcases/kernel/syscalls/syslog/syslog12
| CC testcases/kernel/syscalls/tee/tee01
| CC testcases/kernel/syscalls/tee/tee02
| CC testcases/kernel/syscalls/tgkill/tgkill01
| CC testcases/kernel/syscalls/tgkill/tgkill03
| CC testcases/kernel/syscalls/tgkill/tgkill02
| CC testcases/kernel/syscalls/time/time01
| CC testcases/kernel/syscalls/timer_create/timer_create03
| CC testcases/kernel/syscalls/timer_create/timer_create02
| CC testcases/kernel/syscalls/timer_create/timer_create01
| CC testcases/kernel/syscalls/timer_delete/timer_delete01
| CC testcases/kernel/syscalls/timer_delete/timer_delete02
| CC testcases/kernel/syscalls/timerfd/timerfd02
| CC testcases/kernel/syscalls/timerfd/timerfd_create01
| CC testcases/kernel/syscalls/timerfd/timerfd03
| CC testcases/kernel/syscalls/timerfd/timerfd_settime01
| CC testcases/kernel/syscalls/timerfd/timerfd_gettime01
| CC testcases/kernel/syscalls/timerfd/timerfd01
| CC testcases/kernel/syscalls/timerfd/timerfd04
| CC testcases/kernel/syscalls/timerfd/timerfd_settime02
| CC testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01
| CC testcases/kernel/syscalls/timer_gettime/timer_gettime01
| CC testcases/kernel/syscalls/timer_settime/timer_settime03
| CC testcases/kernel/syscalls/timer_settime/timer_settime02
| CC testcases/kernel/syscalls/timer_settime/timer_settime01
| CC testcases/kernel/syscalls/times/times01
| CC testcases/kernel/syscalls/times/times03
| CC testcases/kernel/syscalls/tkill/tkill02
| CC testcases/kernel/syscalls/tkill/tkill01
| CC testcases/kernel/syscalls/truncate/truncate02_64.o
| CC testcases/kernel/syscalls/truncate/truncate03_64.o
| CC testcases/kernel/syscalls/truncate/truncate03
| CC testcases/kernel/syscalls/truncate/truncate02
| LD testcases/kernel/syscalls/truncate/truncate02_64
| LD testcases/kernel/syscalls/truncate/truncate03_64
| rm truncate02_64.o truncate03_64.o
| CC testcases/kernel/syscalls/ulimit/ulimit01
| CC testcases/kernel/syscalls/umask/umask01
| CC testcases/kernel/syscalls/umount2/umount2_01
| CC testcases/kernel/syscalls/umount2/umount2_02
| CC testcases/kernel/syscalls/umount/umount03
| CC testcases/kernel/syscalls/umount/umount01
| CC testcases/kernel/syscalls/umount/umount02
| CC testcases/kernel/syscalls/uname/uname01
| CC testcases/kernel/syscalls/uname/uname04
| CC testcases/kernel/syscalls/uname/uname02
| CC testcases/kernel/syscalls/unlinkat/unlinkat01
| CC testcases/kernel/syscalls/unlink/unlink07
| CC testcases/kernel/syscalls/unlink/unlink05
| CC testcases/kernel/syscalls/unlink/unlink08
| CC testcases/kernel/syscalls/unshare/unshare02
| CC testcases/kernel/syscalls/unshare/unshare01
| CC testcases/kernel/syscalls/userfaultfd/userfaultfd01
| CC testcases/kernel/syscalls/ustat/ustat01
| CC testcases/kernel/syscalls/ustat/ustat02
| CC testcases/kernel/syscalls/utime/utime01
| CC testcases/kernel/syscalls/utime/utime05
| CC testcases/kernel/syscalls/utime/utime02
| CC testcases/kernel/syscalls/utime/utime06
| CC testcases/kernel/syscalls/utime/utime04
| CC testcases/kernel/syscalls/utime/utime03
| CC testcases/kernel/syscalls/utimensat/utimensat01
| CC testcases/kernel/syscalls/utimes/utimes01
| vfork02.c: In function 'setup':
| vfork02.c:183:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   183 |         if (sighold(SIGUSR1) == -1) {
|       |         ^~
| In file included from vfork02.c:76:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| vfork02.c: In function 'cleanup':
| vfork02.c:225:9: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   225 |         if (sigrelse(SIGUSR1) == -1) {
|       |         ^~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| CC testcases/kernel/syscalls/vfork/vfork02
| CC testcases/kernel/syscalls/vfork/vfork01
| CC testcases/kernel/syscalls/vhangup/vhangup02
| CC testcases/kernel/syscalls/vhangup/vhangup01
| CC testcases/kernel/syscalls/vmsplice/vmsplice01
| CC testcases/kernel/syscalls/vmsplice/vmsplice02
| CC testcases/kernel/syscalls/vmsplice/vmsplice03
| CC testcases/kernel/syscalls/vmsplice/vmsplice04
| CC testcases/kernel/syscalls/wait4/wait401
| CC testcases/kernel/syscalls/wait4/wait403
| CC testcases/kernel/syscalls/wait4/wait402
| CC testcases/kernel/syscalls/waitid/waitid02
| CC testcases/kernel/syscalls/waitid/waitid05
| CC testcases/kernel/syscalls/waitid/waitid01
| CC testcases/kernel/syscalls/waitid/waitid04
| CC testcases/kernel/syscalls/waitid/waitid07
| CC testcases/kernel/syscalls/waitid/waitid08
| CC testcases/kernel/syscalls/waitid/waitid03
| CC testcases/kernel/syscalls/waitid/waitid11
| CC testcases/kernel/syscalls/waitid/waitid06
| CC testcases/kernel/syscalls/waitid/waitid09
| CC testcases/kernel/syscalls/waitid/waitid10
| CC testcases/kernel/syscalls/wait/wait01
| CC testcases/kernel/syscalls/wait/wait02
| waitpid05.c: In function 'main':
| waitpid05.c:79:13: warning: variable 'exno' set but not used [-Wunused-but-set-variable]
|    79 |         int exno, nexno, status;
|       |             ^~~~
| CC testcases/kernel/syscalls/waitpid/waitpid01
| CC testcases/kernel/syscalls/waitpid/waitpid02
| CC testcases/kernel/syscalls/waitpid/waitpid03
| CC testcases/kernel/syscalls/waitpid/waitpid04
| CC testcases/kernel/syscalls/waitpid/waitpid05
| CC testcases/kernel/syscalls/waitpid/waitpid07
| CC testcases/kernel/syscalls/waitpid/waitpid10
| CC testcases/kernel/syscalls/waitpid/waitpid08
| CC testcases/kernel/syscalls/waitpid/waitpid13
| CC testcases/kernel/syscalls/waitpid/waitpid06
| CC testcases/kernel/syscalls/waitpid/waitpid12
| CC testcases/kernel/syscalls/waitpid/waitpid09
| CC testcases/kernel/syscalls/waitpid/waitpid11
| write04.c: In function 'verify_write':
| write04.c:33:14: warning: '<unknown>' is used uninitialized [-Wuninitialized]
|    33 |         TEST(write(wfd, wbuf, sizeof(wbuf)));
|       |              ^~~~~
| In file included from ../../../../include/tst_test.h:14,
|                  from write04.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to 'write' declared with attribute 'access (read_only, 2, 3)' here
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| CC testcases/kernel/syscalls/write/write02
| write04.c: In function 'setup':
| write04.c:55:27: warning: '%d' directive writing between 1 and 11 bytes into a region of size between 0 and 99 [-Wformat-overflow=]
|    55 |         sprintf(fifo, "%s.%d", fifo, getpid());
|       |                           ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from write04.c:22:
| In function 'sprintf',
|     inlined from 'setup' at write04.c:55:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 3 and 112 bytes into a destination of size 100
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: warning: '__builtin___sprintf_chk' argument 5 overlaps destination object 'fifo' [-Wrestrict]
| write04.c: In function 'setup':
| write04.c:25:13: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
|    25 | static char fifo[100];
|       |             ^~~~
| CC testcases/kernel/syscalls/write/write01
| CC testcases/kernel/syscalls/write/write05
| CC testcases/kernel/syscalls/write/write04
| CC testcases/kernel/syscalls/write/write03
| CC testcases/kernel/syscalls/write/write06
| CC testcases/kernel/syscalls/writev/writev01
| CC testcases/kernel/syscalls/writev/writev06
| CC testcases/kernel/syscalls/writev/writev02
| CC testcases/kernel/syscalls/writev/writev05
| CC testcases/kernel/syscalls/writev/writev07
| CC testcases/kernel/syscalls/writev/writev03
| make[3]: Nothing to be done for 'all'.
| CC testcases/kernel/connectors/pec/event_generator
| CC testcases/kernel/connectors/pec/pec_listener
| CC testcases/kernel/containers/mountns/mountns01
| CC testcases/kernel/containers/mountns/mountns02
| CC testcases/kernel/containers/mountns/mountns03
| CC testcases/kernel/containers/mountns/mountns04
| make -C ../libclone -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/containers/mqns/../libclone/Makefile" all
| ../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| CC testcases/kernel/containers/libclone/libclone.o
| AR libclone.a
| RANLIB libclone.a
| mqns_02.c: In function 'main':
| mqns_02.c:176:17: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   176 |                 read(p2[0], buf, 7);
|       |                 ^~~~~~~~~~~~~~~~~~~
| mqns_04.c: In function 'check_mqueue':
| mqns_04.c:65:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|    65 |         read(p1[0], buf, 3);    /* go */
|       |         ^~~~~~~~~~~~~~~~~~~
| mqns_04.c:70:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    70 |                 write(p2[1], "mqfail", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| mqns_04.c:79:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    79 |                 write(p2[1], "mount", 6);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| mqns_04.c:83:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    83 |         write(p2[1], "go", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~
| mqns_04.c:84:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|    84 |         read(p1[0], buf, 3);
|       |         ^~~~~~~~~~~~~~~~~~~
| mqns_04.c: In function 'main':
| mqns_04.c:135:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   135 |         write(p1[1], "go", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~
| mqns_04.c:137:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   137 |         read(p2[0], buf, 7);
|       |         ^~~~~~~~~~~~~~~~~~~
| mqns_04.c:149:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   149 |                 write(p1[1], "go", 3);
|       |                 ^~~~~~~~~~~~~~~~~~~~~
| mqns_04.c:153:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   153 |         write(p1[1], "go", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~
| mqns_03.c: In function 'check_mqueue':
| mqns_03.c:77:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    77 |                 write(p2[1], "mqfail", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:85:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    85 |                 write(p2[1], "mount1", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:91:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    91 |                 write(p2[1], "stat1", 6);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:97:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    97 |                 write(p2[1], "creat", 6);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:105:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   105 |                 write(p2[1], "umount", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:111:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   111 |                 write(p2[1], "mount2", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:117:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   117 |                 write(p2[1], "stat2", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:123:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   123 |                 write(p2[1], "stat3", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:127:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   127 |         write(p2[1], "done", 5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~
| mqns_03.c: In function 'main':
| mqns_03.c:168:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   168 |         write(p1[1], "go", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~
| mqns_03.c:170:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   170 |         read(p2[0], buf, 7);
|       |         ^~~~~~~~~~~~~~~~~~~
| mqns_03.c: In function 'check_mqueue':
| mqns_03.c:117:17: warning: 'write' reading 7 bytes from a region of size 6 [-Wstringop-overread]
|   117 |                 write(p2[1], "stat2", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/sigstksz.h:24,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:328,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/wait.h:36,
|                  from mqns_03.c:38:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to function 'write' declared with attribute 'access (read_only, 2, 3)'
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| mqns_03.c:123:17: warning: 'write' reading 7 bytes from a region of size 6 [-Wstringop-overread]
|   123 |                 write(p2[1], "stat3", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to function 'write' declared with attribute 'access (read_only, 2, 3)'
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| mqns_03.c:117:17: warning: 'write' reading 7 bytes from a region of size 6 [-Wstringop-overread]
|   117 |                 write(p2[1], "stat2", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to function 'write' declared with attribute 'access (read_only, 2, 3)'
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| mqns_03.c:123:17: warning: 'write' reading 7 bytes from a region of size 6 [-Wstringop-overread]
|   123 |                 write(p2[1], "stat3", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to function 'write' declared with attribute 'access (read_only, 2, 3)'
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| mqns_03.c:117:17: warning: 'write' reading 7 bytes from a region of size 6 [-Wstringop-overread]
|   117 |                 write(p2[1], "stat2", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to function 'write' declared with attribute 'access (read_only, 2, 3)'
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| mqns_03.c:123:17: warning: 'write' reading 7 bytes from a region of size 6 [-Wstringop-overread]
|   123 |                 write(p2[1], "stat3", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/unistd.h:378:16: note: in a call to function 'write' declared with attribute 'access (read_only, 2, 3)'
|   378 | extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur
|       |                ^~~~~
| CC testcases/kernel/containers/mqns/mqns_01
| CC testcases/kernel/containers/mqns/mqns_04
| CC testcases/kernel/containers/mqns/mqns_03
| CC testcases/kernel/containers/mqns/mqns_02
| CC testcases/kernel/containers/netns/netns_netlink
| pidns02.c: In function 'child_fn1':
| pidns04.c: In function 'child_fn1':
| pidns04.c:74:28: warning: unused parameter 'ttype' [-Wunused-parameter]
|    74 | static int child_fn1(void *ttype)
|       |                      ~~~~~~^~~~~
| pidns02.c:65:21: warning: unused parameter 'vtest' [-Wunused-parameter]
|    65 | int child_fn1(void *vtest)
|       |               ~~~~~~^~~~~
| pidns04.c: In function 'main':
| pidns04.c:115:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|   115 |         pipe(fd);
|       |         ^~~~~~~~
| pidns04.c: In function 'child_fn1':
| pidns04.c:92:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    92 |                 write(fd[1], mesg, (strlen(mesg) + 1));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| pidns12.c: In function 'child_signal_handler':
| pidns12.c:58:38: warning: unused parameter 'sig' [-Wunused-parameter]
|    58 | static void child_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                  ~~~~^~~
| pidns12.c:58:65: warning: unused parameter 'unused' [-Wunused-parameter]
|    58 | static void child_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                                           ~~~~~~^~~~~~
| pidns12.c: In function 'child_fn':
| pidns12.c:72:20: warning: unused parameter 'arg' [-Wunused-parameter]
|    72 | int child_fn(void *arg)
|       |              ~~~~~~^~~
| pidns12.c: In function 'main':
| pidns12.c:145:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   145 |         read(pipefd[0], buf, 5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~
| pidns03.c: In function 'child_func':
| pidns03.c:56:22: warning: unused parameter 'arg' [-Wunused-parameter]
|    56 | int child_func(void *arg)
|       |                ~~~~~~^~~
| pidns05.c: In function 'kill_nested_containers':
| pidns05.c:153:6: warning: old-style function definition [-Wold-style-definition]
|   153 | void kill_nested_containers()
|       |      ^~~~~~~~~~~~~~~~~~~~~~
| pidns05.c: In function 'main':
| pidns05.c:199:20: warning: variable 'pgid' set but not used [-Wunused-but-set-variable]
|   199 |         pid_t pid, pgid;
|       |                    ^~~~
| pidns05.c:197:13: warning: unused variable 'ret' [-Wunused-variable]
|   197 |         int ret, nbytes, status;
|       |             ^~~
| pidns05.c: In function 'max_pid':
| pidns05.c:70:17: warning: ignoring return value of 'fscanf' declared with attribute 'warn_unused_result' [-Wunused-result]
|    70 |                 fscanf(fp, "%d", &ret);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~
| pidns05.c: In function 'create_nested_container':
| pidns05.c:143:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   143 |                 write(fd[1], mesg, (strlen(mesg) + 1));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| pidns20.c: In function 'child_signal_handler':
| pidns20.c:66:38: warning: unused parameter 'sig' [-Wunused-parameter]
|    66 | static void child_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                  ~~~~^~~
| pidns20.c:66:65: warning: unused parameter 'unused' [-Wunused-parameter]
|    66 | static void child_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                                           ~~~~~~^~~~~~
| pidns20.c: In function 'child_fn':
| pidns20.c:81:20: warning: unused parameter 'arg' [-Wunused-parameter]
|    81 | int child_fn(void *arg)
|       |              ~~~~~~^~~
| pidns20.c:117:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   117 |         read(parent_cinit[0], buf, 5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| pidns20.c: In function 'main':
| pidns20.c:177:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   177 |         read(cinit_parent[0], buf, 5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| pidns16.c: In function 'child_signal_handler':
| pidns16.c:58:31: warning: unused parameter 'sig' [-Wunused-parameter]
|    58 | void child_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                           ~~~~^~~
| pidns16.c:58:58: warning: unused parameter 'unused' [-Wunused-parameter]
|    58 | void child_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                                    ~~~~~~^~~~~~
| pidns16.c: In function 'child_fn':
| pidns16.c:90:20: warning: unused parameter 'ttype' [-Wunused-parameter]
|    90 | int child_fn(void *ttype)
|       |              ~~~~~~^~~~~
| pidns16.c: In function 'main':
| pidns16.c:129:5: warning: old-style function definition [-Wold-style-definition]
|   129 | int main()
|       |     ^~~~
| pidns10.c: In function 'child_fn':
| pidns10.c:58:20: warning: unused parameter 'arg' [-Wunused-parameter]
|    58 | int child_fn(void *arg)
|       |              ~~~~~~^~~
| pidns10.c: In function 'main':
| pidns10.c:92:15: warning: variable 'pid' set but not used [-Wunused-but-set-variable]
|    92 |         pid_t pid;
|       |               ^~~
| CC testcases/kernel/containers/pidns/pidns01
| pidns17.c: In function 'child_fn':
| pidns17.c:75:23: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
|    75 |         for (i = 0; i < ARRAY_SIZE(children); i++) {
|       |                       ^
| pidns17.c:99:23: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
|    99 |         for (i = 0; i < ARRAY_SIZE(children); i++) {
|       |                       ^
| CC testcases/kernel/containers/pidns/pidns04
| pidns17.c:59:20: warning: unused parameter 'arg' [-Wunused-parameter]
|    59 | int child_fn(void *arg)
|       |              ~~~~~~^~~
| pidns17.c: In function 'main':
| pidns17.c:137:15: warning: variable 'pid' set but not used [-Wunused-but-set-variable]
|   137 |         pid_t pid;
|       |               ^~~
| CC testcases/kernel/containers/pidns/pidns06
| CC testcases/kernel/containers/pidns/pidns02
| CC testcases/kernel/containers/pidns/pidns12
| pidns30.c: In function 'child_signal_handler':
| pidns30.c:123:38: warning: unused parameter 'sig' [-Wunused-parameter]
|   123 | static void child_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                  ~~~~^~~
| pidns30.c:123:65: warning: unused parameter 'unused' [-Wunused-parameter]
|   123 | static void child_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                                           ~~~~~~^~~~~~
| pidns30.c: In function 'child_fn':
| pidns30.c:162:20: warning: unused parameter 'arg' [-Wunused-parameter]
|   162 | int child_fn(void *arg)
|       |              ~~~~~~^~~
| pidns30.c:221:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   221 |         read(father_to_child[0], buf, 5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| pidns30.c: In function 'main':
| pidns30.c:274:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   274 |         read(child_to_father[0], buf, 5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| pidns31.c: In function 'cleanup_mqueue':
| pidns31.c:138:25: warning: unused parameter 'result' [-Wunused-parameter]
|   138 | void cleanup_mqueue(int result, int step, mqd_t mqd)
|       |                     ~~~~^~~~~~
| pidns31.c: In function 'child_fn':
| pidns31.c:149:20: warning: unused parameter 'arg' [-Wunused-parameter]
|   149 | int child_fn(void *arg)
|       |              ~~~~~~^~~
| pidns31.c: In function 'father_signal_handler':
| pidns31.c:198:39: warning: unused parameter 'sig' [-Wunused-parameter]
|   198 | static void father_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                   ~~~~^~~
| pidns31.c:198:66: warning: unused parameter 'unused' [-Wunused-parameter]
|   198 | static void father_signal_handler(int sig, siginfo_t * si, void *unused)
|       |                                                            ~~~~~~^~~~~~
| pidns31.c: In function 'child_fn':
| pidns31.c:168:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   168 |         read(father_to_child[0], buf, 5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/containers/pidns/pidns13
| CC testcases/kernel/containers/pidns/pidns20
| CC testcases/kernel/containers/pidns/pidns32
| CC testcases/kernel/containers/pidns/pidns10
| CC testcases/kernel/containers/pidns/pidns16
| CC testcases/kernel/containers/pidns/pidns03
| CC testcases/kernel/containers/pidns/pidns05
| CC testcases/kernel/containers/pidns/pidns17
| CC testcases/kernel/containers/pidns/pidns31
| CC testcases/kernel/containers/pidns/pidns30
| CC testcases/kernel/containers/share/ns_ifmove
| CC testcases/kernel/containers/share/setns_check
| CC testcases/kernel/containers/share/ns_create
| CC testcases/kernel/containers/share/ns_exec
| sem_comm.c: In function 'chld1_sem':
| sem_comm.c:56:21: warning: unused parameter 'arg' [-Wunused-parameter]
|    56 | int chld1_sem(void *arg)
|       |               ~~~~~~^~~
| sem_comm.c: In function 'chld2_sem':
| sem_comm.c:97:21: warning: unused parameter 'arg' [-Wunused-parameter]
|    97 | int chld2_sem(void *arg)
|       |               ~~~~~~^~~
| semtest_2ns.c: In function 'check_sem1':
| semtest_2ns.c:113:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   113 |         write(p1[1], "go", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~
| semtest_2ns.c: In function 'check_sem2':
| semtest_2ns.c:131:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   131 |         read(p1[0], buf, 3);
|       |         ^~~~~~~~~~~~~~~~~~~
| semtest_2ns.c:136:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   136 |                 write(p2[1], "exists", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| semtest_2ns.c:150:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   150 |                 write(p2[1], "notfnd", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| semtest_2ns.c: In function 'main':
| semtest_2ns.c:208:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   208 |         read(p2[0], buf, 7);
|       |         ^~~~~~~~~~~~~~~~~~~
| shm_comm.c: In function 'chld1_shm':
| shm_comm.c:59:21: warning: unused parameter 'arg' [-Wunused-parameter]
|    59 | int chld1_shm(void *arg)
|       |               ~~~~~~^~~
| shm_comm.c: In function 'chld2_shm':
| shm_comm.c:92:21: warning: unused parameter 'arg' [-Wunused-parameter]
|    92 | int chld2_shm(void *arg)
|       |               ~~~~~~^~~
| mesgq_nstest.c: In function 'check_mesgq':
| mesgq_nstest.c:75:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|    75 |         read(p1[0], buf, 3);
|       |         ^~~~~~~~~~~~~~~~~~~
| mesgq_nstest.c:78:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    78 |                 write(p2[1], "notfnd", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| mesgq_nstest.c:80:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    80 |                 write(p2[1], "exists", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| mesgq_nstest.c: In function 'main':
| mesgq_nstest.c:150:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   150 |         write(p1[1], "go", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~
| mesgq_nstest.c:152:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   152 |         read(p2[0], buf, 7);
|       |         ^~~~~~~~~~~~~~~~~~~
| sem_nstest.c: In function 'check_semaphore':
| sem_nstest.c:57:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|    57 |         read(p1[0], buf, 3);
|       |         ^~~~~~~~~~~~~~~~~~~
| sem_nstest.c:60:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    60 |                 write(p2[1], "notfnd", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| sem_nstest.c:62:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    62 |                 write(p2[1], "exists", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| sem_nstest.c: In function 'main':
| sem_nstest.c:133:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   133 |         write(p1[1], "go", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~
| sem_nstest.c:134:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   134 |         read(p2[0], buf, 7);
|       |         ^~~~~~~~~~~~~~~~~~~
| shmem_2nstest.c: In function 'check_shmem1':
| shmem_2nstest.c:78:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    78 |         write(p1[1], "done", 5);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~
| shmem_2nstest.c: In function 'check_shmem2':
| shmem_2nstest.c:95:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|    95 |         read(p1[0], buf, 3);
|       |         ^~~~~~~~~~~~~~~~~~~
| shmem_2nstest.c:106:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   106 |                 write(p2[1], "notfnd", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| shmem_2nstest.c:108:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   108 |                 write(p2[1], "exists", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| shmem_2nstest.c: In function 'main':
| shmem_2nstest.c:161:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   161 |         read(p2[0], buf, 7);
|       |         ^~~~~~~~~~~~~~~~~~~
| msg_comm.c: In function 'chld1_msg':
| msg_comm.c:63:21: warning: unused parameter 'arg' [-Wunused-parameter]
|    63 | int chld1_msg(void *arg)
|       |               ~~~~~~^~~
| msg_comm.c: In function 'chld2_msg':
| msg_comm.c:106:21: warning: unused parameter 'arg' [-Wunused-parameter]
|   106 | int chld2_msg(void *arg)
|       |               ~~~~~~^~~
| shmnstest.c: In function 'check_shmid':
| shmnstest.c:54:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|    54 |         read(p1[0], buf, 3);
|       |         ^~~~~~~~~~~~~~~~~~~
| shmnstest.c:57:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    57 |                 write(p2[1], "notfnd", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| shmnstest.c:59:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    59 |                 write(p2[1], "exists", 7);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
| shmnstest.c: In function 'main':
| shmnstest.c:123:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   123 |         write(p1[1], "go", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~
| shmnstest.c:124:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   124 |         read(p2[0], buf, 7);
|       |         ^~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/containers/sysvipc/sem_comm
| CC testcases/kernel/containers/sysvipc/shm_comm
| CC testcases/kernel/containers/sysvipc/semtest_2ns
| CC testcases/kernel/containers/sysvipc/shmem_2nstest
| CC testcases/kernel/containers/sysvipc/mesgq_nstest
| CC testcases/kernel/containers/sysvipc/sem_nstest
| CC testcases/kernel/containers/sysvipc/shmnstest
| CC testcases/kernel/containers/sysvipc/msg_comm
| CC testcases/kernel/containers/timens/timens01
| CC testcases/kernel/containers/userns/userns02
| CC testcases/kernel/containers/userns/userns06
| CC testcases/kernel/containers/userns/userns05
| CC testcases/kernel/containers/userns/userns03
| CC testcases/kernel/containers/userns/userns06_capcheck
| CC testcases/kernel/containers/userns/userns01
| CC testcases/kernel/containers/userns/userns07
| CC testcases/kernel/containers/userns/userns04
| CC testcases/kernel/containers/userns/userns08
| utstest.c: In function 'P1':
| utstest.c:120:13: warning: variable 'len' set but not used [-Wunused-but-set-variable]
|   120 |         int len;
|       |             ^~~
| utstest.c: In function 'main':
| utstest.c:289:13: warning: variable 'r' set but not used [-Wunused-but-set-variable]
|   289 |         int r, pid, use_clone = T_UNSHARE;
|       |             ^
| utstest.c: In function 'P1':
| utstest.c:144:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   144 |                 write(p2fd[1], "1", 1);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~
| utstest.c:163:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   163 |                 write(p2fd[1], "1", 1);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~
| utstest.c:189:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   189 |                 write(p2fd[1], "1", 1); /* tell p2 to go ahead and sethostname */
|       |                 ^~~~~~~~~~~~~~~~~~~~~~
| utstest.c:208:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   208 |                 write(p2fd[1], "1", 1); /* tell p2 to go ahead and sethostname */
|       |                 ^~~~~~~~~~~~~~~~~~~~~~
| utstest.c: In function 'P2':
| utstest.c:240:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   240 |                 write(p1fd[1], hostname, strlen(hostname));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utstest.c:249:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   249 |                 write(p1fd[1], hostname, strlen(hostname));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utstest.c:263:17: warning: ignoring return value of 'sethostname' declared with attribute 'warn_unused_result' [-Wunused-result]
|   263 |                 sethostname(newhostname, strlen(newhostname));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utstest.c:264:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   264 |                 write(p1fd[1], newhostname, strlen(newhostname));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utstest.c: In function 'main':
| utstest.c:342:25: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   342 |                         write(p2fd[1], "0", 1); /* don't let p2 hang */
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| utstest.c: In function 'cleanup':
| utstest.c:282:9: warning: ignoring return value of 'sethostname' declared with attribute 'warn_unused_result' [-Wunused-result]
|   282 |         sethostname(oldhost, strlen(oldhost));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/containers/utsname/utstest
| make -C ../libcontrollers -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/cgroup_fj/../libcontrollers/Makefile" all
| ../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| libcontrollers.c: In function 'signal_handler_alarm':
| libcontrollers.c:221:31: warning: unused parameter 'signal' [-Wunused-parameter]
|   221 | void signal_handler_alarm(int signal)
|       |                           ~~~~^~~~~~
| libcontrollers.c: In function 'read_shares_file':
| libcontrollers.c:192:9: warning: ignoring return value of 'fscanf' declared with attribute 'warn_unused_result' [-Wunused-result]
|   192 |         fscanf(fp, "%u", &shares);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/controllers/libcontrollers/libcontrollers.o
| AR libcontrollers.a
| RANLIB libcontrollers.a
| CC testcases/kernel/controllers/cgroup_fj/cgroup_fj_proc
| make -C ../libcontrollers -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/cgroup/../libcontrollers/Makefile" all
| ../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/controllers/cgroup/cgroup_regression_fork_processes
| CC testcases/kernel/controllers/cgroup/cgroup_regression_6_2
| cgroup_regression_getdelays.c: In function 'main':
| cgroup_regression_getdelays.c:314:25: warning: '__builtin_strncpy' specified bound 292 equals destination size [-Wstringop-truncation]
|   314 |                         strncpy(cpumask, optarg, sizeof(cpumask));
|       |                         ^
| cgroup_regression_getdelays.c:300:25: warning: '__builtin___strncpy_chk' specified bound depends on the length of the source argument [-Wstringop-truncation]
|   300 |                         strncpy(containerpath, optarg, strlen(optarg) + 1);
|       |                         ^
| cgroup_regression_getdelays.c:300:56: note: length computed here
|   300 |                         strncpy(containerpath, optarg, strlen(optarg) + 1);
|       |                                                        ^~~~~~~~~~~~~~
| CC testcases/kernel/controllers/cgroup/cgroup_regression_getdelays
| CC testcases/kernel/controllers/cgroup_xattr/cgroup_xattr
| make -C ../libcontrollers -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/cpuacct/../libcontrollers/Makefile" all
| ../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| make[5]: Nothing to be done for 'all'.
| cpuacct_task.c: In function 'sig_handler':
| cpuacct_task.c:32:29: warning: unused parameter 'signo' [-Wunused-parameter]
|    32 | static void sig_handler(int signo)
|       |                         ~~~~^~~~~
| CC testcases/kernel/controllers/cpuacct/cpuacct_task
| make -C ../libcontrollers -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/cpuctl_fj/../libcontrollers/Makefile" all
| make[5]: Nothing to be done for 'all'.
| ../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| CC testcases/kernel/controllers/cpuctl_fj/cpuctl_fj_simple_echo
| CC testcases/kernel/controllers/cpuctl_fj/cpuctl_fj_cpu-hog
| make -C ../libcontrollers -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/cpuctl/../libcontrollers/Makefile" all
| make[5]: Nothing to be done for 'all'.
| ../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| cpuctl_latency_test.c: In function 'sighandler':
| cpuctl_latency_test.c:57:21: warning: unused parameter 'i' [-Wunused-parameter]
|    57 | void sighandler(int i)
|       |                 ~~~~^
| In file included from cpuctl_latency_test.c:52:
| ../libcontrollers/libcontrollers.h: At top level:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_latency_check_task.c: In function 'main':
| In file included from cpuctl_def_task01.c:58:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_def_task01.c: In function 'main':
| cpuctl_def_task01.c:141:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   141 |         read(fd, &ch, 1);       /* To fire all the tasks up at the same time */
|       |         ^~~~~~~~~~~~~~~~
| cpuctl_latency_test.c: In function 'main':
| cpuctl_latency_test.c:89:17: warning: '__builtin_strncpy' specified bound 4096 equals destination size [-Wstringop-truncation]
|    89 |                 strncpy(mytaskfile, argv[2], FILENAME_MAX);
|       |                 ^
| cpuctl_latency_check_task.c:131:27: warning: comparison of integer expressions of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
|   131 |                 if (delta > ALLOWED)
|       |                           ^
| In file included from cpuctl_latency_check_task.c:51:
| ../libcontrollers/libcontrollers.h: At top level:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_latency_check_task.c: In function 'main':
| cpuctl_latency_check_task.c:97:17: warning: '__builtin_strncpy' specified bound 4096 equals destination size [-Wstringop-truncation]
|    97 |                 strncpy(mytaskfile, argv[4], FILENAME_MAX);
|       |                 ^
| In file included from cpuctl_def_task02.c:61:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_def_task02.c: In function 'main':
| cpuctl_def_task02.c:152:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   152 |         read(fd, &ch, 1);       /* Block task here to synchronize */
|       |         ^~~~~~~~~~~~~~~~
| In file included from cpuctl_test01.c:63:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_test01.c: In function 'main':
| cpuctl_test01.c:144:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   144 |         read(fd, &ch, 1);       /* To block all tasks here and fire them up at the same time */
|       |         ^~~~~~~~~~~~~~~~
| cpuctl_def_task01.c:152:14: warning: '__builtin_strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
|   152 |         if (!strncpy(fullpath, path, len))
|       |              ^
| cpuctl_def_task01.c:151:15: note: length computed here
|   151 |         len = strlen(path);
|       |               ^~~~~~~~~~~~
| In file included from cpuctl_def_task03.c:62:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_def_task03.c: In function 'main':
| cpuctl_def_task03.c:148:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   148 |         read(fd, &ch, 1);       /* Block task here to synchronize */
|       |         ^~~~~~~~~~~~~~~~
| cpuctl_def_task02.c:163:14: warning: '__builtin_strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
|   163 |         if (!strncpy(fullpath, path, len))
|       |              ^
| cpuctl_def_task02.c:162:15: note: length computed here
|   162 |         len = strlen(path);
|       |               ^~~~~~~~~~~~
| cpuctl_test01.c:155:14: warning: '__builtin_strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
|   155 |         if (!strncpy(fullpath, path, len))
|       |              ^
| cpuctl_test01.c:154:15: note: length computed here
|   154 |         len = strlen(path);
|       |               ^~~~~~~~~~~~
| cpuctl_def_task03.c:159:14: warning: '__builtin_strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
|   159 |         if (!strncpy(fullpath, path, len))
|       |              ^
| cpuctl_def_task03.c:158:15: note: length computed here
|   158 |         len = strlen(path);
|       |               ^~~~~~~~~~~~
| In file included from cpuctl_def_task04.c:62:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_def_task04.c: In function 'main':
| cpuctl_def_task04.c:158:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   158 |         read(fd, &ch, 1);       /* Block task here to synchronize */
|       |         ^~~~~~~~~~~~~~~~
| CC testcases/kernel/controllers/cpuctl/cpuctl_latency_test
| In file included from cpuctl_test04.c:62:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_test04.c: In function 'main':
| cpuctl_test04.c:162:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   162 |         read(fd, &ch, 1);       /* To block all tasks here and fire them up at the same time */
|       |         ^~~~~~~~~~~~~~~~
| cpuctl_def_task04.c:169:14: warning: '__builtin_strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
|   169 |         if (!strncpy(fullpath, path, len))
|       |              ^
| cpuctl_def_task04.c:168:15: note: length computed here
|   168 |         len = strlen(path);
|       |               ^~~~~~~~~~~~
| cpuctl_test04.c:173:14: warning: '__builtin_strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
|   173 |         if (!strncpy(fullpath, path, len))
|       |              ^
| cpuctl_test04.c:172:15: note: length computed here
|   172 |         len = strlen(path);
|       |               ^~~~~~~~~~~~
| CC testcases/kernel/controllers/cpuctl/cpuctl_latency_check_task
| In file included from cpuctl_test03.c:62:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_test03.c: In function 'main':
| cpuctl_test03.c:151:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   151 |         read(fd, &ch, 1);       /* To block all tasks here and fire them up at the same time */
|       |         ^~~~~~~~~~~~~~~~
| In file included from cpuctl_test02.c:62:
| ../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| cpuctl_test02.c: In function 'main':
| cpuctl_test02.c:156:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
|   156 |         read(fd, &ch, 1);       /* To block all tasks here and fire them up at the same time */
|       |         ^~~~~~~~~~~~~~~~
| cpuctl_test03.c:162:14: warning: '__builtin_strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
|   162 |         if (!strncpy(fullpath, path, len))
|       |              ^
| cpuctl_test03.c:161:15: note: length computed here
|   161 |         len = strlen(path);
|       |               ^~~~~~~~~~~~
| cpuctl_test02.c:167:14: warning: '__builtin_strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
|   167 |         if (!strncpy(fullpath, path, len))
|       |              ^
| cpuctl_test02.c:166:15: note: length computed here
|   166 |         len = strlen(path);
|       |               ^~~~~~~~~~~~
| CC testcases/kernel/controllers/cpuctl/cpuctl_def_task02
| CC testcases/kernel/controllers/cpuctl/cpuctl_test01
| CC testcases/kernel/controllers/cpuctl/cpuctl_def_task01
| CC testcases/kernel/controllers/cpuctl/cpuctl_def_task04
| CC testcases/kernel/controllers/cpuctl/cpuctl_test04
| CC testcases/kernel/controllers/cpuctl/cpuctl_test03
| CC testcases/kernel/controllers/cpuctl/cpuctl_def_task03
| CC testcases/kernel/controllers/cpuctl/cpuctl_test02
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make -C ../cpuset_lib -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/../cpuset_lib/Makefile" all
| ../../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| CC testcases/kernel/controllers/cpuset/cpuset_lib/meminfo.o
| CC testcases/kernel/controllers/cpuset/cpuset_lib/cpuinfo.o
| CC testcases/kernel/controllers/cpuset/cpuset_lib/libbitmask.o
| libcpuset.c: In function 'store_map':
| libcpuset.c:1304:17: warning: pointer 'mapfp' may be used after 'fclose' [-Wuse-after-free]
|  1304 |                 fclose(mapfp);
|       |                 ^~~~~~~~~~~~~
| libcpuset.c:1295:9: note: call to 'fclose' here
|  1295 |         fclose(mapfp);
|       |         ^~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_migrate_all':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 14 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2917 |         if (load_flag(buf2, &memory_migrate_flag, "memory_migrate") < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from libcpuset.c:36:
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_migrate_all' at libcpuset.c:2917:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_migrate_all':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 14 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2919 |         if (store_flag(buf2, "memory_migrate", 1) < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'store_flag' at libcpuset.c:1069:2,
|     inlined from 'cpuset_migrate_all' at libcpuset.c:2919:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_migrate_all':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 14 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2929 |         if (store_flag(buf2, "memory_migrate", memory_migrate_flag) < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'store_flag' at libcpuset.c:1069:2,
|     inlined from 'cpuset_migrate_all' at libcpuset.c:2929:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_migrate':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 14 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2890 |         if (load_flag(buf2, &memory_migrate_flag, "memory_migrate") < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_migrate' at libcpuset.c:2890:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_migrate':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 14 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2892 |         if (store_flag(buf2, "memory_migrate", 1) < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'store_flag' at libcpuset.c:1069:2,
|     inlined from 'cpuset_migrate' at libcpuset.c:2892:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_migrate':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 14 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2899 |         store_flag(buf2, "memory_migrate", memory_migrate_flag);
|       |                          ~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'store_flag' at libcpuset.c:1069:2,
|     inlined from 'cpuset_migrate' at libcpuset.c:2899:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 20 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2096 |         if (load_flag(buf, &cp->cpu_exclusive, "cpuset.cpu_exclusive") < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2096:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 22 and 4117 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 20 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2100 |         if (load_flag(buf, &cp->mem_exclusive, "cpuset.mem_exclusive") < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2100:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 22 and 4117 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 17 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2104 |         if (load_flag(buf, &cp->notify_on_release, "notify_on_release") < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2104:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 21 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2109 |                 if (load_flag(buf, &cp->memory_migrate, "cpuset.memory_migrate") < 0)
|       |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2109:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 19 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2115 |                 if (load_flag(buf, &cp->mem_hardwall, "cpuset.mem_hardwall") < 0)
|       |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2115:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 21 and 4116 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 30 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2121 |                 if (load_flag
|       |                     ~~~~~~~~~
|  2122 |                     (buf, &cp->memory_pressure_enabled,
|       |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|  2123 |                      "cpuset.memory_pressure_enabled") < 0)
|       |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2121:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 32 and 4127 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 25 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2129 |                 if (load_flag
|       |                     ~~~~~~~~~
|  2130 |                     (buf, &cp->memory_spread_page, "cpuset.memory_spread_page") < 0)
|       |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2129:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 25 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2136 |                 if (load_flag
|       |                     ~~~~~~~~~
|  2137 |                     (buf, &cp->memory_spread_slab, "cpuset.memory_spread_slab") < 0)
|       |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2136:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 25 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2143 |                 if (load_flag
|       |                     ~~~~~~~~~
|  2144 |                     (buf, &cp->sched_load_balance, "cpuset.sched_load_balance") < 0)
|       |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_flag' at libcpuset.c:945:2,
|     inlined from 'cpuset_query' at libcpuset.c:2143:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 31 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_number' at libcpuset.c:971:2,
|     inlined from 'cpuset_query' at libcpuset.c:2150:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 33 and 4128 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 11 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2157 |         if (load_mask(buf, &cp->cpus, cpuset_cpus_nbits(), "cpuset.cpus") < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_mask' at libcpuset.c:1017:2,
|     inlined from 'cpuset_query' at libcpuset.c:2157:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 13 and 4108 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_query':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing 11 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| ......
|  2161 |         if (load_mask(buf, &cp->mems, cpuset_mems_nbits(), "cpuset.mems") < 0)
|       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'load_mask' at libcpuset.c:1017:2,
|     inlined from 'cpuset_query' at libcpuset.c:2161:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 13 and 4108 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| libcpuset.c: In function 'cpuset_collides_exclusive':
| libcpuset.c:492:41: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|   492 |         (void)snprintf(buf, buflen, "%s/%s", name1, name2);
|       |                                         ^~
| In function 'snprintf',
|     inlined from 'pathcat2' at libcpuset.c:492:8,
|     inlined from 'cpuset_collides_exclusive' at libcpuset.c:2334:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.o
| AR libcpu_set.a
| RANLIB libcpu_set.a
| CC testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_list_compute
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/controllers/cpuset/cpuset_load_balance_test/cpuset_cpu_hog
| CC testcases/kernel/controllers/cpuset/cpuset_load_balance_test/cpuset_sched_domains_check
| CC testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure
| CC testcases/kernel/controllers/cpuset/cpuset_memory_spread_test/cpuset_mem_hog
| CC testcases/kernel/controllers/cpuset/cpuset_memory_test/cpuset_memory_test
| CC testcases/kernel/controllers/cpuset/cpuset_syscall_test/cpuset_syscall_test
| timed_forkbomb.c: In function 'main':
| timed_forkbomb.c:58:32: warning: format '%a' expects argument of type 'float *', but argument 2 has type 'char **' [-Wformat=]
|    58 |                 while (scanf("%as", &word) < 1) {
|       |                               ~^    ~~~~~
|       |                                |    |
|       |                                |    char **
|       |                                float *
| vfork.c: In function '_parse_opts':
| vfork.c:169:51: warning: format '%a' expects argument of type 'float *', but argument 4 has type 'char **' [-Wformat=]
|   169 |                         opt = sscanf(optarg, "%Ld%as", &duration, &units);
|       |                                                  ~^               ~~~~~~
|       |                                                   |               |
|       |                                                   float *         char **
| vfork.c: In function 'do_vfork':
| vfork.c:97:18: warning: argument 'count' might be clobbered by 'longjmp' or 'vfork' [-Wclobbered]
|    97 | int do_vfork(int count)
|       |              ~~~~^~~~~
| CC testcases/kernel/controllers/freezer/fork_exec_loop
| CC testcases/kernel/controllers/freezer/timed_forkbomb
| CC testcases/kernel/controllers/freezer/vfork
| CC testcases/kernel/controllers/io/io_control01
| CC testcases/kernel/controllers/memcg/memcontrol01
| CC testcases/kernel/controllers/memcg/memcontrol04
| CC testcases/kernel/controllers/memcg/memcontrol02
| CC testcases/kernel/controllers/memcg/memcontrol03
| CC testcases/kernel/controllers/memcg/control/mem_process
| CC testcases/kernel/controllers/memcg/functional/memcg_process
| memcg_test_1.c: In function 'main':
| memcg_test_1.c:55:33: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    55 |                                 write(fd, buf, 10);
|       |                                 ^~~~~~~~~~~~~~~~~~
| CC testcases/kernel/controllers/memcg/regression/memcg_test_2
| CC testcases/kernel/controllers/memcg/regression/memcg_test_1
| CC testcases/kernel/controllers/memcg/regression/memcg_test_4
| CC testcases/kernel/controllers/memcg/regression/memcg_test_3
| CC testcases/kernel/controllers/memcg/stress/memcg_process_stress
| make -C ../libcontrollers -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/memctl/../libcontrollers/Makefile" all
| make[5]: Nothing to be done for 'all'.
| ../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| memctl_test01.c: In function 'main':
| memctl_test01.c:68:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
|    68 |         int ret;
|       |             ^~~
| In file included from memctl_test01.c:49:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/memctl/../libcontrollers/libcontrollers.h: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/memctl/../libcontrollers/libcontrollers.h:61:20: warning: 'error_function' declared 'static' but never defined [-Wunused-function]
|    61 | static inline void error_function(char *msg1, char *msg2);
|       |                    ^~~~~~~~~~~~~~
| CC testcases/kernel/controllers/memctl/memctl_test01
| make -C ../libcontrollers -f "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/controllers/pids/../libcontrollers/Makefile" all
| ../../../../include/mk/sparse.mk:6: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:6: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse/sparse-ltp'
| ../../../../include/mk/sparse.mk:9: warning: overriding recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| ../../../../include/mk/sparse.mk:9: warning: ignoring old recipe for target '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/tools/sparse'
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/controllers/pids/pids_task2
| CC testcases/kernel/controllers/pids/pids_task1
| CC testcases/kernel/crypto/af_alg03
| CC testcases/kernel/crypto/af_alg02
| CC testcases/kernel/crypto/af_alg05
| CC testcases/kernel/crypto/af_alg01
| CC testcases/kernel/crypto/af_alg04
| CC testcases/kernel/crypto/af_alg06
| CC testcases/kernel/crypto/pcrypt_aead01
| CC testcases/kernel/crypto/crypto_user02
| CC testcases/kernel/crypto/crypto_user01
| CC testcases/kernel/crypto/af_alg07
| CC testcases/kernel/device-drivers/acpi/ltp_acpi
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/device-drivers/block/block_dev_user/block_dev
| CC testcases/kernel/device-drivers/cpufreq/cpufreq_boost
| make[4]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/device-drivers/pci/tpci_user/tpci
| make[4]: Nothing to be done for 'all'.
| CC testcases/kernel/device-drivers/rtc/rtc01
| CC testcases/kernel/device-drivers/rtc/rtc02
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/device-drivers/tbio/tbio_user/tbio
| CC testcases/kernel/device-drivers/uaccess/uaccess
| CC testcases/kernel/device-drivers/zram/zram03
| make[4]: Nothing to be done for 'all'.
| CC testcases/kernel/firmware/fw_load_user/fw_load
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/fs/doio/dataascii.o
| CC testcases/kernel/fs/doio/databin.o
| datapid.c: In function 'datapidgen':
| datapid.c:84:20: warning: unused parameter 'pid' [-Wunused-parameter]
|    84 | int datapidgen(int pid, char *buffer, int bsize, int offset)
|       |                ~~~~^~~
| datapid.c:84:31: warning: unused parameter 'buffer' [-Wunused-parameter]
|    84 | int datapidgen(int pid, char *buffer, int bsize, int offset)
|       |                         ~~~~~~^~~~~~
| datapid.c:84:43: warning: unused parameter 'bsize' [-Wunused-parameter]
|    84 | int datapidgen(int pid, char *buffer, int bsize, int offset)
|       |                                       ~~~~^~~~~
| datapid.c:84:54: warning: unused parameter 'offset' [-Wunused-parameter]
|    84 | int datapidgen(int pid, char *buffer, int bsize, int offset)
|       |                                                  ~~~~^~~~~~
| datapid.c: In function 'datapidchk':
| datapid.c:181:20: warning: unused parameter 'pid' [-Wunused-parameter]
|   181 | int datapidchk(int pid, char *buffer, int bsize, int offset, char **errmsg)
|       |                ~~~~^~~
| datapid.c:181:31: warning: unused parameter 'buffer' [-Wunused-parameter]
|   181 | int datapidchk(int pid, char *buffer, int bsize, int offset, char **errmsg)
|       |                         ~~~~~~^~~~~~
| datapid.c:181:43: warning: unused parameter 'bsize' [-Wunused-parameter]
|   181 | int datapidchk(int pid, char *buffer, int bsize, int offset, char **errmsg)
|       |                                       ~~~~^~~~~
| datapid.c:181:54: warning: unused parameter 'offset' [-Wunused-parameter]
|   181 | int datapidchk(int pid, char *buffer, int bsize, int offset, char **errmsg)
|       |                                                  ~~~~^~~~~~
| CC testcases/kernel/fs/doio/forker.o
| write_log.c: In function 'wlog_open':
| write_log.c:145:58: warning: '%s' directive writing up to 1023 bytes into a region of size 224 [-Wformat-overflow=]
|   145 |                         "Could not open write log - open(%s, %#o) failed:  %s\n",
|       |                                                          ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from write_log.c:66:
| In function 'sprintf',
|     inlined from 'wlog_open' at write_log.c:144:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 49 or more bytes (assuming 1072) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| write_log.c: In function 'wlog_open':
| write_log.c:133:58: warning: '%s' directive writing up to 1023 bytes into a region of size 224 [-Wformat-overflow=]
|   133 |                         "Could not open write_log - open(%s, %#o, %#o) failed:  %s\n",
|       |                                                          ^~
| write_log.c:133:25: note: directive argument in the range [1089, 1601]
|   133 |                         "Could not open write_log - open(%s, %#o, %#o) failed:  %s\n",
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| write_log.c:133:25: note: assuming directive output of 2 bytes
| write_log.c:133:25: note: using the range [0, 4294967295] for directive argument
| In function 'sprintf',
|     inlined from 'wlog_open' at write_log.c:132:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 55 or more bytes (assuming 1079) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/doio/datapid.o
| write_log.c: In function 'wlog_record_write':
| write_log.c:243:70: warning: '%s' directive writing up to 1023 bytes into a region of size 228 [-Wformat-overflow=]
|   243 |                                         "Could not write log - write(%s, %s, %d) failed:  %s\n",
|       |                                                                      ^~
| In function 'sprintf',
|     inlined from 'wlog_record_write' at write_log.c:242:5:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 47 or more bytes (assuming 1521) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| write_log.c: In function 'wlog_record_write':
| write_log.c:237:76: warning: '%s' directive writing up to 1023 bytes into a region of size 214 [-Wformat-overflow=]
|   237 |                                 "Could not reposition file pointer - lseek(%s, %ld, SEEK_SET) failed:  %s\n",
|       |                                                                            ^~
| write_log.c:237:33: note: directive argument in the range [0, 9223372036854775807]
|   237 |                                 "Could not reposition file pointer - lseek(%s, %ld, SEEK_SET) failed:  %s\n",
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'wlog_record_write' at write_log.c:236:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 68 or more bytes (assuming 1109) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| write_log.c: In function 'wlog_record_write':
| write_log.c:229:84: warning: '%s' directive writing up to 1023 bytes into a region of size 214 [-Wformat-overflow=]
|   229 |                                         "Could not reposition file pointer - lseek(%s, 0, SEEK_CUR) failed:  %s\n",
|       |                                                                                    ^~
| In function 'sprintf',
|     inlined from 'wlog_record_write' at write_log.c:228:5:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 68 or more bytes (assuming 1091) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| write_log.c: In function 'wlog_record_write':
| write_log.c:222:62: warning: '%s' directive writing up to 1023 bytes into a region of size 228 [-Wformat-overflow=]
|   222 |                                 "Could not write log - write(%s, %s, %d) failed:  %s\n",
|       |                                                              ^~
| write_log.c:222:33: note: directive argument in the range [30, 235]
|   222 |                                 "Could not write log - write(%s, %s, %d) failed:  %s\n",
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'wlog_record_write' at write_log.c:221:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 47 or more bytes (assuming 1522) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/doio/pattern.o
| CC testcases/kernel/fs/doio/file_lock.o
| CC testcases/kernel/fs/doio/open_flags.o
| CC testcases/kernel/fs/doio/string_to_tokens.o
| CC testcases/kernel/fs/doio/bytes_by_prefix.o
| write_log.c: In function 'wlog_scan_backward':
| write_log.c:313:76: warning: '%s' directive writing up to 1023 bytes into a region of size 214 [-Wformat-overflow=]
|   313 |                                 "Could not reposition file pointer - lseek(%s, %d, SEEK_SET) failed:  %s\n",
|       |                                                                            ^~
| write_log.c:313:33: note: using the range [-2147483648, 2147483647] for directive argument
|   313 |                                 "Could not reposition file pointer - lseek(%s, %d, SEEK_SET) failed:  %s\n",
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'sprintf',
|     inlined from 'wlog_scan_backward' at write_log.c:312:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 68 or more bytes (assuming 1091) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| write_log.c: In function 'wlog_scan_backward':
| write_log.c:285:68: warning: '%s' directive writing up to 1023 bytes into a region of size 214 [-Wformat-overflow=]
|   285 |                         "Could not reposition file pointer - lseek(%s, 0, SEEK_CUR) failed:  %s\n",
|       |                                                                    ^~
| In function 'sprintf',
|     inlined from 'wlog_scan_backward' at write_log.c:284:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 68 or more bytes (assuming 1091) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| write_log.c: In function 'wlog_scan_backward':
| write_log.c:278:68: warning: '%s' directive writing up to 1023 bytes into a region of size 214 [-Wformat-overflow=]
|   278 |                         "Could not reposition file pointer - lseek(%s, 0, SEEK_END) failed:  %s\n",
|       |                                                                    ^~
| In function 'sprintf',
|     inlined from 'wlog_scan_backward' at write_log.c:277:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output 68 or more bytes (assuming 1091) into a destination of size 256
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/doio/write_log.o
| growfiles.c: In function 'growfile':
| growfiles.c:1949:44: warning: unused parameter 'file' [-Wunused-parameter]
|  1949 | int /* BUG:14136 */ growfile(int fd, char *file, int grow_incr, char *buf,
|       |                                      ~~~~~~^~~~
| growfiles.c: In function 'shrinkfile':
| growfiles.c:2353:26: warning: unused parameter 'filename' [-Wunused-parameter]
|  2353 | shrinkfile(int fd, char *filename, int trunc_incr, int trunc_inter,
|       |                    ~~~~~~^~~~~~~~
| growfiles.c:2354:16: warning: unused parameter 'just_trunc' [-Wunused-parameter]
|  2354 |            int just_trunc)
|       |            ~~~~^~~~~~~~~~
| iogen.c:190:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   190 |         {"none", 0},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:207:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   207 |         {NULL, -1}
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:223:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   223 |         {"random", M_RANDOM},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:224:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   224 |         {"sequential", M_SEQUENTIAL},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:225:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   225 |         {"reverse", M_REVERSE},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:226:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   226 |         {NULL, -1}
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:305:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   305 |         {"readv", READV},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:307:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   307 |         {"mmread", MMAPR},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:313:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   313 |         {NULL, -1}
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:354:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   354 |         {NULL, -1}
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:362:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   362 |         {"regular", S_IFREG},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:363:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   363 |         {"blk-spec", S_IFBLK},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:364:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   364 |         {"chr-spec", S_IFCHR},
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c:365:9: warning: missing initializer for field 'm_flags' of 'struct strmap' [-Wmissing-field-initializers]
|   365 |         {NULL, 0}
|       |         ^
| iogen.c:113:13: note: 'm_flags' declared here
|   113 |         int m_flags;
|       |             ^~~~~~~
| iogen.c: In function 'parse_cmdline':
| iogen.c:1384:13: warning: variable 'nopenargs' set but not used [-Wunused-but-set-variable]
|  1384 |         int nopenargs;
|       |             ^~~~~~~~~
| growfiles.c: In function 'main':
| growfiles.c:130:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   130 | #define exit(x) myexit(x)
|       |                 ^~~~~~~~~
| growfiles.c:453:25: note: in expansion of macro 'exit'
|   453 |                         exit(0);
|       |                         ^~~~
| growfiles.c:455:17: note: here
|   455 |                 case 'b':       /* batch */
|       |                 ^~~~
| doio.c: In function 'do_write':
| doio.c:1601:33: warning: variable 'signo' set but not used [-Wunused-but-set-variable]
|  1601 |         int fd, nbytes, oflags, signo;
|       |                                 ^~~~~
| doio.c: In function 'do_listio':
| doio.c:2078:30: warning: unused parameter 'req' [-Wunused-parameter]
|  2078 | int do_listio(struct io_req *req)
|       |               ~~~~~~~~~~~~~~~^~~
| doio.c: In function 'sy_rwv':
| doio.c:2728:64: warning: unused parameter 'sysc' [-Wunused-parameter]
|  2728 | struct status *sy_rwv(struct io_req *req, struct syscall_info *sysc, int fd,
|       |                                           ~~~~~~~~~~~~~~~~~~~~~^~~~
| doio.c: In function 'fmt_readv':
| doio.c:2763:32: warning: unused parameter 'req' [-Wunused-parameter]
|  2763 | char *fmt_readv(struct io_req *req, struct syscall_info *sy, int fd, char *addr)
|       |                 ~~~~~~~~~~~~~~~^~~
| doio.c:2763:76: warning: unused parameter 'addr' [-Wunused-parameter]
|  2763 | char *fmt_readv(struct io_req *req, struct syscall_info *sy, int fd, char *addr)
|       |                                                                      ~~~~~~^~~~
| doio.c: In function 'sy_mmrw':
| doio.c:2895:13: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
|  2895 |         int rc;
|       |             ^~
| doio.c:2883:65: warning: unused parameter 'sysc' [-Wunused-parameter]
|  2883 | struct status *sy_mmrw(struct io_req *req, struct syscall_info *sysc, int fd,
|       |                                            ~~~~~~~~~~~~~~~~~~~~~^~~~
| doio.c: At top level:
| doio.c:3038:10: warning: missing initializer for field 'sy_bits' of 'struct syscall_info' [-Wmissing-field-initializers]
|  3038 |          0},
|       |          ^
| doio.c:192:13: note: 'sy_bits' declared here
|   192 |         int sy_bits;
|       |             ^~~~~~~
| doio.c:3041:10: warning: missing initializer for field 'sy_bits' of 'struct syscall_info' [-Wmissing-field-initializers]
|  3041 |          SY_WRITE},
|       |          ^~~~~~~~
| doio.c:192:13: note: 'sy_bits' declared here
|   192 |         int sy_bits;
|       |             ^~~~~~~
| doio.c:3044:10: warning: missing initializer for field 'sy_bits' of 'struct syscall_info' [-Wmissing-field-initializers]
|  3044 |          0},
|       |          ^
| doio.c:192:13: note: 'sy_bits' declared here
|   192 |         int sy_bits;
|       |             ^~~~~~~
| doio.c:3047:10: warning: missing initializer for field 'sy_bits' of 'struct syscall_info' [-Wmissing-field-initializers]
|  3047 |          SY_WRITE},
|       |          ^~~~~~~~
| doio.c:192:13: note: 'sy_bits' declared here
|   192 |         int sy_bits;
|       |             ^~~~~~~
| doio.c:3052:10: warning: missing initializer for field 'sy_bits' of 'struct syscall_info' [-Wmissing-field-initializers]
|  3052 |          0},
|       |          ^
| doio.c:192:13: note: 'sy_bits' declared here
|   192 |         int sy_bits;
|       |             ^~~~~~~
| doio.c: In function 'doio_pat_fill':
| doio.c:3638:19: warning: unused parameter 'shift' [-Wunused-parameter]
|  3638 |               int shift)
|       |               ~~~~^~~~~
| doio.c: In function 'cleanup_handler':
| doio.c:4536:26: warning: unused parameter 'sig' [-Wunused-parameter]
|  4536 | void cleanup_handler(int sig)
|       |                      ~~~~^~~
| doio.c: In function 'noop_handler':
| doio.c:4566:23: warning: unused parameter 'sig' [-Wunused-parameter]
|  4566 | void noop_handler(int sig)
|       |                   ~~~~^~~
| doio.c: In function 'sigint_handler':
| doio.c:4577:25: warning: unused parameter 'sig' [-Wunused-parameter]
|  4577 | void sigint_handler(int sig)
|       |                     ~~~~^~~
| doio.c: In function 'aio_done':
| doio.c:4880:31: warning: unused parameter 'ainfo' [-Wunused-parameter]
|  4880 | int aio_done(struct aio_info *ainfo)
|       |              ~~~~~~~~~~~~~~~~~^~~~~
| iogen.c:1522:49: warning: ')' directive writing 1 byte into a region of size between 0 and 39 [-Wformat-overflow=]
|  1522 |                         sprintf(TagName, "(%.39s)", optarg);
|       |                                                 ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from iogen.c:36:
| In function 'sprintf',
|     inlined from 'parse_cmdline' at iogen.c:1522:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 3 and 42 bytes into a destination of size 40
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| growfiles.c:938:49: warning: ')' directive writing 1 byte into a region of size between 0 and 39 [-Wformat-overflow=]
|   938 |                         sprintf(TagName, "(%.39s)", optarg);
|       |                                                 ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from growfiles.c:69:
| In function 'sprintf',
|     inlined from 'main' at growfiles.c:938:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 3 and 42 bytes into a destination of size 40
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/doio/iogen
| doio.c: In function 'parse_cmdline':
| doio.c:5052:49: warning: ')' directive writing 1 byte into a region of size between 0 and 39 [-Wformat-overflow=]
|  5052 |                         sprintf(TagName, "(%.39s)", optarg);
|       |                                                 ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from doio.c:50:
| In function 'sprintf',
|     inlined from 'parse_cmdline' at doio.c:5052:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 3 and 42 bytes into a destination of size 40
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/doio/growfiles
| CC testcases/kernel/fs/doio/doio
| create-files.c: In function 'main':
| create-files.c:63:62: warning: '%s' directive writing up to 4095 bytes into a region of size between 1 and 4096 [-Wformat-overflow=]
|    63 |                                         sprintf(filename, "%s%s%s%2.2x", dir1,
|       |                                                              ^~
|    64 |                                                 dir2, dir3, l);
|       |                                                 ~~~~
| create-files.c:63:59: note: directive argument in the range [0, 254]
|    63 |                                         sprintf(filename, "%s%s%s%2.2x", dir1,
|       |                                                           ^~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from create-files.c:3:
| In function 'sprintf',
|     inlined from 'main' at create-files.c:63:6:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: note: '__builtin___sprintf_chk' output between 3 and 12288 bytes into a destination of size 4096
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/fs-bench/create-files.o
| CC testcases/kernel/fs/fs-bench/boxmuler.o
| CC testcases/kernel/fs/fs-bench/random-access
| LD testcases/kernel/fs/fs-bench/create-files
| CC testcases/kernel/fs/fs-bench/random-access-del-create.o
| LD testcases/kernel/fs/fs-bench/random-access-del-create
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/fs/fs_di/create_datafile
| CC testcases/kernel/fs/fs_di/frag
| fs_fill.c: In function 'worker':
| fs_fill.c:50:58: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|    50 |                         snprintf(file, sizeof(file), "%s/%s",
|       |                                                          ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from fs_fill.c:12:
| In function 'snprintf',
|     inlined from 'worker' at fs_fill.c:50:4:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/fs_fill/fs_fill
| make[4]: Nothing to be done for 'all'.
| fs_perms.c: In function 'cleanup':
| fs_perms.c:55:9: warning: ignoring return value of 'seteuid' declared with attribute 'warn_unused_result' [-Wunused-result]
|    55 |         seteuid(0);
|       |         ^~~~~~~~~~
| fs_perms.c:56:9: warning: ignoring return value of 'setegid' declared with attribute 'warn_unused_result' [-Wunused-result]
|    56 |         setegid(0);
|       |         ^~~~~~~~~~
| CC testcases/kernel/fs/fs_perms/fs_perms
| make[4]: Nothing to be done for 'all'.
| fsstress.c: In function 'creat_f':
| fsstress.c:1684:13: warning: variable 'extsize' set but not used [-Wunused-but-set-variable]
|  1684 |         int extsize;
|       |             ^~~~~~~
| fsstress.c: In function 'dread_f':
| fsstress.c:1850:22: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|  1850 |         else if (len > diob.d_maxiosz)
|       |                      ^
| In file included from global.h:39,
|                  from fsstress.c:34:
| fsstress.c: In function 'dwrite_f':
| xfscompat.h:6:22: warning: comparison of integer expressions of different signedness: '__off_t' {aka 'long int'} and 'long long unsigned int' [-Wsign-compare]
|     6 | #define MIN(a,b) ((a)<(b) ? (a):(b))
|       |                      ^
| fsstress.c:1933:31: note: in expansion of macro 'MIN'
|  1933 |         off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
|       |                               ^~~
| xfscompat.h:6:29: warning: operand of '?:' changes signedness from '__off_t' {aka 'long int'} to 'long long unsigned int' due to unsignedness of other operand [-Wsign-compare]
|     6 | #define MIN(a,b) ((a)<(b) ? (a):(b))
|       |                             ^~~
| fsstress.c:1933:31: note: in expansion of macro 'MIN'
|  1933 |         off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
|       |                               ^~~
| fsstress.c:1940:22: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|  1940 |         else if (len > diob.d_maxiosz)
|       |                      ^
| fsstress.c: In function 'truncate_f':
| xfscompat.h:6:22: warning: comparison of integer expressions of different signedness: '__off_t' {aka 'long int'} and 'long long unsigned int' [-Wsign-compare]
|     6 | #define MIN(a,b) ((a)<(b) ? (a):(b))
|       |                      ^
| fsstress.c:2537:20: note: in expansion of macro 'MIN'
|  2537 |         off = lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE);
|       |                    ^~~
| xfscompat.h:6:29: warning: operand of '?:' changes signedness from '__off_t' {aka 'long int'} to 'long long unsigned int' due to unsignedness of other operand [-Wsign-compare]
|     6 | #define MIN(a,b) ((a)<(b) ? (a):(b))
|       |                             ^~~
| fsstress.c:2537:20: note: in expansion of macro 'MIN'
|  2537 |         off = lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE);
|       |                    ^~~
| fsstress.c: In function 'write_f':
| xfscompat.h:6:22: warning: comparison of integer expressions of different signedness: '__off_t' {aka 'long int'} and 'long long unsigned int' [-Wsign-compare]
|     6 | #define MIN(a,b) ((a)<(b) ? (a):(b))
|       |                      ^
| fsstress.c:2663:31: note: in expansion of macro 'MIN'
|  2663 |         off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
|       |                               ^~~
| xfscompat.h:6:29: warning: operand of '?:' changes signedness from '__off_t' {aka 'long int'} to 'long long unsigned int' due to unsignedness of other operand [-Wsign-compare]
|     6 | #define MIN(a,b) ((a)<(b) ? (a):(b))
|       |                             ^~~
| fsstress.c:2663:31: note: in expansion of macro 'MIN'
|  2663 |         off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
|       |                               ^~~
| fsstress.c: In function 'main':
| fsstress.c:544:25: warning: ignoring return value of 'system' declared with attribute 'warn_unused_result' [-Wunused-result]
|   544 |                         system(cmd);
|       |                         ^~~~~~~~~~~
| fsstress.c: In function 'creat_path':
| fsstress.c:678:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   678 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'lchown_path':
| fsstress.c:932:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   932 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'link_path':
| fsstress.c:955:25: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   955 |                         chdir("..");
|       |                         ^~~~~~~~~~~
| fsstress.c:975:33: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   975 |                                 chdir("..");
|       |                                 ^~~~~~~~~~~
| fsstress.c:983:33: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   983 |                                 chdir("..");
|       |                                 ^~~~~~~~~~~
| fsstress.c: In function 'lstat64_path':
| fsstress.c:1004:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1004 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'mkdir_path':
| fsstress.c:1038:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1038 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'mknod_path':
| fsstress.c:1056:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1056 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'open_path':
| fsstress.c:1094:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1094 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'opendir_path':
| fsstress.c:1112:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1112 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'readlink_path':
| fsstress.c:1153:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1153 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'rename_path':
| fsstress.c:1176:25: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1176 |                         chdir("..");
|       |                         ^~~~~~~~~~~
| fsstress.c:1196:33: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1196 |                                 chdir("..");
|       |                                 ^~~~~~~~~~~
| fsstress.c:1204:33: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1204 |                                 chdir("..");
|       |                                 ^~~~~~~~~~~
| fsstress.c: In function 'rmdir_path':
| fsstress.c:1225:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1225 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'stat64_path':
| fsstress.c:1297:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1297 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'symlink_path':
| fsstress.c:1320:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1320 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'truncate64_path':
| fsstress.c:1338:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1338 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| fsstress.c: In function 'unlink_path':
| fsstress.c:1356:17: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1356 |                 chdir("..");
|       |                 ^~~~~~~~~~~
| CC testcases/kernel/fs/fsstress/fsstress
| fsx-linux.c: In function 'doread':
| fsx-linux.c:628:26: warning: comparison of integer expressions of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
|   628 |                 if (iret == -1)
|       |                          ^~
| fsx-linux.c: In function 'dowrite':
| fsx-linux.c:766:26: warning: comparison of integer expressions of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
|   766 |                 if (iret == -1)
|       |                          ^~
| fsx-linux.c: In function 'test':
| fsx-linux.c:1023:51: warning: comparison of integer expressions of different signedness: 'long unsigned int' and 'off_t' {aka 'long int'} [-Wsign-compare]
|  1023 |                                 if (offset + size > file_size)
|       |                                                   ^
| fsx-linux.c:1034:36: warning: comparison of integer expressions of different signedness: 'long unsigned int' and 'int' [-Wsign-compare]
|  1034 |         if (closeprob && (rv >> 3) < (1 << 28) / closeprob)
|       |                                    ^
| fsx-linux.c: In function 'main':
| fsx-linux.c:1179:46: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
|  1179 |                         if (progressinterval < 0)
|       |                                              ^
| fsx-linux.c:1308:23: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
|  1308 |         for (i = 0; i < maxfilelen; i++)
|       |                       ^
| fsx-linux.c:1326:29: warning: comparison of integer expressions of different signedness: 'ssize_t' {aka 'long int'} and 'long unsigned int' [-Wsign-compare]
|  1326 |                 if (written != maxfilelen) {
|       |                             ^~
| fsx-linux.c: In function 'check_trunc_hack':
| fsx-linux.c:497:9: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|   497 |         ftruncate(fd, (off_t) 0);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~
| fsx-linux.c:498:9: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|   498 |         ftruncate(fd, (off_t) 100000);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fsx-linux.c:507:9: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|   507 |         ftruncate(fd, 0);
|       |         ^~~~~~~~~~~~~~~~
| fsx-linux.c: In function 'main':
| fsx-linux.c:1168:31: warning: this statement may fall through [-Wimplicit-fallthrough=]
|  1168 |                         debug = 1;
|       |                         ~~~~~~^~~
| fsx-linux.c:1169:17: note: here
|  1169 |                 case 'n':
|       |                 ^~~~
| fsx-linux.c:1225:25: warning: '__builtin_strncpy' specified bound 1024 equals destination size [-Wstringop-truncation]
|  1225 |                         strncpy(goodfile, optarg, sizeof(goodfile));
|       |                         ^
| fsx-linux.c:1227:25: warning: '__builtin_strncpy' specified bound 1024 equals destination size [-Wstringop-truncation]
|  1227 |                         strncpy(logfile, optarg, sizeof(logfile));
|       |                         ^
| CC testcases/kernel/fs/fsx-linux/fsx-linux
| CC testcases/kernel/fs/ftest/libftest.o
| ftest01.c: In function 'setup':
| ftest01.c:143:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   143 |         if (sigset(SIGTERM, term) == SIG_ERR) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/wait.h:36,
|                  from ftest01.c:53:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| In file included from ftest01.c:61:
| ftest01.c: In function 'dotest':
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest01.c:372:41: note: in expansion of macro 'tst_resm'
|   372 |                                         tst_resm(TINFO,
|       |                                         ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest01.c:405:41: note: in expansion of macro 'tst_resm'
|   405 |                                         tst_resm(TINFO,
|       |                                         ^~~~~~~~
| ftest01.c: In function 'setup':
| ftest01.c:125:9: warning: ignoring return value of 'getcwd' declared with attribute 'warn_unused_result' [-Wunused-result]
|   125 |         getcwd(homedir, sizeof(homedir));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ftest01.c: In function 'runtest':
| ftest01.c:212:9: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   212 |         chdir(homedir);
|       |         ^~~~~~~~~~~~~~
| ftest01.c: In function 'dotest':
| ftest01.c:322:17: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|   322 |                 ftruncate(fd, 0);
|       |                 ^~~~~~~~~~~~~~~~
| ftest03.c: In function 'setup':
| ftest03.c:164:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   164 |         if (sigset(SIGTERM, term) == SIG_ERR) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/param.h:28,
|                  from ftest03.c:57:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| In file included from ftest03.c:66:
| ftest03.c: In function 'dotest':
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest03.c:437:49: note: in expansion of macro 'tst_resm'
|   437 |                                                 tst_resm(TINFO,
|       |                                                 ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest03.c:475:49: note: in expansion of macro 'tst_resm'
|   475 |                                                 tst_resm(TINFO,
|       |                                                 ^~~~~~~~
| ftest03.c: In function 'runtest':
| ftest03.c:230:9: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   230 |         chdir(homedir);
|       |         ^~~~~~~~~~~~~~
| ftest03.c: In function 'dotest':
| ftest03.c:374:17: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|   374 |                 ftruncate(fd, 0);
|       |                 ^~~~~~~~~~~~~~~~
| ftest07.c: In function 'setup':
| ftest07.c:168:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   168 |         if (sigset(SIGTERM, term) == SIG_ERR) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/param.h:28,
|                  from ftest07.c:62:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| ftest05.c: In function 'setup':
| ftest05.c:151:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   151 |         if (sigset(SIGTERM, term) == SIG_ERR) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/wait.h:36,
|                  from ftest05.c:57:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| In file included from ftest05.c:65:
| ftest05.c: In function 'dotest':
| ftest05.c:332:42: warning: format '%Lx' expects argument of type 'long long unsigned int', but argument 7 has type 'long int' [-Wformat=]
|   332 |                                          "\tTest[%d]: lseek64(0) fail at %Lx",
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../../include/old/test.h:153:64: note: in definition of macro 'tst_brkm'
|   153 |                 tst_brkm__(__FILE__, __LINE__, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                                                                ^~~
| ftest05.c:332:76: note: format string is defined here
|   332 |                                          "\tTest[%d]: lseek64(0) fail at %Lx",
|       |                                                                          ~~^
|       |                                                                            |
|       |                                                                            long long unsigned int
|       |                                                                          %lx
| ftest05.c:337:42: warning: format '%Lx' expects argument of type 'long long unsigned int', but argument 7 has type 'long int' [-Wformat=]
|   337 |                                          "\tTest[%d]: read fail at %Lx",
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../../include/old/test.h:153:64: note: in definition of macro 'tst_brkm'
|   153 |                 tst_brkm__(__FILE__, __LINE__, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                                                                ^~~
| ftest05.c:337:70: note: format string is defined here
|   337 |                                          "\tTest[%d]: read fail at %Lx",
|       |                                                                    ~~^
|       |                                                                      |
|       |                                                                      long long unsigned int
|       |                                                                    %lx
| ../../../../include/old/test.h:123:19: warning: format '%Lx' expects argument of type 'long long unsigned int', but argument 6 has type 'long int' [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest05.c:356:41: note: in expansion of macro 'tst_resm'
|   356 |                                         tst_resm(TFAIL,
|       |                                         ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest05.c:364:41: note: in expansion of macro 'tst_resm'
|   364 |                                         tst_resm(TINFO,
|       |                                         ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%Lx' expects argument of type 'long long unsigned int', but argument 6 has type 'long int' [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest05.c:387:41: note: in expansion of macro 'tst_resm'
|   387 |                                         tst_resm(TFAIL,
|       |                                         ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest05.c:395:41: note: in expansion of macro 'tst_resm'
|   395 |                                         tst_resm(TINFO,
|       |                                         ^~~~~~~~
| ftest05.c:414:42: warning: format '%Lx' expects argument of type 'long long unsigned int', but argument 7 has type 'long int' [-Wformat=]
|   414 |                                          "\tTest[%d]: lseek64(1) fail at %Lx",
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../../include/old/test.h:153:64: note: in definition of macro 'tst_brkm'
|   153 |                 tst_brkm__(__FILE__, __LINE__, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                                                                ^~~
| ftest05.c:414:76: note: format string is defined here
|   414 |                                          "\tTest[%d]: lseek64(1) fail at %Lx",
|       |                                                                          ~~^
|       |                                                                            |
|       |                                                                            long long unsigned int
|       |                                                                          %lx
| ../../../../include/old/test.h:123:19: warning: format '%Lx' expects argument of type 'long long unsigned int', but argument 6 has type 'long int' [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest05.c:424:41: note: in expansion of macro 'tst_resm'
|   424 |                                         tst_resm(TFAIL | TERRNO,
|       |                                         ^~~~~~~~
| ftest05.c: In function 'setup':
| ftest05.c:133:9: warning: ignoring return value of 'getcwd' declared with attribute 'warn_unused_result' [-Wunused-result]
|   133 |         getcwd(homedir, sizeof(homedir));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ftest05.c: In function 'runtest':
| ftest05.c:212:9: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   212 |         chdir(homedir);
|       |         ^~~~~~~~~~~~~~
| ftest05.c: In function 'dotest':
| ftest05.c:317:17: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|   317 |                 ftruncate(fd, 0);
|       |                 ^~~~~~~~~~~~~~~~
| In file included from ftest07.c:72:
| ftest07.c: In function 'dotest':
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest07.c:432:49: note: in expansion of macro 'tst_resm'
|   432 |                                                 tst_resm(TINFO,
|       |                                                 ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest07.c:470:49: note: in expansion of macro 'tst_resm'
|   470 |                                                 tst_resm(TINFO,
|       |                                                 ^~~~~~~~
| ftest07.c: In function 'domisc':
| ftest07.c:590:32: warning: comparison of integer expressions of different signedness: '__off_t' {aka 'long int'} and 'long long unsigned int' [-Wsign-compare]
|   590 |                 if (sb.st_size != file_max) {
|       |                                ^~
| ftest07.c: In function 'runtest':
| ftest07.c:232:9: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   232 |         chdir(homedir);
|       |         ^~~~~~~~~~~~~~
| ftest07.c: In function 'dotest':
| ftest07.c:371:17: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|   371 |                 ftruncate(fd, 0);
|       |                 ^~~~~~~~~~~~~~~~
| ftest04.c: In function 'setup':
| ftest04.c:136:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   136 |         if (sigset(SIGTERM, term) == SIG_ERR) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/param.h:28,
|                  from ftest04.c:42:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| In file included from ftest04.c:50:
| ftest04.c: In function 'dotest':
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest04.c:356:49: note: in expansion of macro 'tst_resm'
|   356 |                                                 tst_resm(TINFO,
|       |                                                 ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest04.c:385:49: note: in expansion of macro 'tst_resm'
|   385 |                                                 tst_resm(TINFO,
|       |                                                 ^~~~~~~~
| ftest02.c: In function 'main':
| ftest02.c:197:9: warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
|   197 |         chdir(startdir);
|       |         ^~~~~~~~~~~~~~~
| ftest08.c: In function 'init':
| ftest08.c:141:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   141 |         if (sigset(SIGTERM, term) == SIG_ERR) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/sys/param.h:28,
|                  from ftest08.c:47:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| In file included from ftest08.c:57:
| ftest08.c: In function 'dotest':
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest08.c:371:49: note: in expansion of macro 'tst_resm'
|   371 |                                                 tst_resm(TINFO,
|       |                                                 ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type '__off_t' {aka 'long int'} [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| ftest08.c:402:49: note: in expansion of macro 'tst_resm'
|   402 |                                                 tst_resm(TINFO,
|       |                                                 ^~~~~~~~
| ftest06.c: In function 'main':
| ftest06.c:141:29: warning: '/ftest06.' directive output may be truncated writing 9 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   141 |                          "%s/ftest06.%d", cwd, getpid());
|       |                             ^~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from ftest06.c:50:
| In function 'snprintf',
|     inlined from 'main' at ftest06.c:140:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:10: note: '__builtin___snprintf_chk' output between 11 and 4116 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/ftest/ftest02
| CC testcases/kernel/fs/ftest/ftest03
| CC testcases/kernel/fs/ftest/ftest05
| CC testcases/kernel/fs/ftest/ftest06
| CC testcases/kernel/fs/ftest/ftest01
| CC testcases/kernel/fs/ftest/ftest04
| CC testcases/kernel/fs/ftest/ftest07
| CC testcases/kernel/fs/ftest/ftest08
| inode01.c: In function 'main':
| inode01.c:122:29: warning: cast between incompatible function types from 'int (*)()' to 'void (*)()' [-Wcast-function-type]
|   122 |         if (signal(SIGTERM, (void (*)())term) == SIG_ERR) {
|       |                             ^
| inode01.c:161:36: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
|   161 |         if (snp_ret < 0 || snp_ret >= sizeof(path_list_string)) {
|       |                                    ^~
| inode01.c: In function 'generate':
| inode01.c:330:52: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
|   330 |                         if (snp_ret < 0 || snp_ret >= sizeof(new_string)) {
|       |                                                    ^~
| inode02.c: In function 'main':
| inode02.c:124:29: warning: cast between incompatible function types from 'int (*)()' to 'void (*)()' [-Wcast-function-type]
|   124 |         if (sigset(SIGTERM, (void (*)())term) == SIG_ERR) {
|       |                             ^
| inode02.c: In function 'tree':
| inode02.c:285:36: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
|   285 |         if (snp_ret < 0 || snp_ret >= sizeof(path_list_string)) {
|       |                                    ^~
| inode02.c: In function 'generate':
| inode02.c:427:52: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
|   427 |                         if (snp_ret < 0 || snp_ret >= sizeof(new_string)) {
|       |                                                    ^~
| CC testcases/kernel/fs/inode/inode01
| CC testcases/kernel/fs/inode/inode02
| make[4]: Nothing to be done for 'all'.
| CC testcases/kernel/fs/lftest/lftest
| make[4]: Nothing to be done for 'all'.
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/stdio.h:894,
|                  from openfile.c:33:
| In function 'sprintf',
|     inlined from 'main' at openfile.c:115:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: warning: '__builtin___sprintf_chk' argument 5 overlaps destination object 'msg' [-Wrestrict]
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| openfile.c: In function 'main':
| openfile.c:82:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
|    82 |         char msg[80] = "";
|       |              ^~~
| In function 'sprintf',
|     inlined from 'main' at openfile.c:116:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: warning: '__builtin___sprintf_chk' argument 5 overlaps destination object 'msg' [-Wrestrict]
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| openfile.c: In function 'main':
| openfile.c:82:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
|    82 |         char msg[80] = "";
|       |              ^~~
| In function 'sprintf',
|     inlined from 'main' at openfile.c:122:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: warning: '__builtin___sprintf_chk' argument 5 overlaps destination object 'msg' [-Wrestrict]
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| openfile.c: In function 'main':
| openfile.c:82:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
|    82 |         char msg[80] = "";
|       |              ^~~
| In function 'sprintf',
|     inlined from 'main' at openfile.c:123:3:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:10: warning: '__builtin___sprintf_chk' argument 5 overlaps destination object 'msg' [-Wrestrict]
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| openfile.c: In function 'main':
| openfile.c:82:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
|    82 |         char msg[80] = "";
|       |              ^~~
| CC testcases/kernel/fs/openfile/openfile
| CC testcases/kernel/fs/proc/proc01
| make[4]: Nothing to be done for 'all'.
| make[4]: Nothing to be done for 'all'.
| In file included from ../../../../include/tst_test.h:33,
|                  from read_all.c:46:
| read_all.c: In function 'sanitize_str':
| ../../../../include/tst_minmax.h:12:21: warning: comparison of distinct pointer types lacks a cast
|    12 |         (void) (&_a == &_b); \
|       |                     ^~
| read_all.c:164:25: note: in expansion of macro 'MIN'
|   164 |         for (i = 0; i < MIN(count, MAX_DISPLAY); i++)
|       |                         ^~~
| read_all.c: In function 'setup':
| ../../../../include/tst_minmax.h:21:21: warning: comparison of distinct pointer types lacks a cast
|    21 |         (void) (&_a == &_b); \
|       |                     ^~
| ../../../../include/tst_minmax.h:10:16: note: in definition of macro 'MIN'
|    10 |         typeof(a) _a = (a); \
|       |                ^
| read_all.c:369:36: note: in expansion of macro 'MAX'
|   369 |                 worker_count = MIN(MAX(tst_ncpus() - 1, 1), max_workers);
|       |                                    ^~~
| ../../../../include/tst_minmax.h:21:21: warning: comparison of distinct pointer types lacks a cast
|    21 |         (void) (&_a == &_b); \
|       |                     ^~
| ../../../../include/tst_minmax.h:10:25: note: in definition of macro 'MIN'
|    10 |         typeof(a) _a = (a); \
|       |                         ^
| read_all.c:369:36: note: in expansion of macro 'MAX'
|   369 |                 worker_count = MIN(MAX(tst_ncpus() - 1, 1), max_workers);
|       |                                    ^~~
| CC testcases/kernel/fs/read_all/read_all
| CC testcases/kernel/fs/squashfs/squashfs01
| stream01.c: In function 'main':
| stream01.c:90:25: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|    90 |                         fread(buf, 1, 1, stream);
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~
| stream01.c:104:25: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   104 |                         fread(buf, 1, 1, stream);
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~
| stream03.c: In function 'main':
| stream03.c:94:25: warning: comparison of integer expressions of different signedness: 'long int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|    94 |                 if (pos != strlen(junk)) {
|       |                         ^~
| stream03.c:120:25: warning: comparison of integer expressions of different signedness: 'long int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   120 |                 if (pos != strlen(junk)) {
|       |                         ^~
| stream03.c:135:25: warning: comparison of integer expressions of different signedness: 'long int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   135 |                 if (pos != strlen(junk)) {
|       |                         ^~
| stream03.c:163:25: warning: comparison of integer expressions of different signedness: 'long int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   163 |                 if (pos != strlen(junk)) {
|       |                         ^~
| stream03.c:207:26: warning: comparison of integer expressions of different signedness: 'off_t' {aka 'long int'} and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   207 |                 if (opos != strlen(junk)) {
|       |                          ^~
| stream03.c:233:26: warning: comparison of integer expressions of different signedness: 'off_t' {aka 'long int'} and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   233 |                 if (opos != strlen(junk)) {
|       |                          ^~
| stream03.c:248:26: warning: comparison of integer expressions of different signedness: 'off_t' {aka 'long int'} and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   248 |                 if (opos != strlen(junk)) {
|       |                          ^~
| stream03.c:277:26: warning: comparison of integer expressions of different signedness: 'off_t' {aka 'long int'} and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   277 |                 if (opos != strlen(junk)) {
|       |                          ^~
| In file included from stream04.c:38:
| stream04.c: In function 'main':
| ../../../../include/old/test.h:123:19: warning: format '%zi' expects argument of type 'signed size_t', but argument 6 has type 'int' [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| stream04.c:87:25: note: in expansion of macro 'tst_resm'
|    87 |                         tst_resm(TFAIL,
|       |                         ^~~~~~~~
| ../../../../include/old/test.h:123:19: warning: format '%zi' expects argument of type 'signed size_t', but argument 6 has type 'int' [-Wformat=]
|   123 |                   (arg_fmt), ##__VA_ARGS__)
|       |                   ^~~~~~~~~
| stream04.c:108:25: note: in expansion of macro 'tst_resm'
|   108 |                         tst_resm(TFAIL,
|       |                         ^~~~~~~~
| stream05.c: In function 'main':
| stream05.c:146:17: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   146 |                 fread(buf, 1, 2, stream);       /* read to EOF */
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/fs/stream/stream01
| CC testcases/kernel/fs/stream/stream03
| CC testcases/kernel/fs/stream/stream04
| CC testcases/kernel/fs/stream/stream02
| CC testcases/kernel/fs/stream/stream05
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC testcases/kernel/hotplug/memory_hotplug/segment.o
| CC testcases/kernel/hotplug/memory_hotplug/commands.o
| CC testcases/kernel/hotplug/memory_hotplug/memtoy.o
| LD testcases/kernel/hotplug/memory_hotplug/memtoy
| CC testcases/kernel/input/input_helper.o
| CC testcases/kernel/input/input01
| CC testcases/kernel/input/input02
| CC testcases/kernel/input/input03
| CC testcases/kernel/input/input05
| CC testcases/kernel/input/input04
| CC testcases/kernel/input/input06
| CC testcases/kernel/io/aio/aio02
| CC testcases/kernel/io/aio/aio01
| CC testcases/kernel/io/direct_io/diotest_routines.o
| diotest2.c: In function 'runtest':
| diotest2.c:81:63: warning: unused parameter 'action' [-Wunused-parameter]
|    81 | int runtest(int fd_r, int fd_w, int iter, off64_t offset, int action)
|       |                                                           ~~~~^~~~~~
| diotest4.c: In function 'runtest_f':
| diotest4.c:97:69: warning: unused parameter 'testnum' [-Wunused-parameter]
|    97 | runtest_f(int fd, char *buf, int offset, int count, int errnum, int testnum,
|       |                                                                 ~~~~^~~~~~~
| diotest4.c: In function 'runtest_s':
| diotest4.c:139:61: warning: unused parameter 'testnum' [-Wunused-parameter]
|   139 | int runtest_s(int fd, char *buf, int offset, int count, int testnum, char *msg)
|       |                                                         ~~~~^~~~~~~
| diotest5.c: In function 'runtest':
| diotest5.c:85:63: warning: unused parameter 'action' [-Wunused-parameter]
|    85 | int runtest(int fd_r, int fd_w, int iter, off64_t offset, int action)
|       |                                                           ~~~~^~~~~~
| CC testcases/kernel/io/direct_io/diotest1
| CC testcases/kernel/io/direct_io/diotest2
| CC testcases/kernel/io/direct_io/diotest5
| CC testcases/kernel/io/direct_io/diotest6
| CC testcases/kernel/io/direct_io/diotest3
| CC testcases/kernel/io/direct_io/diotest4
| CC testcases/kernel/io/direct_io/dma_thread_diotest
| aiocp.c: In function 'wr_done':
| aiocp.c:230:17: warning: comparison of integer expressions of different signedness: 'long int' and 'long unsigned int' [-Wsign-compare]
|   230 |         if (res != iocb->u.c.nbytes) {
|       |                 ^~
| aiocp.c:225:34: warning: unused parameter 'ctx' [-Wunused-parameter]
|   225 | static void wr_done(io_context_t ctx, struct iocb *iocb, long res, long res2)
|       |                     ~~~~~~~~~~~~~^~~
| aiocp.c: In function 'scale_by_kmg':
| aiocp.c:305:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   305 |                 value *= 1024;
|       |                 ~~~~~~^~~~~~~
| aiocp.c:306:9: note: here
|   306 |         case 'm':
|       |         ^~~~
| aiocp.c:308:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   308 |                 value *= 1024;
|       |                 ~~~~~~^~~~~~~
| aiocp.c:309:9: note: here
|   309 |         case 'k':
|       |         ^~~~
| aiocp.c: In function 'rd_done':
| aiocp.c:278:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   278 |                 write(2, "r", 1);
|       |                 ^~~~~~~~~~~~~~~~
| aiocp.c: In function 'wr_done':
| aiocp.c:239:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   239 |                 write(2, "w", 1);
|       |                 ^~~~~~~~~~~~~~~~
| aio-stress.c: In function 'create_oper':
| aio-stress.c:683:63: warning: unused parameter 'iter' [-Wunused-parameter]
|   683 |                                    int reclen, int depth, int iter,
|       |                                                           ~~~~^~~~
| aio-stress.c: In function 'drop_shm':
| aio-stress.c:923:6: warning: old-style function definition [-Wold-style-definition]
|   923 | void drop_shm()
|       |      ^~~~~~~~
| aio-stress.c: In function 'setup_shared_mem':
| aio-stress.c:1012:38: warning: unused parameter 'max_io_submit' [-Wunused-parameter]
|  1012 |                      int reclen, int max_io_submit)
|       |                                  ~~~~^~~~~~~~~~~~~
| aio-stress.c: In function 'run_workers':
| aio-stress.c:1244:53: warning: cast between incompatible function types from 'int (*)(struct thread_info *)' to 'void * (*)(void *)' [-Wcast-function-type]
|  1244 |                     pthread_create(&t[i].tid, NULL, (start_routine) worker,
|       |                                                     ^
| aio-stress.c: In function 'setup_shared_mem':
| aio-stress.c:1053:17: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1053 |                 ftruncate(fd, total_ram);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| aio-stress.c: In function 'restart_oper':
| aio-stress.c:812:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   812 |                 if (stages & (1 << READ))
|       |                    ^
| aio-stress.c:814:9: note: here
|   814 |         case READ:
|       |         ^~~~
| aio-stress.c:815:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   815 |                 if (!new_rw && stages & (1 << RWRITE))
|       |                    ^
| aio-stress.c:817:9: note: here
|   817 |         case RWRITE:
|       |         ^~~~
| aio-stress.c: In function 'main':
| aio-stress.c:1365:40: warning: this statement may fall through [-Wimplicit-fallthrough=]
|  1365 |                         context_offset = parse_size(optarg, 1024 * 1024);
|       |                         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| aio-stress.c:1366:17: note: here
|  1366 |                 case 'b':
|       |                 ^~~~
| dirty.c: In function 'main':
| dirty.c:52:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    52 |                 write(fd, buf, sizeof(buf));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/io/ltp-aiodio/dirty
| CC testcases/kernel/io/ltp-aiodio/aiodio_append
| CC testcases/kernel/io/ltp-aiodio/aiocp
| CC testcases/kernel/io/ltp-aiodio/dio_append
| CC testcases/kernel/io/ltp-aiodio/aiodio_sparse
| CC testcases/kernel/io/ltp-aiodio/dio_truncate
| CC testcases/kernel/io/ltp-aiodio/dio_read
| CC testcases/kernel/io/ltp-aiodio/dio_sparse
| CC testcases/kernel/io/ltp-aiodio/aio-stress
| writetest.c: In function 'setup':
| writetest.c:212:6: warning: old-style function definition [-Wold-style-definition]
|   212 | void setup()
|       |      ^~~~~
| writetest.c: In function 'parse_args':
| writetest.c:196:25: warning: '__builtin_strncpy' specified bound 1024 equals destination size [-Wstringop-truncation]
|   196 |                         strncpy(Filename, optarg, MAX_FILENAME_LEN);
|       |                         ^
| CC testcases/kernel/io/writetest/writetest
| pipeio.c: In function 'sig_child':
| pipeio.c:852:27: warning: unused parameter 'sig' [-Wunused-parameter]
|   852 | static void sig_child(int sig)
|       |                       ~~~~^~~
| CC testcases/kernel/ipc/pipeio/pipeio
| sem01.c: In function 'delayloop':
| sem01.c:77:6: warning: old-style function definition [-Wold-style-definition]
|    77 | void delayloop()
|       |      ^~~~~~~~~
| sem02.c: In function 'main':
| sem02.c:74:16: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
|    74 |         int i, rc;
|       |                ^~
| sem02.c: In function 'waiter':
| sem02.c:123:20: warning: unused parameter 'foo' [-Wunused-parameter]
|   123 | void *waiter(void *foo)
|       |              ~~~~~~^~~
| sem02.c: In function 'poster':
| sem02.c:142:20: warning: unused parameter 'foo' [-Wunused-parameter]
|   142 | void *poster(void *foo)
|       |              ~~~~~~^~~
| CC testcases/kernel/ipc/semaphore/sem01
| CC testcases/kernel/ipc/semaphore/sem02
| CC testcases/kernel/irq/irqbalance01
| cc1: warning: SSE instruction set disabled, using 387 arithmetics
| cc1: warning: SSE instruction set disabled, using 387 arithmetics
| AS testcases/kernel/kvm/bootstrap_x86_64.o
| CC testcases/kernel/kvm/lib_x86.o
| CC testcases/kernel/kvm/lib_guest.o
| cc1: warning: SSE instruction set disabled, using 387 arithmetics
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.1.0/ld: /tmp/ccJCf0GD.o: in function `handle_page_fault':
| kvm_pagefault01.c:(.text+0x5d): undefined reference to `__stack_chk_fail'
| collect2: error: ld returned 1 exit status
| make[3]: *** [/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases/kernel/kvm/Makefile:55: kvm_pagefault01-payload.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| CC testcases/kernel/kvm/lib_host.o
| make[2]: *** [../../include/mk/generic_trunk_target.inc:108: all] Error 2
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/git/testcases'
| make[1]: *** [../include/mk/generic_trunk_target.inc:108: all] Error 2
| make: *** [Makefile:106: testcases-all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/temp/run.do_compile.2255591:178 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/temp/run.do_compile.2255591, line 178
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/temp/run.do_compile.2255591, line 162
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/temp/run.do_compile.2255591, line 157
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/temp/run.do_compile.2255591, line 152
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/temp/run.do_compile.2255591, line 191
NOTE: recipe ltp-20220527-r0: task do_compile: Failed
NOTE: recipe gnutls-3.7.5-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.15.38+gitAUTOINC+37891dc371_cc9695f5fd-r0: task do_compile: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2250 tasks of which 1877 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ltp-20220527-r0 do_compile: oe_runmake failed
ERROR: ltp-20220527-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/temp/run.do_compile.2255591', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ltp/20220527-r0/temp/log.do_compile.2255591
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20220527.bb:do_compile) failed with exit code '1'

--===============6621191244740866571==--

