Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF0CC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:14:51 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.15203.1641939290281117462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TRScrq6/;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id v6so780719wra.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hbSrex4+MgkqLa4MkqEzJTnY9nDsAr6C5wDQeg/MCkY=;
        b=TRScrq6/4G/+LTvaMO5EgrN3GoYj99VQwgttFQ7nDWkx9Wfc0IQkO9a59uFMM1reaC
         IRujwn7fKAO3KtO1q8TL7iav2eInE79AeAo6PpjE/qQFevjCL8w9D9xxGEU+TuHzsoeF
         ype3HVrld9JMDyKtXBKVRzhBZUsDjRtogyFZlkQlR4/XFs+NfG1wY5++jIxOpPnkva2a
         WvOVy8n+9XlqtUX7S/ZhjJ4chBhIjmjXx497BsIxLgSjAZVFmN8BkIIGYU/Js6c8fteB
         EwTqhPyq7ufEyd9nyfWusI16D+VBwTFaURcqAnGHfz8TjSVcQsghe8fc0boVxxU3iGJ8
         Dv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hbSrex4+MgkqLa4MkqEzJTnY9nDsAr6C5wDQeg/MCkY=;
        b=7sjPgUYuq587mkYnmlahNUcQdVH5s5Fnf39/y5PVycRFDeFaRpQhfdjwd+3jSmMp1G
         CJox8E2j+xbYvZxF602yTjRfwHjToUa1YPLecsDQttiBP8rEkbu0hKPQsfY1ZC6tTn2E
         o5Pimas+KUeHdQFZ4SljK3rQBiVzViTJ8+dFjli9LOM1qDK7LhalOoocedIqB9RatrZP
         2+yuHc7cyyshGHZ6Y/5MUKucUOBU8DVvegQHVBJvrZvFQKitWPBxnvsoc4qxylZKIqWQ
         +yy6mCpUHnkN3eJMXXn1wq44idBicYIudGFgdAxujhwfK+vVH1bBZzFTWTQTOgHs0Znk
         9szQ==
X-Gm-Message-State: AOAM533moiXNkUOacxHum4SRdhh7IFzmUC3t1c1hkQxFdMabcqamM7cP
	pgHtAItMh2QR0ujxkMKYGAUsFx7mjJo=
X-Google-Smtp-Source: 
 ABdhPJwXd2qL32jYxoT08/ZVWVQTfONtDuc2AQLSjwRje4BtwoXyq0XCGjxUsdQ7WaHPBUe9BB1Xcw==
X-Received: by 2002:adf:d23b:: with SMTP id k27mr5872505wrh.517.1641939288805;
        Tue, 11 Jan 2022 14:14:48 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id f5sm356997wri.52.2022.01.11.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 14:14:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] ruby: update 3.0.3 -> 3.1.0
Date: Tue, 11 Jan 2022 23:14:40 +0100
Message-Id: <20220111221440.3867495-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220111221440.3867495-1-alex@linutronix.de>
References: <20220111221440.3867495-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 22:14:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160469

Turn on "link external modules statically" option
as otherwise ruby installer tries to do additional
building inside installed module directories in do_install
which fails horribly.

License-Update: additional MIT/BSD items

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/ruby.inc           |  9 +---
 .../0006-Make-gemspecs-reproducible.patch     | 41 ++++++++++++-------
 .../ruby/ruby/remove_has_include_macros.patch |  8 ++--
 .../ruby/{ruby_3.0.3.bb => ruby_3.1.0.bb}     | 16 ++++++--
 4 files changed, 44 insertions(+), 30 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.3.bb => ruby_3.1.0.bb} (78%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 2b5caf35f5..20ae15bd7a 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -10,7 +10,7 @@ LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPLv2 | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=cfe5b0bc9f051b58c7e78db882ca5f9b \
+                    file://LEGAL;md5=f260190bc1e92e363f0ee3c0463d4c7c \
                     "
 
 DEPENDS = "ruby-native zlib openssl libyaml gdbm readline libffi"
@@ -23,7 +23,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-inherit autotools ptest
+inherit autotools ptest pkgconfig
 
 
 # This snippet lets compiled extensions which rely on external libraries,
@@ -37,8 +37,3 @@ do_configure:prepend() {
     sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#; s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
     rm -rf ${S}/ruby/
 }
-
-# Disable openssl extension until it becomes compatible with openssl 3
-do_configure:prepend() {
-    rm -rf ${S}/ext/openssl/extconf.rb
-}
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 504893b4b4..de8d4f04cc 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,6 +1,7 @@
+From 6e1dc610724a7aa8368cbcddf4bbe21cccc0f731 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
-Subject: Make gemspecs reproducible
+Subject: [PATCH] Make gemspecs reproducible
 
 Without an explicit date, they will get the current date and make the
 build unreproducible
@@ -10,34 +11,40 @@ Upstream-Status: Backport [debian]
 ---
  ext/bigdecimal/bigdecimal.gemspec | 1 +
  ext/fiddle/fiddle.gemspec         | 1 +
- ext/io/console/io-console.gemspec | 2 +-
+ ext/io/console/io-console.gemspec | 1 +
  lib/ipaddr.gemspec                | 1 +
  lib/rdoc/rdoc.gemspec             | 1 +
- 5 files changed, 5 insertions(+), 1 deletion(-)
+ 5 files changed, 5 insertions(+)
 
+diff --git a/ext/bigdecimal/bigdecimal.gemspec b/ext/bigdecimal/bigdecimal.gemspec
+index fd49c1b..5b8bb00 100644
 --- a/ext/bigdecimal/bigdecimal.gemspec
 +++ b/ext/bigdecimal/bigdecimal.gemspec
-@@ -6,6 +6,7 @@
+@@ -4,6 +4,7 @@ Gem::Specification.new do |s|
    s.name          = "bigdecimal"
-   s.version       = bigdecimal_version
+   s.version       = "3.1.1"
    s.authors       = ["Kenta Murata", "Zachary Scott", "Shigeo Kobayashi"]
 +  s.date          = RUBY_RELEASE_DATE
    s.email         = ["mrkn@mrkn.jp"]
-
+ 
    s.summary       = "Arbitrary-precision decimal floating-point number library."
+diff --git a/ext/fiddle/fiddle.gemspec b/ext/fiddle/fiddle.gemspec
+index a9c0ec4..89da078 100644
 --- a/ext/fiddle/fiddle.gemspec
 +++ b/ext/fiddle/fiddle.gemspec
-@@ -8,6 +8,7 @@
+@@ -8,6 +8,7 @@ end
  Gem::Specification.new do |spec|
    spec.name          = "fiddle"
    spec.version       = version_module::Fiddle::VERSION
 +  spec.date          = RUBY_RELEASE_DATE
    spec.authors       = ["Aaron Patterson", "SHIBATA Hiroshi"]
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
-
+ 
+diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console.gemspec
+index 36beda7..e932d83 100644
 --- a/ext/io/console/io-console.gemspec
 +++ b/ext/io/console/io-console.gemspec
-@@ -4,6 +4,7 @@
+@@ -4,6 +4,7 @@ _VERSION = "0.5.10"
  Gem::Specification.new do |s|
    s.name = "io-console"
    s.version = _VERSION
@@ -45,23 +52,27 @@ Upstream-Status: Backport [debian]
    s.summary = "Console interface"
    s.email = "nobu@ruby-lang.org"
    s.description = "add console capabilities to IO instances."
+diff --git a/lib/ipaddr.gemspec b/lib/ipaddr.gemspec
+index 36e2300..06dc888 100644
 --- a/lib/ipaddr.gemspec
 +++ b/lib/ipaddr.gemspec
-@@ -6,6 +6,7 @@
+@@ -6,6 +6,7 @@ $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
  Gem::Specification.new do |spec|
    spec.name          = "ipaddr"
-   spec.version       = "1.2.2"
+   spec.version       = "1.2.3"
 +  spec.date          = RUBY_RELEASE_DATE
    spec.authors       = ["Akinori MUSHA", "Hajimu UMEMOTO"]
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
-
+ 
+diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
+index 525a15f..f6d0e22 100644
 --- a/lib/rdoc/rdoc.gemspec
 +++ b/lib/rdoc/rdoc.gemspec
-@@ -7,6 +7,7 @@
-
+@@ -7,6 +7,7 @@ end
+ 
  Gem::Specification.new do |s|
    s.name = "rdoc"
 +  s.date = RUBY_RELEASE_DATE
    s.version = RDoc::VERSION
-
+ 
    s.authors = [
diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
index 6e90a8ee77..b78e3db892 100644
--- a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
+++ b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
@@ -1,4 +1,4 @@
-From 303fe0d20184203f1ac86d2a77b1447d47c8c29d Mon Sep 17 00:00:00 2001
+From e74b57febec9bd806e29025e6eeb8091e7021d75 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 26 Jan 2020 11:27:40 -0800
 Subject: [PATCH] Filter out __has_include* compiler defines
@@ -21,12 +21,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/common.mk b/common.mk
-index 7633050..422aa9c 100644
+index 664f750..3b8fbe6 100644
 --- a/common.mk
 +++ b/common.mk
-@@ -233,6 +233,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time: probes.h vm.$(OBJE
+@@ -238,6 +238,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time: probes.h vm.$(OBJE
  	$(ECHO) building $(@F:.time=.h)
- 	$(MINIRUBY) $(tooldir)/mjit_tabs.rb "$(MJIT_TABS)" \
+ 	$(Q)$(MINIRUBY) $(tooldir)/mjit_tabs.rb "$(MJIT_TABS)" \
  		$(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=.h).new
 +	$(Q)sed -i -e "/#define __has_include __has_include/d" $(@F:.time=.h).new
 +	$(Q)sed -i -e "/#define __has_include_next __has_include_next/d" $(@F:.time=.h).new
diff --git a/meta/recipes-devtools/ruby/ruby_3.0.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
similarity index 78%
rename from meta/recipes-devtools/ruby/ruby_3.0.3.bb
rename to meta/recipes-devtools/ruby/ruby_3.1.0.bb
index 5cf0625101..7183c93d45 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
            file://0006-Make-gemspecs-reproducible.patch \
            "
 
-SRC_URI[sha256sum] = "3586861cb2df56970287f0fd83f274bd92058872d830d15570b36def7f1a92ac"
+SRC_URI[sha256sum] = "50a0504c6edcb4d61ce6b8cfdbddaa95707195fab0ecd7b5e92654b2a9412854"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
@@ -32,6 +32,7 @@ EXTRA_OECONF = "\
     --enable-shared \
     --enable-load-relative \
     --with-pkg-config=pkg-config \
+    --with-static-linked-ext \
 "
 
 EXTRA_OECONF:append:libc-musl = "\
@@ -67,6 +68,8 @@ do_install:append:class-target () {
     sed -i -e 's|${DEBUG_PREFIX_MAP}||g' \
         ${D}${libdir}/pkgconfig/*.pc
 
+    # logs that may contain host-specific paths
+    find ${D} -name gem_make.out -delete
 }
 
 do_install_ptest () {
@@ -78,9 +81,14 @@ do_install_ptest () {
     cp -r ${S}/lib/did_you_mean ${S}/lib/rdoc ${D}${PTEST_PATH}/lib
 
     # install test-binaries
-    find $(find ./.ext -path '*/-test-') -name '*.so' -print0 \
-        | tar --no-recursion --null -T - --no-same-owner --preserve-permissions -cf - \
-        | tar -C ${D}${libdir}/ruby/${SHRT_VER}.0/ --no-same-owner --preserve-permissions --strip-components=2 -xf -
+    # These .so files have sporadic reproducibility fails as seen here:
+    # https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220107-rm1diuww/packages/diff-html/
+    # As they are needed only in ruby-ptest, and that is currently altogether disabled, let's take them out.
+    # If someone wants to look at where the non-determinism comes from, one possible reason is use of
+    # -rdynamic -Wl,-export-dynamic
+    #find $(find ./.ext -path '*/-test-') -name '*.so' -print0 \
+    #    | tar --no-recursion --null -T - --no-same-owner --preserve-permissions -cf - \
+    #    | tar -C ${D}${libdir}/ruby/${SHRT_VER}.0/ --no-same-owner --preserve-permissions --strip-components=2 -xf -
     # adjust path to not assume build directory layout
     sed -e 's|File.expand_path(.*\.\./bin/erb[^)]*|File.expand_path("${bindir}/erb"|g' \
         -i ${D}${PTEST_PATH}/test/erb/test_erb_command.rb
-- 
2.20.1


