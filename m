Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6CCCCA48A
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 21:02:06 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.10392.1658610119804244743
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 14:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jRhJzVps;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id mn11so1406175qvb.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 14:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=keCQYWJ9812mCvXsbPPL4NfNsfXaY/8CY5Mh8aBhV2k=;
        b=jRhJzVpsZyL3FyK8QcFKWJ3xVGHilVCn96Dzzmejib/WSE0MmBFw2brEim7SjlCx5Q
         6XmZGBPVfdHbrLG+WSfYRJYieriRObHFeSuwl5hl3EckxjFM77Iv/4bPbChF8hEJl4JJ
         TDMYfxdGJcwbldU5Yo2cdkqk7zQn8Xt5iPLiC1HC9Zf0OMn34vvnbxVkVZAUue6n0nL6
         cx+UgpKl12M1Hw71AVXJJ/7zSxiJ5prvjX2IVLkoMysZLFWwi6fG8skaCO17m6ZQHTq7
         sVtuliM1RZP1ve9cHtoXft6R2pGMvZnJfDjtOdumaoHkb34GERg8PX5qQn4X65BC4UBW
         mr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=keCQYWJ9812mCvXsbPPL4NfNsfXaY/8CY5Mh8aBhV2k=;
        b=3eieTET0dbpE3stvNlcm/HuvP8NBMUeV3JrViopZWBMzKdNw4pXCHf6Q1GCm/3WlW2
         gl+njB2335clMZewkUnmcVNHfJqMwXeMZCLSsStK99Y2HbQAmZtAe1cQYSsXq9ZvbSLS
         QeA/htSWJaB5z8TOryWI38Redx/m5hsZ12zQJzgoIzwtL4MEbYuwnS763J6egv8zGeFx
         bGVy6Vf84QxEZZ3aa3Rl4wrcjybY0mO37A//zWWWrkDsTC/RKgbIvkq3n3rA1vkY+a+B
         gSXnvXBWazE6IgBEzdYYEIfo8OwIW7JjRpkaKKbRQ5vpSlDEjG5aGeaycqZbX8WfG/w6
         NePw==
X-Gm-Message-State: AJIora8cvxZ9P1Bio5MVtyiYhP26WYeCxRZ7d1Ko3q4LyJgta1g44Y2b
	lOwKz9vAomyc6xI977sj79IQlhA+Jwa3r0mLitI=
X-Google-Smtp-Source: 
 AGRyM1s8r5ZEiCbrI39LQgEnEOqAqQKzqnEzmMVhoIx2J2TnpsyW+T0XmJVxyM8LxKgvzXSiZLzaum9ProAl+zCkBxc=
X-Received: by 2002:a0c:8c4c:0:b0:473:11d7:6d3d with SMTP id
 o12-20020a0c8c4c000000b0047311d76d3dmr4815521qvb.110.1658610118675; Sat, 23
 Jul 2022 14:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220723203014.5332-1-pevik@seznam.cz>
In-Reply-To: <20220723203014.5332-1-pevik@seznam.cz>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Jul 2022 17:01:46 -0400
Message-ID: 
 <CAMKF1soSHjE+Vx=gqFdxO3kDuh-ZCA+=V4M9xqxha9mWgYMZ0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ltp: Add post release runtime fixes
To: Petr Vorel <pevik@seznam.cz>
Cc: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
	Petr Vorel <petr.vorel@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f1d16405e47f428d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 21:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168447

--000000000000f1d16405e47f428d
Content-Type: text/plain; charset="UTF-8"

Lgtm

On Sat, Jul 23, 2022 at 4:30 PM Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
>
> Backport various post 20220527 release runtime fixes:
> * The concept of max runtime
> * tst_test.sh: Cleanup getopts usage
> * mountns0[1-3]: wait for umount completed in thread_b
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * add patches to SRC_URI (Khem Raj)
>
>  ...-Fix-usage-of-PAGESIZE-from-memcg_li.patch | 121 ++++++++++++++
>  ...ait-for-umount-completed-in-thread_b.patch |  63 +++++++
>  ...x-usage-of-variables-from-tst_net.sh.patch | 154 ++++++++++++++++++
>  ...0001-netstress-Restore-runtime-to-5m.patch |  53 ++++++
>  ...fs05_make_tree-Restore-5-min-timeout.patch |  31 ++++
>  ...igrate_pages03-restore-runtime-to-5m.patch |  44 +++++
>  meta/recipes-extended/ltp/ltp_20220527.bb     |   6 +
>  7 files changed, 472 insertions(+)
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
>
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
> b/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
> new file mode 100644
> index 0000000000..6cc36cda79
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
> @@ -0,0 +1,121 @@
> +From bda92ad659a52d38ac810099f69adff626b064c6 Mon Sep 17 00:00:00 2001
> +From: Joerg Vehlow <joerg.vehlow@aox.de>
> +Date: Mon, 27 Jun 2022 10:44:49 +0200
> +Subject: [PATCH] memcg/functional: Fix usage of PAGESIZE from memcg_lib.sh
> +
> +$PAGESIZES is set in memcg_lib.sh, which was moved to the bottom of the
> file.
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
> +diff --git
> a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
> b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
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
> +diff --git
> a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
> b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
> +index d1ffbe053..302810513 100755
> +---
> a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
> ++++
> b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
> +@@ -9,11 +9,6 @@
> + MEMCG_TESTFUNC=test
> + TST_CNT=4
> +
> +-
> +-MEM_TO_ALLOC=$((PAGESIZE * 1024))
> +-MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
> +-MEM_LIMIT=$((MEM_TO_ALLOC * 2))
> +-
> + # Run test cases which checks memory.[memsw.]max_usage_in_bytes after
> make
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
> +diff --git
> a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> +index 08b6697d4..9bcc01258 100755
> +---
> a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> ++++
> b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
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
> +diff --git
> a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
> b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
> +index 6f932124e..125d88e55 100755
> +---
> a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
> ++++
> b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
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
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
> b/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
> new file mode 100644
> index 0000000000..73904806fd
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
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
> +diff --git a/testcases/kernel/containers/mountns/mountns01.c
> b/testcases/kernel/containers/mountns/mountns01.c
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
> +diff --git a/testcases/kernel/containers/mountns/mountns02.c
> b/testcases/kernel/containers/mountns/mountns02.c
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
> +diff --git a/testcases/kernel/containers/mountns/mountns03.c
> b/testcases/kernel/containers/mountns/mountns03.c
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
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
> b/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
> new file mode 100644
> index 0000000000..ba187366ff
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
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
> +diff --git a/testcases/network/stress/interface/if-addr-adddel.sh
> b/testcases/network/stress/interface/if-addr-adddel.sh
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
> +diff --git a/testcases/network/stress/interface/if-addr-addlarge.sh
> b/testcases/network/stress/interface/if-addr-addlarge.sh
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
> +diff --git a/testcases/network/stress/interface/if-route-adddel.sh
> b/testcases/network/stress/interface/if-route-adddel.sh
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
> +diff --git a/testcases/network/stress/interface/if-route-addlarge.sh
> b/testcases/network/stress/interface/if-route-addlarge.sh
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
> +diff --git a/testcases/network/stress/interface/if-updown.sh
> b/testcases/network/stress/interface/if-updown.sh
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
> +diff --git a/testcases/network/stress/interface/if4-addr-change.sh
> b/testcases/network/stress/interface/if4-addr-change.sh
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
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
> b/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
> new file mode 100644
> index 0000000000..acaccf1e1f
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
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
> +sctp_ipsec 2 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D
> ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
> +sctp_ipsec 2 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n
> 1000 -N 1000 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d
> /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
> +sctp_ipsec 2 TPASS: netstress passed, median time 6 ms, data: 8 6 6 5 6
> +sctp_ipsec 3 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D
> ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
> +sctp_ipsec 3 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n
> 65535 -N 65535 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d
> /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
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
> +tst_test.c:1577: TINFO: If you are running on slow machine, try exporting
> LTP_TIMEOUT_MUL > 1
> +tst_test.c:1579: TBROK: Test killed! (timeout?)
> +
> +Converting netstress.c to use TST_NO_DEFAULT_MAIN (i.e. implementing main)
> +would require more changes, because it uses .forks_child,
> .needs_checkpoints,
> +cleanup function.
> +
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +[ upstream status: cc4a27c235d0cf69a55cd8829b232566b0223333 ]
> +---
> + testcases/network/netstress/netstress.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/testcases/network/netstress/netstress.c
> b/testcases/network/netstress/netstress.c
> +index 6c9e83112..7c222531d 100644
> +--- a/testcases/network/netstress/netstress.c
> ++++ b/testcases/network/netstress/netstress.c
> +@@ -1028,5 +1028,6 @@ static struct tst_test test = {
> +               {"B:", &server_bg, "Run in background, arg is the process
> directory"},
> +               {}
> +       },
> ++      .max_runtime = 300,
> +       .needs_checkpoints = 1,
> + };
> +--
> +2.37.1
> +
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
> b/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
> new file mode 100644
> index 0000000000..c12449d814
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
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
> +diff --git a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
> b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
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
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
> b/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
> new file mode 100644
> index 0000000000..8229f98d26
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
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
> +diff --git a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
> b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
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
> diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb
> b/meta/recipes-extended/ltp/ltp_20220527.bb
> index 094251ec81..d07563c4e1 100644
> --- a/meta/recipes-extended/ltp/ltp_20220527.bb
> +++ b/meta/recipes-extended/ltp/ltp_20220527.bb
> @@ -29,6 +29,12 @@ SRC_URI = "git://
> github.com/linux-test-project/ltp.git;branch=master;protocol=ht
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>             file://disable_hanging_tests.patch \
>             file://0001-kvm-use-LD-instead-of-hardcoding-ld.patch \
> +           file://0001-nfs05_make_tree-Restore-5-min-timeout.patch \
> +
>  file://0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch \
> +
>  file://0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch \
> +           file://0001-netstress-Restore-runtime-to-5m.patch \
> +
>  file://0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch \
> +
>  file://0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.36.1
>
>

--000000000000f1d16405e47f428d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Lgtm=C2=A0</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 23, 2022 at 4:30 PM Petr Vorel=
 &lt;<a href=3D"mailto:pevik@seznam.cz">pevik@seznam.cz</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">From: Petr Vorel &lt;<a href=3D"mailto:=
petr.vorel@gmail.com" target=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
<br>
Backport various post 20220527 release runtime fixes:<br>
* The concept of max runtime<br>
* tst_test.sh: Cleanup getopts usage<br>
* mountns0[1-3]: wait for umount completed in thread_b<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" targe=
t=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
---<br>
Changes v1-&gt;v2:<br>
* add patches to SRC_URI (Khem Raj)<br>
<br>
=C2=A0...-Fix-usage-of-PAGESIZE-from-memcg_li.patch | 121 ++++++++++++++<br=
>
=C2=A0...ait-for-umount-completed-in-thread_b.patch |=C2=A0 63 +++++++<br>
=C2=A0...x-usage-of-variables-from-tst_net.sh.patch | 154 +++++++++++++++++=
+<br>
=C2=A0...0001-netstress-Restore-runtime-to-5m.patch |=C2=A0 53 ++++++<br>
=C2=A0...fs05_make_tree-Restore-5-min-timeout.patch |=C2=A0 31 ++++<br>
=C2=A0...igrate_pages03-restore-runtime-to-5m.patch |=C2=A0 44 +++++<br>
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20220527.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A06 +<br>
=C2=A07 files changed, 472 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-memcg-functiona=
l-Fix-usage-of-PAGESIZE-from-memcg_li.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wa=
it-for-umount-completed-in-thread_b.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-=
usage-of-variables-from-tst_net.sh.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-netstress-Resto=
re-runtime-to-5m.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree=
-Restore-5-min-timeout.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-migrat=
e_pages03-restore-runtime-to-5m.patch<br>
<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-=
of-PAGESIZE-from-memcg_li.patch b/meta/recipes-extended/ltp/ltp/0001-memcg-=
functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch<br>
new file mode 100644<br>
index 0000000000..6cc36cda79<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGE=
SIZE-from-memcg_li.patch<br>
@@ -0,0 +1,121 @@<br>
+From bda92ad659a52d38ac810099f69adff626b064c6 Mon Sep 17 00:00:00 2001<br>
+From: Joerg Vehlow &lt;<a href=3D"mailto:joerg.vehlow@aox.de" target=3D"_b=
lank">joerg.vehlow@aox.de</a>&gt;<br>
+Date: Mon, 27 Jun 2022 10:44:49 +0200<br>
+Subject: [PATCH] memcg/functional: Fix usage of PAGESIZE from memcg_lib.sh=
<br>
+<br>
+$PAGESIZES is set in memcg_lib.sh, which was moved to the bottom of the fi=
le.<br>
+<br>
+Fixes: 04021637f (&quot;tst_test.sh: Cleanup getopts usage&quot;)<br>
+<br>
+Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_b=
lank">pvorel@suse.cz</a>&gt;<br>
+Signed-off-by: Joerg Vehlow &lt;<a href=3D"mailto:joerg.vehlow@aox.de" tar=
get=3D"_blank">joerg.vehlow@aox.de</a>&gt;<br>
+[ upstream status: bda92ad659a52d38ac810099f69adff626b064c6 ]<br>
+---<br>
+ .../controllers/memcg/functional/memcg_failcnt.sh=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 7 ++++---<br>
+ .../memcg/functional/memcg_max_usage_in_bytes_test.sh=C2=A0 | 10 +++++---=
--<br>
+ .../memcg/functional/memcg_subgroup_charge.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 ++++----<br>
+ .../memcg/functional/memcg_usage_in_bytes_test.sh=C2=A0 =C2=A0 =C2=A0 | 1=
0 +++++-----<br>
+ 4 files changed, 18 insertions(+), 17 deletions(-)<br>
+<br>
+diff --git a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.s=
h b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh<br>
+index 1fed01569..1be98a056 100755<br>
+--- a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh<br>
++++ b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh<br>
+@@ -12,9 +12,6 @@ MEMCG_TESTFUNC=3Dtest<br>
+ MEMCG_SHMMAX=3D1<br>
+ TST_TEST_DATA=3D&quot;--mmap-anon --mmap-file --shm&quot;<br>
+ <br>
+-MEMORY_LIMIT=3D$PAGESIZE<br>
+-MEMORY_TO_ALLOCATE=3D$((MEMORY_LIMIT * 2))<br>
+-<br>
+ test()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD echo $MEMORY_LIMIT \&gt; memory.limit_in_by=
tes<br>
+@@ -36,4 +33,8 @@ test()<br>
+ }<br>
+ <br>
+ . memcg_lib.sh<br>
++<br>
++MEMORY_LIMIT=3D$PAGESIZE<br>
++MEMORY_TO_ALLOCATE=3D$((MEMORY_LIMIT * 2))<br>
++<br>
+ tst_run<br>
+diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage=
_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max=
_usage_in_bytes_test.sh<br>
+index d1ffbe053..302810513 100755<br>
+--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_byt=
es_test.sh<br>
++++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_byt=
es_test.sh<br>
+@@ -9,11 +9,6 @@<br>
+ MEMCG_TESTFUNC=3Dtest<br>
+ TST_CNT=3D4<br>
+ <br>
+-<br>
+-MEM_TO_ALLOC=3D$((PAGESIZE * 1024))<br>
+-MEM_EXPECTED_UPPER=3D$((MEM_TO_ALLOC + MEM_USAGE_RANGE))<br>
+-MEM_LIMIT=3D$((MEM_TO_ALLOC * 2))<br>
+-<br>
+ # Run test cases which checks memory.[memsw.]max_usage_in_bytes after mak=
e<br>
+ # some memory allocation<br>
+ test_max_usage_in_bytes()<br>
+@@ -88,4 +83,9 @@ test4()<br>
+ }<br>
+ <br>
+ . memcg_lib.sh<br>
++<br>
++MEM_TO_ALLOC=3D$((PAGESIZE * 1024))<br>
++MEM_EXPECTED_UPPER=3D$((MEM_TO_ALLOC + MEM_USAGE_RANGE))<br>
++MEM_LIMIT=3D$((MEM_TO_ALLOC * 2))<br>
++<br>
+ tst_run<br>
+diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_=
charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_ch=
arge.sh<br>
+index 08b6697d4..9bcc01258 100755<br>
+--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.=
sh<br>
++++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.=
sh<br>
+@@ -12,10 +12,6 @@<br>
+ MEMCG_TESTFUNC=3Dtest<br>
+ TST_CNT=3D3<br>
+ <br>
+-<br>
+-# Allocate memory bigger than per-cpu kernel memory<br>
+-MEM_TO_ALLOC=3D$((PAGESIZES * 2))<br>
+-<br>
+ # Test the memory charge won&#39;t move to subgroup<br>
+ # $1 - memory.limit_in_bytes in sub group<br>
+ test_subgroup()<br>
+@@ -67,4 +63,8 @@ test3()<br>
+ }<br>
+ <br>
+ . memcg_lib.sh<br>
++<br>
++# Allocate memory bigger than per-cpu kernel memory<br>
++MEM_TO_ALLOC=3D$((PAGESIZES * 2))<br>
++<br>
+ tst_run<br>
+diff --git a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_=
bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_usage_i=
n_bytes_test.sh<br>
+index 6f932124e..125d88e55 100755<br>
+--- a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_t=
est.sh<br>
++++ b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_t=
est.sh<br>
+@@ -9,11 +9,6 @@<br>
+ MEMCG_TESTFUNC=3Dtest<br>
+ TST_CNT=3D2<br>
+ <br>
+-<br>
+-MEM_TO_ALLOC=3D$((PAGESIZE * 1024))<br>
+-MEM_EXPECTED_UPPER=3D$((MEM_TO_ALLOC + MEM_USAGE_RANGE))<br>
+-MEM_LIMIT=3D$((MEM_TO_ALLOC * 2))<br>
+-<br>
+ test1()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res TINFO &quot;Test memory.usage_in_bytes&=
quot;<br>
+@@ -35,4 +30,9 @@ test2()<br>
+ }<br>
+ <br>
+ . memcg_lib.sh<br>
++<br>
++MEM_TO_ALLOC=3D$((PAGESIZE * 1024))<br>
++MEM_EXPECTED_UPPER=3D$((MEM_TO_ALLOC + MEM_USAGE_RANGE))<br>
++MEM_LIMIT=3D$((MEM_TO_ALLOC * 2))<br>
++<br>
+ tst_run<br>
+-- <br>
+2.37.1<br>
+<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umoun=
t-completed-in-thread_b.patch b/meta/recipes-extended/ltp/ltp/0001-mountns0=
-1-3-wait-for-umount-completed-in-thread_b.patch<br>
new file mode 100644<br>
index 0000000000..73904806fd<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-compl=
eted-in-thread_b.patch<br>
@@ -0,0 +1,63 @@<br>
+From 6d4c8343d33e7d8fa059246310413f029a9e8573 Mon Sep 17 00:00:00 2001<br>
+From: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">l=
iwang@redhat.com</a>&gt;<br>
+Date: Thu, 7 Jul 2022 17:38:45 +0800<br>
+Subject: [PATCH] mountns0[1-3]: wait for umount completed in thread_b<br>
+<br>
+To get rid of race condition (occurs with umount_folders):<br>
+<br>
+=C2=A0 =C2=A0 mountns01.c:42: TPASS: shared mount in parent passed<br>
+=C2=A0 =C2=A0 mountns01.c:83: TPASS: shared mount in child passed<br>
+=C2=A0 =C2=A0 tst_device.c:394: TWARN: umount(&#39;B&#39;) failed with EIN=
VAL<br>
+=C2=A0 =C2=A0 mountns.h:39: TWARN: umount(B) failed: EINVAL (22)<br>
+<br>
+Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"=
_blank">liwang@redhat.com</a>&gt;<br>
+Reviewed-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@fujitsu.com" targ=
et=3D"_blank">xuyang2018.jy@fujitsu.com</a>&gt;<br>
+[ upstream status: 6d4c8343d33e7d8fa059246310413f029a9e8573 ]<br>
+---<br>
+ testcases/kernel/containers/mountns/mountns01.c | 2 ++<br>
+ testcases/kernel/containers/mountns/mountns02.c | 2 ++<br>
+ testcases/kernel/containers/mountns/mountns03.c | 2 ++<br>
+ 3 files changed, 6 insertions(+)<br>
+<br>
+diff --git a/testcases/kernel/containers/mountns/mountns01.c b/testcases/k=
ernel/containers/mountns/mountns01.c<br>
+index e99134aba..e8f176920 100644<br>
+--- a/testcases/kernel/containers/mountns/mountns01.c<br>
++++ b/testcases/kernel/containers/mountns/mountns01.c<br>
+@@ -86,6 +86,8 @@ static void run(void)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAKE(0);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 SAFE_WAIT(NULL);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_UMOUNT(DIRA);<br>
+ }<br>
+ <br>
+diff --git a/testcases/kernel/containers/mountns/mountns02.c b/testcases/k=
ernel/containers/mountns/mountns02.c<br>
+index 258b61217..4b85fa79b 100644<br>
+--- a/testcases/kernel/containers/mountns/mountns02.c<br>
++++ b/testcases/kernel/containers/mountns/mountns02.c<br>
+@@ -87,6 +87,8 @@ static void run(void)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAKE(0);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 SAFE_WAIT(NULL);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_UMOUNT(DIRA);<br>
+ }<br>
+ <br>
+diff --git a/testcases/kernel/containers/mountns/mountns03.c b/testcases/k=
ernel/containers/mountns/mountns03.c<br>
+index f37ae7902..1d26a25d8 100644<br>
+--- a/testcases/kernel/containers/mountns/mountns03.c<br>
++++ b/testcases/kernel/containers/mountns/mountns03.c<br>
+@@ -97,6 +97,8 @@ static void run(void)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAKE(0);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 SAFE_WAIT(NULL);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_UMOUNT(DIRA);<br>
+ }<br>
+ <br>
+-- <br>
+2.37.1<br>
+<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-var=
iables-from-tst_net.sh.patch b/meta/recipes-extended/ltp/ltp/0001-net_stres=
s-Fix-usage-of-variables-from-tst_net.sh.patch<br>
new file mode 100644<br>
index 0000000000..ba187366ff<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-=
from-tst_net.sh.patch<br>
@@ -0,0 +1,154 @@<br>
+From 33c156e295e35d4839a135d8ba5db485b7712ced Mon Sep 17 00:00:00 2001<br>
+From: Joerg Vehlow &lt;<a href=3D"mailto:joerg.vehlow@aox.de" target=3D"_b=
lank">joerg.vehlow@aox.de</a>&gt;<br>
+Date: Mon, 27 Jun 2022 09:27:09 +0200<br>
+Subject: [PATCH] net_stress: Fix usage of variables from tst_net.sh<br>
+<br>
+These tests use variables (NS_TIMES, IP_TOTAL, ROUTE_TOTAL<br>
+and IF_UPDOWN_TIMES) from tst_net.sh, before sourcing it.<br>
+<br>
+Fixes: 04021637f (&quot;tst_test.sh: Cleanup getopts usage&quot;)<br>
+<br>
+Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_b=
lank">pvorel@suse.cz</a>&gt;<br>
+Signed-off-by: Joerg Vehlow &lt;<a href=3D"mailto:joerg.vehlow@aox.de" tar=
get=3D"_blank">joerg.vehlow@aox.de</a>&gt;<br>
+[ upstream status: 33c156e295e35d4839a135d8ba5db485b7712ced ]<br>
+---<br>
+ testcases/network/stress/interface/if-addr-adddel.sh=C2=A0 =C2=A0 | 7 +++=
+---<br>
+ testcases/network/stress/interface/if-addr-addlarge.sh=C2=A0 | 7 ++++---<=
br>
+ testcases/network/stress/interface/if-route-adddel.sh=C2=A0 =C2=A0| 5 +++=
--<br>
+ testcases/network/stress/interface/if-route-addlarge.sh | 5 +++--<br>
+ testcases/network/stress/interface/if-updown.sh=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 5 +++--<br>
+ testcases/network/stress/interface/if4-addr-change.sh=C2=A0 =C2=A0| 4 +++=
-<br>
+ 6 files changed, 20 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/testcases/network/stress/interface/if-addr-adddel.sh b/testca=
ses/network/stress/interface/if-addr-adddel.sh<br>
+index cb453e612..0750501f0 100755<br>
+--- a/testcases/network/stress/interface/if-addr-adddel.sh<br>
++++ b/testcases/network/stress/interface/if-addr-adddel.sh<br>
+@@ -7,9 +7,6 @@<br>
+ <br>
+ IF_CMD=3D&#39;ifconfig&#39;<br>
+ <br>
+-# The interval of the check interface activity<br>
+-CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($NS_TIMES / 20))}<br>
+-<br>
+ test_body()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local cmd=3D&quot;$CMD&quot;<br>
+@@ -89,4 +86,8 @@ test_body()<br>
+ }<br>
+ <br>
+ . if-lib.sh<br>
++<br>
++# The interval of the check interface activity<br>
++CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($NS_TIMES / 20))}<br>
++<br>
+ tst_run<br>
+diff --git a/testcases/network/stress/interface/if-addr-addlarge.sh b/test=
cases/network/stress/interface/if-addr-addlarge.sh<br>
+index 3c876c17d..d0759c86b 100755<br>
+--- a/testcases/network/stress/interface/if-addr-addlarge.sh<br>
++++ b/testcases/network/stress/interface/if-addr-addlarge.sh<br>
+@@ -7,9 +7,6 @@<br>
+ <br>
+ IF_CMD=3D&#39;ifconfig&#39;<br>
+ <br>
+-# The interval of the check interface activity<br>
+-CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($IP_TOTAL / 20))}<br>
+-<br>
+ test_body()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local cmd=3D&quot;$CMD&quot;<br>
+@@ -110,4 +107,8 @@ test_body()<br>
+ }<br>
+ <br>
+ . if-lib.sh<br>
++<br>
++# The interval of the check interface activity<br>
++CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($IP_TOTAL / 20))}<br>
++<br>
+ tst_run<br>
+diff --git a/testcases/network/stress/interface/if-route-adddel.sh b/testc=
ases/network/stress/interface/if-route-adddel.sh<br>
+index b50da268a..51445e4f7 100755<br>
+--- a/testcases/network/stress/interface/if-route-adddel.sh<br>
++++ b/testcases/network/stress/interface/if-route-adddel.sh<br>
+@@ -7,8 +7,6 @@<br>
+ <br>
+ IF_CMD=3D&#39;route&#39;<br>
+ <br>
+-CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($NS_TIMES / 20))}<br>
+-<br>
+ test_body()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local cmd=3D&quot;$CMD&quot;<br>
+@@ -64,4 +62,7 @@ test_body()<br>
+ }<br>
+ <br>
+ . if-lib.sh<br>
++<br>
++CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($NS_TIMES / 20))}<br>
++<br>
+ tst_run<br>
+diff --git a/testcases/network/stress/interface/if-route-addlarge.sh b/tes=
tcases/network/stress/interface/if-route-addlarge.sh<br>
+index 7d09d1216..355b6b4ab 100755<br>
+--- a/testcases/network/stress/interface/if-route-addlarge.sh<br>
++++ b/testcases/network/stress/interface/if-route-addlarge.sh<br>
+@@ -7,8 +7,6 @@<br>
+ <br>
+ IF_CMD=3D&#39;route&#39;<br>
+ <br>
+-CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($ROUTE_TOTAL / 20))}<br>
+-<br>
+ test_body()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local cmd=3D&quot;$CMD&quot;<br>
+@@ -76,4 +74,7 @@ test_body()<br>
+ }<br>
+ <br>
+ . if-lib.sh<br>
++<br>
++CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($ROUTE_TOTAL / 20))}<br>
++<br>
+ tst_run<br>
+diff --git a/testcases/network/stress/interface/if-updown.sh b/testcases/n=
etwork/stress/interface/if-updown.sh<br>
+index 9a5709c85..71c78d785 100755<br>
+--- a/testcases/network/stress/interface/if-updown.sh<br>
++++ b/testcases/network/stress/interface/if-updown.sh<br>
+@@ -8,8 +8,6 @@<br>
+ IF_CMD=3D&#39;ifconfig&#39;<br>
+ TST_CLEANUP=3D&quot;if_cleanup_restore&quot;<br>
+ <br>
+-CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($IF_UPDOWN_TIMES / 20))}<br>
+-<br>
+ test_body()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local cmd=3D&quot;$CMD&quot;<br>
+@@ -47,4 +45,7 @@ test_body()<br>
+ }<br>
+ <br>
+ . if-lib.sh<br>
++<br>
++CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($IF_UPDOWN_TIMES / 20))}<br>
++<br>
+ tst_run<br>
+diff --git a/testcases/network/stress/interface/if4-addr-change.sh b/testc=
ases/network/stress/interface/if4-addr-change.sh<br>
+index b9ece2af9..f162e6a51 100755<br>
+--- a/testcases/network/stress/interface/if4-addr-change.sh<br>
++++ b/testcases/network/stress/interface/if4-addr-change.sh<br>
+@@ -9,7 +9,6 @@ TST_CLEANUP=3D&quot;do_cleanup&quot;<br>
+ TST_TESTFUNC=3D&quot;test_body&quot;<br>
+ TST_NEEDS_CMDS=3D&quot;ifconfig&quot;<br>
+ <br>
+-CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($NS_TIMES / 20))}<br>
+ # Maximum host portion of the IPv4 address on the local host<br>
+ LHOST_IPV4_HOST_MAX=3D&quot;254&quot;<br>
+ <br>
+@@ -61,4 +60,7 @@ test_body()<br>
+ }<br>
+ <br>
+ . tst_net.sh<br>
++<br>
++CHECK_INTERVAL=3D${CHECK_INTERVAL:-$(($NS_TIMES / 20))}<br>
++<br>
+ tst_run<br>
+-- <br>
+2.37.1<br>
+<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-t=
o-5m.patch b/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-t=
o-5m.patch<br>
new file mode 100644<br>
index 0000000000..acaccf1e1f<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.pa=
tch<br>
@@ -0,0 +1,53 @@<br>
+From cc4a27c235d0cf69a55cd8829b232566b0223333 Mon Sep 17 00:00:00 2001<br>
+From: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">p=
vorel@suse.cz</a>&gt;<br>
+Date: Wed, 13 Jul 2022 09:46:14 +0200<br>
+Subject: [PATCH] netstress: Restore runtime to 5m<br>
+<br>
+netstress requires the previous default timeout 5m due longer timeout<br>
+for higher message sizes (e.g. 65535):<br>
+<br>
+./sctp_ipsec.sh -6 -p comp -m transport -s 100:1000:65535:R65535<br>
+sctp_ipsec 1 TPASS: netstress passed, median time 5 ms, data: 5 9 6 5 5<br=
>
+sctp_ipsec 2 TINFO: run server &#39;netstress -T sctp -S fd00:1:1:1::1 -D =
ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa&#39;<br>
+sctp_ipsec 2 TINFO: run client &#39;netstress -l -T sctp -H fd00:1:1:1::1 =
-n 1000 -N 1000 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sc=
tp_ipsec.ARZbGkvjPa/tst_netload.res&#39; 5 times<br>
+sctp_ipsec 2 TPASS: netstress passed, median time 6 ms, data: 8 6 6 5 6<br=
>
+sctp_ipsec 3 TINFO: run server &#39;netstress -T sctp -S fd00:1:1:1::1 -D =
ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa&#39;<br>
+sctp_ipsec 3 TINFO: run client &#39;netstress -l -T sctp -H fd00:1:1:1::1 =
-n 65535 -N 65535 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_=
sctp_ipsec.ARZbGkvjPa/tst_netload.res&#39; 5 times<br>
+sctp_ipsec 3 TWARN: netstress failed, ret: 2<br>
+tst_test.c:1526: TINFO: Timeout per run is 0h 00m 30s<br>
+netstress.c:896: TINFO: IP_BIND_ADDRESS_NO_PORT is used<br>
+netstress.c:898: TINFO: connection: addr &#39;fd00:1:1:1::1&#39;, port &#3=
9;55097&#39;<br>
+netstress.c:900: TINFO: client max req: 100<br>
+netstress.c:901: TINFO: clients num: 2<br>
+netstress.c:906: TINFO: client msg size: 65535<br>
+netstress.c:907: TINFO: server msg size: 65535<br>
+netstress.c:979: TINFO: SCTP client<br>
+netstress.c:475: TINFO: Running the test over IPv6<br>
+Test timeouted, sending SIGKILL!<br>
+tst_test.c:1577: TINFO: If you are running on slow machine, try exporting =
LTP_TIMEOUT_MUL &gt; 1<br>
+tst_test.c:1579: TBROK: Test killed! (timeout?)<br>
+<br>
+Converting netstress.c to use TST_NO_DEFAULT_MAIN (i.e. implementing main)=
<br>
+would require more changes, because it uses .forks_child, .needs_checkpoin=
ts,<br>
+cleanup function.<br>
+<br>
+Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"=
_blank">pvorel@suse.cz</a>&gt;<br>
+[ upstream status: cc4a27c235d0cf69a55cd8829b232566b0223333 ]<br>
+---<br>
+ testcases/network/netstress/netstress.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/testcases/network/netstress/netstress.c b/testcases/network/n=
etstress/netstress.c<br>
+index 6c9e83112..7c222531d 100644<br>
+--- a/testcases/network/netstress/netstress.c<br>
++++ b/testcases/network/netstress/netstress.c<br>
+@@ -1028,5 +1028,6 @@ static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;B:&quot;, &a=
mp;server_bg, &quot;Run in background, arg is the process directory&quot;},=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
++=C2=A0 =C2=A0 =C2=A0 .max_runtime =3D 300,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_checkpoints =3D 1,<br>
+ };<br>
+-- <br>
+2.37.1<br>
+<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-m=
in-timeout.patch b/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Resto=
re-5-min-timeout.patch<br>
new file mode 100644<br>
index 0000000000..c12449d814<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-time=
out.patch<br>
@@ -0,0 +1,31 @@<br>
+From 463da729537faa6d5ef206912fdec871c1059dac Mon Sep 17 00:00:00 2001<br>
+From: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">p=
vorel@suse.cz</a>&gt;<br>
+Date: Thu, 16 Jun 2022 16:33:31 +0200<br>
+Subject: [PATCH] nfs05_make_tree: Restore 5 min timeout<br>
+<br>
+nfs05_make_tree is a long running test. The previous default timeout 5<br>
+min was enough after reducing runtime in 05be61cf6.<br>
+<br>
+But the new default 30 sec introduced in the concept of max runtime is<br>
+definitely not enough. Restore the previous timeout 5 min.<br>
+<br>
+Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"=
_blank">pvorel@suse.cz</a>&gt;<br>
+<br>
+[ upstream status: 463da729537faa6d5ef206912fdec871c1059dac ]<br>
+---<br>
+ testcases/network/nfs/nfs_stress/nfs05_make_tree.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c b/testcase=
s/network/nfs/nfs_stress/nfs05_make_tree.c<br>
+index fdc13bd5d..5456c1bf0 100644<br>
+--- a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c<br>
++++ b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c<br>
+@@ -215,4 +215,5 @@ static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.options =3D opts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D do_test,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
++=C2=A0 =C2=A0 =C2=A0 .max_runtime =3D 300,<br>
+ };<br>
+-- <br>
+2.37.1<br>
+<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-re=
store-runtime-to-5m.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-mig=
rate_pages03-restore-runtime-to-5m.patch<br>
new file mode 100644<br>
index 0000000000..8229f98d26<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-r=
untime-to-5m.patch<br>
@@ -0,0 +1,44 @@<br>
+From 9fb28002bb2ce988b99d1756ff7b902f76e3472a Mon Sep 17 00:00:00 2001<br>
+From: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"_bl=
ank">jstancek@redhat.com</a>&gt;<br>
+Date: Tue, 21 Jun 2022 10:37:17 +0200<br>
+Subject: [PATCH] syscalls/migrate_pages03: restore runtime to 5m<br>
+<br>
+Arches with large pages have trouble completing all loops in 30s,<br>
+restore runtime to 5m. Also check for remaining runtime and<br>
+exit if we run out.<br>
+<br>
+Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targ=
et=3D"_blank">jstancek@redhat.com</a>&gt;<br>
+Reviewed-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D=
"_blank">chrubis@suse.cz</a>&gt;<br>
+Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"=
_blank">liwang@redhat.com</a>&gt;<br>
+[ upstream status: 9fb28002bb2ce988b99d1756ff7b902f76e3472a ]<br>
+---<br>
+ testcases/kernel/syscalls/migrate_pages/migrate_pages03.c | 6 ++++++<br>
+ 1 file changed, 6 insertions(+)<br>
+<br>
+diff --git a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c b/t=
estcases/kernel/syscalls/migrate_pages/migrate_pages03.c<br>
+index c6afb4cce..2866c96e6 100644<br>
+--- a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c<br>
++++ b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c<br>
+@@ -127,6 +127,11 @@ static void migrate_test(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL | TERRNO, &quot;migrate_pages() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_remaining_runti=
me()) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_res(TINFO, &quot;Out of runtime, exitting...&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SETEUID(0);<br>
+ <br>
+@@ -134,6 +139,7 @@ static void migrate_test(void)<br>
+ }<br>
+ <br>
+ static struct tst_test test =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 .max_runtime =3D 300,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.min_kver =3D &quot;2.6.32&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
+-- <br>
+2.37.1<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" r=
el=3D"noreferrer" target=3D"_blank">ltp_20220527.bb</a> b/meta/recipes-exte=
nded/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"noreferrer" target=3D"_b=
lank">ltp_20220527.bb</a><br>
index 094251ec81..d07563c4e1 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20220527.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20220527.bb</a><br>
@@ -29,6 +29,12 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/lin=
ux-test-project/ltp.git;branch=3Dmaster;protocol=3Dht" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/linux-test-project/ltp.git;branch=3Dmaster;prot=
ocol=3Dht</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Remove-OOM-tests-from=
-runtest-mm.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_hanging_tests.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-kvm-use-LD-instead-of=
-hardcoding-ld.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-nfs05_make_tree-Resto=
re-5-min-timeout.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-syscalls-migrate_page=
s03-restore-runtime-to-5m.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mountns0-1-3-wait-for=
-umount-completed-in-thread_b.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-netstress-Restore-run=
time-to-5m.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-net_stress-Fix-usage-=
of-variables-from-tst_net.sh.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-memcg-functional-Fix-=
usage-of-PAGESIZE-from-memcg_li.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.36.1<br>
<br>
</blockquote></div></div>

--000000000000f1d16405e47f428d--

