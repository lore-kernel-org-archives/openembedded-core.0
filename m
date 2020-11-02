Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.1204.1604335829898965895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dcQcj/3i;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id p5so19843829ejj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jDeKDhHxguO2VzJQuTzEu9f6P8SKJmC8OY4n2wRBtqM=;
        b=dcQcj/3iTb1V0qphlzhq4xium2ZcUyCvhXse0e/rfeLecXCTBxt1l/WMnL3FlSKM32
         4e/3+roWAjLHEX11I2Q43D4tqY6ngBkQgiNIPtuavU9bDSQpMtxtHpOT8lmqOnJkHcu4
         mLvqOA7ziCPRFuEMWdS7pljVPLVvpWlhxOnKTMxQ8X6ISWG0WXckrHr49/7uEN9DJ3Vj
         Y9AZ2IrdCc1r+BJZWC4XONLUyIHUcIiQ20qILMM0vHUgo+w1RvFn4q5+POokBtcq8ln/
         qB/iz6SSaQVVwm+dlLYl0Ns+hcaN8SLvoUdiayOPX2i7Mi0NezouQW3R2WNQBlG4ko+T
         GrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jDeKDhHxguO2VzJQuTzEu9f6P8SKJmC8OY4n2wRBtqM=;
        b=AeoWGBBUjEdwlYR8h3JDTWghh2mZGxxVaLbhqLpev1eNKcR33LP/pwcvu6nKTUIwVK
         ODW6VHmsq6Jta80Qcn7PBHEFKKSKjkqNMl3hJdB1Q0HkdWW27T0212ccn3TpQMjPqMbI
         rtyaGS0J4Nkxdc6hF7FTbjJwEgVbG3GOzxCTBiu86PFIdwAvrzCrvkWweu6l31NSFUCQ
         5F45OZRqAc9gYZNqDH2SXgtzQIDU+wXERDg+4fuffm3xHnshY/k/fazWJNBsBNykY9DC
         6DwGva/mwN7pA/M1L9sOfBBMdM8WB3mIp5uJXlzr10AGRFwaIRXnxhhKR/qC/9zUe6hW
         nhlg==
X-Gm-Message-State: AOAM533ItOriGqQOtTNYOLf7jTPDEelILen48kylOkPU/mCekyoOI6I5
	q50CdvdO/ArJLqnDqCYS7TFeHVOv4BRIYQ==
X-Google-Smtp-Source: ABdhPJyDi6WdY4bHy8VcG/YDniOrFOgUtkjh29PbHk7Fz7kvDiGMiYUFpHlOF4FgNTFLFXW0wSahpQ==
X-Received: by 2002:a17:906:a891:: with SMTP id ha17mr1508686ejb.116.1604335828046;
        Mon, 02 Nov 2020 08:50:28 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:27 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 80/80] numactl: upgrade 2.0.13 -> 2.0.14
Date: Mon,  2 Nov 2020 17:49:07 +0100
Message-Id: <20201102164907.27572-80-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...1-numademo-fix-error-on-32bit-system.patch | 100 ------------------
 meta/recipes-support/numactl/numactl_git.bb   |  15 ++-
 2 files changed, 7 insertions(+), 108 deletions(-)
 delete mode 100644 meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch

diff --git a/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch b/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
deleted file mode 100644
index 506101711a..0000000000
--- a/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 68485f8516884377e54c623b0deff73f97321d96 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Thu, 19 Sep 2019 04:32:31 -0400
-Subject: [PATCH] numademo: fix error on 32bit system
-
-Error Info on 32bit:
-root@intel-x86:~# numademo -t -e 1M
-Configured Nodes does not match available memory nodes
-
-That's because sizeof(long)=4Word, but sizeof(long long)=8Word
-on 32bit. So (long long) assigning to (long) maybe cause overflow.
-
-long numa_node_size(int node, long *freep)
-{
-    ...
-    long sz = numa_node_size64_int(node, &f2);
-    ~^^~
-    return sz;
-    ...
-}
-long long numa_node_size64(int node, long long *freep)
-~^^   ^^~
-{
-    ...
-}
-
-Unify the return type of above functions.
-
-Upstream-Status: Accepted [next version is after 2.0.13 or 2.0.14]
-[https://github.com/numactl/numactl/commit/a7c4bc790a191d3e42b63850b409c1a72b75a4e1]
-                 Submitted [https://github.com/numactl/numactl/pull/79]
-[The first patch was merged but has a error, then the second fix it.]
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- libnuma.c         | 4 ++--
- numa.h            | 2 +-
- numademo.c        | 2 +-
- test/move_pages.c | 2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/libnuma.c b/libnuma.c
-index cac8851..8b5c6aa 100644
---- a/libnuma.c
-+++ b/libnuma.c
-@@ -791,10 +791,10 @@ long long numa_node_size64(int node, long long *freep)
- 
- make_internal_alias(numa_node_size64);
- 
--long numa_node_size(int node, long *freep)
-+long long numa_node_size(int node, long long *freep)
- {
- 	long long f2;
--	long sz = numa_node_size64_int(node, &f2);
-+	long long sz = numa_node_size64_int(node, &f2);
- 	if (freep)
- 		*freep = f2;
- 	return sz;
-diff --git a/numa.h b/numa.h
-index 3a8c543..268fb1d 100644
---- a/numa.h
-+++ b/numa.h
-@@ -143,7 +143,7 @@ int numa_preferred(void);
- 
- /* Return node size and free memory */
- long long numa_node_size64(int node, long long *freep);
--long numa_node_size(int node, long *freep);
-+long long numa_node_size(int node, long long *freep);
- 
- int numa_pagesize(void);
- 
-diff --git a/numademo.c b/numademo.c
-index a720db0..8c56da8 100644
---- a/numademo.c
-+++ b/numademo.c
-@@ -301,7 +301,7 @@ int max_node, numnodes;
- int get_node_list(void)
- {
-         int a, got_nodes = 0;
--        long free_node_sizes;
-+        long long free_node_sizes;
- 
-         numnodes = numa_num_configured_nodes();
-         node_to_use = (int *)malloc(numnodes * sizeof(int));
-diff --git a/test/move_pages.c b/test/move_pages.c
-index d1d8436..f8ff25d 100644
---- a/test/move_pages.c
-+++ b/test/move_pages.c
-@@ -26,7 +26,7 @@ int *node_to_use;
- int get_node_list()
- {
-         int a, got_nodes = 0, max_node, numnodes;
--        long free_node_sizes;
-+        long long free_node_sizes;
- 
-         numnodes = numa_num_configured_nodes();
-         node_to_use = (int *)malloc(numnodes * sizeof(int));
--- 
-2.23.0
-
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index e45afe9ee8..5640173aa9 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,16 +10,15 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
 
-SRCREV = "5d9f16722e3df49dc618a9f361bd482559695db7"
-PV = "2.0.13+git${SRCPV}"
+SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
+PV = "2.0.14"
 
 SRC_URI = "git://github.com/numactl/numactl \
-    file://Fix-the-test-output-format.patch \
-    file://Makefile \
-    file://run-ptest \
-    file://0001-define-run-test-target.patch \
-    file://0001-numademo-fix-error-on-32bit-system.patch \
-"
+           file://Fix-the-test-output-format.patch \
+           file://Makefile \
+           file://run-ptest \
+           file://0001-define-run-test-target.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.29.0

