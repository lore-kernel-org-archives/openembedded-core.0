Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 012D06F75F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 14:31:36 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so2679083wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dTo+w3JGgOe/83AGLlgAViHXAbmahS3tVW+I6bpAYQY=;
	b=UEQhrNZI0t4lpNOINqm9eBJlmnRSGAW+qDtGdj6swdQB0PbIKNQq4WowWq+tcm+dD2
	C8UWfQGk/avbHS7DREbe4P5qbBXSfSw8qrrotdKOcVKLxSYqqJiurPVlna5KaZXVo7Da
	OHNHmEZNKcwPcXwrQmR/fJnjhZiHWG9iJomh4MobUY0b0MX9ohM++69if2ETcnSVC+iR
	c+uUK2aUdY0Fd+SZOjjMv7XrSDUsyARvaeBhXlky8abqwrEgV/xAOG/X2bq1qDdsihKy
	LHo/lM9aSRk3D3I+n0Hzua9A6B4tUN/VAnDRub1yk/Anm5jogy5tO/Y+8XjIx4mqLCwX
	whAg==
X-Gm-Message-State: ALoCoQmXlVX6xVf9+jutxBkFH5krYH/6XDUQPz0FnAaf9Xmmj1dTcYPkVCpneKuQLobGliAbZ89A
X-Received: by 10.194.82.69 with SMTP id g5mr69475wjy.85.1394807496959;
	Fri, 14 Mar 2014 07:31:36 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id pm2sm5664748wic.0.2014.03.14.07.31.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Mar 2014 07:31:36 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Mar 2014 15:31:27 +0100
Message-Id: <1394807487-28947-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libsdl: add missing libglu dependency for openGL
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
X-List-Received-Date: Fri, 14 Mar 2014 14:31:37 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Configure checks for glu.h to determine if openGL is available.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index dd2c540..e19c388 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 PROVIDES = "virtual/libsdl"
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
 DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
-- 
1.8.4.2


