Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyNf-0006gG-H8
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:13:31 +0200
Received: by mail-wy0-f175.google.com with SMTP id 20so1853045wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:11:09 -0700 (PDT)
Received: by 10.216.241.136 with SMTP id g8mr241495wer.59.1303409465373;
	Thu, 21 Apr 2011 11:11:05 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f52sm1078605wes.35.2011.04.21.11.11.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:11:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 20:10:45 +0200
Message-Id: <1303409452-19263-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
References: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome 03/10] libgsf: import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
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
X-List-Received-Date: Thu, 21 Apr 2011 18:13:31 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.5.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.5.bb

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.5.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.5.bb
new file mode 100644
index 0000000..3ac7d6e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.5.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "GNOME Structured File Library"
+LICENSE = "GPL"
+SECTION = "libs"
+PR = "r1"
+
+DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
+RDEPENDS_${PN} = "gconf gnome-vfs"
+
+
+PACKAGES =+ "${PN}-gnome ${PN}-gnome-dev "
+
+FILES_${PN}-gnome = "${libdir}/libgsf-gnome-1.so.*"
+FILES_${PN}-gnome-dev = "${libdir}/libgsf-gnome-1.* ${includedir}/libgsf-1/gsf-gnome"
+
+inherit autotools pkgconfig gnome gconf
+
+EXTRA_OECONF = "\
+		--without-python \
+		--without-gnome \
+		--disable-gtk-doc \
+		--with-bz2"
-- 
1.6.6.1



