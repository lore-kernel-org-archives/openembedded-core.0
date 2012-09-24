Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TG81N-0001iY-CG
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:44:21 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Sep 2012 05:31:32 -0700
Received: by mail-we0-f175.google.com with SMTP id t44so2172919wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 05:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=tQfMtzHjv6dn2LINB2EKavlYTjlrSTKfH+8iAeeQ0B4=;
	b=CEx04TI34eNrGYEKwaO80FxYl15D+VKVivH+85wNYhNp8gJZYpXSvO01JDMqNVgCvo
	TTo1NQN9KjxNM1Z+Hi11rDjfwlzDFaVSOsxwMPSFk2Dgzq7O9m7HVJVhemMDQWDz50l8
	a6rhSOpSUtmjBrlkojja3LPN1QYHzyCiee6DXvWL7710bF8BPDDhvPxPNamxE7h2NSoY
	4jbAw64DE/0g1KcIfNDkVzTqDg/FdKRWHXcZyKhH7fkkpt28tC8w21JeCS+kahQHAmBn
	ao+H7Aqb0+BDg60a+y6BzjbK0K6qP7WgHmhrx1pW+IUgxsHH92tDm4DsLL6SAW0E/Zpe
	aQCA==
Received: by 10.216.232.204 with SMTP id n54mr7820217weq.182.1348489892410;
	Mon, 24 Sep 2012 05:31:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q7sm16580330wiy.11.2012.09.24.05.31.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 05:31:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 13:30:37 +0100
Message-Id: <1348489837-5159-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnHNVTfGye4hBVWYqqdW0QW+gvrL+on4e3aVdgO2AYp6I0te3CKSuYG5XdN0lwFRWj8SQkz
Subject: [PATCH] xf86-video-fbdev: bump to 0.4.3
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
X-List-Received-Date: Mon, 24 Sep 2012 12:44:21 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb |    8 --------
 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
deleted file mode 100644
index a3a4796..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
-
-DESCRIPTION = "X.Org X server -- fbdev display driver"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "53a533d9e0c2da50962282526bace074"
-SRC_URI[sha256sum] = "93b271b4b41d7e5ca108849a583b9523e96c51813d046282285355b7001f82d5"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb
new file mode 100644
index 0000000..ff627a1
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
+
+DESCRIPTION = "X.Org X server -- fbdev display driver"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "1d99f1dfb3f0fea077b6b61caa3dc85a"
+SRC_URI[sha256sum] = "ff7b037ad110040a4e2db5c84e9741125dbbaf3a08107db47760f3e11f9c4831"
-- 
1.7.10



