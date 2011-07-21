Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8Z-0001En-Vd
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787074"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:53:00 -0700
Message-Id: <9c674daedaaad3a78b094510a6f914c1720d098d.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/20] clutter-box2d: fix isfinite.patch
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
X-List-Received-Date: Thu, 21 Jul 2011 07:57:45 -0000

The original patch lost ^M and was not appliable.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../clutter/clutter-box2d/isfinite.patch           |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
index fd2bf74..bcdbe24 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
+++ b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
@@ -7,13 +7,13 @@ Upstream-Status: Pending
 Index: clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h
 ===================================================================
 --- clutter-box2d-0.10.0.orig/box2d/Source/Common/b2Math.h	2008-12-16 06:42:10.000000000 -0800
-+++ clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h	2011-07-17 02:10:29.833825198 -0700
++++ clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h	2011-07-20 16:41:02.046430743 -0700
 @@ -60,7 +60,7 @@
- #ifdef _MSC_VER
- 	return _finite(x) != 0;
- #else
--	return finite(x) != 0;
-+	return std::isfinite(x) != 0;
- #endif
- }
- 
+ #ifdef _MSC_VER
+ 	return _finite(x) != 0;
+ #else
+-	return finite(x) != 0;
++	return std::isfinite(x) != 0;
+ #endif
+ }
+ 
-- 
1.7.3.4



