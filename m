Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qtezk-0005UE-03
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 14:13:16 +0200
Received: by ewy5 with SMTP id 5so354594ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 05:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AUueQJF7MIdL6rf0OGvuRyJdC/xLNN19Lw17pAIF8q8=;
	b=GY/+CrGeSUypI7uu2pkzpQtMYdpPTfRg21O1fpYCP/17CxBIyj0mjYGm1dUEyucOvE
	E1sFjNVzMAQxw9QazdKlrkLNPaPMbcs9Oh9ID8G2ex3JdOLplS+68PqpbKK//RnMWJkZ
	soRdacqsg9sI6aJR8vsVJ/71QjSF1+GHgZGJc=
Received: by 10.14.145.66 with SMTP id o42mr248710eej.0.1313582917197;
	Wed, 17 Aug 2011 05:08:37 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id r5sm579624eef.2.2011.08.17.05.08.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 05:08:36 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 16:08:28 +0400
Message-Id: <1313582910-21617-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 1/3] udisks: add checksums for udisks-1.0.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2011 12:13:16 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.2.bb b/meta-oe/recipes-support/udisks/udisks_1.0.2.bb
index aafeca7..5fe8e36 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
 # optional dependencies: device-mapper parted
 
-SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
            file://optional-depends.patch"
 
 inherit autotools
@@ -19,4 +19,6 @@ FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
 
 
+SRC_URI[udisks.md5sum] = "f630eefa51b95d6485eb3246bc1bea9a"
+SRC_URI[udisks.sha256sum] = "7dc1a150a6a31b2727144603fa5a8f9852696fc5bdc4a11917b9b0f1b8e3dcf1"
 
-- 
1.7.2.5



