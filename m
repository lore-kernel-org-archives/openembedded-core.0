Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 800116098F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 14:11:28 +0000 (UTC)
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E0E59D22DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 16:11:28 +0200 (CEST)
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:11:20 +0200
Message-Id: <1370009480-32681-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
Subject: [PATCH] udev: do not recommend pciutils/usbutils ids
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
X-List-Received-Date: Fri, 31 May 2013 14:11:28 -0000

udev does not require those files to be operational and they add ~350KB
to rootfs

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 meta/recipes-core/udev/udev.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 769d861..ee05ad0 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -14,7 +14,6 @@ LDFLAGS += "-lrt"
 
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native util-linux"
 RPROVIDES_${PN} = "hotplug"
-RRECOMMENDS_${PN} += "usbutils-ids pciutils-ids"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
-- 
1.8.1.2


