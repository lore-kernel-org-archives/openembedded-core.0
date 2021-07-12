Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.12150.1626101940052320379
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 07:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=erCRZlcH;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id u13so4628539lfs.11
        for <Openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GlZDxty1fm6DgLbGfKOhwxTaC840PD5r23rOBxCNWic=;
        b=erCRZlcHobBLCHddIva588Igt11D9ydBvV7W3+S3kfe0RSWc7zs5pPLzeGAe3YThzg
         j9phR2KciBssnMs8q6J2v9vUBqM9Yt6lntpTf1C3cGYCw9pU3jtr0ytqe0FnotLE8DEy
         CP47neNA6jYoTNDhq+dTZy7H7FAjcU2NGOU7+30wtGWYaqoaPGFnDrIQuF0nMz6InyVq
         KXw87JcmHvY/WCZ//mstwZsDqLDI0bLbpyq6B4zFzbMn/OwnDbJP6szMZtXVjkbscbm/
         UHoNA6M3lt0friEzqOJ4sVAtFhHjsOLMpfDIY6qPxAMlXCrs+8I4v4OsF56CJnlKntvq
         r1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GlZDxty1fm6DgLbGfKOhwxTaC840PD5r23rOBxCNWic=;
        b=Ph++RjHzq7AoTY1D7A3Ofvz3ZmNIf3PI+vSmT78iICrwHyYHnjgKvr3wsEwoDXlfKU
         ZWfi+xTcfqXLJvmLxuYbWC5keNDg7Cna5BDkjmJpkDKKuc3OCDx8Hhk5PTs01LHD5elD
         K8Q7I6DNCVGG/Cnxdg4EKMnAGG0IeKv5GjOAPIzconT6gIcZbLAIX7aUhPnzVm6HZvLl
         b3JK8Ow2R/Rs/39ec/P7IEFFh5oCYcKZLH/rzyX7pzsit6ON6Ccsm/Pk+EsA0oXlA5xr
         hInmAD0ApbhiZpKIWXrpG7s4adapulgUv4yk0zdHl4uq3Czkmq7/0tQMIZJVV+xuzkI6
         e6tA==
X-Gm-Message-State: AOAM530U9VnCSSL3pui54QwFW77SHhSE7K0XIZveS7x3/zHTlnLHbmd3
	eOz/Cpib1pY3dptYR+UhyIFLxuSn9Thw1Q==
X-Google-Smtp-Source: ABdhPJwgd3Nu6au8GzpKKlEFAeaxvv96C7fRZSxU/B0OV1W0pFEZRIUfV3oB4ud/WQDBiZdqgz8pEQ==
X-Received: by 2002:a05:6512:33d0:: with SMTP id d16mr32113279lfg.311.1626101926915;
        Mon, 12 Jul 2021 07:58:46 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id u10sm1529817ljl.122.2021.07.12.07.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 07:58:46 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 6/8] overlayfs: meta-selftest recipe
Date: Mon, 12 Jul 2021 16:58:38 +0200
Message-Id: <20210712145838.120424-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <169101B9490F777E.4752@lists.openembedded.org>
References: <169101B9490F777E.4752@lists.openembedded.org>
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

