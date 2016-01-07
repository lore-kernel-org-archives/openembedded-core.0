Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9386FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 20:53:28 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id ba1so337324746obb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 12:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SWiQya35x/osb2PA3p4GKIeDzxSN3qk6NUucXIS4A20=;
	b=Hxm7e0fglNNSYB+CZnwgCSoc+DQfRthEAgxiwiZ4ZYIKK6acJVIGY2W535Q+Pwgx54
	w9xn0SMsfxmCM66y28+yKTFaZE1rwcoLjkwe6006V1XXXDxkt+wglLsDvpuRG1X4GEYS
	W3R9fBqDPrgcTQwG+SIjvsZy+CZpPyrp1UJ7L/vh5VxnO7YSaErAphQhUj0y7Fjilgsb
	1APaEiYwJ6hBkd/imRQMsh+cUrQI5aOGVXpJsYDUYhio4mNMzWD7VfF6udsbdBdH3Ydv
	4kPgXGVaz2xBmp1CL3rxiDSLp/+Mm98ZIPPwQ89xayNWmpPhckki3s3/30ZB7istwuge
	SLbA==
X-Received: by 10.182.79.200 with SMTP id l8mr81241621obx.18.1452200008874;
	Thu, 07 Jan 2016 12:53:28 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	mm4sm42079156obb.1.2016.01.07.12.53.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 12:53:28 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 12:53:12 -0800
Message-Id: <1452199993-3885-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
References: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] libav.inc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 20:53:28 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/libav/libav.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 05b7e87..371e066 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -29,9 +29,11 @@ inherit autotools pkgconfig
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
+EXTRA_FFCONF_armv7ve = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
 PACKAGECONFIG ??= "avdevice avfilter avplay bzip2 gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
1.9.1


