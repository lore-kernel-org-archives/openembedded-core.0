Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D588EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:07 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13085.1692801422780702587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rr+WAB2U;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c0bae4da38so1555405ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801422; x=1693406222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P9t0nZTGxVqhpmmxViqjYb1dZxMVLIo5ieCeCosTtE=;
        b=rr+WAB2UO/COP2ajLDLfvXPkejV9cH2Kp8pS7ND7iZcC9PMsXtPb//KKWgYi1qxwmx
         R6lYfS2caDgLlSeN5+feHwywNAr2wRtAWkQhdeueAzyI4KLJQa1agqhQIncwJJs4AwV6
         9/FwdBlzswGWXvS1PTo117lIdXUOWLEqCrg8DItVsL7IXiw2kIDNbZ7o7cFT6UQQxdnA
         eLFhaUZsRN2NyZSJhIBQYofBHTUs48VWTd7yr9FFg703+qu+eb0tKTq7lBOEvbjQNvft
         nr1iM7XuIYj31q/vkU8lKdzpcdsQvXcCYkVreB/gyWPI6T9GabBg9SiX/CHBklzUU176
         1p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801422; x=1693406222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P9t0nZTGxVqhpmmxViqjYb1dZxMVLIo5ieCeCosTtE=;
        b=V4kadR9FPzl1lAvVuXBDF92GvACLhb4ICNTCryBOl4DQ+ClsRS5MaC2+E1AXweABy2
         l+KQcDzOyH2J8zbp5VqAVZbN2MaNL6R0lu25EId8Vn2cdrlZPdMIF7yk0MaGpEOp6iyC
         AKbuJ4lBwMDTHG1PPkteqCtKb3/3RUgcUMlYfKeBALd2XPZ/8D5lMo3MaCh+P7z12H0n
         yIeb2sFTFV88dXdbgafV+VYlJcXK7kM1OfPeFVMkcdlK3Ypo79BisrbmPixXIVnHuWAJ
         4DP+xSSuGasoKN3Atebe+I2CxYkIVmPacAVnHdzUkCymZ+7sm3x/717Pzh8pVSVKR3SJ
         +lNw==
X-Gm-Message-State: AOJu0YxWp1tBTcAl3XXWbakPqe4M74V+rUQ+7D7u6aN7yUHYXJpQwvAF
	N9uLAc1E+TsKs1izW3xQK2l9BvdAOoRF54ZimM4=
X-Google-Smtp-Source: AGHT+IGLwqn005MZBSnIdmLMfwcvHF4M3g31rvf8mWIheFB3qQgsPvdGNPPsENQK6QQGuG8sF1etCg==
X-Received: by 2002:a17:902:d2ce:b0:1b6:a37a:65b7 with SMTP id n14-20020a170902d2ce00b001b6a37a65b7mr18100993plc.23.1692801421724;
        Wed, 23 Aug 2023 07:37:01 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/36] shadow-sysroot: add license information
Date: Wed, 23 Aug 2023 04:35:50 -1000
Message-Id: <c9ab17b51834bff96657712a6741eb3e3647b063.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186601

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Recipe references 'login.defs' in LIC_FILES_CHKSUM.  This causes some
problems:

- file does not contain a single word which is related with its license

- changing this file (here: increasing SYS_UID_MIN) invalidates
  LIC_FILES_CHKSUM

Add 'SPDX-License-Identifier' to the file and limit the checksum to
this part.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c6f2e3feeb26abefb4136c56db6f3c0349acefb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/files/login.defs_shadow-sysroot | 1 +
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb           | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot b/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot
index 8a68dd341a..09df77d2e7 100644
--- a/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot
+++ b/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause OR Artistic-1.0
 #
 # /etc/login.defs - Configuration control definitions for the shadow package.
 #
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index e05fa237a2..6580bd9166 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/shadow-maint/shadow"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base utils"
 LICENSE = "BSD-3-Clause | Artistic-1.0"
-LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdfce45cd7d5"
+LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;endline=1;md5=ceddfb61608e4db87012499555184aed"
 
 DEPENDS = "base-passwd"
 
-- 
2.34.1


