Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4405.1793244334473713846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VD2tVc9t;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91b9e758c50so4251126d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244333; x=1793849133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MzCk26lbBErW+PLhIH/n2s8TQnLfO9zHMKBZzLUvbo=;
        b=VD2tVc9tIMEakxPmkgHNZaQJBenXkuS5VdP3S1XQs3KRbS9yUrDtbDB4Wl+OX64O/W
         WtxzEYaX6L+IymYgSlFEcymZIjleDmRIOUkadGR9+jxX6L0/gxZkaehH55IfF4jDLgnE
         KYWM4VBPoU5EtKf7sJI3zHxyhThV3pbwZSsKYDy3gKPWM6Tyv6Zerx3re/gbkhAh7XrA
         uUFI7GfaQ3YRl24P7i+k15I22EnBFPG8HKcrgka9/EOCmY91zO0akxEcmqqQgrYdhf13
         AMIVQ4kFKR6zNkB4EyPMVxb0vvZ68wt5bvhxlqdMYJG1AU0iOeApGKYJrqUnwlUuSXqp
         xubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244333; x=1793849133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MzCk26lbBErW+PLhIH/n2s8TQnLfO9zHMKBZzLUvbo=;
        b=XwMbtpfkh/3yUrS3RGeCdMtmynGkGOHeCMvBOAkIkWVxP+1zt4ntQfGfAH+Tj6jfYZ
         MhiB/lA4xHSlc98KzQaTSiyTE5YRXNlwIWldBXJ4bocH4LdSIUOZUNVR6f9AKs5/WV4b
         x0PBIrcRvSzTFYSHqBoxjMXjGFYMqAYrN+uLGUt2xDuk8QCvN1E6rJT0tzsMWo1udaih
         7C/GcJELgOmGswH80UhOdtFy/getl7YsvKvUPYoOROH4xaBysyNoAMf1nQSRIN09Wskl
         f2oQVmRQhd+TrxNDjuEoxuBN7YzVxW65loazl5l2jcAn5owbSchOj9YBYs0PRVASIS+e
         1+dA==
X-Gm-Message-State: AFq9FYJNTdI5Fuwms8lnZ/vGLvew25SAV71wX1GGRp1YCcxfKRpOVTlE
	vjnwFIw+rbJp9UxH3J3qQGIo5yVnVeofvHtNsaJ+fSFDyjBLz03I4F+DDtmia/SW
X-Gm-Gg: AYBFou09RhmoarY6suyNLSfUrbTvNHzFksqh1Owr8GBqd/AnnkgY9lyb7lhOzG7q4ZC
	C2L5v1FGIq/n1N1FQJH7hixLlFTnFHmhSmgUeiZQFq2zc6XyekkBHdE3pBjcNE7uDzuwbfK1nKI
	QhvTx1YmFOjzdhf1madIpuUu3QsAVyGZEBXzVS3WlynN/BDFnPHosatqFaS65WkuK3y8WOTi+MO
	JkTyCR7uTwCg1qJi2xN61q+3HbJqR3KqWnJ01fPnT/OVv9hRQDccHs8oIaVbYDsl4XMVHL12GV4
	n7ixIkkrV6NmaMMqFgMZXcm4tmd3AEzSlVuhgXKV7QYFxyxdwHgFjvLp0Z/SDkRm9VwSJM6RGbw
	TKUSKc5y1u0Qogx/TOChINQpnssN3pCx5m9L/gcnNEa3YT3acEkRvwWIJpSQUidssCKDpZ+5tJs
	zvUyufdVGB+7UbCJGyLvquOH9EV9hEmisZT6mwh/CGgmn36oleXf3ju+W7YnIlGZhmBHHq5C09T
	2tDquy32bo43/ikdA0wdi2aJ7D1oLnUrgBTnNxfdZTi+qSCJyB6P4/RQ5WmAS5/gRrAU6veVdja
	WrTRUjVGle9mVzKZO+WUh331YXD4jmlvOb7vTYipXXwKVweTjPSlzk/C79xlHBrVvfZ1LgDMF/n
	07iN+/NzXluBbcgW1PbOnykUiDj1E2RcMhGEk9MvoCFhcgHzLf5Y3UEk6Q1N2otlQloodSzhPP1
	zbaoFCPnnnc8qKdxJc8BvBxL6WeSMLWvstFuxTB5GXQ7/u5Q==
X-Received: by 2002:a05:6214:5085:b0:90c:c1eb:ae42 with SMTP id 6a1803df08f44-91c904153b9mr21861366d6.13.1793244333152;
        Wed, 28 Oct 2026 20:25:33 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bda586sm147529056d6.8.2026.10.28.20.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:25:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/11] linux-yocto/7.2: aufs: refresh to upstream aufs7.2
Date: Wed, 28 Oct 2026 23:25:17 -0400
Message-ID: <20261029032527.3150782-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
References: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248859
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/7.2:

1/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: aufs: update to upstream aufs7.2 (latest)
    Date: Sat, 3 Oct 2026 22:19:28 -0400

    Refresh the in-tree aufs to the current upstream aufs-standalone aufs7.2
    snapshot (3b79c0b). This moves to the native aufs7.2, which handles the 7.x
    VFS APIs directly (superseding our carried v7.0/v7.1 port adaptations), and
    brings in the x86 CONFIG_PREEMPT_RT support.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: fs/aufs: preserve open-coded lock_rename and is_current_mnt_ns across refresh
    Date: Sat, 3 Oct 2026 23:48:17 -0400

    The aufs7.2 refresh moved fs/aufs to the native upstream snapshot, whose
    vfsub.c calls lock_rename()/unlock_rename() and our_mnt() directly.
    Upstream makes those callable through its own base/standalone integration
    patches (un-static + EXPORT_SYMBOL). Our integration differs: we keep
    lock_rename() static and open-code the rename-locking in aufs, and we
    export a small is_current_mnt_ns() wrapper rather than our_mnt(). The
    mechanical refresh delta reverted both of those carried adaptations,
    which breaks the aufs module build (implicit lock_rename(), and an
    unexported our_mnt()) whenever aufs is compiled.

    Restore them on top of the native refresh: re-open-code the rename-lock
    helpers (au_lock_rename/au_unlock_rename, mirroring the in-tree v7.2
    implementations bit-for-bit) and route the FUSE mnt-ns check back through
    is_current_mnt_ns(). The create-excl / a_ops swap_rw adaptations remain
    genuinely superseded by native aufs; only these two integration-coupled
    ones must be carried.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_7.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_7.2.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index ecce6498f4..e808315955 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6e3aff84e18e0a58ae185f48365bce087aa25319"
-SRCREV_meta ?= "f26871a964ee3984a78f5e8fa1001cf43e551a20"
+SRCREV_machine ?= "e1ac915949f84df75ab979843a0c16c0355d5d60"
+SRCREV_meta ?= "409e37cf5194730ea597a1c18f3475c7e5661f4e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index c6ab5544bc..67580a5aca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
-SRCREV_meta ?= "f26871a964ee3984a78f5e8fa1001cf43e551a20"
+SRCREV_machine ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_meta ?= "409e37cf5194730ea597a1c18f3475c7e5661f4e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index 39759329ef..eb14bdc17f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "2fd911abf4b675ed9f8904b8a57b087323bfa2cc"
-SRCREV_machine:qemuarm64 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
-SRCREV_machine:qemuloongarch64 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_machine:qemuarm ?= "8d67eedc20fc5238eb546ececf7eef7f5dce22db"
+SRCREV_machine:qemuarm64 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_machine:qemuloongarch64 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
-SRCREV_machine:qemuriscv64 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
-SRCREV_machine:qemuriscv32 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
-SRCREV_machine:qemux86 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
-SRCREV_machine:qemux86-64 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_machine:qemuppc ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_machine:qemuriscv64 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_machine:qemuriscv32 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_machine:qemux86 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_machine:qemux86-64 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
-SRCREV_meta ?= "f26871a964ee3984a78f5e8fa1001cf43e551a20"
+SRCREV_machine ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_meta ?= "409e37cf5194730ea597a1c18f3475c7e5661f4e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0

