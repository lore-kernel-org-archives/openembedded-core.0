Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5615.1794387838777013507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=jMGmu6m+;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso25314185e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387837; x=1794992637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=we8QUMe5aMAIp34eX2g94QyhE2t++LhSNLwEOFRfHMc=;
        b=jMGmu6m+xeZWJG2ByWPRJ+6bIbaQBwhmh3cAyTnIDrgs0VeqzmYvRBK5+EMPNQyfT6
         yoLFiY9BGM/mZKoqqtJ/mXZpv+0puhvthBE1/QqSw0aCrpM3Jfotj0buYOOgQgcTIVwi
         Hf3fmUre+fytCsIsvLdIYRuX/eE2ute9C+D5SwLsfrBsDSkQijzor9K2LLA05PPK+lPz
         bHiNEaaPQ1r7oLvZOrhVj3zoAYST4gGngNIwlqWFp9zEVvW6sqqBxw/JHRYh55tPyTI1
         pC3owhBoQw2m3XAlar4BkeGTrF+4zXdLhLoiyXqHHgscip/hgVSKlY4lODhDkuzVIoN4
         GQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387837; x=1794992637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=we8QUMe5aMAIp34eX2g94QyhE2t++LhSNLwEOFRfHMc=;
        b=NVI67dm6OAixv8NIbe4HGYQTV7TanS1Fn9w9wOXNYVzvnfS8H65zDLX/Y4mWEfGQSm
         G/nYifvtrSvS1GCp3MfNZeF44FahfbJkT1irV/dgMs7A+BmZyY+iC4wS0bOkyT7cHWzN
         PATv1dIX5Bi+tAXNtM+bIfcnCvLCwpEX4eQLym6uG80thooOYjeH8MYqNZqAviMQawzt
         dbmoOzMCaKTUp23B3G0f+UU8Fh/HakrrWWmC3z8Ef4+9bZPAuxU893rZ7qkeEq69ZUUn
         gMKwwAvYfKwFEbFpnjK9t0UVeR6PewOLseYP7hkuYbOtDNxo4lQB7Wj/keD32UkCyULD
         WHMQ==
X-Gm-Message-State: APuU4Z+4n37cdQXmEXN1yhCNVGCAQe8SpjbfRhIl0u6rSB2HLTLR7Jj7
	CM0L7rQBMFLtUNvaIqgeGM0hAdeqd06WMoh6MAGzAxuYyw1D/p8YtmDkevoempeZ/hoQNQaNdfO
	XgO8PR6A=
X-Gm-Gg: AYBFou1jChdEQ/qjbn2Qzx1lzzM/ZgwsZLTZ89wrKAAPVVRFbGNpy1UdNSNLNvjZY5z
	3wmJ6JUBRYNl9pbKcPnS/IT5FMevHKzaJtNwycdYoH5WGYFmkhNqp+YFtWMNIkHTaBhghlBX59D
	qgGGCQv+Nluv40EyzauYhEc0kTjJ39aKECJdKe21oGZF0HRA0oJwqHAzbk7xN57OhuPFdygGhbq
	Tx4qnUg9SiGIByZpnDYR+5eRiuoXSpVX4QITfjJ49Kcoib5H7LNJf00X5RzT+9jhzv12rf/3EgE
	A3TbZmWKhe8UxXmbbujT3q2MATjkTZmDtdLJ3RhsCAkuZhnsWpIS2iaukODiS83V3Tt6XfpvvZX
	60exhgaxg74dL05U99R4nBD4/GSrZcv0cMW35K2rYUar+aCUCETdkjP7v5+yhv8WzPSYYg3v2Jr
	qkRg6cMcfkrrwAfGVC2qKwH5jFHUUGCICxkv1RBSG4qWhXk/bal2ACp1FAuxibwavZnDqkKFrfp
	vC+kCLnS4yG9TV2NeynhAQp4Ocs2yR1RNtbGiqR4QDgfz8S4xZlQhmBCSrhcJrYNsp9rJcCxCB2
	F3G4gNRPcUWoH9PnveU097MCHa/KiKK+gd9J00JhM93D4qOVqGtZh5H5i9wjZAeZ6o2m+L95fHK
	nUY79RatmCWn4l7nynKjmVnLwbBuA
X-Received: by 2002:a05:600c:470d:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ba09380609mr30673115e9.24.1794387836854;
        Wed, 11 Nov 2026 01:03:56 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:56 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/35] linux-yocto/6.18: aufs: refresh to upstream aufs6.18
Date: Wed, 11 Nov 2026 10:02:56 +0100
Message-ID: <a1f15dc65331e3278cc1cbad26618b32e5bc71d9.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250002
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: aufs: update to upstream aufs6.18 (latest)
    Date: Sat, 3 Oct 2026 22:06:19 -0400

    Refresh the in-tree aufs to the current upstream aufs-standalone aufs6.18
    snapshot (f8b3fda5). Brings in accumulated upstream aufs bugfixes plus the
    x86 CONFIG_PREEMPT_RT support, superseding the standalone backport posted
    to the linux-yocto list.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: fs/aufs: route the FUSE mnt-ns check back through is_current_mnt_ns
    Date: Sat, 3 Oct 2026 23:54:11 -0400

    The aufs6.18 refresh moved fs/aufs to the native upstream snapshot, whose
    vfsub.c calls our_mnt() directly. Upstream exports our_mnt() via its own
    standalone integration patch; our integration instead exports a small
    is_current_mnt_ns() wrapper. The refresh delta reverted that carried
    adaptation, leaving the aufs module with an unexported our_mnt() reference
    that fails to link whenever aufs is compiled.

    Restore the adaptation: route the CONFIG_AUFS_BR_FUSE mnt-ns check back
    through is_current_mnt_ns(). Unlike v7.x, 6.18 does not need the
    open-coded rename-lock helpers -- lock_rename()/unlock_rename() are still
    exported in the 6.18 kernel (the unexport landed upstream in v7.1), so the
    native vfsub.c rename-locking links as-is here.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f2e85e25ddf35220fe8b12fa1f1f354930ef563)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.18.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 5db966af1e7..ac97f340da1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f892d97a3d660b9e7f4dc0618e0737f6e23906a7"
-SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
+SRCREV_machine ?= "64ebedd888ed53620df352f568a8b55c5620d169"
+SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index ef90b3db194..4cbcfc0084c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
+SRCREV_machine ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 8bf35579cda..95cae43557d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "16672075f0d625c2a7186a00a0d47b34f8ac1e36"
-SRCREV_machine:qemuarm64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemuloongarch64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemuarm ?= "f271f5b5cce5f2c67c00ccb5b4bf60502d4ddc0b"
+SRCREV_machine:qemuarm64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemuloongarch64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemuriscv64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemuriscv32 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemux86 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemux86-64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemuppc ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemuriscv64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemuriscv32 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemux86 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemux86-64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
+SRCREV_machine ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
