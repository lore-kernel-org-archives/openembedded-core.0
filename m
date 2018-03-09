Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 488D77892F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651913"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:49 +0200
Message-Id: <20180309185614.31113-11-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/36] m4: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:06 -0000

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
 meta/recipes-devtools/m4/m4/ac_config_links.patch | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4/ac_config_links.patch b/meta/recipes-devtools/m4/m4/ac_config_links.patch
index 275c0b2e7d8..71edf595122 100644
--- a/meta/recipes-devtools/m4/m4/ac_config_links.patch
+++ b/meta/recipes-devtools/m4/m4/ac_config_links.patch
@@ -14,10 +14,11 @@ Tested on x86_64_linux (Ubuntu 8.04 and 9.10).
 
 2009-11-10	Esben Haabendal	    <eha@doredevelopment.dk>
 
-diff -urN m4-1.4.13.orig/configure m4-1.4.13/configure
---- m4-1.4.13.orig/configure	2009-11-10 10:54:00.301707097 +0100
-+++ m4-1.4.13/configure	2009-11-10 10:54:17.314206379 +0100
-@@ -14860,8 +14860,8 @@
+Index: m4-1.4.18/configure
+===================================================================
+--- m4-1.4.18.orig/configure
++++ m4-1.4.18/configure
+@@ -24415,8 +24415,8 @@ $as_echo "#define GNULIB_TEST_GETTIMEOFD
    # only, it does not matter if we skip the link with older autoconf.
    # Automake 1.10.1 and earlier try to remove GNUmakefile in non-VPATH
    # builds, so use a shell variable to bypass this.
@@ -27,4 +28,4 @@ diff -urN m4-1.4.13.orig/configure m4-1.4.13/configure
 + # ac_config_links="$ac_config_links $GNUmakefile:$GNUmakefile"
  
  
- 
+   :
-- 
2.16.1


