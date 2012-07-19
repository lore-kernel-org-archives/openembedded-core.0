Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVZ-0001ao-Nd
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:22 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:58 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so1873962wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=tfPRZUvV/rC+8yIFYrP5zOXgYJq1sXyxaNJkUrujJes=;
	b=Lj2mTXIxGOX2OYUKKepNhrPtC0fy6lAUI2lFyAK67IXE/wWgJC59WGbdbqWuv8Z63K
	NqjDVfrZ0sUm/mhSN+FWsu8OaDXVgo6HvBNUcbUEXqmah5b5UeXuoJjPNVsDwuyI87JK
	WDmJ9viMJ140Ewh/+zhX73N7fdD4oMuCg2nqnuEb63GJAN7BDadb6DY8ABFBgk0HFYzz
	kQIob9+NBQUolChwKM5KRb5gtNdUEvinKD6+RjmSYH31XdUijACIAd7P/1u9AiUlgFb0
	DoGWHNw6dw7+BAaZSwiGOrsUDTIAy1oZT3bBnXgero9BBPEhNq8kfomKRm0a7TmUABTg
	9lAw==
Received: by 10.217.6.194 with SMTP id y44mr1540474wes.27.1342714318558;
	Thu, 19 Jul 2012 09:11:58 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:06 +0100
Message-Id: <9ee8bf850eb1b782c4af5d64e12ec570fc4e72be.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlLRXrTEXRqMn6mEKIF42xyQ6SEjas75GS++ONqKWggiJM+YlZHUwtzyO6Xec1jgNmQXao+
Subject: [PATCH 19/26] clutter: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:24 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    2 ++
 meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    2 +-
 meta/recipes-graphics/clutter/clutter.inc          |    4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
index 378b6fe..a370568 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
@@ -1,6 +1,8 @@
 require recipes-graphics/clutter/clutter.inc
 require recipes-graphics/clutter/clutter-package.inc
 
+PR = "r1"
+
 # We're API/ABI compatible and this may make things easier for layers
 PROVIDES += "clutter-1.6"
 
diff --git a/meta/recipes-graphics/clutter/clutter-1.8_git.bb b/meta/recipes-graphics/clutter/clutter-1.8_git.bb
index 9f7b048..7d8bcb3 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 # the 1.8.4 tag
 SRCREV = "f2183fa8df3d173afbee09cc4230ab8f4e03f459"
 PV = "1.8.4+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta/recipes-graphics/clutter/clutter.inc b/meta/recipes-graphics/clutter/clutter.inc
index 9d7760f..ce54ac2 100644
--- a/meta/recipes-graphics/clutter/clutter.inc
+++ b/meta/recipes-graphics/clutter/clutter.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
 # Internal json-glib was removed in Clutter 1.5.2, cogl was removed in 1.8, atk required since 1.8
-STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes libxi json-glib cogl atk"
-BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
+STDDEPENDS = "virtual/libx11 pango glib-2.0 libxfixes libxi json-glib cogl atk"
+BASE_CONF = "${@get_clutter_fpu_setting(bb, d)}"
 
 DEPENDS = "${STDDEPENDS} virtual/libgl"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
-- 
1.7.10



