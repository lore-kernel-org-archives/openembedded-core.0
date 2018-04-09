Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EFB6475086
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:54:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="218897615"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 09 Apr 2018 04:54:49 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 7F430580425
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:54:48 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:55:07 +0300
Message-Id: <1523274911-20401-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
References: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/8] ruby: upgrade to version 2.5.1
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
X-List-Received-Date: Mon, 09 Apr 2018 11:54:48 -0000

License-Update: Checksum of LEGAL file updated for changes to
upstream URL and addition of Wayback Machine url

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/ruby/ruby.inc                         | 2 +-
 meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb} (90%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index fd3911b..5a5bef2 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
     file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
     file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=8f871f3f03732c018a5fa9b185958231 \
+    file://LEGAL;md5=23a79bb4c1a40f6cc9bcb6f4e7c39799 \
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline"
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.0.bb b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
similarity index 90%
rename from meta/recipes-devtools/ruby/ruby_2.5.0.bb
rename to meta/recipes-devtools/ruby/ruby_2.5.1.bb
index 1ac7f2a..9104828 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
@@ -5,8 +5,8 @@ SRC_URI += " \
            file://ruby-CVE-2017-9228.patch \
            "
 
-SRC_URI[md5sum] = "f4711f856fe14de222b9da3d3b8efa89"
-SRC_URI[sha256sum] = "46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab"
+SRC_URI[md5sum] = "23867bc8c16c55e43b14dfe0614bcfa8"
+SRC_URI[sha256sum] = "dac81822325b79c3ba9532b048c2123357d3310b2b40024202f360251d9829b1"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
2.4.0


