Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.35007.1629779265943634436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 21:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HngBNA7S;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id w6so11457028plg.9
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z0M2hQ70OBRc9KDlV+XvJuOsf7nlclLN8oJcleqchCA=;
        b=HngBNA7SI+YXwJJjB/6nl/BXYVLmnzGtukENvSDdzdIK3+8a5Iia5uObp9PxI8+2b4
         tFpW0cw6es27oSBrcuMZ/ffdmMC4DTRtqBZ3ysPOsyrrAjStc/if71/8CSN/XQ3SqCJc
         nOjXgHNRmwzvp4ytLNyF8xSUomZMyoAvNOKGz1FWycMXSVAtAnu05IHb1Ew+bqzG9QGr
         xxaYLdLE9oXiBSB+Jsb0sfwGvITyQtBVe8/PWEXdPkx2GGa0gO7pcRox05Q2C1K0uLpJ
         uW9APSTx9dRvmngTri8vEpEydoNIZanNEq1GYElz9ikJJo+tmZOxYE+fQaIna2khvwfh
         ZnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z0M2hQ70OBRc9KDlV+XvJuOsf7nlclLN8oJcleqchCA=;
        b=V+kSS9dHmTHZK1Tl0pXoVQ8iDUSzyNdjAhcEQde+MqUxhrKqt4winnM1C16VYHjzHc
         sjIVCoUFKV5vtnDBwzZ4jNmdR1o6RooC2oTVJs2CvM2x85PMwoSJoYSwlD+v94Juw4l7
         8Yo/0/FA+K+BFVURIrRxkn9def4m8EeWBi8l1hq6BRrs2cpJhjmr32jL2si3s2MyYNYo
         z+96Gg5IiucxwGUaoL9Klc40cTKXdrN2n16I+SJO3R4os9gtULFRx8W7ub9OhOaRi9gp
         oo6ARx5LJWWuR1aPR7cnQfNxavSAPzZeG2i7yK+GpMFJ38tfDEygFD5v/9X4yjv2wFjK
         MeKQ==
X-Gm-Message-State: AOAM530vnkuRA6ANWw+07FupxAvlVe/mrwH8/IUlYnOB7z22q7g94H1O
	VSvTqkqX0Tfaj4WPtgDqkfXWBDLeN+8=
X-Google-Smtp-Source: ABdhPJwmJPOSHs5AqxtX1QEd6hC4iG7juBXFHgMXQXAA3XjtmLhlEgRKyQwnyEVb3RXpgXTODA5jmQ==
X-Received: by 2002:a17:903:20c4:b0:12d:c7de:3401 with SMTP id i4-20020a17090320c400b0012dc7de3401mr31664316plb.40.1629779265311;
        Mon, 23 Aug 2021 21:27:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:c532:fdfb:1418:61fa])
        by smtp.gmail.com with ESMTPSA id a26sm904857pgm.87.2021.08.23.21.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 21:27:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 2/3] qemu: Security fix CVE-2021-3544
Date: Mon, 23 Aug 2021 21:27:41 -0700
Message-Id: <20210824042742.833379-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824042742.833379-1-akuster808@gmail.com>
References: <20210824042742.833379-1-akuster808@gmail.com>
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

