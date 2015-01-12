Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1255D72498
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 22:25:46 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id hn15so181561igb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 14:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cLv5KnOnAFqwgUoUojpF6wsRwCJHdYOyb40L9ym15aA=;
	b=jYq5Y5dOEsQSsfltSupYxrTxLKKzTezL9e2HSpnjsT3Owhg1V8WJSe9F48ElJ1r/Tm
	BmhFxUI7suybrkg0Rv/cuEUuEtBeW3UAO+BFuBr31l+Fa4WqKm5LTE/tXla+8o9hebFm
	mVd0Ikfls4Xbn7WVrVY5LLDcstM8bAIWTw8/CnxYGVvXweVSmUkonQGczFPorCBfeRTO
	KD6AWPhbaSv2ljW+ExJhf41N3vM1L+XPnfzfgfSeykvsbRqUsEwXY0yLExRbGzi7c14q
	SYbVk+P5lXh8sA/LlacB2SAjdO8AhZmllBG7rmNzuQwy/gDw7Ced8G1r8YotL2xAAUHz
	JEqg==
X-Received: by 10.107.47.157 with SMTP id v29mr29811088iov.59.1421101547330;
	Mon, 12 Jan 2015 14:25:47 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id qs2sm5014817igb.1.2015.01.12.14.25.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jan 2015 14:25:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jan 2015 14:25:30 -0800
Message-Id: <1421101531-20833-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] udev: fix missing dependency on glib-2.0-native
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
X-List-Received-Date: Mon, 12 Jan 2015 22:25:53 -0000

udev compile requires glib-genmarshal and glib-mkenums

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/udev/udev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 280da10..31d1230 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 LDFLAGS += "-lrt"
 
-DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native util-linux"
+DEPENDS = "acl glib-2.0 libusb usbutils pciutils glib-2.0-native gperf-native libxslt-native util-linux"
 RPROVIDES_${PN} = "hotplug"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-- 
1.9.1


