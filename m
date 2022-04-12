Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036CFC4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web09.2031.1649799978333579357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xd9OTzGl;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id j9so8589942uap.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wD+6uD1FGACBps2fSpbm5cats5/YyrKvQKPruCap+wU=;
        b=Xd9OTzGlqdQWVpcsjJYNQoOJulB7Z7V/VOAfcyjY7/9Jq5VACTzHB183LyRCEX29Sp
         MqNXQ4+CZUZxlA6zb1seBlZYbyUgGX9watvNZUndISWIBxLkiw01rk0qK11DHRDR8Bg0
         TD5P3rfLyr/2ee9CjGxt8x5E8ClOmW0wEkpgaPNkj4qWb0jIdDEohFJR54k9u3/jKX1I
         0cVZNWXyLPb8AyFGxZ0xiO1wMh2ql7vek6ZCjpf7Bu/ds7TnGBBZFUY3gf6w1f9SLqW2
         OolccTD8Co1/vgP875tBks6GdR8soj2UUWmUviC+LN2YvyAcZlRIVXUAO+qaZR59ypmU
         RDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wD+6uD1FGACBps2fSpbm5cats5/YyrKvQKPruCap+wU=;
        b=BerLtxUvCqfUmk4d/aWq3vYsTSKPDDQYis14958BbPE7YlK+2sXc42ZTqneY8FJa0s
         QhzZjHgmQ140OPNs1uG+E2PrTrTp6zhA8Xjex7E5A4gTn18MD+3rCcQ8OxOd6jEEgy1/
         XcbSET6G7+VLGfggoDyBIJRUcTMy1wpPog/7uW87cL2Av1farlwwJKiettoRI0ELHlzz
         E7cvX8Qz0DW5vXG5g1wVhYdreJzMOTD+YjpC5Mt4iE/yedSxkuLiSas3/XciwQje5RS+
         umf/am4gvu8IYSLBNHlG9mQ37Z8NOjIIf01H7WVr+QQqAMehzkny9Llj/9ICoTXLhj5d
         aQlg==
X-Gm-Message-State: AOAM530UsIczIEdEe8itZ4eu2kU1Mt0mKLv156904bajSxuODKu9bhzX
	H1MEcPRSaN39NgjVLcVPJDM=
X-Google-Smtp-Source: 
 ABdhPJwMdC07/sEpxMp7N505N9bTqq6QChAdokI7zq6rFpKslkDCD5pXLwu64FezRSpDEK0BLvnHpg==
X-Received: by 2002:a05:6130:224:b0:35d:48e8:5402 with SMTP id
 s36-20020a056130022400b0035d48e85402mr1307824uac.70.1649799977456;
        Tue, 12 Apr 2022 14:46:17 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a9f3ece000000b0035d20c94b68sm1527638uaj.29.2022.04.12.14.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:46:16 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto-dev: update to v5.18+
Date: Tue, 12 Apr 2022 17:46:03 -0400
Message-Id: 
 <6374db47b1e027934ad5f9582f8ebde85f0890d2.1649799823.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649799823.git.bruce.ashfield@gmail.com>
References: <cover.1649799823.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164291

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.18-rc2 has been released, so we bump the -dev kernel to allow
easier testing of our components against the latest korg.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index c7f9b102c7..d35632071b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v5.17/standard/base"
+KBRANCH = "v5.18/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.17+"
+LINUX_VERSION ?= "5.18+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


