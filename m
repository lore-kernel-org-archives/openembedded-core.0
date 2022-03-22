Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E45C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:28:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.14787.1647977280595580086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QHV4ZTVC;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: flowergom@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id u16so23840211wru.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BEx8DT0lyjaE/byZI4kvC8pDPkGSsYqKET9p3IPAQFM=;
        b=QHV4ZTVCmcEuC5OCs+h6dfJVLDIwg8yaIi+04eXfVsTh9iRiVwEpi5UkS/e8Z/u3Px
         zXDdR4ca3/el2xpISJQgAtgabVg5QgSCbFCW4HSsrw4zIN6mkpeDHJ+NImtgZhXrwrBU
         aga4MqxpTtxpx14lQN9n9GZFtwGYIe52YaYrMNDO3LpSoIcLm2CxoKwuDDdcLBwpeVuC
         NeY7gRdMcnQub2slhHKBDxny9fmME6KxDtF9BZW9ySi/WcA3ZQ0nhs3FGO8jaKpJ9O6C
         BEzbh/9G8JGKA0VGGZ9ozGoRW58NhdrV+JswG4/4AS6tqgRRHztchmpbC9VGu50V+nQT
         0HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BEx8DT0lyjaE/byZI4kvC8pDPkGSsYqKET9p3IPAQFM=;
        b=CDIX28aYHd19U/u5ep9jsNRnJq1W8isKFrcNjJVGruLMGKpNcQgabLBSYtw5Nir9th
         sUwX6dblmd9bSNPa9YEaiSO5IfK0J+lfw9e68+e+YU/zcrkiOHktHkY9Q17hNyLalXkH
         HA/dqcdm8/Bii4Spxq2aXQvKsRT0I5jH/oT1DT56P4+4QY9s6DOhsca6c9Fj6j2LK8op
         VI2Ll98QpW/QHPRbdSiVFbM8qialJNFbWzFF0h7ZXvgfTxw7FsC2PWIP3YS0lKahivCt
         vrpHg0FJbm9wiMWasrNalSA4HbgHH0ucZqyAJtQAYUjUsisc8kj4u12Yl4AAD791AOkZ
         rSGQ==
X-Gm-Message-State: AOAM533Pl7AnKfKTGXQLAj012HKsXNtb7nK31vI2J9zkkRvZ1qqhPy9i
	VwpgfL3TSK0/GPr28NLbnM6vInNWjJ26JLim
X-Google-Smtp-Source: 
 ABdhPJzilswCHKZihw6pj8VioqT041rZ1uIm5YHE/ruFWJkZNwTcC1q+49hDNKKMWQM0MkMQiTnqyQ==
X-Received: by 2002:a5d:598a:0:b0:204:6fb:6461 with SMTP id
 n10-20020a5d598a000000b0020406fb6461mr12182220wri.132.1647977278729;
        Tue, 22 Mar 2022 12:27:58 -0700 (PDT)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 p11-20020a5d638b000000b002048a77636dsm2249442wru.97.2022.03.22.12.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 12:27:58 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH 2/2] virglrenderer: update SRC_URI
Date: Tue, 22 Mar 2022 20:27:38 +0100
Message-Id: <20220322192738.13527-2-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322192738.13527-1-flowergom@gmail.com>
References: <20220322192738.13527-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 19:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163569

The git repo for gnu-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index 772db5bbaf..31c45ef89c 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm mesa libepoxy"
 SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
-SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
+SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=master \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
-- 
2.25.1


