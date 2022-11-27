Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE5CC4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:03 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.91886.1669557359870075235
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=E31CJeNF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id x66so8141680pfx.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Kuxn7hCMF8mmdo9pYwaFfZjIOWucl4idPjQXgYm9pU=;
        b=E31CJeNFvMPopizRvTg55DqKXYU2mfGRrqZs3JZPlkyccOFAr5hWaetRCxdpTxWxso
         foH7h8dykfX6txp7vzb+YvhuOnYyBgH/xYTHRLOcqS0p6AAR1iH1myqqE4Pb+M2x+bqA
         U0QI04IoAc8lqRS0CwTR+sMFm6qQ1USUT/PskkTZFkQ9pu8Wt51GRJiYiHSPWi4MqUtQ
         qUbgF6llkCj1Hw1RAYQMzK/znS+3Y23R3cL3hp5Fvku1kVycMZk6nVmsAxd+2Kci9UAj
         BK5QUAA4rvcEqpuQhAufsYu+FWZfS7yMdoIEMA59uPCZ7QCJyZU90Gj7ptkYIzeDVoRR
         /q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Kuxn7hCMF8mmdo9pYwaFfZjIOWucl4idPjQXgYm9pU=;
        b=6q8lAj7oQtlrdsStfWnFPxC8al6zyzcu0bClNEcqGrG0I2cVFa2xO+8jgXHBe9bLMQ
         l4pWV3C/rdQLIFlTPNVEwognpw97oFOEZYNJH+aagb9NWJnWoLFC3D6Yu4dnTr0S11+4
         bZurXD+S3zfGtA/pAA5chf9QBMlCQx0BEk2HfWFOmDbFtjnwcsczhYlSvDGzG6nI/14b
         ikhquNHWjmCtz9/88mTzZ/YPPLJ6xPGe2KoLlP6trTOVKTBacc/MejcgVqaqPo2hNC+V
         LrG+yevK4aX63px/fw7thr+uuR9MAzkVXBgCUBCd0qkUW0enjw7RLOGCoFxGSqQAafjf
         VmuQ==
X-Gm-Message-State: ANoB5plkzjodOrftMY3m4kYX1OT8dm51OBL0PuIUNZxKY/wSHtwSESd8
	ivcm3XflxTnxFO23ITzUcBsiMVJmJq2XWPVsqIM=
X-Google-Smtp-Source: AA0mqf77/Qh6g1ixYayc1BN40L1NBBAusVT8WktAtXa4wp1LhX/7d/Oisd3j9DfKOXWSfPy4UyXKdQ==
X-Received: by 2002:a05:6a00:4104:b0:56c:e37d:ec12 with SMTP id bu4-20020a056a00410400b0056ce37dec12mr27284886pfb.80.1669557358917;
        Sun, 27 Nov 2022 05:55:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/31] libepoxy: convert to git
Date: Sun, 27 Nov 2022 03:55:01 -1000
Message-Id: <1944a5dd84c3629c9c994383e2904731cf28ea87.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173860

From: Alexander Kanavin <alex.kanavin@gmail.com>

Latest version doesn't come with stable tarballs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4b6eed2bb323a3c7390ca3ad426afe27e9072bf0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
index 487fc00360..881010b1a3 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
@@ -9,10 +9,11 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRC_URI[sha256sum] = "d168a19a6edfdd9977fef1308ccf516079856a4275cf876de688fb7927e365e4"
+SRCREV = "ecfa8e0f083084181d36966fa084aca9a6c97d53"
+S = "${WORKDIR}/git"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig features_check
-- 
2.25.1


