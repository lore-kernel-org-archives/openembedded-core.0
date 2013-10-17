Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 308BF61000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:59:02 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Thu, 17 Oct 2013 16:58:57 +0200 (CEST)
Received: from localhost.localdomain (host-95-199-9-14.mobileonline.telia.com
	[95.199.9.14]) (Authenticated sender: petter@technux.se)
	by smtp-05-01.atm.binero.net (Postfix) with ESMTPSA id 23BF73A168;
	Thu, 17 Oct 2013 16:58:57 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 16:58:49 +0200
Message-Id: <bc8fa586a4f02b66150aa279024d6907d7122ba6.1381985833.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381985833.git.petter@technux.se>
References: <cover.1381985833.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 1/1] clutter: remove usage of FILESPATH
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
X-List-Received-Date: Thu, 17 Oct 2013 14:59:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
However in clutter the default paths solves the problem if we
put all patches in ${BP} directory instead.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/classes/clutter.bbclass                       |    1 -
 .../enable_tests.patch                             |    0
 .../fix-wayland-deps.patch                         |    0
 .../cogl-1.14.patch                                |    0
 .../enable-tests.patch                             |    0
 .../fix-build-dir.patch                            |    0
 .../fix-test-includes.patch                        |    0
 7 files changed, 1 deletion(-)
 rename meta/recipes-graphics/clutter/{clutter-1.14 => clutter-1.0-1.14.4}/enable_tests.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-1.14 => clutter-1.0-1.14.4}/fix-wayland-deps.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst-1.6 => clutter-gst-1.0-1.6.0}/cogl-1.14.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst => clutter-gst-1.0-1.6.0}/enable-tests.patch (100%)
 rename meta/recipes-graphics/mx/{mx-1.4 => mx-1.0-1.4.7+gitAUTOINC+9b1db6b806}/fix-build-dir.patch (100%)
 rename meta/recipes-graphics/mx/{mx => mx-1.0-1.4.7+gitAUTOINC+9b1db6b806}/fix-test-includes.patch (100%)

diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
index 66a49bc..167407d 100644
--- a/meta/classes/clutter.bbclass
+++ b/meta/classes/clutter.bbclass
@@ -11,7 +11,6 @@ def get_real_name(n):
 
 VERMINOR = "${@get_minor_dir("${PV}")}"
 REALNAME = "${@get_real_name("${BPN}")}"
-FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${REALNAME}-${PV}", "${FILE_DIRNAME}/${REALNAME}-${VERMINOR}", "${FILE_DIRNAME}/${REALNAME}", "${FILE_DIRNAME}/files"], d)}"
 
 CLUTTER_SRC_FTP = "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.tar.xz;name=archive"
 
diff --git a/meta/recipes-graphics/clutter/clutter-1.14/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-1.0-1.14.4/enable_tests.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/clutter-1.14/enable_tests.patch
rename to meta/recipes-graphics/clutter/clutter-1.0-1.14.4/enable_tests.patch
diff --git a/meta/recipes-graphics/clutter/clutter-1.14/fix-wayland-deps.patch b/meta/recipes-graphics/clutter/clutter-1.0-1.14.4/fix-wayland-deps.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/clutter-1.14/fix-wayland-deps.patch
rename to meta/recipes-graphics/clutter/clutter-1.0-1.14.4/fix-wayland-deps.patch
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.6/cogl-1.14.patch b/meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/clutter-gst-1.6/cogl-1.14.patch
rename to meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable-tests.patch b/meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/enable-tests.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/clutter-gst/enable-tests.patch
rename to meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/enable-tests.patch
diff --git a/meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch b/meta/recipes-graphics/mx/mx-1.0-1.4.7+gitAUTOINC+9b1db6b806/fix-build-dir.patch
similarity index 100%
rename from meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch
rename to meta/recipes-graphics/mx/mx-1.0-1.4.7+gitAUTOINC+9b1db6b806/fix-build-dir.patch
diff --git a/meta/recipes-graphics/mx/mx/fix-test-includes.patch b/meta/recipes-graphics/mx/mx-1.0-1.4.7+gitAUTOINC+9b1db6b806/fix-test-includes.patch
similarity index 100%
rename from meta/recipes-graphics/mx/mx/fix-test-includes.patch
rename to meta/recipes-graphics/mx/mx-1.0-1.4.7+gitAUTOINC+9b1db6b806/fix-test-includes.patch
-- 
1.7.9.5


