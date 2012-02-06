Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RuMUZ-000692-Uh
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 12:12:16 +0100
Received: by mail-yw0-f47.google.com with SMTP id q46so2263709yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 03:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=GJIXUhoDcrETffk08giq4tqlqTX88Pe8EUyggL9iVpw=;
	b=K8pgLtpZP9Ao9KGEjNcvXDHNdhTNwRDBmKKtasbr4V1Qs3OG4Jg/TOKSGbDpESIsqr
	VOMB7LUgXyj9UWPFhuNZKDiBZKKCClh0g5OispDZS5ojDxjjdSXmiSGg+RSP6oV0RlgQ
	RO6C5YhhEi5eBLAiLfiKQ1vygCp31tNnQdg2o=
Received: by 10.236.127.145 with SMTP id d17mr23419366yhi.131.1328526257158;
	Mon, 06 Feb 2012 03:04:17 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id a39sm22309816yhk.15.2012.02.06.03.04.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 03:04:16 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 11:03:59 +0000
Message-Id: <e570cb8c63bc8bcfb723fc4ebaddfb04aa980f33.1328526202.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328526202.git.otavio@ossystems.com.br>
References: <cover.1328526202.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328526202.git.otavio@ossystems.com.br>
References: <cover.1328526202.git.otavio@ossystems.com.br>
Subject: [PATCH 2/2] udev: stop providing cache support by default
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
X-List-Received-Date: Mon, 06 Feb 2012 11:12:16 -0000

The usefulness of cache nowadays has been reduced a lot and thus it's
better to stop using it by default. Dropping the recommends allows for
image to decide if they want or not to have cache enabled, instead of
require a machine override.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc    |    2 +-
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index e5fbe40..7949f22 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native"
 RPROVIDES_${PN} = "hotplug"
-RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
+RRECOMMENDS_${PN} += "udev-extraconf usbutils-ids pciutils-ids"
 RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 6d71f4d..b993a13 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.2.5



