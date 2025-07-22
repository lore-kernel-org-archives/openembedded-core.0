Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0349C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 20:09:55 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.23104.1753214990056345981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 13:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iTTtvQoz;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2353a2bc210so53384935ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753214989; x=1753819789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHDwF7upddhwP36oj7GerijVVnht5NeFMjuh9DOhjY4=;
        b=iTTtvQozXHnQgZIT5OLBUQwRvOKQRlORi+MFUyqCvzMVS7rurXrqfhd/d5+SCFPj0q
         2PfzhN5cQDQrzGsMjbBsTPDZ4FNp6UQhjzXPC0QuNPsmM2HPgMEE2fWkUCW3Ei3poHxv
         PKtWtn5E6i5bEcScGa/dWCgnRxj8kdEBsvbjfE599S9tFZtyPhyMFK6yvqoeY3HwyZvg
         /qTJDp4W13bMJ60CWDgGCgUEoaAsgqR+NQLvRJ5Z05EcBOy1aI4g1hvjFGF8h2jF51DB
         lKjBhnQTqpaeHyKzQs8KQF6lCfXISBSeXQTI7k6kJG2xiOdwQmur0MeJifTGjjldqpeO
         rHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753214989; x=1753819789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHDwF7upddhwP36oj7GerijVVnht5NeFMjuh9DOhjY4=;
        b=UaE/jlztT/KW9fTBVeEz3pD8OwbfOziZo1wydoP1X0vDcqBx9ApHbVOwYoULykHRO3
         23MercF50VgN6+HXr5FhcTWTDg0jbEPK+7nX/8xvXmshfjaamMyhmUXIWumwu43Rbjiw
         JM5vSwc8aIjnR/NBLMLQYZilHxUAJ8prnLeUIUB+hx2+LBKN3Ha29CQ+E3OjRP93fAXD
         wYnXcFE3QUaeCvMSuADV9SZLnTcgSwyarPAwB+xR1og6wNM493zr9Y8I7ew1qhINHbvB
         BaNWlkZxAOa4XuChYGq+ue02oNVXPIImBRF4cA3nLEwElOxor8x8u9r29cYGqyla/LOF
         gFrw==
X-Gm-Message-State: AOJu0YxeHmQ7P1ywBj9VkMO0wVFY1j+k5Gv1PX9EA24FP9SRnwX8kvcw
	sQke/7VLvlpvImOAIeqlkQGcH3Ok6l6mmAjFdk5k3p+3G0b8N2pz0wWRgjZkJMO7j9U=
X-Gm-Gg: ASbGncsY77S7k/G1dvtWWpTBexbi3iAyZgFGg5DObEMOQaaHCvLm7kg8LWKoOUE3yEx
	PCNuAmiW+1arBfQ4mUqS/W/qDE2BuFNULJkE9IRyY9P4ciz1zw4SOsZbf1jqjNn/ktNVPDVNSIa
	dKwBpu9OOuqcIzpX980nFG4u4/HfeFHvFCdPutG5afcPRtJfq9f9mbEKfnV6JrB0eX7+JP4kwSC
	dPYpikVWymjGQagPCAomwFo9ie3buJVaInEPUzNT5OEKQJ6w0O/ZYqXZNzg65ezn8DdUgTaJXpV
	JizyThUbRmCMMbj7S7pm7rjd2V2OvedEoDIRTVUSIU6LRHncp5z/lwRQfzmC8AMsWMuuPdEZUjj
	ICfegL9T0f8VG7Q==
X-Google-Smtp-Source: AGHT+IGhzusCdSfZQYKltFTM143b9R12ulsFPozW6XD2bRI/CO4AfByXftnfO9sjCtmxvAZglhQFZQ==
X-Received: by 2002:a17:903:198b:b0:23d:e2fc:6fe5 with SMTP id d9443c01a7336-23f9823e652mr4634425ad.49.1753214989101;
        Tue, 22 Jul 2025 13:09:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60ecbdsm82453465ad.82.2025.07.22.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 13:09:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Fix fma steering segfault due to on aarch64
Date: Tue, 22 Jul 2025 13:09:46 -0700
Message-ID: <20250722200946.988439-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 20:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220757

Seen with opengl-es-cts compilation for qemuarm64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-15.1.inc        |  1 +
 ...-steering-when-rename-fails-PR120119.patch | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools/gcc/gcc-15.1.inc
index 28fcf9376c7..7d86cda601d 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -72,6 +72,7 @@ SRC_URI = "${BASEURI} \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0026-arm-fully-validate-mem_noofs_operand-PR120351.patch \
            file://0026-fix-incorrect-preprocessor-line-numbers.patch \
+           file://0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch b/meta/recipes-devtools/gcc/gcc/0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch
new file mode 100644
index 00000000000..a59cb455240
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch
@@ -0,0 +1,69 @@
+From b28d5f51e1ec75f6878593ef084e9cfb836b9db4 Mon Sep 17 00:00:00 2001
+From: Andrew Pinski <quic_apinski@quicinc.com>
+Date: Tue, 22 Jul 2025 10:32:42 -0700
+Subject: [PATCH] aarch64: Fix fma steering when rename fails [PR120119]
+
+Regrename can fail in some case and `insn_rr[INSN_UID (insn)].op_info`
+will be null. The FMA steering code was not expecting the failure to happen.
+This started to happen after early RA was added but it has been a latent bug
+before that.
+
+Build and tested for aarch64-linux-gnu.
+
+	PR target/120119
+
+gcc/ChangeLog:
+
+	* config/aarch64/cortex-a57-fma-steering.cc (func_fma_steering::analyze):
+	Skip if renaming fails.
+
+gcc/testsuite/ChangeLog:
+
+	* g++.dg/torture/pr120119-1.C: New test.
+
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2025-July/690239.html]
+Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/cortex-a57-fma-steering.cc |  5 +++++
+ gcc/testsuite/g++.dg/torture/pr120119-1.C     | 15 +++++++++++++++
+ 2 files changed, 20 insertions(+)
+ create mode 100644 gcc/testsuite/g++.dg/torture/pr120119-1.C
+
+diff --git a/gcc/config/aarch64/cortex-a57-fma-steering.cc b/gcc/config/aarch64/cortex-a57-fma-steering.cc
+index fd6da66d855..f7675bed13d 100644
+--- a/gcc/config/aarch64/cortex-a57-fma-steering.cc
++++ b/gcc/config/aarch64/cortex-a57-fma-steering.cc
+@@ -948,6 +948,11 @@ func_fma_steering::analyze ()
+ 
+ 	  /* Search the chain where this instruction is (one of) the root.  */
+ 	  dest_op_info = insn_rr[INSN_UID (insn)].op_info;
++
++	  /* Register rename could fail. */
++	  if (!dest_op_info)
++	    continue;
++
+ 	  dest_regno = REGNO (SET_DEST (PATTERN (insn)));
+ 	  for (i = 0; i < dest_op_info->n_chains; i++)
+ 	    {
+diff --git a/gcc/testsuite/g++.dg/torture/pr120119-1.C b/gcc/testsuite/g++.dg/torture/pr120119-1.C
+new file mode 100644
+index 00000000000..1206feb310b
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/torture/pr120119-1.C
+@@ -0,0 +1,15 @@
++// { dg-do compile }
++// { dg-additional-options "-mcpu=cortex-a57" { target aarch64*-*-* } }
++
++// PR target/120119
++
++struct a {
++  float operator()(int b, int c) { return d[c * 4 + b]; }
++  float *d;
++};
++float e(float *);
++auto f(a b) {
++  float g[]{b(1, 1), b(2, 1), b(3, 1), b(1, 2), b(2, 2), b(3, 2), b(1, 3),
++            b(2, 3), b(3, 3), b(3, 2), b(1, 3), b(2, 3), b(3, 3)};
++  return b.d[0] * e(g);
++}

