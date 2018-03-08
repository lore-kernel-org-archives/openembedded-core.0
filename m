Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75ED17899C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053936"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:44 +0200
Message-Id: <20180308181804.31261-22-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/42] ghostscript: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:15 -0000

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
 .../ghostscript/ghostscript/ghostscript-9.02-genarch.patch    | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
index e28a949bf71..b4c14ea231e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
@@ -12,11 +12,12 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 # Summary: Generate arch.h for ppc32
 #
 
-diff -Nru ghostscript-8.64.orig/base/lib.mak ghostscript-8.64/base/lib.mak
---- ghostscript-8.64.orig/base/lib.mak	2010-02-10 10:30:02.000000000 +0800
-+++ ghostscript-8.64/base/lib.mak	2010-02-10 10:56:21.000000000 +0800
-@@ -67,8 +67,8 @@
- stdpre_h=$(GLSRC)stdpre.h $(stdpn_h)
+Index: ghostscript-9.21/base/lib.mak
+===================================================================
+--- ghostscript-9.21.orig/base/lib.mak
++++ ghostscript-9.21/base/lib.mak
+@@ -73,8 +73,8 @@ arch_h=$(GLGEN)arch.h
+ stdpre_h=$(GLSRC)stdpre.h
  stdint__h=$(GLSRC)stdint_.h $(std_h)
  
 -$(GLGEN)arch.h : $(GENARCH_XE)
-- 
2.16.1


