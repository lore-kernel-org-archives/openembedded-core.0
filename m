Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D77C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:11:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.315.1647979886665419362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DBswKYpd;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: flowergom@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id q20so12016309wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Tl6EWiiJYE2KastFSO8jkCxmTQ8OStn3Ty6rBioiUU=;
        b=DBswKYpd4JEVcshcpkuEuPgSjjEiH3LMmwaQSayVc4N81t/BGixXKg6180sVbfvF3m
         euqKAcblWoNdm1tWi6SYGkX9B+Fk7xztsoCo7xbgZBNwqH0bgvEMeWgtKbEWKQ12+CUO
         QXUd3oWyzEebhXdJLAmvZx2uRdVJw2JcJ2E3XFAE5x7qMyYhLgv+FQWdz78ze5s2dCoO
         crA9FHFKzXINOdYIN8sNAWqiKtHQ7tfFVHqpADBRbdhf3wsCwFrO4ckZV2CCwkYTYq44
         /BLXFJn5FJIa1fP3W936WMqRmTcpiuNEY8E7nlNfY3qYWc9dyAv3y50atp9L+mIVkXWH
         5c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Tl6EWiiJYE2KastFSO8jkCxmTQ8OStn3Ty6rBioiUU=;
        b=jqXA4mlsxyDNhJaWho2ajBraWyznTn8eY/MtxpZt5/3yzofE8x+iWStDLheM7Ymnsw
         3iJZNY7kYxMgTbdvsVIDT22WHwnHTAMzUstjUzG9hC+yNUOvQ1FVk6nPcmjvMxj6wXNR
         3yDgCLCkx+HDhl7QrjEwOT5jPewvR3BGysFfF01sNyyrumlhkpk2OBHT/5lWcAucvyoY
         ONZNc7Wi9SATHa7/wU5f2sw4CoJe92G5QVN8DCteagKKQuifmtvOpCJrLnfdkGlA4yNv
         HvEeA9dF/U6tG6gXNrIIZq8Ic+yxTkfV+861oV09TBCt03fTW3I3Y9b9kNrFn7nidkLu
         cquQ==
X-Gm-Message-State: AOAM532iocgpbKGnGfOkgqg5k05aKjWDPeUEPNKMfnjY7KnsIquLzpWw
	k33/gAqwrNi07aUEFMoiqIO1mh01c9uLg2M2
X-Google-Smtp-Source: 
 ABdhPJyr68yA2O25wESK81YBf9tD1XrlIAkuk9XtlI3+7peP3JwefteCca/F0K+4bQOVnwZZUVyWlQ==
X-Received: by 2002:a7b:c14d:0:b0:38c:801a:a8b3 with SMTP id
 z13-20020a7bc14d000000b0038c801aa8b3mr5388641wmi.40.1647979884628;
        Tue, 22 Mar 2022 13:11:24 -0700 (PDT)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 m2-20020a056000024200b00205718e3a3csm1942776wrz.2.2022.03.22.13.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 13:11:24 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [hardknott][PATCH 2/2] virglrenderer: update SRC_URI
Date: Tue, 22 Mar 2022 21:11:14 +0100
Message-Id: <20220322201114.2595-2-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322201114.2595-1-flowergom@gmail.com>
References: <20220322201114.2595-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 20:11:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163572

The git repo for gnu-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index d92359565a..1c32a573b2 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm virtual/libgl libepoxy"
 SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
-SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
+SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=master \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://cve-2022-0135.patch \
-- 
2.25.1


