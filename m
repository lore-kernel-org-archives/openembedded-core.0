Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TGDW2-0006Fo-Mh
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 20:36:22 +0200
Received: by yenm2 with SMTP id m2so1870811yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 11:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=hRi1OpbDEMxUGxH+J6ZLRCKP6iBLL/qYXsOOT+UoObw=;
	b=zBwfI4kRf+Ur3nLhxt8Ym4ZbZNpRM4HjzOJQ/PO/sRoAOehP8RyUlk2kErptmaauMR
	y7DA2b3v+LX3S8kE0Lx5kEIsKcBnBWvgi8HFHKlCCFJvVBaaGWgFKAZDhsK48o1zBdO3
	7hALJKqYhxYej2+vSDXifHhpf5VUl49rAep1rHuAraUKoo9oLgeT70xFCzuY9eiqu+3W
	AuJisNqvfcg38Vzp/anV47jZOOs8j9bBnQCkNuyO7HVCKs5olf/hGm8DJShq2weLBtNG
	8i0SeQsFy0mAis+tX09AP7vUwzv+vPr9cixPWfYXVH00A3GudtYQr/qIs6x0MoKRySYj
	OUJg==
Received: by 10.236.76.234 with SMTP id b70mr13412744yhe.31.1348511014352;
	Mon, 24 Sep 2012 11:23:34 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id k2sm17197177anl.11.2012.09.24.11.23.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 11:23:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 15:23:19 -0300
Message-Id: <1348510999-22223-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] cogl: Add a missing depends on libxdamage
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
X-List-Received-Date: Mon, 24 Sep 2012 18:36:22 -0000

During a from scratch build test, cogl build failed due a missing
dependency on libxdamage.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/clutter/cogl.inc      |    2 +-
 meta/recipes-graphics/clutter/cogl_1.8.2.bb |    2 +-
 meta/recipes-graphics/clutter/cogl_git.bb   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/clutter/cogl.inc b/meta/recipes-graphics/clutter/cogl.inc
index 7d840be..6878624 100644
--- a/meta/recipes-graphics/clutter/cogl.inc
+++ b/meta/recipes-graphics/clutter/cogl.inc
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 STDDEPENDS = "virtual/libx11 pango glib-2.0 libxfixes gdk-pixbuf libxi"
 BASE_CONF = "${@get_clutter_fpu_setting(bb, d)}"
 
-DEPENDS = "${STDDEPENDS} virtual/libgl libxcomposite"
+DEPENDS = "${STDDEPENDS} virtual/libgl libxcomposite libxdamage"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
 
 FILESPATH = "${FILE_DIRNAME}/cogl"
diff --git a/meta/recipes-graphics/clutter/cogl_1.8.2.bb b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
index f733598..fe4266b 100644
--- a/meta/recipes-graphics/clutter/cogl_1.8.2.bb
+++ b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
@@ -1,6 +1,6 @@
 require cogl.inc
 
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-graphics/clutter/cogl_git.bb b/meta/recipes-graphics/clutter/cogl_git.bb
index a3e1903..3fb70ae 100644
--- a/meta/recipes-graphics/clutter/cogl_git.bb
+++ b/meta/recipes-graphics/clutter/cogl_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 # the 1.8.2 tag
 SRCREV = "e398e374e2ff0e88bc1d63577a192f8ca04a1cb5"
 PV = "1.8.2+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.2.5



