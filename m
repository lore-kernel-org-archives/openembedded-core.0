Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSal5-0002bg-9P
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:18:47 +0200
Received: by lbol5 with SMTP id l5so1471222lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=h66saYgc0+2AUrmuSGEZvqcUpldJfYOqn7ZuHhyfLuo=;
	b=rKxmV5mWBDIKJWRwX/PgbsETHqLYFozp2rl89TZI1lWyc8vhkYbp6gFy80JXvi8E4e
	6SBJ0gAilkk9eBfvF5Fd/NaeIJbNr9d61s4XbQavMFTIUoHIdyRxcjAb6MgdBs1GxL95
	iAg44hY8ZUEfTFbZUDukKi1WVOO7EI0lc68BlDRg/35IcE5cqsiZVMmczmyAD5ySTnUG
	8SrvCrBCc7+VtiR3oCvSx+pWXWTwCN2cwZHSPQhqUq/f7qRKoZjj/SLKmVSTf1IhYKTl
	8Kq8uRLg5xeJeMsFpMXfqSBb0UR4AzgoGH6kyxI2rLMIinItiVE/5Yvn0FKuGz9L23fC
	25SA==
Received: by 10.112.51.228 with SMTP id n4mr2668094lbo.35.1336684132740;
	Thu, 10 May 2012 14:08:52 -0700 (PDT)
Received: from alpha.cazfi.net (a91-153-5-101.elisa-laajakaista.fi.
	[91.153.5.101])
	by mx.google.com with ESMTPS id fx5sm8934416lbb.5.2012.05.10.14.08.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 14:08:51 -0700 (PDT)
Received: from cazfi by alpha.cazfi.net with local (Exim 4.77)
	(envelope-from <cazfi74@gmail.com>)
	id 1SSabR-0007gX-W9; Fri, 11 May 2012 00:08:50 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2012 00:08:48 +0300
Message-Id: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH] expat: update to upstream version 2.1.0
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
X-List-Received-Date: Thu, 10 May 2012 21:18:47 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../recipes-core/expat/expat-2.0.1/autotools.patch |   21 -----------------
 .../recipes-core/expat/expat-2.1.0/autotools.patch |   24 ++++++++++++++++++++
 meta/recipes-core/expat/expat_2.0.1.bb             |    6 -----
 meta/recipes-core/expat/expat_2.1.0.bb             |    6 +++++
 4 files changed, 30 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat-2.0.1/autotools.patch
 create mode 100644 meta/recipes-core/expat/expat-2.1.0/autotools.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.0.1.bb
 create mode 100644 meta/recipes-core/expat/expat_2.1.0.bb

diff --git a/meta/recipes-core/expat/expat-2.0.1/autotools.patch b/meta/recipes-core/expat/expat-2.0.1/autotools.patch
deleted file mode 100644
index c0ac10b..0000000
--- a/meta/recipes-core/expat/expat-2.0.1/autotools.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Avoid using expat's m4 files
-
-Upstream-Status: Inappropriate [Other]
-Workaround specific to our build system.
-
-Signed-off-by: Kevin Tian <kevin.tian@intel.com>
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -bur expat-2.0.0~orig/configure.in expat-2.0.0/configure.in
---- expat-2.0.0~orig/configure.in	2006-01-10 19:10:46.000000000 -0600
-+++ expat-2.0.0/configure.in	2006-02-10 19:12:24.000000000 -0600
-@@ -50,9 +50,6 @@
- 
- AC_CONFIG_HEADER(expat_config.h)
- 
--sinclude(conftools/libtool.m4)
--sinclude(conftools/ac_c_bigendian_cross.m4)
--
- AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
- 
diff --git a/meta/recipes-core/expat/expat-2.1.0/autotools.patch b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
new file mode 100644
index 0000000..0e59969
--- /dev/null
+++ b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
@@ -0,0 +1,24 @@
+Avoid using expat's m4 files
+
+Upstream-Status: Inappropriate [Other]
+Workaround specific to our build system.
+
+Signed-off-by: Kevin Tian <kevin.tian@intel.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+Updated to apply over expat 2.1.0
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd expat-2.1.0/configure.in expat-2.1.0/configure.in
+--- expat-2.1.0/configure.in	2012-03-04 01:45:53.000000000 +0200
++++ expat-2.1.0/configure.in	2012-05-10 21:04:44.000000000 +0300
+@@ -51,8 +51,6 @@
+ 
+ AC_CONFIG_HEADER(expat_config.h)
+ 
+-sinclude(conftools/ac_c_bigendian_cross.m4)
+-
+ AC_LIBTOOL_WIN32_DLL
+ AC_PROG_LIBTOOL
+ 
diff --git a/meta/recipes-core/expat/expat_2.0.1.bb b/meta/recipes-core/expat/expat_2.0.1.bb
deleted file mode 100644
index 30b5684..0000000
--- a/meta/recipes-core/expat/expat_2.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
-PR = "r1"
-
-SRC_URI[md5sum] = "ee8b492592568805593f81f8cdf2a04c"
-SRC_URI[sha256sum] = "847660b4df86e707c9150e33cd8c25bc5cd828f708c7418e765e3e983a2e5e93"
diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/expat/expat_2.1.0.bb
new file mode 100644
index 0000000..727769f
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.1.0.bb
@@ -0,0 +1,6 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
+PR = "r1"
+
+SRC_URI[md5sum] = "dd7dab7a5fea97d2a6a43f511449b7cd"
+SRC_URI[sha256sum] = "823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86"
-- 
1.7.10



