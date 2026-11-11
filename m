Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7151.1794395004341060430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=grpnV4VS;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9571; q=dns/txt;
  s=iport01; t=1794395004; x=1795604604;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zgDBibZhSf2Hy1NpJot9+Y+vCSMJ2Bpa0lItN4moUTM=;
  b=grpnV4VShSYlubHggZQHHv9r+g75/10/zhmXhZH+DJA+y2Ir7WNrPchh
   0oiOfis5/K+5DIlo0+c8Hgqs5QXsQPQbYxJThiojMc2fIwbIS+J0UjFP1
   Z/ufdNsQ/UeaNH7oUhcDXWFV+yaJTGwJlMzy/xZ1hxzZfB5vDZZNMPZvU
   N3DF0FomwYDh6sin1fEwk4UYh2oNXktjt5+sw+eled6iyByrJe4SG6sFp
   /BvwOLL6oPXs8LyKPwNwTje7yA+K0+U0prySlpDXe9KqO9LDXGm6ZIIUE
   xcN4NQckIoNqaKsx8zQBKZuAWkH/8Xz4BDeQjzbIzFNHypyoinNguYf2/
   g==;
X-CSE-ConnectionGUID: hh4+nYp8QEibq/vFd3CwCA==
X-CSE-MsgGUID: 2T7ToJf3TEagXnrEM44aRg==
X-IPAS-Result: =?us-ascii?q?A0BFAgCOSvRq/5P/Ja1aglmCV3VhQkmUKoIhi2iSPYF+D?=
 =?us-ascii?q?wEBAQ89FAQBAZMlAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAS0LARgBWQMBAk8LIyEagmgBgjoDNwIBEblVgXkzgQGDKQGBV?=
 =?us-ascii?q?NhMDYJaAQsUAYE4hUKDAIUkXRgBhH0nGxuBcoR/gh9CAYEohn8EgiKBDIFaH?=
 =?us-ascii?q?mSMGAKBT4clSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+Gwp+GA1IESw3FRkEPm4Hkm6DF?=
 =?us-ascii?q?AGBDgErFzlIlQ+PWoIhoCBxCiiDeIwkjz6FfBozhASmbpkIglmPO5JHK4Q/g?=
 =?us-ascii?q?Wg8gVlwFTuCMwEBATEJShkPlzfJSCM1AjsCBwIHDgMLkWiBfgEB?=
IronPort-Data: A9a23:Eq2WpKBMQ+J21hVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDsh02QDm
 zAZUTyFaP6LY2b2Kd9/btnj9h9V6JbUx981OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb8gmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEw/UyT0cHJd0h1+d9GCZQ2
 /BDAy8mR0XW7w626OrTpuhEnM8vKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYwBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEqgOS3a4CMJbRmQ+0Pohmko
 UDIpFjUCx4qMsay7GbZ+0ij07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:lWPMNK08t5HsXgztrSVqtQqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:uxBGqGNmLSm6Ge5DWCk7t0glApAcX3zX1TDODUPjInlCYejA
X-Talos-MUID: =?us-ascii?q?9a23=3A8SRK8Q96vorsJZyxg4WDFYCQf51UvJipKk5Wrbg?=
 =?us-ascii?q?PtPmCLwFVZ2uUtjviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="538423217"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 11:03:23 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 2ABF91800025E
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:03:23 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id BEFB5CC1600; Wed, 11 Nov 2026 03:03:22 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] ruby: upgrade 4.0.5 -> 4.0.9
Date: Wed, 11 Nov 2026 03:02:51 -0800
Message-Id: <20261111110251.3301210-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250013
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Release notes:
* https://www.ruby-lang.org/en/news/2026/07/14/ruby-4-0-6-released/
* This is a routine update that includes bugfixes.
* https://www.ruby-lang.org/en/news/2026/09/15/ruby-4-0-7-released/
* This is a routine update that includes bugfixes.
* https://www.ruby-lang.org/en/news/2026/10/22/ruby-4-0-8-released/
* This release includes the regexp fix for CVE-2026-97229.
* https://www.ruby-lang.org/en/news/2026/10/23/ruby-4-0-9-released/
* This release includes a fix for a regexp compilation bug related to
  CVE-2026-110264.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../0001-Don-t-save-the-original-name-and-timestamp.patch   | 2 +-
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch | 2 +-
 ...-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 4 ++--
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch    | 2 +-
 .../ruby/0003-rdoc-build-reproducible-documentation.patch   | 2 +-
 ...b-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch         | 2 +-
 ...0007-Skip-test_rm_r_no_permissions-test-under-root.patch | 2 +-
 meta/recipes-devtools/ruby/{ruby_4.0.5.bb => ruby_4.0.9.bb} | 2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.5.bb => ruby_4.0.9.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index b5bcfab924..f3ef90ccb7 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From efd3a6d0f0cef4b2313a106f1a00e7d4a597d510 Mon Sep 17 00:00:00 2001
+From 50214e465cf7ed0e61a9bddf40776ea02ea016a6 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index e00ce7bb73..82642a32ef 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From 7c1f11416499ce7cd1e6874840df2498e922ab78 Mon Sep 17 00:00:00 2001
+From a7223627ee307d17aaefec37af91be8aa713d13f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 8ae4202e60..1e8b4ce719 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 4b66682db87a92d20c5ef0a00ea6eef41526d0cc Mon Sep 17 00:00:00 2001
+From 26cb483121c5c8c8842ff77e00ddff0a706002a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index e2b4804..0b7d868 100644
+index 8558ed8..230702d 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -40,6 +40,11 @@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index af4f768442..d76a31cdec 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From e1cb706a8653c632419803f8d36f3dd2d787face Mon Sep 17 00:00:00 2001
+From 1093a46b7a4b9e7981921ead5818bccd03e05830 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 5c038a50cc..2ec279ab53 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 8476953b735fabad857ddfe78dd3ffcbef4028c5 Mon Sep 17 00:00:00 2001
+From bc9ead00cb7700381689be2362a8db9ceda9be40 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 0ba10724cb..9ee19ed3ab 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 9fa6d40d1f7eed5be981c034c3f36bd4a3b5efab Mon Sep 17 00:00:00 2001
+From eec9acef646d6ed28a859e18461688520b2de1ba Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 4a10f861dc..0cf6ba62eb 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 265381bc616fa281a58b3761c33620c465884ca8 Mon Sep 17 00:00:00 2001
+From aff3fa8a85ae050bcb4cf6ff5cac5d4a93863643 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 2db9352..925b7a0 100644
+index 9ae135c..427ab48 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1714,7 +1714,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1726,7 +1726,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 92439ffd7a..dfdab29d89 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 40236d16b640b0c522a550b628cbfb6ee0cdc972 Mon Sep 17 00:00:00 2001
+From c8d3ce447197ce9fdb23b1f37b3b0cc161aa2791 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index cb77fffe56..95c2fc8bd5 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From ccb40b4715abfb6c53d431bf421ccfbcdbc4ff93 Mon Sep 17 00:00:00 2001
+From 7e2e3baece59ae73a15a7d28a6f3330eeb09851f Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.5.bb b/meta/recipes-devtools/ruby/ruby_4.0.9.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.5.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.9.bb
index a0981bf622..1b87feeb45 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.9.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "7d6149079a63f8ae1d326c9fa65c6019ba2dc3155eae7b39159817911c88958e"
+SRC_URI[sha256sum] = "c35350682ff050b79702d57ade4516e7336063f510155d19fb2fb5b3f3909511"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.35.6

