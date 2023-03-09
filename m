Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FF6C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.16133.1678375218356977203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B9jfoZ1o;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id c18so1401360wmr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFgM04h3gYXMVaWn5v0bgI+KkyeNTk5ZI1clSnyBG5U=;
        b=B9jfoZ1oovjKFBkMk5BPlPfayj4IkqSK56TkZLv6nBHyea9q7Zk4a4+IaEmYX1pVYX
         c2BXBLnj619FBS1LpyL314MM8g22TU8nvlvhBdftaf2jQOt6gXHvsChxauMmeS/ZR7OW
         j+Dcd/a/HJQahkcvqNTSu5AT/AmzTEfUzmSsxvlvEHVixUM8AcsCr3b5WVcNvIv2G72m
         mz1A6K2MWghowAFZmkPZhKMebV2c8nVBkOSJdXR4GV+ybFAUTPHETWVcjE5SPmVEq8/E
         VaDIfvKLDbZrTmkfZsGuQwgNUZ/Np4H4rndsvZ0vNh/+QRSwLuqG4IU6KSu08A1DBrVm
         E6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFgM04h3gYXMVaWn5v0bgI+KkyeNTk5ZI1clSnyBG5U=;
        b=VHRkCikt5C9kOh7KTvUMHvuIAE8oWG1YoPH/xdih26cBC5iIujSKGqOCaq9JCX71/O
         WUjbzGdo7lSq2PxGpRmubY600jNoDzpBTbji6E/OEBndC4F1YCb+GB8Vc8mOtgugShLL
         IROQ1dik+SQ/BTWMSaUUdAdpAaSvncUSYY4tkMHicMkcJLUKmzgmnzrAlEEBmm2cwVdz
         MFuAaIK58LDWDkPjLLJRDA3K163uK4viTEjnRNmJYBFlFA+0PKyPpyYrLjDlZVNzczIC
         WnXe+Gb3mcBAxxBeYGjVUPPhoYmclATiI7cDt8CGiFSsXfWLGt46bz7zLp2EWhqtA1C0
         tXiA==
X-Gm-Message-State: AO0yUKU73mHlS1jSgfkTRO7dZqMmZjOR5CBv4igUqJLcZ8jU0SAMLk7e
	HRE0+x9ZM5Lu1Xz0Xnqi85n2jzH1kPI=
X-Google-Smtp-Source: AK7set/d9h9rtwOb/aNLW2uh6UYy2ff799sdR65jVwgi1wl4UeNUfUJDsYOe5Qosl/gLCgYgfU142g==
X-Received: by 2002:a05:600c:45d2:b0:3eb:42fa:39d5 with SMTP id s18-20020a05600c45d200b003eb42fa39d5mr20467904wmo.29.1678375216822;
        Thu, 09 Mar 2023 07:20:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/26] stress-ng: remove obsolete patch
Date: Thu,  9 Mar 2023 16:19:56 +0100
Message-Id: <20230309151958.3619193-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178250

Upstream has disabled gold support altogether:
https://github.com/ColinIanKing/stress-ng/commit/e65f517917fc682784bfa1b3cb53de3f3263b094

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-via-makefile-to-enable-gold-linker.patch | 35 -------------------
 .../stress-ng/stress-ng_0.15.04.bb            |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch
deleted file mode 100644
index 6742e0d256..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 5d6fa06b3104637289178a471dd28d7bf3e14e76 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 3 Jan 2023 11:00:09 -0800
-Subject: [PATCH] Pass LD_GOLD=1 via makefile to enable gold linker
-
-Current logic prefers gold if a toolchain has gold linker installed and
-does not offer any option to chose default linker which might not be
-gold linker. Its better to pass this control to user instead of auto
-detecting and deciding.
-
-Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/251]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Makefile | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 7a969aba..583ae04f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -93,6 +93,13 @@ endif
- #CFLAGS += -Weverything
- #endif
- 
-+#
-+# Use gold linker
-+#
-+ifeq ($(LD_GOLD),1)
-+LDFLAGS += -fuse-ld=gold
-+endif
-+
- GREP = grep
- #
- # SunOS requires special grep for -e support
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb
index e891bb738b..74d8356812 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb
@@ -6,7 +6,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
-           file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch \
            "
 SRCREV = "b9a437ec790ad4bcc71d31b2df39d4a601c55fa8"
 S = "${WORKDIR}/git"
-- 
2.30.2


