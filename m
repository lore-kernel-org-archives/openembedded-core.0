Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63145C63797
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:49:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.16695.1675547335931167872
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ScTM0/Om;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id jh15so8627730plb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwvXkgRtd3PXf8B6+z+5/ui7pOgXjgCYz7C1e1S8Hf8=;
        b=ScTM0/OmA3EzxA4s4P9t/9tAdmVmOoDIyJMQhS11gFONxVCuDQadD1ESPQRvyKtM1r
         mewpUGsYxJoV9+ly0ZAHYHl3kTjLMk5rv940htcOryJTKOWLxpVe7yAM/3Wdaz6bsCiJ
         b8NmewUY5J6QrqIsEyQ9IyFX5drU27KDuXTjCIFbl7tP2NDvjYQGi0RVrwGPBoiv+5I2
         iauLXyXllO3GS8vu4ybzfk6D2g6RC5q4SJZDQxcoNdxrp5DKSOjtWYKOt3Wu3xU4zv2w
         /d6kZk6NnYaT4Z5sAWfHmie5EirpKPxPVrXj0Px3LUZG7YR4zxbN7a7hP6VptGhNfnTF
         hIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwvXkgRtd3PXf8B6+z+5/ui7pOgXjgCYz7C1e1S8Hf8=;
        b=5BQF1uQDRrIApsFrvZu/0YpiN4yO/A+cWkSohhxLcdjKuS9FrjpE68mWyuCxoRLlpn
         WE1zuZBFfxwO7GqBGdMZ1TbjN5q6BBqasHviPYHBUMUs/5dgc6IicRYb3W5tHtoxG1bZ
         7h3WH/MUJFF2TGC2iRfPA4YwDI/Uw5DySlOLWkfmSQO8L4XglvZ1mpMCQ5l4jn8SG5qR
         Mf807d0fMFtSBB1Tr2hYM+op5U5JGI8B34ckXepX5Z1p6FI/i1F+2z0M4ZhdSLnv5nHL
         6FdtZxHR09ZorRWVtMnj3vseYXOB5/CARhU5c5ruZo5zosKAEN+sNBfo1IBsEqr2HgsZ
         POHA==
X-Gm-Message-State: AO0yUKX21yiJaRufVDX1nVZntRYAQUGz9jCMpdlmcP+pYNMPT1ko+oQm
	xSDuhfsThG79iXWAZREQBgxAzHk3TjNMvDRb4zk=
X-Google-Smtp-Source: AK7set8A8kVnsmCyChzxWCbCT8y2AtY4nCLLJRQDr/fsAiY4p0tzBL/0V5Hf12VR9fOmb9sE7+TkSQ==
X-Received: by 2002:a05:6a20:8c05:b0:b6:9c33:c3c1 with SMTP id j5-20020a056a208c0500b000b69c33c3c1mr13624033pzh.10.1675547335015;
        Sat, 04 Feb 2023 13:48:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.48.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:48:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] lttng-modules: update 2.11.7 -> 2.11.8
Date: Sat,  4 Feb 2023 11:48:30 -1000
Message-Id: <fa1056f62017ea764b494c41cc7cdaefe0a80fb6.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176772

2021-02-17 (Random Act of Kindness Day) LTTng modules 2.11.8
	* fix: Adjust ranges for Ubuntu 5.8.0-44 kernel
	* Fix: do not use bdi_unknown_name symbol
	* fix: memcg: fix a crash in wb_workfn when a device disappears (5.6)
	* Fix: writeback: out-of-bound reads
	* fix: Add one digit to RHEL major release version
	* fix: Add one digit to SLES minor release version
	* fix: RT_PATCH_VERSION is close to overflow
	* fix: cast LTTNG_KERNEL_VERSION/LTTNG_LINUX_VERSION_CODE to uint64_t
	* fix: UTS_UBUNTU_RELEASE_ABI is close to overflow
	* fix: sublevel version overflow in LINUX_VERSION_CODE
	* Namespace kernel version macros
	* aarch64: blacklist gcc prior to 5.1
	* fix: missing include for 'task_struct' in fdtable.h
	* fix: genirq: Restrict export of irq_to_desc() (v5.11)
	* fix: block: merge struct block_device and struct hd_struct (v5.11)
	* fix: kprobes: Remove kretprobe hash (v5.11)
	* fix: file: Rename fcheck lookup_fd_rcu (v5.11)
	* fix: block: remove the request_queue argument to the block_bio_remap tracepoint (v5.11)
	* fix: block: remove the request_queue argument to the block_split tracepoint (v5.11)
	* fix: block: simplify and extend the block_bio_merge tracepoint class (v5.11)
	* fix: block: remove the request_queue to argument request based tracepoints (v5.11)

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{lttng-modules_2.11.7.bb => lttng-modules_2.11.8.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.7.bb => lttng-modules_2.11.8.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.8.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-modules_2.11.7.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.8.bb
index d95613ba97..84d8daf8d4 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.8.bb
@@ -17,8 +17,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0019-fix-random-tracepoints-removed-in-stable-kernels.patch \
            "
 
-SRC_URI[md5sum] = "d1f1db78fe6fb6ea159c6e957a5ea6af"
-SRC_URI[sha256sum] = "d7b7170e6af8c5a74dda06d9cf1afaac2519b6d8b7e823acce5bf7b23857a55e"
+SRC_URI[md5sum] = "0aba7e5ca53e756875605221f7e0dec9"
+SRC_URI[sha256sum] = "77d03546bbb7668b146f2261c646d503b7b601dc7072a5359d729d40f13598a1"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


