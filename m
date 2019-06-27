Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5657C5C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 05:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B6FC5184D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:00:58 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id SsKGGmh_2H8q
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:00:57 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id EA85A184C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:00:56 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D08381A062
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:00:56 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C48411A05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:00:56 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:00:56 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by thoth.se.axis.com (Postfix) with ESMTP id B828E1F8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:00:56 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x5R50ujJ029654
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:00:56 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x5R50uV9029653
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Jun 2019 07:00:56 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 07:00:49 +0200
Message-Id: <20190627050049.29602-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH] glib-2.0: Update to 2.60.4
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
X-List-Received-Date: Thu, 27 Jun 2019 05:00:58 -0000
Content-Transfer-Encoding: 8bit

* For changes, see:
  https://gitlab.gnome.org/GNOME/glib/blob/glib-2-60/NEWS
* Remove backported CVE-2019-12450.patch.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../glib-2.0/glib-2.0/CVE-2019-12450.patch    | 62 -------------------
 ...{glib-2.0_2.60.3.bb => glib-2.0_2.60.4.bb} |  5 +-
 2 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.60.3.bb => glib-2.0_2.60.4.bb} (85%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
deleted file mode 100644
index 59e49195cc..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-glib-2.0: fix CVE-2019-12450
-
-Not in release 2.61.1.
-
-CVE: CVE-2019-12450
-
-Upstream-Status: Backport [github.com/GNOME/glib.git]
-Signed-off-by: Joe Slater <joe.slater@windrivere.com>
----
-From d8f8f4d637ce43f8699ba94c9b7648beda0ca174 Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Thu, 23 May 2019 10:41:53 +0200
-Subject: [PATCH] gfile: Limit access to files when copying
-
-file_copy_fallback creates new files with default permissions and
-set the correct permissions after the operation is finished. This
-might cause that the files can be accessible by more users during
-the operation than expected. Use G_FILE_CREATE_PRIVATE for the new
-files to limit access to those files.
----
- gio/gfile.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/gio/gfile.c b/gio/gfile.c
-index 24b136d80..74b58047c 100644
---- a/gio/gfile.c
-+++ b/gio/gfile.c
-@@ -3284,12 +3284,12 @@ file_copy_fallback (GFile                  *source,
-         out = (GOutputStream*)_g_local_file_output_stream_replace (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
-                                                                    FALSE, NULL,
-                                                                    flags & G_FILE_COPY_BACKUP,
--                                                                   G_FILE_CREATE_REPLACE_DESTINATION,
--                                                                   info,
-+                                                                   G_FILE_CREATE_REPLACE_DESTINATION |
-+                                                                   G_FILE_CREATE_PRIVATE, info,
-                                                                    cancellable, error);
-       else
-         out = (GOutputStream*)_g_local_file_output_stream_create (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
--                                                                  FALSE, 0, info,
-+                                                                  FALSE, G_FILE_CREATE_PRIVATE, info,
-                                                                   cancellable, error);
-     }
-   else if (flags & G_FILE_COPY_OVERWRITE)
-@@ -3297,12 +3297,13 @@ file_copy_fallback (GFile                  *source,
-       out = (GOutputStream *)g_file_replace (destination,
-                                              NULL,
-                                              flags & G_FILE_COPY_BACKUP,
--                                             G_FILE_CREATE_REPLACE_DESTINATION,
-+                                             G_FILE_CREATE_REPLACE_DESTINATION |
-+                                             G_FILE_CREATE_PRIVATE,
-                                              cancellable, error);
-     }
-   else
-     {
--      out = (GOutputStream *)g_file_create (destination, 0, cancellable, error);
-+      out = (GOutputStream *)g_file_create (destination, G_FILE_CREATE_PRIVATE, cancellable, error);
-     }
- 
-   if (!out)
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.4.bb
similarity index 85%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.60.4.bb
index 5942241de5..f7280090bb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.4.bb
@@ -16,11 +16,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
-           file://CVE-2019-12450.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 SRC_URI_append_class-target = " file://glib-meson.cross"
 
-SRC_URI[md5sum] = "112a850caa8d2c21e24d4c9844e8b1fe"
-SRC_URI[sha256sum] = "04ab0d560d45790d055f50db2d69974eab8b693a77390075462c56e652b760b9"
+SRC_URI[md5sum] = "87e2c4973470811dfed3d6746c961488"
+SRC_URI[sha256sum] = "2b941ec5dcb92e5ea83fe42f9eb55a827bc8a12c153ad2489d551c31d04733dd"
-- 
2.21.0


