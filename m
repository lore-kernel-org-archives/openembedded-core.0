Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id E125374603
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:10:11 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id z1-v6so8512061pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=8pm+jrrMdAYau+N5vLyDTKQCUS6tparqHlNRLCUW57k=;
	b=pCckvX+5ZWo/EYLo/srskbcNzP3uN/wEPTdFX6BUVAWsWvXLjqD+CGnC1tpAtZ8++5
	lNQS7jOPwV4v3UrIk6lw9xP+QzrsVpFhSu7xzvKuqcF94d+GJt1DNyY2OEQWGwY24eIh
	ZOOgjEx86oMPGuZ13CyJsNz5XHD85vEPtus95oRQVOlxIe5wS8VdC30XolNU1wQmH3z+
	cIVqBmPfO5Nr7Hau8WrduYOpLPkMR0ERtDnrHz2KCm3H1sko+clNEOQuMsv6xP8yL0oZ
	xBf9+X6ydZX4tz8FDotq3BEaZ/28LyFaSD4R7pMFeleruzNIig1k5kTmxf0oF73kxvPF
	zEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8pm+jrrMdAYau+N5vLyDTKQCUS6tparqHlNRLCUW57k=;
	b=iDtE1zAIUJnaUKDmdrDDO9aWzA38nVDc4KXCZfaZ5S75qh8lHnu9QqSxN8qmmV9zCU
	XyrtzD58aHrU9srywF4NL8+ARlJle8AEantJtf9ONNiQvWL4RrfMuXOU4oYQLyDKP5s2
	4ja5HgktGq5RNbnzPJZzgLmwBQp9ah5iP84xadAPkSlqqnCbF8p34JODVvfcIKtC+OVC
	t+HggACWafB5xY1keaqeaJWLGOOqz+3E/Qpzts9lG+gXTgdbO1/hc+Z+IC60JUsdLupb
	7lQOEH4ShsXUl++hsGOgIe7OHjdmNBmJ4HhEQS16218/3RlNwxm2z8Y9urXVSinvyKCG
	+KEg==
X-Gm-Message-State: APt69E3BHxSEB+zgOCX6TtWpLGOhOzAzeyV4/VEr6irAd0giU2j/VM1y
	r5g1Veszlmq/KvPlAz1ZT60=
X-Google-Smtp-Source: ADUXVKLkNEKQR12r3hhVJIdEzcjaV+LPSOG4TONehzadOfUg6qxci/UZsvH6R9f8DlwOjk8KJ1Z7Tg==
X-Received: by 2002:a62:86c3:: with SMTP id
	x186-v6mr16326928pfd.4.1529381413002; 
	Mon, 18 Jun 2018 21:10:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm23326731pfn.149.2018.06.18.21.10.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jun 2018 21:10:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 21:10:06 -0700
Message-Id: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/6] xkeyboard-config: update to 2.24
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
X-List-Received-Date: Tue, 19 Jun 2018 04:10:12 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{xkeyboard-config_2.23.1.bb => xkeyboard-config_2.24.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.23.1.bb => xkeyboard-config_2.24.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.24.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.24.bb
index fb9f5d1..7d0e608 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.24.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "875cbd09ab8394277fd16070326abbae"
-SRC_URI[sha256sum] = "2a4bbc05fea22151b7a7c8ac2655d549aa9b0486bedc7f5a68c72716343b02f3"
+SRC_URI[md5sum] = "74c4bdf52382127cb5802c3f2ab441e0"
+SRC_URI[sha256sum] = "91b18580f46b4e4ea913707f6c8d68ab5286879c3a6591462f3b9e760d3ac4d7"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native util-macros libxslt-native"
-- 
2.7.4


