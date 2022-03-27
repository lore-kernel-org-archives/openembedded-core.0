Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A929CC433FE
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:33 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.753.1648399292504141309
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ExHDG6qB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id j8so2662294pll.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GBRRw65CyBD+CDzpobGM4RdVTs1rgkS+Zsap+aFeha4=;
        b=ExHDG6qBKivhsy374JcLmiwA6tYgxtE3tnAVCDYlzchDUWDAaY8/99FzICrVyIDJkt
         KQCjiE4UT5/XDGAFxL0Bn0S5n6q010a5U48CbENjZzuFoL56i5VL3FnLFQG3sHwpuK2W
         l7B1Cs69aQEjti4qM5UhkPx0Vf4pcyZYs+EABBpMb90/mLLaORtjenM7114DSh2VGkXc
         NZ6KMbTYsMFVfnKZS20vaW9Omt+nXd/e9nm+DUrn/dVhQ0wohwtWgNMcRpfvaO/wunT/
         /upLrA1B5ifcOq1j3isD8dWwImNJMnlo7u3z1Mk55V38gCZL6JJxyR01wZSxrDmYRacf
         wJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GBRRw65CyBD+CDzpobGM4RdVTs1rgkS+Zsap+aFeha4=;
        b=u9ZLgngooooYYm76wmpLlmmXBFuuIsrL/CxwND3A0uvg9grrsmO0bu/2Ib6I2B6LW/
         8r7i45dUcl4krsKrbS4nqS4Fb8WCVoVrbzwpy7lebg10j4b8tGBXyPY2FtJtWVRbuM31
         uRSvDT3ic/X9uut2Iv1/ERC51xxdWYjeDePlgrpc4rKT3W3SKBtueShrq0pEd2MFbhQL
         /Xy25zxAulvGUf0a4CKwZMxf1Ote1bVSAodLQwARqfwhzGIfJ9HEAVO9oE9/MAHZWTmK
         8CRjYkzBV0tXExdlfvktQf+QE9D75xV0pI31XxSGf1EN6bL+S5hqRAid3T/HCgPOsiBS
         WnUA==
X-Gm-Message-State: AOAM533Y++XnfxLwkuWndtxb+4sP3bvofsHcAPY744we1ziMmTDvwDJm
	sqXbpYkJ7VyaMdYuSE4yiwNrgnqZ38uxOaVWj/o=
X-Google-Smtp-Source: 
 ABdhPJwp9wYZ3T3EB1Xrq9UN0mrFwIkjiDs8dBIM14z+twWnygWH+S1cNAwysFTM40CXwt/0cA0LYQ==
X-Received: by 2002:a17:902:b097:b0:154:2bda:bd38 with SMTP id
 p23-20020a170902b09700b001542bdabd38mr22942211plr.155.1648399291605;
        Sun, 27 Mar 2022 09:41:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/10] virglrenderer: update SRC_URI
Date: Sun, 27 Mar 2022 06:40:59 -1000
Message-Id: 
 <619d9ba2bb1f869869937f7d7942cc77580fdc08.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163675

From: Minjae Kim <flowergom@gmail.com>

The git repo for virglrenderer was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


