Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29811.1793868231616850031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FENiZVc8;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso200373f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868230; x=1794473030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=we8QUMe5aMAIp34eX2g94QyhE2t++LhSNLwEOFRfHMc=;
        b=FENiZVc8tLuE3pV1RUZGr4oB9JrIP+6nopBGclK9NbVHd6fQuOtPXWdltb7MyZaDHd
         rn5F387W9JBz9zSWZzxlMYH0XUlwCzRsU+fMIeNN3R4ZT7/xD8NLt5SEDZhbOVioZtf/
         64NRljQ//+5DIJvwF94JBnrkHzSu8+nfPTEchQrzKbhYsEPst2GfXaqkTJdc+/5frUg6
         Y28/uEkW5kcH3txVVTZoQRqo/aUfVWFPUd5Q+sfXdFLjBd4jgzz/JBEb+R4LJipFi/iq
         KO3z21qXSve0L11dI2wZCyWHq2johWn1TYbdGHHBtKVxGMtv2BDqFZot6sK/dau+iakj
         GKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868230; x=1794473030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=we8QUMe5aMAIp34eX2g94QyhE2t++LhSNLwEOFRfHMc=;
        b=kQdwNi9CwzKYRNXiQOp9ZxMgp3KZLbqLyJGTIkqMs5w8BQ5rdUBTqKhnISb7PIrj8B
         1z+Et2Zw7YSPhzSmO8tNe/1Dq31bbE3IBMXKeBtalThDdf0ICrcHfaUp6ji2VRacCw/Y
         +haO3LaD/XeDruyyayc1Vq1V3tBd/qemCGJsrgOEyZfBmgxcrS4oEV3SVxYua7vQaa7F
         R7wtWwP3S/1yFy1JrN5ET2lr0aNX52+57r22tYUBCqzcpipzEztWkLGfqUnXohWFsFGl
         TgtZLTmdRJBDOObV8is0Ml7nJSY2hSfLQwWpg9GBrSlWgiaO9syvWDe6IFWtyGrDiqXk
         p42w==
X-Gm-Message-State: APuU4Z9mYqIpGGLkBGN3Acf9RzeUzXg47isX582M+1mPtKYF280Rb1Sw
	0RxgWYB3IyTpQ5W+G8mOx4ZiWqJkOgM0bQQNpZbIuSDvbkVh2GnZ8tUfm+agvjVFnNim635tmkJ
	0qvBucTg=
X-Gm-Gg: AYBFou1q7voSeKL2RaPsrPJ0Xsc0Z/9vuf3CprEl4ZiYxy6s4rVUawRq6DecPkd8r40
	4awwG/j8HusYCAB6yfFLP0I7uAUOHd+cDASN+T+zI2R7WBk5uLZMrsSTXOKHsSNB8JPns5Ro/B8
	QydffJ1EGMpLu4M8rAY9ehX3pGO8bdzbEVrsEcXNgKl4+4rumuBuor0E7DrAEYOTsY7MuGktwur
	E9SU+1Gei+gSUdy8pMiz/v0hO4mddku/kyg0947Q+4J6TOyZBMWoGpT0KPd1ZaYYw8MTfbiN7VI
	XPcBqInEph4j1dICcjsoIHRxCbZ+uTOoE3odMNUg0sLFeO1L4Qqrj4/QzEogBi1Z81dN+y0+u7S
	YcQBASKnKhzYXsf5AhjbX0JyRNmpe8vrzeAfNTZMvis2Rh9U5ixvtESYJh7q+L4eC4KzwracDWr
	qryNWiBUI1+w8vEmd6w85OVyssdWqpdouDx11ntEnaJSOc7yN5PI09lm+UDkRcTZbiiOI40eFes
	zJsTV8UaE3HnKAn8dNf0D3o5M3f3Shv4IvzE71ky2NhltV5a5elR4/hYJNqIlQvbH6ipvDoq2St
	Yn2QJF7RleSe1A9ZvahszgImKdVf2Z/YjlTAKv/z6MawNRo3qE9eMY8hX7FT/h9f2OEarzNtaXN
	eQTXlG3jAJMnrFVTxskgsWywQPCwU
X-Received: by 2002:a05:6000:2893:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-49115c978f5mr3527976f8f.1.1793868229787;
        Thu, 05 Nov 2026 00:43:49 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 23/60] linux-yocto/6.18: aufs: refresh to upstream aufs6.18
Date: Thu,  5 Nov 2026 09:42:42 +0100
Message-ID: <e9f98bb265ce1640dd55850dac203340d7cc15c8.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249482
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
