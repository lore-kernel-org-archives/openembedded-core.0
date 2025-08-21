Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B952CA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:45:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.3228.1755758734540430295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBIHooRZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24457f5b692so6804115ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755758732; x=1756363532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+DFe0v22BPxZL+WKHHFhqBj8d/ZgKcYCL+r7fdpH8M=;
        b=OBIHooRZSShnXq9qS4lZswcJMBUnJa8iec0HIJXWSwh3WT2u3I0D8aKogRTcERlZ3P
         8RULiQlY13anbfd/3isi/YRJng5tpqVaK7ioBA47Vlfm0i/NS84HPZfEYs2aeGNuLsGA
         ZILfrhTQTx+vq8Kb3bM51VT/aAP54u9QSds9SNvzX1WLMA++PseNnK7CQfI61glL+mYe
         Oak15WK57YePdOImny+h5zLJlTrfml0K1edXGtZMcdfAwOPeLFbkZeUPB/DzE6ND5S+k
         xfrD1tyM3NgugLacpX1fvdeamc9KQSxTLEAt5Xctz3rbPdD+SIgZD+mnOnmVv6Y6au34
         Xuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758732; x=1756363532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+DFe0v22BPxZL+WKHHFhqBj8d/ZgKcYCL+r7fdpH8M=;
        b=Q/fQdT7dtvHJJikwrktm3ugo6g3Wk8BjaNYejxz5LPoTJet9K9D1s2R8xbBDXXIuqX
         MxXWnQccHM170JjO+rv/VMJ/wYcZyk79zl3s/PyFqET4D4MM3b3NAfadNYQf8/OILeUb
         r0vv/AxboQNHJmHqZKrsqSVeA9HI9sWLEwhjZ2dNEqOl3+vzTLeeNNil/u+sqiAa8kcl
         ETUTLDnfK3xVkwQRqYeimjvSmwrae3RbXvIryR07h3ysBY/iK4If5mhkNI+vFu2ddUHK
         ykj4ocREnAuRUa+M8m//BFGBbzTRlM23IXHMHvPE15qkyRdJfJXLd1SOhl8kTRilH/Os
         XTqg==
X-Gm-Message-State: AOJu0YxwsIgr/DGHCZ5iCWeClhjEtaFv/iQ8s2VB3j6faMRc6V0yTHS+
	th/M5vQzOwjyHKmXXw3w1sdFMTJwZvCcgLheeGH/9xQgjMTiWXTvuz3T1cBXTYja
X-Gm-Gg: ASbGnctxjzhOYWMT1dAC3VcqF7v+3uxq2Igl0H8URR7qpBR8H/+5rdn/vzADeGVBrzo
	dAgcbUQqhcAJcNnWhEFaD2VwA2zDcuLDf8KgHV4hu3P655yEycB5rPLSlzY4pgelGPHWHGGFZlE
	Jf0MSSXzMDA+FcP6owN5iRkRQSsSGArIYGu8hkSH7N/PsM4Vl2QXDbvKxPYZuu7zI9ThWRQm3gb
	VaDV/mRFpxhRqD1MUCRvFw8kC+npEatyGOutK2qy7aWO3j8qkClpdwCP6wuTwUkQh/TGbNEvf/N
	xTKLd8ILPXh/FrrCJdnarIAP67OMgHl+AXudWGOqagjCcm1njpAh3HvFMpxA5LjyMERwqj7ZbaA
	7BC6J0iy/gSRKBRhUofyMGWmmTziht0AG
X-Google-Smtp-Source: AGHT+IGQn69CW+1cbLEfMuxN0G4y/bsESsnMZ1yOvCEBb3XVFwL7EG+nWSVWGnxgmkY2xNkNCGd4fw==
X-Received: by 2002:a17:902:c945:b0:246:61c:a67b with SMTP id d9443c01a7336-246061cab36mr14709015ad.58.1755758732252;
        Wed, 20 Aug 2025 23:45:32 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d778sm45876685ad.49.2025.08.20.23.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:45:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/9] lltng-tools: Fix build with lld linker
Date: Wed, 20 Aug 2025 23:45:19 -0700
Message-ID: <20250821064528.754633-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821064528.754633-1-raj.khem@gmail.com>
References: <20250821064528.754633-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222211

liblttng-ctl is exposting undefined symbols which are provided by
libcommon-gpl.a and is not linked into liblttng-ctl.so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...p-index-allocator-symbols-from-versi.patch | 43 +++++++++++++++++++
 .../lttng/lttng-tools_2.14.0.bb               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch
new file mode 100644
index 00000000000..3a535470dae
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch
@@ -0,0 +1,43 @@
+From adafa15a0ea145e1e98f68e2a56512e83f1f6798 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Aug 2025 20:06:21 -0700
+Subject: [PATCH] liblttng-ctl: drop index allocator symbols from version
+ script
+
+The lttng_index_allocator_* functions are implemented in libcommon-gpl,
+not in liblttng-ctl. Since liblttng-ctl does not link against
+libcommon-gpl and does not export these symbols, referencing them in
+liblttng-ctl.sym causes link failures with LLD:
+
+  ld.lld: error: version script assignment of 'global' to symbol
+  'lttng_index_allocator_alloc' failed: symbol not defined
+  ...
+
+Remove these entries from the version script to align the exported ABI
+with the actual symbols provided by liblttng-ctl.
+
+This fixes builds with clang + lld.
+
+Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/15156]
+Change-Id: I27f40f3d38af7014cf5356230e06aa291c9a3c5f
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/lttng-ctl/liblttng-ctl.sym | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/src/lib/lttng-ctl/liblttng-ctl.sym b/src/lib/lttng-ctl/liblttng-ctl.sym
+index 27900ca44..641084750 100644
+--- a/src/lib/lttng-ctl/liblttng-ctl.sym
++++ b/src/lib/lttng-ctl/liblttng-ctl.sym
+@@ -336,11 +336,6 @@ lttng_health_state
+ lttng_health_thread_name
+ lttng_health_thread_state
+ lttng_ht_seed
+-lttng_index_allocator_alloc
+-lttng_index_allocator_create
+-lttng_index_allocator_destroy
+-lttng_index_allocator_get_index_count
+-lttng_index_allocator_release
+ lttng_kernel_probe_location_address_create
+ lttng_kernel_probe_location_address_get_address
+ lttng_kernel_probe_location_destroy
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index a3faf1e758c..5bb6033b12c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
            file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch \
            file://disable-tests2.patch \
+           file://0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch \
            "
 
 SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"

