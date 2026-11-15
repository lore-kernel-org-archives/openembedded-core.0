Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15256.1794778992495382099
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Pgx8EQ1D;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202611152143104cf860c4d0000207e5-ec7n4t@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202611152143104cf860c4d0000207e5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:43:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HfdST0sqPPF3EFEmrRdpvngRyCQv23ZzMmjjqtgX7uE=;
 b=Pgx8EQ1DRgQ4AdR3IZLhw78gbWVUx5qCo6EJb4Q5H636UF06UNiKrTdXccd5mItdxWoakn
 gEK1IA/Qa6eZdlpIKZqz2PwEb3tlYFJFd//OjjXUrHH5AjJ//sEdAO2acDDY8s48xNGOc+FZ
 dFz6K2V3XOkuX0TtEiRsRdHG9qoN5231q9893rohvEabqU5neMj/rAB0ejdwTsUhuthpdiFE
 nkzLGVDw+eXk/JZYacAHYEsUPAsvhWpRSlTd965yLBR0rURmUwMJh2GlfQK0EOrb9dYhPaet
 GsYgu1IAbB8VueP5a6+Hn+klEexVLrCz4FQ9/lvicOmtpLneMscQXnWA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 9/9] ruby: upgrade 4.0.7 -> 4.0.9
Date: Sun, 15 Nov 2026 22:39:43 +0100
Message-ID: <20261115213944.1653468-9-peter.marko@siemens.com>
In-Reply-To: <20261115213944.1653468-1-peter.marko@siemens.com>
References: <20261115213944.1653468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250298
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
(From OE-Core rev: 45e42b4df9c67ea24d96177d35b62384c1eb9790)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
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
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.7.bb => ruby_4.0.9.bb} (98%)

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
index 23947ed904..1b87feeb45 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.7.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.9.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "911ace20f90d068ca0e4dda6d0e4f0f81e52e52f2dd4f4004c721e253412e82d"
+SRC_URI[sha256sum] = "c35350682ff050b79702d57ade4516e7336063f510155d19fb2fb5b3f3909511"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
