Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0F65670AC1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 08 Aug 2014 14:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="573937779"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2014 15:06:51 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:49 -0500
Message-Id: <d6c71babb04d038a14d4f72c11cd5fb4e149aa21.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 24/35] wic: Update 'Background and Motivation' help section
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:05 -0000

Remove help text regarding the source and future intentions of the wic
codebase, since the code prompting those comments has now been mostly
removed.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 6e8e037..6503aaa 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -456,24 +456,12 @@ DESCRIPTION
     oe-core: directdisk.bbclass and mkefidisk.sh.  The difference
     between wic and those examples is that with wic the functionality
     of those scripts is implemented by a general-purpose partitioning
-    'language' based on Redhat kickstart syntax (with the underlying
-    code borrowed from Tizen mic, which in turn was borrowed from
-    Meego mic, in turn borrowed from Fedora livecd, etc.).
+    'language' based on Redhat kickstart syntax).
 
     The initial motivation and design considerations that lead to the
     current tool are described exhaustively in Yocto Bug #3847
     (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3847).
 
-    Though the current wic tool only uses the kickstart syntax related
-    to partitioning and bootloaders and only for creating images,
-    because the code is based on the mic/pykickstart code, future
-    deployment efforts such as those partially described by Yocto Bug
-    #4106 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=4106),
-    but also others including package selection (from e.g. binary
-    feeds) and deployment configuration of users/network/services,
-    etc, could be implemented under this framework, considering that
-    all of those are implemented in some form by the base system.
-
   Implementation and Examples
 
     wic can be used in two different modes, depending on how much
-- 
1.8.3.1


