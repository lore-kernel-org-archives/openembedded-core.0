Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CB7C678D5
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:09 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.53784.1677012305944332522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k11uKKtk;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id y3so2468099ilb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAMCJz2sInxbFUnXBEnWr77gMGYslYSYZrx/3cRDwjo=;
        b=k11uKKtkH8LasqXK3ZsZzW8eG+iVgSIyFBF2j4/aK6cpUWDIg+8DaFeviw3liAC1lO
         OHaQHryI567u1AUlXvr5fEU+TwtBsAw5MlRM9ZWv8RXylYv3oXoFp22nV/JztZPmXWk0
         hUIB+VK2/BjRA5d5LyouTis5/PiCPgh+4S18gjDhdONed86nr3D823/DJJcvhvSUonaa
         SQZm0/mfLIP0+gwIcgCYKl16BXVbZvvBLItbFEMFJIf1Lz5sZG82gOejXCaUGLPxwJOR
         EcBfu/YRrQl6TFijL8QVOCElt3K6kbjhKfxZ8S6XbNCoUV1kpGYV35YqJUHeHN5kSM5I
         Ow5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAMCJz2sInxbFUnXBEnWr77gMGYslYSYZrx/3cRDwjo=;
        b=TeA50vDq2DTc2PZlOgFKJ3+CHABNd4qXwDuOjHtLVGp/a1zXaJwRHDogeweTOkAmiI
         4YvE8ZPGZpuiiONUG7XF5vKn+zNe5NV/q1IZROyLNhA2ADnMCzmBeyxH2uvVku9Lm9+S
         0IPXELKf8oEWOLjr4J2DMGXhGUuC1xvxe9efg0IddofCs8jmHm4aBUiuhcwZFqHUR0AD
         KJJxXpHjuM3wENIkUs4kWQI4o9kDOhJKRlT1Sn0qUXxqSs0Pm/jWDecmn6C6uJIITeZx
         3Frobxbc9EzlWib/XKZP0eOFqBM/JTFNupLiKJkjzOSWHFKt6+KZ86hNH/rcdhAIp52r
         qZiQ==
X-Gm-Message-State: AO0yUKUBHeVYrFLht3WPIPgIcmQ0kPawYfG8+Ky6V0OLPDfNDmtQu2ce
	FVkDZjhA8qyz1edFeF/5s8zKELFF5bk=
X-Google-Smtp-Source: AK7set8EZh8yaWVsISkwW5feKBHB1dH0cttylrjLAgkMdcsv2RFM6nBwsujjyeWQTO5HKRmKGf0fyw==
X-Received: by 2002:a92:ca0c:0:b0:315:796e:af21 with SMTP id j12-20020a92ca0c000000b00315796eaf21mr6886184ils.2.1677012304997;
        Tue, 21 Feb 2023 12:45:04 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:04 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] packagegroup-self-hosted: alphabetize
Date: Tue, 21 Feb 2023 15:44:35 -0500
Message-Id: <20230221204445.23931-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177539

Several of the lists of packages are alphabetized, but the alphabetization
was lost in a couple areas.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../packagegroups/packagegroup-self-hosted.bb          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index a1b0ee288362..529d4c5c5c6b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -127,7 +127,6 @@ RDEPENDS:packagegroup-self-hosted-extended = "\
     grep \
     groff \
     gzip \
-    settings-daemon \
     libaio \
     libusb1 \
     libxml2 \
@@ -160,6 +159,7 @@ RDEPENDS:packagegroup-self-hosted-extended = "\
     readline \
     rpm \
     setserial \
+    settings-daemon \
     socat \
     subversion \
     sudo \
@@ -173,22 +173,22 @@ RDEPENDS:packagegroup-self-hosted-extended = "\
     wget \
     which \
     xinetd \
+    xz \
     zip \
     zlib \
-    xz \
     "
 
 
 RDEPENDS:packagegroup-self-hosted-graphics = "\
+    adwaita-icon-theme \
     builder \
+    l3afpad \
     libgl \
     libgl-dev \
     libglu \
     libglu-dev \
     libx11-dev \
-    adwaita-icon-theme \
-    xdg-utils \
-    l3afpad \
     pcmanfm \
     vte \
+    xdg-utils \
     "
-- 
2.36.0.rc2.17.g4027e30c53


