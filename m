Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D27E738A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:28:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t249SSs9002042
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 01:28:28 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 01:28:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 01:28:26 -0800
Message-ID: <41b4339c51927331caaa1b69b438760622fc741d.1425461268.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425461268.git.liezhi.yang@windriver.com>
References: <cover.1425461268.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] wget: 1.16.1 -> 1.16.2
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
X-List-Received-Date: Wed, 04 Mar 2015 09:28:30 -0000
Content-Type: text/plain

Update fix_makefile.patch:
* The patch for po/Makefile.in.in is not needed any more since fixed.
* Update the patch for configure.ac

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/wget/wget/fix_makefile.patch |   17 +----------------
 .../wget/{wget_1.16.1.bb => wget_1.16.2.bb}        |    4 ++--
 2 files changed, 3 insertions(+), 18 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.16.1.bb => wget_1.16.2.bb} (45%)

diff --git a/meta/recipes-extended/wget/wget/fix_makefile.patch b/meta/recipes-extended/wget/wget/fix_makefile.patch
index 8ad7c62..eaa2e7e 100644
--- a/meta/recipes-extended/wget/wget/fix_makefile.patch
+++ b/meta/recipes-extended/wget/wget/fix_makefile.patch
@@ -3,26 +3,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-Index: wget-1.12/po/Makefile.in.in
-===================================================================
---- wget-1.12.orig/po/Makefile.in.in	2009-09-04 09:31:54.000000000 -0700
-+++ wget-1.12/po/Makefile.in.in	2011-10-19 20:32:53.714812160 -0700
-@@ -8,8 +8,8 @@
- # Please note that the actual code of GNU gettext is covered by the GNU
- # General Public License and is *not* in the public domain.
- #
--# Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+# Origin: gettext-0.18
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
 Index: wget-1.12/configure.ac
 ===================================================================
 --- wget-1.12.orig/configure.ac	2009-09-22 09:39:49.000000000 -0700
 +++ wget-1.12/configure.ac	2011-10-19 20:32:53.714812160 -0700
-@@ -110,7 +110,7 @@
+@@ -177,7 +177,7 @@
  dnl Gettext
  dnl
  AM_GNU_GETTEXT([external],[need-ngettext])
diff --git a/meta/recipes-extended/wget/wget_1.16.1.bb b/meta/recipes-extended/wget/wget_1.16.2.bb
similarity index 45%
rename from meta/recipes-extended/wget/wget_1.16.1.bb
rename to meta/recipes-extended/wget/wget_1.16.2.bb
index ca6f0fe..8a0161d 100644
--- a/meta/recipes-extended/wget/wget_1.16.1.bb
+++ b/meta/recipes-extended/wget/wget_1.16.2.bb
@@ -2,7 +2,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \
           "
 
-SRC_URI[md5sum] = "5d12410a398ec9907e105e8734561ba0"
-SRC_URI[sha256sum] = "3b834ce69366d4681f295307fce36ee14e122c4ee68a4d1291b62b0b26755a77"
+SRC_URI[md5sum] = "d33b130ff23155e360d0a5172575bf56"
+SRC_URI[sha256sum] = "311a28f211117a338501009bfaba5bfeb9cd71564a7b9ad5775b8f5f4369f972"
 
 require wget.inc
-- 
1.7.9.5


