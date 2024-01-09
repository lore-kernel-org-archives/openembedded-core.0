Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A62C47077
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 01:10:07 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.6763.1704762603458733023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 17:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OT75l6aZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d5595997ffso137375ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 17:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704762602; x=1705367402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3qvWS/eCCPMre7Fv0Exr+Dd92FzYOXR+obPvIyUDp4=;
        b=OT75l6aZ1MrAVlHl1yDQyeSedQjPAkTBt737wqiLOCK+0JUSgyp6HZSuQcnUStKHmt
         K+haEp/LIrQwL6GLhGDRvETeV+phykZQSrFBtlqts13AjI92lKBAnEXWodZLPFUEFTxm
         JYdPt5Zlb4szLpTwVIes1GTjciXqslcrfV7kRQ+c2DrDnPfxOeGVSR6it6AmNjBfe0hS
         DjXNb61LnvAZiOxE5Nkdr4uMoNH8q1whpfWwzGNMp1eyZCupfGJ0WXPGIxKdqDhJkWNF
         NWQWbsEhNd7TMnvkLCDy2pugDpJUsj3GFlg+HU6QUtBb2W2zz9VcDvQCaDQ0HSeQg/yn
         RiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704762602; x=1705367402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3qvWS/eCCPMre7Fv0Exr+Dd92FzYOXR+obPvIyUDp4=;
        b=v8mOajtXdxCGSi0S0i1Vxmf1UPoOOfkQvkFu+9Ai/c/6HnBNKgYl8yX1uKlV9oUAzP
         OZ4LOH78EjE3nE2uivPAa7dTy3YVS61YixMN9EPDneo5e875oT/U9SUbC2N+95Wfca5A
         sdlcyAx0RU75VCI4zgO2fCKl4gc5O8uoqM77Ypuvj8jQmRlFu2ftCzafxS4DNCEDkzUA
         Mvk+LS/aWfd0gMJihJfWoP3I4wMD6Q/fvC2FU5ybf2FiFkmMkOEnHqSKdbxFi7p7GVbS
         l4AnU/M0lHSt+0cSuPsqgL+4Vd4EzLSWTmwvuommFYrhQzVi/5ok/+Z/ng79+Kj4nVED
         X4Xg==
X-Gm-Message-State: AOJu0Yx47hQQYyxxWWvEzYWOFqsFB3pZ9XGOLO89zgnizIHtj5XHbc18
	5XUFFSKDwW6UFlv7zwIg+uyz73WsL1o=
X-Google-Smtp-Source: AGHT+IG5BCnLBPii4A/2FoS1rvfCS7c4CTY3Z1POp3cMktJ3VBRTedRgrVnuj0S/Bs/p88Rps2D0wg==
X-Received: by 2002:a17:902:ecca:b0:1d3:e503:5b55 with SMTP id a10-20020a170902ecca00b001d3e5035b55mr9443012plh.2.1704762602177;
        Mon, 08 Jan 2024 17:10:02 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:63f2:cfe7:4b90:23c])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709028a8400b001d4c9c9be42sm492012plo.151.2024.01.08.17.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 17:10:01 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] kmscube: Change header file to <GLES3/gl3.h>
Date: Mon,  8 Jan 2024 22:09:49 -0300
Message-Id: <20240109010950.3302352-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 01:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193438

From: Fabio Estevam <festevam@denx.de>

Since kmscube commit 96d63eb59e34 ("kmscube: Add gears mode"), kmscube
fails to build on platforms without <GL/gl.h>.

Fix it by changing the header file to <GLES3/gl3.h>.

Reported-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...rs-Change-header-file-to-GLES3-gl3.h.patch | 33 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
new file mode 100644
index 0000000000..6843a662f4
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
@@ -0,0 +1,33 @@
+From 0651c4edc9909832ff2acbbf170268f34e36616d Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Mon, 8 Jan 2024 15:00:01 -0300
+Subject: [PATCH] cube-gears: Change header file to <GLES3/gl3.h>
+
+Since commit 96d63eb59e34 ("kmscube: Add gears mode"), kmscube fails
+to build on platforms without <GL/gl.h>.
+
+Fix it by changing the header file to <GLES3/gl3.h>.
+
+Reported-by: Martin Jansa <martin.jansa@gmail.com>
+Suggested-by: Martin Jansa <martin.jansa@gmail.com>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/merge_requests/51]
+---
+ cube-gears.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cube-gears.c b/cube-gears.c
+index d5b7a5f9cbef..cb538ecc4aee 100644
+--- a/cube-gears.c
++++ b/cube-gears.c
+@@ -31,7 +31,7 @@
+ #include <sys/time.h>
+ #include <math.h>
+
+-#include <GL/gl.h>
++#include <GLES3/gl3.h>
+
+ #include "common.h"
+ #include "esUtil.h"
+--
+2.34.1
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index aab582281a..63f29fd169 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -11,7 +11,9 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
 SRCREV = "96d63eb59e34c647cda1cbb489265f8c536ae055"
-SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
+           file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
+           "
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.37.3


