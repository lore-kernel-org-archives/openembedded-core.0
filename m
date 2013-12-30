Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA0C56B181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3ZGke018273
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:16 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:16 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:34:55 -0500
Message-ID: <4aa6fa7f733d83d9599415bfe3169caa379b3f38.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/14] gstreamer: fix unrecognised options
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:16 -0000
Content-Type: text/plain

Fix the following options:

--disable-docs-build: replace with --disable-docbook --disable-gtk-doc
--with-check=no: replace with --disable-check

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
index 90b1982..4282f07 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
@@ -21,7 +21,11 @@ SRC_URI[sha256sum] = "e556a529e0a8cf1cd0afd0cab2af5488c9524e7c3f409de29b5d82bb41
 inherit autotools pkgconfig gettext
 
 GSTREAMER_DEBUG ?= "--disable-debug"
-EXTRA_OECONF = "--disable-docs-build --disable-dependency-tracking --with-check=no --disable-examples --disable-tests --disable-valgrind ${GSTREAMER_DEBUG}"
+EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
+            --disable-dependency-tracking --disable-check \
+            --disable-examples --disable-tests \
+            --disable-valgrind ${GSTREAMER_DEBUG} \
+            "
 
 # apply gstreamer hack after Makefile.in.in in source is replaced by our version from
 # ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed
-- 
1.7.10.4


