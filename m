Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A0CD36DD68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:42:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2013 06:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,775,1378882800"; d="scan'208";a="440218562"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2013 06:42:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:41:56 +0000
Message-Id: <92ab740c6016a691927554486baa95ca403047e7.1385476873.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] libpng: set reasonable SUMMARY
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
X-List-Received-Date: Tue, 26 Nov 2013 14:42:10 -0000

Also don't set DESCRIPTION to the same value, it's superfluous.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-lsb4/libpng/libpng12_1.2.50.bb    | 3 +--
 meta/recipes-multimedia/libpng/libpng_1.6.6.bb | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
index 95d5fb1..29d581b 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
@@ -1,5 +1,4 @@
-SUMMARY = "PNG Library"
-DESCRIPTION = "PNG Library"
+SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.6.bb b/meta/recipes-multimedia/libpng/libpng_1.6.6.bb
index 376dd53..7bc8141 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.6.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.6.bb
@@ -1,5 +1,4 @@
-SUMMARY = "PNG Library"
-DESCRIPTION = "PNG Library"
+SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-- 
1.8.1.2


