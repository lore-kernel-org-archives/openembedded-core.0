Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B05927886F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053613"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:43 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:23 +0200
Message-Id: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 01/42] expat: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:43 -0000

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

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/expat/expat/autotools.patch | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/expat/expat/autotools.patch b/meta/recipes-core/expat/expat/autotools.patch
index 3d3c5bad9d6..104717eabb7 100644
--- a/meta/recipes-core/expat/expat/autotools.patch
+++ b/meta/recipes-core/expat/expat/autotools.patch
@@ -10,11 +10,12 @@ Updated to apply over expat 2.1.0
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 
-diff -Nurd expat-2.1.0/configure.in expat-2.1.0/configure.in
---- expat-2.1.0/configure.ac	2012-03-04 01:45:53.000000000 +0200
-+++ expat-2.1.0/configure.ac	2012-05-10 21:04:44.000000000 +0300
-@@ -51,8 +51,6 @@
- 
+Index: expat-2.2.5/configure.ac
+===================================================================
+--- expat-2.2.5.orig/configure.ac
++++ expat-2.2.5/configure.ac
+@@ -53,8 +53,6 @@ LIBAGE=6       # CMakeLists.txt!
+ CPPFLAGS="${CPPFLAGS} -DHAVE_EXPAT_CONFIG_H"
  AC_CONFIG_HEADER(expat_config.h)
  
 -sinclude(conftools/ac_c_bigendian_cross.m4)
-- 
2.16.1


