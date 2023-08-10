Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F00AC41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:27 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.21288.1691683522779144756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=AbNjbyRI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bc8045e09dso8354155ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683522; x=1692288322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P9t0nZTGxVqhpmmxViqjYb1dZxMVLIo5ieCeCosTtE=;
        b=AbNjbyRIreO7qb2x/7JCxuHFkfzpAVbNgYIzjz8ELIsvpao6jSSF9QHj5OMC9yIO7Y
         T9QqsbF8uct6T1CbHPHC9KYrktnQYTqsVx9ZpErbK1Y4nxfyC8yp5SP8IthS0LaFyaLU
         Az5Y/5a0mfn0dgSo8wdAumWnKI3IUoJXz5NiU4UVN3LCNxd8a9EQ/stDgG6BW+HoG2jI
         5FVg26U2mZbX098YCaz4+DXfBmPK1XatkkvXrNnrP5eabTOKE5NfXhboExk9CeY2eGvJ
         10oi1KED/lh/zronoURViaXIMvNev8Yzkb0F9EhQcS2FiaqGw02AC+WHBbJN82xzUvOJ
         muuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683522; x=1692288322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P9t0nZTGxVqhpmmxViqjYb1dZxMVLIo5ieCeCosTtE=;
        b=j4lfDn3lZf/ReFC9E+cH1nY2klsg+UCxB1XFLd4x2kkDLrggNA3saNqnF93I8fv0jW
         xLmGCkwaFWPWg+ZoC+Q5xYTnOzOW69DhkJMucpfOWLiH5mrG4pCHpsX944KOWeyJ3Dma
         DciQtnNVeibieYfwalQ2OSbf8OiCMrpYvyqjxyhMg9UwJVfCWsnSXDJ8Jl0SC2cDmnma
         N4izTOoYmErEzzx5MTHqOv3U6mVfkZM5Xg3cgc3xrqPivsAwR6C9iaiPjhmvNe/ZxrSg
         /Glz8nSV+I06ohKZd3AeLbB5xU9NjpHfkpitmgZ/wTxL52U8EFr0fiSOKNFRDSD8aPQN
         TGVA==
X-Gm-Message-State: AOJu0YwbBAddrZbnWUHJgmFnMHz99uXDtZuFE8lGOZqiH3pQphg4Jy1g
	gBPjnQ+0VcdooEwv14/APGl1gbsFTeCglm09yks=
X-Google-Smtp-Source: AGHT+IGhLnqFYBI4kvpORZURp2wc9ChYde5407NgYIAJkUc4V1KapBi7iIU6+1UsPkV0uLXR/5gQVQ==
X-Received: by 2002:a17:902:cecf:b0:1bb:35b6:448f with SMTP id d15-20020a170902cecf00b001bb35b6448fmr3078896plg.15.1691683521883;
        Thu, 10 Aug 2023 09:05:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/37] shadow-sysroot: add license information
Date: Thu, 10 Aug 2023 06:04:16 -1000
Message-Id: <21744b8d77c71f8893dc06379b13bf45a2470c70.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185779

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


