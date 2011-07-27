Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QmD6C-0004F3-Tg
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:01:09 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6RMurMh004891
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:56:53 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:56:46 -0700
Message-Id: <d8f714075dcbe37ef21b17639f91a8faeb868bf1.1311807353.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
Subject: [PATCH 2/9] tcl: Add tcl_cv_api_serial to siteinfo
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
X-List-Received-Date: Wed, 27 Jul 2011 23:01:09 -0000

This comes from oe.dev which had this set for arm-linux only.  Bump PR
since this changes how builds happen.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    2 +-
 meta/site/common-glibc                   |    2 ++
 meta/site/common-uclibc                  |    3 +++
 3 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
index 12e2bd0..7dcaeb3 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r0"
+PR = "r1"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 8cfa695..baca5f8 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -69,3 +69,5 @@ gl_cv_func_mbrtowc_null_arg=${gl_cv_func_mbrtowc_null_arg=yes}
 gl_cv_func_mbrtowc_retval=${gl_cv_func_mbrtowc_retval=yes}
 gl_cv_func_mbrtowc_nul_retval=${gl_cv_func_mbrtowc_nul_retval=yes}
 
+# TCL
+tcl_cv_api_serial=${tcl_cv_api_serial=termios}
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index 093f60e..002a559 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -26,3 +26,6 @@ ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 # bash
 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
 bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
+
+# TCL
+tcl_cv_api_serial=${tcl_cv_api_serial=termios}
-- 
1.7.0.4



