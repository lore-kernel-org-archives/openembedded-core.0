Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3761.1793405775019895378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kYy1ZDMX;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so12081755e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405773; x=1794010573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CQp+OgW96VCUalitgjlWvMlpMOj9/AGHssfw13R4XdU=;
        b=kYy1ZDMXTuAXyAIdU6kn4fgfzyFtNj+JHYy3K1Ham1lzW8jXfdf+DBBTcrRcYWj1/p
         OeI9KvOHp16VduN+ExbSRw6/qQEFdZswmCMcsm4eXtdMC9bVcUymJpcsp9o+/VHJ+kvA
         ZVgj3SylPRbz/wOkrc3VN81M8vHVVbt6THA7yeGAEl6km2LkCbnJHytduwleXqB+NtUr
         3R0bXADgNcC2e8U645OkKxsGUnrZ0415HumvX9gbYx5t7mZ1y+4k61m30+e7Aylfyf7y
         QzPfznHf5Yf/3fDRxkULKR/p4rA0vO6qJMlJKftEJtyYqw7/ZsymB0sGCdFcwZJRUgs8
         8SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405773; x=1794010573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CQp+OgW96VCUalitgjlWvMlpMOj9/AGHssfw13R4XdU=;
        b=qJ+bbjjxJjqT5P/bhPtGUDOQ/alMeKfYnMKoun55tZfNEDkrsh16iR7lzrtrqKQcb7
         AwjndHgDySXA9QIFeOQ/mGSrLPgor5dRBJ1AZYqRm7UmtcTgCQiMD14S5zn/Hhp2M9XK
         kRpQjHYnaU4bbXjx8cz5SgOxDudBISWgmyZDDEAmaT0M2tLIxOxkajZD6xgw5LOZ5t/X
         SgLoqfufnWEyD4vdOhIwpe7IU/JHc3eO1BXzF8ux2du3IBBepfBqExQfFLG7g2/nK4n8
         nx7XS4meXBZRIw9qhfui/dAjTx/l39bJb/N51geDqNTrWcqd451bivmvEIDfRJN3dt7B
         9xSQ==
X-Gm-Message-State: AFq9FYLK5AvWfIsQNir71NjcksmPhUFU5EmvmC1EhnEazucyrZpd9Am3
	JWwms+UEwkjoDo9e/CNMmgBS/aKKTVKi6X8HQU3kolTrmRghksXT+HeAkQxSs+KOFisW80Mx3jb
	BMeOdzQM=
X-Gm-Gg: AYBFou1bMa6JAGfY8r924tftP+c2ZhEgYhrQtndcBXthjwXVJT+5j1TBERtMvUnDzqz
	dkTNJTnL/4LHvWqq/Ps3PWmwDMYOgQlLRJmUcBzpD8Bz5SUvvuVVi64cz1Qgz3j8R38q01skkJK
	EmA4tQ/LujbIgmIBTjEsXT+uVDcxHLteYuXKVev+agr/tuUuUg5Po6KZfBhY3tCAPhw7cAWk/oJ
	rSuSa8o0ye2Z3BRKeirkEqH+xL8HD40GPJmkLwnbC8EQeIhm0c0u6bdlHhgbI2gVUMJklyEllas
	JEV6xekQ3miJVHzmHtcRMXOP3Z0kvFAxlNzAav/Q2OgQxnB4CEVUGrBj58AjKJkCQdr09H1v84d
	Hy9DdvBg+caw5cqVaz1kyBsqEFg4RNYOWkmnvwPSYUzVcvncGZh8jjKbuX1QZUwxbQn6xFmSbOb
	ra94cry/oYPa/3vB+3iT3RNu9TIYP3Ee4Ywtoot/LEnYCqBlN1uwZ7fAIyR74QAEUtuU3wNH4Gy
	XoV2NEt2v8HWOIPaINs1A2U11Fw28uED7+h99vUEfpj7yhN/rPeYXO0Kz+APXGpfDM91EuKMoHl
	jy0t+f/ZPlYnYGMLYY2aYitiGbGA37F/f+URuw5739htx4BL4zLy+ZeEaiQGrndOOse045IOqS7
	DK2E1ESmcged2rcRlK1+4VjGKHj42
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr90057455e9.4.1793405771208;
        Fri, 30 Oct 2026 17:16:11 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 46/55] linux-yocto/6.6: update CVE exclusions (6.6.160)
Date: Sat, 31 Oct 2026 01:15:07 +0100
Message-ID: <0d162ab7d30c070bd9fc326ba177baddf62da43a.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249125
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

$ ./meta/recipes-kernel/linux/generate-cve-exclusions.py .../cvelistV5/ 6.6.160 > meta/recipes-kernel/linux/cve-exclusion_6.6.inc

Generated at 2026-10-29 13:34:05.293881+00:00 for kernel version 6.6.160
From cvelistV5 cve_2026-10-29_1300Z-1-g135f63d1c5d

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/cve-exclusion_6.6.inc               | 7716 +++++++++++++++--
 1 file changed, 6817 insertions(+), 899 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index d2704e76449..24961f31688 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-09-10 12:23:31.488006+00:00 for kernel version 6.6.151
-# From cvelistV5 cve_2026-09-10_1100Z-4-g5fc16492753
+# Generated at 2026-10-29 13:34:05.293881+00:00 for kernel version 6.6.160
+# From cvelistV5 cve_2026-10-29_1300Z-1-g135f63d1c5d
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.151"
+    this_version = "6.6.160"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -6054,7 +6054,7 @@ CVE_STATUS[CVE-2023-52584] = "cpe-stable-backport: Backported in 6.6.16"
 
 CVE_STATUS[CVE-2023-52585] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2023-52586 needs backporting (fixed from 6.8)
+CVE_STATUS[CVE-2023-52586] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2023-52587] = "cpe-stable-backport: Backported in 6.6.16"
 
@@ -6062,7 +6062,7 @@ CVE_STATUS[CVE-2023-52588] = "cpe-stable-backport: Backported in 6.6.16"
 
 CVE_STATUS[CVE-2023-52589] = "cpe-stable-backport: Backported in 6.6.16"
 
-# CVE-2023-52590 needs backporting (fixed from 6.8)
+CVE_STATUS[CVE-2023-52590] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2023-52591] = "cpe-stable-backport: Backported in 6.6.16"
 
@@ -9030,9 +9030,11 @@ CVE_STATUS[CVE-2023-54326] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
 
+CVE_STATUS[CVE-2023-7356] = "cpe-stable-backport: Backported in 6.6.145"
+
 CVE_STATUS[CVE-2024-14027] = "cpe-stable-backport: Backported in 6.6.133"
 
-# CVE-2024-14040 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-14040] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-26581] = "cpe-stable-backport: Backported in 6.6.17"
 
@@ -9732,7 +9734,7 @@ CVE_STATUS[CVE-2024-26946] = "cpe-stable-backport: Backported in 6.6.24"
 
 CVE_STATUS[CVE-2024-26947] = "cpe-stable-backport: Backported in 6.6.24"
 
-# CVE-2024-26948 needs backporting (fixed from 6.9)
+CVE_STATUS[CVE-2024-26948] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-26949] = "fixed-version: only affects 6.7.9 onwards"
 
@@ -9852,7 +9854,7 @@ CVE_STATUS[CVE-2024-27008] = "cpe-stable-backport: Backported in 6.6.29"
 
 CVE_STATUS[CVE-2024-27009] = "cpe-stable-backport: Backported in 6.6.29"
 
-# CVE-2024-27010 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2024-27010] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2024-27011] = "cpe-stable-backport: Backported in 6.6.55"
 
@@ -10940,7 +10942,7 @@ CVE_STATUS[CVE-2024-38606] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2024-38607] = "cpe-stable-backport: Backported in 6.6.33"
 
-# CVE-2024-38608 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-38608] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-38609] = "fixed-version: only affects 6.9 onwards"
 
@@ -11068,7 +11070,7 @@ CVE_STATUS[CVE-2024-39476] = "cpe-stable-backport: Backported in 6.6.34"
 
 CVE_STATUS[CVE-2024-39477] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2024-39478 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2024-39478] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2024-39479] = "cpe-stable-backport: Backported in 6.6.34"
 
@@ -11290,7 +11292,7 @@ CVE_STATUS[CVE-2024-40977] = "cpe-stable-backport: Backported in 6.6.36"
 
 CVE_STATUS[CVE-2024-40978] = "cpe-stable-backport: Backported in 6.6.36"
 
-# CVE-2024-40979 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-40979] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-40980] = "cpe-stable-backport: Backported in 6.6.36"
 
@@ -11328,7 +11330,7 @@ CVE_STATUS[CVE-2024-40997] = "cpe-stable-backport: Backported in 6.6.36"
 
 CVE_STATUS[CVE-2024-40998] = "cpe-stable-backport: Backported in 6.6.36"
 
-# CVE-2024-40999 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-40999] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-41000] = "cpe-stable-backport: Backported in 6.6.36"
 
@@ -11346,7 +11348,7 @@ CVE_STATUS[CVE-2024-41006] = "cpe-stable-backport: Backported in 6.6.36"
 
 CVE_STATUS[CVE-2024-41007] = "cpe-stable-backport: Backported in 6.6.41"
 
-# CVE-2024-41008 needs backporting (fixed from 6.9)
+CVE_STATUS[CVE-2024-41008] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-41009] = "cpe-stable-backport: Backported in 6.6.37"
 
@@ -11376,7 +11378,7 @@ CVE_STATUS[CVE-2024-41021] = "cpe-stable-backport: Backported in 6.6.44"
 
 CVE_STATUS[CVE-2024-41022] = "cpe-stable-backport: Backported in 6.6.43"
 
-# CVE-2024-41023 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-41023] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-41025] = "cpe-stable-backport: Backported in 6.6.41"
 
@@ -11418,7 +11420,7 @@ CVE_STATUS[CVE-2024-41043] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2024-41044] = "cpe-stable-backport: Backported in 6.6.41"
 
-# CVE-2024-41045 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-41045] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-41046] = "cpe-stable-backport: Backported in 6.6.41"
 
@@ -11490,13 +11492,13 @@ CVE_STATUS[CVE-2024-41080] = "cpe-stable-backport: Backported in 6.6.62"
 
 CVE_STATUS[CVE-2024-41081] = "cpe-stable-backport: Backported in 6.6.42"
 
-# CVE-2024-41082 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-41082] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-41083] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2024-41084] = "cpe-stable-backport: Backported in 6.6.37"
 
-# CVE-2024-41085 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-41085] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-41086] = "fixed-version: only affects 6.7 onwards"
 
@@ -11526,7 +11528,7 @@ CVE_STATUS[CVE-2024-41098] = "cpe-stable-backport: Backported in 6.6.37"
 
 CVE_STATUS[CVE-2024-41149] = "fixed-version: only affects 6.12.6 onwards"
 
-# CVE-2024-41932 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-41932] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-41935] = "cpe-stable-backport: Backported in 6.6.66"
 
@@ -11538,9 +11540,9 @@ CVE_STATUS[CVE-2024-42065] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2024-42066] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2024-42067 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-42067] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2024-42068 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-42068] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-42069] = "cpe-stable-backport: Backported in 6.6.37"
 
@@ -11618,7 +11620,7 @@ CVE_STATUS[CVE-2024-42105] = "cpe-stable-backport: Backported in 6.6.39"
 
 CVE_STATUS[CVE-2024-42106] = "cpe-stable-backport: Backported in 6.6.39"
 
-# CVE-2024-42107 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-42107] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-42108] = "fixed-version: only affects 6.8 onwards"
 
@@ -11648,7 +11650,7 @@ CVE_STATUS[CVE-2024-42121] = "cpe-stable-backport: Backported in 6.6.39"
 
 CVE_STATUS[CVE-2024-42122] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-42123 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-42123] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-42124] = "cpe-stable-backport: Backported in 6.6.39"
 
@@ -11678,7 +11680,7 @@ CVE_STATUS[CVE-2024-42137] = "cpe-stable-backport: Backported in 6.6.39"
 
 CVE_STATUS[CVE-2024-42138] = "cpe-stable-backport: Backported in 6.6.39"
 
-# CVE-2024-42139 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-42139] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-42140] = "cpe-stable-backport: Backported in 6.6.39"
 
@@ -11708,7 +11710,7 @@ CVE_STATUS[CVE-2024-42153] = "cpe-stable-backport: Backported in 6.6.39"
 
 CVE_STATUS[CVE-2024-42154] = "cpe-stable-backport: Backported in 6.6.39"
 
-# CVE-2024-42155 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-42155] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-42156] = "cpe-stable-backport: Backported in 6.6.64"
 
@@ -11722,7 +11724,7 @@ CVE_STATUS[CVE-2024-42160] = "cpe-stable-backport: Backported in 6.6.39"
 
 CVE_STATUS[CVE-2024-42161] = "cpe-stable-backport: Backported in 6.6.39"
 
-# CVE-2024-42162 needs backporting (fixed from 6.10)
+CVE_STATUS[CVE-2024-42162] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-42223] = "cpe-stable-backport: Backported in 6.6.39"
 
@@ -11908,7 +11910,7 @@ CVE_STATUS[CVE-2024-42315] = "cpe-stable-backport: Backported in 6.6.44"
 
 CVE_STATUS[CVE-2024-42316] = "cpe-stable-backport: Backported in 6.6.44"
 
-# CVE-2024-42317 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-42317] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-42318] = "cpe-stable-backport: Backported in 6.6.44"
 
@@ -11930,7 +11932,7 @@ CVE_STATUS[CVE-2024-43817] = "cpe-stable-backport: Backported in 6.6.44"
 
 CVE_STATUS[CVE-2024-43818] = "cpe-stable-backport: Backported in 6.6.44"
 
-# CVE-2024-43819 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-43819] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-43820] = "fixed-version: only affects 6.7.12 onwards"
 
@@ -11940,7 +11942,7 @@ CVE_STATUS[CVE-2024-43822] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2024-43823] = "cpe-stable-backport: Backported in 6.6.44"
 
-# CVE-2024-43824 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-43824] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-43825] = "cpe-stable-backport: Backported in 6.6.44"
 
@@ -12066,7 +12068,7 @@ CVE_STATUS[CVE-2024-43886] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2024-43887] = "fixed-version: only affects 6.7 onwards"
 
-CVE_STATUS[CVE-2024-43888] = "fixed-version: only affects 6.8 onwards"
+# CVE-2024-43888 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2024-43889] = "cpe-stable-backport: Backported in 6.6.46"
 
@@ -12154,7 +12156,7 @@ CVE_STATUS[CVE-2024-44949] = "cpe-stable-backport: Backported in 6.6.46"
 
 CVE_STATUS[CVE-2024-44950] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-44951 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2024-44951] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-44953] = "fixed-version: only affects 6.8 onwards"
 
@@ -12328,9 +12330,9 @@ CVE_STATUS[CVE-2024-46679] = "cpe-stable-backport: Backported in 6.6.49"
 
 CVE_STATUS[CVE-2024-46680] = "cpe-stable-backport: Backported in 6.6.49"
 
-# CVE-2024-46681 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-46681] = "cpe-stable-backport: Backported in 6.6.160"
 
-CVE_STATUS[CVE-2024-46682] = "fixed-version: only affects 6.9 onwards"
+# CVE-2024-46682 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2024-46683] = "fixed-version: only affects 6.8 onwards"
 
@@ -12424,7 +12426,7 @@ CVE_STATUS[CVE-2024-46728] = "cpe-stable-backport: Backported in 6.6.50"
 
 # CVE-2024-46729 needs backporting (fixed from 6.11)
 
-# CVE-2024-46730 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-46730] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-46731] = "cpe-stable-backport: Backported in 6.6.50"
 
@@ -12472,7 +12474,7 @@ CVE_STATUS[CVE-2024-46752] = "cpe-stable-backport: Backported in 6.6.51"
 
 CVE_STATUS[CVE-2024-46753] = "cpe-stable-backport: Backported in 6.6.87"
 
-# CVE-2024-46754 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2024-46754] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2024-46755] = "cpe-stable-backport: Backported in 6.6.51"
 
@@ -12508,7 +12510,7 @@ CVE_STATUS[CVE-2024-46773] = "cpe-stable-backport: Backported in 6.6.51"
 
 CVE_STATUS[CVE-2024-46774] = "cpe-stable-backport: Backported in 6.6.88"
 
-# CVE-2024-46775 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-46775] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-46776] = "cpe-stable-backport: Backported in 6.6.51"
 
@@ -12574,7 +12576,7 @@ CVE_STATUS[CVE-2024-46806] = "cpe-stable-backport: Backported in 6.6.50"
 
 CVE_STATUS[CVE-2024-46807] = "cpe-stable-backport: Backported in 6.6.50"
 
-# CVE-2024-46808 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-46808] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-46809] = "cpe-stable-backport: Backported in 6.6.50"
 
@@ -12626,7 +12628,7 @@ CVE_STATUS[CVE-2024-46832] = "cpe-stable-backport: Backported in 6.6.51"
 
 CVE_STATUS[CVE-2024-46833] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2024-46834 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-46834] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-46835] = "cpe-stable-backport: Backported in 6.6.51"
 
@@ -12640,7 +12642,7 @@ CVE_STATUS[CVE-2024-46840] = "cpe-stable-backport: Backported in 6.6.51"
 
 CVE_STATUS[CVE-2024-46841] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-46842 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-46842] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-46843] = "cpe-stable-backport: Backported in 6.6.51"
 
@@ -12714,7 +12716,7 @@ CVE_STATUS[CVE-2024-47659] = "cpe-stable-backport: Backported in 6.6.50"
 
 CVE_STATUS[CVE-2024-47660] = "cpe-stable-backport: Backported in 6.6.50"
 
-# CVE-2024-47661 needs backporting (fixed from 6.11)
+CVE_STATUS[CVE-2024-47661] = "cpe-stable-backport: Backported in 6.6.160"
 
 # CVE-2024-47662 needs backporting (fixed from 6.11)
 
@@ -12794,7 +12796,7 @@ CVE_STATUS[CVE-2024-47700] = "cpe-stable-backport: Backported in 6.6.54"
 
 CVE_STATUS[CVE-2024-47701] = "cpe-stable-backport: Backported in 6.6.54"
 
-# CVE-2024-47702 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-47702] = "cpe-stable-backport: Backported in 6.6.158"
 
 # CVE-2024-47703 needs backporting (fixed from 6.12)
 
@@ -12900,7 +12902,7 @@ CVE_STATUS[CVE-2024-47756] = "cpe-stable-backport: Backported in 6.6.54"
 
 CVE_STATUS[CVE-2024-47757] = "cpe-stable-backport: Backported in 6.6.54"
 
-# CVE-2024-47794 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-47794] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-47809] = "cpe-stable-backport: Backported in 6.6.66"
 
@@ -12992,13 +12994,13 @@ CVE_STATUS[CVE-2024-49883] = "cpe-stable-backport: Backported in 6.6.55"
 
 CVE_STATUS[CVE-2024-49884] = "cpe-stable-backport: Backported in 6.6.55"
 
-# CVE-2024-49885 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49885] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-49886] = "cpe-stable-backport: Backported in 6.6.55"
 
 CVE_STATUS[CVE-2024-49887] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2024-49888 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49888] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-49889] = "cpe-stable-backport: Backported in 6.6.55"
 
@@ -13058,15 +13060,15 @@ CVE_STATUS[CVE-2024-49915] = "cpe-stable-backport: Backported in 6.6.64"
 
 CVE_STATUS[CVE-2024-49917] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-49918 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49918] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-49919] = "cpe-stable-backport: Backported in 6.6.79"
 
-# CVE-2024-49920 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49920] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2024-49921 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49921] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2024-49922 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49922] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-49923] = "cpe-stable-backport: Backported in 6.6.79"
 
@@ -13102,7 +13104,7 @@ CVE_STATUS[CVE-2024-49938] = "cpe-stable-backport: Backported in 6.6.55"
 
 CVE_STATUS[CVE-2024-49939] = "cpe-stable-backport: Backported in 6.6.55"
 
-# CVE-2024-49940 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49940] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-49941] = "fixed-version: only affects 6.9 onwards"
 
@@ -13112,7 +13114,7 @@ CVE_STATUS[CVE-2024-49943] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2024-49944] = "cpe-stable-backport: Backported in 6.6.55"
 
-# CVE-2024-49945 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49945] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-49946] = "cpe-stable-backport: Backported in 6.6.55"
 
@@ -13160,7 +13162,7 @@ CVE_STATUS[CVE-2024-49968] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2024-49969] = "cpe-stable-backport: Backported in 6.6.55"
 
-# CVE-2024-49970 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-49970] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-49971] = "fixed-version: only affects 6.11 onwards"
 
@@ -13296,7 +13298,7 @@ CVE_STATUS[CVE-2024-50041] = "cpe-stable-backport: Backported in 6.6.57"
 
 CVE_STATUS[CVE-2024-50042] = "fixed-version: only affects 6.7.10 onwards"
 
-CVE_STATUS[CVE-2024-50043] = "fixed-version: only affects 6.9 onwards"
+# CVE-2024-50043 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2024-50044] = "cpe-stable-backport: Backported in 6.6.57"
 
@@ -13772,7 +13774,7 @@ CVE_STATUS[CVE-2024-50287] = "cpe-stable-backport: Backported in 6.6.61"
 
 CVE_STATUS[CVE-2024-50288] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2024-50289 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-50289] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-50290] = "cpe-stable-backport: Backported in 6.6.61"
 
@@ -13814,7 +13816,7 @@ CVE_STATUS[CVE-2024-52557] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2024-52559] = "cpe-stable-backport: Backported in 6.6.80"
 
-# CVE-2024-52560 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-52560] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2024-53042] = "cpe-stable-backport: Backported in 6.6.60"
 
@@ -13834,7 +13836,7 @@ CVE_STATUS[CVE-2024-53049] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2024-53050] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2024-53051 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-53051] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-53052] = "cpe-stable-backport: Backported in 6.6.60"
 
@@ -13842,7 +13844,7 @@ CVE_STATUS[CVE-2024-53053] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2024-53055] = "cpe-stable-backport: Backported in 6.6.60"
 
-# CVE-2024-53056 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-53056] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2024-53057] = "cpe-stable-backport: Backported in 6.6.60"
 
@@ -13910,7 +13912,7 @@ CVE_STATUS[CVE-2024-53088] = "cpe-stable-backport: Backported in 6.6.61"
 
 # CVE-2024-53089 needs backporting (fixed from 6.12)
 
-# CVE-2024-53090 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-53090] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-53091] = "cpe-stable-backport: Backported in 6.6.62"
 
@@ -13956,7 +13958,7 @@ CVE_STATUS[CVE-2024-53112] = "cpe-stable-backport: Backported in 6.6.63"
 
 CVE_STATUS[CVE-2024-53113] = "cpe-stable-backport: Backported in 6.6.63"
 
-# CVE-2024-53114 needs backporting (fixed from 6.12)
+CVE_STATUS[CVE-2024-53114] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-53115] = "fixed-version: only affects 6.10.4 onwards"
 
@@ -14022,7 +14024,7 @@ CVE_STATUS[CVE-2024-53145] = "cpe-stable-backport: Backported in 6.6.64"
 
 CVE_STATUS[CVE-2024-53146] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-53147 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-53147] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-53148] = "cpe-stable-backport: Backported in 6.6.64"
 
@@ -14100,7 +14102,7 @@ CVE_STATUS[CVE-2024-53185] = "cpe-stable-backport: Backported in 6.6.64"
 
 CVE_STATUS[CVE-2024-53186] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-53187 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-53187] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-53188] = "cpe-stable-backport: Backported in 6.6.64"
 
@@ -14128,7 +14130,7 @@ CVE_STATUS[CVE-2024-53199] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2024-53200] = "cpe-stable-backport: Backported in 6.6.64"
 
-CVE_STATUS[CVE-2024-53201] = "fixed-version: only affects 6.11.3 onwards"
+CVE_STATUS[CVE-2024-53201] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-53202] = "cpe-stable-backport: Backported in 6.6.64"
 
@@ -14164,7 +14166,7 @@ CVE_STATUS[CVE-2024-53217] = "cpe-stable-backport: Backported in 6.6.64"
 
 CVE_STATUS[CVE-2024-53218] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-53219 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-53219] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-53220] = "cpe-stable-backport: Backported in 6.6.64"
 
@@ -14280,7 +14282,7 @@ CVE_STATUS[CVE-2024-56542] = "fixed-version: only affects 6.11.2 onwards"
 
 CVE_STATUS[CVE-2024-56543] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-56544 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-56544] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-56545] = "cpe-stable-backport: Backported in 6.6.64"
 
@@ -14592,7 +14594,7 @@ CVE_STATUS[CVE-2024-56700] = "cpe-stable-backport: Backported in 6.6.64"
 
 CVE_STATUS[CVE-2024-56701] = "cpe-stable-backport: Backported in 6.6.64"
 
-# CVE-2024-56702 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-56702] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-56703] = "cpe-stable-backport: Backported in 6.6.75"
 
@@ -14612,7 +14614,7 @@ CVE_STATUS[CVE-2024-56710] = "cpe-stable-backport: Backported in 6.6.69"
 
 CVE_STATUS[CVE-2024-56711] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2024-56712 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-56712] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-56713] = "fixed-version: only affects 6.10 onwards"
 
@@ -14654,7 +14656,7 @@ CVE_STATUS[CVE-2024-56739] = "cpe-stable-backport: Backported in 6.6.64"
 
 CVE_STATUS[CVE-2024-56740] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2024-56742 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-56742] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-56743] = "fixed-version: only affects 6.12 onwards"
 
@@ -14760,7 +14762,7 @@ CVE_STATUS[CVE-2024-57801] = "cpe-stable-backport: Backported in 6.6.70"
 
 CVE_STATUS[CVE-2024-57802] = "cpe-stable-backport: Backported in 6.6.70"
 
-# CVE-2024-57804 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-57804] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-57805] = "fixed-version: only affects 6.11.6 onwards"
 
@@ -14768,7 +14770,7 @@ CVE_STATUS[CVE-2024-57806] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2024-57807] = "cpe-stable-backport: Backported in 6.6.69"
 
-# CVE-2024-57809 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-57809] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-57834] = "cpe-stable-backport: Backported in 6.6.79"
 
@@ -14788,7 +14790,7 @@ CVE_STATUS[CVE-2024-57850] = "cpe-stable-backport: Backported in 6.6.66"
 
 CVE_STATUS[CVE-2024-57852] = "fixed-version: only affects 6.11.8 onwards"
 
-# CVE-2024-57857 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-57857] = "cpe-stable-backport: Backported in 6.6.160"
 
 # CVE-2024-57872 needs backporting (fixed from 6.13)
 
@@ -14946,11 +14948,11 @@ CVE_STATUS[CVE-2024-57953] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2024-57973] = "cpe-stable-backport: Backported in 6.6.76"
 
-# CVE-2024-57974 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-57974] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2024-57975 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-57975] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2024-57976 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-57976] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-57977] = "cpe-stable-backport: Backported in 6.6.80"
 
@@ -14996,7 +14998,7 @@ CVE_STATUS[CVE-2024-57997] = "cpe-stable-backport: Backported in 6.6.76"
 
 CVE_STATUS[CVE-2024-57998] = "cpe-stable-backport: Backported in 6.6.76"
 
-# CVE-2024-57999 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-57999] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-58000] = "fixed-version: only affects 6.13 onwards"
 
@@ -15010,7 +15012,7 @@ CVE_STATUS[CVE-2024-58004] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2024-58005] = "cpe-stable-backport: Backported in 6.6.78"
 
-# CVE-2024-58006 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-58006] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-58007] = "cpe-stable-backport: Backported in 6.6.78"
 
@@ -15022,7 +15024,7 @@ CVE_STATUS[CVE-2024-58010] = "cpe-stable-backport: Backported in 6.6.78"
 
 CVE_STATUS[CVE-2024-58011] = "cpe-stable-backport: Backported in 6.6.78"
 
-# CVE-2024-58012 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-58012] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2024-58013] = "cpe-stable-backport: Backported in 6.6.78"
 
@@ -15134,9 +15136,9 @@ CVE_STATUS[CVE-2024-58092] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2024-58093] = "cpe-stable-backport: Backported in 6.6.87"
 
-# CVE-2024-58094 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2024-58094] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2024-58095 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2024-58095] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2024-58096] = "cpe-stable-backport: Backported in 6.6.123"
 
@@ -15166,7 +15168,7 @@ CVE_STATUS[CVE-2025-21632] = "cpe-stable-backport: Backported in 6.6.72"
 
 # CVE-2025-21634 needs backporting (fixed from 6.13)
 
-# CVE-2025-21635 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2025-21635] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21636] = "cpe-stable-backport: Backported in 6.6.72"
 
@@ -15194,11 +15196,11 @@ CVE_STATUS[CVE-2025-21647] = "cpe-stable-backport: Backported in 6.6.72"
 
 CVE_STATUS[CVE-2025-21648] = "cpe-stable-backport: Backported in 6.6.72"
 
-# CVE-2025-21649 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2025-21649] = "cpe-stable-backport: Backported in 6.6.157"
 
-# CVE-2025-21650 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2025-21650] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-21651 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2025-21651] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2025-21652] = "cpe-stable-backport: Backported in 6.6.72"
 
@@ -15286,7 +15288,7 @@ CVE_STATUS[CVE-2025-21694] = "cpe-stable-backport: Backported in 6.6.74"
 
 CVE_STATUS[CVE-2025-21695] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2025-21696 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2025-21696] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21697] = "cpe-stable-backport: Backported in 6.6.74"
 
@@ -15320,7 +15322,7 @@ CVE_STATUS[CVE-2025-21712] = "cpe-stable-backport: Backported in 6.6.80"
 
 CVE_STATUS[CVE-2025-21713] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2025-21714 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21714] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21715] = "cpe-stable-backport: Backported in 6.6.76"
 
@@ -15336,9 +15338,9 @@ CVE_STATUS[CVE-2025-21720] = "cpe-stable-backport: Backported in 6.6.76"
 
 CVE_STATUS[CVE-2025-21721] = "cpe-stable-backport: Backported in 6.6.80"
 
-# CVE-2025-21722 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21722] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-21723 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21723] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21724] = "cpe-stable-backport: Backported in 6.6.76"
 
@@ -15350,7 +15352,7 @@ CVE_STATUS[CVE-2025-21727] = "cpe-stable-backport: Backported in 6.6.76"
 
 CVE_STATUS[CVE-2025-21728] = "cpe-stable-backport: Backported in 6.6.76"
 
-# CVE-2025-21729 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21729] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21730] = "fixed-version: only affects 6.13 onwards"
 
@@ -15422,7 +15424,7 @@ CVE_STATUS[CVE-2025-21766] = "cpe-stable-backport: Backported in 6.6.79"
 
 CVE_STATUS[CVE-2025-21767] = "cpe-stable-backport: Backported in 6.6.79"
 
-# CVE-2025-21768 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21768] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21769] = "fixed-version: only affects 6.13 onwards"
 
@@ -15488,7 +15490,7 @@ CVE_STATUS[CVE-2025-21799] = "cpe-stable-backport: Backported in 6.6.76"
 
 CVE_STATUS[CVE-2025-21800] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2025-21801 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21801] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21802] = "cpe-stable-backport: Backported in 6.6.76"
 
@@ -15534,7 +15536,7 @@ CVE_STATUS[CVE-2025-21823] = "cpe-stable-backport: Backported in 6.6.79"
 
 CVE_STATUS[CVE-2025-21824] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2025-21825 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21825] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21826] = "cpe-stable-backport: Backported in 6.6.76"
 
@@ -15622,7 +15624,7 @@ CVE_STATUS[CVE-2025-21868] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-21869] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2025-21870 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21870] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21871] = "cpe-stable-backport: Backported in 6.6.80"
 
@@ -15652,13 +15654,13 @@ CVE_STATUS[CVE-2025-21883] = "cpe-stable-backport: Backported in 6.6.81"
 
 CVE_STATUS[CVE-2025-21884] = "cpe-stable-backport: Backported in 6.6.103"
 
-# CVE-2025-21885 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21885] = "cpe-stable-backport: Backported in 6.6.160"
 
-CVE_STATUS[CVE-2025-21886] = "fixed-version: only affects 6.12.13 onwards"
+# CVE-2025-21886 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2025-21887] = "cpe-stable-backport: Backported in 6.6.81"
 
-# CVE-2025-21888 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21888] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21889] = "cpe-stable-backport: Backported in 6.6.81"
 
@@ -15666,7 +15668,7 @@ CVE_STATUS[CVE-2025-21890] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2025-21891] = "cpe-stable-backport: Backported in 6.6.81"
 
-# CVE-2025-21892 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21892] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21893] = "fixed-version: only affects 6.10 onwards"
 
@@ -15736,7 +15738,7 @@ CVE_STATUS[CVE-2025-21925] = "cpe-stable-backport: Backported in 6.6.83"
 
 CVE_STATUS[CVE-2025-21926] = "cpe-stable-backport: Backported in 6.6.83"
 
-# CVE-2025-21927 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21927] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21928] = "cpe-stable-backport: Backported in 6.6.83"
 
@@ -15766,7 +15768,7 @@ CVE_STATUS[CVE-2025-21940] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2025-21941] = "cpe-stable-backport: Backported in 6.6.83"
 
-CVE_STATUS[CVE-2025-21942] = "fixed-version: only affects 6.13.2 onwards"
+# CVE-2025-21942 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2025-21943] = "cpe-stable-backport: Backported in 6.6.83"
 
@@ -15804,7 +15806,7 @@ CVE_STATUS[CVE-2025-21959] = "cpe-stable-backport: Backported in 6.6.84"
 
 CVE_STATUS[CVE-2025-21960] = "cpe-stable-backport: Backported in 6.6.84"
 
-# CVE-2025-21961 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21961] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21962] = "cpe-stable-backport: Backported in 6.6.84"
 
@@ -15826,7 +15828,7 @@ CVE_STATUS[CVE-2025-21970] = "cpe-stable-backport: Backported in 6.6.84"
 
 CVE_STATUS[CVE-2025-21971] = "cpe-stable-backport: Backported in 6.6.84"
 
-# CVE-2025-21972 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21972] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21973] = "fixed-version: only affects 6.9 onwards"
 
@@ -15834,7 +15836,7 @@ CVE_STATUS[CVE-2025-21974] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2025-21975] = "cpe-stable-backport: Backported in 6.6.84"
 
-# CVE-2025-21976 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21976] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-21977] = "fixed-version: only affects 6.8 onwards"
 
@@ -15958,7 +15960,7 @@ CVE_STATUS[CVE-2025-22037] = "cpe-stable-backport: Backported in 6.6.107"
 
 CVE_STATUS[CVE-2025-22038] = "cpe-stable-backport: Backported in 6.6.87"
 
-# CVE-2025-22039 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22039] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2025-22040] = "cpe-stable-backport: Backported in 6.6.87"
 
@@ -16020,7 +16022,7 @@ CVE_STATUS[CVE-2025-22068] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2025-22069] = "fixed-version: only affects 6.12.75 onwards"
 
-# CVE-2025-22070 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22070] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-22071] = "cpe-stable-backport: Backported in 6.6.87"
 
@@ -16082,13 +16084,13 @@ CVE_STATUS[CVE-2025-22099] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-22100] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-22101 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22101] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2025-22102] = "cpe-stable-backport: Backported in 6.6.92"
 
 CVE_STATUS[CVE-2025-22103] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-22104 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-22104] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2025-22105] = "cpe-stable-backport: Backported in 6.6.119"
 
@@ -16098,7 +16100,7 @@ CVE_STATUS[CVE-2025-22107] = "cpe-stable-backport: Backported in 6.6.120"
 
 # CVE-2025-22108 needs backporting (fixed from 6.15)
 
-# CVE-2025-22109 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22109] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-22110] = "fixed-version: only affects 6.14 onwards"
 
@@ -16106,11 +16108,11 @@ CVE_STATUS[CVE-2025-22111] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-22112] = "fixed-version: only affects 6.12.20 onwards"
 
-# CVE-2025-22113 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22113] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-22114] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-22115 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22115] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-22116] = "fixed-version: only affects 6.7 onwards"
 
@@ -16128,17 +16130,17 @@ CVE_STATUS[CVE-2025-22122] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2025-22123] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2025-22124 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2025-22124] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2025-22125] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2025-22126] = "cpe-stable-backport: Backported in 6.6.88"
 
-# CVE-2025-22127 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22127] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-22128] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2025-23129 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2025-23129] = "cpe-stable-backport: Backported in 6.6.157"
 
 # CVE-2025-23130 needs backporting (fixed from 6.15)
 
@@ -16146,11 +16148,11 @@ CVE_STATUS[CVE-2025-23131] = "cpe-stable-backport: Backported in 6.6.144"
 
 # CVE-2025-23132 needs backporting (fixed from 6.15)
 
-# CVE-2025-23133 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-23133] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-23134] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2025-23135 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-23135] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-23136] = "cpe-stable-backport: Backported in 6.6.87"
 
@@ -16216,7 +16218,7 @@ CVE_STATUS[CVE-2025-37741] = "cpe-stable-backport: Backported in 6.6.88"
 
 CVE_STATUS[CVE-2025-37742] = "cpe-stable-backport: Backported in 6.6.88"
 
-# CVE-2025-37743 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37743] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-37744] = "fixed-version: only affects 6.14 onwards"
 
@@ -16224,13 +16226,13 @@ CVE_STATUS[CVE-2025-37745] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2025-37746] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2025-37747 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2025-37747] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-37748] = "cpe-stable-backport: Backported in 6.6.88"
 
 CVE_STATUS[CVE-2025-37749] = "cpe-stable-backport: Backported in 6.6.88"
 
-# CVE-2025-37750 may need backporting (fixed from 6.7)
+# CVE-2025-37750 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37751] = "fixed-version: only affects 6.14 onwards"
 
@@ -16246,7 +16248,7 @@ CVE_STATUS[CVE-2025-37757] = "cpe-stable-backport: Backported in 6.6.88"
 
 CVE_STATUS[CVE-2025-37758] = "cpe-stable-backport: Backported in 6.6.88"
 
-# CVE-2025-37759 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37759] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-37760] = "fixed-version: only affects 6.12.19 onwards"
 
@@ -16328,15 +16330,15 @@ CVE_STATUS[CVE-2025-37800] = "cpe-stable-backport: Backported in 6.6.89"
 
 CVE_STATUS[CVE-2025-37801] = "cpe-stable-backport: Backported in 6.6.89"
 
-# CVE-2025-37802 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37802] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2025-37803] = "cpe-stable-backport: Backported in 6.6.89"
 
 CVE_STATUS[CVE-2025-37805] = "cpe-stable-backport: Backported in 6.6.89"
 
-# CVE-2025-37806 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37806] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-37807 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37807] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-37808] = "cpe-stable-backport: Backported in 6.6.89"
 
@@ -16386,7 +16388,7 @@ CVE_STATUS[CVE-2025-37830] = "cpe-stable-backport: Backported in 6.6.89"
 
 CVE_STATUS[CVE-2025-37831] = "cpe-stable-backport: Backported in 6.6.89"
 
-# CVE-2025-37833 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37833] = "cpe-stable-backport: Backported in 6.6.157"
 
 # CVE-2025-37834 needs backporting (fixed from 6.15)
 
@@ -16430,7 +16432,7 @@ CVE_STATUS[CVE-2025-37854] = "cpe-stable-backport: Backported in 6.6.88"
 
 CVE_STATUS[CVE-2025-37855] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-37856 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37856] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-37857] = "cpe-stable-backport: Backported in 6.6.88"
 
@@ -16438,9 +16440,9 @@ CVE_STATUS[CVE-2025-37858] = "cpe-stable-backport: Backported in 6.6.88"
 
 CVE_STATUS[CVE-2025-37859] = "cpe-stable-backport: Backported in 6.6.88"
 
-# CVE-2025-37860 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37860] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-37861 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37861] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-37862] = "cpe-stable-backport: Backported in 6.6.88"
 
@@ -16458,7 +16460,7 @@ CVE_STATUS[CVE-2025-37868] = "fixed-version: only affects 6.12.19 onwards"
 
 CVE_STATUS[CVE-2025-37869] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2025-37870 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37870] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-37871] = "fixed-version: only affects 6.13.11 onwards"
 
@@ -16666,7 +16668,7 @@ CVE_STATUS[CVE-2025-37974] = "fixed-version: only affects 6.12.5 onwards"
 
 CVE_STATUS[CVE-2025-37975] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2025-37977 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37977] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-37978] = "fixed-version: only affects 6.8 onwards"
 
@@ -16768,7 +16770,7 @@ CVE_STATUS[CVE-2025-38027] = "cpe-stable-backport: Backported in 6.6.92"
 
 CVE_STATUS[CVE-2025-38028] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-38029 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-38029] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38031] = "cpe-stable-backport: Backported in 6.6.93"
 
@@ -16790,9 +16792,9 @@ CVE_STATUS[CVE-2025-38039] = "cpe-stable-backport: Backported in 6.6.93"
 
 CVE_STATUS[CVE-2025-38040] = "cpe-stable-backport: Backported in 6.6.93"
 
-# CVE-2025-38041 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-38041] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-38042 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-38042] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38043] = "cpe-stable-backport: Backported in 6.6.93"
 
@@ -16826,7 +16828,7 @@ CVE_STATUS[CVE-2025-38058] = "cpe-stable-backport: Backported in 6.6.93"
 
 CVE_STATUS[CVE-2025-38059] = "cpe-stable-backport: Backported in 6.6.93"
 
-# CVE-2025-38060 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2025-38060] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38061] = "cpe-stable-backport: Backported in 6.6.93"
 
@@ -16834,7 +16836,7 @@ CVE_STATUS[CVE-2025-38062] = "cpe-stable-backport: Backported in 6.6.93"
 
 CVE_STATUS[CVE-2025-38063] = "cpe-stable-backport: Backported in 6.6.93"
 
-# CVE-2025-38064 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-38064] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38065] = "cpe-stable-backport: Backported in 6.6.93"
 
@@ -16844,7 +16846,7 @@ CVE_STATUS[CVE-2025-38067] = "cpe-stable-backport: Backported in 6.6.99"
 
 CVE_STATUS[CVE-2025-38068] = "cpe-stable-backport: Backported in 6.6.93"
 
-# CVE-2025-38069 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-38069] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38070] = "fixed-version: only affects 6.13 onwards"
 
@@ -16896,7 +16898,7 @@ CVE_STATUS[CVE-2025-38094] = "cpe-stable-backport: Backported in 6.6.92"
 
 CVE_STATUS[CVE-2025-38095] = "cpe-stable-backport: Backported in 6.6.92"
 
-# CVE-2025-38096 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-38096] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38097] = "cpe-stable-backport: Backported in 6.6.93"
 
@@ -16968,7 +16970,7 @@ CVE_STATUS[CVE-2025-38130] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-38131] = "cpe-stable-backport: Backported in 6.6.94"
 
-# CVE-2025-38132 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38132] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38133] = "fixed-version: only affects 6.15 onwards"
 
@@ -17108,13 +17110,13 @@ CVE_STATUS[CVE-2025-38201] = "cpe-stable-backport: Backported in 6.6.124"
 
 CVE_STATUS[CVE-2025-38202] = "cpe-stable-backport: Backported in 6.6.95"
 
-# CVE-2025-38203 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-38203] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2025-38204 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38204] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38205] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2025-38206 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-38206] = "cpe-stable-backport: Backported in 6.6.156"
 
 # CVE-2025-38207 needs backporting (fixed from 6.16)
 
@@ -17174,7 +17176,7 @@ CVE_STATUS[CVE-2025-38235] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38236] = "cpe-stable-backport: Backported in 6.6.96"
 
-# CVE-2025-38237 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-38237] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2025-38238] = "fixed-version: only affects 6.14 onwards"
 
@@ -17222,13 +17224,13 @@ CVE_STATUS[CVE-2025-38259] = "cpe-stable-backport: Backported in 6.6.96"
 
 CVE_STATUS[CVE-2025-38260] = "cpe-stable-backport: Backported in 6.6.96"
 
-# CVE-2025-38261 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38261] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38262] = "cpe-stable-backport: Backported in 6.6.96"
 
 CVE_STATUS[CVE-2025-38263] = "cpe-stable-backport: Backported in 6.6.96"
 
-# CVE-2025-38264 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38264] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38265] = "cpe-stable-backport: Backported in 6.6.94"
 
@@ -17244,7 +17246,7 @@ CVE_STATUS[CVE-2025-38270] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2025-38271] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-38272 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38272] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38273] = "cpe-stable-backport: Backported in 6.6.94"
 
@@ -17258,7 +17260,7 @@ CVE_STATUS[CVE-2025-38277] = "cpe-stable-backport: Backported in 6.6.94"
 
 CVE_STATUS[CVE-2025-38278] = "cpe-stable-backport: Backported in 6.6.94"
 
-# CVE-2025-38279 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38279] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38280] = "cpe-stable-backport: Backported in 6.6.94"
 
@@ -17284,7 +17286,7 @@ CVE_STATUS[CVE-2025-38290] = "cpe-stable-backport: Backported in 6.6.94"
 
 CVE_STATUS[CVE-2025-38291] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-38292 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38292] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38293] = "cpe-stable-backport: Backported in 6.6.94"
 
@@ -17306,7 +17308,7 @@ CVE_STATUS[CVE-2025-38301] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2025-38302] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2025-38303 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38303] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38304] = "cpe-stable-backport: Backported in 6.6.94"
 
@@ -17418,7 +17420,7 @@ CVE_STATUS[CVE-2025-38357] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38358] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-38359 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38359] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38360] = "fixed-version: only affects 6.7 onwards"
 
@@ -17526,7 +17528,7 @@ CVE_STATUS[CVE-2025-38412] = "cpe-stable-backport: Backported in 6.6.97"
 
 CVE_STATUS[CVE-2025-38413] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2025-38414 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38414] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38415] = "cpe-stable-backport: Backported in 6.6.94"
 
@@ -17712,7 +17714,7 @@ CVE_STATUS[CVE-2025-38505] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2025-38506] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2025-38507 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38507] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38508] = "fixed-version: only affects 6.14 onwards"
 
@@ -17860,7 +17862,7 @@ CVE_STATUS[CVE-2025-38580] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38581] = "cpe-stable-backport: Backported in 6.6.102"
 
-# CVE-2025-38582 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2025-38582] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38583] = "cpe-stable-backport: Backported in 6.6.102"
 
@@ -17878,7 +17880,7 @@ CVE_STATUS[CVE-2025-38589] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-38590] = "cpe-stable-backport: Backported in 6.6.102"
 
-# CVE-2025-38591 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38591] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2025-38592] = "fixed-version: only affects 6.15 onwards"
 
@@ -17886,11 +17888,11 @@ CVE_STATUS[CVE-2025-38593] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-38594] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-38595 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38595] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38596] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-38597 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38597] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38598] = "fixed-version: only affects 6.16 onwards"
 
@@ -17904,7 +17906,7 @@ CVE_STATUS[CVE-2025-38602] = "cpe-stable-backport: Backported in 6.6.102"
 
 CVE_STATUS[CVE-2025-38604] = "cpe-stable-backport: Backported in 6.6.102"
 
-# CVE-2025-38605 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38605] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38606] = "fixed-version: only affects 6.14 onwards"
 
@@ -17964,7 +17966,7 @@ CVE_STATUS[CVE-2025-38634] = "cpe-stable-backport: Backported in 6.6.102"
 
 CVE_STATUS[CVE-2025-38635] = "cpe-stable-backport: Backported in 6.6.102"
 
-# CVE-2025-38636 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38636] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38637] = "cpe-stable-backport: Backported in 6.6.87"
 
@@ -18004,7 +18006,7 @@ CVE_STATUS[CVE-2025-38654] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-38655] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-38656 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2025-38656] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38657] = "fixed-version: only affects 6.16 onwards"
 
@@ -18012,7 +18014,7 @@ CVE_STATUS[CVE-2025-38658] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-38659] = "cpe-stable-backport: Backported in 6.6.102"
 
-# CVE-2025-38660 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38660] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2025-38661] = "fixed-version: only affects 6.15 onwards"
 
@@ -18102,7 +18104,7 @@ CVE_STATUS[CVE-2025-38703] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2025-38704] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2025-38705 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38705] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38706] = "cpe-stable-backport: Backported in 6.6.103"
 
@@ -18136,7 +18138,7 @@ CVE_STATUS[CVE-2025-38720] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-38721] = "cpe-stable-backport: Backported in 6.6.103"
 
-# CVE-2025-38722 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38722] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-38723] = "cpe-stable-backport: Backported in 6.6.103"
 
@@ -18176,7 +18178,7 @@ CVE_STATUS[CVE-2025-39675] = "cpe-stable-backport: Backported in 6.6.103"
 
 CVE_STATUS[CVE-2025-39676] = "cpe-stable-backport: Backported in 6.6.103"
 
-# CVE-2025-39677 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39677] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39678] = "fixed-version: only affects 6.7 onwards"
 
@@ -18232,7 +18234,7 @@ CVE_STATUS[CVE-2025-39703] = "cpe-stable-backport: Backported in 6.6.103"
 
 CVE_STATUS[CVE-2025-39704] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-39705 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39705] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39706] = "cpe-stable-backport: Backported in 6.6.103"
 
@@ -18286,7 +18288,7 @@ CVE_STATUS[CVE-2025-39730] = "cpe-stable-backport: Backported in 6.6.102"
 
 CVE_STATUS[CVE-2025-39731] = "cpe-stable-backport: Backported in 6.6.102"
 
-# CVE-2025-39732 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39732] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39733] = "fixed-version: only affects 6.15 onwards"
 
@@ -18328,7 +18330,7 @@ CVE_STATUS[CVE-2025-39752] = "cpe-stable-backport: Backported in 6.6.103"
 
 CVE_STATUS[CVE-2025-39753] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2025-39754 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39754] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39755] = "fixed-version: only affects 6.13 onwards"
 
@@ -18398,7 +18400,7 @@ CVE_STATUS[CVE-2025-39787] = "cpe-stable-backport: Backported in 6.6.103"
 
 CVE_STATUS[CVE-2025-39788] = "cpe-stable-backport: Backported in 6.6.103"
 
-# CVE-2025-39789 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39789] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39790] = "cpe-stable-backport: Backported in 6.6.103"
 
@@ -18438,7 +18440,7 @@ CVE_STATUS[CVE-2025-39808] = "cpe-stable-backport: Backported in 6.6.104"
 
 CVE_STATUS[CVE-2025-39809] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-39810 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39810] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39811] = "fixed-version: only affects 6.8 onwards"
 
@@ -18476,7 +18478,7 @@ CVE_STATUS[CVE-2025-39827] = "cpe-stable-backport: Backported in 6.6.104"
 
 CVE_STATUS[CVE-2025-39828] = "cpe-stable-backport: Backported in 6.6.104"
 
-# CVE-2025-39829 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39829] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39830] = "fixed-version: only affects 6.12 onwards"
 
@@ -18484,7 +18486,7 @@ CVE_STATUS[CVE-2025-39831] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2025-39832] = "cpe-stable-backport: Backported in 6.6.104"
 
-# CVE-2025-39833 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-39833] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2025-39834] = "fixed-version: only affects 6.12 onwards"
 
@@ -18518,9 +18520,9 @@ CVE_STATUS[CVE-2025-39848] = "cpe-stable-backport: Backported in 6.6.105"
 
 CVE_STATUS[CVE-2025-39849] = "cpe-stable-backport: Backported in 6.6.105"
 
-# CVE-2025-39850 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39850] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-39851 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39851] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39852] = "fixed-version: only affects 6.7 onwards"
 
@@ -18536,13 +18538,13 @@ CVE_STATUS[CVE-2025-39857] = "cpe-stable-backport: Backported in 6.6.105"
 
 CVE_STATUS[CVE-2025-39858] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-39859 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39859] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39860] = "cpe-stable-backport: Backported in 6.6.105"
 
 CVE_STATUS[CVE-2025-39861] = "cpe-stable-backport: Backported in 6.6.105"
 
-# CVE-2025-39862 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39862] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39863] = "cpe-stable-backport: Backported in 6.6.105"
 
@@ -18634,7 +18636,7 @@ CVE_STATUS[CVE-2025-39908] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-39909] = "cpe-stable-backport: Backported in 6.6.107"
 
-# CVE-2025-39910 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39910] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39911] = "cpe-stable-backport: Backported in 6.6.107"
 
@@ -18664,11 +18666,11 @@ CVE_STATUS[CVE-2025-39923] = "cpe-stable-backport: Backported in 6.6.107"
 
 CVE_STATUS[CVE-2025-39924] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-39925 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-39925] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2025-39926] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2025-39927 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39927] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39928] = "fixed-version: only affects 6.13 onwards"
 
@@ -18680,7 +18682,7 @@ CVE_STATUS[CVE-2025-39931] = "cpe-stable-backport: Backported in 6.6.108"
 
 # CVE-2025-39932 needs backporting (fixed from 6.17)
 
-# CVE-2025-39933 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39933] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39934] = "cpe-stable-backport: Backported in 6.6.108"
 
@@ -18694,7 +18696,7 @@ CVE_STATUS[CVE-2025-39938] = "cpe-stable-backport: Backported in 6.6.108"
 
 CVE_STATUS[CVE-2025-39939] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-39940 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39940] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39941] = "fixed-version: only affects 6.14 onwards"
 
@@ -18710,7 +18712,7 @@ CVE_STATUS[CVE-2025-39946] = "cpe-stable-backport: Backported in 6.6.108"
 
 CVE_STATUS[CVE-2025-39947] = "cpe-stable-backport: Backported in 6.6.108"
 
-CVE_STATUS[CVE-2025-39948] = "fixed-version: only affects 6.12.14 onwards"
+CVE_STATUS[CVE-2025-39948] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39949] = "cpe-stable-backport: Backported in 6.6.108"
 
@@ -18730,7 +18732,7 @@ CVE_STATUS[CVE-2025-39956] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2025-39957] = "cpe-stable-backport: Backported in 6.6.108"
 
-# CVE-2025-39958 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39958] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39959] = "fixed-version: only affects 6.15 onwards"
 
@@ -18794,7 +18796,7 @@ CVE_STATUS[CVE-2025-39988] = "cpe-stable-backport: Backported in 6.6.109"
 
 CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.6.89"
 
-# CVE-2025-39990 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39990] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-39991] = "fixed-version: only affects 6.7 onwards"
 
@@ -18820,7 +18822,7 @@ CVE_STATUS[CVE-2025-40001] = "cpe-stable-backport: Backported in 6.6.113"
 
 CVE_STATUS[CVE-2025-40002] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-40003 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40003] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40004] = "fixed-version: only affects 6.12 onwards"
 
@@ -18922,13 +18924,13 @@ CVE_STATUS[CVE-2025-40052] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40053] = "cpe-stable-backport: Backported in 6.6.112"
 
-# CVE-2025-40054 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2025-40054] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2025-40055] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40056] = "cpe-stable-backport: Backported in 6.6.112"
 
-# CVE-2025-40057 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40057] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40058] = "fixed-version: only affects 6.7 onwards"
 
@@ -18942,9 +18944,9 @@ CVE_STATUS[CVE-2025-40062] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40063] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-40064 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-40064] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2025-40065 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40065] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40066] = "fixed-version: only affects 6.15 onwards"
 
@@ -18962,9 +18964,9 @@ CVE_STATUS[CVE-2025-40072] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-40073] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-40074 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40074] = "cpe-stable-backport: Backported in 6.6.157"
 
-# CVE-2025-40075 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40075] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40076] = "fixed-version: only affects 6.17 onwards"
 
@@ -19008,7 +19010,7 @@ CVE_STATUS[CVE-2025-40095] = "cpe-stable-backport: Backported in 6.6.114"
 
 CVE_STATUS[CVE-2025-40096] = "cpe-stable-backport: Backported in 6.6.114"
 
-# CVE-2025-40097 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40097] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2025-40098] = "fixed-version: only affects 6.7 onwards"
 
@@ -19018,7 +19020,7 @@ CVE_STATUS[CVE-2025-40100] = "cpe-stable-backport: Backported in 6.6.114"
 
 CVE_STATUS[CVE-2025-40101] = "fixed-version: only affects 6.7.11 onwards"
 
-# CVE-2025-40102 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-40102] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2025-40103] = "cpe-stable-backport: Backported in 6.6.114"
 
@@ -19084,13 +19086,13 @@ CVE_STATUS[CVE-2025-40134] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40135] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2025-40136 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40136] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40137] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40138] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-40139 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-40139] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2025-40140] = "cpe-stable-backport: Backported in 6.6.112"
 
@@ -19126,7 +19128,7 @@ CVE_STATUS[CVE-2025-40156] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40157] = "cpe-stable-backport: Backported in 6.6.112"
 
-# CVE-2025-40158 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40158] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40159] = "fixed-version: only affects 6.8 onwards"
 
@@ -19146,11 +19148,11 @@ CVE_STATUS[CVE-2025-40166] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2025-40167] = "cpe-stable-backport: Backported in 6.6.114"
 
-# CVE-2025-40168 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2025-40168] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2025-40169] = "cpe-stable-backport: Backported in 6.6.112"
 
-# CVE-2025-40170 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40170] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40171] = "cpe-stable-backport: Backported in 6.6.112"
 
@@ -19170,7 +19172,7 @@ CVE_STATUS[CVE-2025-40178] = "cpe-stable-backport: Backported in 6.6.113"
 
 CVE_STATUS[CVE-2025-40179] = "cpe-stable-backport: Backported in 6.6.113"
 
-# CVE-2025-40180 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40180] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40181] = "fixed-version: only affects 6.12 onwards"
 
@@ -19236,7 +19238,7 @@ CVE_STATUS[CVE-2025-40211] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-40212] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2025-40213 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2025-40213] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40214] = "cpe-stable-backport: Backported in 6.6.117"
 
@@ -19388,7 +19390,7 @@ CVE_STATUS[CVE-2025-40287] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2025-40288] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-40289 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40289] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40290] = "fixed-version: only affects 6.16.8 onwards"
 
@@ -19460,7 +19462,7 @@ CVE_STATUS[CVE-2025-40323] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-40324] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-40325 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-40325] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-40326] = "fixed-version: only affects 6.14 onwards"
 
@@ -19486,7 +19488,7 @@ CVE_STATUS[CVE-2025-40336] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-40337] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-40338 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40338] = "cpe-stable-backport: Backported in 6.6.160"
 
 # CVE-2025-40339 needs backporting (fixed from 6.18)
 
@@ -19554,7 +19556,7 @@ CVE_STATUS[CVE-2025-68173] = "cpe-stable-backport: Backported in 6.6.117"
 
 # CVE-2025-68174 needs backporting (fixed from 6.18)
 
-# CVE-2025-68175 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68175] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68176] = "cpe-stable-backport: Backported in 6.6.117"
 
@@ -19580,11 +19582,11 @@ CVE_STATUS[CVE-2025-68186] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2025-68187] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-68188 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68188] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68189] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-68190 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68190] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2025-68191] = "cpe-stable-backport: Backported in 6.6.117"
 
@@ -19594,8 +19596,6 @@ CVE_STATUS[CVE-2025-68193] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2025-68194] = "cpe-stable-backport: Backported in 6.6.117"
 
-CVE_STATUS[CVE-2025-68195] = "fixed-version: only affects 6.12.58 onwards"
-
 CVE_STATUS[CVE-2025-68196] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2025-68197] = "fixed-version: only affects 6.13 onwards"
@@ -19606,7 +19606,7 @@ CVE_STATUS[CVE-2025-68199] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2025-68200] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-68201 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68201] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68202] = "fixed-version: only affects 6.12 onwards"
 
@@ -19620,7 +19620,7 @@ CVE_STATUS[CVE-2025-68207] = "fixed-version: only affects 6.12.37 onwards"
 
 CVE_STATUS[CVE-2025-68208] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-68209 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68209] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68210] = "fixed-version: only affects 6.10 onwards"
 
@@ -19660,7 +19660,7 @@ CVE_STATUS[CVE-2025-68228] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-68229] = "cpe-stable-backport: Backported in 6.6.118"
 
-# CVE-2025-68230 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68230] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68231] = "cpe-stable-backport: Backported in 6.6.118"
 
@@ -19672,7 +19672,7 @@ CVE_STATUS[CVE-2025-68234] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2025-68235] = "cpe-stable-backport: Backported in 6.6.118"
 
-# CVE-2025-68236 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68236] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68237] = "cpe-stable-backport: Backported in 6.6.118"
 
@@ -19702,7 +19702,7 @@ CVE_STATUS[CVE-2025-68249] = "cpe-stable-backport: Backported in 6.6.115"
 
 CVE_STATUS[CVE-2025-68250] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-68251 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2025-68251] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68252] = "cpe-stable-backport: Backported in 6.6.115"
 
@@ -19794,11 +19794,11 @@ CVE_STATUS[CVE-2025-68309] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-68310] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-68311 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68311] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68312] = "cpe-stable-backport: Backported in 6.6.117"
 
-CVE_STATUS[CVE-2025-68313] = "fixed-version: only affects 6.6.156 onwards"
+# CVE-2025-68313 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2025-68314] = "fixed-version: only affects 6.17 onwards"
 
@@ -19820,7 +19820,7 @@ CVE_STATUS[CVE-2025-68321] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-68323] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-68324 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68324] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68325] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -19884,7 +19884,7 @@ CVE_STATUS[CVE-2025-68354] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-68355] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2025-68356 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68356] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68357] = "fixed-version: only affects 6.17.13 onwards"
 
@@ -19920,15 +19920,15 @@ CVE_STATUS[CVE-2025-68372] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-68373] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-68374 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68374] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68375] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-68376 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68376] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68377] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2025-68378 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68378] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68379] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -19944,7 +19944,7 @@ CVE_STATUS[CVE-2025-68727] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-68728] = "cpe-stable-backport: Backported in 6.6.120"
 
-# CVE-2025-68729 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68729] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68730] = "fixed-version: only affects 6.8 onwards"
 
@@ -19976,7 +19976,7 @@ CVE_STATUS[CVE-2025-68743] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-68744] = "cpe-stable-backport: Backported in 6.6.120"
 
-# CVE-2025-68745 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68745] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68746] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -20126,7 +20126,7 @@ CVE_STATUS[CVE-2025-68820] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-68821] = "cpe-stable-backport: Backported in 6.6.120"
 
-# CVE-2025-68822 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68822] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-68823] = "cpe-stable-backport: Backported in 6.6.124"
 
@@ -20146,11 +20146,11 @@ CVE_STATUS[CVE-2025-71070] = "fixed-version: only affects 6.14.6 onwards"
 
 CVE_STATUS[CVE-2025-71071] = "cpe-stable-backport: Backported in 6.6.120"
 
-# CVE-2025-71072 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71072] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-71073 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71073] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-71074 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71074] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-71075] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -20220,7 +20220,7 @@ CVE_STATUS[CVE-2025-71107] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-71108] = "cpe-stable-backport: Backported in 6.6.120"
 
-# CVE-2025-71109 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71109] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-71110] = "fixed-version: only affects 6.18 onwards"
 
@@ -20388,9 +20388,9 @@ CVE_STATUS[CVE-2025-71223] = "cpe-stable-backport: Backported in 6.6.124"
 
 CVE_STATUS[CVE-2025-71224] = "cpe-stable-backport: Backported in 6.6.124"
 
-# CVE-2025-71225 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71225] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-71227 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71227] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-71229] = "cpe-stable-backport: Backported in 6.6.125"
 
@@ -20428,13 +20428,13 @@ CVE_STATUS[CVE-2025-71270] = "cpe-stable-backport: Backported in 6.6.124"
 
 CVE_STATUS[CVE-2025-71271] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-71272 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2025-71272] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2025-71273 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2025-71273] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-71274] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2025-71285 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2025-71285] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-71286] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -20488,12 +20488,32 @@ CVE_STATUS[CVE-2025-71311] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2025-71312] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2025-71313 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2025-71313] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2025-71314] = "fixed-version: only affects 6.10 onwards"
 
 # CVE-2025-71315 needs backporting (fixed from 6.19)
 
+CVE_STATUS[CVE-2026-100070] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-100071] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-100072] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-100073] = "fixed-version: only affects 6.16.3 onwards"
+
+CVE_STATUS[CVE-2026-100074] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-100075] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-100076] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-100077] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-100078] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-100079] = "cpe-stable-backport: Backported in 6.6.157"
+
 CVE_STATUS[CVE-2026-17523] = "fixed-version: Fixed from version 5.4"
 
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.6.121"
@@ -20536,7 +20556,7 @@ CVE_STATUS[CVE-2026-22994] = "cpe-stable-backport: Backported in 6.6.121"
 
 CVE_STATUS[CVE-2026-22995] = "fixed-version: only affects 6.18.4 onwards"
 
-# CVE-2026-22996 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-22996] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-22997] = "cpe-stable-backport: Backported in 6.6.122"
 
@@ -20614,7 +20634,7 @@ CVE_STATUS[CVE-2026-23033] = "cpe-stable-backport: Backported in 6.6.122"
 
 CVE_STATUS[CVE-2026-23034] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23035 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23035] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23036] = "fixed-version: only affects 6.13 onwards"
 
@@ -20818,7 +20838,7 @@ CVE_STATUS[CVE-2026-23135] = "cpe-stable-backport: Backported in 6.6.122"
 
 CVE_STATUS[CVE-2026-23136] = "cpe-stable-backport: Backported in 6.6.121"
 
-# CVE-2026-23137 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23137] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23138] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -20926,7 +20946,7 @@ CVE_STATUS[CVE-2026-23189] = "fixed-version: only affects 6.12.58 onwards"
 
 CVE_STATUS[CVE-2026-23190] = "cpe-stable-backport: Backported in 6.6.124"
 
-# CVE-2026-23191 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23191] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-23192] = "fixed-version: only affects 6.15 onwards"
 
@@ -20958,9 +20978,9 @@ CVE_STATUS[CVE-2026-23205] = "cpe-stable-backport: Backported in 6.6.124"
 
 CVE_STATUS[CVE-2026-23206] = "cpe-stable-backport: Backported in 6.6.124"
 
-# CVE-2026-23207 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-23207] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-23208 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23208] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23209] = "cpe-stable-backport: Backported in 6.6.124"
 
@@ -20970,9 +20990,9 @@ CVE_STATUS[CVE-2026-23211] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-23212] = "cpe-stable-backport: Backported in 6.6.123"
 
-# CVE-2026-23213 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23213] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-23214 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23214] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23215] = "fixed-version: only affects 6.11 onwards"
 
@@ -20996,7 +21016,7 @@ CVE_STATUS[CVE-2026-23224] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-23225] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23226 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23226] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23227] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21038,7 +21058,7 @@ CVE_STATUS[CVE-2026-23245] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23246] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23247 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23247] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23248] = "fixed-version: only affects 6.14 onwards"
 
@@ -21096,7 +21116,7 @@ CVE_STATUS[CVE-2026-23274] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23275] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-23276 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23276] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23277] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21134,7 +21154,7 @@ CVE_STATUS[CVE-2026-23293] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23294] = "fixed-version: only affects 6.18 onwards"
 
-CVE_STATUS[CVE-2026-23295] = "fixed-version: only affects 6.19 onwards"
+CVE_STATUS[CVE-2026-23295] = "fixed-version: only affects 6.18.57 onwards"
 
 CVE_STATUS[CVE-2026-23296] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21196,7 +21216,7 @@ CVE_STATUS[CVE-2026-23325] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23326] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-23327 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23327] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23328] = "fixed-version: only affects 6.14 onwards"
 
@@ -21262,7 +21282,7 @@ CVE_STATUS[CVE-2026-23359] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23360] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-23361 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23361] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23362] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21282,7 +21302,7 @@ CVE_STATUS[CVE-2026-23369] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-23370] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23371 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23371] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23372] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21294,7 +21314,7 @@ CVE_STATUS[CVE-2026-23375] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-23376] = "fixed-version: only affects 6.17.3 onwards"
 
-# CVE-2026-23377 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23377] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23378] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21306,7 +21326,7 @@ CVE_STATUS[CVE-2026-23381] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23382] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23383 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23383] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23384] = "fixed-version: only affects 6.18 onwards"
 
@@ -21458,7 +21478,7 @@ CVE_STATUS[CVE-2026-23457] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23458] = "cpe-stable-backport: Backported in 6.6.130"
 
-CVE_STATUS[CVE-2026-23459] = "fixed-version: only affects 6.6.153 onwards"
+CVE_STATUS[CVE-2026-23459] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23460] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21482,7 +21502,7 @@ CVE_STATUS[CVE-2026-23469] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-23470] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-23472 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23472] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-23474] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21528,7 +21548,7 @@ CVE_STATUS[CVE-2026-31408] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31409] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31410 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31410] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31411] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -21548,7 +21568,7 @@ CVE_STATUS[CVE-2026-31418] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31419] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-31420 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31420] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-31421] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -21632,7 +21652,7 @@ CVE_STATUS[CVE-2026-31460] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-31461] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-31462 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31462] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31463] = "fixed-version: only affects 6.19 onwards"
 
@@ -21682,7 +21702,7 @@ CVE_STATUS[CVE-2026-31485] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31486] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-31487 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31487] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31488] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -21694,7 +21714,7 @@ CVE_STATUS[CVE-2026-31491] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-31492] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31493 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31493] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31494] = "cpe-stable-backport: Backported in 6.6.131"
 
@@ -21718,9 +21738,9 @@ CVE_STATUS[CVE-2026-31503] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31504] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31505 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31505] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-31506 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31506] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31507] = "cpe-stable-backport: Backported in 6.6.131"
 
@@ -21736,7 +21756,7 @@ CVE_STATUS[CVE-2026-31512] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31513] = "fixed-version: only affects 6.12.75 onwards"
 
-CVE_STATUS[CVE-2026-31514] = "fixed-version: only affects 6.12.75 onwards"
+CVE_STATUS[CVE-2026-31514] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-31515] = "cpe-stable-backport: Backported in 6.6.131"
 
@@ -21768,9 +21788,9 @@ CVE_STATUS[CVE-2026-31528] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31529] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31530 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31530] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-31531 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31531] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31532] = "cpe-stable-backport: Backported in 6.6.136"
 
@@ -21820,13 +21840,13 @@ CVE_STATUS[CVE-2026-31555] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31556] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-31557 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31557] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31558] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2026-31559] = "fixed-version: only affects 6.12.43 onwards"
 
-# CVE-2026-31560 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31560] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31561] = "fixed-version: only affects 6.9 onwards"
 
@@ -21842,7 +21862,7 @@ CVE_STATUS[CVE-2026-31566] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31567] = "fixed-version: only affects 6.17.8 onwards"
 
-# CVE-2026-31568 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31568] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31569] = "fixed-version: only affects 6.13 onwards"
 
@@ -21852,7 +21872,7 @@ CVE_STATUS[CVE-2026-31571] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-31572] = "fixed-version: only affects 6.16 onwards"
 
-CVE_STATUS[CVE-2026-31573] = "fixed-version: only affects 6.19.6 onwards"
+# CVE-2026-31573 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2026-31574] = "fixed-version: only affects 7.0 onwards"
 
@@ -21890,7 +21910,7 @@ CVE_STATUS[CVE-2026-31590] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31591] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-31592 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-31592] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31593] = "fixed-version: only affects 6.11 onwards"
 
@@ -21918,7 +21938,7 @@ CVE_STATUS[CVE-2026-31604] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31605] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31606 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-31606] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31607] = "cpe-stable-backport: Backported in 6.6.136"
 
@@ -21966,7 +21986,7 @@ CVE_STATUS[CVE-2026-31628] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31629] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31630 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31630] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31631] = "fixed-version: only affects 6.16 onwards"
 
@@ -21996,7 +22016,7 @@ CVE_STATUS[CVE-2026-31643] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-31644] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-31645 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31645] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31646] = "cpe-stable-backport: Backported in 6.6.135"
 
@@ -22032,7 +22052,7 @@ CVE_STATUS[CVE-2026-31661] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31662] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31663 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31663] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31664] = "cpe-stable-backport: Backported in 6.6.135"
 
@@ -22060,7 +22080,7 @@ CVE_STATUS[CVE-2026-31675] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31676] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31677 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31677] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31678] = "cpe-stable-backport: Backported in 6.6.131"
 
@@ -22116,7 +22136,7 @@ CVE_STATUS[CVE-2026-31704] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31705] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31706 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-31706] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31707] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -22124,7 +22144,7 @@ CVE_STATUS[CVE-2026-31708] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31709] = "cpe-stable-backport: Backported in 6.6.140"
 
-CVE_STATUS[CVE-2026-31710] = "fixed-version: only affects 7.0 onwards"
+CVE_STATUS[CVE-2026-31710] = "fixed-version: only affects 6.18.53 onwards"
 
 CVE_STATUS[CVE-2026-31711] = "cpe-stable-backport: Backported in 6.6.136"
 
@@ -22148,13 +22168,13 @@ CVE_STATUS[CVE-2026-31720] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31721] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31722 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31722] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-31723 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31723] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-31724 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31724] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-31725 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31725] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31726] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22238,7 +22258,7 @@ CVE_STATUS[CVE-2026-31765] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-31766] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-31767 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31767] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31768] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22246,7 +22266,7 @@ CVE_STATUS[CVE-2026-31769] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-31770] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31771 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31771] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-31772] = "fixed-version: only affects 6.12.2 onwards"
 
@@ -22254,7 +22274,7 @@ CVE_STATUS[CVE-2026-31773] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31774] = "fixed-version: only affects 6.10 onwards"
 
-CVE_STATUS[CVE-2026-31775] = "fixed-version: only affects 6.19 onwards"
+CVE_STATUS[CVE-2026-31775] = "fixed-version: only affects 6.18.57 onwards"
 
 CVE_STATUS[CVE-2026-31776] = "fixed-version: only affects 6.19 onwards"
 
@@ -22292,7 +22312,7 @@ CVE_STATUS[CVE-2026-43007] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43008] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43009 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43009] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43010] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -22318,7 +22338,7 @@ CVE_STATUS[CVE-2026-43020] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43021] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43022 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-43022] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43023] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22346,7 +22366,7 @@ CVE_STATUS[CVE-2026-43034] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-43035] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43036 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43036] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43037] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22358,7 +22378,7 @@ CVE_STATUS[CVE-2026-43040] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43041] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43042 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43042] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43043] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22370,9 +22390,9 @@ CVE_STATUS[CVE-2026-43046] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43047] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43048 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43048] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43049 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43049] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43050] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22392,7 +22412,7 @@ CVE_STATUS[CVE-2026-43057] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43058] = "cpe-stable-backport: Backported in 6.6.136"
 
-CVE_STATUS[CVE-2026-43059] = "fixed-version: only affects 6.12.59 onwards"
+CVE_STATUS[CVE-2026-43059] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43060] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -22420,7 +22440,7 @@ CVE_STATUS[CVE-2026-43071] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43072] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43073 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-43073] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43074] = "cpe-stable-backport: Backported in 6.6.136"
 
@@ -22440,7 +22460,7 @@ CVE_STATUS[CVE-2026-43081] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43082] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43083 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43083] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43084] = "fixed-version: only affects 6.12.75 onwards"
 
@@ -22476,7 +22496,7 @@ CVE_STATUS[CVE-2026-43099] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43100] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43101 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43101] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43102] = "fixed-version: only affects 6.15 onwards"
 
@@ -22488,7 +22508,7 @@ CVE_STATUS[CVE-2026-43105] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43106] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43107 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43107] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43108] = "fixed-version: only affects 6.11 onwards"
 
@@ -22504,13 +22524,13 @@ CVE_STATUS[CVE-2026-43113] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43114] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43115 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43115] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43116] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43117] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43118 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43118] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43119] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -22522,11 +22542,11 @@ CVE_STATUS[CVE-2026-43123] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43124] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43125 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43125] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43126 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43126] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43127 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-43127] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43128] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22578,7 +22598,7 @@ CVE_STATUS[CVE-2026-43151] = "fixed-version: only affects 6.18.3 onwards"
 
 CVE_STATUS[CVE-2026-43152] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43153 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43153] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43154] = "fixed-version: only affects 6.18 onwards"
 
@@ -22616,7 +22636,7 @@ CVE_STATUS[CVE-2026-43170] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43171] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43172 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43172] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43173] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22642,13 +22662,13 @@ CVE_STATUS[CVE-2026-43183] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43184] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43185 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43185] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43186] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43187] = "cpe-stable-backport: Backported in 6.6.128"
 
-CVE_STATUS[CVE-2026-43188] = "fixed-version: only affects 6.15 onwards"
+CVE_STATUS[CVE-2026-43188] = "fixed-version: only affects 6.12.114 onwards"
 
 CVE_STATUS[CVE-2026-43189] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22666,11 +22686,11 @@ CVE_STATUS[CVE-2026-43195] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-43196] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43197 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43197] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43198 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43198] = "cpe-stable-backport: Backported in 6.6.157"
 
-# CVE-2026-43199 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43199] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43200] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22680,7 +22700,7 @@ CVE_STATUS[CVE-2026-43202] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43203] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43204 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43204] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43205] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22698,7 +22718,7 @@ CVE_STATUS[CVE-2026-43211] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43212] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43213 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43213] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43214] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22740,7 +22760,7 @@ CVE_STATUS[CVE-2026-43232] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43233] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43234 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43234] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43235] = "fixed-version: only affects 6.18 onwards"
 
@@ -22760,7 +22780,7 @@ CVE_STATUS[CVE-2026-43242] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43243] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-43244 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43244] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43245] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -22768,11 +22788,11 @@ CVE_STATUS[CVE-2026-43246] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43247] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-43248 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43248] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43249 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43249] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43250 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43250] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43251] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22788,7 +22808,7 @@ CVE_STATUS[CVE-2026-43256] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43257] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43258 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43258] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43259] = "fixed-version: only affects 6.15 onwards"
 
@@ -22860,7 +22880,7 @@ CVE_STATUS[CVE-2026-43292] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-43293] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-43294 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43294] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43295] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22868,9 +22888,9 @@ CVE_STATUS[CVE-2026-43296] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43297] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-43298 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43298] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43299 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43299] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43300] = "fixed-version: only affects 6.7 onwards"
 
@@ -22888,11 +22908,11 @@ CVE_STATUS[CVE-2026-43306] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2026-43307] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43308 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43308] = "cpe-stable-backport: Backported in 6.6.160"
 
 # CVE-2026-43309 needs backporting (fixed from 7.0)
 
-# CVE-2026-43310 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43310] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43311] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -22906,7 +22926,7 @@ CVE_STATUS[CVE-2026-43315] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43316] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43317 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43317] = "cpe-stable-backport: Backported in 6.6.160"
 
 # CVE-2026-43318 needs backporting (fixed from 7.0)
 
@@ -22948,7 +22968,7 @@ CVE_STATUS[CVE-2026-43336] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-43337] = "fixed-version: only affects 6.11.3 onwards"
 
-# CVE-2026-43338 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43338] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43339] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22960,7 +22980,7 @@ CVE_STATUS[CVE-2026-43342] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43343] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43344 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43344] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-43345] = "cpe-stable-backport: Backported in 6.6.136"
 
@@ -22976,9 +22996,9 @@ CVE_STATUS[CVE-2026-43350] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43351] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-43352 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43352] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43353 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43353] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43354] = "fixed-version: only affects 6.12 onwards"
 
@@ -23100,7 +23120,7 @@ CVE_STATUS[CVE-2026-43412] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43413] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43414 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-43414] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43415] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -23154,13 +23174,13 @@ CVE_STATUS[CVE-2026-43441] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43442] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43443 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43443] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43444] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-43445] = "cpe-stable-backport: Backported in 6.6.130"
 
-CVE_STATUS[CVE-2026-43446] = "fixed-version: only affects 6.19 onwards"
+CVE_STATUS[CVE-2026-43446] = "fixed-version: only affects 6.18.57 onwards"
 
 CVE_STATUS[CVE-2026-43447] = "fixed-version: only affects 6.15 onwards"
 
@@ -23196,9 +23216,9 @@ CVE_STATUS[CVE-2026-43462] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-43463] = "fixed-version: only affects 6.7.3 onwards"
 
-# CVE-2026-43464 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-43464] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-43465 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-43465] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-43466] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -23326,11 +23346,11 @@ CVE_STATUS[CVE-2026-45857] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45858] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-45859 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-45859] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45860] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-45861 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45861] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45862] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -23362,7 +23382,7 @@ CVE_STATUS[CVE-2026-45875] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45876] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-45877 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45877] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45878] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -23394,15 +23414,15 @@ CVE_STATUS[CVE-2026-45891] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45892] = "fixed-version: Fixed from version 6.1.168"
 
-# CVE-2026-45893 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45893] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-45894 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45894] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45895] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45896] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-45897 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-45897] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-45898] = "fixed-version: only affects 6.11 onwards"
 
@@ -23410,7 +23430,7 @@ CVE_STATUS[CVE-2026-45899] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-45900] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-45901 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-45901] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45902] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -23442,7 +23462,7 @@ CVE_STATUS[CVE-2026-45915] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45916] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-45917 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45917] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45918] = "fixed-version: only affects 6.16 onwards"
 
@@ -23472,11 +23492,11 @@ CVE_STATUS[CVE-2026-45930] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-45931] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-45932 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45932] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45933] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-45934 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45934] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45935] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -23488,15 +23508,15 @@ CVE_STATUS[CVE-2026-45938] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-45939] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-45940 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45940] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45941] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45942] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-45943 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45943] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-45944 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45944] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45945] = "fixed-version: only affects 6.13 onwards"
 
@@ -23506,7 +23526,7 @@ CVE_STATUS[CVE-2026-45947] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45948] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-45949 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45949] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45950] = "fixed-version: only affects 6.10 onwards"
 
@@ -23530,11 +23550,11 @@ CVE_STATUS[CVE-2026-45959] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-45960] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-45961 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-45961] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45962] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-45963 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-45963] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-45964] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -23554,7 +23574,7 @@ CVE_STATUS[CVE-2026-45971] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-45972] = "cpe-stable-backport: Backported in 6.6.128"
 
-CVE_STATUS[CVE-2026-45973] = "fixed-version: only affects 6.12.2 onwards"
+CVE_STATUS[CVE-2026-45973] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-45974] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -23634,7 +23654,7 @@ CVE_STATUS[CVE-2026-46012] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46013] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-46014 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46014] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46015] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23670,7 +23690,7 @@ CVE_STATUS[CVE-2026-46030] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-46031] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46032 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46032] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46033] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23724,7 +23744,7 @@ CVE_STATUS[CVE-2026-46057] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-46058] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46059 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46059] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46060] = "fixed-version: only affects 6.16 onwards"
 
@@ -23738,7 +23758,7 @@ CVE_STATUS[CVE-2026-46064] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46065] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46066 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46066] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46067] = "fixed-version: only affects 6.19 onwards"
 
@@ -23748,7 +23768,7 @@ CVE_STATUS[CVE-2026-46069] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46070] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46071 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46071] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46072] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23758,7 +23778,7 @@ CVE_STATUS[CVE-2026-46074] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-46075] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46076 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46076] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46077] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23786,7 +23806,7 @@ CVE_STATUS[CVE-2026-46088] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46089] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46090 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46090] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-46091] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23866,7 +23886,7 @@ CVE_STATUS[CVE-2026-46128] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46129] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46130 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-46130] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46131] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23902,7 +23922,7 @@ CVE_STATUS[CVE-2026-46146] = "cpe-stable-backport: Backported in 6.6.140"
 
 # CVE-2026-46147 needs backporting (fixed from 7.1)
 
-# CVE-2026-46148 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46148] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46149] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23920,7 +23940,7 @@ CVE_STATUS[CVE-2026-46155] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46156] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46157 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46157] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46158] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -23948,7 +23968,7 @@ CVE_STATUS[CVE-2026-46169] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46170] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-46171 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46171] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46172] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23956,7 +23976,7 @@ CVE_STATUS[CVE-2026-46173] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46174] = "cpe-stable-backport: Backported in 6.6.139"
 
-# CVE-2026-46175 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46175] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46176] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23968,7 +23988,7 @@ CVE_STATUS[CVE-2026-46179] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46180] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46181 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46181] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46182] = "fixed-version: only affects 6.18 onwards"
 
@@ -24004,7 +24024,7 @@ CVE_STATUS[CVE-2026-46198] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46199] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46200 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46200] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46201] = "fixed-version: only affects 6.8 onwards"
 
@@ -24082,7 +24102,7 @@ CVE_STATUS[CVE-2026-46239] = "fixed-version: only affects 7.0 onwards"
 
 CVE_STATUS[CVE-2026-46240] = "fixed-version: only affects 6.18.16 onwards"
 
-# CVE-2026-46241 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46241] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46242] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -24090,7 +24110,7 @@ CVE_STATUS[CVE-2026-46243] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-46244] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-46245 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-46245] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46246] = "fixed-version: only affects 6.7 onwards"
 
@@ -24108,7 +24128,7 @@ CVE_STATUS[CVE-2026-46252] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-46253] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-46254 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-46254] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46255] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -24144,7 +24164,7 @@ CVE_STATUS[CVE-2026-46270] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-46271] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-46272 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-46272] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46273] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -24164,7 +24184,7 @@ CVE_STATUS[CVE-2026-46280] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46281] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-46282 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46282] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46283] = "fixed-version: only affects 6.10 onwards"
 
@@ -24204,7 +24224,7 @@ CVE_STATUS[CVE-2026-46300] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-46301] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46302 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46302] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46303] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -24248,9 +24268,9 @@ CVE_STATUS[CVE-2026-46322] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-46323] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-46324 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46324] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-46325 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-46325] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46326] = "fixed-version: only affects 6.9 onwards"
 
@@ -24260,7 +24280,7 @@ CVE_STATUS[CVE-2026-46328] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-46329] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-46330 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-46330] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-46331] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -24334,7 +24354,7 @@ CVE_STATUS[CVE-2026-52935] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52936] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-52937 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-52937] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-52938] = "fixed-version: only affects 7.0 onwards"
 
@@ -24372,7 +24392,7 @@ CVE_STATUS[CVE-2026-52954] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-52955] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-52956 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-52956] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-52957] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24380,9 +24400,9 @@ CVE_STATUS[CVE-2026-52958] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-52959] = "fixed-version: only affects 6.13.8 onwards"
 
-CVE_STATUS[CVE-2026-52960] = "fixed-version: only affects 6.15 onwards"
+CVE_STATUS[CVE-2026-52960] = "fixed-version: only affects 6.12.114 onwards"
 
-# CVE-2026-52961 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-52961] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-52962] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24436,13 +24456,13 @@ CVE_STATUS[CVE-2026-52986] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-52987] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-52988 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-52988] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-52989] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-52990 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-52990] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-52991 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-52991] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-52992] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24460,7 +24480,7 @@ CVE_STATUS[CVE-2026-52998] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-52999] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53000 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53000] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53001] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24470,7 +24490,7 @@ CVE_STATUS[CVE-2026-53003] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53004] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53005 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53005] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-53006] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24478,9 +24498,9 @@ CVE_STATUS[CVE-2026-53007] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-53008] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-53009 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53009] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-53010 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-53010] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-53011] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24490,13 +24510,13 @@ CVE_STATUS[CVE-2026-53013] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53014] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-53015 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53015] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53016] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53017 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53017] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-53018 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53018] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53019] = "fixed-version: only affects 6.16 onwards"
 
@@ -24508,9 +24528,9 @@ CVE_STATUS[CVE-2026-53022] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53023] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53024 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53024] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-53025 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53025] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53026] = "fixed-version: only affects 6.18.4 onwards"
 
@@ -24566,7 +24586,7 @@ CVE_STATUS[CVE-2026-53051] = "fixed-version: only affects 6.12.2 onwards"
 
 CVE_STATUS[CVE-2026-53052] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53053 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53053] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53054] = "fixed-version: only affects 6.17 onwards"
 
@@ -24600,7 +24620,7 @@ CVE_STATUS[CVE-2026-53068] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53069] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53070 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53070] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53071] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24616,7 +24636,7 @@ CVE_STATUS[CVE-2026-53076] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53077] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53078 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53078] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-53079] = "fixed-version: only affects 6.19 onwards"
 
@@ -24638,11 +24658,11 @@ CVE_STATUS[CVE-2026-53087] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-53088] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53089 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-53089] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-53090] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-53091 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53091] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53092] = "fixed-version: only affects 6.11 onwards"
 
@@ -24654,7 +24674,7 @@ CVE_STATUS[CVE-2026-53095] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-53096] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53097 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53097] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53098] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24664,7 +24684,7 @@ CVE_STATUS[CVE-2026-53100] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-53101] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-53102 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53102] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53103] = "fixed-version: only affects 6.11.2 onwards"
 
@@ -24676,9 +24696,9 @@ CVE_STATUS[CVE-2026-53105] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-53107] = "fixed-version: only affects 6.18.16 onwards"
 
-# CVE-2026-53108 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53108] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-53109 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53109] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53110] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24686,27 +24706,27 @@ CVE_STATUS[CVE-2026-53111] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53112] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53113 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53113] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53114] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-53115 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53115] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53116] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-53117] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53118 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53118] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53119] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-53120 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53120] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53121] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-53122 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53122] = "cpe-stable-backport: Backported in 6.6.160"
 
-CVE_STATUS[CVE-2026-53123] = "fixed-version: only affects 6.7 onwards"
+# CVE-2026-53123 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2026-53124] = "fixed-version: only affects 6.14.6 onwards"
 
@@ -24718,7 +24738,7 @@ CVE_STATUS[CVE-2026-53127] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-53128] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53129 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53129] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53130] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24772,7 +24792,7 @@ CVE_STATUS[CVE-2026-53154] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53155] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-53156 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53156] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53157] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -24814,9 +24834,9 @@ CVE_STATUS[CVE-2026-53176] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53177] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53178 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53178] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-53179 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53179] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53180] = "fixed-version: only affects 6.9 onwards"
 
@@ -24898,7 +24918,7 @@ CVE_STATUS[CVE-2026-53218] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53219] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53220 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53220] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53221] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -24906,17 +24926,17 @@ CVE_STATUS[CVE-2026-53222] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-53223] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53224 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53224] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53225] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53226 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53226] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53227] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53228] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53229 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53229] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53230] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -24974,7 +24994,7 @@ CVE_STATUS[CVE-2026-53256] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53257] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-53258 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53258] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53259] = "fixed-version: only affects 6.17 onwards"
 
@@ -24982,7 +25002,7 @@ CVE_STATUS[CVE-2026-53260] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-53261] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-53262 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53262] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53263] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -25002,7 +25022,7 @@ CVE_STATUS[CVE-2026-53270] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53271] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53272 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53272] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53273] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -25026,7 +25046,7 @@ CVE_STATUS[CVE-2026-53282] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-53283] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-53284 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53284] = "cpe-stable-backport: Backported in 6.6.160"
 
 # CVE-2026-53285 needs backporting (fixed from 7.1)
 
@@ -25042,7 +25062,7 @@ CVE_STATUS[CVE-2026-53290] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-53291] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53292 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53292] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53293] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -25052,7 +25072,7 @@ CVE_STATUS[CVE-2026-53295] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53296] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53297 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53297] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53298] = "fixed-version: only affects 6.11 onwards"
 
@@ -25084,7 +25104,7 @@ CVE_STATUS[CVE-2026-53311] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-53312] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-53313 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53313] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53314] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -25092,7 +25112,7 @@ CVE_STATUS[CVE-2026-53315] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-53316] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-53317 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53317] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53318] = "fixed-version: only affects 6.11 onwards"
 
@@ -25118,7 +25138,7 @@ CVE_STATUS[CVE-2026-53328] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-53329] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53330 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53330] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53331] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -25212,7 +25232,7 @@ CVE_STATUS[CVE-2026-53375] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-53376] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-53377 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53377] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53378] = "fixed-version: only affects 6.19 onwards"
 
@@ -25260,7 +25280,7 @@ CVE_STATUS[CVE-2026-53399] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-53400] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-53401 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-53401] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-53402] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -25302,7 +25322,7 @@ CVE_STATUS[CVE-2026-63809] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-63810] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-63811 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-63811] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-63812] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -25330,7 +25350,7 @@ CVE_STATUS[CVE-2026-63823] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-63824] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-63825 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-63825] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-63826] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -25386,7 +25406,7 @@ CVE_STATUS[CVE-2026-63851] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-63852] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-63853 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-63853] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-63854] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -25436,7 +25456,7 @@ CVE_STATUS[CVE-2026-63877] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-63878] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-63879 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-63879] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-63880] = "fixed-version: only affects 6.18 onwards"
 
@@ -25558,7 +25578,7 @@ CVE_STATUS[CVE-2026-63938] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-63939] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-63940 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-63940] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-63941] = "fixed-version: only affects 6.11 onwards"
 
@@ -25602,9 +25622,9 @@ CVE_STATUS[CVE-2026-63960] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-63961] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-63962 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-63962] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-63963 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-63963] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-63964] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -25626,7 +25646,7 @@ CVE_STATUS[CVE-2026-63972] = "fixed-version: only affects 6.18.33 onwards"
 
 CVE_STATUS[CVE-2026-63973] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-63974 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-63974] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-63975] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -25634,9 +25654,9 @@ CVE_STATUS[CVE-2026-63976] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-63977] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-63978 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-63978] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-63979 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-63979] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-63980] = "fixed-version: only affects 6.7 onwards"
 
@@ -25676,11 +25696,11 @@ CVE_STATUS[CVE-2026-63997] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-63998] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-63999 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-63999] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64000] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-64001 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64001] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64002] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -25750,11 +25770,11 @@ CVE_STATUS[CVE-2026-64034] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-64035] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-64036 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64036] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64037] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-64038 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64038] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64039] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -25818,7 +25838,7 @@ CVE_STATUS[CVE-2026-64068] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2026-64069] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-64070 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-64070] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-64071] = "fixed-version: only affects 6.13 onwards"
 
@@ -25830,19 +25850,19 @@ CVE_STATUS[CVE-2026-64074] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-64075] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-64076 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64076] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-64077 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64077] = "cpe-stable-backport: Backported in 6.6.160"
 
 # CVE-2026-64078 needs backporting (fixed from 7.1)
 
-# CVE-2026-64079 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64079] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64080] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-64081] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-64082 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-64082] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-64083] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -25912,7 +25932,7 @@ CVE_STATUS[CVE-2026-64115] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-64116] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-64117 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64117] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64118] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -25954,7 +25974,7 @@ CVE_STATUS[CVE-2026-64136] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-64137] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-64138 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64138] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64139] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -25970,7 +25990,7 @@ CVE_STATUS[CVE-2026-64144] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-64145] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-64146 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64146] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64147] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -25986,7 +26006,7 @@ CVE_STATUS[CVE-2026-64152] = "fixed-version: only affects 7.0 onwards"
 
 CVE_STATUS[CVE-2026-64153] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-64154 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64154] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64155] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -26056,7 +26076,7 @@ CVE_STATUS[CVE-2026-64188] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-64189] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64190 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64190] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64191] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -26072,13 +26092,13 @@ CVE_STATUS[CVE-2026-64208] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-64209] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-64210 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64210] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-64211] = "fixed-version: only affects 7.0 onwards"
 
 # CVE-2026-64212 needs backporting (fixed from 7.1)
 
-# CVE-2026-64213 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64213] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64214] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -26134,7 +26154,7 @@ CVE_STATUS[CVE-2026-64239] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-64240] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-64241 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64241] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64242] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -26262,7 +26282,7 @@ CVE_STATUS[CVE-2026-64303] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64304] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64305 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64305] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64306] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26292,7 +26312,7 @@ CVE_STATUS[CVE-2026-64318] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64319] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64320 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64320] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64321] = "fixed-version: only affects 6.8 onwards"
 
@@ -26334,7 +26354,7 @@ CVE_STATUS[CVE-2026-64339] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-64340] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64341 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64341] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64342] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26406,7 +26426,7 @@ CVE_STATUS[CVE-2026-64375] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64376] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64377 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64377] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64378] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26428,13 +26448,13 @@ CVE_STATUS[CVE-2026-64386] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64387] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64388 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64388] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-64389 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64389] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64390] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64391 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64391] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64392] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26452,7 +26472,7 @@ CVE_STATUS[CVE-2026-64398] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64399] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64400 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64400] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64401] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26614,7 +26634,7 @@ CVE_STATUS[CVE-2026-64479] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64480] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64481 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64481] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64482] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26698,7 +26718,7 @@ CVE_STATUS[CVE-2026-64521] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-64522] = "fixed-version: only affects 6.17.4 onwards"
 
-# CVE-2026-64523 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-64523] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64524] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -26730,7 +26750,7 @@ CVE_STATUS[CVE-2026-64537] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64538] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-64539 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-64539] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-64540] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26814,7 +26834,7 @@ CVE_STATUS[CVE-2026-64579] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-64580] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-64581 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-64581] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-64582] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26862,11 +26882,11 @@ CVE_STATUS[CVE-2026-64603] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-64604] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-68081 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68081] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-68082 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68082] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-68083 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68083] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68084] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -26934,7 +26954,7 @@ CVE_STATUS[CVE-2026-68116] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68117] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68118 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68118] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-68119] = "fixed-version: only affects 6.7 onwards"
 
@@ -26962,7 +26982,7 @@ CVE_STATUS[CVE-2026-68130] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68131] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68132 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68132] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-68133] = "fixed-version: only affects 6.9 onwards"
 
@@ -26970,11 +26990,11 @@ CVE_STATUS[CVE-2026-68134] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-68135] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68136 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68136] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-68137] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68138 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68138] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-68139] = "fixed-version: only affects 6.7 onwards"
 
@@ -26988,7 +27008,7 @@ CVE_STATUS[CVE-2026-68143] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68144] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68145 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68145] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-68146] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27016,7 +27036,7 @@ CVE_STATUS[CVE-2026-68157] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68158] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68159 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68159] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-68160] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27030,7 +27050,7 @@ CVE_STATUS[CVE-2026-68164] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68165] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68166 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68166] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-68167] = "fixed-version: only affects 7.1 onwards"
 
@@ -27066,7 +27086,7 @@ CVE_STATUS[CVE-2026-68183] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-68184] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68185 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68185] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68186] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27102,7 +27122,7 @@ CVE_STATUS[CVE-2026-68201] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-68202] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68203 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68203] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68204] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27162,7 +27182,7 @@ CVE_STATUS[CVE-2026-68231] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68232] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-68233 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68233] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68234] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27172,25 +27192,25 @@ CVE_STATUS[CVE-2026-68236] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68237] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-68238 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68238] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68239] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-68240] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-68241 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68241] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-68242 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68242] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68243] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68244] = "cpe-stable-backport: Backported in 6.6.148"
 
-CVE_STATUS[CVE-2026-68245] = "fixed-version: only affects 6.9 onwards"
+# CVE-2026-68245 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2026-68246] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68247 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68247] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68248] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27212,7 +27232,7 @@ CVE_STATUS[CVE-2026-68256] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68257] = "fixed-version: only affects 6.12.59 onwards"
 
-# CVE-2026-68258 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68258] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68259] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27242,7 +27262,7 @@ CVE_STATUS[CVE-2026-68271] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68272] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68273 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68273] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68274] = "fixed-version: only affects 6.13 onwards"
 
@@ -27268,13 +27288,13 @@ CVE_STATUS[CVE-2026-68284] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68285] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-68286 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68286] = "cpe-stable-backport: Backported in 6.6.158"
 
-# CVE-2026-68287 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68287] = "cpe-stable-backport: Backported in 6.6.158"
 
-# CVE-2026-68288 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68288] = "cpe-stable-backport: Backported in 6.6.158"
 
-# CVE-2026-68289 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68289] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-68290] = "fixed-version: only affects 6.12.10 onwards"
 
@@ -27282,7 +27302,7 @@ CVE_STATUS[CVE-2026-68291] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-68292] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-68293 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68293] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68294] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27302,7 +27322,7 @@ CVE_STATUS[CVE-2026-68301] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68302] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68303 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68303] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68304] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27320,7 +27340,7 @@ CVE_STATUS[CVE-2026-68310] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68311] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-68312 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68312] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68313] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27332,7 +27352,7 @@ CVE_STATUS[CVE-2026-68316] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-68317] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68318 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68318] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68319] = "fixed-version: only affects 6.8.7 onwards"
 
@@ -27342,7 +27362,7 @@ CVE_STATUS[CVE-2026-68321] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-68322] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-68323 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68323] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68324] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27488,23 +27508,23 @@ CVE_STATUS[CVE-2026-68394] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-68395] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68396 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68396] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68397] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68398] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68399 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68399] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68400] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-68401 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68401] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68402] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68403] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68404 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68404] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68405] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27512,9 +27532,9 @@ CVE_STATUS[CVE-2026-68406] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68407] = "cpe-stable-backport: Backported in 6.6.148"
 
-CVE_STATUS[CVE-2026-68408] = "fixed-version: only affects 6.12.78 onwards"
+CVE_STATUS[CVE-2026-68408] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-68409 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68409] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68410] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27532,7 +27552,7 @@ CVE_STATUS[CVE-2026-68416] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68417] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68418 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68418] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68419] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27548,7 +27568,7 @@ CVE_STATUS[CVE-2026-68424] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-68425] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68426 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68426] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68427] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27558,7 +27578,7 @@ CVE_STATUS[CVE-2026-68429] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68430] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68431 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-68431] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-68432] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27566,7 +27586,7 @@ CVE_STATUS[CVE-2026-68433] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-68434] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-68435 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68435] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68436] = "fixed-version: only affects 6.10 onwards"
 
@@ -27578,7 +27598,7 @@ CVE_STATUS[CVE-2026-68439] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-68440] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-68441 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68441] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68442] = "fixed-version: only affects 6.8 onwards"
 
@@ -27592,7 +27612,7 @@ CVE_STATUS[CVE-2026-68446] = "cpe-stable-backport: Backported in 6.6.148"
 
 # CVE-2026-68447 needs backporting (fixed from 7.2)
 
-# CVE-2026-68448 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68448] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68449] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27602,7 +27622,7 @@ CVE_STATUS[CVE-2026-68451] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-68452] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-68453 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68453] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68454] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -27638,7 +27658,7 @@ CVE_STATUS[CVE-2026-68469] = "cpe-stable-backport: Backported in 6.6.145"
 
 # CVE-2026-68470 needs backporting (fixed from 7.2)
 
-# CVE-2026-68471 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-68471] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-68472] = "fixed-version: only affects 6.14 onwards"
 
@@ -27796,7 +27816,7 @@ CVE_STATUS[CVE-2026-72071] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-72072] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72073 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72073] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72074] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -27846,7 +27866,7 @@ CVE_STATUS[CVE-2026-72096] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2026-72097] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72098 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72098] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72099] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -27910,9 +27930,9 @@ CVE_STATUS[CVE-2026-72128] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-72129] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72130 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72130] = "cpe-stable-backport: Backported in 6.6.160"
 
-CVE_STATUS[CVE-2026-72131] = "fixed-version: only affects 6.18 onwards"
+CVE_STATUS[CVE-2026-72131] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-72132] = "cpe-stable-backport: Backported in 6.6.148"
 
@@ -27974,7 +27994,7 @@ CVE_STATUS[CVE-2026-72160] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72161] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72162 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72162] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72163] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -27986,7 +28006,7 @@ CVE_STATUS[CVE-2026-72166] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72167] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72168 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72168] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72169] = "fixed-version: only affects 6.16 onwards"
 
@@ -28046,17 +28066,17 @@ CVE_STATUS[CVE-2026-72196] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72197] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72198 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72198] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72199] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-72200 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72200] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72201] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-72202] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-72203 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72203] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72204] = "fixed-version: only affects 7.1 onwards"
 
@@ -28076,7 +28096,7 @@ CVE_STATUS[CVE-2026-72211] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-72212] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-72213 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72213] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72214] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28224,7 +28244,7 @@ CVE_STATUS[CVE-2026-72286] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-72287] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-72288 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72288] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72289] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28278,7 +28298,7 @@ CVE_STATUS[CVE-2026-72313] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-72314] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72315 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-72315] = "fixed-version: only affects 6.12.78 onwards"
 
 CVE_STATUS[CVE-2026-72316] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28288,17 +28308,17 @@ CVE_STATUS[CVE-2026-72318] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72319] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72320 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72320] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-72321 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72321] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72322] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72323] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72324 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72324] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-72325 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72325] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72326] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28306,7 +28326,7 @@ CVE_STATUS[CVE-2026-72327] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-72328] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-72329 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72329] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72330] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28316,13 +28336,13 @@ CVE_STATUS[CVE-2026-72332] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-72333] = "fixed-version: only affects 6.18.21 onwards"
 
-# CVE-2026-72334 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72334] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-72335] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72336] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72337 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72337] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72338] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28330,7 +28350,7 @@ CVE_STATUS[CVE-2026-72339] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72340] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72341 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72341] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72342] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28338,7 +28358,7 @@ CVE_STATUS[CVE-2026-72343] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72344] = "fixed-version: only affects 7.1 onwards"
 
-CVE_STATUS[CVE-2026-72345] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2026-72345] = "fixed-version: only affects 6.12.113 onwards"
 
 CVE_STATUS[CVE-2026-72346] = "fixed-version: only affects 7.1 onwards"
 
@@ -28352,7 +28372,7 @@ CVE_STATUS[CVE-2026-72350] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72351] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72352 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72352] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72353] = "fixed-version: only affects 7.1 onwards"
 
@@ -28398,7 +28418,7 @@ CVE_STATUS[CVE-2026-72372] = "fixed-version: only affects 6.12.97 onwards"
 
 CVE_STATUS[CVE-2026-72374] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72375 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72375] = "cpe-stable-backport: Backported in 6.6.160"
 
 # CVE-2026-72376 needs backporting (fixed from 7.2)
 
@@ -28408,13 +28428,13 @@ CVE_STATUS[CVE-2026-72378] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72379] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72380 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72380] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72381] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72382] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72383 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72383] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72384] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28442,9 +28462,9 @@ CVE_STATUS[CVE-2026-72395] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72396] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72397 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72397] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-72398 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72398] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72399] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28452,13 +28472,13 @@ CVE_STATUS[CVE-2026-72400] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72401] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-72402 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72402] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-72403] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-72404 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72404] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-72405 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72405] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72406] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28474,7 +28494,7 @@ CVE_STATUS[CVE-2026-72411] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-72412] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-72413 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72413] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-72414] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28488,13 +28508,13 @@ CVE_STATUS[CVE-2026-72418] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72419] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72420 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72420] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72421] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72422] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72423 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72423] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72424] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28524,11 +28544,11 @@ CVE_STATUS[CVE-2026-72436] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72437] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72438 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72438] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-72439 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72439] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-72440 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72440] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72441] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28586,7 +28606,7 @@ CVE_STATUS[CVE-2026-72467] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72468] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-72469 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72469] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72470] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28618,13 +28638,13 @@ CVE_STATUS[CVE-2026-72483] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72484] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72485 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72485] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-72486] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72487] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72488 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72488] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72489] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28636,11 +28656,11 @@ CVE_STATUS[CVE-2026-72492] = "cpe-stable-backport: Backported in 6.6.145"
 
 # CVE-2026-72493 needs backporting (fixed from 7.2)
 
-# CVE-2026-72494 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72494] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-72495 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72495] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-72496 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72496] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-72497] = "fixed-version: only affects 6.12 onwards"
 
@@ -28650,7 +28670,7 @@ CVE_STATUS[CVE-2026-72499] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-72500] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-72501 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72501] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-72502] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28658,21 +28678,19 @@ CVE_STATUS[CVE-2026-74255] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74256] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74257 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74257] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74258 needs backporting (fixed from 7.2)
-
-CVE_STATUS[CVE-2026-74259] = "cpe-stable-backport: Backported in 6.6.145"
+CVE_STATUS[CVE-2026-74258] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-74260] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-74261 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74261] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74262] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74263] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74264 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74264] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74265] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28680,17 +28698,17 @@ CVE_STATUS[CVE-2026-74266] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-74267] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74268 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74268] = "cpe-stable-backport: Backported in 6.6.157"
 
-# CVE-2026-74269 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74269] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74270] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74271] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74272 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74272] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74273 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74273] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74274] = "fixed-version: only affects 6.19 onwards"
 
@@ -28700,7 +28718,7 @@ CVE_STATUS[CVE-2026-74276] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74277] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-74278 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74278] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74279] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28722,17 +28740,17 @@ CVE_STATUS[CVE-2026-74287] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74288] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74289 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74289] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-74290] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74291 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74291] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-74292] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74293] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74294 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74294] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-74295] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28748,7 +28766,7 @@ CVE_STATUS[CVE-2026-74300] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74301] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-74302 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-74302] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74303] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28758,7 +28776,7 @@ CVE_STATUS[CVE-2026-74305] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74306] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-74307 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74307] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74308] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28778,9 +28796,9 @@ CVE_STATUS[CVE-2026-74315] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-74316] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-74317 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74317] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74318 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74318] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74319] = "fixed-version: only affects 7.1 onwards"
 
@@ -28812,7 +28830,7 @@ CVE_STATUS[CVE-2026-74332] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-74333] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-74334 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74334] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-74335] = "fixed-version: only affects 6.13 onwards"
 
@@ -28820,7 +28838,7 @@ CVE_STATUS[CVE-2026-74336] = "fixed-version: only affects 6.18 onwards"
 
 # CVE-2026-74337 needs backporting (fixed from 7.2)
 
-# CVE-2026-74338 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74338] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74339] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28832,19 +28850,19 @@ CVE_STATUS[CVE-2026-74341] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74343] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-74344 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74344] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74345 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74345] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74346] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74347 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74347] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74348] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74349] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74350 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74350] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74351] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28856,7 +28874,7 @@ CVE_STATUS[CVE-2026-74354] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-74355] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-74356 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74356] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74357] = "fixed-version: only affects 7.1 onwards"
 
@@ -28880,7 +28898,7 @@ CVE_STATUS[CVE-2026-74366] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-74367] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-74368 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-74368] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74369] = "fixed-version: only affects 7.1 onwards"
 
@@ -28890,11 +28908,11 @@ CVE_STATUS[CVE-2026-74371] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-74372] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-74373 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74373] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74374 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74374] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74375 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74375] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74376] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28916,13 +28934,13 @@ CVE_STATUS[CVE-2026-74384] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74385] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-74386 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74386] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74387] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74388 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74388] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74389 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74389] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74390] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -28954,11 +28972,11 @@ CVE_STATUS[CVE-2026-74403] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-74404] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-74405 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74405] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74406] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-74407 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74407] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74408] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -29044,7 +29062,7 @@ CVE_STATUS[CVE-2026-74448] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74449] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-74450 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74450] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74451] = "fixed-version: only affects 6.10 onwards"
 
@@ -29076,7 +29094,7 @@ CVE_STATUS[CVE-2026-74464] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74465] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74466 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74466] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74467] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29092,17 +29110,17 @@ CVE_STATUS[CVE-2026-74472] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74473] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74474 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74474] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74475] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74476 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74476] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74477] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-74478] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74479 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74479] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74480] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29118,7 +29136,7 @@ CVE_STATUS[CVE-2026-74485] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74486] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-74487 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74487] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74488] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29132,11 +29150,11 @@ CVE_STATUS[CVE-2026-74492] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74493] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74494 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74494] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74495] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74496 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74496] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-74497] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29162,7 +29180,7 @@ CVE_STATUS[CVE-2026-74507] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74508] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74509 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-74509] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-74510] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29170,7 +29188,7 @@ CVE_STATUS[CVE-2026-74512] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74513] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-74514 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74514] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74515] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29184,7 +29202,7 @@ CVE_STATUS[CVE-2026-74519] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74520] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-74521 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74521] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-74522] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29196,7 +29214,7 @@ CVE_STATUS[CVE-2026-74525] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74526] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-74527 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74527] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74528] = "fixed-version: only affects 6.19 onwards"
 
@@ -29208,15 +29226,15 @@ CVE_STATUS[CVE-2026-74531] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74532] = "cpe-stable-backport: Backported in 6.6.151"
 
-CVE_STATUS[CVE-2026-74533] = "fixed-version: only affects 6.11.11 onwards"
+CVE_STATUS[CVE-2026-74533] = "fixed-version: only affects 6.12.2 onwards"
 
-CVE_STATUS[CVE-2026-74534] = "fixed-version: only affects 6.11.11 onwards"
+CVE_STATUS[CVE-2026-74534] = "fixed-version: only affects 6.12.2 onwards"
 
 CVE_STATUS[CVE-2026-74535] = "fixed-version: only affects 6.12.2 onwards"
 
 # CVE-2026-74536 needs backporting (fixed from 7.2)
 
-# CVE-2026-74537 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74537] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74538] = "fixed-version: only affects 6.8.9 onwards"
 
@@ -29228,9 +29246,9 @@ CVE_STATUS[CVE-2026-74541] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74542] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-74543 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74543] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74544 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74544] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74545] = "fixed-version: only affects 6.12 onwards"
 
@@ -29262,7 +29280,7 @@ CVE_STATUS[CVE-2026-74557] = "cpe-stable-backport: Backported in 6.6.151"
 
 # CVE-2026-74559 needs backporting (fixed from 7.2)
 
-# CVE-2026-74560 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74560] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74561] = "fixed-version: only affects 6.16 onwards"
 
@@ -29272,7 +29290,7 @@ CVE_STATUS[CVE-2026-74563] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74564] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74565 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74565] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74566] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29284,7 +29302,7 @@ CVE_STATUS[CVE-2026-74569] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-74570] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-74571 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74571] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74572] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -29302,25 +29320,25 @@ CVE_STATUS[CVE-2026-74578] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-74579] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74580 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74580] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74581] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-74582 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74582] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74583 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74583] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74584] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-74585 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74585] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74586 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74586] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74587 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74587] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74588 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74588] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74589 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74589] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74590] = "fixed-version: only affects 6.8 onwards"
 
@@ -29330,93 +29348,93 @@ CVE_STATUS[CVE-2026-74591] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-74593] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-74594 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74594] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74595 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74595] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74596] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-74597 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74597] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74598 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74598] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74599 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74599] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-74600 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74600] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74601 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74601] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74602] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-74603 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74603] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74604 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74604] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74605 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-74605] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74606 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74606] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74607 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74607] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-74608 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74608] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74609 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74609] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74610 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74610] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74611 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74611] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74612 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74612] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74613 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74613] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74614 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74614] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74615 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74615] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74616 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74616] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74617] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-74618] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-74619 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74619] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74620 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74620] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74621 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74621] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74622 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74622] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74623 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74623] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74624 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74624] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74625 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74625] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74626 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-74626] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-74627] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-74628 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74628] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74629] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-74630 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74630] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74631 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74631] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74632 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74632] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74633] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-74634] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-74635 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74635] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74636 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74636] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74637 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-74637] = "cpe-stable-backport: Backported in 6.6.154"
 
 # CVE-2026-74638 may need backporting (fixed from 6.7)
 
@@ -29424,9 +29442,9 @@ CVE_STATUS[CVE-2026-74639] = "fixed-version: only affects 6.18.39 onwards"
 
 CVE_STATUS[CVE-2026-74640] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-74641 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74641] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74642 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74642] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74643] = "fixed-version: only affects 6.17 onwards"
 
@@ -29434,125 +29452,125 @@ CVE_STATUS[CVE-2026-74644] = "fixed-version: only affects 6.12.44 onwards"
 
 CVE_STATUS[CVE-2026-74645] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-74646 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74646] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74647 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74647] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74648 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74648] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74649 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74649] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74650 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74650] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74651 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74651] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74652] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-74653 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74653] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74654 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74654] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74655 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-74655] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-74656 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74656] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74657 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74657] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74658 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74658] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74659 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74659] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74660 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74660] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74661 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74661] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74662 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-74662] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-74663 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74663] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74664 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74664] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74665] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-74666 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74666] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74667 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74667] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74668 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74668] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74669 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74669] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74670 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74670] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74671 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74671] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74672 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74672] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-74673 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74673] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74674] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-74675 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74675] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74676 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74676] = "cpe-stable-backport: Backported in 6.6.152"
 
 # CVE-2026-74677 needs backporting (fixed from 7.2)
 
-# CVE-2026-74678 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74678] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74679 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74679] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74680 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74680] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74681] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-74682 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74682] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74683 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74683] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74684 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74684] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74685] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-74686] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-74687 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74687] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74688 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74688] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74689 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74689] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74690 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74690] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74691 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74691] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74692 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74692] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74693 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74693] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74694 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74694] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74695 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74695] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74696 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74696] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74697 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74697] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74698] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-74699] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-74700 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74700] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74701 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74701] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74702] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-74703] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-74704 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74704] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74705 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74705] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74706] = "fixed-version: only affects 6.19 onwards"
 
@@ -29564,81 +29582,79 @@ CVE_STATUS[CVE-2026-74709] = "fixed-version: only affects 6.14.2 onwards"
 
 CVE_STATUS[CVE-2026-74710] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-74711 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74711] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74712] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-74713 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74713] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74714 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74714] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74715 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74715] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-74716] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-74717 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74717] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74718 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74718] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74719 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74719] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74720 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74720] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74721] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-74722 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74722] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-74723 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74723] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74724 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74724] = "cpe-stable-backport: Backported in 6.6.152"
 
 # CVE-2026-74725 needs backporting (fixed from 7.2)
 
-# CVE-2026-74726 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74726] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74727] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-74728] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-74729 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74729] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74730 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-74730] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-74731] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-74732 needs backporting (fixed from 7.2)
-
-# CVE-2026-74733 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-74733] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74734 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74734] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74735 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74735] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74736 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74736] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-74737 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74737] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74738] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-74739 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74739] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-74740 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74740] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74741] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-74742] = "fixed-version: only affects 6.12.61 onwards"
 
-# CVE-2026-74743 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74743] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-74744 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74744] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74745] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-74746 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74746] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-74747 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74747] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74748 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-74748] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-74749] = "fixed-version: only affects 7.1 onwards"
 
@@ -29646,17 +29662,17 @@ CVE_STATUS[CVE-2026-74750] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-74751] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-74752 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74752] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-74753 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-74753] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-74754 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-74754] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80519] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-80520] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-80521 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-80521] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-80522] = "fixed-version: only affects 6.10 onwards"
 
@@ -29666,13 +29682,13 @@ CVE_STATUS[CVE-2026-80524] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-80525] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-80526 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80526] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80527 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80527] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80528 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80528] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80529 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80529] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80530] = "fixed-version: only affects 6.10 onwards"
 
@@ -29682,119 +29698,119 @@ CVE_STATUS[CVE-2026-80532] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2026-80533] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-80534 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80534] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80535] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-80536 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80536] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80537] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-80538] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-80539 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80539] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80540 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80540] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80541 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80541] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80542] = "fixed-version: only affects 6.18 onwards"
 
-CVE_STATUS[CVE-2026-80543] = "fixed-version: only affects 7.1 onwards"
+CVE_STATUS[CVE-2026-80543] = "fixed-version: only affects 6.12.114 onwards"
 
-CVE_STATUS[CVE-2026-80544] = "fixed-version: only affects 7.1 onwards"
+CVE_STATUS[CVE-2026-80544] = "fixed-version: only affects 6.12.114 onwards"
 
-CVE_STATUS[CVE-2026-80545] = "fixed-version: only affects 7.1 onwards"
+CVE_STATUS[CVE-2026-80545] = "fixed-version: only affects 6.12.114 onwards"
 
-CVE_STATUS[CVE-2026-80546] = "fixed-version: only affects 7.1 onwards"
+CVE_STATUS[CVE-2026-80546] = "fixed-version: only affects 6.12.114 onwards"
 
-# CVE-2026-80547 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80547] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80548 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80548] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80549 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80549] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80550 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80550] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80551 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80551] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80552 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80552] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80553 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80553] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80554 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80554] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80555 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80555] = "cpe-stable-backport: Backported in 6.6.154"
 
 # CVE-2026-80556 needs backporting (fixed from 7.2)
 
-# CVE-2026-80557 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80557] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80558 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80558] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80559 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80559] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80560 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80560] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80561 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80561] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80562 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80562] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80563] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-80564] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-80565 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80565] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80566 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80566] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80567 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80567] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80568 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80568] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80569 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80569] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80570 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80570] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80571] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-80572 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80572] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80573 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80573] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80574 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80574] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80575] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-80576 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80576] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80577] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-80578 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80578] = "cpe-stable-backport: Backported in 6.6.153"
 
 # CVE-2026-80579 needs backporting (fixed from 7.2)
 
 # CVE-2026-80580 needs backporting (fixed from 7.2)
 
-# CVE-2026-80581 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80581] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80582] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-80583 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80583] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80584 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80584] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80585 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80585] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80586 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80586] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80587 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80587] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80588] = "fixed-version: only affects 6.18.35 onwards"
 
-# CVE-2026-80589 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80589] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80590 may need backporting (fixed from 6.6.155)
+CVE_STATUS[CVE-2026-80590] = "cpe-stable-backport: Backported in 6.6.155"
 
 CVE_STATUS[CVE-2026-80591] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -29828,7 +29844,7 @@ CVE_STATUS[CVE-2026-80605] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-80606] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-80607 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80607] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80608] = "fixed-version: only affects 7.1 onwards"
 
@@ -29836,7 +29852,7 @@ CVE_STATUS[CVE-2026-80609] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-80610] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-80611 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80611] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80612] = "fixed-version: only affects 6.19 onwards"
 
@@ -29846,7 +29862,7 @@ CVE_STATUS[CVE-2026-80614] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-80615] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-80616 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80616] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80617] = "fixed-version: only affects 6.18.33 onwards"
 
@@ -29860,7 +29876,7 @@ CVE_STATUS[CVE-2026-80621] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-80622] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-80623 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80623] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80624] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -29870,25 +29886,25 @@ CVE_STATUS[CVE-2026-80626] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-80627] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-80628 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80628] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80629 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80629] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80630] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-80631 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80631] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80632] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-80633] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-80634 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80634] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80635] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-80636] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-80637 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80637] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80638] = "fixed-version: only affects 6.19 onwards"
 
@@ -29900,7 +29916,7 @@ CVE_STATUS[CVE-2026-80641] = "fixed-version: only affects 7.0 onwards"
 
 CVE_STATUS[CVE-2026-80642] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-80643 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80643] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80644] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -29914,15 +29930,15 @@ CVE_STATUS[CVE-2026-80648] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-80649] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-80650 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80650] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80651] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-80652] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-80653 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80653] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80654 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80654] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80655] = "fixed-version: only affects 6.11 onwards"
 
@@ -29938,7 +29954,7 @@ CVE_STATUS[CVE-2026-80660] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-80661] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-80662 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80662] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80663] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -29950,13 +29966,13 @@ CVE_STATUS[CVE-2026-80666] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-80667] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-80668 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-80668] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80669] = "cpe-stable-backport: Backported in 6.6.145"
 
 # CVE-2026-80670 needs backporting (fixed from 7.2)
 
-# CVE-2026-80671 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80671] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-80672] = "fixed-version: only affects 7.1 onwards"
 
@@ -29966,7 +29982,7 @@ CVE_STATUS[CVE-2026-80674] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-80675] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-80676 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80676] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80677] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -29984,33 +30000,33 @@ CVE_STATUS[CVE-2026-80683] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-80684] = "cpe-stable-backport: Backported in 6.6.151"
 
-CVE_STATUS[CVE-2026-80685] = "fixed-version: only affects 6.15 onwards"
+CVE_STATUS[CVE-2026-80685] = "fixed-version: only affects 6.12.111 onwards"
 
-# CVE-2026-80686 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80686] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80687] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-80688] = "fixed-version: only affects 6.13.11 onwards"
 
-# CVE-2026-80689 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80689] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-80690] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-80691] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-80692 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-80692] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80693] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-80694 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80694] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80695 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80695] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80696] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-80697] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-80698 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80698] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80699] = "fixed-version: only affects 6.19 onwards"
 
@@ -30022,7 +30038,7 @@ CVE_STATUS[CVE-2026-80702] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-80703] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-80704 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80704] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80705] = "fixed-version: only affects 6.11 onwards"
 
@@ -30030,7 +30046,7 @@ CVE_STATUS[CVE-2026-80706] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-80707] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-80708 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-80708] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-80709] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -30044,7 +30060,7 @@ CVE_STATUS[CVE-2026-80713] = "fixed-version: only affects 7.0 onwards"
 
 CVE_STATUS[CVE-2026-80714] = "cpe-stable-backport: Backported in 6.6.151"
 
-# CVE-2026-80715 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80715] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80716] = "cpe-stable-backport: Backported in 6.6.151"
 
@@ -30064,51 +30080,49 @@ CVE_STATUS[CVE-2026-80723] = "fixed-version: only affects 6.12.13 onwards"
 
 CVE_STATUS[CVE-2026-80724] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-80725 may need backporting (fixed from 6.6.154)
-
-# CVE-2026-80726 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-80725] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80727] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-80728 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-80728] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-80729] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-80730 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-80730] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-80731 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-80731] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-80732 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-80732] = "cpe-stable-backport: Backported in 6.6.152"
 
-# CVE-2026-80733 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-80733] = "cpe-stable-backport: Backported in 6.6.152"
 
-CVE_STATUS[CVE-2026-80734] = "fixed-version: only affects 6.14.6 onwards"
+CVE_STATUS[CVE-2026-80734] = "fixed-version: only affects 6.12.111 onwards"
 
 CVE_STATUS[CVE-2026-80735] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-80736] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-80737 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80737] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80738 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80738] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80739 may need backporting (fixed from 6.6.152)
+CVE_STATUS[CVE-2026-80739] = "cpe-stable-backport: Backported in 6.6.152"
 
 CVE_STATUS[CVE-2026-80740] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-80741] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-80742 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80742] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80743 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80743] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80744 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80744] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80745] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-80746] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-80747 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80747] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80748] = "fixed-version: only affects 6.17 onwards"
 
@@ -30118,17 +30132,17 @@ CVE_STATUS[CVE-2026-80750] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-80751] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-80752 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80752] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80753] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-80754 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80754] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80755 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80755] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80756 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80756] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80757 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80757] = "cpe-stable-backport: Backported in 6.6.153"
 
 CVE_STATUS[CVE-2026-80758] = "fixed-version: only affects 6.16 onwards"
 
@@ -30136,29 +30150,29 @@ CVE_STATUS[CVE-2026-80759] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-80760] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-80761 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80761] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80762 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80762] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80763 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80763] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80764 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80764] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80765 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80765] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80766 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80766] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80767 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80767] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80768 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80768] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80769] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-80770 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80770] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80771 needs backporting (fixed from 7.3rc1)
+# CVE-2026-80771 needs backporting (fixed from 7.3)
 
-# CVE-2026-80772 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80772] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80773] = "fixed-version: only affects 7.1 onwards"
 
@@ -30174,75 +30188,75 @@ CVE_STATUS[CVE-2026-80778] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-80779] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-80780 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80780] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80781 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80781] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80782 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80782] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80783 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80783] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80784 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80784] = "cpe-stable-backport: Backported in 6.6.154"
 
 # CVE-2026-80785 needs backporting (fixed from 7.2)
 
-# CVE-2026-80786 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80786] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80787] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-80788 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80788] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80789 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80789] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80790 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80790] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80791 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80791] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80792 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80792] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80793 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80793] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80794 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80794] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80795 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80795] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80796 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80796] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80797 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80797] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80798 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80798] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80799 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80799] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80800 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80800] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80801 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80801] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80802 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80802] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80803 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80803] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80804] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-80805 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80805] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80806 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80806] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80807 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80807] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80808 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80808] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80809 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80809] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80810] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-80811] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-80812 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80812] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80813] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-80814 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80814] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80815] = "fixed-version: only affects 6.10 onwards"
 
@@ -30252,7 +30266,7 @@ CVE_STATUS[CVE-2026-80817] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-80818] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-80819 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80819] = "cpe-stable-backport: Backported in 6.6.154"
 
 # CVE-2026-80820 needs backporting (fixed from 7.2)
 
@@ -30260,73 +30274,73 @@ CVE_STATUS[CVE-2026-80821] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-80822] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-80823 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80823] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80824 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80824] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80825] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-80826 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80826] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80827 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80827] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80828 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80828] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80829 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80829] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80830 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80830] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80831 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80831] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80832 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80832] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80833 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80833] = "cpe-stable-backport: Backported in 6.6.158"
 
-# CVE-2026-80834 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80834] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-80835] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-80836 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80836] = "cpe-stable-backport: Backported in 6.6.158"
 
-# CVE-2026-80837 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80837] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-80838] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-80839] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-80840 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80840] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80841 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80841] = "cpe-stable-backport: Backported in 6.6.158"
 
-# CVE-2026-80842 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80842] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80843 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80843] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80844 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80844] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80845] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-80846 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80846] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80847 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80847] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80848 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80848] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80849] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-80850] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-80851 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80851] = "cpe-stable-backport: Backported in 6.6.158"
 
-# CVE-2026-80852 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80852] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80853] = "fixed-version: only affects 7.2 onwards"
 
-# CVE-2026-80854 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80854] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80855 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80855] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80856 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80856] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80857] = "fixed-version: only affects 6.18.25 onwards"
 
@@ -30336,17 +30350,17 @@ CVE_STATUS[CVE-2026-80859] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-80860] = "fixed-version: only affects 6.12.96 onwards"
 
-# CVE-2026-80861 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80861] = "cpe-stable-backport: Backported in 6.6.158"
 
-CVE_STATUS[CVE-2026-80862] = "fixed-version: only affects 6.12 onwards"
+# CVE-2026-80862 may need backporting (fixed from 6.7)
 
-# CVE-2026-80863 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80863] = "cpe-stable-backport: Backported in 6.6.156"
 
-# CVE-2026-80864 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80864] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80865] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-80866 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80866] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80867] = "cpe-stable-backport: Backported in 6.6.145"
 
@@ -30382,7 +30396,7 @@ CVE_STATUS[CVE-2026-80882] = "fixed-version: only affects 6.12.91 onwards"
 
 CVE_STATUS[CVE-2026-80883] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-80884 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80884] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-80885] = "fixed-version: only affects 6.16 onwards"
 
@@ -30422,47 +30436,5951 @@ CVE_STATUS[CVE-2026-80902] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-80903] = "fixed-version: only affects 6.12.18 onwards"
 
-# CVE-2026-80904 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80904] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80905 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-80905] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80906 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80906] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80907 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80907] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80908 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80908] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80909 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80909] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80910 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80910] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80911 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80911] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80912 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80912] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80913 may need backporting (fixed from 6.6.153)
+CVE_STATUS[CVE-2026-80913] = "cpe-stable-backport: Backported in 6.6.153"
 
-# CVE-2026-80914 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80914] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-80915] = "fixed-version: only affects 6.11.3 onwards"
 
-# CVE-2026-80916 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80916] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80917 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80917] = "cpe-stable-backport: Backported in 6.6.154"
 
-# CVE-2026-80918 may need backporting (fixed from 6.6.154)
+CVE_STATUS[CVE-2026-80918] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80919] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-80920 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80920] = "cpe-stable-backport: Backported in 6.6.160"
 
-# CVE-2026-80921 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80921] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80922] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-80923 may need backporting (fixed from 6.6.156)
+CVE_STATUS[CVE-2026-80923] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80924] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-80925 needs backporting (fixed from 7.3rc1)
+CVE_STATUS[CVE-2026-80925] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-80926] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-80927] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-80928] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80929] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-80930] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80931] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80932] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80933] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80934] = "fixed-version: only affects 6.17.8 onwards"
+
+CVE_STATUS[CVE-2026-80935] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-80936] = "fixed-version: only affects 6.14.3 onwards"
+
+CVE_STATUS[CVE-2026-80937] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-80938] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80939] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-80940] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-80941] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80942] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-80943] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-80944] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80945] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-80946] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80947] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-80948] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-80949] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80950] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-80951] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80952] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80953] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80954] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80955] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80956] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80957] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80958] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80959] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80960] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80961] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80962] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80963] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80964] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80965] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80966] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80967] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80968] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80969] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80970] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80971] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80972] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80973] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80974] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-80975] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80976] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80977] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80978] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80979] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80980] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-80981] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80982] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80983] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80984] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80985] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80986] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80987] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80988] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80989] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80990] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80991] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-80992] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80993] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80994] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-80995] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80996] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-80997] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-80998] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-80999 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-81000] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81001] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81002] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81003] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81004] = "fixed-version: only affects 6.18.20 onwards"
+
+CVE_STATUS[CVE-2026-81005] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81006] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-81007] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81008] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81009] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-81010] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-81011] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81012] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81013] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81014] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81015] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-81016] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-81017] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-81018] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-89436] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-89437] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89438] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89439] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89440] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89441] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89442] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89443] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89444] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89445] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89446] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-89447] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-89448] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89449] = "fixed-version: only affects 6.17.3 onwards"
+
+CVE_STATUS[CVE-2026-89450] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-89451] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89452] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89453] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89454] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89455] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89456] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89457] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89458] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89459] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-89460] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89461] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89462] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89463] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89464] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89465] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89466] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89467] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89468] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89469] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89470] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89471] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89472] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89473] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89474] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89475] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89476] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89477] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89478] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89479] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89480] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89481] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89482] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89483] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89484] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89485] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89486] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89487] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89488] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89489] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89490] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89491] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89492] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89493] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89494] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89495] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89496] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89497] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89498] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89499] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89500] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89501] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89502] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89503] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89504] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89505] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89506] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-89507] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89508] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89509] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89510] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89511] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89512] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89513] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89514] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89515] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89516] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89517] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89518] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89519] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89520] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89521] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89522] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-89523] = "fixed-version: only affects 6.14.3 onwards"
+
+CVE_STATUS[CVE-2026-89524] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89525] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89526] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89527] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89528] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89529] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89530] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89531] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89532] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89533] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-89534 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-89535] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-89536] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89537] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89538] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89539] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89540] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89541] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89542] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89543] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89544] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-89545 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89546] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89547] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89548] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89549] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89550] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89551] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89552] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89553] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89554] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89555] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89556] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-89557] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89558] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-89559] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89560] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89561] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89562] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89563] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89564] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89565] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89566] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89567] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89568] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89569] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89570] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89571] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89572] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89573] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89574] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89575] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89576] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89577] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89578] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89579] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89580] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89581] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89582] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89583] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89584] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89585] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89586] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89587] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89588] = "fixed-version: only affects 6.12.75 onwards"
+
+CVE_STATUS[CVE-2026-89589] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89590] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89591] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89592] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89593] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-89594] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89595] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89596] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89597] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89598] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89599] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89600] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89601] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89602] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89604] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89605] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89606] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89607] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89608] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89609] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-89610 needs backporting (fixed from 7.3)
+
+# CVE-2026-89611 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89612] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89613] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89614] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89615] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89616] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89617] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89618] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89619] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89620] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89621] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89622] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89623] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89624] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89625] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89626] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89627] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89628] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89629] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-89630] = "fixed-version: only affects 6.18.56 onwards"
+
+CVE_STATUS[CVE-2026-89631] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89632] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89633] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89634] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89635] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-89636] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-89637 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89638] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89639] = "fixed-version: only affects 6.18.44 onwards"
+
+CVE_STATUS[CVE-2026-89640] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89641] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89642] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89643] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89644] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89645] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89646] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89647] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89648] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89649] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89650] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89651] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89652] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89653] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89654] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89655] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89656] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89657] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89658] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-89659] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89660] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-89661] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89662] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89663] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89664] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89665] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89666] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89667] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-89668] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89669] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89670] = "fixed-version: only affects 6.15.3 onwards"
+
+CVE_STATUS[CVE-2026-89671] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89672] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89673] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89674] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-89675 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89676] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89677] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89678] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89679] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89680] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89681] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89682] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89683] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-89684] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89685] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89686] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89687] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89688] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89689] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89690] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-89691] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-89692] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89693] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89694] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89695] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89696] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89697] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89698] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-89699] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89700] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89701] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89702] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89703] = "fixed-version: only affects 6.11.6 onwards"
+
+CVE_STATUS[CVE-2026-89704] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89705] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-89706] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89707] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-89708 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89709] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89710] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89711] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89712] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89713] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89714] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-89715] = "fixed-version: only affects 6.15.10 onwards"
+
+CVE_STATUS[CVE-2026-89716] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89717] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89718] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89719] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89720] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89721] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-89722 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89723] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89724] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89725] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89726] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89727] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89728] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89729] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89730] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89731] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-89732] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89733] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89734] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-89735] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89736] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89737] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89738] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-89739 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-89740] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89741] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89742] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89743] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89744] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89745] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89746] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89747] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89748] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89749] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89750] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89751] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89752] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89753] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89754] = "fixed-version: only affects 6.18.21 onwards"
+
+CVE_STATUS[CVE-2026-89755] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89756] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89757] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89758] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89759] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89760] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89761] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89762] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89763] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89764] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89765] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89766] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89767] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89768] = "fixed-version: only affects 6.12.95 onwards"
+
+CVE_STATUS[CVE-2026-89769] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89770] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89771] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89772] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-89773] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-89774] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-89775] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89776] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89777] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89778] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89779] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89780] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89781] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89782] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89783] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89784] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89785] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89786] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89787] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89788] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89789] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89790] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89791] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89792] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-89793] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89794] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89795] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89796] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-89797 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89798] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89799] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89800] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89801] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89802] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89803] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89804] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89805] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-89806] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89807] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89808] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89809] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89810] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89811] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89812] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-89813] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89814] = "fixed-version: only affects 6.14.9 onwards"
+
+CVE_STATUS[CVE-2026-89815] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89816] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89817] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89818] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89819] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89820] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89821] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89822] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89823] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89824] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89825] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89826] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89827] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89828] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-89829] = "fixed-version: only affects 6.18.13 onwards"
+
+CVE_STATUS[CVE-2026-89830] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-89831] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89832] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89833] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89834] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89835] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89836] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89837] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89838] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89839] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89840] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89841] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89842] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89843] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89844] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89845] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89846] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89847] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89848] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89849] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89850] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89851] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89852] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89853] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89854] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89855] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89856] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89857] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89858] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89859] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89860] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89861] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-89862 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-89863] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89864] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89865] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89866] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89867] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89868] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89869] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89870] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89871] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89872] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89873] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89874] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89875] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89876] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89877] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89878] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89879] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89880] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89881] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89882] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89883] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89884] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89885] = "fixed-version: only affects 6.12.64 onwards"
+
+CVE_STATUS[CVE-2026-89886] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89887] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89888] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89889] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89890] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89891] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89892] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89893] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89894] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89895] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89896] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89897] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89898] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-89899 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89900] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89901] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89902] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89903] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89904] = "fixed-version: only affects 6.12.101 onwards"
+
+CVE_STATUS[CVE-2026-89905] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89906] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89907] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-89908] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89909] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-89910] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89911] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89912] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-89913 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-89914] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89915] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89916] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89917] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89918] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-89919] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89920] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89921] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89922] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89923] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89924] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89925] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89926] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89927] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89928] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89929] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89930] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89931] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89932] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89933] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89934] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89935] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89936] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89937] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89938] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89939] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89940] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89941] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89942] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89943] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-89944] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89945] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89946] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89947] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89948] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89949] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89950] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-89951] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89952] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89953] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89954] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89955] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89956] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89957] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89958] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89959] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89960] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89961] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89962] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89963] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89964] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89965] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89966] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89967] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89968] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89969] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89970] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89971] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-89972] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89973] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89974] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-89975] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89976] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89977] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-89978] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-89979] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89980] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89981] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-89982] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89983] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89984] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89985] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-89986] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-89987] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89988] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89989] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89990] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89991] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-89992] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89993] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89994] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-89995] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89996] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-89997] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89998] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-89999] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90000] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90001] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90002] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90003] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90004] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90005] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-90006] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-90007] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90008] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90009] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90010] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90011] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90012] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90013] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90014] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90015] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90016] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90017] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90018] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90019] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90020] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90021] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90022] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90023] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90024] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90025] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90026] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-90027 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90028] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90029] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90030] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90031] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90032] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90033] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90034] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90035] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90036] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90037] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90038] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-90039] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-90040] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90041] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90042] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90043] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90044] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90045] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90046] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90047] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-90048] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90049] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90051] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-90053] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90054] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90055] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90056] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90057] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90058] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90059] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-90060] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90061] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90062] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90063] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90064] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90065] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90066] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90067] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90068] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90069] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-90070] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90071] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90072] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90073] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90074] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90075] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90076] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90077] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90078] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90079] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90080] = "fixed-version: only affects 6.14.9 onwards"
+
+CVE_STATUS[CVE-2026-90081] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90082] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90083] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90084] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90085] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90086] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-90087] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90088] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90089] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90090] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90091] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90092] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90093] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90094] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90095] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-90096] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-90097] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-90098 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90099] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90100] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90101] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-90102] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90103] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90104] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90105] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90106] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90107] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90108] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90109] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90110] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90111] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90112] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90113] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-90114] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90115] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90116] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90117] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90118] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90119] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90120] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90121] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90122] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90123] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-90124] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90125] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90126] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90127] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-90128] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-90129 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-90130] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90131] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90132] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90133] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90134] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90135] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90136] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-90137] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90138] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90139] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90140] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90141] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90142] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90143] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90144] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-90145] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-90146] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90147] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-90148] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90149] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90150] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90151] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90152] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90153] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90154] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90155] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90156] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90157] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90158] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90159] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-90160] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90161] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90162] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90163] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90164] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90165] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90166] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90167] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90169] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90170] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90171] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90172] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90173] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90174] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90175] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90176] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90177] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-90178] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-90179] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90180] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90181] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90182] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90183] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90184] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90185] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90186] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90187] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90188] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90189] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90190] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90191] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90192] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90193] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90194] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90195] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-90196] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90197] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90198] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90199] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90200] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90201] = "fixed-version: only affects 6.12.34 onwards"
+
+CVE_STATUS[CVE-2026-90202] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90203] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90204] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90205] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90206] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90207] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90208] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90209] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90210] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-90211] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90212] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-90213] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90214] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90215] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-90216] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90217] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-90218] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90219] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90220] = "fixed-version: only affects 6.12.97 onwards"
+
+CVE_STATUS[CVE-2026-90221] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90222] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90223] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90224] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90225] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90226] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90227] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90228] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90229] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90230] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90231] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-90232] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90233] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-90234] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90235] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90236] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-90237 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90238] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-90239] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-90240] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-90241] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-90242] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-90243] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-90244] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90245] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90246] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90247] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90248] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90249] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90250] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90251] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90252] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-90253] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90254] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90255] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90256] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90257] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90258] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-90259] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90260] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-90261 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90262] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90263] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90264] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90265] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90266] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90267] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90268] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90269] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90270] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-90271] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-90272] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90273] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90274] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90275] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90276] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90277] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90278] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90279] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90280] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90281] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90282] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90283] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90284] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90285] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90286] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90287] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90288] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90289] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90290] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90291] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90292] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90293] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90294] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90295] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90296] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90297] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90298] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90299] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90300] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90301] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90302] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90303] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90304] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90305] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90306] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-90307] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90308] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90309] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90311] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90312] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90313] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90314] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-90315 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90316] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-90317 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90318] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90319] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90320] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90321] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90322] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90323] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90324] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90325] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90326] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90327] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90328] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90329] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90330] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90331] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90332] = "fixed-version: only affects 6.19.7 onwards"
+
+# CVE-2026-90333 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90334] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90335] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90336] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90337] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90338] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90339] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-90340] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-90341] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90342] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-90343] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90344] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-90345] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90346] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90347] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90348] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90349] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90350] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90351] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-90352] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90353] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90354] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90355] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90356] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90357] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90358] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-90359 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90360] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90361] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90362] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90363] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-90364] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90365] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90366] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90367] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90368] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90369] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-90370] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90371] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90372] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-90373 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-90374] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90375] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90376] = "fixed-version: only affects 6.18.33 onwards"
+
+CVE_STATUS[CVE-2026-90377] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-90378] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-90379 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90380] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-90381] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-90382] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90383] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90384] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-90385] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90386] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90387] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90388] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-90389 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90390] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-90391] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90392] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90393] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90394] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90395] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90396] = "fixed-version: only affects 6.16.8 onwards"
+
+CVE_STATUS[CVE-2026-90397] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90398] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90399] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90400] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-90401 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-90402] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-90403] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90404] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90405] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90406] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90407] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90408] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90409] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-90410] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90411] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90412] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-90413] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90414] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90415] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90416] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90417] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90418] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90419] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90420] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90421] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90422] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90423] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-90424] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-90425] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90426] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-90427] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-90428] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-90429] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-90430] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-90431] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90432] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-90433] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-90434] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-90435] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92476] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92477] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92478] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-92479] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-92480] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-92481] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92482] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-92483] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-92484] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92485] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-92486] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-92487] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-92488] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-92489] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92490] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92491] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-92492] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-92493 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-92494] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92495] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92496] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92497] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92498] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-92499 needs backporting (fixed from 7.3)
+
+# CVE-2026-92500 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-92501] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92502] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92503] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-92504] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92505] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-92506] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92507] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92508] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92509] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92510] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92511] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92512] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92513] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-92514] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92515] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-92516] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-92517] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-92518] = "fixed-version: only affects 6.11.6 onwards"
+
+CVE_STATUS[CVE-2026-92519] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-92520] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-92521] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92522] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92523] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92524] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-92525] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93037] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93038] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-93039] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93040] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93041] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93042] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93043] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-93044] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-93045] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-93046] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-93047 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-93048] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93049] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93050] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93051] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93052] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93053] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93054] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93055] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93056] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93057] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93058] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93059] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-93060] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-93061] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93062] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93063] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93064] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93065] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93066] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-93067] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93068] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93069] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-93070] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-93071] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-93072] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93073] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93074] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93075] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93076] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93077] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-93078] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-93079] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-93080] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-93081] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93082] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-93083] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93084] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93085] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93086] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93089] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93090] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-93091 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-93092] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93093] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93094] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-93095] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93096] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-93097] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93098] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-93099 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-93100] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93101] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93102] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93103] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93104] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93105] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93106] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-93107] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93108] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93109] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93110] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93111] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-93112] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-93113] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-93114] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93115] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93116] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93117] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93118] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93119] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-93120] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93121] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-93122] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-93123 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-93124] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93125] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93126] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93127] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-93128] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93129] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93130] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93131] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93132] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-93133] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-93134] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-93135] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-93136] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93137] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93138] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93139] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-93140] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93141] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93142] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93143] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-93144] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93145] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93146] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93147] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-93148] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93149] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93150] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93151] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93152] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93153] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-93154 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-93155] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93156] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93157] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93158] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93159] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93160] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93161] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93162] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-93163] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93164] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93165] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93166] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-93167] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93168] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93169] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93170] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93171] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-93172] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93173] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-93174] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93175] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93176] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93177] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93178] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93179] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93180] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-93181] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-93182] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93183] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-93184 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-93185] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93186] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93187] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-93188] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93189] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93190] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93191] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93192] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93193] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-93194] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93195] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93196] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93197] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93198] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93199] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93200] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93201] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93202] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93203] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93204] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93205] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93206] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93207] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93208] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93209] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93210] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93211] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-93212] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-93213] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93214] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93215] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-93216] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93217] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-93218] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-93219] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93220] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-93221] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93222] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93223] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93224] = "fixed-version: only affects 6.12.35 onwards"
+
+CVE_STATUS[CVE-2026-93225] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-93226] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93227] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-93228] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93229] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-93230] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-93231] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93232] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93233] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-93234] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93235] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93236] = "cpe-stable-backport: Backported in 6.6.157"
+
+# CVE-2026-93237 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-93238] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93239] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93240] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93241] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-93242] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93243] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93244] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93245] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93246] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93247] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93248] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-93249] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-93250] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93251] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93252] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93253] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-93254] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93255] = "fixed-version: only affects 7.1.8 onwards"
+
+CVE_STATUS[CVE-2026-93256] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93257] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93258] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-93259] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93260] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93261] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93262] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93263] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93264] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93265] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-93266] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-93267] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-93268] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93269] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93270] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-93271] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93272] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93273] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93274] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93275] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-93276] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-93277] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93278] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93279] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93280] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93281] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93282] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93283] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-93284] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-93285] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93286] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93287] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93288] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93781] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93782] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93783] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93784] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93785] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93786] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93787] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93788] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93789] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93790] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93791] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93792] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93793] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93794] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93795] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93796] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93797] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93798] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93799] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93800] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93801] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93802] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93803] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93804] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93805] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93806] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93807] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93808] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93809] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-93810] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93811] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93812] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93813] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93814] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93815] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93816] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93817] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93818] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-93819] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93820] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93821] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93822] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93823] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93824] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93825] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93826] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93827] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-93828] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-93829] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-93830] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97407] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97408] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97409] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97410] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-97411] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97412] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97413] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97414] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-97415] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97416] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97417] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97418] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97419] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97420] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97421] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97422] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97423] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-97424] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97425] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97426] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-97427] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97428] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97429] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97430] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97431] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-97432] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97433] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97434] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97435] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97436] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97437] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97438] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97439] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97440] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97441] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97442] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97443] = "fixed-version: only affects 6.12.24 onwards"
+
+CVE_STATUS[CVE-2026-97444] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97445] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97446] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97447] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97448] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97449] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97450] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97451] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97452] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97453] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97454] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97455] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97456] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97472] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97473] = "fixed-version: only affects 6.10.12 onwards"
+
+CVE_STATUS[CVE-2026-97474] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-97475] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97476] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97477] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97478] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97479] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97480] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97481] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97482] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97483] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97484] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97485] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97486] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97487] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97488] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97489] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97490] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97491] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97492] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97493] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97494] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97495] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97496] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97497] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97498] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-97499 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-97500] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97501] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97502] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97503] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97504] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97505] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97506] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97507] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97508] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97509] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97510] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97511] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-97512] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97513] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-97514] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-97515] = "fixed-version: only affects 6.12.31 onwards"
+
+CVE_STATUS[CVE-2026-97516] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97517] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97518] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97519] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-97520] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-97521] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-97522] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97523] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97524] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97525] = "fixed-version: only affects 6.18.7 onwards"
+
+CVE_STATUS[CVE-2026-97526] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-97527] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97528] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97529] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97530] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97531] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97532] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97533] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-97534] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97535] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97536] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97537] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97538] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-97539] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97540] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97541] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97542] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97543] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97544] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-97545] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-97546] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97547] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97548] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-97549] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97550] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-97551] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97552] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-97553] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-97554] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97555] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97556] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97557] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97558] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97559] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97560] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97561] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97562] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-97563 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-97564] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-97565 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-97566] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97567] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97568] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97569] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-97570] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-97571] = "fixed-version: only affects 6.12.20 onwards"
+
+CVE_STATUS[CVE-2026-97572] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97573] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97574] = "fixed-version: only affects 6.12.20 onwards"
+
+CVE_STATUS[CVE-2026-97575] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97576] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97577] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97578] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97579] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97580] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-97581] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97582] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97583] = "fixed-version: only affects 6.12.101 onwards"
+
+CVE_STATUS[CVE-2026-97584] = "fixed-version: only affects 6.12.101 onwards"
+
+CVE_STATUS[CVE-2026-97585] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-97586] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-97587] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97588] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97589] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97590] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97591] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-97592] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97593] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97594] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97595] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97596] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97597] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97598] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97599] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97600] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97601] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97602] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97603] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-97604] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97605] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97606] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-97607] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97608] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97609] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97610] = "fixed-version: only affects 6.18.17 onwards"
+
+CVE_STATUS[CVE-2026-97611] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97612] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97613] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97614] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-97615] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97616] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97617] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97618] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-97619] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97620] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-97621] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97899] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97900] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97901] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97902] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-97903] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97904] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97905] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97906] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97907] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97908] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97909] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97910] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97911] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-97912] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-97913] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-97914] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-97915] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97916] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97917] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97918] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97919] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97920] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97921] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97922] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97923] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97924] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97925] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97926] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97927] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97928] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97929] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97930] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97931] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97932] = "fixed-version: only affects 7.1.6 onwards"
+
+CVE_STATUS[CVE-2026-97933] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97934] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97935] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97936] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97937] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-97938] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97939] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97940] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97941] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-97942] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-97943] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-97944] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-97945] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97946] = "fixed-version: only affects 6.17.8 onwards"
+
+CVE_STATUS[CVE-2026-97947] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-97948] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97949] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97950] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97951] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97952] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97953] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97954] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97955] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-97956] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-97957] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97958] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97959] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97960] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97961] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97962] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97963] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97964] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97965] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97966] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97967] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-97968] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-97969] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97970] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97971] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-97972] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-97973] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97974] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-97975] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97976] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97977] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97978] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97979] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97980] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-97981] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97982] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97983] = "fixed-version: only affects 7.1.5 onwards"
+
+CVE_STATUS[CVE-2026-97984] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97985] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97986] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97987] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97988] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97989] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97990] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97991] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97992] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97993] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97994] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97995] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-97996] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-97997] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-97998] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98000] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98001] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98002] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98003] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98004] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98005] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98006] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98007] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98008] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98009] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98010] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98011] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98012] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98013] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98014] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98015] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98016] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98017] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98018] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-98019] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98020] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98021] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98022] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98023] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98024] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98025] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98026] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98027] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98028] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98029] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98030] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98031] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98032] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98033] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98034] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98035] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98036] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98037] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98038] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98039] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-98040] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98041] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98042] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98043] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98044] = "fixed-version: only affects 6.12.101 onwards"
+
+CVE_STATUS[CVE-2026-98045] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98046] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98047] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98048] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98049] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98050] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98051] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98052] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98053] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98054] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-98055] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98056] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98057] = "fixed-version: only affects 6.12.16 onwards"
+
+CVE_STATUS[CVE-2026-98058] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98059] = "fixed-version: only affects 6.12.6 onwards"
+
+CVE_STATUS[CVE-2026-98060] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98061] = "fixed-version: only affects 6.18.2 onwards"
+
+CVE_STATUS[CVE-2026-98062] = "fixed-version: only affects 6.12.6 onwards"
+
+CVE_STATUS[CVE-2026-98063] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98064] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98065] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98066] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98067] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98068] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98069] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98070] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98071] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98072] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98073] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98074] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98075] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98076] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98077] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98078] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98079] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98080] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98081] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98082] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98083] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98084] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98085] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98086] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98087 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98088] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98089] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98090] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98091] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98092] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98093] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98094] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98095] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98096] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98097] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98098] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98099] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98101] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98102] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98103] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98104] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98105] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98106] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98107] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98108] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98109] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98110] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98111] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98112] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98113] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98114] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98115 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-98116] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98117] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98118] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98119] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98120] = "fixed-version: only affects 6.18.17 onwards"
+
+CVE_STATUS[CVE-2026-98121] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98122] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98123] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98124] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98125] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98126] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98127] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98128] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98129] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98130] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98131 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98132] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98133] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98134] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98135] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98136] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98137] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98138] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98139] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98140] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98141] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98142] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98143] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98144] = "fixed-version: only affects 6.18.57 onwards"
+
+CVE_STATUS[CVE-2026-98145] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98146] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98147] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98148] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98149] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98150] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98151] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98152] = "fixed-version: only affects 6.12.96 onwards"
+
+CVE_STATUS[CVE-2026-98153] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98154] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98155] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98156] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98157] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98158] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98159] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98160] = "cpe-stable-backport: Backported in 6.6.157"
+
+CVE_STATUS[CVE-2026-98161] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98162] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98163] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98164] = "cpe-stable-backport: Backported in 6.6.156"
+
+CVE_STATUS[CVE-2026-98166] = "fixed-version: only affects 6.18.57 onwards"
+
+CVE_STATUS[CVE-2026-98167] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98168] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98169] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98170] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98171] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98172] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98173] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98174] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98175] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98176 needs backporting (fixed from 7.3)
+
+# CVE-2026-98177 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98178] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-98179 needs backporting (fixed from 7.3)
+
+# CVE-2026-98180 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98181] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98182 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98183] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98184] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98185] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98186] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98187] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98188] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98189] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98190] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98191] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98192] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98193] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98194] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98195] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98196] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98197] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98198] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98199] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98200] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98201] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98202] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98203] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98204] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98205] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98206] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98207] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98208] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98209] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98210] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98211 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98212] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98213] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98214] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98215] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98216] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98217] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98218] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98219] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98220] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98221] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98222 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98223] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98224] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98225] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98226] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98227] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98228] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-98229 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98230] = "fixed-version: only affects 6.12.13 onwards"
+
+CVE_STATUS[CVE-2026-98231] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98232] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98233] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98234] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98235] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98236] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98237] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98238] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98239] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98240] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98241] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98242] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98243] = "fixed-version: only affects 7.1.5 onwards"
+
+CVE_STATUS[CVE-2026-98244] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98245] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98246] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98247] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98248 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98249] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98250] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98251] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98252] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98253] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98254 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98255] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98256] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98257] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98258] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98259] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98260] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98261] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98262] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98263] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98264] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98265] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98266 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98267] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98268] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98269] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98270] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98271 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98272] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98273 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98274] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98275] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98276] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98277] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98278] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-98279 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98280] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98281] = "fixed-version: only affects 6.18.33 onwards"
+
+CVE_STATUS[CVE-2026-98282] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98283] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98284 needs backporting (fixed from 7.3)
+
+# CVE-2026-98285 needs backporting (fixed from 7.3)
+
+# CVE-2026-98286 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98287] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98288 needs backporting (fixed from 7.3)
+
+# CVE-2026-98289 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-98290] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98291] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-98292 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98293] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98294 needs backporting (fixed from 7.3)
+
+# CVE-2026-98295 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98296] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98297] = "fixed-version: only affects 6.12.93 onwards"
+
+CVE_STATUS[CVE-2026-98298] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98299] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98300] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98301] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98302] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98303] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98304 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98305] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98306] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98307 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98308] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98309] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98310] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98311] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98312] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98313 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98314] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98315] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98316] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98317 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98318] = "fixed-version: only affects 6.15.6 onwards"
+
+CVE_STATUS[CVE-2026-98319] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98320] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98321 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98322] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98323] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98324] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98325] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98326] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98327 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98328] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98329 needs backporting (fixed from 7.3)
+
+# CVE-2026-98330 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98331] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98332 needs backporting (fixed from 7.3)
+
+# CVE-2026-98333 needs backporting (fixed from 7.3)
+
+# CVE-2026-98334 needs backporting (fixed from 7.3)
+
+# CVE-2026-98335 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98336] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98337 needs backporting (fixed from 7.3)
+
+# CVE-2026-98338 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98339] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98340] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98341 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98342] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98343] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98344] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98345] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98346] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98347] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98348] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98349] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98350] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98351] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98352] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98353 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-98354] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98355 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98356] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98357] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98358] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98359] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98360] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98361] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98362] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98363] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98364 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98365] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98366] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98367] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98368] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98369] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98370] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98371] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98372] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98373] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98374] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98375] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98376] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98377] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98378] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98379] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98380] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98381] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98382] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98383] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98384] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98385] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98386] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98387 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98388] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98389] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98390] = "fixed-version: only affects 6.17.8 onwards"
+
+CVE_STATUS[CVE-2026-98391] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98392] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-98393 needs backporting (fixed from 7.3)
+
+# CVE-2026-98394 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98395] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98396] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98397] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98398] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98399] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98400] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98401 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98402] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98403 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98404] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98405] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98406] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98407] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98408] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98409] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98410] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98411] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98412] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98413] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98414] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98415] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98416] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98417] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98418] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98419] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98420 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98421] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98422] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98423] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98424 needs backporting (fixed from 7.3)
+
+# CVE-2026-98425 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98426] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98427 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98428] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98429] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98430] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98431] = "fixed-version: only affects 6.11.11 onwards"
+
+CVE_STATUS[CVE-2026-98432] = "cpe-stable-backport: Backported in 6.6.159"
+
+CVE_STATUS[CVE-2026-98433] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98434] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-98435 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98436] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98437] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98438] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-98439 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98440] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98441] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98442] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98443] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98444] = "fixed-version: only affects 6.12.14 onwards"
+
+CVE_STATUS[CVE-2026-98445] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98446] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98447] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98448] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-98449 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98450] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98451] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98452 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98453] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98454] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98455] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98456] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98457] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98458 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98459] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98460] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98461] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98462] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98463] = "fixed-version: only affects 6.18.19 onwards"
+
+CVE_STATUS[CVE-2026-98464] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98465] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98466 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98467] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98468] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98469] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98470] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-98471 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98472] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-98473 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-98474] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98475] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98476] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98477] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98478] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98479] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98480] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-98481] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98482] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98483] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98484] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98485] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98486] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98487] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98488] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98489] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98490] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98491] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98492] = "fixed-version: only affects 6.17.3 onwards"
+
+CVE_STATUS[CVE-2026-98493] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98494] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98495] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98496] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98497] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98498] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98499] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98500] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98501] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98502] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98503 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98504] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98505] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98506 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98507] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98508] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98509] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98510] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98511] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98512] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98513] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-98514] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98515] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98516] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98517] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98518] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98519] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98520] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98521] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98522] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98523] = "fixed-version: only affects 6.12.19 onwards"
+
+CVE_STATUS[CVE-2026-98524] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98525 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98526] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98527] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98528] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98529] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98530] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98531] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98532] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98533] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98534] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98535] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98536] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98537] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98538] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98539 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98540] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98541] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98542] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98543] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98544] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98545] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98546] = "fixed-version: only affects 6.12.25 onwards"
+
+CVE_STATUS[CVE-2026-98547] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98548] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98549] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98550] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98551 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98552] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98553] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98554] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98555] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98556 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98557] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-98558 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98559] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98560] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98561] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98562] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98563] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98564] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98565] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98566] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98567] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98568] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98569] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98570] = "fixed-version: only affects 6.12.16 onwards"
+
+CVE_STATUS[CVE-2026-98571] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98572] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98573] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98574] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98575] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98576] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98577] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98578] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98579] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98580] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98581] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98582] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98583] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98584] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-98585] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98586] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98587] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98588] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98589 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98590] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98591] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98592] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98593] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98594] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98595] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98596] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98597] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98598 needs backporting (fixed from 7.3)
+
+# CVE-2026-98599 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98600] = "fixed-version: only affects 6.12.111 onwards"
+
+CVE_STATUS[CVE-2026-98601] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98602] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98603] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98604] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98605] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98606] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98607] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98608] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98609] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98610] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98611] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98612] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98613] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98614] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98615] = "fixed-version: only affects 6.12.29 onwards"
+
+CVE_STATUS[CVE-2026-98616] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98617] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98618] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98619] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98620] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98621] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98622] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98623] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98624] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98625] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98626] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98627] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-98628 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98629] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98630] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98631] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98632] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98633] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-98634 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98635] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98636] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98637] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98638] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98639] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98640] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98641] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-98642 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98643] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98644] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98645] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98646] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98647] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98648] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98649] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98650] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98651] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-98652 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98653] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98655] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98656] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98657] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98658] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98659] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98660] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98661 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98662] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98663] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98664] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98665] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98666] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98667] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98668] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98669] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98670] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98671] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98672] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98673] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98674] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98675] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98676] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98677] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98678] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98679] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98680] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-98681] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98682 may need backporting (fixed from 6.7)
+
+# CVE-2026-98683 may need backporting (fixed from 6.7)
+
+# CVE-2026-98684 needs backporting (fixed from 7.3)
+
+# CVE-2026-98685 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-98686] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98687] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98688 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98689] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98690] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98691] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98692] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98693] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98694] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98695] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98696] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98697] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98698] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98699] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98700] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98701] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98702] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98703] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98704] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98705] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98706] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98707] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98708] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98709] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98710] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98711] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98712] = "fixed-version: only affects 6.19.9 onwards"
+
+CVE_STATUS[CVE-2026-98713] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-98714 needs backporting (fixed from 7.3)
+
+# CVE-2026-98715 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98716] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98717] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98718] = "fixed-version: only affects 6.18.55 onwards"
+
+CVE_STATUS[CVE-2026-98719] = "fixed-version: only affects 6.18.55 onwards"
+
+# CVE-2026-98720 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98721] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98722] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98723] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98724] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98725] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98726] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98727] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98728] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98729] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98730] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98731] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98732] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98733] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98734] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98735] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98736] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98737] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98738] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98739] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98740 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98741] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98742] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98743] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98744] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98745] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98746] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98747 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98748] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98749] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98750] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98751] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98752] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98753] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98754] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98755] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98756] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98757] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98758 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98759] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98760] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98761] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98762] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98763] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98764] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98765] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98766] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98767] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98768] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98769] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98770] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98771] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98772] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98773] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98774] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98775] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98776] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98777] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98778] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98779] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98780] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98781] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98782] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98783] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98784] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98785] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98786 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98787] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98788] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-98789 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98790] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98791] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98792] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98793] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98794] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98795 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98796] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98797 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98798] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98799 needs backporting (fixed from 7.3)
+
+# CVE-2026-98800 needs backporting (fixed from 7.3)
+
+# CVE-2026-98801 needs backporting (fixed from 7.3)
+
+# CVE-2026-98802 needs backporting (fixed from 7.3)
+
+# CVE-2026-98803 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98804] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98805] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98806] = "fixed-version: only affects 6.14.9 onwards"
+
+# CVE-2026-98807 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98808] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98809] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98810 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98811] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98812] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98813] = "fixed-version: only affects 6.12.112 onwards"
+
+# CVE-2026-98814 needs backporting (fixed from 7.3)
+
+# CVE-2026-98815 needs backporting (fixed from 7.3)
+
+# CVE-2026-98816 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98817] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98818] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98819] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98820 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98821] = "fixed-version: only affects 6.16.8 onwards"
+
+CVE_STATUS[CVE-2026-98822] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98823] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98824 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98825] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98826 needs backporting (fixed from 7.3)
+
+# CVE-2026-98827 needs backporting (fixed from 7.3)
+
+# CVE-2026-98828 needs backporting (fixed from 7.3)
+
+# CVE-2026-98829 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98830] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98831] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98832] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98833] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98834 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98835] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98836] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98837] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98838] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98839 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98840] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98841] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98842] = "fixed-version: only affects 6.15.4 onwards"
+
+CVE_STATUS[CVE-2026-98843] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-98844] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98845] = "fixed-version: only affects 6.11.7 onwards"
+
+CVE_STATUS[CVE-2026-98846] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98847] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98848] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98849] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98850] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98851] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98852] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98853 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98854] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98855] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98856] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98857] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98858] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98859] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98860] = "fixed-version: only affects 6.12.78 onwards"
+
+CVE_STATUS[CVE-2026-98861] = "fixed-version: only affects 6.18.34 onwards"
+
+CVE_STATUS[CVE-2026-98862] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98863 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98864] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98865] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98866] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98867] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98868] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98869] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-98870] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2026-98871] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-98872] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98873] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98874] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98875] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-98876] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98877] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98878] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-98879] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98880] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98881] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98882] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98883] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98884] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98885] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98886] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98887] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98888] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98889] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98890] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98891] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98892] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98893] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98894] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98895] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-98896] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98897 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-98898] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98899] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98900] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98901] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98902] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98903 needs backporting (fixed from 7.2)
+
+# CVE-2026-98904 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-98905] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-98906 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-98907] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98908] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98909] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98910] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98911] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98912] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98913] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98914 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-98915] = "cpe-stable-backport: Backported in 6.6.158"
+
+CVE_STATUS[CVE-2026-98916] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98917 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98918] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98919] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98920] = "fixed-version: only affects 6.12.114 onwards"
+
+CVE_STATUS[CVE-2026-98921] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98922] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98923] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98924 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98925] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-98926 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98927] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98928] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-98929 needs backporting (fixed from 7.3)
+
+# CVE-2026-98930 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98931] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98932 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98933] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98934] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98935] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98936] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98937 needs backporting (fixed from 7.3)
+
+# CVE-2026-98938 has no known resolution
+
+CVE_STATUS[CVE-2026-98939] = "fixed-version: only affects 6.18.53 onwards"
+
+CVE_STATUS[CVE-2026-98940] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98941 has no known resolution
+
+CVE_STATUS[CVE-2026-98942] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-98944] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98945] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98946 needs backporting (fixed from 7.3)
+
+# CVE-2026-98947 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98948] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98949] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-98950] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98951 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98952] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-98953] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-98954 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98955] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98956] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98957 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98958] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-98959] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98960] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98961] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98962] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98963] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-98964] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98965] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-98966 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98967] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98968] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98969] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98970] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98971] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98972 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98973] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-98974] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-98975 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98976] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98977] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98978 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98979] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-98980 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98981] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98982] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-98983 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-98984] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98985] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98986] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98987] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-98988] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-98989 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98990] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98991] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-98992] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98993] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-98994] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-98995] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-98996 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-98997] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-98998] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-98999] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99000] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99001] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-99002] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99003] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99004] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99005] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99006] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99007] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99008] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99009] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99010] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99011] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-99012] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99013] = "fixed-version: only affects 6.12.6 onwards"
+
+CVE_STATUS[CVE-2026-99014] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99015] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99016] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-99017] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-99018] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-99019] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99020] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-99021 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99022] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99023] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99024] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99025] = "cpe-stable-backport: Backported in 6.6.160"
+
+# CVE-2026-99026 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99027] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99028] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99029] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99030] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99031] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99032] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99033] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99034] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99035] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99036] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99037] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99038] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99039] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99040] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99041] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99042] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99043] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99044] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99045] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99046] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-99047] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-99048] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-99049] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99050] = "fixed-version: only affects 6.18.6 onwards"
+
+CVE_STATUS[CVE-2026-99051] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99052] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99053] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99054] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99055] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99056] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99057] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99058] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99059] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99060] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99061] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99062] = "fixed-version: only affects 6.12.34 onwards"
+
+CVE_STATUS[CVE-2026-99063] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99064] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99065] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-99066] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99067] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99068] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-99069] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-99070] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99071] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99072] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99073] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-99074] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99075] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99076 needs backporting (fixed from 7.3)
+
+# CVE-2026-99077 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99078] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99079] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99080] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99081] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99082] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99083] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99084] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99085] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99086] = "fixed-version: only affects 6.18.16 onwards"
+
+# CVE-2026-99087 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99088] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99089] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99090] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99091] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99092] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99093] = "fixed-version: only affects 6.18.53 onwards"
+
+CVE_STATUS[CVE-2026-99094] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99095] = "cpe-stable-backport: Backported in 6.6.160"
+
+CVE_STATUS[CVE-2026-99096] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99097] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99098] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-99099] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-99100 needs backporting (fixed from 7.3)
+
+# CVE-2026-99101 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99102] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99103] = "cpe-stable-backport: Backported in 6.6.25"
+
+CVE_STATUS[CVE-2026-99104] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99105] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-99106 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99107] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99108] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99109 needs backporting (fixed from 7.3)
+
+# CVE-2026-99110 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99111] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99112 needs backporting (fixed from 7.3)
+
+# CVE-2026-99113 needs backporting (fixed from 7.3)
+
+# CVE-2026-99114 needs backporting (fixed from 7.3)
+
+# CVE-2026-99115 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99116] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99117 needs backporting (fixed from 7.3)
+
+# CVE-2026-99118 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99119] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99120] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99121 needs backporting (fixed from 7.3)
+
+# CVE-2026-99122 needs backporting (fixed from 7.3)
+
+# CVE-2026-99123 needs backporting (fixed from 7.3)
+
+# CVE-2026-99124 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99125] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-99126 needs backporting (fixed from 7.3)
+
+# CVE-2026-99127 needs backporting (fixed from 7.3)
+
+# CVE-2026-99128 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99129] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99130 needs backporting (fixed from 7.3)
+
+# CVE-2026-99131 needs backporting (fixed from 7.3)
+
+# CVE-2026-99132 needs backporting (fixed from 7.3)
+
+# CVE-2026-99133 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99134] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-99135 needs backporting (fixed from 7.3)
+
+# CVE-2026-99136 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99137] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99138 needs backporting (fixed from 7.3)
+
+# CVE-2026-99139 needs backporting (fixed from 7.3)
+
+# CVE-2026-99140 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99141] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99142 needs backporting (fixed from 7.3)
+
+# CVE-2026-99143 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99144] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99145] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99146 needs backporting (fixed from 7.3)
+
+# CVE-2026-99147 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99148] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-99149] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99150 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99151] = "fixed-version: only affects 7.2.9 onwards"
+
+# CVE-2026-99152 needs backporting (fixed from 7.3)
+
+# CVE-2026-99153 needs backporting (fixed from 7.3)
+
+# CVE-2026-99154 needs backporting (fixed from 7.3)
+
+# CVE-2026-99155 needs backporting (fixed from 7.3)
+
+# CVE-2026-99156 needs backporting (fixed from 7.3)
+
+# CVE-2026-99157 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99158] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99159] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99160] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-99161 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99162] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99163 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99164] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99165 needs backporting (fixed from 7.3)
+
+# CVE-2026-99166 needs backporting (fixed from 7.3)
+
+# CVE-2026-99167 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99168] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99169 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99170] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99171 needs backporting (fixed from 7.3)
+
+# CVE-2026-99172 needs backporting (fixed from 7.3)
+
+# CVE-2026-99173 may need backporting (fixed from 6.7)
+
+# CVE-2026-99174 needs backporting (fixed from 7.3)
+
+# CVE-2026-99175 needs backporting (fixed from 7.3)
+
+# CVE-2026-99176 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99177] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-99178 needs backporting (fixed from 7.3)
+
+# CVE-2026-99179 needs backporting (fixed from 7.3)
+
+# CVE-2026-99180 needs backporting (fixed from 7.3)
+
+# CVE-2026-99181 needs backporting (fixed from 7.3)
+
+# CVE-2026-99182 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99183] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-99184] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-99185] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99186] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99187 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99188] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99189 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99190] = "fixed-version: only affects 6.12.114 onwards"
+
+# CVE-2026-99191 needs backporting (fixed from 7.3)
+
+# CVE-2026-99192 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99193] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99194] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99195] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99196] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99197] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99198] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99199] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99200] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-99201 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99202] = "fixed-version: only affects 6.18.44 onwards"
+
+# CVE-2026-99203 needs backporting (fixed from 7.3)
+
+# CVE-2026-99204 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99205] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99206 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99207] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99208] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-99209] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99210] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99211 needs backporting (fixed from 7.3)
+
+# CVE-2026-99212 needs backporting (fixed from 7.3)
+
+# CVE-2026-99213 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99214] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-99215 needs backporting (fixed from 7.3)
+
+# CVE-2026-99216 needs backporting (fixed from 7.3)
+
+CVE_STATUS[CVE-2026-99999] = "cpe-stable-backport: Backported in 6.6.159"
 
