Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0173471F37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 15:34:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2014 08:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="599818892"
Received: from kcathuko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.50])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2014 08:33:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 15:33:30 +0000
Message-Id: <17456050e58dae99e0aeb62f80e54ed0b5a77d04.1414769574.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1414769574.git.paul.eggleton@linux.intel.com>
References: <cover.1414769574.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1414769574.git.paul.eggleton@linux.intel.com>
References: <cover.1414769574.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] psplash: update to latest git version
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
X-List-Received-Date: Fri, 31 Oct 2014 15:34:35 -0000

Include two enhancement patches from Olaf Mandel <o.mandel@menlosystems.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 4e8f071..7f0dc78 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
 
-SRCREV = "afd4e228c606a9998feae44a3fed4474803240b7"
+SRCREV = "14c8f7b705de944beb4de3f296506d80871e410f"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
-- 
1.9.3


