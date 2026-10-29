Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4574.1793245549343575854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eTRxnU51;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b8306b9f8so24123056d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245548; x=1793850348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EkFvdlbxct9rda2qggD3wCKVWrEFgaFBfW2FrlZxqRk=;
        b=eTRxnU51QoAr5RSK+xEFjYEvsGwQocXswVnWA9dQUEfZy9xh+ttmi5ZyhhbeR+R+iC
         dj+G7fWXY08Ibw4n8JNLlsk/7Q9SpMEDspqB1gbHiLr5kHTUODDkFlpXEGDCG/fQQRD0
         vqDcNy3zg4uEhOBTDAbvIKuzZvUD3ohRjsiZlJUVJMkm4IfocpLo1jNrGVB5vATrHe50
         hSgUQ36su/M2o2kqAni8A9PxTfEw15uZBUMS6sZBac3LKKOgKdhjDHStMRba8ifyKBoC
         auElE2OfMQINJggaQnWMokNS9IxWtTnZQA8b2clMBasP2hpdVLORLwCAjIJ7htZxzZCp
         Oizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245548; x=1793850348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EkFvdlbxct9rda2qggD3wCKVWrEFgaFBfW2FrlZxqRk=;
        b=l8yzQ7wYuvbxNTlhLFJC4bl58ILUIQjOpWp1i/5FRkTGk6dAHS0Ja4wshReutWdY+z
         aZUVQLZ22mlNRwJSHfFO8TGFXBNEtmtAuhSE/t/DrA1LPxq9UPSc0Ms5jrKzK7Ke/zYP
         msgENG56XEAxj8E4uQ0yQ0bGEhMlNbca8MiWVchB37nF8AVUA5yjZ9Gen4aTHBDKhUtA
         C+7x2AsgLT5490AlFrhOb4vDbOW5AjlO/L7E5P9lKYGUOX1cycRWHVnh2PlbhxE5bJ8H
         Dg8V/eAk2PiKJI+PXCelnVBuD8FaA8+OMnPOl6QGRsljVbW2lwwht9AUiPxLvVUWB2Ew
         Dd5w==
X-Gm-Message-State: AFq9FYIEnMj7YmINfhbzxf/jZs7GV5PqKvkZlLreXsOaidtxdfuahZCU
	XkXSqMS25Eiw+elOfyYsDKEuCIuHWcbdUYGXyJgoozxv5ruLan7kwqFbMUk2NS/y
X-Gm-Gg: AYBFou1cXaOS0+emMnILe7o1l6BrfAm2iAJDjHlAndI1y/amF7crqguzdlvX77V58da
	RejywmEbhDNQMTKVhBXnYxXXg8l7OuO3FZqN5JxdHtoJ0jDdiuyzrlDOJYKOdMfltSf6smDgV8n
	vsSYLOi4ukjyob1JGilZhMCqa8EeTkyI8I5JccnSTvbZke8AnH0GVtKKH41bEdrkBIr6Q0gQ3D1
	xq71JIVIazIW4+kqFORbcPLaoexalK7WSmzNHGTN2PCpaWCFGtLijzSXCLMchBX6hzttK5/DVQ7
	1myWo7H0ed36tcHedvlO9/7ZmPBnHV8DJKJaZmPcvi2g0KMWUuGzAnSsjrJq6TPJbLlVESaIfMe
	mvPfidnIkSwuvwUJS7ocw14uG75ehClt6qrDjtStKWRdj6uej1selaf6pb8SWEFfA/i4ymA3VN5
	k250TAM/8tyly8e8Jp1u/F1zG/xf10+NXFdBq2N4yhvafU3v7l0KFY+6Qwz4spXRi/tQkbeBK9+
	oqy41NIgE4fMzGu8GyJgFkodLdxExgjRS+7sYYOEBhDxGOxHO0RmnKb0YZp24HLLIO/x6Wb4oIS
	xu0V+eaY4GxKklUetkJDSfrMUVIJf0QIzUtMA438HD9Vk2+IvjOlN/P1jhUZjO4GdkTXmGm6eUi
	G0Giqq+Wnng//A/lrd2Q+R5TGVLqHJ8AkIq6aDH7AIUmjlW+oFpks+DXScnI6+aAkMKqlPOW6Ze
	S8CmWvnhnZbsgZNVWIKMAG1T7Z9yGvkAC1SP9VucJvg4zcOA==
X-Received: by 2002:a05:6214:230e:b0:91c:7a04:e7d with SMTP id 6a1803df08f44-91c7ce0eb51mr67469216d6.4.1793245548060;
        Wed, 28 Oct 2026 20:45:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c16569sm147542096d6.18.2026.10.28.20.45.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:45:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 05/07] linux-yocto/6.6: aufs: refresh to upstream aufs6.6.84
Date: Wed, 28 Oct 2026 23:45:01 -0400
Message-ID: <20261029034503.3153661-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034503.3153661-1-bruce.ashfield@gmail.com>
References: <20261029034503.3153661-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248880
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
---
 .../linux/linux-yocto-rt_6.6.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index dbd7894eab..51a4e9703c 100644
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
index ba598063ef..14f0a62d79 100644
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
index ac5c593f1b..13fe981462 100644
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
-- 
2.43.0

