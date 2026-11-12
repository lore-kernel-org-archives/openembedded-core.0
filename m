Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7057.1794459685857596727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 21:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=A3+hpKtK;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9775; q=dns/txt;
  s=iport01; t=1794459685; x=1795669285;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8ATnoxZ4zQR/1Thx+P54KhyavDK+dsRnccRRGpdo5aI=;
  b=A3+hpKtKufaOMByJsraXOQ0h9BtveoowVU0mRd9KkLImQrZh6XF9EeXg
   3zpyhLxSendule4IiIEJUMCikVNG0IdcMV9ggIXNETRQPbG/uk+SMYwX+
   XVLaH8TVhZuGv5wmwdhvJ5ECdgCg1ci36aswWxi3CTmzkDjnH5YHHxws0
   xtaRuyo+9VpzGwdbmJZaQNp0tn7xr3QQTTuJX5gNeMu8dfeskOHHy/xwQ
   ijjLhZIe2Rkp4e62qRDzAYYhdXOUGa8rGDEZZ28hlrgMFffqIyVOZ+1Xj
   eOZ5l6np2OLTDbMOSKg42gpKMHOiWohBY5bzasmga1MVtPMatslKM42HS
   g==;
X-CSE-ConnectionGUID: Ro5Mu0b5TPa8z4UYabkWjw==
X-CSE-MsgGUID: z0f5LiPES7a+wbEsL11Urw==
X-IPAS-Result: =?us-ascii?q?A0BGAgC1R/Vq/5H/Ja1aglmCV3VhQkmWS4tokj2Bfg8BA?=
 =?us-ascii?q?QEPPRQEAQGFBY4gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBKgsBGAEtLAMBAk8LIyEagmgBgjoDNwIBEblTgXkzgQGDK?=
 =?us-ascii?q?QHaIA2CWgELFAEFgTOFQoMAhSRdGAGEfScbG4FyhH+CH0IBiCcEgiKBDIFaH?=
 =?us-ascii?q?mSMFAKBT4clSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQVdgSsoXQEhgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKfhgNSBEsNxUZBD5uB5Jsg?=
 =?us-ascii?q?xQBgQ8rUEiUJWqPWoIhoCBxCiiDeIwkjz6FfBozhASmbpkIglmPO5JHK4Q/g?=
 =?us-ascii?q?Wg8gVlwFTuCMwEBATEJShkPlzfJSCM1AjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:e6Lfc6Kv4BiD/gyqFE+Rz5QlxSXFcZb7ZxGr2PjKsXjdYENSgTAAz
 2AXWT/SbKuKMTf2fY1zYIm09khSvpTSnddkHFAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmcuajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1UCxwTINUSp9pPCDFcq
 cEpIToOURKc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEmojx5nYj/7DLo3h/+hnHz2aRVTqUmeouw85G27IAlZjeSzaYSIJYHQLSlTtlTAq
 D/i/lzUOU4Td8OV5CGhqyuRnPCayEsXX6pXTtVU7MVChVSPxm0eFVsaSFG8oOL8gFS/UtRTA
 0YT/TYqrK50/0uuJvHnXha4qWSI+AYBQdZRHsU+6QeQ2qTT/gCVD3QFSTgHb8Yp3OcxXTEs2
 1qDkt/lCDAqu7qPRFqZ96yItnW1ISUTIGoIaCMIQAdD5MPsyLzflTrVRdplVarwhdrvFHSok
 3aBrTM1gPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:iTyPKaMJV9HQfMBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:ZRhN8W6fuMm/BRWEGdsszklJP919eCDh9H6AMROFOG9jS4KXVgrF
X-Talos-MUID: 9a23:lNZk+As517Y8H82Pns2nlmlsaeNp24mVV0lOjp8roO3dbBFqJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="546165752"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Nov 2026 05:01:23 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 53D1C180001CE;
	Thu, 12 Nov 2026 05:01:22 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id F1CDDCC1634; Wed, 11 Nov 2026 21:01:21 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Deepak Rathore <deeratho@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-Core][blacksail][PATCH] ruby: upgrade 4.0.7 -> 4.0.9
Date: Wed, 11 Nov 2026 21:01:18 -0800
Message-Id: <20261112050118.3927314-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250064
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Refresh the existing recipe patches for the new release and update the
source checksum.

Release notes:
* https://www.ruby-lang.org/en/news/2026/10/22/ruby-4-0-8-released/
* This is a routine update that includes bugfixes.
* https://www.ruby-lang.org/en/news/2026/10/23/ruby-4-0-9-released/
* This release includes a fix for a regexp compilation bug related to
  CVE-2026-110264. The CVE-2026-97229 regexp fix was already included
  in Ruby 4.0.8.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45e42b4df9c67ea24d96177d35b62384c1eb9790)
Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 ...1-Avoid-build-time-race-condition-when-cross-compiling.patch | 2 +-
 .../ruby/0001-Don-t-save-the-original-name-and-timestamp.patch  | 2 +-
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch     | 2 +-
 ...0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 2 +-
 .../ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch   | 2 +-
 .../ruby/ruby/0003-rdoc-build-reproducible-documentation.patch  | 2 +-
 ...4-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 2 +-
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch             | 2 +-
 .../0007-Skip-test_rm_r_no_permissions-test-under-root.patch    | 2 +-
 meta/recipes-devtools/ruby/{ruby_4.0.7.bb => ruby_4.0.9.bb}     | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.7.bb => ruby_4.0.9.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
index d62e3affff..f56511c4fb 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 94b3a85def80680c6efb35e75b6e0dcd4bbf4645 Mon Sep 17 00:00:00 2001
+From da35533d51a51810f08d469d4c213387683919ac Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Fri, 31 Jul 2026 13:15:37 +0100
 Subject: [PATCH] Avoid build-time race condition when cross-compiling from a
diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index 1fd2066e1e..f3ef90ccb7 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From ac16ff9a35127c718422caf27fbe1dfa2309b136 Mon Sep 17 00:00:00 2001
+From 50214e465cf7ed0e61a9bddf40776ea02ea016a6 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 36037aede3..82642a32ef 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From 846b17f3dbdbbd6b7dd7dcc81fda1826b87ee541 Mon Sep 17 00:00:00 2001
+From a7223627ee307d17aaefec37af91be8aa713d13f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index ea63dfe227..1e8b4ce719 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From f94129cac9e412a64bfb3dbd796912df058c6e1b Mon Sep 17 00:00:00 2001
+From 26cb483121c5c8c8842ff77e00ddff0a706002a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 0e7c23007b..d76a31cdec 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From 385ea30ee2219bf9d1c702f18e38a2402a77a443 Mon Sep 17 00:00:00 2001
+From 1093a46b7a4b9e7981921ead5818bccd03e05830 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 8bf6f38afe..2ec279ab53 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 3f6ac07fd0359eb3d41db86a4276b5c7818f2e6b Mon Sep 17 00:00:00 2001
+From bc9ead00cb7700381689be2362a8db9ceda9be40 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index c50cd7d2b2..9ee19ed3ab 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 0347f66bb6e834c5a5d469f5903527699a8a9f8e Mon Sep 17 00:00:00 2001
+From eec9acef646d6ed28a859e18461688520b2de1ba Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index e4974ff72e..0cf6ba62eb 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 0e53d59cddda29e0c1d7d4196cc1255e04a3b39f Mon Sep 17 00:00:00 2001
+From aff3fa8a85ae050bcb4cf6ff5cac5d4a93863643 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 3dfe4897f6..dfdab29d89 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From d4723a7dda5d2b57863ee1bba6a7456c732ea8e6 Mon Sep 17 00:00:00 2001
+From c8d3ce447197ce9fdb23b1f37b3b0cc161aa2791 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index 70b3efb4d5..95c2fc8bd5 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From a811d47c307d33a1ee78c752dc2fff57ce6b0ba8 Mon Sep 17 00:00:00 2001
+From 7e2e3baece59ae73a15a7d28a6f3330eeb09851f Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.7.bb b/meta/recipes-devtools/ruby/ruby_4.0.9.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.7.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.9.bb
index d8dcde5fbb..8c3f8fdf68 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.7.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.9.bb
@@ -49,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "911ace20f90d068ca0e4dda6d0e4f0f81e52e52f2dd4f4004c721e253412e82d"
+SRC_URI[sha256sum] = "c35350682ff050b79702d57ade4516e7336063f510155d19fb2fb5b3f3909511"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.35.6

