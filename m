Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102n-0001X2-DR
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:17 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:22 -0700
Received: by wicr5 with SMTP id r5so2262744wic.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=s4WTDuia0niUewfKPesiYaQHF8JiccKXughQxfXLXVg=;
	b=DRCzQQK9xZ/ZHz7C046RmovkhsPSpto0T5VQTiV3MFSqT4lSIlwYS/kCWjRRdFoohY
	xr5GKlmMKwcVDPPCQgmzegoHET7DGGcD2rZHEISU2ADG1qr1S7q2tw0IefV5HWMv4ZhS
	LqU6ZLIdmcirIZhiwxAVbMOn40xplFMO6o0i/kC/pNoyCSw/cycS3El0pVa8UrJaPU2c
	zDf3gSY7FzP0UYjwuCJxHUyhrNnSdgD0YbTE61JEM9OPC7y52eaGOiio5EqoDrHsExo9
	WdKcpR9X1QBMIxV0DnIk8gquFggnea69U/BnKitJFIgsSyQ0SSmSzGUZp4F5NJAgyX58
	x/7g==
Received: by 10.180.99.102 with SMTP id ep6mr843397wib.19.1344884360983;
	Mon, 13 Aug 2012 11:59:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:41 +0100
Message-Id: <244fabf84610b1aaab6942b9096105922e69abdd.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnepSXSu4XGMdqpmeHPRdftnsl+hfVKrjFP8yoz3hEWP+kKqZXYlwuxAIwxkS3hKPw3Z8+S
Subject: [PATCH 2/8] clutter: DOLT isn't used anymore
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
X-List-Received-Date: Mon, 13 Aug 2012 19:11:17 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    7 +------
 meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    7 +------
 meta/recipes-graphics/clutter/cogl_git.bb          |    7 +------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
index a370568..aceef96 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
@@ -1,7 +1,7 @@
 require recipes-graphics/clutter/clutter.inc
 require recipes-graphics/clutter/clutter-package.inc
 
-PR = "r1"
+PR = "r2"
 
 # We're API/ABI compatible and this may make things easier for layers
 PROVIDES += "clutter-1.6"
@@ -19,10 +19,5 @@ S = "${WORKDIR}/clutter-${PV}"
 
 BASE_CONF += "--disable-introspection"
 
-do_configure_prepend () {
-	# Disable DOLT
-	sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
-
 SRC_URI[md5sum] = "487f70f9b59e1328b47f1db4094ab662"
 SRC_URI[sha256sum] = "0d567177facd6913ac9c894e230ae48933125f02354ef965bbbf0586f1f0df91"
diff --git a/meta/recipes-graphics/clutter/clutter-1.8_git.bb b/meta/recipes-graphics/clutter/clutter-1.8_git.bb
index 7d8bcb3..89d8026 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 # the 1.8.4 tag
 SRCREV = "f2183fa8df3d173afbee09cc4230ab8f4e03f459"
 PV = "1.8.4+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -18,8 +18,3 @@ S = "${WORKDIR}/git"
 BASE_CONF += "--disable-introspection"
 
 AUTOTOOLS_AUXDIR = "${S}/build"
-
-do_configure_prepend () {
-	# Disable DOLT
-	sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
diff --git a/meta/recipes-graphics/clutter/cogl_git.bb b/meta/recipes-graphics/clutter/cogl_git.bb
index 682f931..a3e1903 100644
--- a/meta/recipes-graphics/clutter/cogl_git.bb
+++ b/meta/recipes-graphics/clutter/cogl_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 # the 1.8.2 tag
 SRCREV = "e398e374e2ff0e88bc1d63577a192f8ca04a1cb5"
 PV = "1.8.2+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -14,8 +14,3 @@ SRC_URI = "git://git.gnome.org/cogl;protocol=git;branch=master \
 S = "${WORKDIR}/git"
 
 AUTOTOOLS_AUXDIR = "${S}/build"
-
-do_configure_prepend () {
-	# Disable DOLT
-	sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
-- 
1.7.10



