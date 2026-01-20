Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF79D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 07:47:02 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1802.1768895167219647970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 23:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IBaBADvZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: careers.myinfo@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56376c3e866so3873460e0c.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 23:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768895166; x=1769499966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrrMTtb60SP0xBTCvJL8nJfkI/A1zaXtpG+M96zSEDk=;
        b=IBaBADvZ8//uGn6LHNFchI+shekRS9FhEoqio2yvbtjIVPzLXr4clrTVOv4nyWtI4d
         sZ7DFDCMIcuyU7YHO21Fy/jb88sG85babJ9neIqo3q1VvHhY+ZI1wXel37fhOqTiT/fC
         XyRQq3KQ/vHMq7XpDijjpi09UpM8IX+y+J4hKUdxQlU5E18JN2mS5cQik/dOnvT759mk
         mAp9nZ50TFsfwa9Hg+NuoKuKerjsoiuHbWpl1vtljloUiw2MfokIGBQegV4nzRAVZSST
         MN6SW5bCrXfHEVMpp4Bh3fLCeRkCsBlaq3tqzJzWKiJ3XEbShC9R/T7/2WZ5WY2CLhSC
         a/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895166; x=1769499966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrrMTtb60SP0xBTCvJL8nJfkI/A1zaXtpG+M96zSEDk=;
        b=f11AD/BaNlUA8PXgJpktBqvr6EEDHj2M/muG9fLmW2ENZLLkBkYt5LpLJQ/C3sB2oB
         cCsu0VuFLv6JZ8Kf/icT3a4gEiNJgTq/1GpAmS2/efQvHJojuVYV9jzimHyRuS6KTNc0
         UsjEefY+TmnEAlRTCTElruTqlCn0+UUJA463O0lr0GGMbLHNkhtmmsX0Lje/vHjNV/wP
         eRhM95Fs4clYxIujroCqz/BYLntXNeijIs6JJnmQXYhoK0EoGIUa7quAwtDOhBEmH+JY
         GgKHEKXJXtZeIr+lSoM3VBSdY9FjC1fLay7tozDdpXjlRWNUtsj3zjYYssbcSIlruLaM
         7lbw==
X-Gm-Message-State: AOJu0Yy4tc5JNSZnt6JBcKLJtREIqOMNhxvKXcZk7CFwBN6TXgc4pogO
	nEU018HJTAm0rtelmGFzV2T4auuAxv75u7Q6hty5H/A5m/gX8FGxlENID8Q8og==
X-Gm-Gg: AZuq6aIY74lGqYh9OAJAAAnZBrq2uEEEdW/HcS7mgL2Oj5Ix6gUpbUA6Rt9cJIG7KHL
	7k0PsVFMGB3HVpVWVMoGMzNXUVqq2g/9x59hbvanEfNs2Ow+ZjMAd9F05/bnMkFLbkizb027eYP
	NsdABEMzs8DokJWqMYKcjorXfPA41I4KtsMMx7cd6BgJ12lhmab48ZlBHAeqXA5HaLRLuyVwXZK
	D3i65Yb2ERlcMwD3QztNA9X+O1Owrpf6qdG5V+ok/4Ellv13ScyA2iOEDvgdCJYKNgji0CdSFYt
	lPiWktNFH4beS6QfDxs1W9EwLoGUlnttftbogJ6w2rHvrQhoSK9Xl7kB8ICLHEZAg8Qd0FobMHU
	NWGuZhaLufWFQ08huEq/AkQl82vKl9SRFGlyZSic6hn4MQp+6RMjUKL8LabaPvSof80j4iyspYZ
	qhEJ6ooRx32Q==
X-Received: by 2002:a17:902:da88:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a7692410e1mr10235925ad.19.1768894721262;
        Mon, 19 Jan 2026 23:38:41 -0800 (PST)
Received: from L-15597L.kpit.com ([36.255.86.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb998sm116018645ad.69.2026.01.19.23.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:38:40 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][kirkstone][PATCH 2/2] libpcre2: fix RunGrepTest Failure on Busybox systems
Date: Tue, 20 Jan 2026 13:07:58 +0530
Message-Id: <20260120073758.508608-2-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120073758.508608-1-moins@kpit.com>
References: <20260120073758.508608-1-moins@kpit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229649

The PCRE2 RunGrepTest script uses the Gnu Coreutils form:
head -1

Busybox does not support this shorthand option and reports:
head: invalid option --'1'

which cause the grep tests fail when running ptest on yocto.
Replace head -1 with head -n 1 . This makes RunGrepTest work
correctly.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../0001-test-Fix-head-1-Busybox.patch        | 38 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.40.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
new file mode 100644
index 0000000000..9f98f55380
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
@@ -0,0 +1,38 @@
+From 1b2c3d4e5f6a7b8c9d0 Mon Sep 17 00:00:00 2001
+From: Shaik Moin <moins@kpit.com>
+Date: Tue, 18 Nov 2025 10:30:00 +0530
+Subject: [PATCH] tests: Fix head options for BusyBox compatibility
+
+BusyBox does not accept the GNU coreutils shorthand forms:
+  head -1
+ 
+It requires:
+  head -n 1
+ 
+This causes RunGrepTest and the grepoutput test data to fail on
+Yocto-based systems that use BusyBox.
+ 
+Replace all occurrences of `head -1` â†’ `head -n 1`
+ 
+This aligns the scripts with POSIX syntax and fixes failing
+grep tests in RunGrepTest (including testtrygrep).
+ 
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Shaik Moin <moins@kpit.com>
+---
+ 
+diff --git a/RunGrepTest b/RunGrepTest
+index 1c7bbd2..ab4f310 100755
+--- a/RunGrepTest
++++ b/RunGrepTest
+@@ -728,7 +728,7 @@ echo "---------------------------- Test
+ echo "RC=$?" >>testtrygrep
+
+ echo "---------------------------- Test 132 -----------------------------" >>testtrygrep
+-(cd $srcdir; exec 3<testdata/grepinput; $valgrind $vjs $pcre2grep -m1 -A3 '^match' <&3; echo '---'; head -1 <&3; exec 3<&-) >>testtrygrep 2>&1
++(cd $srcdir; exec 3<testdata/grepinput; $valgrind $vjs $pcre2grep -m1 -A3 '^match' <&3; echo '---'; head -n 1 <&3; exec 3<&-) >>testtrygrep 2>&1
+ echo "RC=$?" >>testtrygrep
+
+ echo "---------------------------- Test 133 -----------------------------" >>testtrygrep
+-- 
+2.34.1
diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index 8aec420d4a..0d7786b81c 100644
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


