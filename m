Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07922C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 06:57:34 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.15949.1754377046443286048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 23:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ODHUopyp;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4245235a77so2779156a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 23:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754377045; x=1754981845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VngkvXy0ReqaVBHHWMr4TK4Qe/6Jbcz0GjoOJeR3cgw=;
        b=ODHUopyp5y1PUnu2j3sP6aCMZlpdycS/j8p6Ww7bsTvKrBCns9AYljbb7XxYyktADy
         yMa84qaV/yoEteNzmtGphD6WCrRzBj4QFYFAXW/CybH6+Q5E5HJrLUT9989t4VIR0heK
         k7fPy7sOZRrlEIszLnOtAIraG/taxcd08TBCpUusd9o2sxrG6P2/nruQpqmwA/IW8shY
         oG5lKKo5YGHWig7GvCNuvBKN4AoniQkZ/NNDzzRKmblsueHkAYwwU/K3KOJ7YRW4NM/x
         uy5qldDb/ara4GMiJLks6ALVd0ppKxUqIqhSBdjspS955d3/R8CEXllCzgx03ajN5HkK
         UC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754377045; x=1754981845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VngkvXy0ReqaVBHHWMr4TK4Qe/6Jbcz0GjoOJeR3cgw=;
        b=eWc4Yy21ikPQZArLaL1Sdx8KaKFeRW4fGOThaIW0StH5DhdsKySMHix4QGIqA15RKn
         tl9ri1lDblbIFvYw4UcjsjHAleHdTYj8na3DbHR7ABccRuMP9i0KgiE45XtxGPN9eco7
         2MYub5xUolgCWNGpzbE6g/5VMyKM0aZhkEe12oXyzn3RCKtnBQ1+ftLuqIlCkz9dUw7g
         JBcf1cF9CYXMJvD/3IVC7DebSZlSE1ce9kpUxcBFXsPvvN4JCFhN6oqZE/Uo9wSWncmJ
         L4XcvVGALwW+bUWHUaodjrOffJbCbPVaJBEu4BeGHkIzZ2TdqcJuN0LIZ6KPbxw2I8kV
         edQg==
X-Gm-Message-State: AOJu0YxCuqkcDZFkvXZkaQeyUG22g+DrctLO9SntMe1sAilaG6Xlmy04
	6tjuxhDXpjUQWKwd39xXHgFVhaW4/8NeeZBwtL6+M4rw8fr+nS5j98CenW3ls50=
X-Gm-Gg: ASbGncuTgkX9ytdGhTxAOsehKWZl7yA1c62B83azsdqZ/5Cd1HcNBB/Jbg7jSlTxZES
	UROmjcWelBQR83AnhmR5qf9e0zUO5I9fUen3TEg2PsPVHT/aRnLKnIgm+WoSqrxxza6gtJfCVYK
	WcgUlizQMIWqcXi7sVitD+ho5WG3k9S4utr92SfH/j2TltzSN3OkQSBXZ498OI4ZOQXrH/u2LA0
	6c3YsLyOOnE9fjEAAI7IYwhcP6jz4IqLgSiwy9nRIm8CgzWhFP5Qc2kmn8sqtFU/Z/ldZKZUNAL
	vMkjIaATU4O7YavK4W33UFlcELoohumsEZRyZkPvHuLgFBg8Xrn5ZiNdXyQ3X6vwqGYrmj9PrY1
	569tT4iJA0a1gb6BsNm0H1fjG66bd
X-Google-Smtp-Source: AGHT+IH9vTg4DQbX6cHgPw5qcVGpFQ4v5Ou2L3sz1tU8q0szzdzABezxAfYQF1LmekqTG4Za6mUMGQ==
X-Received: by 2002:a17:903:1a67:b0:23f:f3e1:7363 with SMTP id d9443c01a7336-24246f6cb8bmr196181175ad.23.1754377045183;
        Mon, 04 Aug 2025 23:57:25 -0700 (PDT)
Received: from L-16657L.. ([103.189.135.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b5e5sm123903145ad.124.2025.08.04.23.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:57:24 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: Nikhil R <nikhilr5@kpit.com>
Subject: [OE-core][master][PATCH v2] cmake: Add PACKAGECONFIG option for debugger support
Date: Tue,  5 Aug 2025 12:27:16 +0530
Message-Id: <20250805065716.614266-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 06:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221457

From: Nikhil R <nikhilr5@kpit.com>

Starting from CMake version 2.27 support for interactive debugging of CMake
scripts and configurations was added. However, by default the `nativesdk-cmake`
is compiled with debugger support turned off.

This change adds debugger support for cmake

Signed-off-by: Nikhil R <nikhilr5@kpit.com>
---
 meta/recipes-devtools/cmake/cmake_4.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake_4.0.3.bb b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
index 7d8b8cac65..b47494f274 100644
--- a/meta/recipes-devtools/cmake/cmake_4.0.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
@@ -46,6 +46,9 @@ EXTRA_OECMAKE = " \
     -DCMake_ENABLE_DEBUGGER=0 \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[debugger] = "-DCMake_ENABLE_DEBUGGER=1,-DCMake_ENABLE_DEBUGGER=0,"
+
 do_install:append:class-nativesdk() {
     mkdir -p ${D}${datadir}/cmake
     install -m 644 ${UNPACKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
-- 
2.34.1


