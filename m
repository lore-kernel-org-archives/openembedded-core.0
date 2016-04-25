Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6D9471951
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:51:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3PDpn1p009498
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 06:51:49 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 06:51:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2016 06:51:43 -0700
Message-ID: <e76f32f4bb513453ffd80704adf19540b8f35d2a.1461592183.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1461592183.git.liezhi.yang@windriver.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
Subject: [PATCH 6/6] libxsettings-client: fix LICENSE
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
X-List-Received-Date: Mon, 25 Apr 2016 13:51:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The tarball has a COPYING file now, and is GPLv2+.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libxsettings-client/MIT-style-license          | 22 ----------------------
 .../libxsettings-client_0.10.bb                    | 13 ++-----------
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license

diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license b/meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license
deleted file mode 100644
index 628de98..0000000
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * Copyright © 2001 Red Hat, Inc.
- *
- * Permission to use, copy, modify, distribute, and sell this software and its
- * documentation for any purpose is hereby granted without fee, provided that
- * the above copyright notice appear in all copies and that both that
- * copyright notice and this permission notice appear in supporting
- * documentation, and that the name of Red Hat not be used in advertising or
- * publicity pertaining to distribution of the software without specific,
- * written prior permission.  Red Hat makes no representations about the
- * suitability of this software for any purpose.  It is provided "as is"
- * without express or implied warranty.
- *
- * RED HAT DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL RED HAT
- * BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
- * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN 
- * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
- *
- * Author:  Owen Taylor, Red Hat, Inc.
- */
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
index 67c5e27..2999653 100644
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
+++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
@@ -6,8 +6,8 @@ desktop."
 HOMEPAGE = "http://matchbox-project.org/sources/optional-dependencies/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 SECTION = "x/libs"
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://xsettings-client.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
                     file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
 DEPENDS = "virtual/libx11"
@@ -17,7 +17,6 @@ PR = "r5"
 headers = "xsettings-common.h xsettings-client.h"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/optional-dependencies/Xsettings-client-0.10.tar.gz \
-        file://MIT-style-license \
         file://link-x11.patch;apply=yes \
         file://obsolete_automake_macros.patch \
 "
@@ -30,11 +29,3 @@ S = "${WORKDIR}/Xsettings-client-0.10"
 inherit autotools gettext distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-
-do_configure_prepend() {
-    # This package doesn't ship with its own COPYING file and
-    # autotools will install a GPLv2 one instead of the actual MIT-style license here.
-    # Add the correct license here to avoid confusion.
-    cp -f ${WORKDIR}/MIT-style-license ${S}/COPYING
-}
-
-- 
2.7.4


