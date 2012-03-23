Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBDA6-00079K-DZ
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:40:47 +0100
Received: by wgbdr12 with SMTP id dr12so2180917wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iULZvlk2axDPigkZZenaftXS2mw9rfmzkatAtBXDss4=;
	b=Duj3WfsIBRgJdhuebpE5WhrNSMqffmEZgD5m7RK+Y8il4OZ0aBAoiACMO83Z3s0shs
	JLWJtwng4VsaiJw2fE8AYS/o/fhAx4XQTdrpIsHrArNNQt0FrogiPknaUFAkiCHGzEa8
	Fz8RW6k2Tr5Y8pnbPeZ68xVCAUOv6ebENyB7cegG+DvBc9GBsqGb4F1Wnd3FzZBBZ0br
	MekhoQ02myHOIwvR8lc97RdRA8bV96/DY3AbRbikKX9XrbPLOrypRwMmCDYJ4K63I+56
	9s1Pt6MkCqTuN80EjgKNWYDZQeaqBZ+WgfqwH5ir/ldQcSi1iOcDHZnVrRtRTDWzsOuy
	LhUQ==
Received: by 10.180.85.70 with SMTP id f6mr663698wiz.5.1332541910091;
	Fri, 23 Mar 2012 15:31:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm28710515wiy.3.2012.03.23.15.31.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:48 +0100
Message-Id: <4bce96ced483a59426562afa63b4a79ec6e92d38.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 09/10] pango: import native support and --disable-introspection from meta-oe
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
X-List-Received-Date: Fri, 23 Mar 2012 22:40:47 -0000

* see http://git.openembedded.org/meta-openembedded/commit/?id=3f4c8edc60b3426dd96f76504169d742a04c1ce1
  for details about --disable-introspection

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index a2d5dc3..e7681b6 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -15,6 +15,8 @@ DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cai
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
 
+BBCLASSEXTEND = "native"
+DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
 
 PACKAGES_DYNAMIC = "pango-module-*"
 
@@ -33,6 +35,7 @@ EXTRA_AUTORECONF = ""
 FULL_OPTIMIZATION_arm = "-O2"
 
 EXTRA_OECONF = "--disable-glibtest \
+		--disable-introspection \
 		--enable-explicit-deps=no \
 	        --disable-debug"
 
-- 
1.7.8.5



