Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A15AE716CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:57:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5vKYK006954
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:57:20 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:57:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 21:57:18 -0800
Message-ID: <4a9d6c81940c6d32e9859db1096abdf63ad9ffb5.1424411800.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424411800.git.liezhi.yang@windriver.com>
References: <cover.1424411800.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] build-compare: update Rename-rpm-check.sh-to-pkg-diff.sh.patch
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
X-List-Received-Date: Fri, 20 Feb 2015 05:57:22 -0000
Content-Type: text/plain

The patch can't be applied by "git am -3" with newer version of git
(such as 2.0.1), and can't be applied by "git am/apply" with any
version, now fix it

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../files/Rename-rpm-check.sh-to-pkg-diff.sh.patch |   37 +++++++++++---------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch b/meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch
index 3e1e679..cff3a9e 100644
--- a/meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch
+++ b/meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch
@@ -1,6 +1,6 @@
-From f5db896b7f49b56dad0d51c9bdb3d4c9525edab2 Mon Sep 17 00:00:00 2001
-From: Randy Witt <randy.e.witt@linux.intel.com>
-Date: Mon, 5 Jan 2015 15:58:35 -0800
+From 4de3df5a1b361cd09a081f0e0bdb94cbf684ed48 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 19 Feb 2015 00:34:47 -0800
 Subject: [PATCH] Rename rpm-check.sh to pkg-diff.sh.
 
 The tool now accepts package input other than rpm, so change the name
@@ -9,13 +9,17 @@ which could be misleading.
 Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pulls]
 
 Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
+
+Updated for rpm-check.sh.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- build-compare.spec   |   2 +-
- pkg-diff.sh          | 765 +++++++++++++++++++++++++++++++++++++++++++++++++++
- rpm-check.sh         | 765 ---------------------------------------------------
- same-build-result.sh |   4 +-
- 4 files changed, 768 insertions(+), 768 deletions(-)
- create mode 100755 pkg-diff.sh
+ build-compare.spec   |    2 +-
+ pkg-diff.sh          |  765 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ rpm-check.sh         |  764 -------------------------------------------------
+ same-build-result.sh |    4 +-
+ 4 files changed, 768 insertions(+), 767 deletions(-)
+ create mode 100644 pkg-diff.sh
  delete mode 100755 rpm-check.sh
 
 diff --git a/build-compare.spec b/build-compare.spec
@@ -32,7 +36,7 @@ index 14a97e9..5f47ca1 100644
  Source5:        srpm-check.sh
  BuildRoot:      %{_tmppath}/%{name}-%{version}-build
 diff --git a/pkg-diff.sh b/pkg-diff.sh
-new file mode 100755
+new file mode 100644
 index 0000000..56035c1
 --- /dev/null
 +++ b/pkg-diff.sh
@@ -804,10 +808,10 @@ index 0000000..56035c1
 +# vim: tw=666 ts=2 et
 diff --git a/rpm-check.sh b/rpm-check.sh
 deleted file mode 100755
-index 56035c1..0000000
+index dd47642..0000000
 --- a/rpm-check.sh
 +++ /dev/null
-@@ -1,765 +0,0 @@
+@@ -1,764 +0,0 @@
 -#! /bin/bash
 -#
 -# Copyright (c) 2009, 2010, 2011, 2012 SUSE Linux Product GmbH, Germany.
@@ -1400,10 +1404,9 @@ index 56035c1..0000000
 -    *.ps)
 -      for f in "old/$file" "new/$file"; do
 -        sed -i -e '
--          /^%%CreationDate:[[:blank:]]/d
--          /^%%Creator:[[:blank:]]groff[[:blank:]]version[[:blank:]]/d
--          /^%DVIPSSource:[[:blank:]]/d
--        ' "$f"
+-	/^%%CreationDate:[[:blank:]]/d
+-	/^%%Creator:[[:blank:]]groff[[:blank:]]version[[:blank:]]/d
+-	' "$f"
 -      done
 -    ;;
 -    *pdf)
@@ -1592,5 +1595,5 @@ index c8907e2..7e9bd4f 100644
  
  check_all=1
 -- 
-1.9.3
+1.7.9.5
 
-- 
1.7.9.5


