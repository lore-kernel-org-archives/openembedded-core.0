Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3D3C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 21:03:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.1807.1636751030720332947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 13:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z3wf5/O+;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id y8so3935350plg.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 13:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6X+DM7G/J4BeCCA7xohCyGy6NOD1QSQYlTgwo7zaa4E=;
        b=Z3wf5/O+L8qIVL2vyujRC3zFv1/tZKURfv/cRCEc0CINB4+Y/qUsQcXntG4d+abnw1
         ubuLmDVen3opgcr6AqmERuYI0T5sy7+0uTAuZCTlCig6P1Yavz3fKkvXxsQiwcktbUkj
         Lh+RMQAKShALgwSprmEajzuv8yuzOlBaDzECQt4OE8i8MAs40RvAFr8DgdGSXrxW8TZD
         SUXPv03lX8r65M3jCumak/t4jYbNgc6Ll2c8we1ulflw4yigSgz4cKqP3qREBAtVDL3u
         L0UCaTBi9P7aLFn853Ng8uyyCcLPoBNJ2ewXbcUilG2KcMOtPF+IKPn71OXWI+YW1xfM
         0HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6X+DM7G/J4BeCCA7xohCyGy6NOD1QSQYlTgwo7zaa4E=;
        b=a3fh6T5x+6GLSwR/YvHiRLpvheyZ4TUkvUqunYPGcVoQIEtTbI+qE0TRE0qJ8jXCBw
         8M0YsMM8S6/LdEibZCJnRKGEDxD129pth69Qhgv65mwiD61raBXPKItH+E+M+1fwVtov
         YA8aqWmqADSP0kQAxOyZBtBntEpntVGcp94KVMngsjGgNN0qCQN97b7nZYL/LlhoZV9z
         p5nDWlXCmyJDNbUhMscCRmN8fiTyuP7ErVEHyEZ5uUgaNN2MV1JEDPQ5lNVLX99BYlVq
         +A1P1F3HRq3wI/gd26b8WSbxJQg42nrwhJuiFhPqm2cHWXq3K3rOygvLkfmwqIl0FOcL
         tcMQ==
X-Gm-Message-State: AOAM533leWyhIL+rlUb2QEoLUN+Vlfl9YTt2MMvvQiByL9e1aTganQOZ
	FJXqB/zw9MbiehD1PIo7xMSSLeNwZdA=
X-Google-Smtp-Source: 
 ABdhPJzUal38L9l8NWMdQ9fTvQ8FdGV/PPFHwf9XOcRy+bNPUE4YlV2zYWVfftfneywNO7SryaJHGA==
X-Received: by 2002:a17:90a:bf8a:: with SMTP id
 d10mr21146607pjs.67.1636751030102;
        Fri, 12 Nov 2021 13:03:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 w24sm5705310pgi.81.2021.11.12.13.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 13:03:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] Revert "python3-pygobject: do not supply unknown g-i
 options"
Date: Fri, 12 Nov 2021 13:03:45 -0800
Message-Id: <20211112210347.2004455-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112210347.2004455-1-raj.khem@gmail.com>
References: <20211112210347.2004455-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 21:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158233

This reverts commit 9c0cc06a3d857124c0e1c1c9342f79ba5a3b10bc.
---
 .../python/python3-pygobject_3.42.0.bb              | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index 7ff7c5b4dd5..461ddcfe319 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -6,19 +6,10 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase distutils3-base upstream-version-is-even
+inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
 DEPENDS += "python3 glib-2.0"
 
-# Generating introspection data depends on a combination of native and target
-# introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
-
-# Even though introspection is disabled on -native, gobject-introspection package is still
-# needed for m4 macros.
-DEPENDS:append:class-native = " gobject-introspection-native"
-DEPENDS:append:class-nativesdk = " gobject-introspection-native"
-
 SRCNAME="pygobject"
 
 SRC_URI = " \
@@ -27,6 +18,8 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b"
 
+UNKNOWN_CONFIGURE_WHITELIST = "introspection"
+
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
-- 
2.33.1


