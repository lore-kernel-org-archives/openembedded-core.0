Return-Path: <aehs29@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id BB2937DE74
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 17:56:30 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b7so6794131otl.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UoIMXVNx5GFc7NOFnG8z8THQEB0/G5Xk7eeQIiWUQd0=;
	b=OyL68OR7w+5im7QS/KU3cxkEMs/ot2XjNYSTVO+6u24HS8dhxVmCsQyZjYJxlvIC0s
	KzJFniLiffKDlrm9xDuLYMnTxR2hZw0VEwIKxdoBhOGJjpxZAxL6K/igABLxc2oa8D8T
	u02WNWKTUXn6ZDZ7f6+evRDBsunKM9Xh7azhhg22MbCuQ2wrTliNWp48BSvfw4Ae/AIf
	h1qS5zDhprl3LH39vD+cvXDdloeua9Kn/9W/2nQjjvuqxnEP64N7144Hn0U1c4sfKCJ8
	ZE3veaoJDu6Ux1ZjCKPNP+UL/OlPcLar2ywTsQF1cDYH0sQ8C9tgJy/zhiMatpxf7849
	wVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UoIMXVNx5GFc7NOFnG8z8THQEB0/G5Xk7eeQIiWUQd0=;
	b=cYFY62iRfpeJYBVixmqA9kPJi0sFPbpmMY/YNuC0VEA0BwTLBwKQ8FrBiFT073xDwP
	jbgMLGHonLeccywbx4punr9DpMRPMvQQks0dqfP04ciLupdOm1BJaw2x6j6xcr7dfi1g
	rsONwP5p8u0cFZCC4TdyVjYJ7nysciXkluMyYCHI/Ki+7EnySCxpazyPfSd5K+pq40XS
	bhKBvY3kRd/LXyGowLfM+PLusiZiH9I27DecVX309fgMLKXik8GIhcsAEmNPTzjDuysr
	vrjIlv83DguEKUHTOKblPWRsF0nLPo1ErkwkwHzMg7kvUgxu3xeEkZpwnlqpYkmFPvD1
	h98w==
X-Gm-Message-State: APjAAAWarXN7FxGCktJ7qJgRoYwN05m5h90H7LQ2WI1JHEgRvVR0AER5
	M7IItZiU8lL9ll62nTyS98zM+GqBQ8/h6Tit
X-Google-Smtp-Source: APXvYqyG+tV5AiP4SyI00OBcY5pJXvq0FegyZnBBztq2HFpPs0G/VkHevpDiP+4t7JZLg1B6Kt5R/g==
X-Received: by 2002:a9d:2f69:: with SMTP id h96mr5906511otb.366.1559670991256; 
	Tue, 04 Jun 2019 10:56:31 -0700 (PDT)
Received: from XSJALEJANDR30.rga.ip ([189.237.113.71])
	by smtp.gmail.com with ESMTPSA id
	z14sm6073903oto.41.2019.06.04.10.56.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Jun 2019 10:56:30 -0700 (PDT)
From: aehs29@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2019 10:56:27 -0700
Message-Id: <1559670987-4517-1-git-send-email-aehs29@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] newlib: Upgrade to 3.1.0
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
X-List-Received-Date: Tue, 04 Jun 2019 17:56:30 -0000

From: Alejandro Hernandez Samaniego <aehs29@gmail.com>

Upgrade both newlib and libgloss to the yearly
release 3.1.0.

BSD-2 license was added on:
6864c08b94752d34cca

Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
---
 meta/recipes-core/newlib/{libgloss_3.0.0.bb => libgloss_3.1.0.bb} | 0
 meta/recipes-core/newlib/newlib.inc                               | 8 ++++----
 meta/recipes-core/newlib/{newlib_3.0.0.bb => newlib_3.1.0.bb}     | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/newlib/{libgloss_3.0.0.bb => libgloss_3.1.0.bb} (100%)
 rename meta/recipes-core/newlib/{newlib_3.0.0.bb => newlib_3.1.0.bb} (100%)

diff --git a/meta/recipes-core/newlib/libgloss_3.0.0.bb b/meta/recipes-core/newlib/libgloss_3.1.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/libgloss_3.0.0.bb
rename to meta/recipes-core/newlib/libgloss_3.1.0.bb
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index f50e5fe..418cf07 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -3,21 +3,21 @@ HOMEPAGE = "https://sourceware.org/newlib/"
 DESCRIPTION = "C library intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products."
 SECTION = "libs"
 
-LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2"
+LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 & BSD-2-Clause"
 LIC_FILES_CHKSUM = " \
 		file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		file://COPYING.LIBGLOSS;md5=73f5c98779aea7dba4a6c94a74ab0ae2 \
 		file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-		file://COPYING.NEWLIB;md5=956a4b1487f7677cdcceeee8f05a21f0 \
+		file://COPYING.NEWLIB;md5=100d470af54e2d1d79fbd8498a32ff26 \
 		file://newlib/libc/posix/COPYRIGHT;md5=103468ff1982be840fdf4ee9f8b51bbf \
 		file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0 \
 		"
 
 SRC_URI = "ftp://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
-SRC_URI[md5sum] = "81ec873108b8593c586f91ca65963952"
-SRC_URI[sha256sum] = "c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb1314f8f5501332"
+SRC_URI[md5sum] = "f84263b7d524df92a9c9fb30b79e0134"
+SRC_URI[sha256sum] = "fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc"
diff --git a/meta/recipes-core/newlib/newlib_3.0.0.bb b/meta/recipes-core/newlib/newlib_3.1.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/newlib_3.0.0.bb
rename to meta/recipes-core/newlib/newlib_3.1.0.bb
-- 
2.7.4


