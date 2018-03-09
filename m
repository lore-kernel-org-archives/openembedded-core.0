Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE10278927
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651907"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:05 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:48 +0200
Message-Id: <20180309185614.31113-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/36] i2c-tools: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:05 -0000

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
 ...-tools-Module.mk-Add-missing-dependencies.patch | 25 ++++++++++------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch b/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
index e47c02ab7f5..33cf2d42a87 100644
--- a/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
+++ b/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
@@ -17,12 +17,12 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  tools/Module.mk | 10 +++++-----
  2 files changed, 12 insertions(+), 5 deletions(-)
 
-diff --git a/lib/Module.mk b/lib/Module.mk
-index 8a58f5b..67afe91 100644
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -37,6 +37,13 @@ ifeq ($(BUILD_STATIC_LIB),1)
- LIB_TARGETS	+= $(LIB_STLIBNAME)
+Index: i2c-tools-4.0/lib/Module.mk
+===================================================================
+--- i2c-tools-4.0.orig/lib/Module.mk
++++ i2c-tools-4.0/lib/Module.mk
+@@ -35,6 +35,13 @@ LIB_TARGETS	+= $(LIB_STLIBNAME)
+ LIB_OBJECTS	+= smbus.ao
  endif
  
 +# Library file to link against (static or dynamic)
@@ -35,11 +35,11 @@ index 8a58f5b..67afe91 100644
  #
  # Libraries
  #
-diff --git a/tools/Module.mk b/tools/Module.mk
-index 6421a23..609de7a 100644
---- a/tools/Module.mk
-+++ b/tools/Module.mk
-@@ -24,19 +24,19 @@ TOOLS_TARGETS	:= i2cdetect i2cdump i2cset i2cget i2ctransfer
+Index: i2c-tools-4.0/tools/Module.mk
+===================================================================
+--- i2c-tools-4.0.orig/tools/Module.mk
++++ i2c-tools-4.0/tools/Module.mk
+@@ -24,19 +24,19 @@ TOOLS_TARGETS	:= i2cdetect i2cdump i2cse
  # Programs
  #
  
@@ -64,6 +64,3 @@ index 6421a23..609de7a 100644
  	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
  
  #
--- 
-2.4.0
-
-- 
2.16.1


