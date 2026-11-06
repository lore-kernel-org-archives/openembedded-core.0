Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2330.1793956404871581763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 01:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=btgGRwnY;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9507; q=dns/txt;
  s=iport01; t=1793956404; x=1795166004;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DptnTiMwsEvBCXpeqzUdOOuc6WPvZ5qRVHeZos8ERsc=;
  b=btgGRwnYuhBtmxiy4/RAj1saCC60rJkECFXJ/meuKvckv477TFM/whYq
   /fVLSF3YDwxl5Z1bBOCWDhAMmii3RZ0+MIx1C32qHhkIhQaUoTFbFQZnj
   GWZ66AlzzSnpecI9q/VPOQAzv717wQR1yWui5CylWYygyXi3p8h+/B65M
   DhTBXij3Y/Bw/F1nMPthYNyEGI0AkRtb6PJjexFXWhlXZ3TLzXG0jlVVg
   JAoaC3pMn+4nM4JuYw4N6TNOprryvsYfDWxrMtLngCBXnDiZ4mOqdCzbJ
   rMfjIsqP5y6AQwN7ATmDd7lkXVFgPw7W8JFoac/X35vmB4l/8xw6rJ2YU
   A==;
X-CSE-ConnectionGUID: MiwixUduRvabppn5OqfLNQ==
X-CSE-MsgGUID: 5FIyhYdCR/W1fKhutloHRA==
X-IPAS-Result: =?us-ascii?q?A0BFAgBnmO1q/47/Ja1aglmCV3VhQkmUKoIhi2iSPIF+D?=
 =?us-ascii?q?wEBAQ89FAQBAZMkAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAS0LARgBWQMBAk8LIyEagmgBgjoDNwIBEbwGgXkzgQGDKQGBV?=
 =?us-ascii?q?NhMDYJaAQsUAYE4hUCCf4UkXRgBhH0nGxuBcoR+gh9CAYgnBIIigQyBWh5lj?=
 =?us-ascii?q?BUCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BE?=
 =?us-ascii?q?oEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNSBEsNxUZBD5uB5I9gxEBg?=
 =?us-ascii?q?Q8rUEiUJWqPWoIhoCBxCiiDeIwkjz6FfBozhASmbZkIglmPO5JHK4Q+gWg8g?=
 =?us-ascii?q?VlwFTuCMwEBATEJShkPlzfGdyM1Aj0HAgcPApNxAQE?=
IronPort-Data: A9a23:GPNSsKiB1il7Hn4MdDMnFvIZX161MREKZh0ujC45NGQN5FlHY01je
 htvCD/Saa2MNDSmethybYXj/EsF6JSAy4RiTFBtr3g1EXljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvre8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU9+/l2EVxC6
 MYGIToVdhbeoPu45JSCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9J4DXHZkEwRbJz
 o7A1znXIwAaBdC08326q3yPhvLTmSTbYqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:xL6gfKwqfr6R/0Qh2j6kKrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: 9a23:Ot+uSm3lyoViECKXnsq0TbxfP8E6c23gwGrqPUayEX5vFZqMR3u2wfYx
X-Talos-MUID: 9a23:5Q/K1gnLuQ6NGKcH+uCcdno/GuZ545WiI3pKrswImMmZKSh3Gw202WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545049789"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 09:13:23 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id AEF7D18000234
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 09:13:23 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 5CD17CC1600; Fri,  6 Nov 2026 01:13:23 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] ruby: upgrade 4.0.7 -> 4.0.9
Date: Fri,  6 Nov 2026 01:13:07 -0800
Message-Id: <20261106091307.938832-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249623
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

