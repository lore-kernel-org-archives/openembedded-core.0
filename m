Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3315878917
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:02:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651870"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:02:58 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:43 +0200
Message-Id: <20180309185614.31113-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/36] iproute2: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:02:58 -0000

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
 .../iproute2/iproute2/configure-cross.patch                  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
index 5536fb57656..8b75a2ada4e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
@@ -9,19 +9,19 @@ Upstream-Status: Pending
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 Signed-off-by: Shane Wang <shane.wang@intel.com>
 
-Index: iproute2-4.11.0/configure
+Index: iproute2-4.14.1/configure
 ===================================================================
---- iproute2-4.11.0.orig/configure
-+++ iproute2-4.11.0/configure
+--- iproute2-4.14.1.orig/configure
++++ iproute2-4.14.1/configure
 @@ -2,6 +2,7 @@
  # This is not an autoconf generated configure
  #
  INCLUDE=${1:-"$PWD/include"}
 +SYSROOT=$1
  
- # Make a temp directory in build tree.
- TMPDIR=$(mktemp -d config.XXXXXX)
-@@ -192,7 +193,7 @@ check_ipt_lib_dir()
+ # Output file which is input to Makefile
+ CONFIG=config.mk
+@@ -195,7 +196,7 @@ check_ipt_lib_dir()
  		return
  	fi
  
-- 
2.16.1


