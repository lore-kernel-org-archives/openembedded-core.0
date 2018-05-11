Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA7B75463
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 02:19:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4B2JmUl011314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 19:19:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 10 May 2018 19:19:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 May 2018 10:20:20 +0800
Message-ID: <ffc349e5f97e7ff62aa6e60f52887f57e615f808.1526004301.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526004301.git.Qi.Chen@windriver.com>
References: <cover.1526004301.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] dbus-glib: upgrade to 0.110
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2018 02:19:47 -0000
Content-Type: text/plain

The obsolete '--with-introspect-xml' option is removed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/dbus-glib.inc      | 4 +---
 meta/recipes-core/dbus/dbus-glib_0.108.bb | 4 ----
 meta/recipes-core/dbus/dbus-glib_0.110.bb | 4 ++++
 3 files changed, 5 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.108.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.110.bb

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 55f710f..16dbf4f 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -22,9 +22,7 @@ inherit autotools pkgconfig gettext bash-completion gtk-doc
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[tests] = "--enable-tests,,,"
 
-EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml \
-                --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
-EXTRA_OECONF_class-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
+EXTRA_OECONF_class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 
 PACKAGES += "${PN}-tests"
 
diff --git a/meta/recipes-core/dbus/dbus-glib_0.108.bb b/meta/recipes-core/dbus/dbus-glib_0.108.bb
deleted file mode 100644
index 7a9a69e..0000000
--- a/meta/recipes-core/dbus/dbus-glib_0.108.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dbus-glib.inc
-
-SRC_URI[md5sum] = "a66a613705870752ca9786e0359aea97"
-SRC_URI[sha256sum] = "9f340c7e2352e9cdf113893ca77ca9075d9f8d5e81476bf2bf361099383c602c"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.110.bb b/meta/recipes-core/dbus/dbus-glib_0.110.bb
new file mode 100644
index 0000000..8120505
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib_0.110.bb
@@ -0,0 +1,4 @@
+require dbus-glib.inc
+
+SRC_URI[md5sum] = "d7cebf1d69445cbd28b4983392145192"
+SRC_URI[sha256sum] = "7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825"
-- 
1.9.1


