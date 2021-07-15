Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.54.1626378004259933085
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QdfKYroJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id l17-20020a05600c1d11b029021f84fcaf75so6748682wms.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GlZDxty1fm6DgLbGfKOhwxTaC840PD5r23rOBxCNWic=;
        b=QdfKYroJY0PJzS+iTwtLwfAY5PdnCaQVW49nFGO8hwLCf8o6ez9UjDIjwkMOXKq9bN
         z5FxHwRfBf0TRoRyChIsdDGm7dkBAMJ4dG3WCUSD9WX/5NZs0lCiz0kjtoQwWyOLnt1C
         uubYR4Y5YO2M+4KWrrAIGPCBUl1HdCElj04EHf4iAys+uRSQq0YO4dykQDm9TiYLjh/P
         KQdOTZq5i08A4iIZy3cSFQ4zzWScEJzGXT2T+E5ttDY3c/eveia/pwAl+YVSvKt1U4xr
         2GpaujW5dqPOlDx1PUfyTLRitHZN8OZEIwXqrUVATrgp3OlIjPo5rVYPmAW6uQFnEREH
         pR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GlZDxty1fm6DgLbGfKOhwxTaC840PD5r23rOBxCNWic=;
        b=bTBWbFyWCuv1rMpVdJcEetZAS6DUnb4Xe9iSH35h6QJicSlyE68zyS5757JRSNhSqv
         6bIq5hH6PpbyqVYHk84Djrd+sye13MHVvVbH0Ng1hxteIxbHIKBOOU7CSgTI269QIeRl
         BUsujT7TPYUKmVTLEgGgbaAtO+Zrsfz70B5cRfMaa5sMkO+J62OSt5kqxCKESGXyYJIQ
         Gi0B52IW1Whc7OmCnLQSBo7RqTen37V8rPN3BNLy5aDVmqt8DWy8xf7hQWGotPFoYZGN
         3OHwdj+OG+CMwVpRj/Dz6/V6T6B03vda7rkRd/M0MdsCNj6+usRx/7HXsPkX7MWmwwCy
         k2RQ==
X-Gm-Message-State: AOAM533iWAz7Er7nptiRxoElNMvtvVUlHxtWfoSNs1096GLvIEc/w3cN
	HTj+abWnEL872IRxtlxSDxbgMwlxiOc7oA==
X-Google-Smtp-Source: ABdhPJxffQ+FXJ1E/dzoN/JeGx4vlPRutSXAF2V6vUz0ajSMZzjWITmp27lMQ+sQy1xBzMLu1ZyDXA==
X-Received: by 2002:a05:600c:2306:: with SMTP id 6mr12251822wmo.144.1626378002613;
        Thu, 15 Jul 2021 12:40:02 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.68])
        by smtp.gmail.com with ESMTPSA id p11sm7533809wrw.53.2021.07.15.12.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:40:02 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 6/8] overlayfs: meta-selftest recipe
Date: Thu, 15 Jul 2021 21:39:31 +0200
Message-Id: <20210715193933.66120-6-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210715193933.66120-1-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipe demonstrates example usage of overlayfs bbclass

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../overlayfs-user/overlayfs-user.bb            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb

diff --git a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
new file mode 100644
index 0000000000..5c7be7da97
--- /dev/null
+++ b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Overlayfs class unit test"
+DESCRIPTION = "Contains an overlayfs configuration"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit ${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs", "", d)}
+include test_recipe.inc
+
+OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/my-application"
+
+do_install() {
+    install -d ${D}/usr/share/my-application
+}
+
+FILES_${PN} += "/usr"
-- 
2.28.0

