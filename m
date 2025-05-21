Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56660C54FB3
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.4742.1747808414027020730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCEsLRVV;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5399862b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808413; x=1748413213; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRwrVlvLFQyG/tziXzlSYnHcueh1ToLQGbuEdD6osQk=;
        b=mCEsLRVVZzL8cc06Woksr507uxQQgsWK59WqH70VDjzAfLOJdLs6CCFcz1LX8nfZjy
         6qazMPfKkAZ2nAyeWqSyepLNUFlqSJkKAHw6FoFmdNtA27XYeyNChw7XrtsTksMAEcuB
         WlWMHWiQFLVx855GEvb8pMrmCVevVcbfYH49G8LfSl2jpYxoi314eN4pN1d6mTtCpqKc
         Adg0EvH34TUfbCL1UawXBOWOAohuNqCGPamh7Iig1l/aIDdud9lXO9HLFnDmPhgbRQg9
         Bl/7cmrHNumnGUrTxNbh+JmpSV0ZciHZbrPkc/ACXZ7IDK7ePo93dZo4h/PLZf3GGBiZ
         /UAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808413; x=1748413213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRwrVlvLFQyG/tziXzlSYnHcueh1ToLQGbuEdD6osQk=;
        b=n14q9RIT686jS5Gx+7f8f+cjzFkeu+Rri204GB98b4ap/1BkctKOyQsSrOqs0pNn4+
         OQ4ArZRQpjd2JJJ2lngxRT2v4x/ZDDrbRiFBMIRXKzJfFG6F5GUUWmPBsqd6G7RZa0S9
         Z1t0dd86OrI1o7nl6h8+CAqCj5T4pKrspG6kRUU/JKoZGtXRHvj7tBdNsur1GEde8yuD
         2ZCSZJKYa8AXNIa3ieS3bsrNCQt3IBueQ4IZDHh7gOQifT9ikOzs2euGRFrg7N1AXACF
         iyQr3CLNmHYcyCKmfc0b/Jpm1qY5MFAWVp/QNkDkyh1qpSFF7rdFTQ2BtmaX03SlJQdc
         OpXg==
X-Gm-Message-State: AOJu0YweGRcBpv4YStYg+wStvVbJMNmiGxDS30/WWhB+MIMPRT4xhoHj
	/oj+dEdlUF3zfXTRlzU7V91qI7FqfL3qIZQW6U3vJHbzXjtpv5zePy5B/PZnfofj
X-Gm-Gg: ASbGncvvfM+3tw/1zXEwRkRz5WW7ET4iTNWlUSPXa5pT6oH4Kw9dfjxjpwnlAplm+dh
	qR/46tGRrC60ujvtvFkDvnN6kb68C+IBiKGrbzYMYcF0F0FLcmnIqQ1iAguHz3t0E1yv8HL5FfT
	Ad/XeVjMYYc4OufsKhEdggWsm4X+8UkYtv5kswMEuu8e4ERvjyU/PdTnFw+uyAdKUmLx0o7HGRL
	ZggEVf1JCShcxQd9dn3xpXgBtG099HZy6dRSu5hB93MB+GETcqc62fpAjmkq/NSHhJUUrIHhT2I
	Mo3ARp30gGGMOapCyH8s43hCJpUpLtb/6rSS127DyPU=
X-Google-Smtp-Source: AGHT+IEdcN8tPBSs1eqNGgD7Sw/xnoH8LsTq1rybNJ+Ep3fKWyHI5N9tP7MNnp/EiS4d0ArWSJ/Tig==
X-Received: by 2002:a05:6a00:9455:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-742a9786a85mr29437696b3a.3.1747808413134;
        Tue, 20 May 2025 23:20:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:20:02 -0700
Subject: [PATCH v2 26/28] busybox: Fix build on architectures without
 SYS_settimeofday
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-26-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216994

Fixes following errors on riscv32/musl

| util-linux/hwclock.c:143:20: error: use of undeclared identifier 'SYS_settimeofday'
|   143 |         int ret = syscall(SYS_settimeofday, NULL, tz);
|       |                           ^
| 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ck-for-SYS_settimeofday-before-calling-sy.patch | 52 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb        |  1 +
 2 files changed, 53 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
new file mode 100644
index 0000000000000000000000000000000000000000..11ef2b6824b98325642dd13ad74f58126df51f59
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
@@ -0,0 +1,52 @@
+From 4e1eafc6e0de3e58cac9f62e57b552eddb50ca8e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Mar 2021 17:30:24 -0800
+Subject: [PATCH] hwclock: Check for SYS_settimeofday before calling syscall
+
+Some newer architectures e.g. RISCV32 have 64bit time_t from get go and
+thusly do not have gettimeofday_time64/settimeofday_time64 implemented
+therefore check for SYS_settimeofday definition before making the
+syscall. Fixes build for riscv32 and it will bail out at runtime.
+
+This issue has been discussed on the musl mailing list, and
+the musl developers' opinion is that Busybox is wrong:
+
+https://www.openwall.com/lists/musl/2024/03/03/2
+https://www.openwall.com/lists/musl/2024/04/07/2
+
+The correct fix isn't clear, and in the mean time, the patch
+turns the build issue into a runtime error only on the problematic
+architecture (riscv32), which seems like a reasonable trade-off
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2021-March/088583.html]]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util-linux/hwclock.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
+index c3fd0eb57..dea9c9a55 100644
+--- a/util-linux/hwclock.c
++++ b/util-linux/hwclock.c
+@@ -132,6 +132,7 @@ static void show_clock(const char **pp_rtcname, int utc)
+ 
+ static void set_kernel_tz(const struct timezone *tz)
+ {
++	int ret = 1;
+ #if LIBC_IS_MUSL
+ 	/* musl libc does not pass tz argument to syscall
+ 	 * because "it's deprecated by POSIX, therefore it's fine
+@@ -140,9 +141,11 @@ static void set_kernel_tz(const struct timezone *tz)
+ #if !defined(SYS_settimeofday) && defined(SYS_settimeofday_time32)
+ # define SYS_settimeofday SYS_settimeofday_time32
+ #endif
+-	int ret = syscall(SYS_settimeofday, NULL, tz);
++#if defined(SYS_settimeofday)
++	ret = syscall(SYS_settimeofday, NULL, tz);
++#endif
+ #else
+-	int ret = settimeofday(NULL, tz);
++	ret = settimeofday(NULL, tz);
+ #endif
+ 	if (ret)
+ 		bb_simple_perror_msg_and_die("settimeofday");
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 85f22ada5338c419907666a7616cc19efe7565ab..9f7ded3354d91868900eab496708c41144cc3f1b 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-start-stop-daemon-fix-tests.patch \
            file://0003-start-stop-false.patch \
            file://0001-archival-disallow-path-traversals-CVE-2023-39810.patch \
+           file://0001-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

-- 
2.49.0


