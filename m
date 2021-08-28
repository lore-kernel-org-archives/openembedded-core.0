Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.191.1630174421110947982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=E/eaqAAS;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.50, mailfrom: steve@sakoman.com)
Received: by mail-io1-f50.google.com with SMTP id j18so13498301ioj.8
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n/2HMCUz1YQVQFHOCSyehIHABSmdWGSk+SYPTlO+8og=;
        b=E/eaqAAS26kC6L7tqS/lQsyMrlU9jePdc06FWTlv4V5AeGIgNmiiNvx+PIAvNtWm8T
         4HUrX2SRoEnlYhGxOeKDUxH88w9FvGuxbx33pp8DyC6DsGApD42zFf3E3AuPqnmuzVRP
         +xWPNSk4S7JufJ1BPRek57BzVS9lnuiOoPiZBdEe7WvBrsz+bQmD/zmoIEEUfZHgBYIe
         izSuzUpKop3N/7+CEB6maPfw3LD+yyWQOtD21isjKIUR0oQ4NPJtvtAFOkdD4vaAHfGM
         oZ19f0zQZjpsJhEvHEkv0bTwXr9ikQC9cfBtfd6xFFQAJJk/E/jss4Ctnig+2J4GdSnn
         DLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n/2HMCUz1YQVQFHOCSyehIHABSmdWGSk+SYPTlO+8og=;
        b=b47ajdHraVlew35bC7dt9fNZgRbTo2BM40Rg7Y+jvJO41B2eMymC4QNp1+MHUPbR08
         8Sq+7ll7Ex0DimNMjFZC2QFE1Hof3P6iq0Az81ZRBe76Y2T1hHNC3jEauJoClLgNO48Q
         V3v/BIPo32+PFGy9BkYIlSQnSkmhwVvAM8Y6SrwljDgnpJzQ1r8r/rS+0C2wUkb82vwk
         YHSIaj+Cig4Pmc2QRoi8UX3FKeRngb1Xc2Rq8g/iXrXhVU2WY0/LS1cwCr0WT1nvRWl5
         a/gD50DcDQxElZfEj71xsafrF2wYzYjZcN50o/G2Xfhmp6ZNq/3NO8K7Xm7jpOPyTQMs
         CH3Q==
X-Gm-Message-State: AOAM533wkvcSg8TTqtnHoW/IgaSibaG6T4zG9Js0D8y01xEDHd/H8oaP
	rff6xGXnW8ftCuGfFOX9dAllnVQZKi4yjKao
X-Google-Smtp-Source: ABdhPJxlTeyaRypywH3HFeUPRyVRq7kmRtOZriGimlQnZLoFlV6JAl4OFuZaihLp26Crw8gbwcdfxw==
X-Received: by 2002:a5d:83c4:: with SMTP id u4mr12468000ior.21.1630174419682;
        Sat, 28 Aug 2021 11:13:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/36] qemu: fix CVE-2021-3608
Date: Sat, 28 Aug 2021 08:11:09 -1000
Message-Id: <f8d34ef74dafcf14e07f9322254465d03490bd60.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: http://git.yoctoproject.org/cgit/poky.git
MR: 112749
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=f5e77d70e2eb35751f5bad5572b6eb8a3ab14422
ChangeID: 4496341da3af9126c9c67170e1a2cce929c29828
Description:

(From OE-Core rev: 5e05ee8ff363eac84edec568039b86bcd716c6ce)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5e77d70e2eb35751f5bad5572b6eb8a3ab14422)
[Refreshed patch]
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3608.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6066418a7b..c8c170dda0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -83,6 +83,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3527-2.patch \
            file://CVE-2021-3582.patch \
            file://CVE-2021-3607.patch \
+           file://CVE-2021-3608.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
new file mode 100644
index 0000000000..7055ec3d23
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
@@ -0,0 +1,40 @@
+From 66ae37d8cc313f89272e711174a846a229bcdbd3 Mon Sep 17 00:00:00 2001
+From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+Date: Wed, 30 Jun 2021 14:52:46 +0300
+Subject: [PATCH] pvrdma: Fix the ring init error flow (CVE-2021-3608)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Do not unmap uninitialized dma addresses.
+
+Fixes: CVE-2021-3608
+Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
+Message-Id: <20210630115246.2178219-1-marcel@redhat.com>
+Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+
+CVE: CVE-2021-3608
+Upstream-Status: Backport [66ae37d8cc313f89272e711174a846a229bcdbd3]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu-4.2.0/hw/rdma/vmw/pvrdma_dev_ring.c
+===================================================================
+--- qemu-4.2.0.orig/hw/rdma/vmw/pvrdma_dev_ring.c
++++ qemu-4.2.0/hw/rdma/vmw/pvrdma_dev_ring.c
+@@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, c
+     atomic_set(&ring->ring_state->cons_head, 0);
+     */
+     ring->npages = npages;
+-    ring->pages = g_malloc(npages * sizeof(void *));
++    ring->pages = g_malloc0(npages * sizeof(void *));
+ 
+     for (i = 0; i < npages; i++) {
+         if (!tbl[i]) {
-- 
2.25.1

