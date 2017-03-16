Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 69CF1775EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655754; x=1521191754;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=aeI6mJkNILkyVKRD4J5waFY/6a+VHWdH2S2iyq42LAU=;
	b=Kb78kroOBJ3UXsgQn/+pyg91LeytwQGSWcwG9FShtA3hxNrkp0/KyNlR
	S2Rq5BBMgXqapBKFLooVKl8otQLfyA==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="236883151"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2017 02:15:53 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id C1CA62C8001;
	Thu, 16 Mar 2017 02:15:48 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:36 +0200
Message-Id: <cd0d0f83d2df9b18bb5f15a36c86ca4e1ed3c835.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/11] opkg-utils: Remove unused patches
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:52 -0000

0001-update-alternatives-warn-when-multiple-providers-hav.patch was
removed from SRC_URI without mention in commit 60c9a9704.

001-Makefile-use-defined-bindir-and-mandir-as-installati.patch was
removed from SRC_URI in d6b04e121.

Current opkg does not need either patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...e-defined-bindir-and-mandir-as-installati.patch | 30 ----------------------
 ...rnatives-warn-when-multiple-providers-hav.patch | 26 -------------------
 2 files changed, 56 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
deleted file mode 100644
index 6259f00..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From af4a6e4666264661769e32874e9654e02e5eb019 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Thu, 22 Dec 2016 16:15:56 -0600
-Subject: [opkg-utils PATCH] Makefile: use defined bindir and mandir as
- installation dirs
-
-Upstream-Status: Pending
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
----
- Makefile | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 92b45f1..9f0531c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -5,9 +5,6 @@ UTILS = opkg-build opkg-unbuild opkg-make-index opkg.py opkg-list-fields \
- MANPAGES = opkg-build.1
- 
- DESTDIR=
--PREFIX=/usr/local
--bindir=$(PREFIX)/bin
--mandir=$(PREFIX)/man
- 
- .SUFFIXES: .1
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
deleted file mode 100644
index afce1e1..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Subject: update-alternatives: warn when multiple providers have the same priority
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- update-alternatives | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/update-alternatives b/update-alternatives
-index ca01d5d..ffad853 100644
---- a/update-alternatives
-+++ b/update-alternatives
-@@ -90,6 +90,9 @@ add_alt() {
- 	local path="$2"
- 	local priority="$3"
- 	remove_alt $name $path
-+	if grep -qw "$priority" $ad/$name; then
-+		echo "Warn: update-alternatives: $name has multiple providers with the same priority, please check $ad/$name for details"
-+	fi
- 	echo "$path $priority" >> $ad/$name
- }
- 
--- 
-2.8.3
-
-- 
2.1.4


