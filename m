Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6hLl-0000dw-Tr
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 14:26:26 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 05:14:09 -0700
Received: by wgbdr1 with SMTP id dr1so356161wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 05:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=alBPnHJLmQAaSOR9O0CFt+lZ2okX6W0Fql9uep1db+s=;
	b=ZAsiXc7C+77z58TzJds+9xKncYsMUlNx0n55iB4VWvdrcH0FI104vlvXYcEX/dEF/U
	9i/pNpj45RGSv8DxVkFe022BKj0cuvV+wxZuy77XKPXLSrgVjdGLFj7mNvkXOk6Cmjpt
	BxIPa0J0JJ9LSxUeZ1//tq1tl6+MCIofcVRbxcUvHZLl/mkQc8BSVcCQ5vwhrnC/3DL/
	nOVYbB/0Ym6ZPQ6Q+MkAeEH0Hfq9JFfdC6sLHX2wsAornNp+zhTTZB7Gz3eS/x5KzRuW
	GZXETGE/sZbQ2unkWC6IiX+QXtfe6/tz6QQH5a6KkGEvvBi63ZjjKqPfHHlkD1cUgTBM
	hkLg==
Received: by 10.216.143.158 with SMTP id l30mr852762wej.113.1346242447822;
	Wed, 29 Aug 2012 05:14:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm15218276wix.5.2012.08.29.05.14.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 05:14:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 13:13:25 +0100
Message-Id: <1346242405-25027-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnREwVRLOyz0STeJNZsPgJZMSalMY/RhdSM/VlNeFoDgWKRYiYIuu3tUOniJiYKTCha4Kg0
Subject: [PATCH] gail: remove
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
X-List-Received-Date: Wed, 29 Aug 2012 12:26:26 -0000

This functionality was integrated into GTK+ 2.13 and we've dropped support for
anything before that.

[ YOCTO #2954 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gail_1.20.2.bb |   19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gail_1.20.2.bb

diff --git a/meta/recipes-gnome/gnome/gail_1.20.2.bb b/meta/recipes-gnome/gnome/gail_1.20.2.bb
deleted file mode 100644
index df6cd03..0000000
--- a/meta/recipes-gnome/gnome/gail_1.20.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "GNOME Accessibility Implementation Library"
-SECTION = "x11/libs"
-
-DEPENDS = "gtk+"
-PROVIDES = "virtual/gail"
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-PR = "r2"
-
-inherit gnome gtk-doc
-
-SRC_URI[archive.md5sum] = "e805806f897cf6040e1f3e9c0cd2151b"
-SRC_URI[archive.sha256sum] = "5025b13a4f3b960c8ab7c3e5c7d6d86082e2e1af6ee18e61e37fd4ce3dcc0153"
-
-FILES_${PN} += "${libdir}/gtk-2.0/modules/*.so"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
-
-- 
1.7.10



