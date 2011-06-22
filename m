Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZTN7-0004O4-6L
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 21:45:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MJgMJb019328
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 12:42:22 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 12:42:21 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 14:53:45 -0500
Message-ID: <795f599b614be5fa66d65168b90698331c5aa290.1308771739.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308771739.git.mark.hatle@windriver.com>
References: <cover.1308771739.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 23/40] gthumb: Add missing debug files (v3)
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
X-List-Received-Date: Wed, 22 Jun 2011 19:45:58 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-gnome/gthumb/gthumb_2.12.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
index 115a805..7fb8a94 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
@@ -3,14 +3,14 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
 inherit gnome pkgconfig
 
 FILES_${PN} += "${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/gthumb/modules/.debug"
+FILES_${PN}-dbg += "${libdir}/gthumb/modules/.debug/ ${libdir}/gthumb/extensions/.debug/"
 
 SRC_URI[archive.md5sum] = "bfa0957a1bafc5d049292cd5fad372ce"
 SRC_URI[archive.sha256sum] = "0060c05fd372c2af2048d294ab3f75c8fb02c576d3e2004e08b7d34f49da1e66"
-- 
1.7.3.4



