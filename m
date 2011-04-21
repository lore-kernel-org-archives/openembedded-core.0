Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyNf-0006gN-Uv
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:13:32 +0200
Received: by wye20 with SMTP id 20so1853137wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:11:07 -0700 (PDT)
Received: by 10.227.207.65 with SMTP id fx1mr244792wbb.119.1303409467413;
	Thu, 21 Apr 2011 11:11:07 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p5sm1333198wbg.11.2011.04.21.11.11.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:11:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 20:10:46 +0200
Message-Id: <1303409452-19263-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303409452-19263-3-git-send-email-koen@dominion.thruhere.net>
References: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-3-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome 04/10] libgnomecanvas: import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
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
X-List-Received-Date: Thu, 21 Apr 2011 18:13:32 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-gnome/gnome/libgnomecanvas_2.20.0.bb   |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb b/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
new file mode 100644
index 0000000..266d44b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
@@ -0,0 +1,14 @@
+LICENSE = "GPL"
+SECTION = "x11/gnome/libs"
+DESCRIPTION = "A powerful object-oriented display"
+PR = "r2"
+
+inherit gnome
+
+DEPENDS = "libglade libart-lgpl virtual/gail"
+
+EXTRA_OECONF = "--disable-gtk-doc"
+
+FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
+FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
+FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas.*a"
-- 
1.6.6.1



