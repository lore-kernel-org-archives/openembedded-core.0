Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E36C43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 14:02:24 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.6516.1658584934456716954
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YPWBq/QD;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id g1so5511632qki.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=93ZorR1iRaHsB4aeoVm4mmanHpGnF8sicXyS1hD6b8I=;
        b=YPWBq/QDrhh1oq3nDVaqmBKM4sGk1jbyNpdhlSOee/4lNwAk4PC1U+3L46R37BIjkE
         6+HUlrxt8gLeDyhPM9avDNPHsJTMhjKfkf8xEazwOK3HAbsYAytRq6mnZTPnR5DT0Atc
         IF023VU/xiRhoO13hep08XdHhinhQ0DsALvDCMjQ1JVeRXlnM3wEsU2v2dEi609Jm9r7
         zpIfknq8fZYixwXbRoONkgLVimvlVGHo459f+uslQBQHZ9u0pLyhuPW6h7df67q/aYCi
         m4NtViuF0IWPMDEizXDP8+vJ+jDxkiZeYsWoM7n0gHx0pSfc2OdOJGn80P5D+dGgX6DH
         309A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=93ZorR1iRaHsB4aeoVm4mmanHpGnF8sicXyS1hD6b8I=;
        b=pK15t6xXzdePyyryzNV2U59zMzkBQSlG/XFkUfsgRnlJ1AIsV0xM6PvFlNeTyHTl+8
         Uax3060z1X7KWuATXBoMBP2odmRuhFRLdoHKLnO31IRtOmv+oLGjgalbfG4OVFV6bLei
         B9as92qTGXdTY/Qnti73Aj9W/4GAsrudAVYtoI/exboXonyA4bVhoMSXgmrfTVOVtumR
         eO/cFHVLW3ZKISq/xCq79CZxhVuyfRKCN7+kJ+swzjuLm6p/aupxZJUjoKHDdCK9rLBu
         uVyMPxY4nRJJFvzdSXMi9N9+dULFAOm7I6EZkkiKUVJeidw2woqL0qSc1XLLsninp+jX
         KY3w==
X-Gm-Message-State: AJIora/ETkMv07D1oBhnpH2w0Ep+cZmPXgDH3QBobM8o3lI+Rx4yCmLC
	mYHf3zSXV/E0L/vBuQkn2hP7D7f4JGRLDmpB03I=
X-Google-Smtp-Source: 
 AGRyM1tuQQW+4Njc2YK4IZY0Ph0mqPyBvtarTS+2Lk2dScsSh9uv2Uh9xZTwrrgRpw0sGrub9PP9/cH+W5RRTGjvl3c=
X-Received: by 2002:a05:620a:17a3:b0:6b5:fc1e:40e1 with SMTP id
 ay35-20020a05620a17a300b006b5fc1e40e1mr3354016qkb.227.1658584933253; Sat, 23
 Jul 2022 07:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220723132409.61635-1-pevik@seznam.cz>
In-Reply-To: <20220723132409.61635-1-pevik@seznam.cz>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Jul 2022 10:01:47 -0400
Message-ID: 
 <CAMKF1soaJ_4v0WDQj+wGvnr8-QDOYHwsGXQUBdU7osHpEVwFUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Add post release runtime fixes
To: Petr Vorel <pevik@seznam.cz>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Petr Vorel <petr.vorel@gmail.com>,
 =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 14:02:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168439

Hi Petr

On Sat, Jul 23, 2022 at 9:24 AM Petr Vorel <pevik@seznam.cz> wrote:
>
> From: Petr Vorel <petr.vorel@gmail.com>
>
> Backport various post 20220527 release runtime fixes:
> * The concept of max runtime
> * tst_test.sh: Cleanup getopts usage
> * mountns0[1-3]: wait for umount completed in thread_b
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi Richard, Daniel,
>
> could you please test this patchset?
>
> Kind regards,
> Petr
>
>  ...-Fix-usage-of-PAGESIZE-from-memcg_li.patch | 121 ++++++++++++++
>  ...ait-for-umount-completed-in-thread_b.patch |  63 +++++++
>  ...x-usage-of-variables-from-tst_net.sh.patch | 154 ++++++++++++++++++
>  ...0001-netstress-Restore-runtime-to-5m.patch |  53 ++++++
>  ...fs05_make_tree-Restore-5-min-timeout.patch |  31 ++++
>  ...igrate_pages03-restore-runtime-to-5m.patch |  44 +++++
>  6 files changed, 466 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch

These patches don't seem to be added to SRC_URI as I don't see the
recipe changes in this patch.
we use a commit in SRCREV, I wonder if it makes sense to just bump that

>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch b/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
> new file mode 100644
> index 0000000000..6cc36cda79
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
> @@ -0,0 +1,121 @@
> +From bda92ad659a52d38ac810099f69adff626b064c6 Mon Sep 17 00:00:00 2001
> +From: Joerg Vehlow <joerg.vehlow@aox.de>
> +Date: Mon, 27 Jun 2022 10:44:49 +0200
> +Subject: [PATCH] memcg/functional: Fix usage of PAGESIZE from memcg_lib.sh
> +
> +$PAGESIZES is set in memcg_lib.sh, which was moved to the bottom of the file.
> +
> +Fixes: 04021637f ("tst_test.sh: Cleanup getopts usage")
> +
> +Reviewed-by: Petr Vorel <pvorel@suse.cz>
> +Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
> +[ upstream status: bda92ad659a52d38ac810099f69adff626b064c6 ]
> +---
> + .../controllers/memcg/functional/memcg_failcnt.sh      |  7 ++++---
> + .../memcg/functional/memcg_max_usage_in_bytes_test.sh  | 10 +++++-----
> + .../memcg/functional/memcg_subgroup_charge.sh          |  8 ++++----
> + .../memcg/functional/memcg_usage_in_bytes_test.sh      | 10 +++++-----
> + 4 files changed, 18 insertions(+), 17 deletions(-)
> +
> +diff --git a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
> +index 1fed01569..1be98a056 100755
> +--- a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
> ++++ b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
> +@@ -12,9 +12,6 @@ MEMCG_TESTFUNC=test
> + MEMCG_SHMMAX=1
> + TST_TEST_DATA="--mmap-anon --mmap-file --shm"
> +
> +-MEMORY_LIMIT=$PAGESIZE
> +-MEMORY_TO_ALLOCATE=$((MEMORY_LIMIT * 2))
> +-
> + test()
> + {
> +       ROD echo $MEMORY_LIMIT \> memory.limit_in_bytes
> +@@ -36,4 +33,8 @@ test()
> + }
> +
> + . memcg_lib.sh
> ++
> ++MEMORY_LIMIT=$PAGESIZE
> ++MEMORY_TO_ALLOCATE=$((MEMORY_LIMIT * 2))
> ++
> + tst_run
> +diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
> +index d1ffbe053..302810513 100755
> +--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
> ++++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
> +@@ -9,11 +9,6 @@
> + MEMCG_TESTFUNC=test
> + TST_CNT=4
> +
> +-
> +-MEM_TO_ALLOC=$((PAGESIZE * 1024))
> +-MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
> +-MEM_LIMIT=$((MEM_TO_ALLOC * 2))
> +-
> + # Run test cases which checks memory.[memsw.]max_usage_in_bytes after make
> + # some memory allocation
> + test_max_usage_in_bytes()
> +@@ -88,4 +83,9 @@ test4()
> + }
> +
> + . memcg_lib.sh
> ++
> ++MEM_TO_ALLOC=$((PAGESIZE * 1024))
> ++MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
> ++MEM_LIMIT=$((MEM_TO_ALLOC * 2))
> ++
> + tst_run
> +diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> +index 08b6697d4..9bcc01258 100755
> +--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> ++++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> +@@ -12,10 +12,6 @@
> + MEMCG_TESTFUNC=test
> + TST_CNT=3
> +
> +-
> +-# Allocate memory bigger than per-cpu kernel memory
> +-MEM_TO_ALLOC=$((PAGESIZES * 2))
> +-
> + # Test the memory charge won't move to subgroup
> + # $1 - memory.limit_in_bytes in sub group
> + test_subgroup()
> +@@ -67,4 +63,8 @@ test3()
> + }
> +
> + . memcg_lib.sh
> ++
> ++# Allocate memory bigger than per-cpu kernel memory
> ++MEM_TO_ALLOC=$((PAGESIZES * 2))
> ++
> + tst_run
> +diff --git a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
> +index 6f932124e..125d88e55 100755
> +--- a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
> ++++ b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
> +@@ -9,11 +9,6 @@
> + MEMCG_TESTFUNC=test
> + TST_CNT=2
> +
> +-
> +-MEM_TO_ALLOC=$((PAGESIZE * 1024))
> +-MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
> +-MEM_LIMIT=$((MEM_TO_ALLOC * 2))
> +-
> + test1()
> + {
> +       tst_res TINFO "Test memory.usage_in_bytes"
> +@@ -35,4 +30,9 @@ test2()
> + }
> +
> + . memcg_lib.sh
> ++
> ++MEM_TO_ALLOC=$((PAGESIZE * 1024))
> ++MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
> ++MEM_LIMIT=$((MEM_TO_ALLOC * 2))
> ++
> + tst_run
> +--
> +2.37.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch b/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
> new file mode 100644
> index 0000000000..73904806fd
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
> @@ -0,0 +1,63 @@
> +From 6d4c8343d33e7d8fa059246310413f029a9e8573 Mon Sep 17 00:00:00 2001
> +From: Li Wang <liwang@redhat.com>
> +Date: Thu, 7 Jul 2022 17:38:45 +0800
> +Subject: [PATCH] mountns0[1-3]: wait for umount completed in thread_b
> +
> +To get rid of race condition (occurs with umount_folders):
> +
> +    mountns01.c:42: TPASS: shared mount in parent passed
> +    mountns01.c:83: TPASS: shared mount in child passed
> +    tst_device.c:394: TWARN: umount('B') failed with EINVAL
> +    mountns.h:39: TWARN: umount(B) failed: EINVAL (22)
> +
> +Signed-off-by: Li Wang <liwang@redhat.com>
> +Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> +[ upstream status: 6d4c8343d33e7d8fa059246310413f029a9e8573 ]
> +---
> + testcases/kernel/containers/mountns/mountns01.c | 2 ++
> + testcases/kernel/containers/mountns/mountns02.c | 2 ++
> + testcases/kernel/containers/mountns/mountns03.c | 2 ++
> + 3 files changed, 6 insertions(+)
> +
> +diff --git a/testcases/kernel/containers/mountns/mountns01.c b/testcases/kernel/containers/mountns/mountns01.c
> +index e99134aba..e8f176920 100644
> +--- a/testcases/kernel/containers/mountns/mountns01.c
> ++++ b/testcases/kernel/containers/mountns/mountns01.c
> +@@ -86,6 +86,8 @@ static void run(void)
> +
> +       TST_CHECKPOINT_WAKE(0);
> +
> ++      SAFE_WAIT(NULL);
> ++
> +       SAFE_UMOUNT(DIRA);
> + }
> +
> +diff --git a/testcases/kernel/containers/mountns/mountns02.c b/testcases/kernel/containers/mountns/mountns02.c
> +index 258b61217..4b85fa79b 100644
> +--- a/testcases/kernel/containers/mountns/mountns02.c
> ++++ b/testcases/kernel/containers/mountns/mountns02.c
> +@@ -87,6 +87,8 @@ static void run(void)
> +
> +       TST_CHECKPOINT_WAKE(0);
> +
> ++      SAFE_WAIT(NULL);
> ++
> +       SAFE_UMOUNT(DIRA);
> + }
> +
> +diff --git a/testcases/kernel/containers/mountns/mountns03.c b/testcases/kernel/containers/mountns/mountns03.c
> +index f37ae7902..1d26a25d8 100644
> +--- a/testcases/kernel/containers/mountns/mountns03.c
> ++++ b/testcases/kernel/containers/mountns/mountns03.c
> +@@ -97,6 +97,8 @@ static void run(void)
> +
> +       TST_CHECKPOINT_WAKE(0);
> +
> ++      SAFE_WAIT(NULL);
> ++
> +       SAFE_UMOUNT(DIRA);
> + }
> +
> +--
> +2.37.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch b/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
> new file mode 100644
> index 0000000000..ba187366ff
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
> @@ -0,0 +1,154 @@
> +From 33c156e295e35d4839a135d8ba5db485b7712ced Mon Sep 17 00:00:00 2001
> +From: Joerg Vehlow <joerg.vehlow@aox.de>
> +Date: Mon, 27 Jun 2022 09:27:09 +0200
> +Subject: [PATCH] net_stress: Fix usage of variables from tst_net.sh
> +
> +These tests use variables (NS_TIMES, IP_TOTAL, ROUTE_TOTAL
> +and IF_UPDOWN_TIMES) from tst_net.sh, before sourcing it.
> +
> +Fixes: 04021637f ("tst_test.sh: Cleanup getopts usage")
> +
> +Reviewed-by: Petr Vorel <pvorel@suse.cz>
> +Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
> +[ upstream status: 33c156e295e35d4839a135d8ba5db485b7712ced ]
> +---
> + testcases/network/stress/interface/if-addr-adddel.sh    | 7 ++++---
> + testcases/network/stress/interface/if-addr-addlarge.sh  | 7 ++++---
> + testcases/network/stress/interface/if-route-adddel.sh   | 5 +++--
> + testcases/network/stress/interface/if-route-addlarge.sh | 5 +++--
> + testcases/network/stress/interface/if-updown.sh         | 5 +++--
> + testcases/network/stress/interface/if4-addr-change.sh   | 4 +++-
> + 6 files changed, 20 insertions(+), 13 deletions(-)
> +
> +diff --git a/testcases/network/stress/interface/if-addr-adddel.sh b/testcases/network/stress/interface/if-addr-adddel.sh
> +index cb453e612..0750501f0 100755
> +--- a/testcases/network/stress/interface/if-addr-adddel.sh
> ++++ b/testcases/network/stress/interface/if-addr-adddel.sh
> +@@ -7,9 +7,6 @@
> +
> + IF_CMD='ifconfig'
> +
> +-# The interval of the check interface activity
> +-CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
> +-
> + test_body()
> + {
> +       local cmd="$CMD"
> +@@ -89,4 +86,8 @@ test_body()
> + }
> +
> + . if-lib.sh
> ++
> ++# The interval of the check interface activity
> ++CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
> ++
> + tst_run
> +diff --git a/testcases/network/stress/interface/if-addr-addlarge.sh b/testcases/network/stress/interface/if-addr-addlarge.sh
> +index 3c876c17d..d0759c86b 100755
> +--- a/testcases/network/stress/interface/if-addr-addlarge.sh
> ++++ b/testcases/network/stress/interface/if-addr-addlarge.sh
> +@@ -7,9 +7,6 @@
> +
> + IF_CMD='ifconfig'
> +
> +-# The interval of the check interface activity
> +-CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IP_TOTAL / 20))}
> +-
> + test_body()
> + {
> +       local cmd="$CMD"
> +@@ -110,4 +107,8 @@ test_body()
> + }
> +
> + . if-lib.sh
> ++
> ++# The interval of the check interface activity
> ++CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IP_TOTAL / 20))}
> ++
> + tst_run
> +diff --git a/testcases/network/stress/interface/if-route-adddel.sh b/testcases/network/stress/interface/if-route-adddel.sh
> +index b50da268a..51445e4f7 100755
> +--- a/testcases/network/stress/interface/if-route-adddel.sh
> ++++ b/testcases/network/stress/interface/if-route-adddel.sh
> +@@ -7,8 +7,6 @@
> +
> + IF_CMD='route'
> +
> +-CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
> +-
> + test_body()
> + {
> +       local cmd="$CMD"
> +@@ -64,4 +62,7 @@ test_body()
> + }
> +
> + . if-lib.sh
> ++
> ++CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
> ++
> + tst_run
> +diff --git a/testcases/network/stress/interface/if-route-addlarge.sh b/testcases/network/stress/interface/if-route-addlarge.sh
> +index 7d09d1216..355b6b4ab 100755
> +--- a/testcases/network/stress/interface/if-route-addlarge.sh
> ++++ b/testcases/network/stress/interface/if-route-addlarge.sh
> +@@ -7,8 +7,6 @@
> +
> + IF_CMD='route'
> +
> +-CHECK_INTERVAL=${CHECK_INTERVAL:-$(($ROUTE_TOTAL / 20))}
> +-
> + test_body()
> + {
> +       local cmd="$CMD"
> +@@ -76,4 +74,7 @@ test_body()
> + }
> +
> + . if-lib.sh
> ++
> ++CHECK_INTERVAL=${CHECK_INTERVAL:-$(($ROUTE_TOTAL / 20))}
> ++
> + tst_run
> +diff --git a/testcases/network/stress/interface/if-updown.sh b/testcases/network/stress/interface/if-updown.sh
> +index 9a5709c85..71c78d785 100755
> +--- a/testcases/network/stress/interface/if-updown.sh
> ++++ b/testcases/network/stress/interface/if-updown.sh
> +@@ -8,8 +8,6 @@
> + IF_CMD='ifconfig'
> + TST_CLEANUP="if_cleanup_restore"
> +
> +-CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IF_UPDOWN_TIMES / 20))}
> +-
> + test_body()
> + {
> +       local cmd="$CMD"
> +@@ -47,4 +45,7 @@ test_body()
> + }
> +
> + . if-lib.sh
> ++
> ++CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IF_UPDOWN_TIMES / 20))}
> ++
> + tst_run
> +diff --git a/testcases/network/stress/interface/if4-addr-change.sh b/testcases/network/stress/interface/if4-addr-change.sh
> +index b9ece2af9..f162e6a51 100755
> +--- a/testcases/network/stress/interface/if4-addr-change.sh
> ++++ b/testcases/network/stress/interface/if4-addr-change.sh
> +@@ -9,7 +9,6 @@ TST_CLEANUP="do_cleanup"
> + TST_TESTFUNC="test_body"
> + TST_NEEDS_CMDS="ifconfig"
> +
> +-CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
> + # Maximum host portion of the IPv4 address on the local host
> + LHOST_IPV4_HOST_MAX="254"
> +
> +@@ -61,4 +60,7 @@ test_body()
> + }
> +
> + . tst_net.sh
> ++
> ++CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
> ++
> + tst_run
> +--
> +2.37.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch b/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
> new file mode 100644
> index 0000000000..acaccf1e1f
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
> @@ -0,0 +1,53 @@
> +From cc4a27c235d0cf69a55cd8829b232566b0223333 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Wed, 13 Jul 2022 09:46:14 +0200
> +Subject: [PATCH] netstress: Restore runtime to 5m
> +
> +netstress requires the previous default timeout 5m due longer timeout
> +for higher message sizes (e.g. 65535):
> +
> +./sctp_ipsec.sh -6 -p comp -m transport -s 100:1000:65535:R65535
> +sctp_ipsec 1 TPASS: netstress passed, median time 5 ms, data: 5 9 6 5 5
> +sctp_ipsec 2 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
> +sctp_ipsec 2 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n 1000 -N 1000 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
> +sctp_ipsec 2 TPASS: netstress passed, median time 6 ms, data: 8 6 6 5 6
> +sctp_ipsec 3 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
> +sctp_ipsec 3 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n 65535 -N 65535 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
> +sctp_ipsec 3 TWARN: netstress failed, ret: 2
> +tst_test.c:1526: TINFO: Timeout per run is 0h 00m 30s
> +netstress.c:896: TINFO: IP_BIND_ADDRESS_NO_PORT is used
> +netstress.c:898: TINFO: connection: addr 'fd00:1:1:1::1', port '55097'
> +netstress.c:900: TINFO: client max req: 100
> +netstress.c:901: TINFO: clients num: 2
> +netstress.c:906: TINFO: client msg size: 65535
> +netstress.c:907: TINFO: server msg size: 65535
> +netstress.c:979: TINFO: SCTP client
> +netstress.c:475: TINFO: Running the test over IPv6
> +Test timeouted, sending SIGKILL!
> +tst_test.c:1577: TINFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> +tst_test.c:1579: TBROK: Test killed! (timeout?)
> +
> +Converting netstress.c to use TST_NO_DEFAULT_MAIN (i.e. implementing main)
> +would require more changes, because it uses .forks_child, .needs_checkpoints,
> +cleanup function.
> +
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +[ upstream status: cc4a27c235d0cf69a55cd8829b232566b0223333 ]
> +---
> + testcases/network/netstress/netstress.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
> +index 6c9e83112..7c222531d 100644
> +--- a/testcases/network/netstress/netstress.c
> ++++ b/testcases/network/netstress/netstress.c
> +@@ -1028,5 +1028,6 @@ static struct tst_test test = {
> +               {"B:", &server_bg, "Run in background, arg is the process directory"},
> +               {}
> +       },
> ++      .max_runtime = 300,
> +       .needs_checkpoints = 1,
> + };
> +--
> +2.37.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch b/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
> new file mode 100644
> index 0000000000..c12449d814
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
> @@ -0,0 +1,31 @@
> +From 463da729537faa6d5ef206912fdec871c1059dac Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Thu, 16 Jun 2022 16:33:31 +0200
> +Subject: [PATCH] nfs05_make_tree: Restore 5 min timeout
> +
> +nfs05_make_tree is a long running test. The previous default timeout 5
> +min was enough after reducing runtime in 05be61cf6.
> +
> +But the new default 30 sec introduced in the concept of max runtime is
> +definitely not enough. Restore the previous timeout 5 min.
> +
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +
> +[ upstream status: 463da729537faa6d5ef206912fdec871c1059dac ]
> +---
> + testcases/network/nfs/nfs_stress/nfs05_make_tree.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
> +index fdc13bd5d..5456c1bf0 100644
> +--- a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
> ++++ b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
> +@@ -215,4 +215,5 @@ static struct tst_test test = {
> +       .options = opts,
> +       .test_all = do_test,
> +       .setup = setup,
> ++      .max_runtime = 300,
> + };
> +--
> +2.37.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
> new file mode 100644
> index 0000000000..8229f98d26
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
> @@ -0,0 +1,44 @@
> +From 9fb28002bb2ce988b99d1756ff7b902f76e3472a Mon Sep 17 00:00:00 2001
> +From: Jan Stancek <jstancek@redhat.com>
> +Date: Tue, 21 Jun 2022 10:37:17 +0200
> +Subject: [PATCH] syscalls/migrate_pages03: restore runtime to 5m
> +
> +Arches with large pages have trouble completing all loops in 30s,
> +restore runtime to 5m. Also check for remaining runtime and
> +exit if we run out.
> +
> +Signed-off-by: Jan Stancek <jstancek@redhat.com>
> +Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> +Signed-off-by: Li Wang <liwang@redhat.com>
> +[ upstream status: 9fb28002bb2ce988b99d1756ff7b902f76e3472a ]
> +---
> + testcases/kernel/syscalls/migrate_pages/migrate_pages03.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
> +index c6afb4cce..2866c96e6 100644
> +--- a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
> ++++ b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
> +@@ -127,6 +127,11 @@ static void migrate_test(void)
> +                       tst_res(TFAIL | TERRNO, "migrate_pages() failed");
> +                       return;
> +               }
> ++
> ++              if (!tst_remaining_runtime()) {
> ++                      tst_res(TINFO, "Out of runtime, exitting...");
> ++                      break;
> ++              }
> +       }
> +       SAFE_SETEUID(0);
> +
> +@@ -134,6 +139,7 @@ static void migrate_test(void)
> + }
> +
> + static struct tst_test test = {
> ++      .max_runtime = 300,
> +       .min_kver = "2.6.32",
> +       .needs_root = 1,
> +       .setup = setup,
> +--
> +2.37.1
> +
> --
> 2.36.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168438): https://lists.openembedded.org/g/openembedded-core/message/168438
> Mute This Topic: https://lists.openembedded.org/mt/92566589/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

