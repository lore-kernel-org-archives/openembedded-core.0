Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.35251.1629779266770286542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 21:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hfNRZWZu;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 17so18609335pgp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 21:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=If3UKV18fciUmuTaJNU21RhNPO2pHW8fcHgBAx7xYEE=;
        b=hfNRZWZuB6I2c8NpPPclAYBVq8ZsYa8C9x7y82zvyqyc8NVYTNV/VukRzvi1sq/cTc
         1Vs++lWscogTetVkYT39rtFjJIVu8OwIooVusBf+2dHstZChfvPlVtzaJy0todawaS4K
         Hd7AaN2YgEv1VbkKsi6xjfAwNWBPN2MCse1O2liY2KkMHOY9xneLi9T2du5YL+XkJEi3
         +biC0fVZ+LIf1xHORdbXiydDap6D2GZGNHUOpsv56dp0nRQ7TlQj/O3zjzztIQMt7b1p
         RFgcjvF1laetI+IUinszHZcCNf6w8n8XRvaZqP0oIMGQrKO2EULkxoC5y2AeotZ/+62n
         tZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=If3UKV18fciUmuTaJNU21RhNPO2pHW8fcHgBAx7xYEE=;
        b=WEhUY0uknwKJ1DXzW2sQlCcC5ZOpcncwla+QHJtq6SI7olq3zgOtZ3G88LTPw1iR4J
         8EiC3T/qGL7iaxm86Bhb/aci914/SY5EE/I2fjHPrTJRVoeqG7CCEO+bxEDfl0gvDo5C
         sTeXryzHpstYjf0Qb4uVO2Gs8+h9Ji90bPXOnW17saR/fc4w8x2wkqfM+oZo4l8uikP3
         asX3bpDG2D/uWfy3GPBo5JAKTZPN41ApmFvXUG1IKhkhpdYIANILu75+uP7cJt82xz14
         qIEaPRZm386FODu5ubPHFm1XwhprdOIUIQU4LqcZZAW15mFyAAjfMwRxN1A+rbQccatM
         ht0Q==
X-Gm-Message-State: AOAM531sn4wYYn+HXLgeCsUq+Txygyf16WSpj9b4bu29+Z4Ls1J1iqE4
	oHHmDOELgM3xlsZ89GiukL/OL6R3KHU=
X-Google-Smtp-Source: ABdhPJyfK4khfuwwFugyBw+J8sHs2XjIg7eL59c7McwWVddknHwDhCjWasx996BuN10aUbYh4nRzvQ==
X-Received: by 2002:a63:6646:: with SMTP id a67mr2577988pgc.144.1629779266168;
        Mon, 23 Aug 2021 21:27:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:c532:fdfb:1418:61fa])
        by smtp.gmail.com with ESMTPSA id a26sm904857pgm.87.2021.08.23.21.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 21:27:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 3/3] qemu: Security fixes CVE-2021-3545/6
Date: Mon, 23 Aug 2021 21:27:42 -0700
Message-Id: <20210824042742.833379-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824042742.833379-1-akuster808@gmail.com>
References: <20210824042742.833379-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 111845, 111839
Type: Security Fix
Disposition: Backport from https://gitlab.com/qemu-project/qemu/-/commit/9f22893a & 121841b2
ChangeID: 111b168e0fe4d2a722158c6bfdaceb06a8789e69
Description:

Fixes: CVE-2021-3545 and CVE-2021-3546

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2021-3545.patch             | 41 ++++++++++++++++
 .../qemu/qemu/CVE-2021-3546.patch             | 47 +++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3545.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3546.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 90549136e5..028b81ee34 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -77,6 +77,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3544_3.patch \
            file://CVE-2021-3544_4.patch \
            file://CVE-2021-3544_5.patch \
+           file://CVE-2021-3545.patch \
+           file://CVE-2021-3546.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3545.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3545.patch
new file mode 100644
index 0000000000..fcdda64437
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3545.patch
@@ -0,0 +1,41 @@
+From 121841b25d72d13f8cad554363138c360f1250ea Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:03:56 -0700
+Subject: [PATCH] vhost-user-gpu: fix memory disclosure in
+ virgl_cmd_get_capset_info (CVE-2021-3545)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise some of the 'resp' will be leaked to guest.
+
+Fixes: CVE-2021-3545
+Reported-by: Li Qiang <liq3ea@163.com>
+virtio-gpu fix: 42a8dadc74 ("virtio-gpu: fix information leak
+in getting capset info dispatch")
+
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-2-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3545
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ contrib/vhost-user-gpu/virgl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: qemu-4.2.0/contrib/vhost-user-gpu/virgl.c
+===================================================================
+--- qemu-4.2.0.orig/contrib/vhost-user-gpu/virgl.c
++++ qemu-4.2.0/contrib/vhost-user-gpu/virgl.c
+@@ -132,6 +132,7 @@ virgl_cmd_get_capset_info(VuGpu *g,
+ 
+     VUGPU_FILL_CMD(info);
+ 
++    memset(&resp, 0, sizeof(resp));
+     if (info.capset_index == 0) {
+         resp.capset_id = VIRTIO_GPU_CAPSET_VIRGL;
+         virgl_renderer_get_cap_set(resp.capset_id,
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3546.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3546.patch
new file mode 100644
index 0000000000..f8da428233
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3546.patch
@@ -0,0 +1,47 @@
+From 9f22893adcb02580aee5968f32baa2cd109b3ec2 Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:04:02 -0700
+Subject: [PATCH] vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
+ (CVE-2021-3546)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If 'virgl_cmd_get_capset' set 'max_size' to 0,
+the 'virgl_renderer_fill_caps' will write the data after the 'resp'.
+This patch avoid this by checking the returned 'max_size'.
+
+virtio-gpu fix: abd7f08b23 ("display: virtio-gpu-3d: check
+virgl capabilities max_size")
+
+Fixes: CVE-2021-3546
+Reported-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-8-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3546
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ contrib/vhost-user-gpu/virgl.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: qemu-4.2.0/contrib/vhost-user-gpu/virgl.c
+===================================================================
+--- qemu-4.2.0.orig/contrib/vhost-user-gpu/virgl.c
++++ qemu-4.2.0/contrib/vhost-user-gpu/virgl.c
+@@ -174,6 +174,10 @@ virgl_cmd_get_capset(VuGpu *g,
+ 
+     virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
+                                &max_size);
++    if (!max_size) {
++        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
++        return;
++    }
+     resp = g_malloc0(sizeof(*resp) + max_size);
+ 
+     resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;
-- 
2.25.1

