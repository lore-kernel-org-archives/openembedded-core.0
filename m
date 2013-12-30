Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF8F6B4F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 02:00:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU20QEa017609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 18:00:26 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 29 Dec 2013 18:00:26 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Dec 2013 18:02:28 +0800
Message-ID: <4924171c439ba9ea9b304ca87ee6cea431d1aeac.1388397582.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388397582.git.liezhi.yang@windriver.com>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] make: remove the obsolete SCCS.patch
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
X-List-Received-Date: Mon, 30 Dec 2013 02:00:25 -0000
Content-Type: text/plain

This patch is used for removing SCCS/*s.conftest, but there is no SCCS
directory from 3.81, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/make/files/SCCS.patch | 17 -----------------
 meta/recipes-devtools/make/make.inc         |  3 +--
 2 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/files/SCCS.patch

diff --git a/meta/recipes-devtools/make/files/SCCS.patch b/meta/recipes-devtools/make/files/SCCS.patch
deleted file mode 100644
index c7ec3bd..0000000
--- a/meta/recipes-devtools/make/files/SCCS.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- make-3.80/configure.in~SCCS
-+++ make-3.80/configure.in
-@@ -264,7 +264,7 @@
-            [Define this if the SCCS 'get' command understands the '-G<file>' option.]);;
-   esac
- fi
--rm -f s.conftest conftoast
-+rm -f s.conftest conftoast SCCS/*s.conftest
- 
- # Check the system to see if it provides GNU glob.  If not, use our
- # local version.
diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index 5de74e4..2e90eca 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -5,7 +5,6 @@ called the makefile, which lists each of the non-source files and how to compute
 HOMEPAGE = "http://www.gnu.org/software/make/"
 SECTION = "devel"
 
-SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
-           file://SCCS.patch"
+SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2"
 
 inherit autotools gettext
-- 
1.8.3.1


