Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3A96E60144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:34:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442541272"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 14:39:56 -0800
Message-Id: <7e0f5d8fe93d1a0462095a2ef90e2d5767bfd5c7.1390342768.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
References: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390342768.git.dvhart@linux.intel.com>
References: <cover.1390342768.git.dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 10/15] tune: README: Typographical corrections
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
X-List-Received-Date: Tue, 21 Jan 2014 22:34:05 -0000

No new content, just correcting a few typographical errors.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/machine/include/README |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/README b/meta/conf/machine/include/README
index 6c390ad..d66130a 100644
--- a/meta/conf/machine/include/README
+++ b/meta/conf/machine/include/README
@@ -53,10 +53,10 @@ list should be dynamic! i.e.
 ${@bb.utils.contains("TUNE_FEATURES", "feature", "cflag", "!cflag", d)}
 
 TUNE_ARCH - The GNU canonical arch for a specific architecture.  i.e.
-arm, armeb, mips, mips64, etc.  This value is by bitbake to setup
+arm, armeb, mips, mips64, etc.  This value is used by bitbake to setup
 configure. TUNE_ARCH definitions are specific to a given architecture.
-They may be a single static definitions, or may be dynamically adjusted.
-See each architectures README for details for that CPU family.
+They may be a single static definition, or may be dynamically adjusted.
+See each architecture's README for details for that CPU family.
 
 TUNE_PKGARCH - The package architecture used by the packaging systems to
 define the architecture, abi and tuning of a particular package.
-- 
1.7.9.5


