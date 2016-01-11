Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12EED73212
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:19:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B7JUMp019661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 23:19:31 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 23:19:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 23:19:23 -0800
Message-ID: <3d50e5ee5609ca8412dda2842467ded9c4002cec.1452496745.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452496745.git.liezhi.yang@windriver.com>
References: <cover.1452496745.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] wget: 1.17 -> 1.17.1
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
X-List-Received-Date: Mon, 11 Jan 2016 07:19:30 -0000
Content-Type: text/plain

* Remove fix_makefile.patch, it is already in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/wget/wget/fix_makefile.patch |   18 ------------------
 .../wget/{wget_1.17.bb => wget_1.17.1.bb}          |    5 ++---
 2 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget/fix_makefile.patch
 rename meta/recipes-extended/wget/{wget_1.17.bb => wget_1.17.1.bb} (47%)

diff --git a/meta/recipes-extended/wget/wget/fix_makefile.patch b/meta/recipes-extended/wget/wget/fix_makefile.patch
deleted file mode 100644
index eaa2e7e..0000000
--- a/meta/recipes-extended/wget/wget/fix_makefile.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: wget-1.12/configure.ac
-===================================================================
---- wget-1.12.orig/configure.ac	2009-09-22 09:39:49.000000000 -0700
-+++ wget-1.12/configure.ac	2011-10-19 20:32:53.714812160 -0700
-@@ -177,7 +177,7 @@
- dnl Gettext
- dnl
- AM_GNU_GETTEXT([external],[need-ngettext])
--AM_GNU_GETTEXT_VERSION([0.17])
-+AM_GNU_GETTEXT_VERSION([0.18])
- 
- AC_PROG_RANLIB
- 
diff --git a/meta/recipes-extended/wget/wget_1.17.bb b/meta/recipes-extended/wget/wget_1.17.1.bb
similarity index 47%
rename from meta/recipes-extended/wget/wget_1.17.bb
rename to meta/recipes-extended/wget/wget_1.17.1.bb
index 10434d3..dca5d1f 100644
--- a/meta/recipes-extended/wget/wget_1.17.bb
+++ b/meta/recipes-extended/wget/wget_1.17.1.bb
@@ -1,9 +1,8 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://fix_makefile.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "c4c4727766f24ac716936275014a0536"
-SRC_URI[sha256sum] = "3e04ad027c5b6ebd67c616eec13e66fbedb3d4d8cbe19cc29dadde44b92bda55"
+SRC_URI[md5sum] = "a6a908c9ae0e6a4194c628974cc3f05a"
+SRC_URI[sha256sum] = "029fbb93bdc1c0c5a7507b6076a6ec2f8d34204a85aa87e5b2f61a9405b290f5"
 
 require wget.inc
-- 
1.7.9.5


