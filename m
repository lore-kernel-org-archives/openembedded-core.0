Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3704360670
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:09:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2016 16:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,697,1473145200"; d="scan'208";a="905532336"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga003.jf.intel.com with ESMTP; 25 Nov 2016 16:09:25 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Nov 2016 18:10:40 -0600
Message-Id: <20161126001040.31696-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] ruby: upgrade to 2.3.1
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
X-List-Received-Date: Sat, 26 Nov 2016 00:09:25 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/recipes-devtools/ruby/ruby.inc                         | 2 +-
 meta/recipes-devtools/ruby/{ruby_2.2.5.bb => ruby_2.3.1.bb} | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.2.5.bb => ruby_2.3.1.bb} (86%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index fde67e9..f38ebb0 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
     file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \
     file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=c440adb575ba4e6e2344c2630b6a5584\
+    file://LEGAL;md5=78e8a29b8cc93e042990dbbb5572b1e1\
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
diff --git a/meta/recipes-devtools/ruby/ruby_2.2.5.bb b/meta/recipes-devtools/ruby/ruby_2.3.1.bb
similarity index 86%
rename from meta/recipes-devtools/ruby/ruby_2.2.5.bb
rename to meta/recipes-devtools/ruby/ruby_2.3.1.bb
index 5a64582..299383a 100644
--- a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.3.1.bb
@@ -1,7 +1,7 @@
 require ruby.inc
 
-SRC_URI[md5sum] = "bd8e349d4fb2c75d90817649674f94be"
-SRC_URI[sha256sum] = "30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3"
+SRC_URI[md5sum] = "0d896c2e7fd54f722b399f407e48a4c6"
+SRC_URI[sha256sum] = "b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
@@ -15,6 +15,8 @@ PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
 PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
 PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
 
+EXTRA_AUTORECONF += "--exclude=aclocal"
+
 EXTRA_OECONF = "\
     --disable-versioned-paths \
     --disable-rpath \
-- 
2.9.3


