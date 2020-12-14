Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.35819.1607956693651918313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dd79kNBg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id b5so5162468pjk.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=328CoZx5Id+x2e6+jykOs0QN0BuBQDd7Go3BOIgD7HM=;
        b=dd79kNBgs+1wX0QLFaYoMC+7aZjPVL8QS3+cwDy6T1ArRWAXPzxy9gJXHkT70GMBOV
         VG3mNdPtbf1uo3ctJX+yh7zpwCkz8AHUXAbrbtEnoH6Mrpzx/6iI8tprifXbTkV7QGiU
         x0jFRxefm0+TrM4uSrmp0stmsUzFcHBvEyR0MsLX72UAZxORME0gZZdGkZ64DXnfioUy
         R3ODGLY0Z0EnMVtlcJKvSeQmMMKijCvRTRC/qeivujuhq37tzeE8+Sz7YgLivAIbWuMN
         jvUwxLNRPNLESyUia/Zs/5P2rrM1WCICq4fazkjkBcl4Pi0uSTlbH23rlTkMYd4LhfXx
         krJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=328CoZx5Id+x2e6+jykOs0QN0BuBQDd7Go3BOIgD7HM=;
        b=n0+Xp65rbZtTjBW1KD+3rJ5lUqMNv8h1UXCt8tLTevwjdFCe5N0FX1uU6g0hp0hvqs
         0daLUqeoJlPcQ2n7JSyNt8rkMAiCykz+eg+KfBtUwUbwpm962vUwSdoKWmJJlgqBYBN2
         xTqSYLaeFdtacRiwWIyDtqqTAkiDYn5vBxmTSnxU27o2JKvFNVZU5YhHqxwRoYFnySB8
         3pp69ClZ2sFWmpvygZcpN5h6C3ifSmKMox3sL15mUR2Gl9l+4w3DvpPJ9wFWgeeZEKxg
         wvy3FM36vXd8UbLAv1wfrnON/5ssGko5+AUcIY4wP+WoMaD0nJl33BEZxZ8CizEdilyW
         vUeQ==
X-Gm-Message-State: AOAM530rYtqvCTDmZY5OsDNIwUW2Bh9rXa06bp7HHy61w9YOW5kmS7ph
	1iUX1nOXMJ3XzrKIFgDD3tvycyFOK/f6yA9N
X-Google-Smtp-Source: ABdhPJxyBQdAJ/Czet/nMiUdLcZh/4vHTadWDZsdCeEVyJiGVSnjq30JWJk5lz6QvRTX2tjBBdfQ2g==
X-Received: by 2002:a17:902:b209:b029:d8:e821:d61a with SMTP id t9-20020a170902b209b02900d8e821d61amr17068825plr.58.1607956692679;
        Mon, 14 Dec 2020 06:38:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.38.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:38:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/25] glib-networking/btrfs-tools/dosfstools/parted/bmap-tools/libsoup-2.4: add nativesdk support
Date: Mon, 14 Dec 2020 04:36:51 -1000
Message-Id: <caf6dac96888d983ead4e75896b78f96777c40d6.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Hongxu Jia <hongxu.jia@windriver.com>

In order to make wic tool work in sdk which is out of an
existed Yocto build, it needs to port wic tool as a nativesdk
recipe.

First, make these runtime depends recipes to support nativesdk

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb4f7f078e1d3b1afbf93ca4dc5e690f60c59412)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.62.4.bb | 2 +-
 meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb      | 2 +-
 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb          | 2 +-
 meta/recipes-extended/parted/parted_3.3.bb                  | 2 +-
 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb           | 2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.62.4.bb b/meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
index b74532087c..c476a7cba5 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
@@ -31,4 +31,4 @@ FILES_${PN} += "\
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
index cdc971cf5d..4112cf484f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
@@ -49,4 +49,4 @@ do_install_append() {
     fi
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index e4ab113391..4bd4aef099 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # Add codepage437 to avoid error from `dosfsck -l`
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-extended/parted/parted_3.3.bb
index 1cfd9ec264..aa4d8042cf 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF = "--disable-device-mapper"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 do_compile_ptest() {
 	oe_runmake -C tests print-align print-max dup-clobber duplicate fs-resize print-flags
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 7c4db85b32..986f0124e2 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -22,4 +22,4 @@ RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptoo
 inherit python3native
 inherit setuptools3
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
index 6731b3373e..f984a06aba 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
@@ -40,4 +40,4 @@ DEBIAN_NOAUTONAME_${PN} = "1"
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

