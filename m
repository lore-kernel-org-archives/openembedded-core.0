Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9106B565
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010201"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:34 +0000
Message-Id: <ab13225369dadd1438effb1b7509694dcdaffede.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 38/38] bitbake.conf: set a default for MACHINE_FEATURES
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:38 -0000

Ensure that if MACHINE_FEATURES is not set by the machine config that we
don't end up with expansion errors during parsing. Technically since the
introduction of MACHINE_FEATURES_BACKFILL = "rtc" this is unlikely to be
a problem unless "rtc" is also added to
MACHINE_FEATURES_BACKFILL_CONSIDERED, however we should be consistent
with DISTRO_FEATURES which is defaulted in bitbake.conf.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d6cb33c..57668e1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -707,6 +707,7 @@ OES_BITBAKE_CONF = "1"
 # Machine properties and packagegroup-base stuff
 ##################################################################
 
+MACHINE_FEATURES ?= ""
 DISTRO_FEATURES ?= ""
 
 DISTRO_EXTRA_RDEPENDS ?= ""
-- 
1.8.1.2


