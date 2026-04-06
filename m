Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217B9FF4936
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49554.1775456858120644051
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UOpLqWhU;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488971db0fdso25248165e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456856; x=1776061656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugHqcjdN6zoBas+QQwnv65Xz4W7IIwZMWDc6pFdOi90=;
        b=UOpLqWhU9PFfR2NWp5YqXL/eN3IxzYFxDV3bZKeJYxSzK/BAXfmRZXYW9vRb0F4I8V
         cMjBrY2ydQZ3dkT3jkeT6a/j6nTDj0lHvMKYjkPaBrvxQf92iyNC3ubwOaeb2pus6xE3
         dPAlwe4Rv+kUnDC5+bPb3hoK9+GB5DOodAl7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456856; x=1776061656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ugHqcjdN6zoBas+QQwnv65Xz4W7IIwZMWDc6pFdOi90=;
        b=iv5noPLs98DEnLMCdz3he4JjlYMlV7AJ9ZsJTiQo/K3gTt4eYMoDuGIbpK1SR/xgSn
         6qvhfKMdrihQl+ktDCRFELLGViQMT1FHo+ldpBPDgyzLYfHw0TFX46i7MAVgzKCYCOxI
         FNxaWT2HdCTZ9ZU3zycHUBy1lLvT+ybAd3X5RV07S0Tkb/JEgCQ7axpERWQKU/hrqFA1
         AK7nFcyYlBUZjuKUe86qWDlGNR4ZTRJf6tBvUw9tn/l479mxhAOySTdd9cjEW6gKq0wQ
         wuIX1thF8EkCHJaxhNUU2S4duNjAZYoYyznZ5+8eX8rFuDpC3pCAvGTAt9rjqeFz82+Q
         bIow==
X-Gm-Message-State: AOJu0YxT78It/FtjE5/MMxMEPt9PfK46xobjltfKDow8IRdRUwlBCT6F
	DXQ11dqbJxhcA7i6HOis9sQmzbimKflnqaJUpu62QGDGig0uQmOGW9qerNBSq6KO6PjxzEiCBHV
	59mb3YqE=
X-Gm-Gg: AeBDieuzyWDGDlC0hfEio7TLQZQ66oTi8Pucwqmp0jFzHb2W63OyDePvCxqA2L0uWnq
	VyX3a3twqX/AiVD1BvOEO9uZCO+eO1HBqB3MPf151qv+8QZvnBZ3U8Texk4KwP1zpfad2nsepFA
	LuYs/TzDhM+iqSElGQpUtl+ef8GmCq+EylD12JPraT6Ih3tMBPZ6WqjRrSSJROQ28RZmh7ceqs4
	PdJZ08JTSfiCOjEuT3gXvTAXtsTWTRbKpoNWOBsq599eGnpB7P/B/94y4bhCC6hJ/5VfqWHrWgE
	a+ndT/4uyG+2pWlWi7GSKLTfbT9b4EyezsGZCF0L6sXsIK2nnBEiXwAS+tLIMvoCc1gpliaitSz
	O+Ks6G0X68/fUZ8sE4X9K3601b3JxfeDL0qKMnO5WMcPXK3pP80IYcYF8qqFRH3J4ufCgUr5Gu8
	7H0ritbzme7IbZlZWm+gvCshgM7a4Hs6p5Tbo7enYb0y1B+0rNBTVcl6r/FKJG5Hnf1H4yJOiYB
	eOtybFe8WqqJM4Sa7BI5KZ+hN4=
X-Received: by 2002:a05:600c:8b34:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-488997d530fmr170622705e9.22.1775456855677;
        Sun, 05 Apr 2026 23:27:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/18] libarchive: Fix CVE-2026-4111
Date: Mon,  6 Apr 2026 08:26:40 +0200
Message-ID: <936b97d2655394865d134620f95e4de389cd8f95.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234657

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-4111
[2] https://github.com/libarchive/libarchive/pull/2877
[3] https://access.redhat.com/errata/RHSA-2026:5080

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 3 files changed, 342 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
new file mode 100644
index 00000000000..1f065b13648
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
@@ -0,0 +1,32 @@
+From 7273d04803a1e5a482f26d8d0fbaf2b204a72168 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sun, 1 Mar 2026 20:24:56 -0800
+Subject: [PATCH] Reject filters when the block length is nonsensical
+
+Credit: Grzegorz Antoniak @antekone
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/7273d04803a1e5a482f26d8d0fbaf2b204a72168]
+CVE: CVE-2026-4111
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libarchive/archive_read_support_format_rar5.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchive/archive_read_support_format_rar5.c
+index 38979cb..867f0a8 100644
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -2914,7 +2914,9 @@ static int parse_filter(struct archive_read* ar, const uint8_t* p) {
+ 	if(block_length < 4 ||
+ 	    block_length > 0x400000 ||
+ 	    filter_type > FILTER_ARM ||
+-	    !is_valid_filter_block_start(rar, block_start))
++	    !is_valid_filter_block_start(rar, block_start) ||
++	    (rar->cstate.window_size > 0 &&
++	     (ssize_t)block_length > rar->cstate.window_size >> 1))
+ 	{
+ 		archive_set_error(&ar->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+ 		    "Invalid filter encountered");
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
new file mode 100644
index 00000000000..243a03a8e5d
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
@@ -0,0 +1,308 @@
+From ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sun, 1 Mar 2026 10:04:01 -0800
+Subject: [PATCH] Infinite loop in Rar5 decompression
+
+Found by: Elhanan Haenel
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4]
+CVE: CVE-2026-4111
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Makefile.am                                   |   2 +
+ libarchive/test/CMakeLists.txt                |   1 +
+ .../test/test_read_format_rar5_loop_bug.c     |  53 +++++
+ .../test_read_format_rar5_loop_bug.rar.uu     | 189 ++++++++++++++++++
+ 4 files changed, 245 insertions(+)
+ create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.c
+ create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.rar.uu
+
+diff --git a/Makefile.am b/Makefile.am
+index dd1620d..14edb2a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -507,6 +507,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_read_format_rar_invalid1.c \
+ 	libarchive/test/test_read_format_rar_overflow.c \
+ 	libarchive/test/test_read_format_rar5.c \
++	libarchive/test/test_read_format_rar5_loop_bug.c \
+ 	libarchive/test/test_read_format_raw.c \
+ 	libarchive/test/test_read_format_tar.c \
+ 	libarchive/test/test_read_format_tar_concatenated.c \
+@@ -869,6 +870,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar5_invalid_dict_reference.rar.uu \
+ 	libarchive/test/test_read_format_rar5_leftshift1.rar.uu \
+ 	libarchive/test/test_read_format_rar5_leftshift2.rar.uu \
++	libarchive/test/test_read_format_rar5_loop_bug.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part01.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part02.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part03.rar.uu \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 05c6fd7..c8f2e90 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -156,6 +156,7 @@ IF(ENABLE_TEST)
+     test_read_format_rar_filter.c
+     test_read_format_rar_overflow.c
+     test_read_format_rar5.c
++    test_read_format_rar5_loop_bug.c
+     test_read_format_raw.c
+     test_read_format_tar.c
+     test_read_format_tar_concatenated.c
+diff --git a/libarchive/test/test_read_format_rar5_loop_bug.c b/libarchive/test/test_read_format_rar5_loop_bug.c
+new file mode 100644
+index 0000000..77dd78c
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar5_loop_bug.c
+@@ -0,0 +1,53 @@
++/*-
++ * Copyright (c) 2026 Tim Kientzle
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++#include "test.h"
++
++DEFINE_TEST(test_read_format_rar5_loop_bug)
++{
++  const char *reffile = "test_read_format_rar5_loop_bug.rar";
++  struct archive_entry *ae;
++  struct archive *a;
++  const void *buf;
++  size_t size;
++  la_int64_t offset;
++
++  extract_reference_file(reffile);
++  assert((a = archive_read_new()) != NULL);
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, reffile, 10240));
++
++  // This has just one entry
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_next_header(a, &ae));
++
++  // Read blocks until the end of the entry
++  while (ARCHIVE_OK == archive_read_data_block(a, &buf, &size, &offset)) {
++  }
++
++  assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
++
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
++  assertEqualInt(ARCHIVE_OK, archive_free(a));
++}
+diff --git a/libarchive/test/test_read_format_rar5_loop_bug.rar.uu b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
+new file mode 100644
+index 0000000..3e47004
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
+@@ -0,0 +1,189 @@
++begin 644 test_read_format_rar5_loop_bug.rar
++M4F%R(1H'`0#%&C,R`P$``)T-9%L.`@+P0`"`@`P`@`,``6'(WFP@`?\7_U/^
++M8@!.`B`H````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++5```````````````````Y^;*!`@4`
++`
++end
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index e74326b40fd..85fe6e5baa2 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -50,6 +50,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
            file://CVE-2025-60753-01.patch \
            file://CVE-2025-60753-02.patch \
+           file://CVE-2026-4111-1.patch \
+           file://CVE-2026-4111-2.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

