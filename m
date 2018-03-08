Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4284278973
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053714"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:58 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:33 +0200
Message-Id: <20180308181804.31261-11-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/42] libtiff: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:58 -0000

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
 meta/recipes-multimedia/libtiff/files/libtool2.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/files/libtool2.patch b/meta/recipes-multimedia/libtiff/files/libtool2.patch
index 457202eae50..4798e470719 100644
--- a/meta/recipes-multimedia/libtiff/files/libtool2.patch
+++ b/meta/recipes-multimedia/libtiff/files/libtool2.patch
@@ -4,13 +4,13 @@ Upstream-Status: Inappropriate [configuration]
  configure.ac |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: tiff-3.9.5/configure.ac
+Index: tiff-4.0.8/configure.ac
 ===================================================================
---- tiff-3.9.5.orig/configure.ac
-+++ tiff-3.9.5/configure.ac
+--- tiff-4.0.8.orig/configure.ac
++++ tiff-4.0.8/configure.ac
 @@ -27,7 +27,7 @@ dnl Process this file with autoconf to p
  AC_PREREQ(2.64)
- AC_INIT([LibTIFF Software],[3.9.5],[tiff@lists.maptools.org],[tiff])
+ AC_INIT([LibTIFF Software],[4.0.8],[tiff@lists.maptools.org],[tiff])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR(m4)
 +dnl AC_CONFIG_MACRO_DIR(m4)
-- 
2.16.1


