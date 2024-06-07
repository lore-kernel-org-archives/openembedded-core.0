Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95100C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 04:48:47 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.34258.1717735721751164303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 21:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWrwwLHP;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d2026f5b33so953313b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 21:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717735721; x=1718340521; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UR5N4gZsJ9xlxDwTrwBJbH/L61EPQ+NpkoFgshW/b9A=;
        b=cWrwwLHPuWYX3iR6xtFf7bLGZP/TDzSy0xUsA/D5H2+d1FMVRGJWpqwrCLKJtjskNt
         lcvgA4YcsHEu1J3fuzV78+PHL5nmnirYWAzji+ZLxYSu9DoMfyI1FoXUxTMLPzG8X+DK
         LChLx5+BEwW6F5BO+NErzS4E2m8sNMSFOVhMrD9rWib7v1WMyFytfc5H29Z98vCtzims
         JhUOYvlq/gErPgDP8k7HhgaVX9Zawt53BYBBKUopwTR+smcER4eh6gf08zwTgdLuB1pF
         mSXHm8qzXMcEUYr1kVv3OVz9JKsXU1n9nkypYTz9PcJwq+oiUpjh05OjPk9mnixfL/Ph
         ljGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717735721; x=1718340521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UR5N4gZsJ9xlxDwTrwBJbH/L61EPQ+NpkoFgshW/b9A=;
        b=HrBX/NQpyHZKMY8SLj6kBqzT669C6G+O/MxS1vm8RkQ+Df0noBENUFkavVCAjH2yZH
         4Emaq2wAH54o8lktC2MpV/pVDjenKtL5l7cwS7PUWGTDwc5469nbXBiXr+YmoRAKLZvN
         q5ho/l/fPWtjNfhnqdDtiq8k4h1pgmEnWtbto0WKaXOY04/kIBBixtjU2BkSLl17d1+Y
         QHNhEmp9Z9+erE/Nn2mfP++pEVkO65hbsiNxbF/geOkPgSfQZVIsclMPMLG+bQA8lUEz
         qe/1Sy0VHN2fHA7rrbftp/fsWqtfZQ5nT9Sc0P3toSp2bmdlEiid3XNpJOXTXGnPcqoj
         Dt9g==
X-Gm-Message-State: AOJu0YwESOU71m39s2Lpa4mA9v/ki/XTWexPzhhE7XAmLejhaxCtQfqs
	AcLO+MwmkMclFoLsHb8So7feSlyWelIeiO2OuMDWfhcHUiBOIu3lRGD35oYYh1SbxrHlEfsBmLi
	zs6WOXTP/D80frXzTTo7Zcw8dzMA=
X-Google-Smtp-Source: AGHT+IGxSqtXIP7l7kLPzlLtB1Mp/3TIQdUPZ/70BC7VlI6TfVEl4ctoKOfjWm5T/6/h88RgHCJm1E29Q94Z86KEZP8=
X-Received: by 2002:a05:6870:d186:b0:250:191e:aeb2 with SMTP id
 586e51a60fabf-25464f1bc1emr1474493fac.56.1717735720713; Thu, 06 Jun 2024
 21:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240603103300.1626507-1-yi.zhao@windriver.com> <20240603103300.1626507-2-yi.zhao@windriver.com>
In-Reply-To: <20240603103300.1626507-2-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jun 2024 21:48:14 -0700
Message-ID: <CAMKF1soWcy6n3xtDfW30v1XdP6e-7DnLcMUVJK1=xMKaBZxhTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ltp: upgrade 20240129 -> 20240524
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 04:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200421

fails to build on riscv64 see
https://errors.yoctoproject.org/Errors/Details/785948/

On Mon, Jun 3, 2024 at 3:33=E2=80=AFAM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> ChangeLog:
> https://github.com/linux-test-project/ltp/releases/tag/20240524
>
> Drop backport patches.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...001-Remove-OOM-tests-from-runtest-mm.patch |  9 ++--
>  ...rio_groups-default-remove-connectors.patch | 34 ------------
>  ...-Use-time_t-instead-of-long-for-type.patch | 54 -------------------
>  .../ltp/{ltp_20240129.bb =3D> ltp_20240524.bb}  |  4 +-
>  4 files changed, 4 insertions(+), 97 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-scenario_groups-de=
fault-remove-connectors.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-t=
ime_t-instead-of-long-for-type.patch
>  rename meta/recipes-extended/ltp/{ltp_20240129.bb =3D> ltp_20240524.bb} =
(96%)
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-run=
test-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-ru=
ntest-mm.patch
> index cc98079651..5b6c780bec 100644
> --- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm=
.patch
> +++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm=
.patch
> @@ -1,4 +1,4 @@
> -From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
> +From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
>  From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
>  Date: Wed, 29 Jul 2020 08:47:09 -0400
>  Subject: [PATCH] Remove OOM tests from runtest/mm
> @@ -14,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>   1 file changed, 6 deletions(-)
>
>  diff --git a/runtest/mm b/runtest/mm
> -index d859b331c..3c2962f44 100644
> +index 6a8cd0b9d..8ce3f4416 100644
>  --- a/runtest/mm
>  +++ b/runtest/mm
> -@@ -74,12 +74,6 @@ ksm07 ksm07
> +@@ -76,12 +76,6 @@ ksm07 ksm07
>
>   cpuset01 cpuset01
>
> @@ -30,6 +30,3 @@ index d859b331c..3c2962f44 100644
>   swapping01 swapping01 -i 5
>
>   thp01 thp01 -I 120
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-r=
emove-connectors.patch b/meta/recipes-extended/ltp/ltp/0001-scenario_groups=
-default-remove-connectors.patch
> deleted file mode 100644
> index 4a50d1ae38..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-c=
onnectors.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 14c710cae38aa96bd8d681e891b6a1d691f99988 Mon Sep 17 00:00:00 2001
> -From: Xiangyu Chen <xiangyu.chen@windriver.com>
> -Date: Thu, 14 Mar 2024 09:47:10 +0800
> -Subject: [PATCH] scenario_groups/default: remove connectors
> -
> -runtest/connectors was removed in 9b642d89c, thus update scenario_groups=
/default.
> -
> -Fixes: 9b642d89c ("runtest: Merge runtest/connectors to kernel_misc")
> -Closes: https://github.com/linux-test-project/ltp/pull/1144
> -
> -Upstream-Status: Backport from
> -[https://github.com/linux-test-project/ltp/commit/14c710ca]
> -
> -Reviewed-by: Petr Vorel <pvorel@suse.cz>
> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ----
> - scenario_groups/default | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/scenario_groups/default b/scenario_groups/default
> -index f17b2061a..ec77d8fb8 100644
> ---- a/scenario_groups/default
> -+++ b/scenario_groups/default
> -@@ -16,7 +16,6 @@ controllers
> - filecaps
> - cap_bounds
> - fcntl-locktests
> --connectors
> - power_management_tests
> - hugetlb
> - commands
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-i=
nstead-of-long-for-type.patch b/meta/recipes-extended/ltp/ltp/0001-sched_st=
ress-Use-time_t-instead-of-long-for-type.patch
> deleted file mode 100644
> index ae8dc8706e..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-=
of-long-for-type.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 74074f9a71c876d6e95c2d72702888dd2fabc761 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 6 May 2024 11:43:20 -0700
> -Subject: [PATCH] sched_stress: Use time_t instead of long for type
> -
> -This ensures it works across different architectures
> -Fixes
> -
> -| sched_driver.c:744:43: error: passing argument 1 of 'ctime' from incom=
patible pointer type [-Wincompatible-pointer-types]
> -|   744 |         printf("\nend time =3D %s\n", ctime(&end_time));
> -|       |                                           ^~~~~~~~~
> -
> -With gcc-14
> -
> -Upstream-Status: Backport [https://github.com/linux-test-project/ltp/com=
mit/0a682f1af42d8d261202821be580fe26d17ee9b7]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/sched/sched_stress/sched_driver.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testca=
ses/kernel/sched/sched_stress/sched_driver.c
> -index 61573d788..5b8c187fe 100644
> ---- a/testcases/kernel/sched/sched_stress/sched_driver.c
> -+++ b/testcases/kernel/sched/sched_stress/sched_driver.c
> -@@ -136,7 +136,7 @@ int debug =3D 0;
> - /*
> -  * Function prototypes
> -  */
> --void startup(long);
> -+void startup(time_t);
> - int start_testcase(char *, char *, char *, char *, char *, char *);
> - int process_slots_in_use();
> - int available_user_process_slots();
> -@@ -251,7 +251,7 @@ int main(int argc, char **argv)
> -  * information to the screen and .  It also initializes the    *
> -  * process id list and other global variables.                         =
        *
> -  *---------------------------------------------------------------------=
--*/
> --void startup(long start_time)
> -+void startup(time_t start_time)
> - {
> -       char tempbuffer[50];    /* temporary buffer to hold names */
> -
> -@@ -734,7 +734,7 @@ void kill_short_term_testcases()
> - void finishup(start_time)
> - long start_time;              /* starting time to calculate elapsed tim=
e */
> - {
> --      long end_time;          /* time when program finished */
> -+      time_t end_time;                /* time when program finished */
> -
> -       /*
> -        * Get the end time and calculate elapsed time; write all this ou=
t
> ---
> -2.45.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-ext=
ended/ltp/ltp_20240524.bb
> similarity index 96%
> rename from meta/recipes-extended/ltp/ltp_20240129.bb
> rename to meta/recipes-extended/ltp/ltp_20240524.bb
> index f8e6d3987e..1aafed0bf5 100644
> --- a/meta/recipes-extended/ltp/ltp_20240129.bb
> +++ b/meta/recipes-extended/ltp/ltp_20240524.bb
> @@ -24,12 +24,10 @@ TUNE_CCARGS:remove:x86-64 =3D "-mfpmath=3Dsse"
>
>  CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
> -SRCREV =3D "68737d20556d37364c95776044b1119c0912a36a"
> +SRCREV =3D "8f21ebba42216dbb7e8d44c23b4a977d6823f7a1"
>
>  SRC_URI =3D "git://github.com/linux-test-project/ltp.git;branch=3Dmaster=
;protocol=3Dhttps \
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
> -           file://0001-scenario_groups-default-remove-connectors.patch \
> -           file://0001-sched_stress-Use-time_t-instead-of-long-for-type.=
patch \
>             "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200245): https://lists.openembedded.org/g/openembedde=
d-core/message/200245
> Mute This Topic: https://lists.openembedded.org/mt/106459042/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

