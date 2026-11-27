Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1465.1795801786176411955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gcmZXVSn;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a32576da88so4855139f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801784; x=1796406584; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/CSlpyTgoz7PkSHhtRwY3WlsMXPpMG8CFdGYKBP1kg=;
        b=gcmZXVSnzoGX+Yl/VEmmaJ3Ww982jApURjb5zJOcJFTs6IbvPUF4Ynp+GY6G2qnE1S
         f/P0SIdQe49SuvPMcr7Y0S4WxkzKyEhImE6sYMwR62K4m9EhKxt3wtwGRPsqrH2OixZB
         NlSIMv9WDKdnrSPAZrqXtAyPYXvvGeVBmK9FsfIPiTuoZQ02nhSZfI2QGqu8vAFgXJ4a
         sVtbGLJtx3QGZKLHoas+iTbZ7++tfU4n0oFpEAzUZ27LdEyhSTcEP6W3ZYkqUwhiYvCp
         ACMKcP/PJNfdHTfVFH2jJWOXdHBF1WRGqHpvfEkGD3eXoCT23JP0LQyFjSecNfTHTtNv
         YIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801784; x=1796406584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/CSlpyTgoz7PkSHhtRwY3WlsMXPpMG8CFdGYKBP1kg=;
        b=UBdYrDp1Sn1dmSKVw+P83ACx8Z8AM33HZiW73d7gtBrynynDOLcMXpj0golbBJ+lpw
         ASziuKtVaX7xEH3hBgoZfaHiVAtfFXbOrwG8REEc+HFRCcMXExQBYAl17g8ZAq4ARYaa
         104iwM+Y76cGQQKwmm2S4cuyEUkbkN5zv8e+Iz25ytlau3QceGfaIy5BwMhDhxQXVhM2
         OWOPMb1UZ5JKOCBqz2XIlHoUew5Hl1MHF6/zozqTq+5vuBl0wyPrxPuE0dApF+1qgWcI
         lI0IPTp8fAhS6m3dq9pKgcBuXkw9NUD9kuIVWmZ8Ntf2jw3q8IHa0DMI1TBi1o2Tw5N6
         4XFg==
X-Gm-Message-State: APuU4Z/JjwObyoTrf19FQx38Xju12LDSqSXvw2bgIbp60Yar0hNlh1Si
	K5sFBUg2/b/AFG1cr2giPt8a7TfeqwhW+kSTpKBWxH1SRaPXIpiYgyR/HA72Qmm/6U5jN8UNx4b
	i+eDoRHI=
X-Gm-Gg: AZFdTZeBVxAMdlxppU+b7hDlTFNApbJpSItCaZ435EZvH7Uu2NE6/5693IyRKF308cJ
	1+I8cuZaEwixhv+Ih0I82VY1cq2pcZBLpvZNsCg6bFYYOinIyABNfLE4idL3nn2CO9HKculK96+
	RFp8qhrbkTM4rMyPS3vZynf22Lp//pvkB+RohSoVezyqcJ+qFGQy5j5kynnhhtg0ujUcPphD+iL
	Hm/CY6yugOShNlOPXU2yWjah6qHTeFGOFN7QYwMOwnCa+MuJLqTMdHTlj4xNrXIf4uedVBvqVNy
	Y0IhtlWoPAYK0Dt5xdREz6ajUbA/sKzEQbt28E4P8levsyBU6GQbjnFFW1RVTwaTrgjl5sOf7AP
	o7NCJnEO4MivT1vqORxyBSxXoGSrZQcbkeqx+zQPTSXwDuLdShMKs0g7dmkgi+CzXrKGL1sO5mx
	1W/XulPj6BJKtVbCMBKuVGHjSng4Uyox4LZEFTy0meD1RvPFFSoMJBoXSjpjyHVqb39QkQ7UNI+
	o+CX+AoIq5eKg+CTSc9YMuFmVt6uty0pjM3JLgsQz+MRoc0nmF/0oKSp3dpE8EOtSX/7NyhUW6t
	G6H2Ap4pJ+qrZQf1zzWfzTJsNC3cjwONL3cPsuVCxQz2VP5A5Jz7ZtxPwEvnN1kurzHIp6o9j9Y
	UhdOUyDyEHnDMcQrm33IyZ9abn6tDZA==
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id ffacd0b85a97d-4ad5d5f9320mr50146747f8f.2.1795801784350;
        Fri, 27 Nov 2026 09:49:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/37] ruby: Upgrade 3.3.10 -> 3.3.14
Date: Fri, 27 Nov 2026 18:49:01 +0100
Message-ID: <6aebb5433ab7095e47fe26434618bb437ded8c35.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251424
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Per Ruby's maintenance policy [1], upgrade to the latest release in the
3.3 series, 3.3.14. It includes fixes for multiple security issues [2],
including the regexp compilation issues associated with CVE-2026-97229
[3].

Ruby 3.3.14 begins the upstream legacy maintenance phase, which includes
selected bug fixes in addition to security fixes [2]. The update remains
within the 3.3 stable series.

[1] https://www.ruby-lang.org/en/downloads/branches/
[2] https://www.ruby-lang.org/en/news/2026/11/18/ruby-3-3-14-released/
[3] https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-cves/

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: Changelogs:
     https://github.com/ruby/ruby/releases/tag/v3_3_11
     https://github.com/ruby/ruby/releases/tag/v3_3_12
     https://github.com/ruby/ruby/releases/tag/v3_3_13
     https://github.com/ruby/ruby/releases/tag/v3_3_14
]
---
 ...-fix-cross-compilation-of-external-gems.patch | 11 ++++-------
 ...Define-REG_S1-and-REG_S2-for-musl-riscv.patch |  7 ++-----
 ...3-rdoc-build-reproducible-documentation.patch | 16 +++++++++-------
 ...ort-list-of-object-files-in-generated-M.patch |  7 +++++--
 ...c-reproducible-change-fixing-784225-too.patch |  7 ++-----
 .../ruby/0006-Make-gemspecs-reproducible.patch   |  5 +----
 ...est_rm_r_no_permissions-test-under-root.patch |  5 +----
 .../ruby/{ruby_3.3.10.bb => ruby_3.3.14.bb}      |  2 +-
 8 files changed, 25 insertions(+), 35 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.10.bb => ruby_3.3.14.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 2e3156880ef..366e5084840 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,7 +1,7 @@
-From a6e12b25a54d112c899b70c89c0bec9c5e5ebf3c Mon Sep 17 00:00:00 2001
+From cdd2867757f14690309567fa5bb5ae223ee004a5 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
-Subject: [PATCH 1/3] extmk: fix cross-compilation of external gems
+Subject: [PATCH] extmk: fix cross-compilation of external gems
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,10 +16,10 @@ Signed-off-by: André Draszik <andre.draszik@jci.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ext/extmk.rb b/ext/extmk.rb
-index 1389dc4117..e4d923d7a7 100755
+index 1f8e59f..631459d 100755
 --- a/ext/extmk.rb
 +++ b/ext/extmk.rb
-@@ -413,8 +413,8 @@ def $mflags.defined?(var)
+@@ -428,8 +428,8 @@ else
  end
  $ruby = [$ruby]
  $ruby << "-I'$(topdir)'"
@@ -29,6 +29,3 @@ index 1389dc4117..e4d923d7a7 100755
    $ruby << "-I'$(extout)/$(arch)'" << "-I'$(extout)/common'" if $extout
    ENV["RUBYLIB"] = "-"
  end
--- 
-2.23.0.rc1
-
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index f7b7adb3fdb..e512b57c200 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From dfb22e4d6662bf72879eda806eaa78c7b52b519e Mon Sep 17 00:00:00 2001
+From fa1eac6cf67c9d594884940d2f46d3042f489883 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index a98f5aa..957b785 100644
+index 2771264..7995e12 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -39,6 +39,11 @@
@@ -29,6 +29,3 @@ index a98f5aa..957b785 100644
  #define VM_CFP_CNT(ec, cfp) \
    ((rb_control_frame_t *)((ec)->vm_stack + (ec)->vm_stack_size) - \
     (rb_control_frame_t *)(cfp))
--- 
-2.35.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index f92f0e1ba68..731aace31e2 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,6 +1,7 @@
+From 9a945f194e50cbd93ea7b08bd85560a748a4a293 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
-Subject: rdoc: build reproducible documentation
+Subject: [PATCH] rdoc: build reproducible documentation
 
 - provide a fixed timestamp to the gzip compression
 
@@ -10,23 +11,24 @@ Signed-off-by: Antonio Terceiro <terceiro@debian.org>
 Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
 ---
  lib/rdoc/generator/json_index.rb | 4 ++--
- lib/rdoc/rdoc.rb                 | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/json_index.rb
+index c454910..24feab0 100644
 --- a/lib/rdoc/generator/json_index.rb
 +++ b/lib/rdoc/generator/json_index.rb
-@@ -178,7 +178,7 @@
+@@ -178,7 +178,7 @@ class RDoc::Generator::JsonIndex
      debug_msg "Writing gzipped search index to %s" % outfile
-
+ 
      Zlib::GzipWriter.open(outfile) do |gz|
 -      gz.mtime = File.mtime(search_index_file)
 +      gz.mtime = -1
        gz.orig_name = search_index_file.basename.to_s
        gz.write search_index
        gz.close
-@@ -196,7 +196,7 @@
+@@ -196,7 +196,7 @@ class RDoc::Generator::JsonIndex
          debug_msg "Writing gzipped file to %s" % outfile
-
+ 
          Zlib::GzipWriter.open(outfile) do |gz|
 -          gz.mtime = File.mtime(dest)
 +          gz.mtime = -1
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index e0aca0dcfc1..031f89bf17e 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,6 +1,7 @@
+From 732263f3623216fbb79560baaf5bc3014e9f7f18 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
-Subject: lib/mkmf.rb: sort list of object files in generated Makefile
+Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
 
 Without sorting the list explicitly, its order is indeterministic,
 because readdir() is also not deterministic.
@@ -15,9 +16,11 @@ Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
  lib/mkmf.rb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/lib/mkmf.rb b/lib/mkmf.rb
+index 51585b1..e6ba142 100644
 --- a/lib/mkmf.rb
 +++ b/lib/mkmf.rb
-@@ -2315,7 +2315,7 @@
+@@ -2368,7 +2368,7 @@ LOCAL_LIBS = #{$LOCAL_LIBS}
  LIBS = #{$LIBRUBYARG} #{$libs} #{$LIBS}
  ORIG_SRCS = #{orig_srcs.collect(&File.method(:basename)).join(' ')}
  SRCS = $(ORIG_SRCS) #{(srcs - orig_srcs).collect(&File.method(:basename)).join(' ')}
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 0902a201eca..5e8f9f583c7 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 6e1dc610724a7aa8368cbcddf4bbe21cccc0f731 Mon Sep 17 00:00:00 2001
+From 96b6b0a02214b129c349fdb00b755b24131bc181 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,7 +12,7 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index d6eac7f..4b2e95e 100644
+index e438669..3ce9af8 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
 @@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
@@ -26,6 +26,3 @@ index d6eac7f..4b2e95e 100644
                Time.utc(date.year, date.month, date.day)
              else
                TODAY
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index d32e2091292..949f7c144d5 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 3f60710bc29c1b08e128314d40101e87b7d2c9a1 Mon Sep 17 00:00:00 2001
+From 11d6a3b19cd729900f93a8f04a01ab3d569d5572 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -75,6 +75,3 @@ index 93a281c..cc5c155 100644
    s.version = RDoc::VERSION
  
    s.authors = [
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index dc06891bbc2..92af032d182 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From cc5e563f0fa5212e4a624b954fbc97cc6d8900d4 Mon Sep 17 00:00:00 2001
+From 42ef19cec8a34847538bfc62d37e842837025337 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 25 Aug 2025 16:31:18 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
@@ -25,6 +25,3 @@ index 481f913..a2ed414 100644
  
      mkdir 'tmpdatadir'
      touch 'tmpdatadir/tmpdata'
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.10.bb b/meta/recipes-devtools/ruby/ruby_3.3.14.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.10.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.14.bb
index 936bc73e32f..791b8072ffe 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.10.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.14.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "b555baa467a306cfc8e6c6ed24d0d27b27e9a1bed1d91d95509859eac6b0e928"
+SRC_URI[sha256sum] = "d0438ee291b0cacaf97c7a71df4c939d7f3265c8c2d1b8ffe27311f71fc680b0"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
