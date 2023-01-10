Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87BAC54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 06:49:23 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.98158.1673333357426326959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 22:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KKbxDUN+;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id l1-20020a17090a384100b00226f05b9595so10340931pjf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 22:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4fXduaqi5w1xNM96Gij4ruKlsn+Y5giOAJCknrgNWE=;
        b=KKbxDUN+H1izq8d9BdAokwfs1T0qpQQCJppSZpzGoHaT0n7hxNTN23sP0trVjFImKn
         LCV3H5b2214k7E/HqEIg7YuxVm8qhKLBdPbvk5ylqy3lMzDJHoi9f1frDGRQkjuf48wC
         42rhqWKSnlbKgJ2n6XJPoiT/b93Yiz+X0I/U7b/xYzqgcwlcTR2+h0s9e43bL5JjJEjY
         E6U2iN+Fh/gVasry/GMUEQtyDCUTFm4UQtmUjDEzOPP/FJmdOw6kyYXU8H76GZYs9DL2
         f/+2r5af2SF3YsPE9tXATjnhdiKgQ21I4wPbuh0Ywcx+wGcZiCWv7hu3MWAYwEvA970Y
         S86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4fXduaqi5w1xNM96Gij4ruKlsn+Y5giOAJCknrgNWE=;
        b=dkSyqLpVszqRI7eLcw08gqT80qQ4SB/kS4f2qtmQS72LQ9XnjqteQm38MnSBnKP6Of
         4+D6C002hW417zqvdaLEDy2SbjpeSKy4SbRLblRkVJKAkzh7PSTXqfDksSOwIP72ObQn
         VRrNsNUw7l/GXmR8Yp1kNc9ozvexkmFopBirt8hhxAJbejBznxwbr3GO9ROEZGespJ21
         06ylVWGqZlwLkIRaU3FMd4Pq3vih/tvEQXJJ2vLk/XyBZ9kDRybi04miyHMCXpk6wf0v
         AowgPaSlf9luYQDWb1MJnS1cyWfin96zssfHnqP6KFp50AXGyEn5FQJLGWPJPgeuzruE
         4WpA==
X-Gm-Message-State: AFqh2kqBSPO9SXHuMtKsmOnCwZI0qbjgi0XjmjRhldnKt2DctWlnbzGs
	ll1h5vXQUt/hFLpTuPGQMjd9UNaaeBA=
X-Google-Smtp-Source: AMrXdXuIiomuWJ67RJnAw+WBpx7Xa06BG+qQpFQmiwXOpyyWzTCyeaT5dWTlHVkKv8wANoqR/G1TGw==
X-Received: by 2002:a17:902:850c:b0:192:bbe9:4cab with SMTP id bj12-20020a170902850c00b00192bbe94cabmr31555687plb.24.1673333356597;
        Mon, 09 Jan 2023 22:49:16 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902654400b0018bde2250fcsm5866791pln.203.2023.01.09.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 22:49:16 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com,
	Umesh.Kallapa@windriver.com,
	Naveen.Gowda@windriver.com,
	Sundeep.Kokkonda@windriver.com,
	Shivaprasad.Moodalappa@windriver.com,
	Yash.Shinde@windriver.com
Subject: [kirkstone] glibc: stable 2.35 branch updates.
Date: Tue, 10 Jan 2023 12:18:13 +0530
Message-Id: <20230110064813.239677-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 06:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175705

Below commits on glibc-2.35 stable branch are updated.

293211b6fd time: Use 64 bit time on tzfile
26c8278889 nscd: Use 64 bit time_t on libc nscd routines (BZ# 29402)
f75f61b659 nis: Build libnsl with 64 bit time_t
ca97201c24 Apply asm redirections in syslog.h before first use [BZ #27087]
cad7947db7 elf: Fix wrong fscanf usage on tst-pldd
e9eb987894 Allow for unpriviledged nested containers
2636fbb7ef elf: Fix wrong fscanf usage on tst-pldd
e7019eeeb5 x86: Fix wcsnlen-avx2 page cross length comparison [BZ #29591]
fb73a40981 elf: Fix rtld-audit trampoline for aarch64

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 7d7db46c2f..d36da0ce3f 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "8d125a1f9145ad90c94e438858d6b5b7578686f2"
+SRCREV_glibc ?= "293211b6fddf60fc407d21fcba0326dd2148f76b"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


