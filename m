Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDC-0001ZS-Fx
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:32:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753264"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:27:59 -0700
Message-Id: <3e3a926bd274eb11505003608b04bc82086b5a8c.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 12/50] gdk-pixbuf(-native): Fix build by disabling introspection
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:00 -0000

From: Andreas Mueller <schnitzeltony@gmx.de>

Error message was:
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/g-ir-compiler  --includedir=. GdkPixbuf-2.0.gir -o GdkPixbuf-2.0.typelib
| /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
| /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
| error parsing file GdkPixbuf-2.0.gir: Failed to parse included gir GLib-2.0
| make[4]: *** [GdkPixbuf-2.0.typelib] Error 1

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
index fc879ed..e3e1819 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 SECTION = "libs"
 
 DEPENDS = "libpng glib-2.0 jpeg"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${PV}.tar.gz \
            file://hardcoded_libtool.patch;patch=1 \
@@ -26,6 +26,7 @@ LIBV = "2.10.0"
 EXTRA_OECONF = "\
   --without-libtiff \
   --with-libpng \
+  --disable-introspection \
 "
 
 FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
-- 
1.7.3.4



