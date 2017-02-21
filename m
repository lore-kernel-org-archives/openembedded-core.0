Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9496C72F7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 16:56:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 21 Feb 2017 08:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="227993194"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2017 08:56:41 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 11:03:55 -0600
Message-Id: <1487696635-20973-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] ruby: upgrade 2.3.3 -> 2.4.0
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
X-List-Received-Date: Tue, 21 Feb 2017 16:56:42 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Two LIC_FILES_CHKSUM checksums changed (COPYING and LEGAL) but LICENSE remains
the same.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-devtools/ruby/ruby.inc                         | 4 ++--
 meta/recipes-devtools/ruby/{ruby_2.3.3.bb => ruby_2.4.0.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.3.3.bb => ruby_2.4.0.bb} (89%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index f38ebb0..e2a2c05 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -8,10 +8,10 @@ HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
 LICENSE = "Ruby | BSD | GPLv2"
 LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \
+    file://COPYING;md5=8a960b08d972f43f91ae84a6f00dcbfb \
     file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=78e8a29b8cc93e042990dbbb5572b1e1\
+    file://LEGAL;md5=daf349ad59dd19bd8c919171bff3c5d6 \
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
diff --git a/meta/recipes-devtools/ruby/ruby_2.3.3.bb b/meta/recipes-devtools/ruby/ruby_2.4.0.bb
similarity index 89%
rename from meta/recipes-devtools/ruby/ruby_2.3.3.bb
rename to meta/recipes-devtools/ruby/ruby_2.4.0.bb
index 7ba9b46..9b951fc 100644
--- a/meta/recipes-devtools/ruby/ruby_2.3.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.4.0.bb
@@ -1,7 +1,7 @@
 require ruby.inc
 
-SRC_URI[md5sum] = "e485f3a55649eb24a1e2e1a40bc120df"
-SRC_URI[sha256sum] = "241408c8c555b258846368830a06146e4849a1d58dcaf6b14a3b6a73058115b7"
+SRC_URI[md5sum] = "7e9485dcdb86ff52662728de2003e625"
+SRC_URI[sha256sum] = "152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
2.1.4


