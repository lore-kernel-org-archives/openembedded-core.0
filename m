Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7879C72615
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 22:55:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBGMtKUT000720
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 14:55:20 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Dec 2014 14:55:20 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Dec 2014 14:55:20 -0800
Message-ID: <1418770520-14710-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] gcc runtime: specify license on a per package basis
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
X-List-Received-Date: Tue, 16 Dec 2014 22:55:29 -0000
Content-Type: text/plain

It can be alarming to attempt to exclude GPLv3 from an
image but find that libstdc++ and libgcc still show it.
We indicate the license for each package to show libraries
that really are just GCC-3.0-with-GCC-exception.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc |   31 +++++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc.inc      |    7 +++++++
 2 files changed, 38 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 0348bc4..bc36b18 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -92,6 +92,37 @@ PACKAGES = "\
     libatomic-dev \
     libatomic-staticdev \
 "
+
+# Most libraries are licensed with the exception, but
+# one library is really GPLv3.
+#
+LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception & GPLv3"
+LICENSE_libstdc++ = "GPL-3.0-with-GCC-exception"
+LICENSE_libstdc++-precompile-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libstdc++-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libstdc++-staticdev = "GPL-3.0-with-GCC-exception"
+LICENSE_libg2c = "GPL-3.0-with-GCC-exception"
+LICENSE_libg2c-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libssp = "GPL-3.0-with-GCC-exception"
+LICENSE_libssp-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libssp-staticdev = "GPL-3.0-with-GCC-exception"
+LICENSE_libgfortran = "GPL-3.0-with-GCC-exception"
+LICENSE_libgfortran-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libgfortran-staticdev = "GPL-3.0-with-GCC-exception"
+LICENSE_libmudflap = "GPL-3.0-with-GCC-exception"
+LICENSE_libmudflap-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libmudflap-staticdev = "GPL-3.0-with-GCC-exception"
+LICENSE_libquadmath = "GPL-3.0-with-GCC-exception"
+LICENSE_libquadmath-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libquadmath-staticdev = "GPL-3.0-with-GCC-exception"
+LICENSE_libatomic = "GPL-3.0-with-GCC-exception"
+LICENSE_libatomic-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libatomic-staticdev = "GPL-3.0-with-GCC-exception"
+
+LICENSE_libgomp = "GPLv3"
+LICENSE_libgomp-dev = "GPLv3"
+LICENSE_libgomp-staticdev = "GPLv3"
+
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
 
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 22c42d5..21cb8c1 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -9,6 +9,13 @@ PACKAGES = "\
     libgcov-dev \
 "
 
+# All libgcc source is marked with the exception.
+#
+LICENSE_${PN} = "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
+
+
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
-- 
1.7.9.5


