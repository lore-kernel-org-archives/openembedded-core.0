Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E81778292
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Dec 2017 15:38:22 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 81so1561409pgf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Dec 2017 07:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=vVLcVMRfTaOaxMyUoQ5st1+Nzdxb5zvoy1wjdm0jQyY=;
	b=t+ihDjKmrpGkr/R+a8ybaMhPCFD/4ORQU2XCtzfKkpOoauRnZYDXQJFKpe0UAPgH2Q
	xJYidzN+P368oLkAeCwOV5kbSvRwr5INJUIpbC//id1BRWDz+wFI6N/yl6tZ/3yowshM
	Jhi3fPXdxD0FrwzSYeKzWcIrNdgo3z1uGtwG4ySH9pM1rWFH9suu7Au/IK4YzSUgOIh4
	E2Yxz/+N9l6elIyVJ91g5T2DrVo67s7kxmSEZWea1WbK1NnieZfl0J2Kw8AdoOQiD4Zh
	8VGwdDpeBal6BOc+01eMGOCy62SsrJa/dJaUxsqX/kyOFN23RhVYxZu1sBDi7YC4Djur
	Xj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vVLcVMRfTaOaxMyUoQ5st1+Nzdxb5zvoy1wjdm0jQyY=;
	b=iFx/QFEcQTP55W0kyhpFjEzGrIxQAWMXGl3Za2W/9MIEMCaDzIaPXMxhxXMmDUo28z
	P8CpwJRil4DBmJv5Etk9c0gJTeRaDALuNc4IZUuTCHDL9M/olyqTHebvy/onhrYs9PxG
	IDHCukGON7CV1b33JCfEk1jmUW6JlYADSY2j06+Ib1fUO9ev7Y+wrKQlGOy3k0N7EmZU
	4eh07VALl7YMFnUEH5B3qPM6nkkjdr4BqVl3tGQnQsegHlIXqh3HS5n1HbeFqXqhVSBz
	Vl2wu/WZovGenwE8HdG1z1yMw+7ozlp12zzbTPsgHT8n25g7OPITMJiAN/RsABpZBa46
	PDhw==
X-Gm-Message-State: AKGB3mLBgCXjNglKoIH4x/5l7/2WLGtiMHl+a9Y04MEDkpWqROWiR0pM
	lTVSZtX+JEHQgtJL/nRZoFI=
X-Google-Smtp-Source: ACJfBoti/hD2iHRZu52tMDiop2GtoX0k9IQi498vNQmz9JEqslqmBhWcc+oc0FUpxwDXq504tqr/ow==
X-Received: by 10.99.99.132 with SMTP id x126mr31582052pgb.239.1514561904418; 
	Fri, 29 Dec 2017 07:38:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:c82b:a19d:3b8b:50bc])
	by smtp.gmail.com with ESMTPSA id f4sm61374766pgo.1.2017.12.29.07.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Dec 2017 07:38:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 29 Dec 2017 07:38:21 -0800
Message-Id: <1514561902-6067-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] xorg-xserver: update to 1.19.5
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
X-List-Received-Date: Fri, 29 Dec 2017 15:38:23 -0000

From: Armin Kuster <akuster@mvista.com>

See https://lists.freedesktop.org/archives/xorg/2017-December/059095.html for details

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-xserver/{xserver-xorg_1.19.5.bb => xserver-xorg_1.19.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.5.bb => xserver-xorg_1.19.6.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
index 398eb81..76a4990 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
@@ -5,8 +5,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
             "
-SRC_URI[md5sum] = "4ac6feeae6790436ce9de879ca9a3bf8"
-SRC_URI[sha256sum] = "18fffa8eb93d06d2800d06321fc0df4d357684d8d714315a66d8dfa7df251447"
+SRC_URI[md5sum] = "3e47777ff034a331aed2322b078694a8"
+SRC_URI[sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.7.4


