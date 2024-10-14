Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8273D16268
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:45:46 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.55272.1728913546131115648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 06:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eEeXe7HH;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso4311971276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728913545; x=1729518345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP2hZFkkjlVBR90WWmg2gFdqboSUCETdpP4A9sUJRLE=;
        b=eEeXe7HHsMLQL210u4AHYMwae+IOIMgT62k3OhJojyV6Hld7Wh3SZyJTA66mEnjmbT
         24NaGbFpYoA3vwyYHZN/INO5ARh/NYnk9zmVlnyzYogguQpovOro6pFHHSz71b8dCH1m
         NXgtMhCyo+fQ+0ccbJV49YKEpnF8u8Nh8U+j2aEwhIgIU5/YjbhRAVrtMSc3f6A8FNQw
         SeT169DjN7B/WbKEUNOqZUwtQwn7BedMMzKYCx517wDHw7YlhYVGqwfpm07e4jeF9x3t
         fKzzckS7MXXcWEt+WvbB7q0YKRy9r7/Dffs1t5DNxFknuxTAOKHyb3Iz3O9J6LyE28cm
         wggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728913545; x=1729518345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EP2hZFkkjlVBR90WWmg2gFdqboSUCETdpP4A9sUJRLE=;
        b=MSBl+XQ6plGM6TujnBJGZl2rRt7Ud5PfGOiq2KJdvBDa/n3LfCyXra77OjWSZr2X4G
         I3F0es9EhcXoXjUPScG49Xy4af9oxb6X0SlAmBaQIAzThZiU1AfU9rHJT3VPNWBrpDgq
         eJk1bnSM7nIBlbBL15x3Ld/cqGuvq3sfN5xVH5IDSrEjyKCjtIo90RguMOQySt75+6iv
         DgodolXPv+lkFPRz6yKKXWRzpKWLZSVms6wu3CBPqv3O6wtzKs5QtUfzpQDKgDjJ3g8r
         BtK/5gjFRHJYEIiWOChVRjlDECWHD8lAcKiIRBhGa7a+MxA7qg8nFmFvBXtwiv8oe8Td
         A2Uw==
X-Gm-Message-State: AOJu0Yy2iyeyqMpCLC0ZiKpvldtktJilBdkyESiCTzqsHNvP0zUUfXt6
	7vx+WPUnxuqXuK4+6mDatpes6FINkGMOz51gVxePMHaUVcAEtYAm
X-Google-Smtp-Source: AGHT+IHfnED1g7p+f0pn9glZ4lVAFh6y+Bsk/lQQapOLkxIiO/eEPLm4md7C9BdmLzaKWU0ZbSydGw==
X-Received: by 2002:a05:6902:1611:b0:e29:948:55fc with SMTP id 3f1490d57ef6-e2919d61598mr10027009276.10.1728913545253;
        Mon, 14 Oct 2024 06:45:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148c71b0sm422617685a.3.2024.10.14.06.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:45:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto-dev: bump to v6.12
Date: Mon, 14 Oct 2024 09:45:35 -0400
Message-Id: <ccbeac491694aebefe1e6659bbcdf447cb9d3ba3.1728912923.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1728912923.git.bruce.ashfield@gmail.com>
References: <cover.1728912923.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 13:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205774

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 752d108bd8..c2d960d163 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.11/standard/base"
+KBRANCH = "v6.12/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.11"
+LINUX_VERSION ?= "6.12"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


