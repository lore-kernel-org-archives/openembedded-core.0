Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9dTw-0001Tw-1s
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 15:50:28 +0200
Received: by ywf7 with SMTP id 7so1503253ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=phjd0GoGC66rtvJZPttE6vhiY2IXz/eAPLYRCBu/hZo=;
	b=LCWsEurSLJIcKqiRUFVlcn9MnE/0Kv/cirfqIkJypP7hFaLF++RD1Qwvx+UwSl+Ax0
	6JOq+EjS5eXKmBXSKWV93cBJ7NuXn6E+UvKbyb6Hg3+RhCBGggvP8bd77VimjUSEjzup
	+49WrJuzWN6lE8HT8DDN0inm+SilXETEP64ac=
Received: by 10.223.53.78 with SMTP id l14mr7950421fag.140.1317390297720;
	Fri, 30 Sep 2011 06:44:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm6777235fab.12.2011.09.30.06.44.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 06:44:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 15:44:50 +0200
Message-Id: <1317390290-15933-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [PATCH] json-glib: upgrade to 0.14.0
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
X-List-Received-Date: Fri, 30 Sep 2011 13:50:28 -0000

* 0.12.4 fails to build with glib-2.30.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/json-glib/json-glib_0.12.4.bb |   20 --------------------
 meta/recipes-gnome/json-glib/json-glib_0.14.0.bb |   18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
 create mode 100644 meta/recipes-gnome/json-glib/json-glib_0.14.0.bb

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb b/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
deleted file mode 100644
index 5bd9dcd..0000000
--- a/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "JSON-GLib implements a full JSON parser using GLib and GObject."
-DESCRIPTION = "Use JSON-GLib it is possible to parse and generate valid JSON\
- data structures, using a DOM-like API. JSON-GLib also offers GObject \
-integration, providing the ability to serialize and deserialize GObject \
-instances to and from JSON data types."
-HOMEPAGE = "http://live.gnome.org/JsonGlib"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-DEPENDS = "glib-2.0"
-
-SRC_URI[archive.md5sum] = "347e1714e4a2ce54298969d5ffec7dca"
-SRC_URI[archive.sha256sum] = "462cd611016ae189d5e3f258dc7741e6a2e8267404b4e3806aaf346d50f1df7e"
-
-PR = "r0"
-
-inherit gnome
-
-EXTRA_OECONF = "--disable-introspection"
diff --git a/meta/recipes-gnome/json-glib/json-glib_0.14.0.bb b/meta/recipes-gnome/json-glib/json-glib_0.14.0.bb
new file mode 100644
index 0000000..8635bf0
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib_0.14.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "JSON-GLib implements a full JSON parser using GLib and GObject."
+DESCRIPTION = "Use JSON-GLib it is possible to parse and generate valid JSON\
+ data structures, using a DOM-like API. JSON-GLib also offers GObject \
+integration, providing the ability to serialize and deserialize GObject \
+instances to and from JSON data types."
+HOMEPAGE = "http://live.gnome.org/JsonGlib"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+DEPENDS = "glib-2.0"
+
+SRC_URI[archive.md5sum] = "6ba14cc2cc9582250451ff645c20a779"
+SRC_URI[archive.sha256sum] = "efa6a22711c99208feef3bdcd6692573640ac7635725417024980b80990a2966"
+
+inherit gnome gettext
+
+EXTRA_OECONF = "--disable-introspection"
-- 
1.7.6.1



