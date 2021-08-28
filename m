Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web08.195.1630174415186129014
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=co06Cem9;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.180, mailfrom: steve@sakoman.com)
Received: by mail-il1-f180.google.com with SMTP id r6so10843146ilt.13
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OxX6VSd3KLo/o1TkGygxejijCqDPOxV71HwXFOJzhFc=;
        b=co06Cem9UfZz2qLwM5/XH3sVSij1sZzxzO8fUffp5N5rjpv+jbgStRdxnQ4euhl6aH
         EsnEbMz5+ZjEMmHh+UOuWH9y9z0civ2ygPwU2+9ZC6ByogomwOjTE4TtSnbEb84RGx75
         4FBo3XPn3Zzhj7WFBKbogikvQALmIDGO5hh5hKlJQWpQJ9IIo/S0PHfMbAKqOYO73OcD
         AoPmowcHcOHoOegUo4kUQKfs8oSrqf0rTlmDB/UlPdFHpKO96q1U2MCgzWd2z7Iq9Jtq
         qesK+3v0RIjyEWevdRRz19ewqfbyRD4x7c9bTY8zkYMFp3DWvU+PTbknHxgcy48BVJtu
         fiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OxX6VSd3KLo/o1TkGygxejijCqDPOxV71HwXFOJzhFc=;
        b=kBhdHeHzuq6U8r1bD1Sn7IMzESvjkDGiKruO8sqXOJ6usPgoa8Bef6AYiIo6N7nhHh
         AAyvtgaB/b+NCZLyM/V/ZtvXW5qcp8UH7N0sUkg+4nyly/dSQ0vhXXrTxMnZdc0Dsr1b
         44chE2gT+vDQJrRUw9fRdpNv83euaeO5ol5MOL1KAdWNOOpFTrmERmoI8l+7yr4OxXzT
         sINbhCLRl3RIMbvgnjigc5e1/j1oYtslcIew38Rqkz386+BBTBWFPaH5gSWqp9NSWYur
         pfEQkZW2umToEenXl3urjX1aLTeswNOopq/xRBq5rmaZ/k/7w4GyGbwILhUMsyWOPy7Q
         Iy2g==
X-Gm-Message-State: AOAM533KcTRH3TQejEAED1ioNXwDvjp8G2pG0MyAAebxS8gZg9i3PQVA
	JzV+JB2yKxi+Wvfo/wSF1efR2HzANKQuuwbU
X-Google-Smtp-Source: ABdhPJwGB6wcag8RWmRU1AtjQxYoPW7KvdTg055p5JPt/rD0Pf3FgKYfJjRdw0eW6CCxPmkmmf1Psw==
X-Received: by 2002:a05:6e02:1bed:: with SMTP id y13mr11116709ilv.276.1630174413424;
        Sat, 28 Aug 2021 11:13:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/36] qemu: fix CVE-2021-3607
Date: Sat, 28 Aug 2021 08:11:08 -1000
Message-Id: <cc541da4d67a9afa86a6ac37d5470d4dc77ea922.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: http://git.yoctoproject.org/cgit/poky.git
MR: 112749
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=460485d774480cd89cadf3b068f5197f44d86f25
ChangeID: 4e40dee2e6ce0b5b4de971f2c2b336929e7f22c3
Description:

(From OE-Core rev: 764bca67650da9df439527796879dda767c8c008)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 460485d774480cd89cadf3b068f5197f44d86f25)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3607.patch             | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 854a907216..6066418a7b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -82,6 +82,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3527-1.patch \
            file://CVE-2021-3527-2.patch \
            file://CVE-2021-3582.patch \
+           file://CVE-2021-3607.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch
new file mode 100644
index 0000000000..0547c74484
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch
@@ -0,0 +1,43 @@
+From 32e5703cfea07c91e6e84bcb0313f633bb146534 Mon Sep 17 00:00:00 2001
+From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+Date: Wed, 30 Jun 2021 14:46:34 +0300
+Subject: [PATCH] pvrdma: Ensure correct input on ring init (CVE-2021-3607)
+
+Check the guest passed a non zero page count
+for pvrdma device ring buffers.
+
+Fixes: CVE-2021-3607
+Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
+Message-Id: <20210630114634.2168872-1-marcel@redhat.com>
+Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+
+CVE: CVE-2021-3607
+Upstream-Status: Backport [32e5703cfea07c91e6e84bcb0313f633bb146534]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/rdma/vmw/pvrdma_main.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
+index 84ae8024fc..7c0c3551a8 100644
+--- a/hw/rdma/vmw/pvrdma_main.c
++++ b/hw/rdma/vmw/pvrdma_main.c
+@@ -92,6 +92,11 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
+     uint64_t *dir, *tbl;
+     int rc = 0;
+ 
++    if (!num_pages) {
++        rdma_error_report("Ring pages count must be strictly positive");
++        return -EINVAL;
++    }
++
+     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
+     if (!dir) {
+         rdma_error_report("Failed to map to page directory (ring %s)", name);
+-- 
+2.25.1
+
-- 
2.25.1

