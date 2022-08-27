Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFC8C3DA6B
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:14 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.51890.1661624768888243253
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5ntI0uj5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id 199so4483838pfz.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=RxYhLcN6kC+qIzPL3drA/49WdQzGxveX6vnc70m9laU=;
        b=5ntI0uj5DnqR8aKOVE4WLhQxpEshsmY7mCKl9JpIuCmLifRZUDKeH+Y9r3VpBwHz0y
         vvZozGmngZAgQ+syflOV+BbgUhnf/TDIt3R7Ve42Z1/ZzS6yivdhJGYgY7pqtoGOdRQu
         QspWx1AZ16SMaIG7ZSDo/V4brV+vePNCpIwhC8pwPHoPi+xFnm9uWQLWgsslk5CCiEh1
         GmRddHY3cz3pIeLCvhj837Y8OJcw4XExllRCVQ7cmsfXIOcgsH64nWvCecLFLKFhHZ7M
         eXnBd03dem3Cw0mylI84QWKsXZDGQgzAcdvI/k9IGDAzVibPzdM5neHJacI2x6ASLnCz
         mXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=RxYhLcN6kC+qIzPL3drA/49WdQzGxveX6vnc70m9laU=;
        b=SXu/EEFD/M6pJmxPSAUT2dClBz22yrVxCc2k3JrbLm9j1EmDrPPVZGs0RCInrQeKV+
         AmCUkmQYkyFiNJEEy6i5lmm8g9Vp04eUYoo4Al1mfoCtTppRDCQhX6QASsFNPk7ZGTlp
         F3FtHtLVrqNCPvEjpVRb69Bxdlb88RBLoO3K9L86Eom1GwYi4/Fi0g9T7cdWjrzAnfws
         k3KEXAOIbtw2KoehvvVM9d1mEZ3rbpS2J45o1MSOpjMUgx4DfI2zvByM2xr35Dj5vQWm
         vnwbA6jPKBerwiayyAGlm5GFva65phMj/fzliUtLiR22AU0zQkxmfM6PGhreetQgXUvk
         d27A==
X-Gm-Message-State: ACgBeo24j2hPrEvW0SaNMFI76GQVrf3p0qDInWEdT2GMg6Q8LvuyceTu
	fv4gsaepHNf+IUSeSlX5vqF207CbXf2PgJ7Q
X-Google-Smtp-Source: 
 AA6agR5d1dFfwcFMyVhgnrpr1hQuBwMOoLdA5iozgnekCeLZQKQwZkCcLvnXLIH8G3WFIruRHIpcvw==
X-Received: by 2002:a05:6a00:1910:b0:52f:13d7:44c4 with SMTP id
 y16-20020a056a00191000b0052f13d744c4mr9120936pfi.32.1661624767915;
        Sat, 27 Aug 2022 11:26:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/24] tzdata: upgrade 2022a -> 2022b
Date: Sat, 27 Aug 2022 08:25:26 -1000
Message-Id: 
 <e565620d743536895108aaa2f27e6e0f93c7591d.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169943

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b301d5203a4da0a0985670848126c5db762ddc86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index cdd1a2ac3c..2b956cf7c0 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022a"
+PV = "2022b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "f8575e7e33be9ee265df2081092526b81c80abac3f4a04399ae9d4d91cdadac7"
-SRC_URI[tzdata.sha256sum] = "ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664"
+SRC_URI[tzcode.sha256sum] = "bab20d943e59a3218435f48d868a4e552f18d6d7f3dd128660c5660c80b8a05f"
+SRC_URI[tzdata.sha256sum] = "f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d"
 
-- 
2.25.1


