Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57BBC7EE2A
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.70167.1684081919592572721
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xypBTM9c;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-643a6f993a7so7331815b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081918; x=1686673918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DItNwap013RgRF80OFjEIfgnubjR40kTiorfcIhia94=;
        b=xypBTM9cpgEn8hfr/5Cq2wpD42pi6xjxGCtuM6wyj3OvWuOM8G3Z4ffQH0Is0Y/yLk
         3mFo7wWTTPvrpD6dgHBj/OOrzL9CGVgdQAy8bZjm4/uaEuosjbXZoicTwdL5IYobaFvb
         EH5LQpNbagY6zT0XEWe8zAQhsfH2Q2dwejGik7fL5W5LTnW2h8EKHcUwkhsvW+w6fUsA
         hsEmY1pKep2szZSGJTfPLEL/VOL6x9DJnfA+W03HflaKMWUdLZ2GzlIk/9DjGtcHKEmw
         eWhALD5vT/GR5DaaREJR8x9Y/hJHFfWM2dW6xRpTy3rrswFq9Qrb5mpw5XmI20I4x2e8
         RIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081918; x=1686673918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DItNwap013RgRF80OFjEIfgnubjR40kTiorfcIhia94=;
        b=COonCVs0AZHfQ03z3k4qKeByTWfwM6eqEeltnMvbOJslvfeEahtCwsZBtw11H39BWU
         9O4vcED395Hur/HLjOA/HmT7l1LkSFIt5PTPwo+gRGggo0BeDK6yaFNZ+EQYAHtRY852
         R5NsCMDSAn3MJGdyedcBA2NRlN6lHeM2QWvHAKsR8dA+5Moi4QK1zyz9NZtZJV66Lomj
         7PVBPzNbyK4emhskGgjijSYvdYiiWxCGrEletwLbuzF9Rlrfo+Okefdv6gmfnjX5R51P
         Iut2f8NqW3CtO/PSWWv5BNJ2yHBUX+tqSBLDzRZ/3/Bx1/hB01PxMYR3Osy+NDQwL0mr
         +uDA==
X-Gm-Message-State: AC+VfDwZP17YQVOSjIN+2sKCojN7XPKCha+DrfbiHpFIrFKwczkDl5ZS
	DkjsFjW8jjHm+rg98N2PsFblxrbS4xLXquU3gcM=
X-Google-Smtp-Source: ACHHUZ7e9ui8YWgSYbs3aox3RYS7PfIU2CJ8Ddr5BoXbdUR2Q9NWGoo+Mf1rJyimpbqKJfKsy+Vn8A==
X-Received: by 2002:a05:6a00:21d0:b0:643:bb16:7ca6 with SMTP id t16-20020a056a0021d000b00643bb167ca6mr40149651pfj.21.1684081918519;
        Sun, 14 May 2023 09:31:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/15] gawk: Remove redundant patch
Date: Sun, 14 May 2023 06:31:32 -1000
Message-Id: <cf654eb0fe786ec5cfbc62da43e71f6ef2e521dc.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181208

From: Khem Raj <raj.khem@gmail.com>

This patch is doing the same things thats already being done in the
do_install_ptest where the problematic tests are being deleted from
final package. run-ptest script runs a find for available tests and runs
each test target found during run therefore its enough to remove
them from final install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 4a32ad54d6c051fe387c67721cf96eb851ecd835)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gawk/gawk/remove-sensitive-tests.patch    | 43 -------------------
 meta/recipes-extended/gawk/gawk_5.2.1.bb      |  1 -
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch

diff --git a/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch b/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
deleted file mode 100644
index ffae55058b..0000000000
--- a/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 354d24baf7c51977d22ff61ad42e6a2cbd4dc8ac Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 21 Dec 2021 17:09:12 +0000
-Subject: [PATCH] gawk: remove load-sensitive tests
-
-These tests require an unloaded host as otherwise timing sensitive tests can fail
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- test/Maketests | 10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/test/Maketests b/test/Maketests
-index 3a667af..f117697 100644
---- a/test/Maketests
-+++ b/test/Maketests
-@@ -2137,11 +2137,6 @@ symtab12:
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
- 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
- 
--timeout:
--	@echo $@ $(ZOS_FAIL)
--	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
--	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
--
- typedregex1:
- 	@echo $@
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
-@@ -2371,11 +2366,6 @@ rwarray:
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
- 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
- 
--time:
--	@echo $@
--	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
--	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
--
- mpfrbigint:
- 	@echo $@
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  -M >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index bbb26231a1..c914326563 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -16,7 +16,6 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
-           file://remove-sensitive-tests.patch \
            file://run-ptest \
            "
 
-- 
2.34.1


