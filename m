Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88085C4332F
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:16:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.77.1643044589534903667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cdIZSbp1;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id i2so14890729wrb.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Xz986j5NeoP7ZfKsqsBYq9Zl8TQvLFDMREXvBtQcQns=;
        b=cdIZSbp1ZxNoBwF0eLwPls+4wrAXd2t46nkDjkTtHOCgNlWELrsc+QNstFDrwbZVFt
         RBynXa4E7p9aUsJG2UqPnNAHcEdY70k5oFscDDN16U0uEDsrBoyEKRp9iyO5qiJgqimp
         B6LkamS8gKC5vsqKkiRWqoqzxHAq1C2KmyTw3wFDev03jLwFBwRY1X8xmdp/pLejZT4Z
         bxjPBxtROSMYD8M/mdeakqK0HB8x4py1BLPe1n8XWCSbv7mnYRUvwwItEc8vImQGYrWJ
         eEUrvlaB51Wm4qeDumcPRN/61iN3bU4lSuZO99IdeNS92uNY+xJ8fOSfZY8cD49bz9Xv
         hXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Xz986j5NeoP7ZfKsqsBYq9Zl8TQvLFDMREXvBtQcQns=;
        b=GO4QQ6PeejM6TRVyEmHg30MhDs16LNO3R7WpnivPWA8rQgURCJE0/pg/quz0NMyNWR
         xnozKmopEH9UbfCUV7u2jvO6Eux79j/QnE3UAbRTBXYjkILERy90UcIKddC/zptCC3sU
         e+H/zXUuDcFsyvtSc3lo9WbCncuJ317HlenwKPdjWt6cl9DRFPbTBlDrrz/JZQxQumeq
         Jz0qCL/MjV+fS+vdLxb19MiMHJfWwzVHd4rA/ZurdA9TMNVZEfWnHwMVe0OPUf2xLtP6
         PICM+Vbi5fJYLswqvtaxlmkyNTZdAujd6CLBSGqQhmLBpwk1CJ4yckvSYBRpAdcR08RY
         Qkhw==
X-Gm-Message-State: AOAM533q+BP4zILzseWP33jvgAz8bNJ3PRsnglkcd3lRDttRBnBMNiOm
	wcQgLkSzrJGjAQfUfmdESekayH+0Wvg=
X-Google-Smtp-Source: 
 ABdhPJzgw4DsafxnNP4TfvIpoT8P/9BkRXL+bzL0G4ifWZcf46mD+1RVjCNEGWPCJhvMhmGnGmctNw==
X-Received: by 2002:adf:f791:: with SMTP id
 q17mr15062378wrp.340.1643044588144;
        Mon, 24 Jan 2022 09:16:28 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 o14sm3085839wry.104.2022.01.24.09.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:16:27 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][dunfell][PATCH 3/6] e2fsprogs: Use specific BSD license
 variant
Date: Mon, 24 Jan 2022 18:16:06 +0100
Message-Id: <20220124171609.20282-3-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124171609.20282-1-nishaparrakat@gmail.com>
References: <20220124171609.20282-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 17:16:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160886

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 966fb77981e4fed0ab7998439940b1e05dd0ee43)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 45fb9720ee..08fb30fc71 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -3,12 +3,12 @@ DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the stan
 fixing, configuring , and debugging ext2 filesystems."
 HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
 
-LICENSE = "GPLv2 & LGPLv2 & BSD & MIT"
-LICENSE_e2fsprogs-dumpe2fs = "GPLv2"
-LICENSE_e2fsprogs-e2fsck = "GPLv2"
-LICENSE_e2fsprogs-mke2fs = "GPLv2"
-LICENSE_e2fsprogs-tune2fs = "GPLv2"
-LICENSE_e2fsprogs-badblocks = "GPLv2"
+LICENSE = "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
+LICENSE:e2fsprogs-dumpe2fs = "GPLv2"
+LICENSE:e2fsprogs-e2fsck = "GPLv2"
+LICENSE:e2fsprogs-mke2fs = "GPLv2"
+LICENSE:e2fsprogs-tune2fs = "GPLv2"
+LICENSE:e2fsprogs-badblocks = "GPLv2"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
                       file://lib/ext2fs/ext2fs.h;beginline=1;endline=9;md5=596a8dedcb4e731c6b21c7a46fba6bef \
                       file://lib/e2p/e2p.h;beginline=1;endline=7;md5=8a74ade8f9d65095d70ef2d4bf48e36a \
-- 
2.17.1


