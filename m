Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4776.1792538585301204138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=hSM6O8xr;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso53582f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538583; x=1793143383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2KZviL7KAvme2gCNPRYYnnvEFRsCDDXKVB1JQ2yL90Y=;
        b=hSM6O8xrPkDgFQcO9yAjkVbSsPX/tq+hCHdyn4Bds1/rd61WVz/jqIe5BlcbFBxqXo
         0MG1Gq1355c1qgOjUeWBlvzEgv1opXV/6+5rhPNjse3YKTpm9uGiPz2h73XHBM6Rtjiv
         kUCXcVEojkizT4Y7v3zIpYRizGWrvrVWIeTsbo41dpcuGTV4wc4zq1Q46ngmV58AJpLj
         sZySgjzzXWcWtKrpo2Y2qzXyCvIDtarRAOczVWUWPX8a0Cb+BW6oIUFblVi3yLbrFmRN
         oDWXG+R1DltGam+gqZWhf1wkodEMwTojZBOwWIakfJQmlVJp5tTGqqcyceIRWxT2cZh0
         MbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538583; x=1793143383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2KZviL7KAvme2gCNPRYYnnvEFRsCDDXKVB1JQ2yL90Y=;
        b=AnAYygkcvT79oAW9NUZgLC30EUvdCmomu0SEhaSUtr2R63mODD4DdbdMgREIPRcNKJ
         /LEfgcexmbnIVwx/bAfmDtZitLhCaPnY5D/fDonoaC2jFPdGlkEzkfz4+ywfGaVCZ2fv
         3WdwIhyD3FLaC47L3ta3d2xYmYsxFlsSzNKBNp8g4d6RZLI14MzHXdyWoflqJjOizkRA
         uqOXdOF1et6B1goUNy1uqqYLmgQN72AgZNpuwCwRl0gQSs9Ux4duo6F/sxWvo+1GEfMh
         ycxKBDczuIAM6gAQp/le3AnP639jJfK3S9TnRE+y6R13cPGGMXa1C5vgAWnRLvb4L7y4
         Q3/Q==
X-Gm-Message-State: AFq9FYKijC7gXNaB/Z71TVf90VSXkEZR3Mg8bmMTzlJIHq+q7U6Cmg91
	ylz+x9/4fDcZHYsW258ZemQHZGZ1Y7cZodXD+yZqiBGRRv9KMlecC5zMA5HzKtrc3ucqnwpWLwl
	wmRGoIrI=
X-Gm-Gg: AYBFou3pf1HJIkVG4s7EwyL7emOb9cI0q0dmcUqWmbd0+0iY6mRpbjdAdmhnRX7wjrg
	60JCfU47e3w148M/EHJ4+HcOkpo2licd5iQLo2ElpvfscbzgZAnAd+TBLuDCGejr0SCP1Hav7Ct
	r3jRFpHLJYnT5BRWKF7FLKCG1kT7E53z5qStfzdXkyprxw7xq57N5C5HvkSBZPgngVnZbgfEqli
	gzY7/oFEsqkl1Bp9CVsSoPqg1koSs69yTdmHvUpf2nWdb0d9X+Ag1jw9qO02Fv78/heVMjfceSI
	HJv6ORVoIOzkXdRP5ql8RLoFnPJ9mYpFK7Z6z9WSjrHIyRba/yKFAOYy91BxIF7ppj4rPWtZis0
	pf1Hxd530calPjksk5rcMVqeR0OW+AZKUyoP1vY2VjfwLLctgftFQhyPtrm7tGBDi8hGlUjVE1k
	5nSa7rBtvdF76jK1fQyUKbl5XbraDm/6b9FI1eQl/utfDr9M4HmPmSNjBT6jDAensaQWKbh423C
	8u+fK4nzUXCYGXrXztsonPGeh+QFnV1e6e8vT+DxGgLrTNWxPrnRcq+846rqWpQ16C/iXBluw==
X-Received: by 2002:a05:6000:186f:b0:48d:f9dd:e3b9 with SMTP id ffacd0b85a97d-48e264a2d31mr445878f8f.17.1792538583405;
        Tue, 20 Oct 2026 16:23:03 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/25] lttng-tools: upgrade 2.14.1 -> 2.14.3
Date: Wed, 21 Oct 2026 01:22:31 +0200
Message-ID: <a9cc297af49008a2e3a189425cd90002405dd1de.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248340
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changes 2.14.2-2.14.3 (from ChangeLog):
- Fix: ust-consumerd/relayd crashes and overflow/path-traversal
  hardening in packet, filter, trigger, action, and session-path
  handling
- Fix: sessiond deadlock on notification overflow, default kernel
  probe list, agent event-listing sanitization
- Fix: common lockfile fd leak into consumerd via fork+exec
- tests: add notification/test_rotation to the regression test list

disable-tests.patch drops the flaky tools/notification/* tests from
SERIAL_TESTS (bug 14263); extend it to also drop the new
test_rotation entry added above, which conflicted with the patch.

Verified do_compile succeeds.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../lttng/lttng-tools/disable-tests.patch             | 11 ++++++-----
 .../{lttng-tools_2.14.1.bb => lttng-tools_2.14.3.bb}  |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.14.1.bb => lttng-tools_2.14.3.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
index d32cf875356..5717fb6b3d4 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
@@ -1,4 +1,4 @@
-From 05cf8ed6cc42a2f6ff53009d0ae2713fe63f1245 Mon Sep 17 00:00:00 2001
+From 755c3e21b7f736f2f19727482bab3100849f7f90 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 14 Dec 2021 12:34:04 +0000
 Subject: [PATCH] lttng-tools: Disable problem tests
@@ -14,14 +14,14 @@ https://bugzilla.yoctoproject.org/show_bug.cgi?id=14263
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
- tests/regression/Makefile.am | 12 ------------
- 1 file changed, 12 deletions(-)
+ tests/regression/Makefile.am | 13 -------------
+ 1 file changed, 13 deletions(-)
 
 diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index 7076488..e5be904 100644
+index b64a8cc..e92547e 100644
 --- a/tests/regression/Makefile.am
 +++ b/tests/regression/Makefile.am
-@@ -40,18 +40,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
+@@ -40,19 +40,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/regen-metadata/test_ust \
  	tools/regen-statedump/test_kernel \
  	tools/regen-statedump/test_ust \
@@ -37,6 +37,7 @@ index 7076488..e5be904 100644
 -	tools/notification/test_notification_notifier_discarded_count \
 -	tools/notification/test_notification_kernel_userspace_probe \
 -	tools/notification/test_notification_multi_app \
+-	tools/notification/test_rotation \
  	tools/rotation/test_ust \
  	tools/rotation/test_kernel \
  	tools/rotation/test_ust_kernel \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.3.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.14.3.bb
index 3df9ed1c00c..0b0e7aa4ea4 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.3.bb
@@ -52,7 +52,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://libc++.patch \
            "
 
-SRC_URI[sha256sum] = "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229ae6c32ba5c5b7c6d"
+SRC_URI[sha256sum] = "473ebcf26cae02860ee23e7cbf4ec875586017bd06f32613ba21b6586420e2ed"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd upstream-stable-release-point
 
