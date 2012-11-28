Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TdgfH-00079m-Su
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 13:22:56 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so7245449lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 04:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=giVVkL+P21EpEQ8gu5jPeUvI9Lg8OKgjKLAP7LRGpMQ=;
	b=qVA7Qbh+Td3XB6KNeUFwL4hcKhjt9YJMRBBBHK2jMNy7MHOVFZPYtR2m1eZYYaytiW
	YhYxF8DC5NR0u4gMBqw5Wu3kW7HiSn0zjSHHjlKs+jRErhOGRzCd9ITMrpW+BfovpgDO
	c+JFgzG4+EG/JNsA157LTesr38DeiSeH+QbOhIPnBNKIXCKArMQcRXCYJCdplWEOge/v
	m7HySZg2Fv8h0m4XFDeM7LJ22VMoWPUCOhLLjYQfDpeRzHjlWYIlvBR6BoNdSZ7FIE48
	imEAHC9864xrrdoTKDGKoLrQPVmO3c6jH+uowHTF9CZiBSBI+rcQYTJ7uuK3rBDpXQCH
	/W3Q==
Received: by 10.112.44.135 with SMTP id e7mr3009431lbm.55.1354104521173;
	Wed, 28 Nov 2012 04:08:41 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id oj5sm7981705lab.8.2012.11.28.04.08.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 04:08:39 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TdgRS-0006Le-2H; Wed, 28 Nov 2012 14:08:38 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 14:08:36 +0200
Message-Id: <1354104516-22540-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib-2.0: update to upstream version 2.34.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 12:22:56 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../glib-2.0/{glib-2.0_2.34.1.bb => glib-2.0_2.34.3.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.34.1.bb => glib-2.0_2.34.3.bb} (89%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
similarity index 89%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index 18a155d..966a851 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -13,8 +13,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://glib-2.0_fix_for_x32.patch \
           "
-SRC_URI[md5sum] = "ee779493b083be9348a841e0a51f1b27"
-SRC_URI[sha256sum] = "6e84dc9d84b104725b34d255421ed7ac3629e49f437d37addde5ce3891c2e2f1"
+SRC_URI[md5sum] = "a4ca31e258273c3761e3de2edd607661"
+SRC_URI[sha256sum] = "855fcbf87cb93065b488358e351774d8a39177281023bae58c286f41612658a7"
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4



