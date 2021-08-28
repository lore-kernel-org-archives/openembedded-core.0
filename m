Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web12.170.1630174393048077592
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qYrrPS5w;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.42, mailfrom: steve@sakoman.com)
Received: by mail-io1-f42.google.com with SMTP id g9so13525448ioq.11
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T9Is9YsRTvde17jfAXQfcrV5BROANg30qAAApCG+E6U=;
        b=qYrrPS5wNmVDx1jKJ7crsepRGKTi0xJ2X+w0u0TsqmtxxZdKSKM+ktQnkAUSj1hhJ9
         ghG4395aCwsU1lv7MlOaALQyCCrEOOD5So8uooOiXQrPrIhdsy6rOu+iBtnWebodkIsO
         htiZGCT57FVNWyr0VP6WEzWcmxn5h2gsFBFYdMNQMmsrsOKTYQ7pKfWtio5ILesOnXA7
         wSz2K0rcBzuG7AayfcVdu25tJTDOEuIJjsYfIVU0jJCabNsnjSXVj6M5ITDE0U7ATDK6
         J6ZztTFpkbeRJdmY3YK+x4O6VepmyOco4DBwHG2lFHQME4w5/Kotd+BaUwKEgAEINzAL
         tGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T9Is9YsRTvde17jfAXQfcrV5BROANg30qAAApCG+E6U=;
        b=kaIQrRNTHEU7TvQfu+P2h+7l67gDmWC6COUXJ3gJeuoWv3AE3p9EcZ3beMxO8g/Wgn
         HL/Y0APuLMnuYqPPNVJENsdS654kVGLhugmGbhJATscmmQobToJ+A5EmD/AIn7mB65pI
         sxjqsbrjf0I1JtsXrRKtwiJ3FBMdxQRj66D3uQsy+XXto7IBGCNgmR5FP8nbGnX55O6z
         4u3Sx2ROm8kqQtJjY/fykZ8eZhHIgCmx+qzvcPDdYTX1YJ+R31soMehiaFvs+hMNu5Ne
         ZlzL5SRN3W5H2vGV0gUgRqnD8EY5O6gqxMcKKy52fxNbotnheXDLnlZObxXJPHUZPfoU
         oMuQ==
X-Gm-Message-State: AOAM5312K+o2zoZ+Tg9LEX4Syav4eItff7bzdXI7/4g1EyJxaFn3Iqar
	vj+ULEt+AxtcnzC9l5L57klgzCEaxCmaCCCZ
X-Google-Smtp-Source: ABdhPJzC3DDz0FAhlsWvVivnwP9Aggxzun+CkwKhdEAUKVEyz6ROT4odHWb7kgJlZ3ivnWn/0GYKBQ==
X-Received: by 2002:a05:6638:f87:: with SMTP id h7mr13134997jal.77.1630174391608;
        Sat, 28 Aug 2021 11:13:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/36] qemu: Security fix CVE-2021-3544
Date: Sat, 28 Aug 2021 08:11:04 -1000
Message-Id: <eca0abf120709fab20da1a2c190d04191733f5ed.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 111833
Type: Security Fix
Disposition: Backport from https://gitlab.com/qemu-project/qemu/-/commit/86dd8fac..63736af5
ChangeID: 7f301e939cf9d1fdb826ac47d1fc96430086a68e
Description:

https://gitlab.com/qemu-project/qemu/-/commit/86dd8fac
https://gitlab.com/qemu-project/qemu/-/commit/b9f79858
https://gitlab.com/qemu-project/qemu/-/commit/b7afebcf
Tweeked the above patches as vhost-user-gpu.c does not exist.

https://gitlab.com/qemu-project/qemu/-/commit/f6091d86
https://gitlab.com/qemu-project/qemu/-/commit/63736af5

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  5 ++
 .../qemu/qemu/CVE-2021-3544.patch             | 29 ++++++++++++
 .../qemu/qemu/CVE-2021-3544_2.patch           | 39 +++++++++++++++
 .../qemu/qemu/CVE-2021-3544_3.patch           | 39 +++++++++++++++
 .../qemu/qemu/CVE-2021-3544_4.patch           | 46 ++++++++++++++++++
 .../qemu/qemu/CVE-2021-3544_5.patch           | 47 +++++++++++++++++++
 6 files changed, 205 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1ddb373115..90549136e5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -72,6 +72,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3416_9.patch \
            file://CVE-2021-3416_10.patch \
            file://CVE-2021-20257.patch \
+           file://CVE-2021-3544.patch \
+           file://CVE-2021-3544_2.patch \
+           file://CVE-2021-3544_3.patch \
+           file://CVE-2021-3544_4.patch \
+           file://CVE-2021-3544_5.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544.patch
new file mode 100644
index 0000000000..1b4fcbfb60
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544.patch
@@ -0,0 +1,29 @@
+vhost-user-gpu: fix resource leak in 'vg_resource_create_2d' (CVE-2021-3544)
+
+Call 'vugbm_buffer_destroy' in error path to avoid resource leak.
+
+Fixes: CVE-2021-3544
+Reported-by: default avatarLi Qiang <liq3ea@163.com>
+Reviewed-by: default avatarPrasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: default avatarLi Qiang <liq3ea@163.com>
+Reviewed-by: Marc-André Lureau's avatarMarc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-3-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann's avatarGerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+[vhost-user-gpu does not exist in 4.2.0]
+CVE: CVE-2021-3544
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: qemu-4.2.0/contrib/vhost-user-gpu/main.c
+===================================================================
+--- qemu-4.2.0.orig/contrib/vhost-user-gpu/main.c
++++ qemu-4.2.0/contrib/vhost-user-gpu/main.c
+@@ -328,6 +328,7 @@ vg_resource_create_2d(VuGpu *g,
+         g_critical("%s: resource creation failed %d %d %d",
+                    __func__, c2d.resource_id, c2d.width, c2d.height);
+         g_free(res);
++        vugbm_buffer_destroy(&res->buffer);
+         cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
+         return;
+     }
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch
new file mode 100644
index 0000000000..36cbb127f8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch
@@ -0,0 +1,39 @@
+vhost-user-gpu: fix memory leak in vg_resource_attach_backing (CVE-2021-3544)
+
+
+Check whether the 'res' has already been attach_backing to avoid
+memory leak.
+
+Fixes: CVE-2021-3544
+Reported-by: default avatarLi Qiang <liq3ea@163.com>
+virtio-gpu fix: 204f01b3
+
+ ("virtio-gpu: fix memory leak
+ in resource attach backing")
+ Signed-off-by: default avatarLi Qiang <liq3ea@163.com>
+ Reviewed-by: Marc-André Lureau's avatarMarc-André Lureau <marcandre.lureau@redhat.com>
+ Message-Id: <20210516030403.107723-4-liq3ea@163.com>
+ Signed-off-by: Gerd Hoffmann's avatarGerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+[vhost-user-gpu does not exist in 4.2.0 context]
+CVE: CVE-2021-3544
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+
+Index: qemu-4.2.0/contrib/vhost-user-gpu/main.c
+===================================================================
+--- qemu-4.2.0.orig/contrib/vhost-user-gpu/main.c
++++ qemu-4.2.0/contrib/vhost-user-gpu/main.c
+@@ -468,6 +468,11 @@ vg_resource_attach_backing(VuGpu *g,
+         return;
+     }
+ 
++    if (res->iov) {
++        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
++        return;
++    }
++
+     ret = vg_create_mapping_iov(g, &ab, cmd, &res->iov);
+     if (ret != 0) {
+         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch
new file mode 100644
index 0000000000..c534f4c24f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch
@@ -0,0 +1,39 @@
+vhost-user-gpu: fix memory leak while calling 'vg_resource_unref' (CVE-2021-3544)
+
+If the guest trigger following sequences, the attach_backing will be leaked:
+
+vg_resource_create_2d
+vg_resource_attach_backing
+vg_resource_unref
+
+This patch fix this by freeing 'res->iov' in vg_resource_destroy.
+
+Fixes: CVE-2021-3544
+Reported-by: default avatarLi Qiang <liq3ea@163.com>
+virtio-gpu fix: 5e8e3c4c
+
+("virtio-gpu: fix resource leak
+in virgl_cmd_resource_unref")
+Reviewed-by: default avatarPrasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: default avatarLi Qiang <liq3ea@163.com>
+Reviewed-by: Marc-André Lureau's avatarMarc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-5-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann's avatarGerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3544
+[vhost-user-gpu does not exist in the 4.2.0]
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: qemu-4.2.0/contrib/vhost-user-gpu/main.c
+===================================================================
+--- qemu-4.2.0.orig/contrib/vhost-user-gpu/main.c
++++ qemu-4.2.0/contrib/vhost-user-gpu/main.c
+@@ -379,6 +379,7 @@ vg_resource_destroy(VuGpu *g,
+     }
+ 
+     vugbm_buffer_destroy(&res->buffer);
++    g_free(res->iov);
+     pixman_image_unref(res->image);
+     QTAILQ_REMOVE(&g->reslist, res, next);
+     g_free(res);
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch
new file mode 100644
index 0000000000..96e36eb854
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch
@@ -0,0 +1,46 @@
+vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref' (CVE-2021-3544)
+
+The 'res->iov' will be leaked if the guest trigger following sequences:
+
+virgl_cmd_create_resource_2d
+virgl_resource_attach_backing
+virgl_cmd_resource_unref
+
+This patch fixes this.
+
+Fixes: CVE-2021-3544
+Reported-by: default avatarLi Qiang <liq3ea@163.com>
+virtio-gpu fix: 5e8e3c4c
+
+("virtio-gpu: fix resource leak
+in virgl_cmd_resource_unref"
+Signed-off-by: default avatarLi Qiang <liq3ea@163.com>
+Reviewed-by: Marc-André Lureau's avatarMarc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-6-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann's avatarGerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3544
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: qemu-4.2.0/contrib/vhost-user-gpu/virgl.c
+===================================================================
+--- qemu-4.2.0.orig/contrib/vhost-user-gpu/virgl.c
++++ qemu-4.2.0/contrib/vhost-user-gpu/virgl.c
+@@ -105,9 +105,16 @@ virgl_cmd_resource_unref(VuGpu *g,
+                          struct virtio_gpu_ctrl_command *cmd)
+ {
+     struct virtio_gpu_resource_unref unref;
++    struct iovec *res_iovs = NULL;
++    int num_iovs = 0;
+ 
+     VUGPU_FILL_CMD(unref);
+ 
++    virgl_renderer_resource_detach_iov(unref.resource_id,
++            &res_iovs,
++            &num_iovs);
++    g_free(res_iovs);
++
+     virgl_renderer_resource_unref(unref.resource_id);
+ }
+ 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch
new file mode 100644
index 0000000000..e592ce50e2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch
@@ -0,0 +1,47 @@
+From 63736af5a6571d9def93769431e0d7e38c6677bf Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:04:01 -0700
+Subject: [PATCH] vhost-user-gpu: fix memory leak in
+ 'virgl_resource_attach_backing' (CVE-2021-3544)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If 'virgl_renderer_resource_attach_iov' failed, the 'res_iovs' will
+be leaked.
+
+Fixes: CVE-2021-3544
+Reported-by: Li Qiang <liq3ea@163.com>
+virtio-gpu fix: 33243031da ("virtio-gpu-3d: fix memory leak
+in resource attach backing")
+
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-7-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3544
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ contrib/vhost-user-gpu/virgl.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+Index: qemu-4.2.0/contrib/vhost-user-gpu/virgl.c
+===================================================================
+--- qemu-4.2.0.orig/contrib/vhost-user-gpu/virgl.c
++++ qemu-4.2.0/contrib/vhost-user-gpu/virgl.c
+@@ -283,8 +283,11 @@ virgl_resource_attach_backing(VuGpu *g,
+         return;
+     }
+ 
+-    virgl_renderer_resource_attach_iov(att_rb.resource_id,
++    ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
+                                        res_iovs, att_rb.nr_entries);
++    if (ret != 0) {
++        g_free(res_iovs);
++    }
+ }
+ 
+ static void
-- 
2.25.1

