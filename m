Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web12.174.1630174409162246746
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=N7UYLcCK;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.43, mailfrom: steve@sakoman.com)
Received: by mail-io1-f43.google.com with SMTP id e186so13506395iof.12
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aPBdfmY0qvAq+TFajPZQem0E9IvGgepX0jnJ3S34tQ8=;
        b=N7UYLcCKEjroQxiECVngH3ckedgXo1LFi36Tbh4Z8BzIs/ewbRQNkLkxjHQRx+tvDg
         bMxSZsEJx5+5Q44CrPjDKarf8EhewAIFkMsjPc6YrMl/jS8kzoueWBXaxiG9gHpwadRX
         6As6NIZoWZpWFQrYiOgEKeEFAgaxpVit5ei8aN+iUJVh7fcG9EIlzU04lQ8FCTMq5q03
         W241jYGp43Bk/w1gMImzbazfIF1WtrYUn+kCH/1XLnv2waokWq+ASsHP4MllUpLtH+Bd
         eEYWqtG6Dhl3oOnrKWFCjkO3DKSrQn5W9cIhtStFPuetWoByvQLovEgd8//oiAN5Njzx
         oTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aPBdfmY0qvAq+TFajPZQem0E9IvGgepX0jnJ3S34tQ8=;
        b=XdxyqyErmQ5lI0HPtjjdK1XydBngTiXWElQ77ayH+QE/gZ48hF4b394KJfLlgrBRYd
         z0bw4CkUuz3d02xbbjeTn3w3U0VIoYs8gLtgmlZLRH74dRi0+wnXCFnKTrZhe3gNGA6k
         BEb1mGH31QTkpqW9mtDMmuF1EvF4Q9t1SPaTKTT57gVJnFexKggOm6PKQb8ySREHcUG6
         6AXttLbD6Y5VPtbml/tjR4bAno8WkIxTnQxak5TBX+Lv0ZN007sZOiTzsKln0RwkteNZ
         HbvlFt8RKFemO7e7E7UQj9MQoN+tjTyD0BJVx/cWo7zhZW/kX/1QLvhxkxvdElYhCmKg
         MVAw==
X-Gm-Message-State: AOAM530NMxgRk4pikufiNCDC1oUTxq6fx0xNoIATQwG0PamPJHOEEUj4
	YCbSVDTkD5Qbr3JNKtj+pCikViiS4RpmGXgP
X-Google-Smtp-Source: ABdhPJzwTyKboPJPcyD4nOsj4ihpESbfDhrrq4/1MNokhqb4OymqwzIrWHiM5Zf/O0FZqshcirS8+g==
X-Received: by 2002:a05:6638:35aa:: with SMTP id v42mr13604109jal.5.1630174407733;
        Sat, 28 Aug 2021 11:13:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/36] qemu: fix CVE-2021-3582
Date: Sat, 28 Aug 2021 08:11:07 -1000
Message-Id: <942d936524d3948d74c7240038ce81d859f68cab.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: http://git.yoctoproject.org/cgit/poky.git
MR: 112743
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=e11384737ed489ea02800d545432b9ded82bf1bb
ChangeID: a2ff7112354349e8cf8960f30499f61e545d7f8e
Description:

(From OE-Core rev: fb2634922db91e5b877dd10021dafec7b5c6e565)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e11384737ed489ea02800d545432b9ded82bf1bb)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3582.patch             | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 78e487fc6f..854a907216 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -81,6 +81,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3546.patch \
            file://CVE-2021-3527-1.patch \
            file://CVE-2021-3527-2.patch \
+           file://CVE-2021-3582.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch
new file mode 100644
index 0000000000..7a88e29384
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch
@@ -0,0 +1,47 @@
+From 284f191b4abad213aed04cb0458e1600fd18d7c4 Mon Sep 17 00:00:00 2001
+From: Marcel Apfelbaum <marcel@redhat.com>
+Date: Wed, 16 Jun 2021 14:06:00 +0300
+Subject: [PATCH] hw/rdma: Fix possible mremap overflow in the pvrdma device
+ (CVE-2021-3582)
+
+Ensure mremap boundaries not trusting the guest kernel to
+pass the correct buffer length.
+
+Fixes: CVE-2021-3582
+Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
+Message-Id: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
+Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+
+CVE: CVE-2021-3582
+Upstream-Status: Backport [284f191b4abad213aed04cb0458e1600fd18d7c4]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/rdma/vmw/pvrdma_cmd.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
+index f59879e257..da7ddfa548 100644
+--- a/hw/rdma/vmw/pvrdma_cmd.c
++++ b/hw/rdma/vmw/pvrdma_cmd.c
+@@ -38,6 +38,13 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev, uint64_t pdir_dma,
+         return NULL;
+     }
+ 
++    length = ROUND_UP(length, TARGET_PAGE_SIZE);
++    if (nchunks * TARGET_PAGE_SIZE != length) {
++        rdma_error_report("Invalid nchunks/length (%u, %lu)", nchunks,
++                          (unsigned long)length);
++        return NULL;
++    }
++
+     dir = rdma_pci_dma_map(pdev, pdir_dma, TARGET_PAGE_SIZE);
+     if (!dir) {
+         rdma_error_report("Failed to map to page directory");
+-- 
+2.25.1
+
-- 
2.25.1

