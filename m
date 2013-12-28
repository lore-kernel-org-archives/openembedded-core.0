Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 004CA6B5A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010106"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:22 +0000
Message-Id: <f6c16500de0840185949467e2147ec34cd47f046.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 26/38] icecc-create-env-native: add SUMMARY and tweak DESCRIPTION
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:23 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
index c05a76d..f8f4aef 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
@@ -1,5 +1,6 @@
-DESCRIPTION = "This is a modified version of the icecc-create-env script in order to\
-make it work with OE."
+SUMMARY = "icecc environment setup script"
+DESCRIPTION = "This is a version of the icecc-create-env script that has \
+been modified in order to make it work with OE."
 SECTION = "base"
 # source file has just a "GPL" word, but upstream is GPLv2+.
 # most probably just GPL would be a mistake
-- 
1.8.1.2


