Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DE0DC6B7AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010156"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:28 +0000
Message-Id: <cb267e934577c47d78bb75032e37c8149dacb15f.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 32/38] guilt-native: tidy up recipe
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:31 -0000

* Fix indentation and spacing
* Drop SRC_URI checksums that aren't used (recipe is fetching from git)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/guilt/guilt-native_git.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/guilt/guilt-native_git.bb b/meta/recipes-devtools/guilt/guilt-native_git.bb
index e88ae2c..dfb3378 100644
--- a/meta/recipes-devtools/guilt/guilt-native_git.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_git.bb
@@ -6,15 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
 inherit native
 
 SRC_URI = "git://repo.or.cz/guilt.git \
-	   file://guilt-bash.patch \
-          "
+           file://guilt-bash.patch \
+           "
 
-SRCREV="c2a5bae511c6d5354aa4e1cb59069c31df2b8eeb"
+SRCREV = "c2a5bae511c6d5354aa4e1cb59069c31df2b8eeb"
 
-S="${WORKDIR}/git"
-
-SRC_URI[md5sum] = "d800c5e0743d90543ef51d797a626e09"
-SRC_URI[sha256sum] = "64dfe6af1e924030f71163f3aa12cd846c80901d6ff8ef267ea35bb0752b4ba9"
+S = "${WORKDIR}/git"
 
 # we don't compile, we just install
 do_compile() {
-- 
1.8.1.2


