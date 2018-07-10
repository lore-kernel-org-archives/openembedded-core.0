Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id F28D974EAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 08:06:56 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b188-v6so23658665wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5YACGNsyed1g4lEHzu5XoEsvGsgyGwAiLHycYV0UUoA=;
	b=d+a34xfSnwDcme2Sb7+r0mgJ2q0nsjv98H7BKwWQpx0oKipnckRCFyEHzSzJh1xSpf
	UVDUJrLcGrGBMUOiJKt5gu8EkerA6h6iRpJRWLdWNN5YvRgCnCs5jojdyfXtoX60lgRX
	pecP/kPbAZF5Ti+1VJyUEkc8a7Mi8Nlr2dZoK/R+ZJxiUiQ/RmdKMkTZOtBtrBP6Rqjz
	2p0hq8PE6pb//B3fKY1Rpty6JNkThUWvJSGewZ964ORZFO0ZZs2zEgsMfni8IBnrpFEO
	ov/y9G8Ev+LURC5tkp3fZFkWl6DCi2qwQ2qDRcay89KaoE06porwPr/lj8pfXKu677u8
	Yo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5YACGNsyed1g4lEHzu5XoEsvGsgyGwAiLHycYV0UUoA=;
	b=hzJ5UyPmBmb3qL4vLT0Ksk2j8XwmUsCGzyhz7SK10S9vrMqqRuWaY4YvbsZh0AAw00
	ida4dP40uDt3mX5AvoXFPA+hGvZZn3smbx0uB9DvRnxSUuC2EpTejOhWQkdEFyWeo95A
	6SxZox/pXhANE+MCaY57CT89kbgaGsmthUz2rACJmV5Jex4BiSyFSHwEjpeD6D6hUDoH
	G/av4BddQpnr6y902i04v9dWC+o6LQ6YHAiG9LRan9DJCkQExvh0O4wIh3yWaw7sZ/Vy
	0KienETFmbiGx0sxDbybK+u5zOlKL3tD4B2TAqfkJJigCpPKWfLLZ6iTZ2d6W+Kk9USA
	55vw==
X-Gm-Message-State: APt69E2Qvoh4ShQC8zwAh7Sw0vIlFFawzcDMZ560QKvyHqBAuBvPQ489
	0CRcze69zkC1I98WZyaNmukBKA==
X-Google-Smtp-Source: AAOMgpdk95umXYyDhLV3pM/D5mWdQLIwOFIV8u9guGyk2z5YGY9mtUsDvF/pQiLkZl2WaFyCpC8C2g==
X-Received: by 2002:a1c:168a:: with SMTP id
	132-v6mr14899103wmw.13.1531210017654; 
	Tue, 10 Jul 2018 01:06:57 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h7-v6sm5512375wrq.41.2018.07.10.01.06.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Jul 2018 01:06:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 08:07:02 +0000
Message-Id: <20180710080702.20527-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710080702.20527-1-Martin.Jansa@gmail.com>
References: <20180710080702.20527-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] libdrm: allow to build native and nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2018 08:06:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/drm/libdrm_2.4.92.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
index 1526553254..b4d06d19a6 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
@@ -56,3 +56,5 @@ FILES_${PN}-kms = "${libdir}/libkms*.so.*"
 FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
 FILES_${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.*"
 FILES_${PN}-etnaviv = "${libdir}/libdrm_etnaviv.so.*"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


