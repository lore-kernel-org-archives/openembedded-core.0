Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D588278A1E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054057"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:56 +0200
Message-Id: <20180308181804.31261-34-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 34/42] syslinux: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:34 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../syslinux/syslinux-libupload-depend-lib.patch        | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch
index c0714b51757..6ba96aeb568 100644
--- a/meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch
@@ -20,15 +20,12 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  com32/Makefile |    1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/com32/Makefile b/com32/Makefile
-index 9a1721b..f172db2 100644
---- a/com32/Makefile
-+++ b/com32/Makefile
-@@ -21,3 +21,4 @@ rosh: lib libutil
- samples: libutil elflink/ldlinux
- sysdump: libupload gpllib
+Index: syslinux-6.03/com32/Makefile
+===================================================================
+--- syslinux-6.03.orig/com32/Makefile
++++ syslinux-6.03/com32/Makefile
+@@ -22,3 +22,4 @@ samples: libutil elflink/ldlinux
+ sysdump: lib libutil libupload gpllib
+ lua/src: cmenu modules
  gpllib: lib
 +libupload: lib
--- 
-1.7.9.5
-
-- 
2.16.1


