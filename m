Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5M-0004Vi-3s
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736792"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:34 -0700
Message-Id: <9073ec0610a9e28c4b2bc90ace7a6b1c0cc99f75.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/18] web-webkit: push make whitespace fix upstream
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:16 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/web/web-webkit/make-382.patch |   17 -----------------
 meta/recipes-sato/web/web-webkit_git.bb         |    7 +++----
 2 files changed, 3 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch

diff --git a/meta/recipes-sato/web/web-webkit/make-382.patch b/meta/recipes-sato/web/web-webkit/make-382.patch
deleted file mode 100644
index 3689435..0000000
--- a/meta/recipes-sato/web/web-webkit/make-382.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Make 3.82 does not allow 8 spaces instead of a tab
-
-JL - 15/12/10
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: webkit/Makefile.am
-===================================================================
---- webkit.orig/Makefile.am
-+++ webkit/Makefile.am
-@@ -5,5 +5,5 @@ SUBDIRS = src data
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
- 
diff --git a/meta/recipes-sato/web/web-webkit_git.bb b/meta/recipes-sato/web/web-webkit_git.bb
index 57cd545..dae7faf 100644
--- a/meta/recipes-sato/web/web-webkit_git.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -11,13 +11,12 @@ DEPENDS = "glib-2.0 gtk+ webkit-gtk libowl"
 # To access https web pages
 RRECOMMENDS_${PN} += "glib-networking"
 
-SRCREV = "0f7019acd9db5383c732d0524c7c3a5eaec9be2b"
+SRCREV = "b0676c190f876cbdb1df202fbcec42f212374503"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://link-with-g++.patch \
-	   file://make-382.patch"
+           file://link-with-g++.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.7.6



