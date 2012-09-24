Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TGDRl-00068j-Qg
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 20:31:57 +0200
Received: by ghbz2 with SMTP id z2so1869975ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=+mPZoWVpdGKsztT2JWTsikLaTtr0dsxcEPez1+H6k6o=;
	b=ISmgavA6KdkYgYDQgddAbPDySXOoRy18wwLgiB23Z3fuZZvGx/5Jt95LQEmTgvdPGk
	iMf+JhJg6m9ohSrjpq9SnLbwN95uccBFebcdytt7o6DXL1Py6VfnbcYyfq2oddT50Hbm
	v71Y5ak8rvILSo4aPX2Nw4jAHmHWHrP/swd9OYyKG7L2WLiegUFSV27uICBy8euwHl8G
	FEmjIyy+CsH+WY773bxK4LNmme7NAbIIkGrzWZ3R3FbZaHKHPgcxmrhx+Q+UF/HDUej8
	D1VRiDO3NOxxKkytv6clyl0yEjXrIVnWjk4J0OTS7RMsYLpTs7ImJhMz5QoGm6DolPgr
	VTGQ==
Received: by 10.236.148.70 with SMTP id u46mr13484120yhj.30.1348510749431;
	Mon, 24 Sep 2012 11:19:09 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id t39sm17203997anh.3.2012.09.24.11.19.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 11:19:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 15:18:59 -0300
Message-Id: <1348510739-21424-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] cogl: Add a missing depends on libxdamage
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
X-List-Received-Date: Mon, 24 Sep 2012 18:31:58 -0000

During a from scratch build test, cogl build failed due missing
libxdamage dependency not being explicit.

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



