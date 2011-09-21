Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rnm-0001GK-QI
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:46 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123691bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=hwWTBt+27L7x3xJJbwM2PuAHydaRZtjv25GUIchKGqo=;
	b=ulTgEe1XNomJhg5xaEKQyt1KxYgOchTNeIxGNIei6LJ6oXETugfRiQH+MFY01KG/Xg
	CKHfP31atJdvVZ8WVZO8tHMZY0Ms/8awkiZH1pzntnnd3EGYJVxM4DAhDGh66uuwTHBX
	cmNifqg751yOEFgOLKYOKkFqQ2IhP3ZSGuylk=
Received: by 10.204.146.155 with SMTP id h27mr810436bkv.353.1316630430363;
	Wed, 21 Sep 2011 11:40:30 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:29 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:56 +0400
Message-Id: <1316630404-10336-9-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 09/17] dbus-glib: disable bash-completion
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:46 -0000

Bash completion stuff isn't packaged and used. Stop building it by
passing --disable-bash-completion to configure

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib.inc     |    3 ++-
 meta/recipes-core/dbus/dbus-glib_0.92.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 704dc04..959fa64 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -16,7 +16,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz
 inherit autotools pkgconfig gettext
 
 EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml \
-                --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
+                --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool \
+                --disable-bash-completion"
 EXTRA_OECONF_virtclass-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
 FILES_${PN} = "${libdir}/lib*.so.*"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.92.bb b/meta/recipes-core/dbus/dbus-glib_0.92.bb
index 72bea89..c7266d4 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.92.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.92.bb
@@ -1,6 +1,6 @@
 require dbus-glib.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "b595b36890c4f9f8f5d5dec131c495f8"
 SRC_URI[sha256sum] = "5a7fd4cf937cdcb7f2eed61341b70ee0f2607450a50db381618598adf60dd40e"
-- 
1.7.2.5



