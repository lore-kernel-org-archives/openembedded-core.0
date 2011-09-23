Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnE-0006S1-C6
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:16 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so4179714bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5vBi7x4Pm2Xxi2cKGzFswp/sxqIg1KmzdLdAKpfL+C0=;
	b=Y/BgwVs+naXSl/feYkmkGCVAMqlpHLRWUoFZ6c6zkrLsOGhXupXbSD6JMNSanr7Fgc
	WKIPFoK45brMkSZwy1krnzuE69sjeOmLwdrWQsIuo1WdMdjXWXBPxYGpXMk/R8/tzG3r
	3yXi8N0IHt26mO1LfYlDM+KRSJ5zFdP54qa1s=
Received: by 10.204.138.204 with SMTP id b12mr2768629bku.71.1316807216622;
	Fri, 23 Sep 2011 12:46:56 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.46.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:46:55 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:35 +0400
Message-Id: <1316807201-22623-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 04/10] dbus-glib: include bash-completion stuff
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
X-List-Received-Date: Fri, 23 Sep 2011 19:52:16 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib.inc     |    4 +++-
 meta/recipes-core/dbus/dbus-glib_0.92.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 704dc04..7688a0f 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -19,7 +19,9 @@ EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-in
                 --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 EXTRA_OECONF_virtclass-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
-FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN} = "${libdir}/lib*.so.* \
+               ${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
+	       ${libexecdir}/dbus-bash-completion-helper"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
 
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



