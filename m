Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3760.1793405774769881705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Q2THjRvq;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so12081735e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405773; x=1794010573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uhlDmis/O4qUPvn112/iokSs+AELTRugTqDd+bFsGDc=;
        b=Q2THjRvq9u/ijObP5Qb4i0vu3wdX5+Y4b0VdTRM7ASZsj1MEuq9mlAv6ZpX9Y0hNDL
         jxEzTBuYCAnZp1uFDtTlFZi2w6/JgUIm3QnHs7jw431qqbBbtDbFe+WQCixc+xsjZwzb
         mxNjhGVnKM8K1NVYmozK2kl8tzZfFmrMeCPmCG4eGfGBrSYKJ3RavdIA6k8KKjfdXZGf
         uIVP0fWJiIN+djxAPYBcPsQOM6j+xJItuSdt18yInHTnAo9uwbba9Gl+y2zLRv/ifOw8
         SzQdIxq61xpeu7SsUGQUdbmITpGnGfRyBE2q3Si8wgoAH616jUaaFC5CZwr1JcPrcGgr
         YHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405773; x=1794010573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uhlDmis/O4qUPvn112/iokSs+AELTRugTqDd+bFsGDc=;
        b=hxiPQDpfPIgHwxc4C8XMci4i70/5tgUc9HhbbmOLsOF5WhzyGXM8vez6EduKujodco
         z3DLvsXxCkWcEbnH4Gb3x6Es2Yibo9MI2vC3RHyCMkozaFlnJFWVbdkUyhZeRV3ZeD4c
         MuNRnZ3ci6RQV6tk6Qkynm5tfJycYdtCbhLLdsJ/gKnvOi7Yoxd2U4PjK4p9CVgctDJG
         Tv/DkNPNYwFRelw4opJ/cFE4NDPQWPQqoO4CAbTmhWwme+Us8SoNTypGS0SRX7hrwuwi
         QbwMELizfgrEkWixkdXUazCwqlOYXoy1R42PqF4DugQEcUcGQozJdINL9yjpgwF4mBws
         mnNQ==
X-Gm-Message-State: AFq9FYIe8eIVmB8YQW3ESdOgHtC8WmMBHKodsaOOqtMpFZxC3SlkodyQ
	4GISwiNWPGLLgAgvgTJyOjo/rrUcD9fC3Ls+Of3IC1bgCayJXWhFQaY0UQhtzj+pF+WKIKacx/K
	/S1xjr9w=
X-Gm-Gg: AYBFou08KTvw+j5sSHjoA2y/4u0WBqXKmI/UiVzPi7VsV5XTf/YUYEQuIe5CHvielk/
	uwt3gI62oQVdCOPNZcYVRlNT7hADyvFgRAUXGhjyh+FziKokFjnPCuZLCM/8kTcFbLWr6CX/V24
	IuJOqCuQjw7kiGo5rrBODh1qV3is8fbRlu2zt9/HvWjSWilK5uebppqxLyADc0YHlSkyKm1Tdlz
	Lwdk1fRq76cz4IDptRM5BSVaMC1EUn53DKCunwL0pmkAoU5cPx5SJ2xm8B62+tdip8WY/reJbjO
	mYYShIyNVSWW9WC3cksBA9A7wNq0J2h95njyHWa+74ykbB0QIF11ZE+PPKoh0RUIEI67w9c/1on
	5lgvDfaba6pSXMtPJhTX10rNYsaL8uiKIqyQylCO6W9kbeLz1/XDZB3k1RoI8XQT+WLvYFg5mF8
	afk9JNDMsibs+UCzkdZgPv/JQhzaoMKZCL+sHtZQ6ujqVpiuAx5Il7weySewJ+CUmAMsBQQPGrg
	+KYLjs45OfyeNTo3UXH/bi48YmJARl4st8C9wS0QS87hihZ2Op8YIcfQfTCWcVc7MbUAYT82eYV
	Xva3WzTWY6wH1F1wkisv/fMLNMnO2L5IXhNy/TX7o940aCqizEvdkFlDdnhxHKdqiJ4ld5Jn0M2
	eGnX2ntkTWG2iPu0RM7jeweHvLSh9
X-Received: by 2002:a05:600c:34cf:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4ac150b38ebmr89289585e9.1.1793405773075;
        Fri, 30 Oct 2026 17:16:13 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 49/55] systemd: try AT_EMPTY_PATH for access_fd() first
Date: Sat, 31 Oct 2026 01:15:10 +0100
Message-ID: <2f8965687dd3eaf7ab53e1381b3221c16cd54370.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249123
Content-Type: text/plain; charset="utf-8"

From: Suresh H A <Suresh.HA@bmwtechworks.in>

Backport a fix to try AT_EMPTY_PATH which changes access_fd() to use
faccessat(..., AT_EMPTY_PATH) instead of validating access through
/proc/self/fd/<fd>.

This fixes a reproducible race during service startup. On
Linux 6.6 / systemd 255 (Scarthgap) based platform, affected
services may fail to start when systemd-remount-fs.service runs
concurrently and remounts procfs. In this window, access_fd()
can fail with -ESRCH while resolving /proc/self/fd/<fd>, causing
systemd to report that the executable cannot be located.

The upstream implementation performs the access check directly on
the file descriptor, avoiding dependence on procfs path resolution
and eliminating the observed race.

Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: More details available at:
https://lore.kernel.org/all/MAXP287MB42404C1A7233A3D773FFA7DFEE802@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM/ ]
---
 ...ry-AT_EMPTY_PATH-for-access_fd-first.patch | 34 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0024-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch

diff --git a/meta/recipes-core/systemd/systemd/0024-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch b/meta/recipes-core/systemd/systemd/0024-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch
new file mode 100644
index 00000000000..268ace04c46
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch
@@ -0,0 +1,34 @@
+From 228d4c63102367a757ba4f31c49a148975607a72 Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Mon, 20 May 2024 19:33:26 +0800
+Subject: [PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/32933/commits/c675851d5fd503c1ae5d244f041d43ae9e3ab79b]
+
+Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
+---
+ src/basic/fs-util.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index 5bc7d2f..3a7ebd2 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -668,6 +668,14 @@ int unlink_or_warn(const char *filename) {
+ int access_fd(int fd, int mode) {
+         /* Like access() but operates on an already open fd */
+ 
++        if (faccessat(fd, "", mode, AT_EMPTY_PATH) >= 0)
++                return 0;
++        if (errno != EINVAL)
++                return -errno;
++
++        /* Support for AT_EMPTY_PATH is added rather late (kernel 5.8), so fall back to going through /proc/
++         * if unavailable. */
++
+         if (access(FORMAT_PROC_FD_PATH(fd), mode) < 0) {
+                 if (errno != ENOENT)
+                         return -errno;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-core/systemd/systemd_255.22.bb
index 84d41a86c9b..1bdeb551fd8 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -39,6 +39,7 @@ SRC_URI += " \
            file://CVE-2026-29111-04.patch \
            file://CVE-2026-4105.patch \
            file://0023-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch \
+           file://0024-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch \
            "
 
 # patches needed by musl
