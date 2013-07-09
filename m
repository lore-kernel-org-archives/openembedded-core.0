Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 477896AFF9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 12:30:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r69CUmjK022359
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jul 2013 05:30:48 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Jul 2013 05:30:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jul 2013 20:30:40 +0800
Message-ID: <d02fa0c512a2df9de058c0679cb9aa346aa331a8.1373372649.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373372649.git.hongxu.jia@windriver.com>
References: <cover.1373372649.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] nss: fix incorrect shebang of perl
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
X-List-Received-Date: Tue, 09 Jul 2013 12:30:47 -0000
Content-Type: text/plain

Replace incorrect shebang of perl with `#! /usr/bin/perl'.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/nss-fix-incorrect-shebang-of-perl.patch  | 110 +++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |   2 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch

diff --git a/meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch b/meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch
new file mode 100644
index 0000000..ae2a6e5
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch
@@ -0,0 +1,110 @@
+nss: fix incorrect shebang of perl
+
+Replace incorrect shebang of perl with `#!/usr/bin/perl'.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Pending
+---
+ nss/cmd/smimetools/smime  | 2 +-
+ nss/coreconf/cpdist.pl    | 2 +-
+ nss/coreconf/import.pl    | 2 +-
+ nss/coreconf/jniregen.pl  | 2 +-
+ nss/coreconf/outofdate.pl | 2 +-
+ nss/coreconf/release.pl   | 2 +-
+ nss/coreconf/version.pl   | 2 +-
+ nss/tests/clean_tbx       | 2 +-
+ nss/tests/path_uniq       | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/nss/cmd/smimetools/smime b/nss/cmd/smimetools/smime
+--- a/nss/cmd/smimetools/smime
++++ b/nss/cmd/smimetools/smime
+@@ -1,4 +1,4 @@
+-#!/usr/local/bin/perl
++#!/usr/bin/perl
+ 
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/cpdist.pl b/nss/coreconf/cpdist.pl
+index 800edfb..652187f 100755
+--- a/nss/coreconf/cpdist.pl
++++ b/nss/coreconf/cpdist.pl
+@@ -1,4 +1,4 @@
+-#! /usr/local/bin/perl
++#!/usr/bin/perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/import.pl b/nss/coreconf/import.pl
+index dd2d177..428eaa5 100755
+--- a/nss/coreconf/import.pl
++++ b/nss/coreconf/import.pl
+@@ -1,4 +1,4 @@
+-#! /usr/local/bin/perl
++#!/usr/bin/perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/jniregen.pl b/nss/coreconf/jniregen.pl
+index 2039180..5f4f69c 100755
+--- a/nss/coreconf/jniregen.pl
++++ b/nss/coreconf/jniregen.pl
+@@ -1,4 +1,4 @@
+-#!/usr/local/bin/perl
++#!/usr/bin/perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/outofdate.pl b/nss/coreconf/outofdate.pl
+index 33d80bb..01fc097 100755
+--- a/nss/coreconf/outofdate.pl
++++ b/nss/coreconf/outofdate.pl
+@@ -1,4 +1,4 @@
+-#!/usr/local/bin/perl
++#!/usr/bin/perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/release.pl b/nss/coreconf/release.pl
+index 7cde19d..b5df2f6 100755
+--- a/nss/coreconf/release.pl
++++ b/nss/coreconf/release.pl
+@@ -1,4 +1,4 @@
+-#! /usr/local/bin/perl
++#!/usr/bin/perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/version.pl b/nss/coreconf/version.pl
+index d2a4942..79359fe 100644
+--- a/nss/coreconf/version.pl
++++ b/nss/coreconf/version.pl
+@@ -1,4 +1,4 @@
+-#!/usr/sbin/perl
++#!/usr/bin/perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/tests/clean_tbx b/nss/tests/clean_tbx
+index 4de9555..a7def9f 100755
+--- a/nss/tests/clean_tbx
++++ b/nss/tests/clean_tbx
+@@ -1,4 +1,4 @@
+-#! /bin/perl
++#!/usr/bin/perl
+ 
+ #######################################################################
+ #
+diff --git a/nss/tests/path_uniq b/nss/tests/path_uniq
+index f29f60a..08fbffa 100755
+--- a/nss/tests/path_uniq
++++ b/nss/tests/path_uniq
+@@ -1,4 +1,4 @@
+-#! /bin/perl
++#!/usr/bin/perl
+ 
+ ########################################################################
+ #
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index a0ea374..22382bc 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466a
 SRC_URI = "\
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
+    file://nss-fix-incorrect-shebang-of-perl.patch \
 "
 SRC_URI_append_class-target += "\
     file://nss.pc.in \
@@ -24,6 +25,7 @@ inherit siteinfo
 PR = "r0"
 DEPENDS = "sqlite3 nspr zlib nss-native"
 DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
+RDEPENDS_${PN} = "perl"
 
 TD = "${S}/tentative-dist"
 TDS = "${S}/tentative-dist-staging"
-- 
1.8.1.2


