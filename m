Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D2C9F6DF40
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 16:41:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2013 08:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,825,1378882800"; d="scan'208";a="438491251"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.234])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2013 08:40:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:40:29 +0000
Message-Id: <3d6c9040ce16697d2dd58b5684acd6c524a96ac5.1386175183.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] libarchive: add SUMMARY and fix HOMEPAGE
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
X-List-Received-Date: Wed, 04 Dec 2013 16:41:31 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/libarchive/libarchive_2.8.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
index d3fb09e..76df23b 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -1,5 +1,6 @@
+SUMMARY = "Support for reading various archive formats"
 DESCRIPTION = "C library and command-line tools for reading and writing tar, cpio, zip, ISO, and other archive formats"
-HOMEPAGE = "http://code.google.com/p/libarchive/"
+HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4255e2e6f0349a4ac8fbd68459296e46"
-- 
1.8.1.2


