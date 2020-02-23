Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9C66172D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 14:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QSRl0Cfjz5h
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 15:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582468563;
	bh=1aM1aCRi23gYQvwdjfUnzp6yKewfYA1WA17pY0zi9IM=;
	h=From:To:Subject:Date:From;
	b=o/xNJItzwsc6oLn6n1odEFEmLTgjofVPjNDViEXIwiOKl+bSEH8e4wzFgO85RYBfL
	m6h+J5VhpsUUZDUbW9D0mMdxoLoPM+qJbyz7lNRlQmm5prTYWfpugxAR44cFDTLNOf
	nW04LpzgcIEhX0U4XRnha50nsn8zwvtGAIw7VkZHgAZSHVIJPR4Au8LxboOodj8EqJ
	wymayS9YVwcemPwwSla7RU2Qe67PkB80k70u3TwKqCXTt0FqYv2cnpWhIVkHYF7PWf
	Quh1t9gRL/qNxoJ55RULno9g+PbVgE60oBey8fWiKxjJLEDNzUL/jvS2um+LiU/Ia7
	2YXAi83quAg9KailcNXmc1QTsC0483yWqXytzXojxBSov4UlkBmc0X0BxMAVSQUAyb
	jtbEPXUjtI6ESjpCKyLasGICHUJLxdb4LPEt+Wn4IvLJGDl4nEZXKxytA4fABtJ3A9
	qkhqOsMuxdWnZjscsCwHoovQCrwM02BdxZBHshSQHDS3NlRxyJQ7F2JCi4bUF4VcDn
	9nzNYWy0EpaiFHDeEJQCcT31oOkAeKtVRQfmXdfOPu3JNaRx8gR5XOzlmXWcQFLMsB
	ByUE19SyA7XVtiEUjEAy7Zf3FpqHcQoPtq1I/8XJzGo+2QjqCiJaGsZcnK5xCm2Un6
	+JDWHLNi8aFwnSSwTjgv333Q=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 16:36:00 +0200
Message-Id: <20200223143600.2282-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] linux-firmware: Upgrade 20200117 -> 20200122
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
X-List-Received-Date: Sun, 23 Feb 2020 14:36:03 -0000

Switch to using the tarballs of tagged releases.

WHENCE changed due to firmware filename changes.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...irmware_20200117.bb => linux-firmware_20200122.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200117.bb => linux-firmware_20200122.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 8111c41016..0d1422cfca 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -125,7 +125,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=cdcd9f664a404c681bb745bcac6253a3 \
+                    file://WHENCE;md5=c27d0c06cd5d376d8ab55860e65ba4e4 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -194,13 +194,10 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRCREV = "9c340bd1bdabf53808a9178a7be98c5f2ad599a7"
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
-
-UPSTREAM_CHECK_COMMITS = "1"
-
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "ac291b21f366ae2a37193ec8f14c39d2"
+SRC_URI[sha256sum] = "a30e811b3736a72b874ac27e10662f5e5409b1cadf8aab7ba88e8f8bc8083986"
 
 inherit allarch
 
-- 
2.17.1


