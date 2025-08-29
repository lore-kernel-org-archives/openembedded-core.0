Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A6ACA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 23:03:51 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.150.1756508629773411852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 16:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mKAyazSP;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afe9358fe77so368125466b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 16:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756508628; x=1757113428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6G1C2ZPuvQcN0hzzk2ynsqTyPpkkhrxfM1nAf76HTw=;
        b=mKAyazSP9awklypcgsZ5xR1XnxzpDG4knSMgOkbO8vKUXpTtDDWdSgbSujeMVTN1jn
         dMjDX4oxAJ9e1OjPpAzRCFyEaHYOffEengruhb2bpbfkUeJK4tVM3IA5lwEiOQgYhpDN
         IfiH++gGVNULjxOacKhWE+ha9Qm/c//cGQN5ZRrXBpLUSW48KjVirC2vLjhAobnZyvvU
         nzM0gBNr8o8F91s8OBgmaXTSxl7Lxl0QYSFbjrt13tryOio/ZupoTfut1HE9v90NWZH0
         emMcUuwfv6ZBKU75awkeIzpRhYCJv4qzgELfSlJoBC+hKvM49wxw6xtPU8YLCgEjPtDz
         JpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756508628; x=1757113428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6G1C2ZPuvQcN0hzzk2ynsqTyPpkkhrxfM1nAf76HTw=;
        b=OnuFj5vcvcGJcBIbjL8iiAVc3U7HFQvn94IEDea0L6sDySij0p9qHfXFjS8LY2yQSQ
         JiTWlPIkhgcBqZJHQnLddKuNbYnmRMlwBpii7CScVbgSXI1UD9cdOlrdwS5aCBksw2yL
         2nNGMS4YmgOEH1CQLeVEofEFhN9WTl5KrgB8vnaK2g6/F8cDv9AsgwXwPJeevZm+Rhsm
         mkNqs8Eovmc9qL2Kp6wlcQz/Orq3picElXW1vpMQL4kYQD4q2GcfA7Gz2Jy5rADVFb0k
         PASU+rQC67jgPX6m9Q2gDF3W1WuO7d8S58pPCbS2zTG+lzOguOqtBn7WnQjwxpQY0bsQ
         sIAw==
X-Gm-Message-State: AOJu0YxAaLtLR18SifmSB72hPBv3cYgyHZzU1oCvYDbusLtfkL09efQn
	0v4/+DCt0v118MNokj2KMTwAPbPvd7teuxK0COlAzm66wnD+lAC7QJplble3rQKI7Lg=
X-Gm-Gg: ASbGnctkXOpMGfJrzlDeYMVCrgKutWAGO3tt1dHSI3xMQBievSCMdNud7ZW03N2+9kA
	4tgbNbVSSu8k74lBVQZ0T9t/PXJFYnL0LLA3snTMPPlm5JPiu8QHbl704pgMumn/MuICHlgOJ9h
	9zxFQ5nAzIPOAu1qnYyp/nSlr4WJvQm9mqJdXYxPw98K/1j4tGZOfAB5ESnw4qpTX8qBspLXLZP
	rmBXr71pQazIjkITKBi/0ea6+A9PrVtbt8yfxQ1qcaezN8KXJPD687FTgK1Lp7xtzu2sIa0K2lQ
	D+/Fbt1cwxW7oRHgHop/jYoZwwlln3SOwSb6MSCjYYAUxUiOJkHg71sRHQ7SF2ccLeQUwO631D2
	dijhYgTVfWh1EsyBUuP2/y1n6UZMe0vsDgr+rVOa4ZX58IRs63MpXiHIYmgfhnSclsaP+ThV57t
	ehbUJt
X-Google-Smtp-Source: AGHT+IGbORayqse9+YrAMMVgnXa3AwRIDt/XmeZjb2ltfRyaoxalRB37e+J0bbQJ81s/iA48DjrHww==
X-Received: by 2002:a17:907:7f90:b0:afe:d0c9:8f50 with SMTP id a640c23a62f3a-b01d978e50amr22457966b.44.1756508627882;
        Fri, 29 Aug 2025 16:03:47 -0700 (PDT)
Received: from XPS.. ([2a02:908:1b0:afe0:8c8d:46f1:a88d:88d5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff08b86833sm215990266b.48.2025.08.29.16.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 16:03:47 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: liezhi.yang@windriver.com,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] strace: skip nanosleep test
Date: Sat, 30 Aug 2025 01:03:44 +0200
Message-ID: <20250829230344.347946-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 23:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222624

Add nanosleep to the skipped tests since it's load-sensitive

fixes:

failed ptests {'strace': ['nanosleep.gen.test', 'nanosleep.gen']}
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15524

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 .../strace/strace/skip-load.patch             | 39 +++++++++++++------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index 6b3a6cdde4..34948fd2ba 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,6 +1,6 @@
-From d0c5cb43f0d1760323a20abb62cb8cf3113d3fff Mon Sep 17 00:00:00 2001
+From 46eceefb3bd184354cdaf0fd3dff6f2ad979aad9 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 31 Jan 2022 17:40:13 +0000
+Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
 
 Skip tests which are known to be unreliable under load, typically because they
@@ -8,14 +8,16 @@ care about timing.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
 ---
  tests/clock_nanosleep.gen.test | 1 +
  tests/delay.test               | 1 +
+ tests/nanosleep.gen.test       | 1 +
  tests/strace-r.test            | 1 +
- 3 files changed, 3 insertions(+)
+ 4 files changed, 4 insertions(+)
 
 diff --git a/tests/clock_nanosleep.gen.test b/tests/clock_nanosleep.gen.test
-index 7a6025b..f0e6dbb 100755
+index 7a6025bbd..f0e6dbb73 100755
 --- a/tests/clock_nanosleep.gen.test
 +++ b/tests/clock_nanosleep.gen.test
 @@ -1,4 +1,5 @@
@@ -25,26 +27,39 @@ index 7a6025b..f0e6dbb 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -e trace=clock_nanosleep,clock_gettime
 diff --git a/tests/delay.test b/tests/delay.test
-index f74e27f..6172c04 100755
+index f74e27f1e..1510c7647 100755
 --- a/tests/delay.test
 +++ b/tests/delay.test
-@@ -8,6 +8,7 @@
- # SPDX-License-Identifier: GPL-2.0-or-later
+@@ -9,6 +9,7 @@
  
  . "${srcdir=.}/init.sh"
-+skip_ "Test not reliable under load"
  
++skip_ "Test not reliable under load"
  while read -r denter dexit denter_us dexit_us; do
  	[ -n "$denter" ] || continue
+ 
+diff --git a/tests/nanosleep.gen.test b/tests/nanosleep.gen.test
+index 41928ded8..f8a87cb8e 100755
+--- a/tests/nanosleep.gen.test
++++ b/tests/nanosleep.gen.test
+@@ -1,4 +1,5 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (nanosleep -a20 ); do not edit.
+ . "${srcdir=.}/init.sh"
++skip_ "Test not reliable under load"
+ run_strace_match_diff -a20 
 diff --git a/tests/strace-r.test b/tests/strace-r.test
-index 8299737..d89c7df 100755
+index 829973753..e89423485 100755
 --- a/tests/strace-r.test
 +++ b/tests/strace-r.test
-@@ -8,6 +8,7 @@
- # SPDX-License-Identifier: GPL-2.0-or-later
+@@ -9,6 +9,7 @@
  
  . "${srcdir=.}/init.sh"
-+skip_ "Test not reliable under load"
  
++skip_ "Test not reliable under load"
  r_opt="${1:--r}"
  
+ run_prog ../sleep 0
+-- 
+2.43.0
+
-- 
2.43.0


