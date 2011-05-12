Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgK-0000Hk-Kh
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 04:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860421"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:00:58 -0700
Message-Id: <b3c951207e16c6095cea301b7db004683954b1f8.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:19:04 +0800
Date: Thu, 12 May 2011 19:00:55 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 08/54] eds-dbus: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:52 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../eds/eds-dbus-2.20.0/no_iconv_test.patch        |    2 ++
 .../eds/eds-dbus-2.20.0/oh-contact.patch           |    2 ++
 .../eds/eds-dbus/new-contact-fix.patch             |    2 ++
 meta/recipes-sato/eds/eds-dbus/nossl.patch         |    2 ++
 meta/recipes-sato/eds/eds-dbus/oh-contact.patch    |    2 ++
 meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch   |    2 ++
 .../eds/eds-dbus/optional_imapx_provider.patch     |    2 ++
 meta/recipes-sato/eds/eds-dbus/parallelmake.patch  |    2 ++
 8 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/eds/eds-dbus-2.20.0/no_iconv_test.patch b/meta/recipes-sato/eds/eds-dbus-2.20.0/no_iconv_test.patch
index 4a034b6..493b70d 100644
--- a/meta/recipes-sato/eds/eds-dbus-2.20.0/no_iconv_test.patch
+++ b/meta/recipes-sato/eds/eds-dbus-2.20.0/no_iconv_test.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: trunk/configure.in
 ===================================================================
 --- trunk.orig/configure.in	2005-09-28 17:34:08.000000000 +0000
diff --git a/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch b/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
index e5c0f51..fd83b57 100644
--- a/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
+++ b/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: addressbook/libedata-book/ximian-vcard.h
 ===================================================================
 --- addressbook/libedata-book/ximian-vcard.h	(revision 578)
diff --git a/meta/recipes-sato/eds/eds-dbus/new-contact-fix.patch b/meta/recipes-sato/eds/eds-dbus/new-contact-fix.patch
index d34cc55..22c293d 100644
--- a/meta/recipes-sato/eds/eds-dbus/new-contact-fix.patch
+++ b/meta/recipes-sato/eds/eds-dbus/new-contact-fix.patch
@@ -5,6 +5,8 @@ the data base if not exist, but use it without proper initialization.
 
 This patch fix it.
 
+Upstream-Status: Submitted
+
 Signed-off-by: Edwin Zhai <edwin.zhai@intel.com>
 Index: git/addressbook/backends/file/e-book-backend-file.c
 ===================================================================
diff --git a/meta/recipes-sato/eds/eds-dbus/nossl.patch b/meta/recipes-sato/eds/eds-dbus/nossl.patch
index 30568ff..67b6d07 100644
--- a/meta/recipes-sato/eds/eds-dbus/nossl.patch
+++ b/meta/recipes-sato/eds/eds-dbus/nossl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: git/camel/Makefile.am
 ===================================================================
 --- git.orig/camel/Makefile.am	2010-02-05 15:25:09.000000000 +0000
diff --git a/meta/recipes-sato/eds/eds-dbus/oh-contact.patch b/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
index fdd7e4b..9817991 100644
--- a/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
+++ b/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: addressbook/libedata-book/ximian-vcard.h
 ===================================================================
 --- addressbook/libedata-book/ximian-vcard.h.orig	2010-02-05 14:57:14.000000000 +0000
diff --git a/meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch b/meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch
index 8b60069..7ef2956 100644
--- a/meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch
+++ b/meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch
@@ -3,6 +3,8 @@ This avoid build error due to defination missing.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/configure.ac
 ===================================================================
 --- git.orig/configure.ac	2010-12-16 10:25:24.000000000 +0800
diff --git a/meta/recipes-sato/eds/eds-dbus/optional_imapx_provider.patch b/meta/recipes-sato/eds/eds-dbus/optional_imapx_provider.patch
index 128307a..d9b0940 100644
--- a/meta/recipes-sato/eds/eds-dbus/optional_imapx_provider.patch
+++ b/meta/recipes-sato/eds/eds-dbus/optional_imapx_provider.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: git/camel/providers/Makefile.am
 ===================================================================
 --- git.orig/camel/providers/Makefile.am	2010-07-06 18:49:34.000000000 +0800
diff --git a/meta/recipes-sato/eds/eds-dbus/parallelmake.patch b/meta/recipes-sato/eds/eds-dbus/parallelmake.patch
index 08cfac0..ee004a9 100644
--- a/meta/recipes-sato/eds/eds-dbus/parallelmake.patch
+++ b/meta/recipes-sato/eds/eds-dbus/parallelmake.patch
@@ -4,6 +4,8 @@ commit 6118d5891fee776a087855c335a73c79fdaf036c
 
 RP 16/3/10
 
+Upstream-Status: Pending
+
 Index: git/git.mk
 ===================================================================
 --- git.orig/git.mk	2010-02-05 14:57:15.000000000 +0000
-- 
1.7.1



