Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D690E601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:37:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 24 May 2016 20:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,362,1459839600"; d="scan'208";a="814199917"
Received: from ismailm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.147.14])
	by orsmga003.jf.intel.com with ESMTP; 24 May 2016 20:37:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:37:14 +1200
Message-Id: <bfde08abdf1d848a991933a57b95c0dbb4a0828f.1464147312.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] libjpeg-turbo: set SUMMARY
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
X-List-Received-Date: Wed, 25 May 2016 03:37:54 -0000

This recipe had a long DESCRIPTION, so add a new short SUMMARY value.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
index 4859431..e969195 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Hardware accelerated JPEG compression/decompression library"
 DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
-- 
2.5.5


