Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3752.1793405771799865961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kVshOXH2;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13645535e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405770; x=1794010570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qxFaSi8eigYOgDBRUZbDKZy6IwU79++xsjmIcHeOGIc=;
        b=kVshOXH2sOi+nYdsPq6WwWBYHqwYSy6d1Sf27O3v04uhzy0mt9jwGHOu8ISpGYEyhW
         inFwgeRmRURTqhKVH7mU6VZNXYKZpd7N41yBTUFRP68Ul3JAxU0ioQl4MKrre4r/gICX
         GoIUMUcg2vceThiX6IMMZYgGxYDcHXvQV2+Ux29bdvlEDx2Naw5weojuK/VUed8rIr4m
         B9lw0iRTAapN3R/jgyVk7XBrPXWo0AYGK9uTqVVLskQYL1NQDvqCGnwQQGSjnzDugWlG
         YdEscZpmkZlsj8Lqj972PK8D7ndr4WWa8rpyxSFivQQkhBvqxVZegFEHVxJoOzN+XUF6
         efPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405770; x=1794010570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qxFaSi8eigYOgDBRUZbDKZy6IwU79++xsjmIcHeOGIc=;
        b=ccsB/monHbRSqV2xlYkiXOGHo48L8a5t8sY0nJeFHQZKtW/xtHknOO/At8T61o/3V7
         VnHvnXl0LDYII7GfBq8za8D8SaU1PEJpzGMFsnok/swtM1S2MKdoLWY8banZiXg0TrfD
         Cn16ZKm7hrEsq3jpKFmVSwQEy8fsvQTThfIfBvXVpUmzCU07ltd9DAVROSYVVJ7h4dJt
         g6Z7jGRY6EAHnJ1A0dtYxtckaA1sE9p8ob415ErtuRunM14F6nYXWs5lxCzY74Dt6/Y6
         bVLAvqqRHLz+9AXdjZeR0NeCR/7jf5ZIS3EC53qrmy8pOdt3lwY35ZcUpeM+fJNJWPOc
         B7oA==
X-Gm-Message-State: AFq9FYLMz8+B5KCx4uCl6J4POI2rnjHzOkMHPb2xb5GEbnopb8C7824W
	dnf5OcyN5WVI+N7nTTsWxnuEGGsW6NeWkIS0+UWPMZnhPeoTSg6GF6K575bbPQIBQzKAwuwgf46
	YJ1tj96c=
X-Gm-Gg: AYBFou0kC0p/0z7tcTmiQOrzeXFuz24gqB8A2Gb00qZNGpXOXpHdR1T0BNxjKhTgDVV
	ffLEqpdk5hGdW69evJPd/ABU+I3Hz5g5viE8ChKijkr2reeN56wYNWI0wqwr84RQKBV2nNHlKbJ
	Y+QG2ehUL25aIf6KQO9aVHxmPfRn9VurUFLLzn2jkmF7W11vdDciOC9VekdI8rRiFeaDkCdlwpI
	xUisMChlvKod6Xjja6v/LCtP7JdlaN0NLahmflVE+GSWvBljJiouBO+BXQJ1YqEf7u6C/kZ7VQQ
	iDIRZyAI1kftLaBgJU0BAzIXMR7/Cwi0go6lzINwtm04xqVDu6/kLvZNmRxZbDTeoMU9SiyzF2w
	/IaiS7p/mX5wVG3H2OKWX0h5ob5Fid8eutaHW2RlPIPdcEtmIgtBAoeKLfxFCbDQim9PXKI2rbJ
	VaNtNfIHGu0fAeoti0wrva51umjuor3dBG54IJZWKKBmR4g16vgM/4A66Vw2KVVzYZ7rLoRJXa/
	HXV/eekvbG7xp4VPB7UZAS3uw4DY+WToKpbH0EjkIn74oKejX3zeuDQvy29gU2GeAqs6Hx0RSiL
	a4JOzRHppO1Malfkj26CvQab6n0GvCOY3GkHsq4pPy+z2LCV+rtIGKcbhvu77HP+QOfi40Q4HRX
	O/QxH4wjXLTBzKNBuO+A1eeUo2zu2Zy8sdWqofHNiiUQ6sYfgxQ==
X-Received: by 2002:a05:600d:e:b0:4ad:181a:4355 with SMTP id 5b1f17b1804b1-4ad181a44b6mr28639375e9.26.1793405769999;
        Fri, 30 Oct 2026 17:16:09 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 45/55] linux-yocto/6.6: aufs: refresh to upstream aufs6.6.84
Date: Sat, 31 Oct 2026 01:15:06 +0100
Message-ID: <f9c71d8b8c3e43d225dd34301459d214270b9015.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249118
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/4 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: aufs: update to upstream aufs6.6.84
    Date: Tue, 27 Oct 2026 12:19:23 -0400

    Refresh the in-tree aufs from the aufs6.5-era snapshot (6.5-20230918)
    to the current upstream aufs-standalone aufs6.6.84 snapshot
    (6.6.84-20250414, 31c39fd5). This moves v6.6 onto the native aufs6.6
    series, which handles the 6.6 VFS ctime accessors directly and already
    carries the allyesconfig build fixes in debug.c/sysrq.c, superseding
    our carried adaptations for those.

    aufs6.6.84 is the newest aufs6.6 point branch and targets the v6.6.84+
    stable API, matching linux-yocto's v6.6 stable base.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/4 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: aufs6: fix magic.mk include path
    Date: Thu, 6 Jul 2023 11:34:59 -0400

    commit 482d7131560c51da3ca [aufs stdalone: make it standalone] in the
    aufs upstream changes the way that the .mk file is included.

    This doesn't work properly with all kernel build processes, so we
    restore the use of srctree/src to locate the file.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
    (cherry picked from commit c4342d979bf213fcf2168f60c5f8fbdc76d1ac4d)
]

3/4 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: mm/mmap: aufs: drop prfile reference on remap_file_pages -EINTR path
    Date: Tue, 27 Oct 2026 12:19:34 -0400

    remap_file_pages() takes references on both vma->vm_file and the aufs
    vma->vm_prfile via vma_get_file(). Every exit path releases both, except
    the mmap_write_lock_killable() failure path, which only does fput(file)
    and leaks the vm_prfile reference whenever the mapping is backed by aufs.

    Release prfile there as well, matching the security_mmap_file() failure
    and normal exit paths (upstream aufs6.6.84 uses vma_fput(vma) on this
    path for the same reason).

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

4/4 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: splice: aufs: drop stale do_splice_to() declaration
    Date: Tue, 27 Oct 2026 12:19:48 -0400

    The aufs6 base integration added an extern declaration for
    do_splice_to() to <linux/splice.h>. Upstream since folded do_splice_to()
    into vfs_splice_read(), so there is no longer any definition or user of
    it in the tree, leaving a dangling prototype. Upstream aufs6.6.84 dropped
    it from its base patch; drop it here too.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index dbd7894eaba..51a4e9703cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5d98280cab593fe037ee0dc56c451b48fa549507"
-SRCREV_meta ?= "d601e00cf0670dade657151698a6e1bfc431833e"
+SRCREV_machine ?= "bbef8f873c0872eaa717fb9b043b7b428de82c92"
+SRCREV_meta ?= "111e66d07f015c08755ae564c4a2f4a7710863ef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ba598063efa..14f0a62d797 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "67b2cec31617d8d448fdb6b9786a0bf90bb49bcb"
-SRCREV_meta ?= "d601e00cf0670dade657151698a6e1bfc431833e"
+SRCREV_machine ?= "ada4ee01eb1897a0f2a46b9b3ceeb94690f9e619"
+SRCREV_meta ?= "111e66d07f015c08755ae564c4a2f4a7710863ef"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index ac5c593f1b0..13fe981462e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6f024f9863d3f9bd5a3e40b24e65b355e0ff57f6"
-SRCREV_machine:qemuarm64 ?= "edbaaeea3aa5ea133a35962f75ba32fab5ffaa25"
-SRCREV_machine:qemuloongarch64 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
-SRCREV_machine:qemumips ?= "657fdce3e983f75a5a21e0399651a2bbdc034c12"
-SRCREV_machine:qemuppc ?= "75f8fea793b8611a220cfaba666a59a9aecc8f3c"
-SRCREV_machine:qemuriscv64 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
-SRCREV_machine:qemuriscv32 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
-SRCREV_machine:qemux86 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
-SRCREV_machine:qemux86-64 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
-SRCREV_machine:qemumips64 ?= "cfed5cc4b70b7c7d59f45b1bc8d58b4f4e4c1a95"
-SRCREV_machine ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
-SRCREV_meta ?= "d601e00cf0670dade657151698a6e1bfc431833e"
+SRCREV_machine:qemuarm ?= "e67812bab0b383dea8ae786005a5ec642e6b860a"
+SRCREV_machine:qemuarm64 ?= "dce83a630a519666f8c5599478cd8db87cf772c2"
+SRCREV_machine:qemuloongarch64 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
+SRCREV_machine:qemumips ?= "e74bfb3fbb54e475fea2371332942c68ab7edc8e"
+SRCREV_machine:qemuppc ?= "a384bf5c01fda52c362015fb31815f41193f9e3b"
+SRCREV_machine:qemuriscv64 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
+SRCREV_machine:qemuriscv32 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
+SRCREV_machine:qemux86 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
+SRCREV_machine:qemux86-64 ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
+SRCREV_machine:qemumips64 ?= "14d15eae8d97e33895da68333b4347af334e5c65"
+SRCREV_machine ?= "0615dc1f6a56bbd35510d527380a9e899adf8707"
+SRCREV_meta ?= "111e66d07f015c08755ae564c4a2f4a7710863ef"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
