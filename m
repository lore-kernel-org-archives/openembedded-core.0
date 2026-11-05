Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30064.1793868232106950271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=c+sR6bYY;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so11101105e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868230; x=1794473030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oizrmlHDhTRQd2RkMAywry92RJjWqt5Jst3dQ8RCS68=;
        b=c+sR6bYYdVHjOj6Rw+Xe+coAwzrmD5kgkxphXkIOT922YpRw1VFk/hQaOJsZo9vBkz
         xSrFkagdkXAegnHOelx4KUbljNlfU6R50A8LBThID4VRq+CSFn8lQZ5ebEnR5I/It+T8
         ncG0kfIKsESf+1jjitwEOqF63NB3ME3ovqHHH4W07HfPUHwhRJbN/QGZ7J24Gq/4VdS/
         me53MKtTXkn/5kZdYFrdcmqOKksCsjBjbqYlkgCv8QrjJ96JOzGuxES9HlqnSXUYOnN8
         rx7NdRNLwETifVjL38sXtT16q5RuHls9i3n2KE0G1/JSLoePvRqFSKC3/e7hf/3xoRjb
         fs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868230; x=1794473030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oizrmlHDhTRQd2RkMAywry92RJjWqt5Jst3dQ8RCS68=;
        b=aQ257c55QQ5N72/sDdAnd790K2adj8sPe5pDpr92CmE48MM3emnXXZpzQDB0ksbTIp
         6uFn2hJsd+NDAQjauvGfO2tScbfUszne+eT6Yst9XSIGOeVVnhTCzrNd2cfYJn0Az+Vl
         A36w3RjPCEesRnE5PIHF8/HrOeqpnj2axpIxDFsPA6+rx/zsqfWqURTbfcWMEjJAQ37M
         XB81k+MGp3HdDTdE3BgkIVT3TXlpacCbbkfNwyBZT7dRyDsx0kpjqFtQRTlZ5sdGoslj
         UvyTIdwj+dsvzLBLt69Y+BuH/CTB5GiJBxxaTTOYs8FbDCo1x3cEjfCI6R8Nwdbf1Nz6
         HeZw==
X-Gm-Message-State: APuU4Z+nIcdYQBrpiAN5Zhxzghx51ShZcva/W4M2DgqE22hTPXL0+L4i
	0RmKrOnU65SpDxKrHb1fdF0Ia5iXHemRSd7koRVXnvlipwkZO/TL3jvtgKTaBs9OWkXmQVHTkK2
	uMV7PZk8=
X-Gm-Gg: AYBFou14FovpwKuwdyoIPr4XlJQaIuSlL1SS1AEZG9MyoKXZ5o3D38rXvTqmg8JzvGc
	RiB/xwNFtZ2Lg36xUAt3s0sPDLeLY02042/pSgO+XSQNMgexJs3KqmnzvdWqPkHLqzq0XTejCPQ
	j/wEYjGNPn/sgJi0mbNoLZ+6fghsIPkb2ujfa4E8tOGnS837XPmFszpmmS3NFCxaT2i/TOcBS6l
	tKm+4T3FX06XQg5v8u0gFi7lN+yqOVRKF/A3fS5OOSqnPPQlCDuUb5o3hRvlZwsR3KxBD+9c07o
	ehB7AaS+bghO6qiCWprfJUyjOn8zt1uvKrJxzJCn57bSwx4/MCum6OkskuY/94X0MuYjrA6mnYw
	iAaCijRxE8iecTfS8sQbTEB/veVD/n9yvLCH4iVkV/6+jRB4NihMJI35R4qFaI2OMxXfzJGWQPt
	KllQfcZIGi480gmawCGBKKHeNo0sjfvhTp8St2DVCkfwYqA93vXY//TxuMwwf2hmEEMHYYMobet
	8EeknCt91WBNfV+JMLTHYfLPQQyaKM9W+1eP0r27udYVLEd6C3uCQhbSt1X82KVHC3p63qBUOxO
	UpzwDS4vEz4jqhCHnxfxzVDqhu9YEkDvHJW4fSYGq04A9QJUUzxt2zCtC6gr6pRt+DkIUFRfiWB
	Y2GECVH8QZCywSUo9R7tyR6OfoI1E
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr407552275e9.24.1793868230245;
        Thu, 05 Nov 2026 00:43:50 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 24/60] linux-yocto/7.2: aufs: refresh to upstream aufs7.2
Date: Thu,  5 Nov 2026 09:42:43 +0100
Message-ID: <504ad160fb38446b0953844a021034dffd4a73ca.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249483
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a16d5ac24308747854fa1e9194d16dc061a2876)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_7.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_7.2.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index ecce6498f43..e8083159559 100644
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
index c6ab5544bc1..67580a5acaa 100644
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
index 39759329ef0..eb14bdc17f4 100644
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
