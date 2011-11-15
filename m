Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RQ7iC-0008OA-Sj
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 02:21:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Nov 2011 17:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75519773"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.81])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2011 17:14:57 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 17:14:55 -0800
Message-Id: <600685b20ed9204c4e552da9d3f1dc9c14fe5135.1321319621.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321319621.git.scott.a.garman@intel.com>
References: <cover.1321319621.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1321319621.git.scott.a.garman@intel.com>
References: <cover.1321319621.git.scott.a.garman@intel.com>
Subject: [PATCH 2/2] base-passwd: add Upstream-Status to patches, remove unused patch
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
X-List-Received-Date: Tue, 15 Nov 2011 01:21:21 -0000

mysql.patch is not used by the recipe anymore, so delete it.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../base-passwd/base-passwd-3.5.22/mysql.patch     |   13 ----------
 .../base-passwd/base-passwd-3.5.22/nobash.patch    |   25 +++++++++++--------
 .../base-passwd/base-passwd-3.5.22/root-home.patch |   11 ++++++--
 3 files changed, 22 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.22/mysql.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.22/mysql.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.22/mysql.patch
deleted file mode 100644
index 8bfd757..0000000
--- a/meta/recipes-core/base-passwd/base-passwd-3.5.22/mysql.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-# set correct uid/gid for mysql, from OE (8836cd807198c224ed23b05fa4f708f096881b27).
-# however poky doesn't include mysql so far. Remove it from patch list, but keep
-# this patch for a while
-#
-# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
---- base-passwd/group.master.orig	2005-07-08 06:36:07.717990112 +0200
-+++ base-passwd/group.master	2005-07-08 06:36:32.000000000 +0200
-@@ -36,4 +36,5 @@
- staff:*:50:
- games:*:60:
- users:*:100:
-+mysql:*:64001:
- nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.22/nobash.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.22/nobash.patch
index 5265016..6371576 100644
--- a/meta/recipes-core/base-passwd/base-passwd-3.5.22/nobash.patch
+++ b/meta/recipes-core/base-passwd/base-passwd-3.5.22/nobash.patch
@@ -1,14 +1,17 @@
-# use /bin/sh instead of /bin/bash, since the latter may not be included in
-# some images such as minimal
-#
-# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-#
-# remove "*" for root since we don't have a /etc/shadow so far.
-#
-# by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
+use /bin/sh instead of /bin/bash, since the latter may not be included in
+some images such as minimal
+
+comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
+
+remove "*" for root since we don't have a /etc/shadow so far.
+
+by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
+
+Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+
+Upstream-Status: Invalid [configuration]
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 --- base-passwd/passwd.master~nobash
 +++ base-passwd/passwd.master
diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.22/root-home.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.22/root-home.patch
index 87c4655..eab77f1 100644
--- a/meta/recipes-core/base-passwd/base-passwd-3.5.22/root-home.patch
+++ b/meta/recipes-core/base-passwd/base-passwd-3.5.22/root-home.patch
@@ -1,6 +1,11 @@
-# poky uses /home/root instead of /root.
-#
-# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
+we use /home/root instead of /root
+
+Comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- base-passwd/passwd.master.orig	2005-07-08 06:26:22.000000000 +0200
 +++ base-passwd/passwd.master	2005-07-08 06:31:58.000000000 +0200
 @@ -1,4 +1,4 @@
-- 
1.7.5.4



