Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15F4EB5978
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 07:36:35 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14167.1770794496587025013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 23:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jzqTBePp;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: careers.myinfo@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5fadd5d4319so1355972137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 23:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770794495; x=1771399295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Fo0644taKZShK/Sidd8QPaJNjBHik2K7QD7b2lAemg=;
        b=jzqTBePpd1n2HSLWPE6pkBIFbvcjVzK12naQDtmKnMKyVufByfiAA9YXu1Y0gxEtwt
         lwrYMxu6FkoQU6fb7TvbHh+6MV1tQxTjHrLtmg/t1NcpK3U7i6ZzbcHJeym9IQPxHfvX
         RB2eEMiU588SmvexUHsppSmyiEKGOkGTwZy2OAbjMJNBuwBLVtpReB7mYP3Z3RbrPAtI
         QYA/7JpO//9K6n/LRATTIthe78ujaeYS0lYbDQBeJ/ujMId45Ou4lZIWOf/0jveV3Bqx
         4FGvp8hEGX/GMonDQptCPQ9bCvqbaFMXzNNpFoUrUuusfsFYwKuE9fShMVquCTGZ1k0p
         fldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770794495; x=1771399295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Fo0644taKZShK/Sidd8QPaJNjBHik2K7QD7b2lAemg=;
        b=i6zhIS5jEpIg2cCnVZ1LXHAt7wuaN+8tXvl/WAbHtB/8vRltG5L9dhmEtvJJ3e1hSr
         zkpHZQ7ACAVsBW1BxA94q4aMmvrueAWcF/78F8PxrzsrYpDs7qNpQ3EnDcgiOjtAcSFP
         WZKhA6i00HUixgk3SCYHUFretL4j3YfVtnJ9Tx9+/7GKAAUtSq3a6cZjswrsOi/aUE+s
         0q/sEstWIN2roVFGRvmHcCPkycAOts5ZlHAw4QC/S11Lnf9VtLgoup07HyssRk3n410Y
         zAh+lUnsPW8kzveeI74TqcD4QeXpwytjzy1+HKMIQy7nfEiy+vuNPQASqrOMQcN0lueq
         opWg==
X-Gm-Message-State: AOJu0YzjUpDun7nJ18SIoqp/mTQflxcCMQXbmnYBI+dU7eNcYQqUTxCv
	zev7zKSsHO+wV7WPaKqxBRO4FZOsygNPflg6FQvmehvrHDwa/bxGZgGDM7IKzUnN
X-Gm-Gg: AZuq6aIrJebVxMZtpDs1S+uTPzOG/Uu4s7pRQgLNSPmBQ9NUtmf8CfxvlFQNbTJVwOV
	bzIpyhvq+gTGQ9EZTbzbEho2rDFuIKrE0K6Uo4IR41QXmrX1ueZcZ/XKO8L0OYu94gMUQiN65nR
	I+VZH7VXw89amTjh9/S2lH2twHPsqxXGyaCqRqn5Q3YHaYu/BUAy/sDy1VAFmscuCLSAQLjlNpq
	9aX0Tj1+zK1oWikAiUDV5cOgGrMQbyAZVR6AXg9++Qz9rcQFePXwOAi5tCYEXkpK67ZNp3O4gFE
	lNDckWegl9ES4MylIDPuciz/m3Gk2z8cZmF4kbO99LJKWsCio/gFarVxCY2af4OVfoXqKloxRDa
	KWBF9om/cjndHBGQxCOHOwydUItf1RPi4DHGleVHNY7QfdxZpSjL69X3TcBG3aeBZ5rSAyk5gT4
	fCUTnpTB6G5qK/nnMp7v2gaQWOFi6FKehOyfY=
X-Received: by 2002:a17:903:1b28:b0:295:99f0:6c66 with SMTP id d9443c01a7336-2a9516d5a18mr184743405ad.36.1770794116896;
        Tue, 10 Feb 2026 23:15:16 -0800 (PST)
Received: from L-15597L.kpit.com ([152.57.35.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29966d91sm12861085ad.45.2026.02.10.23.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 23:15:16 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][kirkstone][PATCH v2 2/2] libpcre2: fix RunGrepTest Failure on Busybox systems
Date: Wed, 11 Feb 2026 12:44:31 +0530
Message-Id: <20260211071431.76890-2-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211071431.76890-1-moins@kpit.com>
References: <20260211071431.76890-1-moins@kpit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 07:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230968

The PCRE2 RunGrepTest script uses the Gnu Coreutils form:
head -1

Busybox does not support this shorthand option and reports:
head: invalid option --'1'

which cause the grep tests fail when running ptest on yocto.
Replace head -1 with head -n 1 . This makes RunGrepTest work
correctly.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../libpcre2/0001-test-Fix-head-1-Busybox.patch | 17 ++++++++---------
 meta/recipes-support/libpcre/libpcre2_10.40.bb  |  1 +
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
index de37888854..d17ec6a731 100644
--- a/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
+++ b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
@@ -5,22 +5,22 @@ Subject: [PATCH] tests: Fix head options for BusyBox compatibility
 
 BusyBox does not accept the GNU coreutils shorthand forms:
   head -1
- 
+
 It requires:
   head -n 1
- 
+
 This causes RunGrepTest and the grepoutput test data to fail on
 Yocto-based systems that use BusyBox.
- 
-Replace all occurrences of `head -1` Ã¢â€ â€™ `head -n 1`
- 
+
+Replace all occurrences of `head -1` to `head -n 1`
+
 This aligns the scripts with POSIX syntax and fixes failing
 grep tests in RunGrepTest (including testtrygrep).
- 
+
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Shaik Moin <moins@kpit.com>
 ---
- 
+
 diff --git a/RunGrepTest b/RunGrepTest
 index 1c7bbd2..ab4f310 100755
 --- a/RunGrepTest
@@ -34,5 +34,4 @@ index 1c7bbd2..ab4f310 100755
  echo "RC=$?" >>testtrygrep
 
  echo "---------------------------- Test 133 -----------------------------" >>testtrygrep
--- 
-2.34.1
+--
diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index cd9ae7563c..1d10c2e9b8 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
     file://CVE-2022-41409.patch \
     file://run-ptest \
+    file://0001-test-Fix-head-1-Busybox.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
-- 
2.34.1


