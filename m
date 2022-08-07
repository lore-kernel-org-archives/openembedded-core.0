Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EB2C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 22:26:23 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.18968.1659911180137549028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 15:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mFfvFbli;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id ha11so7243333pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mYaEOvbmNNYUAJVBB6ZN7ERJoMRuzl5MrxtYYoYSZqs=;
        b=mFfvFbliU9tYPIWjN/wzv+6SlmCrQFZP7eSGIDupCC4mzb2ZW7vW/EbjhS1p/b2AUy
         uVhLcXuPoUd+rsK9MRHDAUtazDrhsy/wM1ZSzlVhLs2ceQ08pRK+uePfuiKW97Ikz4yE
         2n0BdjPGku94afo3NRQjzHXGqxxHhhMqJiG60D35/0tHPbqyQl3nDsjkn0y4+LtnRpxC
         FsSr+RBNofgFAyPiED6hUFXGpysBsUuwhxJ72AkKverzKTtKCEldn68T7PSctcVh/Q2G
         Vix/GFamlZFGuK+XBCLZPe8uQy0I7CKPbca7XYcEkHZoLS466Lq93k/mx2RpxY6aCNGy
         Prrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mYaEOvbmNNYUAJVBB6ZN7ERJoMRuzl5MrxtYYoYSZqs=;
        b=SRQMxA/6XLsJrpkW0/agUzIBMS1keJe8Qxg7rMrvNgmysFdfVLX8I5UQokFQEPzOVE
         lnD+q3WxXrs8G9ffZWR3iaTAR7rM+P5hNUgGgHnPsZ8jdeWJ+Quw+La9kr8DbV/O9aEp
         5jNB05SU5uwl/hbbo2lDhPUv984hBJ3Hwlk1rF5OSR09vfnrxK83DaBUERoBBHSdhr2h
         FEx/yff2eOzOP96g9Hi90AjEZYu/aQnLbBZbEXezvvGwqfLzOMXileYWL5pSd2X7CcpZ
         /EculD/XdVWW/D5LhE3bej9pikovu3mwTAX44nbDaeOaB4hJh893d87Rn3uspGfMwd4W
         hebQ==
X-Gm-Message-State: ACgBeo0qReChrz4ZkJIrYCY1bpQiwftj/XhdQlmlmG8okGJE20XK06st
	VcFuNZgpAWQZhfNZNUwKIvkg9KjAGkU=
X-Google-Smtp-Source: 
 AA6agR5N6gucYlnMnpW0C/16kwbLNvjEChE0QgSkM2xrRSOyrGkTY5dHPGJgEDzfiba7g8tO/0Q9yA==
X-Received: by 2002:a17:902:ccc4:b0:156:5d37:b42f with SMTP id
 z4-20020a170902ccc400b001565d37b42fmr16166846ple.157.1659911179151;
        Sun, 07 Aug 2022 15:26:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b0016d773aae60sm7181776plf.19.2022.08.07.15.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 15:26:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] util-linux: Upgrade to 2.38.1
Date: Sun,  7 Aug 2022 15:26:13 -0700
Message-Id: <20220807222613.1173589-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807222613.1173589-1-raj.khem@gmail.com>
References: <20220807222613.1173589-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 22:26:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169009

The individual commits in this release are at [1]
and Changelog [2]

[1] https://github.com/util-linux/util-linux/compare/v2.38...v2.38.1
[2] https://github.com/util-linux/util-linux/commit/e51a82836a47723669bf046e24c51d5eb051c15f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{util-linux-libuuid_2.38.bb => util-linux-libuuid_2.38.1.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.38.bb => util-linux_2.38.1.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.bb => util-linux-libuuid_2.38.1.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.38.bb => util-linux_2.38.1.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e7757121588..416550a6b20 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,4 +38,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-check-for-sys-pidfd.h.patch \
            "
 
-SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
+SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
diff --git a/meta/recipes-core/util-linux/util-linux_2.38.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.38.bb
rename to meta/recipes-core/util-linux/util-linux_2.38.1.bb
-- 
2.37.1


