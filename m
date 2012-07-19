Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVZ-0001ch-W0
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:22 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:59 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so1873962wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=3IjB6G/HT3MUoXMDP0xc23QzzRvSrhvERQo8uXRyJ4M=;
	b=BS04/6iA/BHBF5iNIY0K3cblxxh47yvxG51GqC+iejrJGv2nqpBLW3JuDpyAhm655J
	bu1RqQ+azLjKv/YzEzjd1AVPRcP4v2QYUrIhcKinw7A1NuwmUi+eeq6TORKzYYdx8CBv
	QOQjj9dId8kdOiiAJ0DjueVY424z8gytesXQJ8ytYIMvLoGWDcIcjnlxCDpdztz4Lm+k
	Kq6SfiMuNEnQwQJjBmMzYUeMZeBLJ1bkBfpeM+gsgae+iGCgFg8Pc9wEaKqWT/4hQmt3
	2o/h3dyzz5WnLWuPxT5JKTpIa0SNwGe7jPuI8NgLwi5kGHEPr05CJButAQ3TmFFD/JvS
	lYDw==
Received: by 10.180.98.138 with SMTP id ei10mr6178444wib.1.1342714319778;
	Thu, 19 Jul 2012 09:11:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:07 +0100
Message-Id: <0e691e62fbfe1efe71550b3cc77a19f6728149e6.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn6VK/qZRVxwDtKVuxVrND9Q2BPj2g6LBCjPajV5EpPTuyK2bThSVLwTfvO43BqQxgvJpCC
Subject: [PATCH 20/26] pango: cleanup thanks to new gtk-doc.bbclass
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
 meta/recipes-graphics/pango/pango.inc       |    4 ++--
 meta/recipes-graphics/pango/pango_1.28.4.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 4fcc94f..c9e92f0 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo elfutils"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
@@ -22,7 +22,7 @@ PACKAGES_DYNAMIC = "pango-module-*"
 
 RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
-inherit gnomebase
+inherit gnomebase gtk-doc
 # Create a pango-modules package
 ALLOW_EMPTY_${BPN}-modules = "1"
 PACKAGES += "${BPN}-modules"
diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
index 7055158..4869592 100644
--- a/meta/recipes-graphics/pango/pango_1.28.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI += "file://no-tests.patch \
             file://noconst.patch \
-- 
1.7.10



