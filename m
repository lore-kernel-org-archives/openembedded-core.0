Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFAF606A8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 17:58:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0DHwdJW031826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 13 Jan 2018 17:58:42 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eaQ4l-0004GS-Qa; Sat, 13 Jan 2018 17:58:39 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jan 2018 17:58:37 +0000
Message-Id: <1515866318-16353-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] json-glib: Add dependency on gettext-native
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
X-List-Received-Date: Sat, 13 Jan 2018 17:58:45 -0000

Avoids:

Meson encountered an error in file po/meson.build, line 58, column 5:
Can not do gettext because xgettext is not installed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/json-glib/json-glib_1.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb b/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
index 88653ef..31912d1 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
@@ -17,7 +17,7 @@ SRC_URI[archive.md5sum] = "ff31e7d0594df44318e12facda3d086e"
 SRC_URI[archive.sha256sum] = "fd55a9037d39e7a10f0db64309f5f0265fa32ec962bf85066087b83a2807f40a"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase lib_package gobject-introspection gtk-doc manpages
+inherit gnomebase lib_package gobject-introspection gtk-doc manpages gettext
 
 GTKDOC_ENABLE_FLAG = "-Denable-gtk-doc=true"
 GTKDOC_DISABLE_FLAG = "-Denable-gtk-doc=false"
-- 
2.7.4


