Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565E6C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.11592.1634657681761008852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B9NbANps;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so3363071wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=laJa1N6bPmnW2WNnvhwJqWcvi6diMZqhR2sGB9d8AY0=;
        b=B9NbANpspCHV62PqILIK/oAV+qn3gE9WIESW1DUeneScvtMJfrg+5aHkYEi5yFS+yX
         N016jF/ALDWXvxrw3z7RGLdt9mp732G+AFcDi1jS/CLCok7rAwlIv9s8iealpJCZqe2X
         3LkBwHog9e3D4+1RCrnM15UzxPRc4kxh2diUv3Z2ct6YXkQRP/2EHDE3rnfFo1qHRbAM
         mpkTvCzdYGekqNVqYDtYvuZYoYu8Zj18oP1oK+L6F9rJ5jGG51m3zVcgD2PjesTm/dHn
         zo+b//LHpROxuWVQTp2H7g4aDImX8NsV+U84AQALxRd/BU4Pe19a5Vn74dVsnyOuQCX+
         ce/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=laJa1N6bPmnW2WNnvhwJqWcvi6diMZqhR2sGB9d8AY0=;
        b=p48KhqAtEcOgxN99jm9tIfVl5hYvWF84TSZ8Qd4/Sc2jAy0xYRMja5hme43PP7M6XV
         Q/V1zMTOhBQKhZQtwc0gz+mYjci/eVZqwONPAlsEGO5i82WDxJ724n29y15emsiJ1ItN
         DhY1D0LjhBodsr4xyGbrITXlR3uveVSTyAOOh/HPT10PRG/5588xyeT7cjSDkc3fDe9G
         NFpAfgjYHPicfTBldcmqj+2NvWsmuwngrahjUCqH8N27IL+zAqJHP20BmwErB/XPic2O
         1UQfspL5Zj0pde+nn4RT8UKuFnKg0ylAbic+2Na0ax/EOqBxclvkw7xoiWl8RFXJQ2IZ
         NLog==
X-Gm-Message-State: AOAM531XPQgaUdk6u2iXquO7BJhwowCGqK+sAroNLh/7Qn1X14ggv9Zz
	SevUESjF/yCRcS/sQp0fu+zjPJxLAIE=
X-Google-Smtp-Source: 
 ABdhPJy+6wLaDkQnqxxWJH20nj/wBlTbfzfvssLr20VyIIf9LcER3w5QCCbZJiTK1dW4mpTDcGdTWw==
X-Received: by 2002:a1c:20cc:: with SMTP id g195mr1683483wmg.22.1634657680446;
        Tue, 19 Oct 2021 08:34:40 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/65] tzdata: upgrade 2021a -> 2021d
Date: Tue, 19 Oct 2021 17:33:37 +0200
Message-Id: <20211019153419.3319802-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157142

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index c7d4965cb8..6221ff9c60 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2021a"
+PV = "2021d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "eb46bfa124b5b6bd13d61a609bfde8351bd192894708d33aa06e5c1e255802d0"
-SRC_URI[tzdata.sha256sum] = "39e7d2ba08c68cbaefc8de3227aab0dec2521be8042cf56855f7dc3a9fb14e08"
+SRC_URI[tzcode.sha256sum] = "ed0d02be79b54f4449ba1f239aeaf9315da490bf32f401d302dcbba4921f591d"
+SRC_URI[tzdata.sha256sum] = "d7c188a2b33d4a3c25ee4a9fdc68c1ff462bfdb302cf41343d84ca5942dbddf6"
+
-- 
2.20.1


