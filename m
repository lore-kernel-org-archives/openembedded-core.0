Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.2557.1629829115343987833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 11:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EvO0Tgc/;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id u15so12704489plg.13
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 11:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LlfO9ecdb6ImK+4At+vuEIglF4x59CNmK7zOwwxqltI=;
        b=EvO0Tgc/j8LFgCdQoio0J/wRyWzp+0LH7QCkINnPg+nBSu+degjcpGk+jCVHz0RJdB
         2LdcadWyQtFkndyciP+CcqUNc+CkKPL9zOZAqkK8xt5Aly16DR3FtDvdEo8DpJAT+NMy
         00DCoSmoZD0l6vrQBQpL6Gt8m3LTzoSBGcTrYBrCn/SEVtweIJFUFsp/RTt+2bbDW2wu
         8ZqcRrAsYKvMsA8lDlxpKvEEM8cvCECpivkxA5jRn+nsqWts6SfaOU9LmHkv5PW0/2YQ
         hAmfU3Up/n+D6KoIT3hvxKdWhuiaA8G43WvvuvVAacs8RwlhNP52ZpQrZdFvGgbYsRr9
         loNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LlfO9ecdb6ImK+4At+vuEIglF4x59CNmK7zOwwxqltI=;
        b=eHx7OP0bW5KD35JsR+BcyZVLm/hsvsDz48Zbvjo7jExoGD/TSsYAm6sI5Wo0xs8Dzp
         inoqvKGqPa8G1LonOlNYIOOPN5yV7pxF/2bgjn0PG4zZIA9LMz3ld2y41clNwasH9U8E
         acroWpmBnJ/Ion2FIewMWB+Bop5oXEdF9I0pTypUgy7J668koOTAo8/Yf8DUmaDcBf25
         4B4T6E6VQhWTpmTfkBK9xVI+VNRJWn+3ntWSdjuWSINyhtbdsi6LHNyqMXvgFQndkLbb
         U2aJ0RECm/ICuysSRtcS3mxPlLMhAyrfN0QsKFdY5wwYPwZ/FukVOeh7LAM6R2q3vb4K
         CspQ==
X-Gm-Message-State: AOAM531UMGYtn50IEakExEpfZcGVlkrEkl6u4o9iEGeadEKmXPj6aDnb
	0dqjinK8/11nQ5Vmso5IygkFEEorfr8=
X-Google-Smtp-Source: ABdhPJwAqmHcaohgu1ywsDrfsGKmIUxveWEHrIHkjJS8FXk8hzPl0KhWeJKoKrP79rVwToBioEdHvg==
X-Received: by 2002:a17:90a:9707:: with SMTP id x7mr5677723pjo.109.1629829114753;
        Tue, 24 Aug 2021 11:18:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:35b6:3d86:f2de:f7d2])
        by smtp.gmail.com with ESMTPSA id g26sm23416734pgb.45.2021.08.24.11.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:18:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 2/4] qemu: fix CVE-2021-3582
Date: Tue, 24 Aug 2021 11:18:29 -0700
Message-Id: <20210824181831.1045731-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824181831.1045731-1-akuster808@gmail.com>
References: <20210824181831.1045731-1-akuster808@gmail.com>
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

