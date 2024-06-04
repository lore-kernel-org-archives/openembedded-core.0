Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D96C27C50
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 09:03:50 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.16706.1717491827806862417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 02:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dx8e7ql2;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a4ce82f30so3320278a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717491826; x=1718096626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k477EjYoWDygJ7wvyShHOa/FcHZlmkcnIvO6T014jGI=;
        b=dx8e7ql2zIa6cbbnxL2jd3eNWu6NPWtCDCl8Jq+Gl/1ISABLVNxxV7RgqelCqz0BzZ
         qab17AHshDhSJkT5aNMiOONI3Ngr7HL99d/ske4EmaKgl3Md6qBHZ3dchLNvmqVDbyKv
         kFy7rEcrPfwa+jLLo78Sv6NWm4yl/MCFW7ShnPybPq1n1jQoJ78eJ6FoVzA107FFVXCj
         G0IXVBm7QHXknPTPeB2Yot0JWJCgH8ioCK6bbsH9utQwX/30CMgpFK0mHEztT4+wa51u
         JhGRtPNp2xw0m6vFFNfFCZYcs3+26MYnQ+urt15K3z+M6CarI1xnv4A2eDkzEpgf7HKO
         yW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717491826; x=1718096626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k477EjYoWDygJ7wvyShHOa/FcHZlmkcnIvO6T014jGI=;
        b=xK59h1LPDu7ttkaglKI0BhpfdQbc1qoP4ZeCm2G6uAEtNDcQK2F8vtj7jVgko1Byzl
         uW6uLx1s6Wz/yx1hvijBFviRGBgCC1aPDAuCk6ZUwpatU1+x4exxg5V8E3VPd4BQmF10
         tQwNfUeQq4bcnMf7ioitJJ+OAw1plvzOGIOSHN0ke0zIVnVzCHmptqNLzWF/4ClUNNQa
         P3RKBLDRx42Y3aHDr88HonJb1yi1P/yEvsNjdA53u33qoXP+xakw2zHoLnNP7hjvKDJQ
         KxULgDumGSdp56O/qr3llMIULC7R15Z1uUi2vPwdMiRcTJBDfSHd9eCQp/MZB+tqNjYT
         a0+A==
X-Gm-Message-State: AOJu0YzcFUHmWfNobpS9ZH/zaXzMANzw4VoCA4HxV+Xte5tHUBZK6rvz
	KpU+HXyttyxox9+mosl/YtBTDpyhkLVFaD/hh1yZkR5an8QdgVc+31xCaQ==
X-Google-Smtp-Source: AGHT+IFm2jLKa2d3yVL0qFmqAlNwGMineUMA58pzu91GQbdgOrzZU5/93gguedDsSXp6ZPpl1xIbdQ==
X-Received: by 2002:a50:ccd6:0:b0:57a:72fc:c515 with SMTP id 4fb4d7f45d1cf-57a72fcc908mr2413657a12.29.1717491826156;
        Tue, 04 Jun 2024 02:03:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31b991a6sm6926190a12.7.2024.06.04.02.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:03:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv4][PATCH 3/4] selftest: add few missing Upstream-Status found by patchreview
Date: Tue,  4 Jun 2024 11:03:40 +0200
Message-ID: <20240604090341.45444-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240604090341.45444-1-martin.jansa@gmail.com>
References: <20240604090341.45444-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 09:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200318

* now patchreview complains only about missing SOBs

$ scripts/contrib/patchreview.py -v meta-selftest/
Found layers meta-selftest
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch)
Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-selftest/recipes-test/recipetool/files/add-file.patch)

Total patches found: 13
Patches missing Signed-off-by: 9 (69%)
Patches with malformed Signed-off-by: 0 (0%)
Patches missing CVE: 0 (0%)
Patches missing Upstream-Status: 0 (0%)
Patches with malformed Upstream-Status: 0 (0%)
Patches in Pending state: 1 (8%)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../devtool/devtool-patch-overrides/qemuarm/arm.patch           | 2 ++
 .../devtool/devtool-patch-overrides/qemux86/x86.patch           | 2 ++
 .../recipes-test/man-db/files/0001-Test-patch-here.patch        | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
index e33a2753f9..26702c4bc9 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [test file]
+
 --- source.orig	2020-10-06 13:26:10.792688630 +0100
 +++ source	2020-10-06 13:26:18.853424694 +0100
 @@ -1 +1 @@
diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
index 1a0a175fa8..64af8f4dd8 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [test file]
+
 --- source.orig	2020-10-06 13:26:10.792688630 +0100
 +++ source	2020-10-06 13:26:18.853424694 +0100
 @@ -1 +1 @@
diff --git a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
index b1d5eab2b8..859073cedf 100644
--- a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
+++ b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
@@ -4,6 +4,8 @@ Date: Fri, 9 Feb 2018 17:37:48 +0200
 Subject: [PATCH] Test patch here!
 
 This is an invalid patch used by oe-selftest
+
+Upstream-Status: Inappropriate [test file]
 ---
  README | 1 +
  1 file changed, 1 insertion(+)
-- 
2.45.2


