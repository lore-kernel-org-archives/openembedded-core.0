Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.186.1630174399633444910
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ISCNSark;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.41, mailfrom: steve@sakoman.com)
Received: by mail-io1-f41.google.com with SMTP id b10so13540005ioq.9
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kv0xkgPejjSVPHMG0bs8ypcqBYTxUu1eA/lom6JobFM=;
        b=ISCNSarkjGWf0A52fHDfg/+DUPj7x7lpRh3aIO8MiuM1FuGPKp31KfVIx2qQMzBlGo
         n+yAEf97PNibA3pK8AZeCKusmKaegOUQ4GuxPM98BprCtChvzXNKA5IF+OGkxfU1m3as
         iJdnoQclU8vddOop1q7AnPlrFa4x48zhKLfcCzSaiCVmWRcEptsPGd4TFuuakjwXcU9s
         JYbYci38yWMFqMOqfPSfPT6pdCMVEQzfrLQgKxvDYEMUGJbBPgDFvhGlc3hMDpHS/8Z1
         vle2gsIOPNUwv/dZMDLt56b7yk+fzgN92quM6wW4VqvoDQ3ujYv2QpJdY/Z9AemQfJAk
         EAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kv0xkgPejjSVPHMG0bs8ypcqBYTxUu1eA/lom6JobFM=;
        b=TLNQt2fga0WQLZz3WpOeBmYK6FfUeNGqBPeIDpp+YRl1lxIIcuT1Xazd/CKuDomGj6
         GBD1CjTcN6W0ATjridsR/l0OX1MgFkyQB92rAlk2e7IcAYYJFzFC4VsIm7CHCyCMyvTc
         xBgPJn5JQ2VyZzFAABSdaAY9owVBgvY2Hb4ONP08XBUpc4scK912fsrwVlGdvFkHtpMM
         wgYqsSlVmaEy12OdI1VgOUJh2QwIb0sXxnRCw6g8VACXndx4ZK4lAFZH18MNH4IPhRZN
         fYhq7UNwNwoc0a2Fn4NEqfqT2/XgZsv/29ZS7Q4WFhoVvS8RpReBQ3pdgk1kmWF+OR75
         SgIQ==
X-Gm-Message-State: AOAM530LRLS/P5AtGpCM2F2hr2xD52WMfE9KhtzBnHjoBm8fwnyrtfq4
	U4PiCJOIzr9sy/OVTqa9jrccocZkesclzvzn
X-Google-Smtp-Source: ABdhPJx+vOYwOPLZ/GSypbvtS+VMlpCkiHsFDDMS6LlBilTxDEm4IOaDNpFPzZ7ojOY3KCITuep3Og==
X-Received: by 2002:a02:ab87:: with SMTP id t7mr13346864jan.127.1630174396801;
        Sat, 28 Aug 2021 11:13:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/36] qemu: Security fixes CVE-2021-3545/6
Date: Sat, 28 Aug 2021 08:11:05 -1000
Message-Id: <e066967a306292cd0ce5ef2cd5aa0ee80fde1041.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

