Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FA2C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:53 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.92040.1669557352166009215
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ygEF+uCq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id p12so7865831plq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgRFf7mdvWpo/ep5/DkNYmvyF0xi8NgG3IXwkXFmj6M=;
        b=ygEF+uCqrHjjq4bLy/T10GOvRrT2u5lBcH2PAdk1y1Wp359sKGYOmljk7sYQcBeP2K
         ItvBrGFNm51gcJcxFpiqrM26wfnh71j2GZ0mUQ5ss/UUcHWE5VDaR2NpLvs5EeqGYpH/
         mrJ1dA00xfPMaCB8CyLXcTjFlRQEsIUgerPqj44AELqQrU9Xn240VJySuSR3ycjCqy4B
         84pe88keHdiEePJsfYnm3VWoxFrbwIq4qBdJgK6OIWpEL9Xx9fA0+/l3Zv+xPSJVgOrT
         JjQQ9cFxezVmzQxN/otOb1bjd6Vb1KvAN3bZj1fxUUrDM6kuJk3cSR2qZ+ewNs7MRMU9
         HJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgRFf7mdvWpo/ep5/DkNYmvyF0xi8NgG3IXwkXFmj6M=;
        b=wdXFVUZGA0YnzSiHzmzdEC9kNoZ7sSJEB8wqAdzDWGkq8rgl9dFI+tbbc1ACTFBE26
         7p73FphURS86UqclNIFd9jUFs2GJInpFUCt6sf5fuqXA0f3Rgf68eh+y36kJOwgTI82i
         Le2adBdDhZDh/lijJaDeazP9b07nLCe8kU0Rvbxb7sdMwKn5Wm18SkK8fbvwGN95lMy+
         b6ct7xjUcsft28/mLBVwggcGsnHZSQ6fepJeVaazlOtFAEuQK8YKHB1BUwTvxyY94PcY
         V6VrpbdW4lXv5OD3GC+HBwebVxEKZtSMpacJs6tYi1X1zM/NtqnGIcdzHjSZ03KYeT/M
         nv/A==
X-Gm-Message-State: ANoB5pklLIghlMtQ61NbOuiORYyuZUnTe0zdbb5ai9+rvgOHkqoL4Xs5
	cBPA70fWESnMvCWNhDFQ5T5yU1XR0tI0bflBv3c=
X-Google-Smtp-Source: AA0mqf5U/JRsdKPXAo5zTkuMH51iH/gds7KslGS+xU9N91VMeHfWf9F0yeCF3nbFNw5Oka7Ljc3kjg==
X-Received: by 2002:a17:902:7089:b0:187:4ace:e20c with SMTP id z9-20020a170902708900b001874acee20cmr27984461plk.75.1669557351203;
        Sun, 27 Nov 2022 05:55:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/31] libical: upgrade 3.0.15 -> 3.0.16
Date: Sun, 27 Nov 2022 03:54:57 -1000
Message-Id: <6d68985f1a7a55cda92c177c739e51cac3faf653.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173856

From: Alexander Kanavin <alex.kanavin@gmail.com>

Version 3.0.16 is a patch release.

- Fix regressions in 3.0.15 due to improperly tested fuzz fixes
- Fix argument guards in icaltime_as_timet to match documentation and tests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 77d4557d6f6a1405d03bb5dc7ca23d7ee78c2037)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libical/{libical_3.0.15.bb => libical_3.0.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.15.bb => libical_3.0.16.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.15.bb b/meta/recipes-support/libical/libical_3.0.16.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.15.bb
rename to meta/recipes-support/libical/libical_3.0.16.bb
index f5e9bb9372..c53b7ca375 100644
--- a/meta/recipes-support/libical/libical_3.0.15.bb
+++ b/meta/recipes-support/libical/libical_3.0.16.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "019085ba99936f25546d86cb3e34852e5fe2b5a7d5f1cb4423a0cc42e399f629"
+SRC_URI[sha256sum] = "b44705dd71ca4538c86fb16248483ab4b48978524fb1da5097bd76aa2e0f0c33"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig gobject-introspection vala
-- 
2.25.1


