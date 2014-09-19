Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D20C65CE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 06:49:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8J6nPBS023446
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 23:49:25 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 23:49:25 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Sep 2014 14:49:30 +0800
Message-ID: <1411109370-27814-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2] pinentry: add recipes
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
X-List-Received-Date: Fri, 19 Sep 2014 06:49:26 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

gnupg 5.0 needs pinentry to work, refer to
[http://rdist.root.org/2007/04/26/gpg-now-requires-pinentry-package/]

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/pinentry/pinentry_0.8.4.bb |   31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/pinentry/pinentry_0.8.4.bb

diff --git a/meta/recipes-support/pinentry/pinentry_0.8.4.bb b/meta/recipes-support/pinentry/pinentry_0.8.4.bb
new file mode 100644
index 0000000..e20ebb3
--- /dev/null
+++ b/meta/recipes-support/pinentry/pinentry_0.8.4.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Collection of simple PIN or passphrase entry dialogs"
+DESCRIPTION = "\
+	Pinentry is a collection of simple PIN or passphrase entry dialogs which \
+	utilize the Assuan protocol as described by the aegypten project; see \
+	http://www.gnupg.org/aegypten/ for details. \
+	This package contains the curses (text) based version of the PIN entry dialog."
+
+HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
+
+DEPENDS = "libcap ncurses"
+
+inherit autotools
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
+	"
+
+SRC_URI[md5sum] = "e2b6f94471ba1e978f6e5bf6b275189b"
+SRC_URI[sha256sum] = "359db3bf46cb743ba0b3aeef259f6107271ca888ba3e22c1cba525c9aca35612"
+
+EXTRA_OECONF = "--disable-pinentry-gtk\
+		--disable-pinentry-gtk2 \
+		--disable-pinentry-qt \
+		--disable-pinentry-qt4 \
+		--with-ncurses-include-dir=${STAGING_LIBDIR}/.. \
+		--disable-rpath \
+		--disable-dependency-tracking \
+		--disable-glibtest \
+                --with-libcap=${STAGING_LIBDIR}/.. \
+               "
-- 
1.7.10.4


