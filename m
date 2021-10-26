Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A463C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:25:32 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.568.1635272731433663879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HeadFt5E;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id d6so77816qvb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wEk3IuzFptg6SVZFqMOgkJZKmfWw+ctmUNeEkosperc=;
        b=HeadFt5Eg6AuVomhgSzcXQFbS3IX9YIaLht62Jmr8O5rxYkZYJ20+VqBz0aENy1Q/A
         8WCqGFcPZqa9I6CGOV626+azUE0D6f7vS83rV+M2mCDN5Jq4qeWWeGdi9FC78VFG1XCK
         RYQ6HA6mGU6WTKLwV4WuXXw6cxpA8j7CjgOwbim4IFdMvvXvOKIPurF70oiipFzP2o4L
         tMORYXmV9TjCe2M1S43EKh64CH1M3sPOlJjWAvFElYSjYigeIPLB9WnJ9f0+TmruAF8J
         JqjF2AJn3j14Xu89cSIEBl05LWfrGsItTL7dtQmwCDDgfVfeT2nKzzwDaeX1W++HwK2J
         8VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wEk3IuzFptg6SVZFqMOgkJZKmfWw+ctmUNeEkosperc=;
        b=jrNecjQla5rdElQeUGoeatsopj4YmdcrHJrVesLoUbfppsXhcZdSWH3fjnjEEVDlsN
         RvuzS0lSn+6uhKiPddq444HeEDmca91GWFRLTNBGkJwCjcF2T2pUtEColi/DX74lSWGM
         O120ukTni/5Gct6KnAS7HRwzkDJOr4FUj9jZNjb9gpbW/ZE4DDqdka3YSzjjOAixSQxW
         k5S34xsKTlswKKmneIjURXRJ8N9PfmbYzac7IWxpvEyoJhpcmmUgHKIjft0HyCglHBNi
         VU1FukGmC+b9tmRw/aI4g/0t5VOh1BPZgKfqKcGfu7LVpRo54e90bcz6V9Z3bP2+O0BW
         T0Yg==
X-Gm-Message-State: AOAM530rhi++sv5vQdM+a6Fd1lx6A8rWsMSuEv0LeYAp+CshBBdx53Qb
	O/9ZLCT3EbvTMb4NhWKNdC0dMjVTaZ38LQ==
X-Google-Smtp-Source: 
 ABdhPJwL1QaCsawtMR9c62yUDggfvN3kozshmQdLxZ5GIE/G7/XcJ9I+5aErQ0PuGTLMJmAoW12Bbw==
X-Received: by 2002:ad4:5be1:: with SMTP id k1mr13472348qvc.65.1635272730558;
        Tue, 26 Oct 2021 11:25:30 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x16sm10608460qtp.56.2021.10.26.11.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:25:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/5.14: common-pc: enable CONFIG_ATA_PIIX as
 built-in
Date: Tue, 26 Oct 2021 14:25:22 -0400
Message-Id: 
 <2522eb60e18e04626645c4ce66673ded064886d9.1635272591.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1635272591.git.bruce.ashfield@gmail.com>
References: <cover.1635272591.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 18:25:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157446

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Jacob Kroon reported that generic/custom x86 kernels would no
longer boot out of the box since the IDE options were removed
and the PATA migration happened.

To re-enable that use case, we grab the following kernel
configuration change:

    common-pc*/qemux86*: set CONFIG_ATA_PIIX as built-in

    Since the IDE options were made obselete in the kernel, and the
    PATA driver is the replacement, we haven't had one of the commonly
    used qemu boot devices enabled in our kernel by default.

    We change CONFIG_ATA_PIIX to built-in, to re-enable use cases that
    boot from default qemu 'hardware'.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Reported-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 245ea46ceb..3d53a32d40 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "cddeec4e197612a11f5a3d746a15825c66040830"
-SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
+SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index c98a5fa428..0683912eb2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "ace292aaba53e26d1888bebda95bbadfd417c2a5"
 SRCREV_machine ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
+SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index fe7244399a..2d4600746c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
 SRCREV_machine:qemux86-64 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
 SRCREV_machine:qemumips64 ?= "b8f18794a5a6bb9c6d0190a2006dfbd82f0f5916"
 SRCREV_machine ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
+SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


