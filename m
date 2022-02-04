Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9411FC43217
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 04:16:46 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.5207.1643948205996787105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oLmimfOt;
 spf=pass (domain: gmail.com, ip: 209.85.219.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id s6so4406764qvv.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KyyDn/+Ws1akfzg7kd9xBjww52atUlyALQf2BoAWc7o=;
        b=oLmimfOtS16V7y/2x4508HDFmsmIaES/0wm1ZUBdqo5K4/Sspy1X8BlMyJcKWBsNuS
         IZwji8PY1D2dCCLpAa1lS1EBotQq30gpWRUUn2WfDaWA1ZsUFWV3fttVIc6IjDDhUyVG
         sLjEwjSHD1fiDZMOZlEKQrjzrCAGzGJ8UXpUBJE3UpqdHu3Sk4TStWb+QECqlCygPICu
         4lLld6cuuYjixGEtw3IU0qFDIeeCIzCl1Bm63dZ1FS0HspSg3+d99MGWI0XFieo00STi
         yDaO8Wco/dxOtTMbsw3hD9/16pDQ7UZsLwjhWqmP/Zh4xO+taN8DUX0+9pYWMDiR3K33
         rZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyyDn/+Ws1akfzg7kd9xBjww52atUlyALQf2BoAWc7o=;
        b=ML00ELjg9SACUlqurvcoh79b/gmB3r4a2xg6xepo68PPYykguLqlTqWOXMHz6GS7PH
         yu+kDx1tYLl7i/2c5X7Vwd9WyZPkdJh3HyAWuEduTI9kpLtlu/YZiibZ+El8V0aosSIo
         Dl7Fk0MeS2tUGbmynC54RQ265KreV7ccBidxYEAmUAn0l92U8A15BsPPTZNdUpaglL5o
         HnkhA91Y9I3nFSvXuNZMHe+Na2Z/TiVmpFU1QhhuYYX+4ba0uov4LkuTPiyEJqdF+pmD
         ZQiHjT8Dud5i71bmMGuwQvueNdk5USEbafB9zT0hIMOrrLRZmCIK5i2Qd3bUNYeXGaKN
         CJ1A==
X-Gm-Message-State: AOAM530Uj5RFccWu/h4HaYC0Umx8HE9NauS0NZ5bgK6sGBjJeOo3Q+JW
	1sElr0ZVGC6vv3KZAtcEgKIrLrqQxPd9lw==
X-Google-Smtp-Source: 
 ABdhPJzK/1hTYXkRjTkTQu9pUoKpA1zN9XYoNGFcpsjtmsXRyVnteG+7uHTQWT7jjU3eGanP3CAeqQ==
X-Received: by 2002:a05:6214:3014:: with SMTP id
 ke20mr706807qvb.117.1643948205107;
        Thu, 03 Feb 2022 20:16:45 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 u17sm515424qkp.90.2022.02.03.20.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 20:16:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] lttng-modules: update devupstream to latest 2.13
Date: Thu,  3 Feb 2022 23:16:36 -0500
Message-Id: 
 <668983946fe705e85e9e726dfa551e6d6a50e306.1643947217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643947217.git.bruce.ashfield@gmail.com>
References: <cover.1643947217.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 04:16:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161339

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This includes the following commits since the last update:

    7584cfc0 fix: net: socket: rename SKB_DROP_REASON_SOCKET_FILTER (v5.17)
    6e9d0d57 fix: net: skb: introduce kfree_skb_reason() (v5.17)
    98b7729a fix: random: rather than entropy_store abstraction, use global (v5.17)
    c8f96e77 fix: btrfs: pass fs_info to trace_btrfs_transaction_commit (v5.17)
    afc4fe89 fix: mm: compaction: fix the migration stats in trace_mm_compaction_migratepages() (v5.17)
    4b1945d3 fix: block: remove the ->rq_disk field in struct request (v5.17)
    a88ee460 fix: block: remove GENHD_FL_SUPPRESS_PARTITION_INFO (v5.17)
    babc49c6 Copyright ownership transfer
    8c0aec7e Version 2.13.1
    533556cd fix: mm: move kvmalloc-related functions to slab.h (v5.16)
    2f0087ab fix: block: don't call blk_status_to_errno in blk_update_request (v5.16)
    9b092ff2 fix: KVM: MMU: change tracepoints arguments to kvm_page_fault (v5.16)
    036297af fix: KVM: x86: Get exit_reason as part of kvm_x86_ops.get_exit_info (v5.16)
    a029f2a3 fix: isystem: delete global -isystem compile option (v5.16)
    d82de6f3 fix: block: move block-related definitions out of fs.h (v5.16)
    4fabf854 Fix: syscall tracing: missing trigger actions
    38b35aff Warn on event registration/unregistration failure
    e26f740b fix: implicit-int error in EXPORT_SYMBOL_GPL
    c570be0d fix: Revert "Makefile: Enable -Wimplicit-fallthrough for Clang" (v5.15)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
index e7712e618a..4c5385b10a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
@@ -46,7 +46,7 @@ LIC_FILES_CHKSUM:class-devupstream = "file://LICENSE;md5=0464cff101a009c403cd2ed
 DEFAULT_PREFERENCE:class-devupstream = "-1"
 SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13"
 
-SRCREV:class-devupstream = "c570be0da77e963d77bac099d468bc0cd5f1bd63"
-PV:class-devupstream = "2.13.0+git${SRCPV}"
+SRCREV:class-devupstream = "7584cfc04914cb0842a986e9808686858b9c8630"
+PV:class-devupstream = "2.13.1+git${SRCPV}"
 S:class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.19.1


