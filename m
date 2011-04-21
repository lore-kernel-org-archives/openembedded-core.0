Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyNi-0006gF-Hq
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:13:34 +0200
Received: by mail-ww0-f43.google.com with SMTP id 17so2008439wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:11:12 -0700 (PDT)
Received: by 10.227.130.130 with SMTP id t2mr287133wbs.7.1303409469391;
	Thu, 21 Apr 2011 11:11:09 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm1329356wbd.38.2011.04.21.11.11.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:11:08 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 20:10:47 +0200
Message-Id: <1303409452-19263-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303409452-19263-4-git-send-email-koen@dominion.thruhere.net>
References: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-3-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-4-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome 05/10] libgnomekdb: import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
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
X-List-Received-Date: Thu, 21 Apr 2011 18:13:34 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb b/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
new file mode 100644
index 0000000..f2e4ec5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "GNOME keyboard library"
+LICENSE = "LGPL"
+
+DEPENDS = "gconf-dbus dbus libxklavier gtk+"
+
+inherit gnome
+
+do_configure_append() {
+        find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+        find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
+}
+
+
+
-- 
1.6.6.1



