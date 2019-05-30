Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id C01577E429
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 16:42:12 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 92BD8A0189
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	message-id:date:date:subject:subject:from:from:received; s=
	mail20150812; t=1559234525; bh=bcKYcsiX6Y2Vl8K5vgpTpfMMgVF2zEOAw
	Qwl9Cgni6Q=; b=qFUiyEwNtuzf1u0bxocNrIDI209qIqBXZ5MXbvu4E9QdTfmCs
	GgcG1iW19ZjaufzxH6t3/ByeNu8NhoCa7cvDo0r6IIqakv5DTjnkvk1kDRtJwiGu
	eomVdNY+IxcHj1F/tlfNB+GiFM58CTCp2wMwnaZJwWnOnDkGOiSeLnXbmCTBBkqv
	dv3apKRWw1/7EvkbjU6qouRn8gUywj+gXgv2ly+sULCZR8g1dB4mnoes9uA/YfDc
	243oexq4oaMU8Xed0ZOI/QqPxh5p9RAUXU9cB2xDKubtZ6YtVXfZZs1PnHMzwDd9
	1Wil5Sa8YxQz8wD6JSzPvDHl5wfqa/8Gxh6jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559234533; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:references;
	bh=UbZqWeROrg9xA4MzkH+wjYMb4LjlCgd8RkrfW58FNjQ=;
	b=Q5/yJZuZDLLii4o7uIlgJKfw5yZLaHdubHX4TrEihjMLSU1/ybmAnfc46JBakHsoNEXtf/
	YpQCCmhAdOh5tVpAiNoTR2slotbCq8e8CxAgQqhGEYi8qZvRKjtcznzuerG0dvqFw6XQ8m
	iq61rKke7YhObj6HH0E8En2gULJROeBbQwKleXn8h00qTmSVBoMJIjuo1/RaNaAi0FfImq
	YdbyhoTVcBE5G7V8rc31LTs7VHdrQrs7n259HcV3RpHXagLEcgRgmZLE2Y3fvBL7lcbDlA
	xwIJ5gp5dWGbY9M92WYrPctrer98/syUVIHFyxV+JkbwV1/voI0ZMdlaZnTd5g==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by gerste.heinlein-support.de (gerste.heinlein-support.de
	[91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id u42NlKMcxLIW
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:05 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 18:41:40 +0200
Message-Id: <20190530164150.27038-1-crg7475@mailbox.org>
Subject: [PATCH v2 01/11] gstreamer1.0: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 16:42:13 -0000

From: Philippe Normand <philn@igalia.com>

* 0002-gstconfig.h.in-initial-RISC-V-support.patch
  Removed since this is included in 1.16.0

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...stconfig.h.in-initial-RISC-V-support.patch | 30 -------------------
 ...er1.0_1.14.4.bb => gstreamer1.0_1.16.0.bb} |  6 ++--
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.14.4.bb => gstreamer1.0_1.16.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch b/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch
deleted file mode 100644
index db742dea23..0000000000
--- a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 8a156d1725ecd03f2e8cdc8874e081dda2d3b43d Mon Sep 17 00:00:00 2001
-From: Aurelien Jarno <aurelien@aurel32.net>
-Date: Sun, 15 Apr 2018 00:49:55 +0200
-Subject: [PATCH] gstconfig.h.in: initial RISC-V support
-
-RISC-V supports unaligned accesses, but these might run extremely slowly
-depending on the implementation. Therefore set GST_HAVE_UNALIGNED_ACCESS
-to 0 on this architecture.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=795271
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Accepted [1.15.1 - https://bugzilla.gnome.org/show_bug.cgi?id=795271]
----
- gst/gstconfig.h.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
-index 6351c04da..33dfed1f6 100644
---- a/gst/gstconfig.h.in
-+++ b/gst/gstconfig.h.in
-@@ -104,7 +104,7 @@
-  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
-  * https://software.intel.com/en-us/node/583402
-  */
--#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) || defined(__xtensa__) || defined(__e2k__)
-+#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) || defined(__xtensa__) || defined(__e2k__) || defined(__riscv)
- #  define GST_HAVE_UNALIGNED_ACCESS 0
- #elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390__) || defined(__s390x__) || defined(__zarch__)
- #  define GST_HAVE_UNALIGNED_ACCESS 1
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
index 98c9a28e39..da2d14cd99 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
@@ -25,11 +25,10 @@ SRC_URI = " \
     file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
     file://add-a-target-to-compile-tests.patch \
-    file://0002-gstconfig.h.in-initial-RISC-V-support.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "f67fbbc42bd85a0701df119f52fb52bd"
-SRC_URI[sha256sum] = "f94f6696c5f05a3b3a9183e39c5f5c0b779f75a04c0efa497e7920afa985ffc7"
+SRC_URI[md5sum] = "862b7e4263d946bc2ef31b3c582e5587"
+SRC_URI[sha256sum] = "0e8e2f7118be437cba879353970cf83c2acced825ecb9275ba05d9186ef07c00"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    "
@@ -55,6 +54,7 @@ PACKAGES += "${PN}-bash-completion"
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
 FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
+FILES_${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
 RDEPENDS_${PN}-ptest += "make"
 
-- 
2.17.1


