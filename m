Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC500C54EBE
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:24 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.59794.1673224759640671296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YNlEjOfg;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id o17so5214799qvn.4
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4KxATXsjbK8p7shRzgP9dwQblb/RVv5N1luAJgGcjs=;
        b=YNlEjOfgy/p3D7eEWDe1xPmePbJRveq5s0ZBDqVDwqSfNd4nU0EjJZFc9123L+4mr1
         ZBqSi9s6zPQi30xuM3GxNdxzP6/YCRdOx+9Vr9uv/ZfhY7JlZd7O9ESm7VrnWcc9yl9/
         Jv2dJHbqVFXv8JHOkWm2eQdXSKt5TpjN2Rrb3Us1So26INcGDVCXg5Iloke7nUgsXcar
         9M9l7lBiuCw2WOqwehQ30TZa8OuORJfVL2Xx28qB3RPSa6CSfUwIlCxDMzDCdbyoGtak
         Y7sZaTn6CF7iPr0rDkV6M6oMtUeqr3DJK4beME03TXNVYixQHRiLgLpilPRuT1su/VzI
         koCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4KxATXsjbK8p7shRzgP9dwQblb/RVv5N1luAJgGcjs=;
        b=Tg96kwjNTkh5t/RkwBZvYZuV7LkPRIcVYc6jpgVtgsOKRFug3lRFiIRHWaRRAzVJck
         ZfUmxHaGHh6BypbCuR0gfB8pK+vuXI8RoB96f2D/lIeEZ6B1E5fVDUNg7QOcvKILHtym
         i2/V39Mbe4sYYlvuETkCC9xpWerHm4FRXSBr1qNyBrExKhTeWgxr/89Ul58ELFUEvV85
         n69p9u/BeTURy7sS0R0HJ8OXwTJsCJYMaTLDm3Bir1KKl6StIaqjIrTsIYT2pl++LXtk
         zDZfOPEL1IcBzUX35EsNhbmbvsvb/SLpLKzUQTBgl238Y8AJ1HTEiolmLhkd6E8C/SGf
         PN6Q==
X-Gm-Message-State: AFqh2kpDF278anPBgIPqIuf1c/3cX22m8imMyjguqPImIJi1Xf+TV0l4
	paCG1Ck6GGvbrc91/i2VTntoR0+YcqdZNA==
X-Google-Smtp-Source: AMrXdXuL/FvCLh8G9RLz3KDFvYyW7DG26wG9LYfr9RsyRaUB6ee5AgfzeDhvPKdTlwG7WRXyj/b/aA==
X-Received: by 2002:a05:6214:3885:b0:532:15be:aba7 with SMTP id nq5-20020a056214388500b0053215beaba7mr19039165qvb.40.1673224758709;
        Sun, 08 Jan 2023 16:39:18 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/14] linux-yocto/6.1: cfg: remove CONFIG_ARM_CRYPTO
Date: Sun,  8 Jan 2023 19:39:01 -0500
Message-Id: <ee19868c18b0623caeac466e2c79196a1205b76f.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175655

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This option is no longer required in 6.1+, so we grab the following
kernel-cache change:

    fa5b537b0e6 qemuarm: drop CONFIG_ARM_CRYPTO

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index dcfa7f5d6e..3f77474ae5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "fd78a53858b7f9195ab53fd98c27736d05bbaf7c"
-SRCREV_meta ?= "b997081241db4b199475893f1008b0418c3b1767"
+SRCREV_meta ?= "c56c1ed8bdb0c470069b74090381bfe07341c95a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index c77a90c182..54f0065c73 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_meta ?= "b997081241db4b199475893f1008b0418c3b1767"
+SRCREV_meta ?= "c56c1ed8bdb0c470069b74090381bfe07341c95a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index f71c356cc9..f357f43f46 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "872afe79c5e568acf5f971952e78caada8424df7"
 SRCREV_machine:qemux86-64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
 SRCREV_machine:qemumips64 ?= "e01e486b21db695c46c12253b92adc7aa0da6d38"
 SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_meta ?= "b997081241db4b199475893f1008b0418c3b1767"
+SRCREV_meta ?= "c56c1ed8bdb0c470069b74090381bfe07341c95a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


