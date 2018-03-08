Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD6817898A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053877"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:08 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:39 +0200
Message-Id: <20180308181804.31261-17-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/42] clutter: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:08 -0000

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
 .../clutter/clutter-1.0/install-examples.patch                | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch b/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
index 3b6a70ef0a7..ce9ab3a2489 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
+++ b/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
@@ -3,11 +3,11 @@ Install the examples to $libdir/clutter/.
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Upstream-Status: Inappropriate
 
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index 4b9b449..232cd19 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -38,6 +38,7 @@ AM_CPPFLAGS = \
+Index: clutter-1.26.2/examples/Makefile.am
+===================================================================
+--- clutter-1.26.2.orig/examples/Makefile.am
++++ clutter-1.26.2/examples/Makefile.am
+@@ -33,7 +33,8 @@ AM_CPPFLAGS = \
  	-I$(top_srcdir)/clutter \
  	-I$(top_builddir)/clutter
  
@@ -16,3 +16,4 @@ index 4b9b449..232cd19 100644
 +example_PROGRAMS = $(all_examples)
  
  EXTRA_DIST = redhand.png
+ 
-- 
2.16.1


