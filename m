Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBC8731C2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 05:35:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10496880"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Sep 2016 13:35:57 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E0551403CC5C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 13:35:54 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 1 Sep 2016 13:35:54 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Sep 2016 01:35:51 -0400
Message-ID: <1472708151-1708-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: E0551403CC5C.A6425
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ruby: 2.2.5 -> 2.3.1
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
X-List-Received-Date: Thu, 01 Sep 2016 05:36:00 -0000
Content-Type: text/plain

1) Upgrade ruby from 2.2.5 to 2.3.1.
2) Modify LIC_FILES_CHKSUM, since the date in it has been changed, But the LICENSE has not been changed.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/ruby/ruby.inc                         | 2 +-
 meta/recipes-devtools/ruby/{ruby_2.2.5.bb => ruby_2.3.1.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.2.5.bb => ruby_2.3.1.bb} (89%)

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
similarity index 89%
rename from meta/recipes-devtools/ruby/ruby_2.2.5.bb
rename to meta/recipes-devtools/ruby/ruby_2.3.1.bb
index 5a64582..f9f5b33 100644
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
-- 
2.7.4




