Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F12D789C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053949"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:18 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:46 +0200
Message-Id: <20180308181804.31261-24-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/42] libidn: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:18 -0000

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
 .../libidn/libidn/libidn_fix_for_automake-1.12.patch           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
index 5683d3c98d7..db91317ca5b 100644
--- a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
@@ -9,12 +9,12 @@ This patch fixes following issue with automake 1.12
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/03
 
-Index: libidn-1.24/configure.ac
+Index: libidn-1.33/configure.ac
 ===================================================================
---- libidn-1.24.orig/configure.ac
-+++ libidn-1.24/configure.ac
-@@ -34,6 +34,10 @@ AC_SUBST(LT_CURRENT, 17)
- AC_SUBST(LT_REVISION, 7)
+--- libidn-1.33.orig/configure.ac
++++ libidn-1.33/configure.ac
+@@ -33,6 +33,10 @@ AC_SUBST(LT_CURRENT, 17)
+ AC_SUBST(LT_REVISION, 16)
  AC_SUBST(LT_AGE, 6)
  
 +# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
-- 
2.16.1


