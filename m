Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D7F7E731F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:38:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2016 21:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="1012328509"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2016 21:38:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:37:34 +1200
Message-Id: <1e6893065b381947abb6c2052e65ed3578cf03c5.1470890224.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890224.git.paul.eggleton@linux.intel.com>
References: <cover.1470890224.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890224.git.paul.eggleton@linux.intel.com>
References: <cover.1470890224.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oe-buildenv-internal: hint at specifying bitbake path in error message
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
X-List-Received-Date: Thu, 11 Aug 2016 04:38:06 -0000

If you check out OE-Core and then run oe-init-build-env you get an error
about not having bitbake checked out in a "bitbake" subdirectory,
however it's possible to specify the bitbake path on the
oe-init-build-env command line, so hint at that in the error message
rather than implying it has to be in the default location.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 03dc50f..9fae3b4 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -96,7 +96,7 @@ BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
 BUILDDIR=$(readlink -f "$BUILDDIR")
 
 if [ ! -d "$BITBAKEDIR" ]; then
-    echo >&2 "Error: The bitbake directory ($BITBAKEDIR) does not exist!  Please ensure a copy of bitbake exists at this location"
+    echo >&2 "Error: The bitbake directory ($BITBAKEDIR) does not exist!  Please ensure a copy of bitbake exists at this location or specify an alternative path on the command line"
     return 1
 fi
 
-- 
2.5.5


