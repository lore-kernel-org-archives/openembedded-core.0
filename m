Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qchqu-0002YH-9f
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 19:50:04 +0200
Received: by pvf24 with SMTP id 24so2931062pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 10:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hi/TNAn7bOT5Y6Yp4Pz/ZXkqlhSS3hQvu3yu9JmkT0M=;
	b=XfgLLgNE7jnepO6f2T/Kx3s7HwuwnBHqUmeBxs10WIGyc3jM3wHsJfm1m96nFm+Quj
	k5UloujRzQ2WpDSzobzEr66ruTs3FtNMeW/wuEvnjm7bYD2CG5jmKl9seNe0DYpsoidw
	yQFTLhjLiw7X54ZGfE4H9N+pKLaULo3w5VhbA=
Received: by 10.142.4.10 with SMTP id 10mr1570555wfd.361.1309542376687;
	Fri, 01 Jul 2011 10:46:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b8sm2100503pbj.14.2011.07.01.10.46.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 10:46:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 10:46:03 -0700
Message-Id: <1309542363-29316-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] consolekit: Add glib-2.0 to DEPENDS
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
X-List-Received-Date: Fri, 01 Jul 2011 17:50:04 -0000

Otherwise it ends up with this error
| configure: error: Package requirements (dbus-glib-1 >= 0.82
|   gobject-2.0 >= 2.14
|   gthread-2.0 >= 2.14
| ) were not met:
|
| No package 'gobject-2.0' found
| No package 'gthread-2.0' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index c934d0f..661cca6 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r3"
+PR = "r4"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
-DEPENDS = "dbus polkit ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "glib-2.0 dbus polkit ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit gnome
 
-- 
1.7.4.1



