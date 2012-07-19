Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVI-0000tD-Fo
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:05 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:43 -0700
Received: by mail-wi0-f172.google.com with SMTP id hm11so5006402wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=ZOnkX59dCGItPVvVFJxA72il8P+/ceRiOaYGsotyW8g=;
	b=RGHIXqhIIKmVAaHgmMcEBd531CInj/IVEg7/R9q7cbvUM+DhfBQXoz+nCn+d60dt2V
	549e7xhr3YYAk3su/E57hqHjyB/exJz0J/schQXf1bHzOLtn89eyQY6md6cKGabX7zcl
	/Tm80Zt/ttP9Mm4mDdnaPxhPzjPgtVXkgvBB97RKRa+Scq9sXslAVz2LjIkmUOnQgXR5
	5wCfHJZOF8kR/204FRovzLnGaMw/ubCEQMIGAW0YQPedXWJjzxXrA5AsNYRms7l15TVy
	+I8V7487OH+1OGKsTbfq3w8sjR7sPW+Gya6u9XMyiGUE1iBtn8ZSwPu/wd5luk69C8kQ
	XOBA==
Received: by 10.217.2.133 with SMTP id p5mr1577958wes.143.1342714303726;
	Thu, 19 Jul 2012 09:11:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:55 +0100
Message-Id: <5f1df530552e7c020bfa1d9a7db66adb83e5262f.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkI+2lARliQNrY2fSjCzJaZWo841V/f6tkZHIPmTw9F6W/qrxaQGESKInvECsqCgaVwNMHa
Subject: [PATCH 08/26] gconf: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:07 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index d84f981..60c2be2 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -9,7 +9,7 @@ POLKIT_libc-uclibc = ""
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT}"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r10"
+PR = "r11"
 
 inherit gnomebase gtk-doc
 
@@ -26,7 +26,7 @@ POLKIT_OECONF = "--enable-defaults-service"
 POLKIT_OECONF_virtclass-native = "--disable-defaults-service"
 POLKIT_OECONF_libc-uclibc = "--disable-default-service"
 
-EXTRA_OECONF = "--disable-gtk-doc --enable-shared --disable-static --enable-debug=yes \
+EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
                 --disable-introspection --disable-orbit --with-openldap=no ${POLKIT_OECONF} --disable-gtk"
 
 do_install_append() {
-- 
1.7.10



