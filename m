Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85957CD11DD
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 16:17:56 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.411.1711729066191677968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 09:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WTkuoyNn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.174, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d6fd3cfaa6so29729011fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1711729064; x=1712333864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8FYBB6qeXMA8ThV8zpPnSUgwdRt4Nqa6xleuMQSkag=;
        b=WTkuoyNn+uoQx2O1ZYttTUDWvTXwzUF6bR81bW25CIG9OQQ6RmbFqJK0++k2vcZuZV
         ioa9seKi0LWxY2nLFjOwYASDBBN8FlMKm1EwZOIkSuZLWFbq9T0dHn7b8Qwu/6xS7gLE
         P2Er5EyhEg08+hu2YYKd9yo960MxfEX1rLgBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711729064; x=1712333864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8FYBB6qeXMA8ThV8zpPnSUgwdRt4Nqa6xleuMQSkag=;
        b=uPdt3Hfnc3vbP5Zd8+mxUkVHg6jj9/bUvvgCEEhBfQTEtebtoETqw4IwJoeSleEa4C
         eTCf/RMA7kCGnFelDz3XMOzyvkTVljoMJ9L4NlrxJyljKfm+lngFzgpUvSzQUOsTJ4o2
         O11hpoGQE67Jvw944fn/tYgPV12j3o4trHRzusj1jYdx843GJgOpIwQKV2lEulE/Auy/
         7mkI8TioVz6/067j4eNKd779Unsss9ldEcAerIZ/FxrzPhXUMySzqMXhNXaKeqCWMgQq
         9uCDv5vwz+78qY0lpxvnyuHZw0Ft7a0OrOm8bHSpr5DJIrGrS/KUUwg5dsV1FixBh4+X
         5Bkg==
X-Gm-Message-State: AOJu0Ywpb5wa6aIj6IPkVLzmrcuDUCgmDtoknkyPooNQeS4IK0AOL1tV
	8WBOo5WbGBHWcLyrB91yNV+3FrxUZ2aHe2k2wIxu+sF1i6sFFYEnk/tsR8R3FzkH6Ghn7wshK94
	N
X-Google-Smtp-Source: AGHT+IFRkScIzIdqcDhAU1o/6RfjRahjsmcD0YfWVNHIBmOn3Vc1s9/bSPblx/gtQ31aERMb/brBaw==
X-Received: by 2002:a2e:8004:0:b0:2d6:ee9c:7738 with SMTP id j4-20020a2e8004000000b002d6ee9c7738mr1560731ljg.8.1711729064050;
        Fri, 29 Mar 2024 09:17:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fdd:6f2d:e3d5:9b0e])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c311000b004148670f9ecsm5954702wmo.23.2024.03.29.09.17.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 09:17:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] util-linux: Add missing MIT license
Date: Fri, 29 Mar 2024 16:17:40 +0000
Message-Id: <20240329161742.910250-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 16:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197640

The MIT license was missing from the license list for util-linux. Add
a patch, submitted to upstream which adds the missing license mentions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux.inc   |  5 ++-
 .../util-linux/util-linux/mit-license.patch   | 45 +++++++++++++++++++
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/mit-license.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4e9d22f2690..d96f00fbab5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,14 +6,14 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause"
+LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
 LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=6b0e0a2320e66e62eef9b8149a6faec4 \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -29,6 +29,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=6b0e0a2320e66e62eef9b8149a6faec4
 FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
+           file://mit-license.patch \
            file://configure-sbindir.patch \
            file://runuser.pamd \
            file://runuser-l.pamd \
diff --git a/meta/recipes-core/util-linux/util-linux/mit-license.patch b/meta/recipes-core/util-linux/util-linux/mit-license.patch
new file mode 100644
index 00000000000..afbec98f189
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/mit-license.patch
@@ -0,0 +1,45 @@
+From 5b8fab1584017d9d9be008c23b90128bba41a7b5 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 28 Mar 2024 12:16:57 +0000
+Subject: [PATCH] README.licensing/flock: Add MIT license mention
+
+Looking at the license text, flock.c is under the MIT license (see
+https://spdx.org/licenses/MIT).
+
+Add an SPDX license identifier header and add to the list of licenses the
+source so everything is correctly listed/identified.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2870]
+
+---
+ README.licensing  | 2 ++
+ sys-utils/flock.c | 4 +++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/README.licensing b/README.licensing
+index 4454f8392a..535ad34813 100644
+--- a/README.licensing
++++ b/README.licensing
+@@ -12,6 +12,8 @@ There is code under:
+ 
+    * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
+ 
++   * MIT                - MIT License
++
+    * BSD-2-Clause       - Simplified BSD License
+ 
+    * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
+diff --git a/sys-utils/flock.c b/sys-utils/flock.c
+index fed29d7270..7d878ff810 100644
+--- a/sys-utils/flock.c
++++ b/sys-utils/flock.c
+@@ -1,4 +1,6 @@
+-/*   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
++/*   SPDX-License-Identifier: MIT
++ *
++ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
+  *
+  *   Permission is hereby granted, free of charge, to any person
+  *   obtaining a copy of this software and associated documentation
-- 
2.40.1


