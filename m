Return-Path: <igor.santos@aker.com.br>
X-Greylist: delayed 605 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 May 2015 22:04:52 UTC
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id EAE0E73755
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 22:04:51 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Wed, 6 May 2015 19:04:51 -0300
	(envelope-from igor.santos@aker.com.br)
Received: from igor.santos.devel.com.br (10.4.59.1) by mail.aker.com.br
	(10.0.0.20) with Microsoft SMTP Server id 8.3.342.0;
	Wed, 6 May 2015 18:38:55 -0300
From: Igor Santos <igor.santos@aker.com.br>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 May 2015 18:38:47 -0300
Message-ID: <1430948328-17891-2-git-send-email-igor.santos@aker.com.br>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>
References: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: a5fc2d2b506f49fc2bd6d1c7ad2f56ee346d5d27
X-AkerSMTPGW-MessageID: d0bec033b331658920a0b77a7dc334de7407db8e-15o
Subject: [PATCH 1/2] ctags: add
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
X-List-Received-Date: Wed, 06 May 2015 22:04:53 -0000
Content-Type: text/plain

Ctags generates an index (or tag) file of language objects found in
source files that allows these items to be quickly and easily located by
a text editor or other utility. A tag signifies a language object for
which an index entry is available (or, alternatively, the index entry
created for that object).

Signed-off-by: Igor Santos <igor.santos@aker.com.br>
---
 meta/recipes-devtools/ctags/ctags_5.8.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/ctags/ctags_5.8.bb

diff --git a/meta/recipes-devtools/ctags/ctags_5.8.bb b/meta/recipes-devtools/ctags/ctags_5.8.bb
new file mode 100644
index 0000000..fa73cbb
--- /dev/null
+++ b/meta/recipes-devtools/ctags/ctags_5.8.bb
@@ -0,0 +1,27 @@
+# Copyright (C) 2015 Igor Santos <igor.santos@aker.com.br>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Exuberant Ctags"
+DESCRIPTION = "Exuberant Ctags is a multilanguage reimplementation of the \
+               Unix ctags utility. Ctags generates an index of source code \
+               definitions which is used by numerous editors and utilities \
+               to instantly locate the definitions."
+
+HOMEPAGE = "http://ctags.sourceforge.net/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+inherit autotools-brokensep
+
+SRC_URI = "http://prdownloads.sourceforge.net/${PN}/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c00f82ecdcc357434731913e5b48630d"
+SRC_URI[sha256sum] = "0e44b45dcabe969e0bbbb11e30c246f81abe5d32012db37395eb57d66e9e99c7"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${B}/ctags ${D}${bindir}/
+    install -d ${D}${mandir}/man1/
+    install -m 644 ${B}/ctags.1 ${D}${mandir}/man1/
+}
-- 
2.1.0



