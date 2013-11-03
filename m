Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1346D431
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Nov 2013 20:40:17 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so6077389pab.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Nov 2013 12:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dJYn8uSemHd0Z8bhy6EzcHbW9FZerOcYbyZsglUB6M8=;
	b=hVjOjfrNhkhl4Vm/QJ3biiWQTEV4P5S36FObB5lXAx3Ih/zCt3rjzHl8x5slOijJ1V
	yFr3lPC2kFvHHJIIonzk7yfZvqESgfH5XGLvWEMl7qpxF/g9W5sIRGfqRo3DfslF1QKv
	bHhyYWRGTjOF7IRlLXtZgynyBrrDdsMr/O4gUBx3KV55Phw6/yWk44y0HySlq29gfPZ8
	BP0JroJ+rgEUiUZSgEIOROHy+DwQDikJHi4BznmgpWlcTW4ER4sWNEmJ7zYZmAl2bDNp
	wOjyQ0wf7nOctpOYX6P3Ntzs0dOYThY+xQxgBqleNefParRpN/E5wuBaSsV9ApLTJS/Y
	bdcA==
X-Received: by 10.66.230.233 with SMTP id tb9mr14482386pac.38.1383511219322;
	Sun, 03 Nov 2013 12:40:19 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	gf5sm23843436pbc.22.2013.11.03.12.40.18 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 03 Nov 2013 12:40:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Nov 2013 12:39:41 -0800
Message-Id: <1383511181-8005-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] syslinux: Upgrade to 6.02
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
X-List-Received-Date: Sun, 03 Nov 2013 20:40:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/syslinux/{syslinux_6.01.bb => syslinux_6.02.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/syslinux/{syslinux_6.01.bb => syslinux_6.02.bb} (94%)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.02.bb
similarity index 94%
rename from meta/recipes-devtools/syslinux/syslinux_6.01.bb
rename to meta/recipes-devtools/syslinux/syslinux_6.02.bb
index 4438ea8..b4ba0ad 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.02.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 DEPENDS = "nasm-native util-linux"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
-SRC_URI[sha256sum] = "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
+SRC_URI[md5sum] = "5410b1c2614cc8375bfc92fe308ca5c8"
+SRC_URI[sha256sum] = "16027cbc1a7d18a48f3d26fbea771896d892cb43860b8d2f596baef7f2789b6e"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 # Don't let the sanity checker trip on the 32 bit real mode BIOS binaries
-- 
1.8.3.2


