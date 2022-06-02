Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E052EC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.1505.1654188762827917563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cKn81Hid;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id p8so5223030pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aF9SQgilysgMTZY631PXyJUdfyKhtVEumUlRgkbZp4c=;
        b=cKn81HidA33sd8Og1UXKL27391qeOvcJMgHTyNJQhS4c6vNhVKxCTgUr/lcRoIwFZT
         vRsL02EMbebhUQJj2BDzQ3Rx8yxayBlCjX1E2NnhcZnrYO9cGH48oAv9+RbY4LtR+5To
         amMU0R75udy9kD8/+fLR815lNTU6OtdJBCYrEVLsl6OQwk1cQ7HELJ02z4qmVp7dqKep
         zyKy96KNjDp1DX15ow4x5RPEgXPILKcwEV5G5D8GUyXZYTLKMSIVWzR5Z6rcpw/NNI6D
         h4z2PEcBRwC1LHgIsenXPZZRKiLgdCJNP4YWxN2SH1R2obs2lZo3RYhxwaiyz7IUfSHa
         Pv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aF9SQgilysgMTZY631PXyJUdfyKhtVEumUlRgkbZp4c=;
        b=BRnjBMxfuvwuUsFDL82/uvOEx3UxrxmqFaBbwTkX6mh6brnvUkvOyEuHGWxuYLuSzm
         +Sq++LBgpAhN4fHeNTcZgQvEwmc/Se/l/0vgH9PQ9x6vM4m0paga1t1d4yG5RpFA7EpE
         l2M1wV6NX+p8uXke7+0qvE4JFBd0tSLNaAVHZ9sKIe0AMueOAatigXOYUFQ2WUC/vDB5
         E+8xJ1+SihZGrq55ryLU01dxET5+067g5kgaBKohT83R7iimBxBsPl/TNHJFctRvTV76
         Ae9gWjO1NUe2nLoSA0VwifR0YLrH3Dm92x6sOO/QJjh0Ti4caeKqSgABjq8GXebXt6DK
         SJsw==
X-Gm-Message-State: AOAM533o83CcWroE8bxRivsnrP7DYprLiPCoZuQ99mvBYXC2ko8vz9UF
	iqiJx+n+Bwg6GW+/v1HLAFgML8nGpE4zVIU9
X-Google-Smtp-Source: 
 ABdhPJx9u8E5QpRSAbjI+xDRZm20lB44Zki3sSnLSCTj9hZQeeBhpp2Jfs9BIINrjJ9CPVqWrO6Sxg==
X-Received: by 2002:a63:4f15:0:b0:3fb:fa13:9209 with SMTP id
 d21-20020a634f15000000b003fbfa139209mr5019842pgb.290.1654188761562;
        Thu, 02 Jun 2022 09:52:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/26] libpcre2: upgrade 10.39 -> 10.40
Date: Thu,  2 Jun 2022 06:51:45 -1000
Message-Id: 
 <9cf49b4f07afcf48a5e6d1ed12d0959d5d040e00.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166490

From: Davide Gardenal <davidegarde2000@gmail.com>

Security fixes and update to Unicode property handling.

Upstream release notes:
https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.40

CVE: CVE-2022-1587

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcre/libpcre2/CVE-2022-1586.patch      | 58 -------------------
 .../{libpcre2_10.39.bb => libpcre2_10.40.bb}  |  5 +-
 2 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
 rename meta/recipes-support/libpcre/{libpcre2_10.39.bb => libpcre2_10.40.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
deleted file mode 100644
index 10d88d7b73..0000000000
--- a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From e881ed5028622959cf8859c053501fb1b16387f1 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Mon, 23 May 2022 13:52:39 +0530
-Subject: [PATCH] CVE-2022-1586
-
-Upstream-Status: Backport from https://github.com/PCRE2Project/pcre2/commit/50a51cb7e67268e6ad417eb07c9de9bfea5cc55a
-
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- ChangeLog               | 3 +++
- src/pcre2_jit_compile.c | 2 +-
- src/pcre2_jit_test.c    | 3 +++
- 3 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index d27542d..cd3da65 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -63,6 +63,9 @@ Version 10.39 29-October-2021
- 
-   Reformat slightly to make it C89 compatible again.
- 
-+23. Fixed a unicode properrty matching issue in JIT. The character was not
-+fully read in caseless matching.
-+
- 
- Version 10.38 01-October-2021
- -----------------------------
-diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
-index db2ce65..5baca9b 100644
---- a/src/pcre2_jit_compile.c
-+++ b/src/pcre2_jit_compile.c
-@@ -7473,7 +7473,7 @@ while (*cc != XCL_END)
-     {
-     SLJIT_ASSERT(*cc == XCL_PROP || *cc == XCL_NOTPROP);
-     cc++;
--    if (*cc == PT_CLIST)
-+    if (*cc == PT_CLIST && *cc == XCL_PROP)
-       {
-       other_cases = PRIV(ucd_caseless_sets) + cc[1];
-       while (*other_cases != NOTACHAR)
-diff --git a/src/pcre2_jit_test.c b/src/pcre2_jit_test.c
-index 8dee16e..7bb307e 100644
---- a/src/pcre2_jit_test.c
-+++ b/src/pcre2_jit_test.c
-@@ -412,6 +412,9 @@ static struct regression_test_case regression_test_cases[] = {
- 	{ MUP, A, 0, 0 | F_PROPERTY, "[\\P{L&}]{2}[^\xc2\x85-\xc2\x89\\p{Ll}\\p{Lu}]{2}", "\xc3\xa9\xe6\x92\xad.a\xe6\x92\xad|\xc2\x8a#" },
- 	{ PCRE2_UCP, 0, 0, 0 | F_PROPERTY, "[a-b\\s]{2,5}[^a]", "AB  baaa" },
- 	{ MUP, 0, 0, 0 | F_NOMATCH, "[^\\p{Hangul}\\p{Z}]", " " },
-+	{ MUP, 0, 0, 0, "[\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
-+	{ MUP, 0, 0, 0, "[\\x{a92e}\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
-+	{ CMUP, 0, 0, 0, "[^S]\\B", "\xe2\x80\x8a" },
- 
- 	/* Possible empty brackets. */
- 	{ MU, A, 0, 0, "(?:|ab||bc|a)+d", "abcxabcabd" },
--- 
-2.35.3
-
diff --git a/meta/recipes-support/libpcre/libpcre2_10.39.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre2_10.39.bb
rename to meta/recipes-support/libpcre/libpcre2_10.40.bb
index 36c51d700a..3843d43b69 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.39.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -8,14 +8,13 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=43cfa999260dd853cd6cb174dc396f3d"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
-           file://CVE-2022-1586.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
-SRC_URI[sha256sum] = "0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440"
+SRC_URI[sha256sum] = "14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.25.1


