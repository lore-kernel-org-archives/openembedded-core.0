Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7HJ5-0003Ta-BQ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 03:17:47 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D0A7730511
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 22:08:57 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 19:08:47 -0700
Message-Id: <2e3c4ca4c3c2dfc8b8e1333e61b239251b4f4efb.1331604310.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331604310.git.scott.a.garman@intel.com>
References: <cover.1331604310.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331604310.git.scott.a.garman@intel.com>
References: <cover.1331604310.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D0A7730511.C9B21
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/3] gettext: do not set libncurses prefix explicitly
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
X-List-Received-Date: Tue, 13 Mar 2012 02:17:47 -0000

The --with-libncurses-prefix configure option was added before
this recipe had ncurses in DEPENDS, so it should be safe to
remove it.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 3c65dca..daee5c0 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPL-3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r7"
+PR = "r8"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -21,8 +21,6 @@ SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
 SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
 SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
 
-#PARALLEL_MAKE = ""
-
 inherit autotools
 
 EXTRA_OECONF += "--without-lispdir \
@@ -32,7 +30,6 @@ EXTRA_OECONF += "--without-lispdir \
                  --disable-native-java \
                  --disable-openmp \
                  --with-included-glib \
-                 --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
-- 
1.7.5.4



