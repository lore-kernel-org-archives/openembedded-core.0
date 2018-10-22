Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 758737453F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y11-v6so10465266wma.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dkcgXvTgDLt+2k1waEMMHN4l90Q4XTuCTcSOX/yJRzE=;
	b=GoBxtgZrUpLM4zIFO2n53XmXj/7XmIwK55//maL3AjD8J5Gr2uvZxNnPxxrdJwhbFR
	ivxm8X1KM1iKAEHjN19SjQq8YT/LI7R8NVHaZYN3ItsfB0HXrgwTdIWww3UVls55FxPj
	IusEQxbtdnHkzLoQPyx3+EjpPPDVxV1/INkhHA0xc3na2TghzZJ+Nn4xXHwYNiEJTRe2
	KPWMmHQpobYu7Yr4Hz1fmdiNvV7txE0aODCBlkaDMWPS2Josq1Ag0C+YJqXMAkABupin
	LpdlLRr3HRkfnnG4DUBpA91sJIQAYsyNZTiwfE5BAjgm8CGHBBc0dMJFXja6AbT/RUt3
	/KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dkcgXvTgDLt+2k1waEMMHN4l90Q4XTuCTcSOX/yJRzE=;
	b=lN4TdZ9ivbvcAIe4sySoOxGzqmfUw+HGw88ytGDzlp71YK7wgEhZ2XwOmqJNpQ836R
	lKNAZn3fbS5XghirtIf4u/367h1UmX3ZyOhje4JmFjgtXa7OskLm6/TpkteLFKXE/rxf
	E99IAFw8UaA8kIfkyG+5rTi4sk/MlyX8fqw+4EqiJJXYFR4MHA06Lq4+wIH4yMCycCWL
	/VjjZxdj8CevDMZmZMkXhcfwHUvVG1BMU3d+ykaT/7yB2ycTdP6ebpgvRoj5bYieXUmd
	MKUAI51/Ytp1+YAKIKbAueryccf+AHfG7ZIN9At+IO1Uc76SXYPnVFdJzOvRdmSeAai9
	PKFg==
X-Gm-Message-State: ABuFfoimIFiA5AhOc08pArKLtH/gQoCnCYyYP9fXuYHNg3fimhckwZru
	DxAU7DRhogja+BTsjw+YS7U=
X-Google-Smtp-Source: ACcGV62QnhYTtwesi1nJxKnH0e3ZTe0XOJC7EWCJMf4LOfsNNet4Xr+xC0bH8w1z/ZsD8oRX08m6/A==
X-Received: by 2002:a1c:c90f:: with SMTP id
	f15-v6mr16006223wmb.48.1540217136226; 
	Mon, 22 Oct 2018 07:05:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:08 +0100
Message-Id: <1540217112-24479-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 09/13] libxcb: update to 1.13.1
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:35 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/{libxcb_1.13.bb => libxcb_1.13.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.13.bb => libxcb_1.13.1.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.13.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
index a8e0307..d8cee51 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://gcc-mips-pr68302-mips-workaround.patch \
           "
 
-SRC_URI[md5sum] = "c2b6cf928afa16b0047c974e7aaa783f"
-SRC_URI[sha256sum] = "188c8752193c50ff2dbe89db4554c63df2e26a2e47b0fa415a70918b5b851daa"
+SRC_URI[md5sum] = "f33cdfc67346f7217a9326c0d8679975"
+SRC_URI[sha256sum] = "a89fb7af7a11f43d2ce84a844a4b38df688c092bf4b67683aef179cdf2a647c4"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4


