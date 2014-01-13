Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1CCBC6DEF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:22:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2014 07:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,653,1384329600"; d="scan'208";a="465875307"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by orsmga002.jf.intel.com with ESMTP; 13 Jan 2014 07:22:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 15:22:07 +0000
Message-Id: <d75dc4f8c5434c6482c3168e5a53d19d501bbbf5.1389626446.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389626446.git.paul.eggleton@linux.intel.com>
References: <cover.1389626446.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389626446.git.paul.eggleton@linux.intel.com>
References: <cover.1389626446.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] chrpath: upgrade to 0.15
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
X-List-Received-Date: Mon, 13 Jan 2014 15:22:40 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/chrpath/{chrpath_0.14.bb => chrpath_0.15.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/chrpath/{chrpath_0.14.bb => chrpath_0.15.bb} (80%)

diff --git a/meta/recipes-devtools/chrpath/chrpath_0.14.bb b/meta/recipes-devtools/chrpath/chrpath_0.15.bb
similarity index 80%
rename from meta/recipes-devtools/chrpath/chrpath_0.14.bb
rename to meta/recipes-devtools/chrpath/chrpath_0.15.bb
index 27b75b4..461710e 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.14.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.15.bb
@@ -7,11 +7,11 @@ BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/file/3648/chrpath-${PV}.tar.gz \
+SRC_URI = "http://alioth.debian.org/frs/download.php/file/3968/chrpath-${PV}.tar.gz \
            file://standarddoc.patch"
 
-SRC_URI[md5sum] = "ea6b212b23393bf58b0ef9bcf6491b86"
-SRC_URI[sha256sum] = "a1bc9abc42d2b97efc3a0ced7c5dbed37d5debff600386193750315fa5823eaa"
+SRC_URI[md5sum] = "2d2dc80e25e17425d8af849baae60654"
+SRC_URI[sha256sum] = "f1125f5dd0f7c7eaa4d0b64bf17c5b9cb4ee828722246970e201a18a77e18879"
 
 inherit autotools
 
-- 
1.8.1.2


