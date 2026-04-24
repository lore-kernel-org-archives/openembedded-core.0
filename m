Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C18FC037D
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:50 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32571.1777064201860621300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wDNFLFv6;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4890098abbaso62799885e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064200; x=1777669000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CN2hsHy1f9+r7BGavsbvI+gLY4+bduZll/6OF9nREFk=;
        b=wDNFLFv6y3djDRg/uq2TYst17Tan7KVSvChnf3Rm2DHM5btPpLQPohz6Qx57FsFNTt
         wQN3BchAzG8upgfDLRFWlFmTpj9lar7q3ctIJZe640pwklE8Wup1Af4FQuPKIKtDn6CM
         VtOjG2DX0tESW3pjCIgrDO+idOLxPYAX/qzo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064200; x=1777669000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CN2hsHy1f9+r7BGavsbvI+gLY4+bduZll/6OF9nREFk=;
        b=XYBrpVwKCs57rp5S76s3Ata8Mk92k6EK0dJosv17CAxRspFnvAtSz7rUQz9+g581q7
         UJsvpF6j7WwKwjw4Ilf6JOhcb6K1f6j3rDRNHJTEuuFB+KNcfI6IGpcR7waxkN+fF6vH
         T69wM2TM7lnWpa+0y9YLUt999oC+1NVZHq39TkDL5GOGMk1V+5+aTXUvdmI+L24VSqos
         U6oJCR1MKtjSW6FPOvlXPu2m5OTdCXOojS1n9IEHs0bXRySAl7f8wkszWJ3QH4oIAAci
         PXQ2Ya7q3AsWAGP/ycw717VfvPWCRwxwjDPaJjXqSMTDHkVDdyKxqeXiMm/8oGOuG8oR
         +b8Q==
X-Gm-Message-State: AOJu0YyEtTH4kKch8R9yyvwEVpUm8+o5L4Zv3BuWb2c5WePzvD83a0UZ
	bQ/DMdATn31QedJY2JLxQOS0I1wj/6Cd8QfZ8+ZHlhP9FuMr1lCAYF3ouOeV/lZJTULl+3cPSpK
	dMHDKwTLV4Kfy
X-Gm-Gg: AeBDievc2kx/tNjqmoQQgxyf8bEzrK83BsXEi2gDy0gn/WmpLHN5g2wsrmpb5BXw0SJ
	t1cAXSURKgCi4vp5jr7e45GG8cliELl1QoVy6v305Fa7l7Ocf0UDpH8BIdPkN2y98KphtDNNOOr
	WImUpDxYHPRNuZxcsa2qrE8/gp3cRkM47EMq28Srn7CXADGgoFDTH8qzF8+KJdhwUJMOYi3zQcu
	Cv6EeeG20L7QzVmZYsZn83xWHYrPk1Yd2JT2ISM759/oXSqAh5S/STvo6T3sMWPBskIXhztV0uE
	3H8Nwihew61Uq/vTX7uyIpt0lsSKG9CaVMtczFu8UWPuEHZGyGeV0WzW8XMuGOAtmwV4taLfOEK
	9UwviHH/WRu0tAOiyMUXrj/Zv2+N7QeRn5qelNTCwBZC9Zp2z/MtPe6xkmRps5bdzhr6t7T+1Aa
	yfUsBxGpmBSiq9IidJUebWw9c8skqgfl3HdDbi21Q96RrHMfdk/rIINT4SKZxHl5O2aPPq6P36q
	rgTxc3CPBLk5ErxPyhOKUe4POnK1JbacPhkRA==
X-Received: by 2002:a05:600c:c10e:b0:488:8185:e672 with SMTP id 5b1f17b1804b1-488fb792e84mr380611065e9.30.1777064199600;
        Fri, 24 Apr 2026 13:56:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/66] libarchive: Fix CVE-2026-4111
Date: Fri, 24 Apr 2026 22:55:02 +0200
Message-ID: <c938ecea4304a57edb824f121e0ca8f79b45bb7e.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235876

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-4111
[2] https://github.com/libarchive/libarchive/pull/2877
[3] https://access.redhat.com/errata/RHSA-2026:5063

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 ++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   2 +
 3 files changed, 342 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
new file mode 100644
index 00000000000..f908b60775d
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
+index 1dd0d88..736c95a 100644
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -2965,7 +2965,9 @@ static int parse_filter(struct archive_read* ar, const uint8_t* p) {
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
+2.43.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
new file mode 100644
index 00000000000..18037ed61ac
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
+index 7627ec5..e37312e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -521,6 +521,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_read_format_rar_invalid1.c \
+ 	libarchive/test/test_read_format_rar_overflow.c \
+ 	libarchive/test/test_read_format_rar5.c \
++	libarchive/test/test_read_format_rar5_loop_bug.c \
+ 	libarchive/test/test_read_format_raw.c \
+ 	libarchive/test/test_read_format_tar.c \
+ 	libarchive/test/test_read_format_tar_concatenated.c \
+@@ -918,6 +919,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar5_invalid_dict_reference.rar.uu \
+ 	libarchive/test/test_read_format_rar5_leftshift1.rar.uu \
+ 	libarchive/test/test_read_format_rar5_leftshift2.rar.uu \
++	libarchive/test/test_read_format_rar5_loop_bug.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part01.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part02.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part03.rar.uu \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 59c5f5d..d7ec64e 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -165,6 +165,7 @@ IF(ENABLE_TEST)
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
+2.43.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index b62c3d69b95..bc0d3ba0743 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -44,6 +44,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
            file://CVE-2025-60753-01.patch \
            file://CVE-2025-60753-02.patch \
+           file://CVE-2026-4111-1.patch \
+           file://CVE-2026-4111-2.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

