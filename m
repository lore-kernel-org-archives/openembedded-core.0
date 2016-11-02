Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7016069C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 02:31:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 01 Nov 2016 19:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,582,1473145200"; d="scan'208";a="1079289680"
Received: from kgonza2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.24])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2016 19:31:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 15:31:04 +1300
Message-Id: <7f61ead32f742cdc0c5ae3d6044791b1716b4269.1478053841.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478053841.git.paul.eggleton@linux.intel.com>
References: <cover.1478053841.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478053841.git.paul.eggleton@linux.intel.com>
References: <cover.1478053841.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] oe-setup-builddir: fix TEMPLATECONF error message
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
X-List-Received-Date: Wed, 02 Nov 2016 02:31:55 -0000

This directory shouldn't contain local.conf and bblayers.conf - just
templates for them; except it doesn't have to contain those, it just has
to exist to pass this test. Change the error message accordingly, and
mention TEMPLATECONF so that the user has at least some context.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-setup-builddir | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 93722e0..e53f73c 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -61,7 +61,7 @@ if [ -n "$TEMPLATECONF" ]; then
             TEMPLATECONF="$OEROOT/$TEMPLATECONF"
         fi
         if [ ! -d "$TEMPLATECONF" ]; then
-            echo >&2 "Error: '$TEMPLATECONF' must be a directory containing local.conf & bblayers.conf"
+            echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
             exit 1
         fi
     fi
-- 
2.5.5


