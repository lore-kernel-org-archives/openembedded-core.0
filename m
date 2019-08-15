Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7E17F283
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 01:17:05 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id m12so414264plt.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 18:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OezupmDcs3h6cHdUA2hf2rssBkxC+ePKyFn5e1i8ar0=;
	b=IbCSuXxyD9xi/YMfq4EH4rwW9iJRhvqs7iHtiPpEaERspyT5L9MkekRX4vAbIiS826
	pXETRC1VLDFuLDc7QXDLfxUNbafskWh4tRxzPhecGsw0v2nqLOdJUQYX6l1qwn8D6gni
	xbcSt8m/1HP5KRZDRLu74/gCJdZL2NgEjLKHPsQW+tbxy3bRQmoI+XO5HPqOwh0mtA2e
	HEhJi2SDWtuv57GlrUPJIC27Cr2qTXefmnERc/5CU5nu1ZwbAp8/fDB21tL+XGBBQnmB
	7Sv8ggeLxLz8yjcXyhXRrczP75FCBiJ8AoX4zfitWon2WHI299CpmTgWBMuGw95/8Fx5
	iRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OezupmDcs3h6cHdUA2hf2rssBkxC+ePKyFn5e1i8ar0=;
	b=stSz+MgmJwEkSRFqk1KbMmhFUxBnBZ9jRJ2Y/gVBApkgLhjjyloTcaQaJKMMKvaLBD
	ad0mibAUs4TMM8QMgisA4aH0x/zeN/85uPfZt5npDhZfwcrHJS0UmwH/A6/VrcuW/1BV
	Rn3aeO88Op/A6r4VWnU8UZYW9ny1DQY9FCT37/ds1Qex0SVvJ98JfW7ECesg/j5PqsPJ
	37syp0VfT7d+sgZUpeRpD0P3Vw1X7MXNU/E2wTITelQaHRd7ydyTK+QHbZyp7Zp1P0zi
	+9ihTATt2Yh9O10R7p119ga9rSS60scgmSUTZV0ElBWf3PZOZvx8KJ6CCfd264Aj7TcD
	WuOg==
X-Gm-Message-State: APjAAAWB8GPxvuZkArVNzzPyr1RbU4y2VUHLm+8k8eQ7TYJJROYYa0TB
	LH09ZNBqgy9AmoRjDnFkjpEsNjxpTi4=
X-Google-Smtp-Source: APXvYqzUHwT75MzCucvq3SB9lr7rpjIfERLfCsAHmUX0Kr8g5EYuXl6k0xb45RTp8m3uj7H1Ql9Bsw==
X-Received: by 2002:a17:902:1027:: with SMTP id
	b36mr1959365pla.203.1565831826162; 
	Wed, 14 Aug 2019 18:17:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k5sm1201154pfg.167.2019.08.14.18.17.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 18:17:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 18:16:44 -0700
Message-Id: <20190815011644.24474-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815011644.24474-1-raj.khem@gmail.com>
References: <20190815011644.24474-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] mesa: Add packageconfigs for vc4 and v3d
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
X-List-Received-Date: Thu, 15 Aug 2019 01:17:05 -0000
Content-Transfer-Encoding: 8bit

This helps in enabling them via packageconfig from SOC layers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 60d07f536c..fcd19884f5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -94,10 +94,14 @@ PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[kmsro] = ""
+PACKAGECONFIG[vc4] = ""
+PACKAGECONFIG[v3d] = ""
 
 GALLIUMDRIVERS = "swrast"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-- 
2.22.0


