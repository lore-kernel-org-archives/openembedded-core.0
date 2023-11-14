Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A48C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 21:53:44 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.5822.1699998819604133591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 13:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UO6zJ68B;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c18a3387f5so1728611a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 13:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699998819; x=1700603619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIyg75cS9cu5DrvfmMJsvUc1AZQfVKgn26wb/4vQVs0=;
        b=UO6zJ68BrwGQK1x4wP6e3tzjLUGJf3Ro396qxxxKGXkKZOPHht4mxAteK5THvMY2kE
         qMc3qcJZOGKY1Fc1lQh+aRA8AmvPkAK0KmDd6xxt34/KKze1nCL77QS1OoHUuIvsua0G
         ItU+i1IYSxZIZoxfBxUqs91LyELU5TDNvDcozBe3Qw8fUqcuifqBgPhJJo45Fx9yhSJM
         +igdKHjKXTUhBePfFIaKR4H8eua8duPEoBO6aTOS/rMa/+UgkJJszGli3XgDIr4Zju7I
         tI6CeG+LnoLS5pJWDdBgOx9sOOv7M5fxZAuzqpdv9EdrTQ66+FprbUKng1QbqeNIE7bt
         bF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699998819; x=1700603619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIyg75cS9cu5DrvfmMJsvUc1AZQfVKgn26wb/4vQVs0=;
        b=jEMNobO34XiR1c6/pmC+PXKvzZcLLKBB4Ooi1bsWtJJsBAy8XEkAzz6jo76a5D34Rb
         1KwhY5OU41uGT87q1R5JMmAmNsEai3ZSvtEu4zMobFyk09wFVjCxR6ovYFmmtcPl6B2Q
         PtoqDnWWd1Mydnt8JM3TuRdimOnIo30sJRw7fPGvNdoxyKBk8KC8IAm3ciW1JUSt8xNJ
         5C9hBUQRV3rsO6Do4y0n4UlxueznEiXaWc6bAq+ODPjEjzogEPC/SOjltkE0e7v+ksCv
         Qo1Rw7fJejP/oOyZ3DfOUJWSRKSGz6p/kf7typjPuCgPkICiFTwJ1cqxw2UXsckQbkVL
         pO7A==
X-Gm-Message-State: AOJu0YzN8F0NFkgy3kQrum6gMD0TzwwO4oLePwKyc98l6MRoTYWGb6hk
	DdH+SYmWv2WvAZPOesHXnZ6FIYX8ybFlzQ==
X-Google-Smtp-Source: AGHT+IFl4LJ9tKP+RWmovx/70rvPE/+8I0o2t51xPPVQrWCCXE9nHkJf/PWNsrrUrAekHlwDYciRFQ==
X-Received: by 2002:a17:903:244d:b0:1cc:2ef7:2abe with SMTP id l13-20020a170903244d00b001cc2ef72abemr3987339pls.48.1699998818651;
        Tue, 14 Nov 2023 13:53:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id o14-20020a170902d4ce00b001c0cb2aa2easm6091391plg.121.2023.11.14.13.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:53:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vte: Upgrade to 0.74.1
Date: Tue, 14 Nov 2023 13:53:29 -0800
Message-ID: <20231114215335.1308211-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 21:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190522

* Enable systemd knob for distros with systemd in them.
* Add dependency on gtk4 which is needed
* Package systemd unit files
* Add packageconfig for fribidi defaulted to disabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Add-W_EXITCODE-macro-for-non-glibc-systems.patch |  4 ++--
 .../vte/{vte_0.72.2.bb => vte_0.74.1.bb}               | 10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)
 rename meta/recipes-support/vte/{vte_0.72.2.bb => vte_0.74.1.bb} (80%)

diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
index b4100fc381e..daf07bfd3c9 100644
--- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
+++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
@@ -19,7 +19,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 --- a/src/missing.hh
 +++ b/src/missing.hh
-@@ -24,6 +24,10 @@
+@@ -43,6 +43,10 @@
  #define NSIG (8 * sizeof(sigset_t))
  #endif
  
@@ -27,7 +27,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
 +#endif
 +
- #ifndef HAVE_FDWALK
+ #if !HAVE_FDWALK
  int fdwalk(int (*cb)(void* data, int fd),
             void* data);
 --- a/src/widget.cc
diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-support/vte/vte_0.74.1.bb
similarity index 80%
rename from meta/recipes-support/vte/vte_0.72.2.bb
rename to meta/recipes-support/vte/vte_0.74.1.bb
index 44e71491f62..2f0448edb3c 100644
--- a/meta/recipes-support/vte/vte_0.72.2.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -11,16 +11,16 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
 "
 
-DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu"
+DEPENDS = "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2 libxml2-native gperf-native icu"
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
 
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "f7966fd185a6981f53964162b71cfef7e606495155d6f5827b72aa0dd6741c9e"
+SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -32,8 +32,9 @@ do_compile:prepend() {
 # Package additional files
 FILES:${PN}-dev += "${datadir}/vala/vapi/*"
 
-PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG ??= "gnutls ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
+PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
 # vala requires gir
@@ -42,6 +43,7 @@ PACKAGECONFIG:remove:class-native = "vala"
 CFLAGS += "-D_GNU_SOURCE"
 
 PACKAGES =+ "libvte ${PN}-prompt"
+FILES:${PN} += "${systemd_user_unitdir}"
 FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt = " \
     ${sysconfdir}/profile.d \
-- 
2.42.1


