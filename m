Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7501CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 05:52:36 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.8331.1760421152728756581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 22:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VlCfOsUS;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso3309494a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 22:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760421152; x=1761025952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KurO5fbkEI+Z186LljGTHrILLVCQS98HxLUcChaI684=;
        b=VlCfOsUSJBZZGRyTB/+CAP4awQyhjwkVEzfjQJZ8BSPyUeG+XEv/zb2XRRals+a4nM
         bcefEV1Vx3FgqHy1UFUmvGZ4gSfHqrUhZi21wWJfTcI5tTP06zM3sJhHiQdcESVO6R8F
         Om19p0XClVUIetx+6UgC7uI0rG7quObTdnPQwtfvY8uvOz5mYsB1/W3wTFIb8/Xru5Zv
         +S8WktOlH+UCOSDW8dwi2Zg9ShZ/ydAUrswvkl1AVQS24AbP58KBgtHlrGDQRRJK8/Vq
         q5/5P+lMlBd9HqwDgBNiq3nee37cx4VYxqwIYZl6ZMwGelyvuRdnaRKKaCD5B77tObov
         YobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760421152; x=1761025952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KurO5fbkEI+Z186LljGTHrILLVCQS98HxLUcChaI684=;
        b=FGnbxpCMUShNNU6QkAGGt3QlnGSvHYe5I5c+dfKCXJir0vIDNpO9ARJh0LmnFoFTC5
         LJYTpIPL2E9TiFq6Ua/xn9vBqqyIfpQwYuR4hLgWvE25+spaLH+MwO6Pd2PP1hltfhHd
         G2gtmwOjtsvb2Bi7vR7w6PAdQ6eKY6BmFSTcJXQ/k6GXtcEKKX1PCOwRPg5P85Jm/HjM
         OX19q7WizLMoVTXsZ0BGfc8GhqRVjNO7QCSwKh+XAU8itdEsN3SqODy13cV4127uvI0C
         9LLEqtFYIJ76nFgQc0DJlo26hmOJi+UMesBxGMTqT9dlfwO8e6p1y1zZCkJPDNRLn7wk
         AsOg==
X-Gm-Message-State: AOJu0YzSNokpRhnYrlONzEelu88MlbDkiQ8uu7h8TFM0KLjG+5RsTf8W
	7iaJtclCzmF2KWzOsmZo10IFjpaA0fui/lK8Vwezarywfx7cBdSIAVZQH54M7bek
X-Gm-Gg: ASbGncu1vEl1BtaSvxd8enPCYyYELDrHBrGEKOwu5gJ+yp+RFkLW/BTmfVsdYrH1mYS
	RJXVdL+CO+yhN2+H4sYIEb5W/HcXUg6oiXYX155h519V7ueV0dp008nyV72wlzQcgoGEOTVQ9Rb
	m6PDp1sJJqTBDoZuu5o4ubeuDRMNux5YRwStOZYgTFAhtJG8BSGAylsCdUZzdih34de0Cc2YdVn
	k5CU4+/E5eq9pAhMc0n2QbPTpOrsEoR6ii+q8rlrolN1rDZdJ6B2QujbWWwcefSEsOK1Oo9+VQI
	6YpxTSm7Jpux6T56fVWPmUsGyXKZTqOTgmzAOQSyg5BCh8qrBuFDPd7fSkGagTgvFAbZT/PnpSg
	DfU9PTLzOTF+DDyeGj0OG9i79xVjqTpxdbhu4oVlW
X-Google-Smtp-Source: AGHT+IEU9nJV6zpHDEEfYg9MHpHilo03JwLjcpCrC3qU3suSUMvzEKvG7FFMzkTupb8uOULR72lazA==
X-Received: by 2002:a17:902:f54b:b0:265:47:a7b0 with SMTP id d9443c01a7336-290272117f0mr296747645ad.10.1760421151672;
        Mon, 13 Oct 2025 22:52:31 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e179c3sm152813955ad.30.2025.10.13.22.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 22:52:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [PATCH] vte: Depend on system provided fmt package
Date: Mon, 13 Oct 2025 22:52:29 -0700
Message-ID: <20251014055229.1083731-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 05:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224806

vte 0.82+ has started to package fmt as a subproject if this is not found
on system, the bundled version however, does not work with clang on
32bit machines, since it is 11.0 and there are fixes in newer version
needed to work with clang

Fixes
../sources/vte-0.82.1/subprojects/fmt/include/fmt/format.h:752:35: error: call to function 'free' that is neither visible in the template

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-support/vte/vte_0.82.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.1.bb
index 023d940394f..4fa8115a207 100644
--- a/meta/recipes-support/vte/vte_0.82.1.bb
+++ b/meta/recipes-support/vte/vte_0.82.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
 "
 
-DEPENDS = "fastfloat glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu lz4"
+DEPENDS = "fastfloat fmt glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu lz4"
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"

