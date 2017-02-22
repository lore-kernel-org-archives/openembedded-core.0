Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 381DE73111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302189"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:08 +0200
Message-Id: <a8afe2065e18fbcfd4f38a5a7d9ba49dc431899f.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/24] ed: update to 1.14.1
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:25 -0000

Revert to the upstream server, now that we can handle .lz files.
License checksum changes are due to copyright years.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/ed/{ed_1.9.bb => ed_1.14.1.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.9.bb => ed_1.14.1.bb} (51%)

diff --git a/meta/recipes-extended/ed/ed_1.9.bb b/meta/recipes-extended/ed/ed_1.14.1.bb
similarity index 51%
rename from meta/recipes-extended/ed/ed_1.9.bb
rename to meta/recipes-extended/ed/ed_1.14.1.bb
index 83c31fc6db7..5d89a87805b 100644
--- a/meta/recipes-extended/ed/ed_1.9.bb
+++ b/meta/recipes-extended/ed/ed_1.14.1.bb
@@ -2,19 +2,19 @@ SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://ed.h;endline=20;md5=375a20cc2545ac1115eeb7b323c60ae3 \
-                    file://main.c;endline=17;md5=14dbb325c1f2d4daf50e0aa5c5038e96"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
+                    file://ed.h;endline=20;md5=4e36b7a40e137f42aee718165590d125 \
+                    file://main.c;endline=17;md5=c5b8f78f115df187af76868a2aead16a"
 
 SECTION = "base"
 
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
 
-SRC_URI[md5sum] = "565b6d1d5a9a8816b9b304fc4ed9405d"
-SRC_URI[sha256sum] = "d5b372cfadf073001823772272fceac2cfa87552c5cd5a8efc1c8aae61f45a88"
+SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
+SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.11.0


